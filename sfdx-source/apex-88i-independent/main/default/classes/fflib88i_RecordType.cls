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
@SuppressWarnings('PMD.ClassNamingConventions')
public inherited sharing class fflib88i_RecordType
{
    private static Map<String, Schema.DescribeSObjectResult> mapDescribeSObjectResult
            = new Map<String, Schema.DescribeSObjectResult>();

    public static Schema.DescribeSObjectResult getDescribeSObjectResult(Schema.SObjectType token)
    {
        String tokenLowercase = String.valueOf(token).toLowerCase();
        if (!mapDescribeSObjectResult.containsKey(tokenLowercase))
        {
            Schema.DescribeSObjectResult describeSObjectResult = token.getDescribe();
            mapDescribeSObjectResult.put(tokenLowercase, describeSObjectResult);
        }
        return mapDescribeSObjectResult.get(tokenLowercase);
    }

    public static Schema.DescribeSObjectResult getDescribeSObjectResult(String sObjectName)
    {
        String sObjectNameLowercase = sObjectName.toLowerCase();
        if (!mapDescribeSObjectResult.containsKey(sObjectNameLowercase))
        {
            List<Schema.DescribeSObjectResult> listDescribeSObjectResult
                    = Schema.describeSObjects(new List<String>{sObjectName});
            Schema.DescribeSObjectResult newDescribeSObjectResult = listDescribeSObjectResult[0];
            mapDescribeSObjectResult.put(sObjectNameLowercase, newDescribeSObjectResult);
        }
        return mapDescribeSObjectResult.get(sObjectNameLowercase);
    }

    public static Id getId(Schema.SObjectType token, String recordTypeDeveloperName)
    {
        if (token == null)
        {
            return null;
        }
        return getDescribeSObjectResult(token).getRecordTypeInfosByDeveloperName().get(
                recordTypeDeveloperName)?.getRecordTypeId();
    }

    public static Id getIdByCorrectSObjectName(String sObjectName, String recordTypeDeveloperName)
    {
        if (sObjectName == null)
        {
            return null;
        }
        return getDescribeSObjectResult(sObjectName).getRecordTypeInfosByDeveloperName().get(
                recordTypeDeveloperName)?.getRecordTypeId();
    }
}