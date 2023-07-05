Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30331EB64DD
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 08:24:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbjGEIYL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 04:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbjGEIYJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 04:24:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170841731
        for <linux-tegra@vger.kernel.org>; Wed,  5 Jul 2023 01:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688545388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TdhQb+Syo7axqoDqvE+d+9JDiCWJ3NaRZrNyouSZxA4=;
        b=BQ53SPYW6e9ueCxnezioiP3wCksnsweCDsB/IbYD6gDEAvYCyaK6WUFGYFI/7GMp3UBwsI
        F9Q/kKWlmZnxoEZTfaO++Z9FHhjNuNDRhal76ehQmLwSrzenP3LItNGF9+HGHO3hEJFlTh
        frnnsv2xpsN8XDwpP9h5HDSsa0iB71k=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-NwS21rJWO4WfnraKNCQSyw-1; Wed, 05 Jul 2023 04:23:07 -0400
X-MC-Unique: NwS21rJWO4WfnraKNCQSyw-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2b6fbf1305fso11309591fa.2
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jul 2023 01:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688545385; x=1691137385;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TdhQb+Syo7axqoDqvE+d+9JDiCWJ3NaRZrNyouSZxA4=;
        b=GTlpCiAP/1XU8+VyN0IbFg/CYSkCEXcO61HsX8GKWBQTcns66LPextEjJcYVGJlQva
         Ru/bj9aE7CaCJNVR1xOVxlMG/1FA58+B4pzKWZo5MlMmBT8TJpUu344JlRJd/7+9H5x5
         3Do2/IS9grzwcnDHLLj+NJVSDCIGNvaDUcoel8bNxycVYM/dAcJevshgGUkPN9TqfR18
         m0x7UuuuJDBaLq6+ADNym7/O9EMe56YkVf2v4bqtlq2+r0Ldkw9j7crJAtlCkJznlGC/
         dPGhTjHyfuvGKyGlFkpEhkKCuTjO09caE7ezWWLYNVd5WyvN40fvCEaZx/nsx9C5n4k1
         MWIA==
X-Gm-Message-State: ABy/qLZ0ZxCgR52/KIL7TrEFT4K4u+/69yfMmmfIxtnUorGI8iCqBpLd
        /xXBTU4T7fjIsKmCuzi+S5C3dRtp5Hv2mfoA8zLTu53h9Ro3iB2vYtIclNB++1jll+5Wq+J0iNq
        tuwx98/GeCwRSNSbaZ27L3IU=
X-Received: by 2002:a2e:8095:0:b0:2b6:a344:29cf with SMTP id i21-20020a2e8095000000b002b6a34429cfmr10093147ljg.17.1688545385617;
        Wed, 05 Jul 2023 01:23:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGDvUCFfme/Nn/ZdctOdvEvefSFNX7STUaOhlHec73G4bbSvs9bTxRZM7iY07V1SqMwOI36OA==
X-Received: by 2002:a2e:8095:0:b0:2b6:a344:29cf with SMTP id i21-20020a2e8095000000b002b6a34429cfmr10093130ljg.17.1688545385203;
        Wed, 05 Jul 2023 01:23:05 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c458d00b003fa9a00d74csm1422474wmo.3.2023.07.05.01.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 01:23:04 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 01/10] fbdev: Add fb_ops init macros for framebuffers in
 DMA-able memory
In-Reply-To: <20230704160133.20261-2-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-2-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 10:23:03 +0200
Message-ID: <875y6ysr6g.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Add initializer macros for struct fb_ops for framebuffers in DMA-able
> memory areas. Also add a corresponding Kconfig token. As of now, this
> is equivalent to system framebuffers and mostly useful for labeling
> drivers correctly.
>
> A later patch may add a generic DMA-specific mmap operation. Linux
> offers a number of dma_mmap_*() helpers for different use cases.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Helge Deller <deller@gmx.de>
> ---
>  drivers/video/fbdev/Kconfig |  8 ++++++++
>  include/linux/fb.h          | 13 +++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index cecf15418632..f14229757311 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -168,6 +168,14 @@ config FB_DEFERRED_IO
>  	bool
>  	depends on FB
>  
> +config FB_DMA_HELPERS
> +	bool
> +	depends on FB
> +	select FB_SYS_COPYAREA
> +	select FB_SYS_FILLRECT
> +	select FB_SYS_FOPS
> +	select FB_SYS_IMAGEBLIT
> +
>  config FB_IO_HELPERS
>  	bool
>  	depends on FB
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 1d5c13f34b09..1191a78c5289 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -594,6 +594,19 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
>  	__FB_DEFAULT_SYS_OPS_DRAW, \
>  	__FB_DEFAULT_SYS_OPS_MMAP
>  
> +/*
> + * Helpers for framebuffers in DMA-able memory
> + */
> +

The comment for I/O memory helpers says:

/*
 * Initializes struct fb_ops for framebuffers in I/O memory.
 */

I think that would be good to have consistency between these two,
so something like:

/*
 * Initializes struct fb_ops for framebuffers in DMA-able memory.
 */

> +#define __FB_DEFAULT_DMA_OPS_RDWR \
> +	.fb_read	= fb_sys_read, \
> +	.fb_write	= fb_sys_write
> +
> +#define __FB_DEFAULT_DMA_OPS_DRAW \
> +	.fb_fillrect	= sys_fillrect, \
> +	.fb_copyarea	= sys_copyarea, \
> +	.fb_imageblit	= sys_imageblit
> +

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

