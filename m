Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066BEC43217
	for <linux-tegra@archiver.kernel.org>; Fri, 17 Sep 2021 15:42:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E434561216
	for <linux-tegra@archiver.kernel.org>; Fri, 17 Sep 2021 15:42:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244291AbhIQPoS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 17 Sep 2021 11:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238786AbhIQPoP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Sep 2021 11:44:15 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A47C061766
        for <linux-tegra@vger.kernel.org>; Fri, 17 Sep 2021 08:42:52 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id ay33so18634559qkb.10
        for <linux-tegra@vger.kernel.org>; Fri, 17 Sep 2021 08:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m0dCFB/mfZ3NoW8jcV3Ey7Co+ujM9o+NXfiHm7bltGo=;
        b=F8nNi3y2k7UHCutwkJnFaKCmLrIPkAilYWnn8NJfGMKZdgWTNzSRB41BT8XEaF4EN9
         zOqDbAw5kNzn0+XX5xgzKH7Z+5F3OSvxQf+Da/YnNgbXHoCpcdAqvqZ89foRH4ceGuR9
         4MrUsTpwBBhQ716EZr0jkZaf/pHgWVEWLAEG9EPUIOG5kGq06LEEzsgiFXGPZF250+gq
         20HCNXynRp2jJEyHbBqtLHvXdrUHfmgV3H8J14hbv2sXxLeZxXf4JQyMM2a98i0fBNiZ
         zWdZ84jgIMcG6m/w+H3U8iTX8s6PosdiH+IDiKj3/nfb7JLb9ntMCfEaZDTkXALQ/oRu
         w5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m0dCFB/mfZ3NoW8jcV3Ey7Co+ujM9o+NXfiHm7bltGo=;
        b=Etk1ju29L6bUnfcBwODGKwbOw+QHqh5XezfAaQM9mMRC04Gacv7FVqhqJOlGG/Gxn6
         pq49snaZQx0CKqtxDdZfwbTqYBqSUXGfGjGwPB1E2+rwiHG7Tsdz4MdY4uC/CRCuGN0M
         F9Cm+HkiT6tpVkpROYq8Tl/kZ3OxIQu2OZ4pk4XDYnicPddnPqF30y823QgIMr5LRf07
         S+gYjHz71GGyHS752QgdlTLq8ppv3Z7O4vuiwaPctgyL4u/B9WKNJRjVEn4ZGS8JaknR
         tWRck6JsSOAsR8MkgZOHsH92QWdFSg02W43ip8sP6WEY48tyhEqCdgXAH7IDoTMb1P9a
         a6yQ==
X-Gm-Message-State: AOAM531kZ6mps0xz+Hwd1A/qrXtKpZcbVMb3IjPGtYCaP2jSamwBRYx/
        jdihsVCa6+QkLHzd/gWcG2xn9A==
X-Google-Smtp-Source: ABdhPJw/rGUlpnFx6n+2dmNWgHTDFnPjlTeuUV940sLT48vl5prfdmAmwCynqp4L1RpXVV+z5tspCQ==
X-Received: by 2002:a05:620a:c4d:: with SMTP id u13mr11076334qki.411.1631893371837;
        Fri, 17 Sep 2021 08:42:51 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id z6sm4242154qtq.78.2021.09.17.08.42.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Sep 2021 08:42:51 -0700 (PDT)
Date:   Fri, 17 Sep 2021 11:42:50 -0400
From:   Sean Paul <sean@poorly.run>
To:     Fernando Ramos <greenfoo@u92.eu>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        sean@poorly.run, linux-doc@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 11/15] drm/msm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <20210917154250.GL2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-12-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-12-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 16, 2021 at 11:15:48PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace driver calls to
> drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
> DRM_MODESET_LOCK_ALL_END()
> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 768012243b44..4cbc79eaee17 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1172,14 +1172,16 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  	struct drm_display_mode *mode;
>  	struct drm_framebuffer *fb;
>  	struct drm_plane_state *state;
> +	struct drm_modeset_acquire_ctx ctx;
>  	struct dpu_crtc_state *cstate;
>  
>  	int i, out_width;
> +	int ret;

Please put ret with i & out_width

>  
>  	dpu_crtc = s->private;
>  	crtc = &dpu_crtc->base;
>  
> -	drm_modeset_lock_all(crtc->dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(crtc->dev, ctx, 0, ret);
>  	cstate = to_dpu_crtc_state(crtc->state);
>  
>  	mode = &crtc->state->adjusted_mode;
> @@ -1263,7 +1265,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  		dpu_crtc->vblank_cb_time = ktime_set(0, 0);
>  	}
>  
> -	drm_modeset_unlock_all(crtc->dev);
> +	DRM_MODESET_LOCK_ALL_END(crtc->dev, ctx, ret);
>  
>  	return 0;

Return ret here

>  }
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
