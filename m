Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B02EE4996
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Aug 2023 12:32:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbjHVMck (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Aug 2023 08:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235509AbjHVMci (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Aug 2023 08:32:38 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC3619A
        for <linux-tegra@vger.kernel.org>; Tue, 22 Aug 2023 05:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=NiIfwJ+orzV2xnqi90Ph1qRaFhDIyZsacQEQFP11MHM=; b=fNGeQwjvoeg3lVcA0jXOYZzgyo
        4ZaqxkFUZCFxDPfEgBOJpNcWoQOGl6b9Z/hwX5vnNI2ogcgWyeRhkZ4OaLk1j0YusUB1pn5gNjKNI
        iRioa3T2guTf8vJ552Lnku1Fjdb7RBRm/lsMMjyiiBXkyHiVmInT9UAiMAt/dWjSC9KUUGuTj/js6
        1K4idXwTzd0Wko4ZIGyiVzwhTipifUU2/LV4wrXkaSs+h65GiGzX4obrnOrt2ltBobwFThCeiQkYI
        B05Kt8pr3zoRxWEgpGAMizektmhhFUJwqJ7wPnk+9kjB2l51xrkcGBmqrKOPxL6UqdBHM+fxxHE8h
        bbDJkoZA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.96)
        (envelope-from <cyndis@kapsi.fi>)
        id 1qYQYG-00HAQ8-24;
        Tue, 22 Aug 2023 15:32:04 +0300
Message-ID: <37df88bd-a429-c325-c80a-17d7d17f689c@kapsi.fi>
Date:   Tue, 22 Aug 2023 15:32:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH -next 2/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify
 code
Content-Language: en-US
To:     Jinjie Ruan <ruanjinjie@huawei.com>, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
        thierry.reding@gmail.com, mperttunen@nvidia.com,
        jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
References: <20230822071503.178000-1-ruanjinjie@huawei.com>
 <20230822071503.178000-3-ruanjinjie@huawei.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20230822071503.178000-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 8/22/23 10:15, Jinjie Ruan wrote:
> Return PTR_ERR_OR_ZERO() instead of return 0 or PTR_ERR() to
> simplify code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   drivers/gpu/drm/tegra/drm.c | 5 +----
>   drivers/gpu/drm/tegra/gem.c | 5 +----
>   2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index ff36171c8fb7..4e29d76da1be 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -354,10 +354,7 @@ static int tegra_gem_create(struct drm_device *drm, void *data,
>   
>   	bo = tegra_bo_create_with_handle(file, drm, args->size, args->flags,
>   					 &args->handle);
> -	if (IS_ERR(bo))
> -		return PTR_ERR(bo);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(bo);
>   }
>   
>   static int tegra_gem_mmap(struct drm_device *drm, void *data,
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index a4023163493d..11ef0f8cb1e1 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -533,10 +533,7 @@ int tegra_bo_dumb_create(struct drm_file *file, struct drm_device *drm,
>   
>   	bo = tegra_bo_create_with_handle(file, drm, args->size, 0,
>   					 &args->handle);
> -	if (IS_ERR(bo))
> -		return PTR_ERR(bo);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(bo);
>   }
>   
>   static vm_fault_t tegra_bo_fault(struct vm_fault *vmf)

NAK. See 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20230822&id=b784c77075023e1a71bc06e6b4f711acb99e9c73

Mikko
