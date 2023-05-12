Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86027C77B7C
	for <linux-tegra@archiver.kernel.org>; Fri, 12 May 2023 09:46:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239935AbjELJqH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 May 2023 05:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240614AbjELJpx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 May 2023 05:45:53 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5152F11B73
        for <linux-tegra@vger.kernel.org>; Fri, 12 May 2023 02:45:45 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-55a14807e4cso172015727b3.1
        for <linux-tegra@vger.kernel.org>; Fri, 12 May 2023 02:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683884744; x=1686476744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SeNDNqSbKtT4juprQIPOMJ5pas9h2iCUoYs/y7tb/+s=;
        b=GtZrqROkH4ZfxGqVx3hrHf4l23PetZ6CMy4woniilPGVWRB8G4rBVVXin8SU4uHEVE
         wtZY3W1oMghoYi0guVodFnlz+uaCahv0XpFAQuvWhtuOwpHYzDzLdczdRUBnyFe0UMnY
         ztzXOPBi7FwwlScghGzKcZOUHy28qYMiHNbWYDdhvyVDU1bi+zqLAaW30ayjTfc5VAix
         MdfGcZ9GWL8VrtC6wj/+gnSAsIGxP/u4QEo67j1tEoedMw500PsRi70JcBCPSeS4tVaz
         wItCQ8APNkxcAOsobVaDsVv67krITCKIYm9EhKTCjpaneEn6E6xTcNKaC8nPgAFpqcIo
         aE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683884744; x=1686476744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SeNDNqSbKtT4juprQIPOMJ5pas9h2iCUoYs/y7tb/+s=;
        b=lEEHpElb9T134j7sc6OH9hQxm0zCCpw5NiBIm2ieXqXbfLipi3Eikiai3v6zEb20sM
         ip7fso9sJ4yEkZRvcMIcG1IPN5doLFw9KvT4kAtFu9yXumPIDQCOEfJ39MHg9KHCA4tL
         CfZHAJe/bwTAxrS2UC4YEMcBKBWfY21J7EqLw4g13ofy8ImX6k90ijAImubDqOVTsTAB
         7a4lC9Rk3flrKiUemduRK2Xlmi7kZE5aKOYkMxWwuACgLTTz4Oju94yx6hwqQZFpJfeF
         xouHhby9g0dCImpXeLQFobQZdKLqZvelY4sqWrFDG2t2rjqoNj6MQamuy5moDwbbW2Nz
         A0lQ==
X-Gm-Message-State: AC+VfDy7My3GDZUQYporOGkXOVzzKoNRXHcATiMxMIkazkB33wMLtZ4J
        CWtX4LzZMgZ7x9P30imeyRcCuBZs61J05BtFLj4Slg==
X-Google-Smtp-Source: ACHHUZ6lutSExTqyZsU/hQjFKIAv55bPUWGU0TtTWdM/WQJARaWIZ1aV+bmHH/6SrdqtE4Nhmy+pjSm4iiG39PZWMJU=
X-Received: by 2002:a0d:d691:0:b0:539:1b13:3d64 with SMTP id
 y139-20020a0dd691000000b005391b133d64mr23654781ywd.48.1683884744449; Fri, 12
 May 2023 02:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230512084152.31233-1-tzimmermann@suse.de> <20230512084152.31233-7-tzimmermann@suse.de>
In-Reply-To: <20230512084152.31233-7-tzimmermann@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 12 May 2023 12:45:33 +0300
Message-ID: <CAA8EJpr8oGfmZ0f49W6C23K=EOWW0a-E4tzyn+U23sYkPeaArQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] drm/msm: Use regular fbdev I/O helpers
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 May 2023 at 11:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Use the regular fbdev helpers for framebuffer I/O instead of DRM's
> helpers. Msm does not use damage handling, so DRM's fbdev helpers
> are mere wrappers around the fbdev code.
>
> Add CONFIG_DRM_MSM_FBDEV_EMULATION to select the necessary
> Kconfig options automatically. Make fbdev emulation depend on
> the new config option.
>
> By using fbdev helpers directly within each DRM fbdev emulation,
> we can eventually remove DRM's wrapper functions entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/msm/Kconfig     |  9 +++++++++
>  drivers/gpu/drm/msm/Makefile    |  2 +-
>  drivers/gpu/drm/msm/msm_drv.h   |  2 +-
>  drivers/gpu/drm/msm/msm_fbdev.c | 12 +++++++-----
>  4 files changed, 18 insertions(+), 7 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
