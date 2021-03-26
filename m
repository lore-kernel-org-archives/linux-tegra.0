Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAB1C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 15:59:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B429A61A21
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 15:59:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbhCZP6d (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 11:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbhCZP6G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 11:58:06 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8A5C0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 08:58:05 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 75so8409471lfa.2
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 08:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O05ga9tOD6BgXKp3d3sL9xSf2kzD9ZPV4valK6xNiK4=;
        b=QZF0Wv7XgTmkALDwdF0tQ64k+woPWyRgrZs0xAPu9OtrwL7IdWgoUabYy4u0SCj6iR
         n0o4jE29x6dEnpFmM7Gp6tUwBnLTGu/FQ7Afy3XLTcq+qM2rq7UMb+vUi2EJIVRqvBo2
         4vqcQpF5Va8sevfb4wC5cC4ODUDBEfHDj1dsNPzWEEuHPp5pqEfpSFtyJ6zUM3YiFgd5
         sitA8kqKWZxeFs5bL/9ojzGmCaoyt/1O26/BkxSeFkelrg4r3udMdl06vhtXZ9tq4Ifq
         Z0zQ29wn08Sn4cBJz3OYDYfy5JDS3aA0HvItPCufX85KZ0QLPO8ojj9PsFN3Eu8U8Z10
         g8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O05ga9tOD6BgXKp3d3sL9xSf2kzD9ZPV4valK6xNiK4=;
        b=GbFl6Ew0+55arWWDe0DfgBj8IPeRjZGXFALqN3aIoZnTgigO8jRXOj2/A0LanVRv4S
         2Aej0J3HBfDBGjbNPaSSKtMthVcgGjJIFRgLYaHBnfDu41jdw52xBWWCEKO2VouD7Eux
         YGJf+lecqzyhSJ/GPNI8BIZNIUFgDyNtp0oIPWTaoBZPE5O/LhBrZ73Ty1mj1hnKt3dK
         XsdVgDRdZ2BxXde6qkjmjp3gd64AvQSMyWzte5jSrBOSsJbsAurodJgfJPC6kWHXAAM8
         UX9KLKC2UWh1PhKPpiBv2ftpc9GU9+qR2UFDqh+nfuF5K7Kgbu0puZrXi3MS72NHNk7T
         BLww==
X-Gm-Message-State: AOAM532PUHXglAzxtimJs0grBNeJMxrqjGDUIoGm1GjRNShRsTJKKWru
        3+4mgNZoZsQegAi9PgcLXaCAA6jtArg=
X-Google-Smtp-Source: ABdhPJz7JqMZwlnJeAH0GQmh/4SvMQauwkqqs7+RAtifTXlEn3jQ43Hax83jVlboRWR1lR/wFvD/fw==
X-Received: by 2002:ac2:5444:: with SMTP id d4mr8833356lfn.126.1616774283572;
        Fri, 26 Mar 2021 08:58:03 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:99a9:a10:76ff:fe69:21b6? ([2a00:1370:814d:99a9:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id a8sm1214958ljk.83.2021.03.26.08.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Mar 2021 08:58:03 -0700 (PDT)
Subject: Re: [PATCH v2 05/10] drm/tegra: dc: Implement hardware cursor on
 Tegra186 and later
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        James Jones <jajones@nvidia.com>,
        Simon Ser <contact@emersion.fr>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210326145139.467072-1-thierry.reding@gmail.com>
 <20210326145139.467072-6-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b8ba8f54-ad85-96d7-0997-4aed94bbb395@gmail.com>
Date:   Fri, 26 Mar 2021 18:58:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210326145139.467072-6-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.03.2021 17:51, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The hardware cursor on Tegra186 differs slightly from the implementation
> on older SoC generations. In particular the new implementation relies on
> software for clipping the cursor against the screen. Fortunately, atomic
> KMS already computes clipped coordinates for (cursor) planes, so this is
> trivial to implement.
> 
> The format supported by the hardware cursor is also slightly different.
> 
> v2: use more drm_rect helpers (Dmitry)
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/dc.c | 59 ++++++++++++++++++++++++++++++++------
>  drivers/gpu/drm/tegra/dc.h |  5 ++++
>  2 files changed, 56 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 0541d7b5c841..7758d64822ae 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -832,10 +832,14 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
>  	return &plane->base;
>  }
>  
> -static const u32 tegra_cursor_plane_formats[] = {
> +static const u32 tegra_legacy_cursor_plane_formats[] = {
>  	DRM_FORMAT_RGBA8888,
>  };
>  
> +static const u32 tegra_cursor_plane_formats[] = {
> +	DRM_FORMAT_ARGB8888,
> +};
> +
>  static int tegra_cursor_atomic_check(struct drm_plane *plane,
>  				     struct drm_atomic_state *state)
>  {
> @@ -875,12 +879,22 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
>  									   plane);
>  	struct tegra_plane_state *tegra_plane_state = to_tegra_plane_state(new_state);
>  	struct tegra_dc *dc = to_tegra_dc(new_state->crtc);
> -	u32 value = CURSOR_CLIP_DISPLAY;
> +	struct tegra_drm *tegra = plane->dev->dev_private;
> +	u64 dma_mask = *dc->dev->dma_mask;
> +	unsigned int x, y;
> +	u32 value = 0;
>  
>  	/* rien ne va plus */
>  	if (!new_state->crtc || !new_state->fb)
>  		return;
>  
> +	/*
> +	 * Legacy display supports hardware clipping of the cursor, but
> +	 * nvdisplay relies on software to clip the cursor to the screen.
> +	 */
> +	if (!dc->soc->has_nvdisplay)
> +		value |= CURSOR_CLIP_DISPLAY;
> +
>  	switch (new_state->crtc_w) {
>  	case 32:
>  		value |= CURSOR_SIZE_32x32;
> @@ -908,7 +922,7 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
>  	tegra_dc_writel(dc, value, DC_DISP_CURSOR_START_ADDR);
>  
>  #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -	value = (tegra_plane_state->iova[0] >> 32) & 0x3;
> +	value = (tegra_plane_state->iova[0] >> 32) & (dma_mask >> 32);
>  	tegra_dc_writel(dc, value, DC_DISP_CURSOR_START_ADDR_HI);
>  #endif
>  
> @@ -920,15 +934,39 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
>  	value = tegra_dc_readl(dc, DC_DISP_BLEND_CURSOR_CONTROL);
>  	value &= ~CURSOR_DST_BLEND_MASK;
>  	value &= ~CURSOR_SRC_BLEND_MASK;
> -	value |= CURSOR_MODE_NORMAL;
> +
> +	if (dc->soc->has_nvdisplay)
> +		value &= ~CURSOR_COMPOSITION_MODE_XOR;
> +	else
> +		value |= CURSOR_MODE_NORMAL;
> +
>  	value |= CURSOR_DST_BLEND_NEG_K1_TIMES_SRC;
>  	value |= CURSOR_SRC_BLEND_K1_TIMES_SRC;
>  	value |= CURSOR_ALPHA;
>  	tegra_dc_writel(dc, value, DC_DISP_BLEND_CURSOR_CONTROL);
>  
> +	/* nvdisplay relies on software for clipping */
> +	if (dc->soc->has_nvdisplay) {
> +		struct drm_rect src;
> +
> +		x = new_state->dst.x1;
> +		y = new_state->dst.y1;
> +
> +		drm_rect_fp_to_int(&src, &new_state->src);
> +
> +		value = (src.y1 & tegra->vmask) << 16 | (src.x1 & tegra->hmask);
> +		tegra_dc_writel(dc, value, DC_DISP_PCALC_HEAD_SET_CROPPED_POINT_IN_CURSOR);
> +
> +		value = (drm_rect_height(&src) & tegra->vmask) << 16 |
> +			(drm_rect_width(&src) & tegra->hmask);
> +		tegra_dc_writel(dc, value, DC_DISP_PCALC_HEAD_SET_CROPPED_SIZE_IN_CURSOR);
> +	} else {
> +		x = new_state->crtc_x;
> +		y = new_state->crtc_y;
> +	}
> +
>  	/* position the cursor */
> -	value = (new_state->crtc_y & 0x3fff) << 16 |
> -		(new_state->crtc_x & 0x3fff);
> +	value = ((y & tegra->vmask) << 16) | (x & tegra->hmask);
>  	tegra_dc_writel(dc, value, DC_DISP_CURSOR_POSITION);
>  }
>  
> @@ -982,8 +1020,13 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
>  	plane->index = 6;
>  	plane->dc = dc;
>  
> -	num_formats = ARRAY_SIZE(tegra_cursor_plane_formats);
> -	formats = tegra_cursor_plane_formats;
> +	if (!dc->soc->has_nvdisplay) {
> +		num_formats = ARRAY_SIZE(tegra_legacy_cursor_plane_formats);
> +		formats = tegra_legacy_cursor_plane_formats;
> +	} else {
> +		num_formats = ARRAY_SIZE(tegra_cursor_plane_formats);
> +		formats = tegra_cursor_plane_formats;
> +	}

Will be nice to have all tegra_legacy_ renamed to the corresponding h/w
versions, like tegra124_; and not to use the inverted checks, like
!dc->soc->has_nvdisplay. I think this will ease following of the code.
But this should be done separately.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
