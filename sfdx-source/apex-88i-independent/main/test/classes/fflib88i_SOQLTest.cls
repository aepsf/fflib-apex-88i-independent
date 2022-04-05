/*
 * BSD 3-Clause License
 *
 * Copyright (c), Peter Lin
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
@IsTest(IsParallel=true)
public class fflib88i_SOQLTest
{
    @IsTest
    static void create()
    {
        // Parameters for calling the create() method
        String fieldsShared;
        String fieldsInMethodOnly;
        String sObjectNameString;
        String whereStringAndMore;
        String testString;

        /**
         * Test soql000A soql000B
         * when (both fieldsShared and fieldsInMethodOnly are null) OR (sObjectNameString == null)
         * whereStringAndMore == null
         */
        fieldsShared = null;
        fieldsInMethodOnly = null;
        sObjectNameString = 'Account';
        whereStringAndMore = null;
        String soql000A = fflib88i_SOQL.create(fieldsShared, fieldsInMethodOnly, sObjectNameString, whereStringAndMore);
        testString = null;
        System.assertEquals(testString, soql000A);

        fieldsShared = 'Id, Name';
        fieldsInMethodOnly = 'BillingAddress';
        sObjectNameString = null;
        whereStringAndMore = null;
        String soql000B = fflib88i_SOQL.create(fieldsShared, fieldsInMethodOnly, sObjectNameString, whereStringAndMore);
        testString = null;
        System.assertEquals(testString, soql000B);

        // Test soql010 when fieldsShared == null and fieldsInMethodOnly != null, whereStringAndMore == null
        fieldsShared = null;
        fieldsInMethodOnly = 'Id, Name';
        sObjectNameString = 'Account';
        whereStringAndMore = null;
        String soql010 = fflib88i_SOQL.create(fieldsShared, fieldsInMethodOnly, sObjectNameString, whereStringAndMore);
        testString = 'SELECT Id, Name FROM Account';
        System.assertEquals(testString, soql010);

        // Test soql100 when fieldsShared != null and fieldsInMethodOnly == null, whereStringAndMore == null
        fieldsShared = 'Id, Name, ShippingAddress';
        fieldsInMethodOnly = null;
        sObjectNameString = 'Account';
        whereStringAndMore = null;
        String soql100 = fflib88i_SOQL.create(fieldsShared, fieldsInMethodOnly, sObjectNameString, whereStringAndMore);
        testString = 'SELECT Id, Name, ShippingAddress FROM Account';
        System.assertEquals(testString, soql100);

        // Test soql110 when both fieldsShared and fieldsInMethodOnly are not null, whereStringAndMore == null
        fieldsShared = 'Id, Name';
        fieldsInMethodOnly = 'BillingAddress';
        sObjectNameString = 'Account';
        whereStringAndMore = null;
        String soql110 = fflib88i_SOQL.create(fieldsShared, fieldsInMethodOnly, sObjectNameString, whereStringAndMore);
        testString = 'SELECT Id, Name, BillingAddress FROM Account';
        System.assertEquals(testString, soql110);

        // Test soql111 when both fieldsShared and fieldsInMethodOnly are not null, whereStringAndMore != null
        fieldsShared = 'Id, Name';
        fieldsInMethodOnly = 'BillingAddress';
        sObjectNameString = 'Account';
        whereStringAndMore = 'WHERE Id IN :idSet';
        String soql111 = fflib88i_SOQL.create(fieldsShared, fieldsInMethodOnly, sObjectNameString, whereStringAndMore);
        testString = 'SELECT Id, Name, BillingAddress FROM Account WHERE Id IN :idSet';
        System.assertEquals(testString, soql111);
    }
}