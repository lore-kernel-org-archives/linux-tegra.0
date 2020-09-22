Return-Path: <SRS0=69DC=C7=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2458BC4346E
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Sep 2020 02:33:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E48172145D
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Sep 2020 02:33:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729536AbgIVCdb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Sep 2020 22:33:31 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13816 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729379AbgIVCdb (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Sep 2020 22:33:31 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id A910716B416F9FC71983;
        Tue, 22 Sep 2020 10:33:26 +0800 (CST)
Received: from [10.174.179.91] (10.174.179.91) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 22 Sep 2020 10:33:21 +0800
Subject: Re: [PATCH -next] gpu: host1x: simplify the return expression of
 host1x_cdma_init()
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200921131032.91972-1-miaoqinglang@huawei.com>
 <4378d69a-2338-779f-ab4d-3c64fbf7dfd3@kapsi.fi>
From:   miaoqinglang <miaoqinglang@huawei.com>
Message-ID: <1d224422-a67d-8157-4212-646098f223c9@huawei.com>
Date:   Tue, 22 Sep 2020 10:33:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4378d69a-2338-779f-ab4d-3c64fbf7dfd3@kapsi.fi>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



在 2020/9/21 21:12, Mikko Perttunen 写道:
> On 9/21/20 4:10 PM, Qinglang Miao wrote:
>> Simplify the return expression.
>>
>> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
>> ---
>>   drivers/gpu/host1x/cdma.c | 8 +-------
>>   1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
>> index e8d3fda91..08a0f9e10 100644
>> --- a/drivers/gpu/host1x/cdma.c
>> +++ b/drivers/gpu/host1x/cdma.c
>> @@ -448,8 +448,6 @@ void host1x_cdma_update_sync_queue(struct 
>> host1x_cdma *cdma,
>>    */
>>   int host1x_cdma_init(struct host1x_cdma *cdma)
>>   {
>> -    int err;
>> -
>>       mutex_init(&cdma->lock);
>>       init_completion(&cdma->complete);
>> @@ -459,11 +457,7 @@ int host1x_cdma_init(struct host1x_cdma *cdma)
>>       cdma->running = false;
>>       cdma->torndown = false;
>> -    err = host1x_pushbuffer_init(&cdma->push_buffer);
>> -    if (err)
>> -        return err;
>> -
>> -    return 0;
>> +    return host1x_pushbuffer_init(&cdma->push_buffer);
> 
> IMHO, this makes it less readable since now it kind of looks like 
> host1x_pushbuffer_init is returning some meaningful value, instead of 
> the code just handling error values in a sequence.
> 
> Mikko
> 
Hi Mikko,

It sounds resonable, thanks for your reply.

>>   }
>>   /*
>>
> .
