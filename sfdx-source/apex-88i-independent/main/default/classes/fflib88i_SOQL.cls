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
@SuppressWarnings('PMD.ClassNamingConventions')
public inherited sharing class fflib88i_SOQL
{
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public static String create(
            String fieldsShared,
            String fieldsInMethodOnly,
            String sObjectNameString,
            String whereStringAndMore
    )
    {
        // isBlankFieldsShared
        Boolean isBlankFieldsShared = String.isBlank(fieldsShared);
        if (isBlankFieldsShared)
        {
            fieldsShared = '';
        }

        // isBlankFieldsInMethodOnly
        Boolean isBlankFieldsInMethodOnly = String.isBlank(fieldsInMethodOnly);
        if (isBlankFieldsInMethodOnly)
        {
            fieldsInMethodOnly = '';
        }

        // isBlankSObjectNameString
        Boolean isBlankSObjectNameString = String.isBlank(sObjectNameString);

        // isBlankWhereStringAndMore
        Boolean isBlankWhereStringAndMore = String.isBlank(whereStringAndMore);
        whereStringAndMore = isBlankWhereStringAndMore ? '' : ' ' + whereStringAndMore;

        // stringBetweenTwoFieldsVariable
        String stringBetweenTwoFieldsVariable = (!isBlankFieldsShared && !isBlankFieldsInMethodOnly) ? ', ' : '';

        // return null when (both fieldsShared and fieldsInMethodOnly are null) OR (sObjectNameString == null)
        if ((isBlankFieldsShared && isBlankFieldsInMethodOnly) || isBlankSObjectNameString)
        {
            return null;
        }

        return 'SELECT '
                + fieldsShared + stringBetweenTwoFieldsVariable + fieldsInMethodOnly
                + ' FROM ' + sObjectNameString
                + whereStringAndMore;
    }
}