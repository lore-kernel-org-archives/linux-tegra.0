Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8C7C48BD1
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 18:28:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F277961364
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 18:28:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbhFISan (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Jun 2021 14:30:43 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:34548 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbhFISan (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Jun 2021 14:30:43 -0400
Received: by mail-wm1-f53.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso3634603wmc.1
        for <linux-tegra@vger.kernel.org>; Wed, 09 Jun 2021 11:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nXtC0TTdpsHcuJUUWVG3Np34/AsLwocmzwBcXSxRj/Q=;
        b=HfJ/RZQysPk9QdXC8tT3qAef2KiC/W+sa6+C3chbhaVnx4s3fINdbcMIx+9/WYp9Ua
         rSGvTtXkki9nHMB1d7HNACqPqJeHqK2bfGV+19jQTDbP1WsfyIYbktcvzyzDvAU2yXFL
         ODRmwQ5LfHMJpdwV7NzdRP4uKcVDzxULIXu/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nXtC0TTdpsHcuJUUWVG3Np34/AsLwocmzwBcXSxRj/Q=;
        b=OfqrO4LM1TjKXQf4E5OOlpNPZJAxzthdn8iJYlolceyZUTpHnWsVPjWHaK3HGYT+jj
         uzgFApQbU68xynKVU6ZmRo16Acc5VK/R926MeV0SkuwtQdxdRkVHUI0UrmKw1JqgY2F8
         tD8HtI+nP4psfF3Ry4NjQWMqE0shS6ghDe+Rk7xe4htzzfgKJoRlIL2ZmQI6bv2rHRrd
         5QvBEt2YkcNQ35QGnW0YD+M7ir+Yh3OSEuPBWclYs92+szioP8ut1hRuX4yTX+9tDUwR
         eioQqxemyUI/6UCeO8CDILngExYjKHw/HTzPKcfFGwWhCg4xvdzj370q2aT4o+dCEGH+
         Rxug==
X-Gm-Message-State: AOAM532HjqhYphspyxqAHfuanXGKvOhTIlR4heRExL4TGIPZEJ7CqPRc
        TZVIyOW/N693AhMjFKFjdF18Ng==
X-Google-Smtp-Source: ABdhPJwf5wymTOTx4isyKDiYxTSKvgQu1tFsxGtgpCUiybvhgJ6aZdFSBsjZYd81Y0DX08g0jbU2eg==
X-Received: by 2002:a7b:c206:: with SMTP id x6mr10873557wmi.26.1623263267661;
        Wed, 09 Jun 2021 11:27:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s62sm7585504wms.13.2021.06.09.11.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 11:27:47 -0700 (PDT)
Date:   Wed, 9 Jun 2021 20:27:44 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        James Jones <jajones@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 02/10] drm/arm: malidp: Use fourcc_mod_is_vendor()
 helper
Message-ID: <YMEIIDl3ftlQyWCq@phenom.ffwll.local>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
 <20210326145139.467072-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326145139.467072-3-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Mar 26, 2021 at 03:51:31PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Rather than open-coding the vendor extraction operation, use the newly
> introduced helper macro.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

On the first two patches:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/arm/malidp_planes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
> index ddbba67f0283..cd218883cff8 100644
> --- a/drivers/gpu/drm/arm/malidp_planes.c
> +++ b/drivers/gpu/drm/arm/malidp_planes.c
> @@ -165,7 +165,7 @@ bool malidp_format_mod_supported(struct drm_device *drm,
>  		return !malidp_hw_format_is_afbc_only(format);
>  	}
>  
> -	if ((modifier >> 56) != DRM_FORMAT_MOD_VENDOR_ARM) {
> +	if (!fourcc_mod_is_vendor(modifier, ARM)) {
>  		DRM_ERROR("Unknown modifier (not Arm)\n");
>  		return false;
>  	}
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
