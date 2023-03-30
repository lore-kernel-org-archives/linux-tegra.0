Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BDAC761A6
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Mar 2023 12:58:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjC3M6E (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 30 Mar 2023 08:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbjC3M6D (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Mar 2023 08:58:03 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D13AB7EC3
        for <linux-tegra@vger.kernel.org>; Thu, 30 Mar 2023 05:58:02 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.43:51490.1253082464
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
        by 189.cn (HERMES) with SMTP id 1A5BB1002B0;
        Thu, 30 Mar 2023 20:52:05 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-7b48884fd-tj646 with ESMTP id 2532a3fdd6f049228020437bbe1ad0c7 for tzimmermann@suse.de;
        Thu, 30 Mar 2023 20:52:07 CST
X-Transaction-ID: 2532a3fdd6f049228020437bbe1ad0c7
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <c8d305b9-0962-f40e-0191-0bdd786f75cb@189.cn>
Date:   Thu, 30 Mar 2023 20:52:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [2/7] drm/tegra: Include <linux/i2c.h>
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, javierm@redhat.com, airlied@gmail.com,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230330083607.12834-3-tzimmermann@suse.de>
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230330083607.12834-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn 
<mailto:suijingfeng@loongson.cn>>

On 2023/3/30 16:36, Thomas Zimmermann wrote:
> Include <linux/i2c.h> to get the contained declarations. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/tegra/output.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index d31c87f48da0..dc2dcb5ca1c8 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -4,6 +4,7 @@
>    * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
>    */
>   
> +#include <linux/i2c.h>
>   #include <linux/of.h>
>   
>   #include <drm/drm_atomic_helper.h>
