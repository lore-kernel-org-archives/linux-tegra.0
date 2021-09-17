Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215D4C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 17 Sep 2021 15:38:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09E7961216
	for <linux-tegra@archiver.kernel.org>; Fri, 17 Sep 2021 15:38:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243154AbhIQPjt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 17 Sep 2021 11:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243008AbhIQPjs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Sep 2021 11:39:48 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998E6C061768
        for <linux-tegra@vger.kernel.org>; Fri, 17 Sep 2021 08:38:26 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id bk29so18648811qkb.8
        for <linux-tegra@vger.kernel.org>; Fri, 17 Sep 2021 08:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eYZWVg2Fo/lgTFAWwDOCdDsCtgn1QSeKcFBATt6HycE=;
        b=RZLdBWyS1zzwyQ8AWr+TO8IbeXMrv4GkD9yrNwWLkEQyOyCXnDQ5fSKQPUD/s0MhKg
         xPGzOeolgoxijwXPYafTXoIFsWJ9ZH5uTwiUOZtfmRRxJKeuYfHYRs1uljQBg7frLMPl
         hB2KoXeC7zy3aDwmTGMjYb7uwpHrgGCEhCUQ/7gSX9y0P86eoYQ0TI2zxNcUCG+42qfH
         CtKDkpmjAilFtakfPBxyf9AXRN+ZAnLX1wMYZX67q6M6bZu0FdgAYrAwrrnr63xoZJHl
         LYjs5GJ8k/UC4yxHxh5Zup/joyt2tOBuMeI9RbWPPU2MQCpcRDe0jZNAiziMVYTANnTP
         cA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eYZWVg2Fo/lgTFAWwDOCdDsCtgn1QSeKcFBATt6HycE=;
        b=xcL0Ia3fZNYKJJWBPVw/eXFo4+q6OsfzYVJ2dsTKWLcJBfu6+qKj+Mo5Z7yEic+ctv
         gR+MJeub7/8InoJlUsXkCA2ftZ03fkgZn+BpOZTRbItb3wd9ot8YXd48IHtTejxK0piK
         YVs94xW52ZrcdX+PNYMOHuiHtf1D46XHkKme0wZR5RivcQJOks5JjKYeB3g6JqA4g3zG
         s6rFxjiqk8dxZaLnsU1FZD45kx8R8MebDVUYJKb69rMMSL54UUrU27LgT2FKPnOTgJWT
         aJ68jy6b0TNJYfnoAdlzkhrqSbfh5G9KY3z4RApb7goWeDVN2RTSeg2x60AfJSm2pNT3
         +QXQ==
X-Gm-Message-State: AOAM530lINkuBG6IV6eGR5qfg0PFfIDSC9v6nGkUXUA6MXqd6isyIJ3g
        oyKj+4QSqzveiobWcrPJz8XsTg==
X-Google-Smtp-Source: ABdhPJy+sgrVHk4mPzMJ5HeDnAsFrNLkiNzTwH7QjEt5wPfTDeXlC4CDkLSMrSghu4zxd6CNGrA38A==
X-Received: by 2002:a05:620a:1397:: with SMTP id k23mr11014086qki.380.1631893105758;
        Fri, 17 Sep 2021 08:38:25 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id t194sm5357503qka.72.2021.09.17.08.38.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Sep 2021 08:38:25 -0700 (PDT)
Date:   Fri, 17 Sep 2021 11:38:24 -0400
From:   Sean Paul <sean@poorly.run>
To:     Fernando Ramos <greenfoo@u92.eu>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        sean@poorly.run, linux-doc@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 07/15] drm/shmobile: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <20210917153824.GG2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-8-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-8-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 16, 2021 at 11:15:44PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace driver calls to
> drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
> DRM_MODESET_LOCK_ALL_END()
> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>

Reviewed-by: Sean Paul <sean@poorly.run>

> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index 7db01904d18d..8ee215ab614e 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -156,10 +156,12 @@ static int shmob_drm_pm_suspend(struct device *dev)
>  static int shmob_drm_pm_resume(struct device *dev)
>  {
>  	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
>  
> -	drm_modeset_lock_all(sdev->ddev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(sdev->ddev, ctx, 0, ret);
>  	shmob_drm_crtc_resume(&sdev->crtc);
> -	drm_modeset_unlock_all(sdev->ddev);
> +	DRM_MODESET_LOCK_ALL_END(sdev->ddev, ctx, ret);
>  
>  	drm_kms_helper_poll_enable(sdev->ddev);
>  	return 0;
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
