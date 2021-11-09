Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7195AC433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Nov 2021 09:19:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 565EB611C4
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Nov 2021 09:19:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241702AbhKIJWT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 9 Nov 2021 04:22:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239402AbhKIJWT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 9 Nov 2021 04:22:19 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85214C061766
        for <linux-tegra@vger.kernel.org>; Tue,  9 Nov 2021 01:19:33 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d24so31790843wra.0
        for <linux-tegra@vger.kernel.org>; Tue, 09 Nov 2021 01:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7tokRF/FVlwuKlYK0+nIVx5Z3Xcvz1VhwMbFjVHQ51U=;
        b=KhnKo5mMFpVopf630w1tivsAqagAbuC+kPV9SqhdLQ780GfI81VnY2Lrd4TZw9/SPD
         IxN517AMfx8Ny1Ncpyf+GsLXNM90xtngjB/DMJ/rdKlRUa2h3Rv/eyGYCO8bdt5SXrXO
         pyo78/RPlkkCKH7k9VspiValrCmYWBlS4UMWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=7tokRF/FVlwuKlYK0+nIVx5Z3Xcvz1VhwMbFjVHQ51U=;
        b=x/zmL/PjO81aO0fT59N98cSGkH0IR0g8FaQxxlEx/UHVywTwxfsHGRFKi3Gm18UMUQ
         yA+qqcDpfFfQSyNTpOTWcqMUVdUM1gidMbIs5zeWPCuDaLDj5SM1BKWSpHb4W4k/O3++
         eoQShlGGs2Zn4qi5d61nWK+10UJVKRHccHBHLLXd03qfHGedxJ74L1Y+YY9t60wtcwI2
         2cBBtUCwqaiN2o9WuhQ6s2cclOxFbIj7vIpwcbT0xW87hP03vAqWxlV89RVmafZv3vGH
         K0OlGu/UAE7cBBP2qKyOsDAcwlac0zVsWTTrTzxQFN8FvUR53V0OR4c4jKmQY0esBK9p
         WehA==
X-Gm-Message-State: AOAM533m6N3/izC/BUn8k6pKPTbZS0HBfo6RYGv2bmztLBTt8jwOSNI7
        kpJnhkvHPT7fshs/7RRI8DV+XA==
X-Google-Smtp-Source: ABdhPJyhl4rnIDo8s67BBa3FpOq8w2dJxJWsiwIIUG7H8BtsauFJhUGPnqaQiD8vEe7kDCDAYjmyEw==
X-Received: by 2002:adf:df89:: with SMTP id z9mr7260671wrl.336.1636449572025;
        Tue, 09 Nov 2021 01:19:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id m2sm1901543wml.15.2021.11.09.01.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 01:19:31 -0800 (PST)
Date:   Tue, 9 Nov 2021 10:19:29 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm/tegra: Use drm_dp_aux_register_ddc/chardev()
 helpers
Message-ID: <YYo9IXjevmstSREu@phenom.ffwll.local>
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
 <YYk/jfcceun/Qleq@phenom.ffwll.local>
 <0a2c02ae-3fe1-e384-28d3-13e13801d675@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a2c02ae-3fe1-e384-28d3-13e13801d675@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Nov 08, 2021 at 09:16:07PM +0300, Dmitry Osipenko wrote:
> 08.11.2021 18:17, Daniel Vetter пишет:
> > On Mon, Nov 08, 2021 at 02:08:21AM +0300, Dmitry Osipenko wrote:
> >> Use drm_dp_aux_register_ddc/chardev() helpers that allow to register I2C
> >> adapter separately from the character device. This fixes broken display
> >> panel driver of Acer Chromebook CB5-311 that fails to probe starting with
> >> v5.13 kernel when DP AUX registration order was changed. Tegra SOR driver
> >> is never probed now using the new registration order because tegra-output
> >> always fails with -EPROBE_DEFER due to missing display panel that requires
> >> DP AUX DDC to be registered first. The offending commit made DDC to be
> >> registered after SOR's output, which can't ever happen. Use new helpers
> >> to restore the registration order and revive display panel.
> > 
> > This feels a bit backward, I think the clean solution would be to untangle
> > the SOR loading from the panel driver loading, and then only block
> > registering the overall drm_device on both drivers having loaded.
> 
> Sounds impossible.
> 
> 1. DRM device can be created only when all components are ready, panel
> is one of the components.

Nope. drm_device can be instantiated whenever you feel like.
drm_dev_register can only be called when it's all fully set up. Absolutely
nothing would work if drm_device wouldn't support this two-stage setup.

So sequence:

1. drm_dev_init

2. bind sor driver

3. create dp aux ddc

4. bind panel

5. yay we have everything, drm_dev_register

This should work, and it's designed to work like this actually. You
couldn't write big complex drivers otherwise.
-Daniel

> 
> 2. SOR driver is controlling panel and programs h/w based on panel presence.
> 
> 3. Panel can't become ready until DP AUX DDC is created.
> 
> 4. DP AUX DDC can't be created until DRM device is created.
> 
> 5. Go to 1.
> 
> Even if there is an option to somehow rewrite Tegra DRM driver to
> accommodate it to the desired driver model, it won't be something
> portable to stable kernels.
> 
> > This here at least feels like a game of whack-a-mole, if like every driver
> > needs its own careful staging of everything.
> 
> That is inevitable because each hardware design is individual.

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
