Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16137C76196
	for <linux-tegra@archiver.kernel.org>; Mon,  3 Apr 2023 13:46:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbjDCNqJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 3 Apr 2023 09:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232027AbjDCNqI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Apr 2023 09:46:08 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 307B31FCB
        for <linux-tegra@vger.kernel.org>; Mon,  3 Apr 2023 06:46:06 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.43:55990.294498728
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
        by 189.cn (HERMES) with SMTP id 541D910021F;
        Mon,  3 Apr 2023 21:46:02 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-7b48884fd-tj646 with ESMTP id a19d329c6bca43c0b4603e9a39071ed7 for tzimmermann@suse.de;
        Mon, 03 Apr 2023 21:46:04 CST
X-Transaction-ID: a19d329c6bca43c0b4603e9a39071ed7
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <1205553a-381a-bab0-4265-eca0bfcd8b9d@189.cn>
Date:   Mon, 3 Apr 2023 21:46:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [1/7] drm/tegra: Include <linux/of.h>
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, javierm@redhat.com, airlied@gmail.com,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230330083607.12834-2-tzimmermann@suse.de>
 <14d8245f-d3ab-64a1-7cc0-52ec77dcd13f@189.cn>
 <ffb0005d-d871-1317-8b16-d6fe3771a35e@suse.de>
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <ffb0005d-d871-1317-8b16-d6fe3771a35e@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On 2023/4/3 18:42, Thomas Zimmermann wrote:
>
>
> Am 30.03.23 um 14:51 schrieb Sui Jingfeng:
>>
>> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn 
>> <mailto:suijingfeng@loongson.cn>>
>
> Thanks a lot.
>

I send my mail with Thunderbird mail client, don't know this does this 
look like this.

Sorry about that. It should be:


Reviewed-by:  Sui Jingfeng <suijingfeng@loongson.cn>


Please correct it manually, others patches also look good to me.

Yet, it beyond my ability to review, I still digging  your patch and 
learning from it. :)

>>
>>
>> On 2023/3/30 16:36, Thomas Zimmermann wrote:
>>> Include <linux/of.h> to get the contained declarations. No functional
>>> changes.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/tegra/output.c | 2 ++
>>>   drivers/gpu/drm/tegra/rgb.c    | 1 +
>>>   2 files changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/tegra/output.c 
>>> b/drivers/gpu/drm/tegra/output.c
>>> index a8925dcd7edd..d31c87f48da0 100644
>>> --- a/drivers/gpu/drm/tegra/output.c
>>> +++ b/drivers/gpu/drm/tegra/output.c
>>> @@ -4,6 +4,8 @@
>>>    * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
>>>    */
>>> +#include <linux/of.h>
>>> +
>>>   #include <drm/drm_atomic_helper.h>
>>>   #include <drm/drm_of.h>
>>>   #include <drm/drm_panel.h>
>>> diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
>>> index ff8fce36d2aa..3f060282cd8d 100644
>>> --- a/drivers/gpu/drm/tegra/rgb.c
>>> +++ b/drivers/gpu/drm/tegra/rgb.c
>>> @@ -5,6 +5,7 @@
>>>    */
>>>   #include <linux/clk.h>
>>> +#include <linux/of.h>
>>>   #include <drm/drm_atomic_helper.h>
>>>   #include <drm/drm_bridge_connector.h>
>
