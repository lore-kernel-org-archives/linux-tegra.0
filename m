Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C64C4321E
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Nov 2022 02:39:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbiKZCj0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Nov 2022 21:39:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbiKZCjZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Nov 2022 21:39:25 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC165B87D
        for <linux-tegra@vger.kernel.org>; Fri, 25 Nov 2022 18:39:23 -0800 (PST)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NJwnR2h5JzqSSX;
        Sat, 26 Nov 2022 10:35:23 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 26 Nov 2022 10:39:21 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 26 Nov 2022 10:39:21 +0800
Subject: Re: [PATCH resend] gpu: host1x: fix error return code in
 host1x_memory_context_list_init()
To:     Mikko Perttunen <cyndis@kapsi.fi>, <linux-tegra@vger.kernel.org>,
        <thierry.reding@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <mperttunen@nvidia.com>
References: <20221124080559.3592650-1-yangyingliang@huawei.com>
 <6cf63d07-9a83-0397-9148-5775d5a4417e@kapsi.fi>
CC:     <yangyingliang@huawei.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <c48e5b9f-769a-e405-8d0d-d565f2340057@huawei.com>
Date:   Sat, 26 Nov 2022 10:39:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6cf63d07-9a83-0397-9148-5775d5a4417e@kapsi.fi>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 2022/11/26 0:00, Mikko Perttunen wrote:
> On 11/24/22 10:05, Yang Yingliang wrote:
>> If context device has no IOMMU, the 'cdl->devs' is freed in error path,
>> but host1x_memory_context_list_init() doesn't return an error code, so
>> the module can be loaded successfully, when it's unloading, the
>> host1x_memory_context_list_free() is called in host1x_remove(), it will
>> cause double free. Return an error code to fix this.
>>
>> Fixes: 8aa5bcb61612 ("gpu: host1x: Add context device management code")
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>> The previous patch link:
>> https://lore.kernel.org/lkml/20220714031123.2154506-1-yangyingliang@huawei.com/ 
>>
>> ---
>>   drivers/gpu/host1x/context.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
>> index b08cf11f9a66..5cf9b98bedd0 100644
>> --- a/drivers/gpu/host1x/context.c
>> +++ b/drivers/gpu/host1x/context.c
>> @@ -74,6 +74,7 @@ int host1x_memory_context_list_init(struct host1x 
>> *host1x)
>>           if (!fwspec || !device_iommu_mapped(&ctx->dev)) {
>>               dev_err(host1x->dev, "Context device %d has no 
>> IOMMU!\n", i);
>>               device_del(&ctx->dev);
>> +            err = -EOPNOTSUPP;
>>               goto del_devices;
>>           }
>
> One side effect of this patch would be that if IOMMU is disabled on a 
> system with context devices defined, Host1x won't work at all 
> (currently probe continues and it works though without context 
> isolation).
>
> I'm not sure if that's something anyone is likely to run into, but it 
> might be better to get rid of one of the frees instead.
>
> If you can update with that that'd be great, or I can put it onto the 
> TODO list.
I can send a v2 later.

Thanks,
Yang
>
> Thanks,
> Mikko
> .
