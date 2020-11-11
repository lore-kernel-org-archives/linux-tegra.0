Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E151EC388F7
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Nov 2020 01:11:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89CC621D91
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Nov 2020 01:11:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732313AbgKKBLa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Nov 2020 20:11:30 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7202 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732023AbgKKBL3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 20:11:29 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CW6BC5Y9kzkhn8;
        Wed, 11 Nov 2020 09:11:15 +0800 (CST)
Received: from [10.174.179.62] (10.174.179.62) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Wed, 11 Nov 2020 09:11:19 +0800
Subject: Re: [PATCH V3] memory: tegra: add missing put_device() call in error
 path of tegra_emc_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mperttunen@nvidia.com>, <tomeu.vizoso@collabora.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <yi.zhang@huawei.com>, <zhangxiaoxu5@huawei.com>
References: <20201109164154.GA211123@kozik-lap>
 <20201110013311.2499003-1-yukuai3@huawei.com>
 <20201110152107.GA6203@kozik-lap>
From:   "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <ff4f0cef-bf0f-a1d2-18f1-30bf1c272967@huawei.com>
Date:   Wed, 11 Nov 2020 09:11:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201110152107.GA6203@kozik-lap>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020/11/10 23:21, Krzysztof Kozlowski wrote:
> On Tue, Nov 10, 2020 at 09:33:11AM +0800, Yu Kuai wrote:
>> The reference to device obtained with of_find_device_by_node() should
>> be dropped. Thus add jump target to fix the exception handling for this
>> function implementation.
>>
>> Fixes: 73a7f0a90641("memory: tegra: Add EMC (external memory controller) driver")
>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
>> ---
>>   drivers/memory/tegra/tegra124-emc.c | 21 +++++++++++++++------
>>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> I think you missed my previous comment about the issue being fixed
> already.  Are you sure you rebased this on top of latest next?
> 

Hi,

It's true the issue was fixed.

Thanks,
Yu Kuai
> Best regards,
> Krzysztof
> .
> 
