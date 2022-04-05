/**
BSD 3-Clause License

Copyright (c), Peter Lin
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

@IsTest(IsParallel=true)
public class fflib88i_RecordTypeTest
{
    @IsTest
    static void getId()
    {
        Id idToken = fflib88i_RecordType.getId(Account.SObjectType, 'MainAccount');
        Id idToken2nd = fflib88i_RecordType.getId(Account.SObjectType, 'MainAccount');
        Id idTokenNull = fflib88i_RecordType.getId(null, 'MainAccount');
        Id idTokenInvalid = fflib88i_RecordType.getId(Account.SObjectType, 'InvalidInvalid');
        List<RecordType> listRecordTypes = [
                SELECT Id, DeveloperName
                FROM RecordType
                WHERE SobjectType = 'Account'
                AND DeveloperName = 'MainAccount'
        ];

        if (listRecordTypes.size() > 0){
            System.assertEquals(1, listRecordTypes.size());
            System.assertEquals(idToken, listRecordTypes[0].Id);
            System.assertEquals(idToken2nd, listRecordTypes[0].Id);
        }
        System.assertEquals(null, idTokenNull);
        System.assertEquals(null, idTokenInvalid);
    }

    @IsTest
    static void getIdByCorrectSObjectName()
    {
        Id idString = fflib88i_RecordType.getIdByCorrectSObjectName('Account', 'MainAccount');
        Id idString2nd = fflib88i_RecordType.getIdByCorrectSObjectName('Account', 'MainAccount');
        Id idStringNull = fflib88i_RecordType.getIdByCorrectSObjectName(null, 'MainAccount');
        Id idStringInvalid = fflib88i_RecordType.getIdByCorrectSObjectName('Account', 'InvalidInvalid');
        List<RecordType> listRecordTypes = [
                SELECT Id, DeveloperName
                FROM RecordType
                WHERE SobjectType = 'Account'
                AND DeveloperName = 'MainAccount'
        ];

        if (listRecordTypes.size() > 0){
            System.assertEquals(1, listRecordTypes.size());
            System.assertEquals(idString, listRecordTypes[0].Id);
            System.assertEquals(idString2nd, listRecordTypes[0].Id);
        }
        System.assertEquals(null, idStringNull);
        System.assertEquals(null, idStringInvalid);
    }
}