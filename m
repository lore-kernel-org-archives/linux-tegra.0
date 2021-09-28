Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E777EC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 28 Sep 2021 00:59:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C50E161052
	for <linux-tegra@archiver.kernel.org>; Tue, 28 Sep 2021 00:59:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238378AbhI1BBM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 27 Sep 2021 21:01:12 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:26911 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238283AbhI1BBM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Sep 2021 21:01:12 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HJLdc1gcRzbmr9;
        Tue, 28 Sep 2021 08:55:16 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 08:59:03 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpeml500017.china.huawei.com (7.185.36.243) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 08:59:03 +0800
Subject: Re: [PATCH -next] memory: tegra186-emc: Fix error return code in
 tegra186_emc_probe()
To:     Mikko Perttunen <cyndis@kapsi.fi>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <mperttunen@nvidia.com>
References: <20210927075107.2882569-1-yangyingliang@huawei.com>
 <09e28d31-881f-acd0-33d0-565bdc9475ae@kapsi.fi>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <19c2733a-7393-8a65-e188-65c4d750eaa7@huawei.com>
Date:   Tue, 28 Sep 2021 08:59:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <09e28d31-881f-acd0-33d0-565bdc9475ae@kapsi.fi>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On 2021/9/27 16:52, Mikko Perttunen wrote:
> On 9/27/21 10:51 AM, Yang Yingliang wrote:
>> Return the error code when command fails.
>>
>> Fixes: 13324edbe926 ("memory: tegra186-emc: Handle errors in BPMP 
>> response")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/memory/tegra/tegra186-emc.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/memory/tegra/tegra186-emc.c 
>> b/drivers/memory/tegra/tegra186-emc.c
>> index abc0c2eeaab7..16351840b187 100644
>> --- a/drivers/memory/tegra/tegra186-emc.c
>> +++ b/drivers/memory/tegra/tegra186-emc.c
>> @@ -198,6 +198,7 @@ static int tegra186_emc_probe(struct 
>> platform_device *pdev)
>>           goto put_bpmp;
>>       }
>>       if (msg.rx.ret < 0) {
>> +        err = msg.rx.ret;
>>           dev_err(&pdev->dev, "EMC DVFS MRQ failed: %d (BPMP error 
>> code)\n", msg.rx.ret);
>>           goto put_bpmp;
>>       }
>>
>
> Good catch, but we shouldn't return msg.rx.ret since it is a BPMP 
> error code that doesn't necessarily map directly to a Linux error 
> code. So we should set err to something like -EINVAL instead. Please 
> update, or if you'd prefer, I can fix it.
I can send a v2 later.
>
> Mikko
> .
