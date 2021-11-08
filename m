Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D2AC433EF
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Nov 2021 15:17:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73B676125F
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Nov 2021 15:17:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237811AbhKHPUX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 Nov 2021 10:20:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhKHPUW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 Nov 2021 10:20:22 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F87FC061714
        for <linux-tegra@vger.kernel.org>; Mon,  8 Nov 2021 07:17:37 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id r9-20020a7bc089000000b00332f4abf43fso87997wmh.0
        for <linux-tegra@vger.kernel.org>; Mon, 08 Nov 2021 07:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=hBEGhoX5YuNLFtwj0iZldxCPL/IU1JHW309UHcbi6N0=;
        b=L8/zB7BSBqyEz55VvZb2onr/HFN94h4kOWeL7YKHsOsT6aNM9jUhR/4oD9HwZJ4vNL
         CrsZGGjPrY/EtdG2BuMc6FD6fiT05/iN3LeAelAyxYKbBQigeQTjqjw9wGhX+50L0qz1
         MpjojiscjFDkUXddHTcuRAa2J1CAvkLAJWlMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=hBEGhoX5YuNLFtwj0iZldxCPL/IU1JHW309UHcbi6N0=;
        b=rcbwpo2mIU1Te0RRTb6Jk1b+MdN6Z82P/bEupEYEDCPiTm7/ctvNxrHRnp8AG3HTY2
         LnL6euRSEZhVBnRfl/QqFjfK3czIiv5f0jwZWHXftDtXDBMO5bBR77y4oO9pbQpDYW9y
         UbQvmOzDgvygkLVG3NfuQzSv0cWx/sokU/7CVA0etWY15gRzPqoppU8T2Cl3RNryKEj/
         IpIMvaOLINjfRqdqOLH6nkb7s1Sbt2ABpDXa2FVJG9TC7DK6zstnOq1qxAQ/aMfVmpX4
         TkjZK5/h8zV1WJJxA4HMBejQ72yIBZ5Ht/qDpXCFOO2xdRi7Y7gyWZRKpzWGWxrbrUIZ
         4y2w==
X-Gm-Message-State: AOAM533yooSCM61PKmggQg3FNYNDTpr/sklHka9OkVsUg5s68DopuDfB
        Irlp0CDydoYn8Bz9kjxsXfAVVQ==
X-Google-Smtp-Source: ABdhPJyp7OwRHBxwCBRfEWA+tElkasv2jnP+G3zoYuHxViLc/uz2nRtyKPxBmH9BvrPQOAu7OmBUOw==
X-Received: by 2002:a1c:1fcf:: with SMTP id f198mr93457wmf.66.1636384656073;
        Mon, 08 Nov 2021 07:17:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l8sm22202895wmc.40.2021.11.08.07.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 07:17:35 -0800 (PST)
Date:   Mon, 8 Nov 2021 16:17:33 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm/tegra: Use drm_dp_aux_register_ddc/chardev()
 helpers
Message-ID: <YYk/jfcceun/Qleq@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211107230821.13511-1-digetx@gmail.com>
 <20211107230821.13511-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107230821.13511-2-digetx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Nov 08, 2021 at 02:08:21AM +0300, Dmitry Osipenko wrote:
> Use drm_dp_aux_register_ddc/chardev() helpers that allow to register I2C
> adapter separately from the character device. This fixes broken display
> panel driver of Acer Chromebook CB5-311 that fails to probe starting with
> v5.13 kernel when DP AUX registration order was changed. Tegra SOR driver
> is never probed now using the new registration order because tegra-output
> always fails with -EPROBE_DEFER due to missing display panel that requires
> DP AUX DDC to be registered first. The offending commit made DDC to be
> registered after SOR's output, which can't ever happen. Use new helpers
> to restore the registration order and revive display panel.

This feels a bit backward, I think the clean solution would be to untangle
the SOR loading from the panel driver loading, and then only block
registering the overall drm_device on both drivers having loaded.

This here at least feels like a game of whack-a-mole, if like every driver
needs its own careful staging of everything.
-Daniel

> 
> Cc: <stable@vger.kernel.org> # 5.13+
> Fixes: 39c17ae60ea9 ("drm/tegra: Don't register DP AUX channels before connectors")
> Reported-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
> Tested-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 1f96e416fa08..e0d675c7c2e5 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -532,7 +532,9 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
>  	dpaux->aux.transfer = tegra_dpaux_transfer;
>  	dpaux->aux.dev = &pdev->dev;
>  
> -	drm_dp_aux_init(&dpaux->aux);
> +	err = drm_dp_aux_register_ddc(&dpaux->aux);
> +	if (err < 0)
> +		return err;
>  
>  	/*
>  	 * Assume that by default the DPAUX/I2C pads will be used for HDMI,
> @@ -585,6 +587,8 @@ static int tegra_dpaux_remove(struct platform_device *pdev)
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  
> +	drm_dp_aux_unregister_ddc(&dpaux->aux);
> +
>  	mutex_lock(&dpaux_lock);
>  	list_del(&dpaux->list);
>  	mutex_unlock(&dpaux_lock);
> @@ -718,7 +722,7 @@ int drm_dp_aux_attach(struct drm_dp_aux *aux, struct tegra_output *output)
>  	int err;
>  
>  	aux->drm_dev = output->connector.dev;
> -	err = drm_dp_aux_register(aux);
> +	err = drm_dp_aux_register_chardev(aux);
>  	if (err < 0)
>  		return err;
>  
> @@ -759,7 +763,7 @@ int drm_dp_aux_detach(struct drm_dp_aux *aux)
>  	unsigned long timeout;
>  	int err;
>  
> -	drm_dp_aux_unregister(aux);
> +	drm_dp_aux_unregister_chardev(aux);
>  	disable_irq(dpaux->irq);
>  
>  	if (dpaux->output->panel) {
> -- 
> 2.33.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
