Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B65C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Jan 2022 01:03:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343967AbiAFBDI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jan 2022 20:03:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240018AbiAFBDH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jan 2022 20:03:07 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A36C061245
        for <linux-tegra@vger.kernel.org>; Wed,  5 Jan 2022 17:03:07 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id d14so906116ila.1
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jan 2022 17:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LnAubQ94PDCRwQNOSUL7oWBc6st8xuAGeyidhQSqpxM=;
        b=L+KKy1dIZAwAdNTOVd0qKOKt+iqom+ZV4roHbjm+6kadMtLGIIVBSiOOCpx34AcihH
         0O6o2MNxPd0Y4mb8rb6+/dBn+2ajW6we7n+Nvt1v8DST7b+3zYtGiNC4A1jVWzbSaLHP
         YeeKuKQBkCpeABG0hXzBrLpv1VFCNMOe5GVBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LnAubQ94PDCRwQNOSUL7oWBc6st8xuAGeyidhQSqpxM=;
        b=QAT+HxjTezqmd5ENPrMvgRr1waSpGn+jupZWmEDs8VTAcj0otldfNAe6d+Hxun+drM
         UD8GEIDJtfxG+XD/Sd5wQKhEe8YATjF7xzi7gLIJFrBB2Qe86/rJ51APsU4X01TkhzBL
         DAFe38teo0tHySbmIgz3zi6FK7LbvyospxswxQjNa1QXBOsPt0tmyASjvX3xrg221cOo
         TmcsN6OQWMjhh6qlk6/lBOAlZY6yJWN1VbnvRPIZlnpciIoueigCqAdKTgDE/GxuPntK
         s6CeXKdE6iuej4ecX9lgjBSlLVOKAMw5P8JwmWg+A+e2piO95LqsN6TlrhQ7LsJxpUDC
         XXRA==
X-Gm-Message-State: AOAM532D4IXzdPdMi3O7NG2H8XusULTDkwH6tqeW2vIs38QQzP0RxAqx
        4CSkIB652h7DJeeFD1tl3HE2gKMgX+nSsg==
X-Google-Smtp-Source: ABdhPJxCqtVRu1wqA35LDbVZmjPrlytLWLEhzxfaShXn7FU7D159VX3rVZCm480/NSGLUFvFOvl0dg==
X-Received: by 2002:a05:6e02:1b8b:: with SMTP id h11mr27199633ili.14.1641430986082;
        Wed, 05 Jan 2022 17:03:06 -0800 (PST)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id h15sm277841ili.55.2022.01.05.17.03.05
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 17:03:05 -0800 (PST)
Received: by mail-io1-f52.google.com with SMTP id u8so1240987iol.5
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jan 2022 17:03:05 -0800 (PST)
X-Received: by 2002:a05:6602:2c83:: with SMTP id i3mr25918868iow.128.1641430985233;
 Wed, 05 Jan 2022 17:03:05 -0800 (PST)
MIME-Version: 1.0
References: <20211220104855.428290-1-thierry.reding@gmail.com> <20211220104855.428290-2-thierry.reding@gmail.com>
In-Reply-To: <20211220104855.428290-2-thierry.reding@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 5 Jan 2022 17:02:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VeN=rODkhO3gYNZ5rFW1iabirHopR0Ra5UFAKLNn1zYA@mail.gmail.com>
Message-ID: <CAD=FV=VeN=rODkhO3gYNZ5rFW1iabirHopR0Ra5UFAKLNn1zYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/tegra: dpaux: Populate AUX bus
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On Mon, Dec 20, 2021 at 2:49 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> The DPAUX hardware block exposes an DP AUX interface that provides
> access to an AUX bus and the devices on that bus. Use the DP AUX bus
> infrastructure that was recently introduced to probe devices on this
> bus from DT.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/Kconfig | 1 +
>  drivers/gpu/drm/tegra/dpaux.c | 7 +++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
> index 8cf5aeb9db6c..201f5175ecfe 100644
> --- a/drivers/gpu/drm/tegra/Kconfig
> +++ b/drivers/gpu/drm/tegra/Kconfig
> @@ -5,6 +5,7 @@ config DRM_TEGRA
>         depends on COMMON_CLK
>         depends on DRM
>         depends on OF
> +       select DRM_DP_AUX_BUS
>         select DRM_KMS_HELPER
>         select DRM_MIPI_DSI
>         select DRM_PANEL
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 1f96e416fa08..9da1edcdc835 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -18,6 +18,7 @@
>  #include <linux/reset.h>
>  #include <linux/workqueue.h>
>
> +#include <drm/drm_dp_aux_bus.h>
>  #include <drm/drm_dp_helper.h>
>  #include <drm/drm_panel.h>
>
> @@ -570,6 +571,12 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
>         list_add_tail(&dpaux->list, &dpaux_list);
>         mutex_unlock(&dpaux_lock);
>
> +       err = devm_of_dp_aux_populate_ep_devices(&dpaux->aux);
> +       if (err < 0) {
> +               dev_err(dpaux->dev, "failed to populate AUX bus: %d\n", err);
> +               return err;

nit:

if (err < 0)
  return dev_err_probe(dpaux->dev, err, "failed to populate AUX bus\n");

That's more concise and gives the pretty formatting for the error code
(not that devm_of_dp_aux_populate_ep_devices() currently returns
anything other than 0).

> +       }

I think you need to use of_dp_aux_populate_ep_devices() and then
depopulate in your remove, right? Otherwise the ordering won't be
right. Either that or fully transition your probe to devm (and get rid
of your remove) by adding some devm_add_action_or_reset() helpers...

Hrm, I guess looking closer it's also a little concerning that if
devm_of_dp_aux_populate_ep_devices() returns an error then you'll
totally skip all the things that tegra_dpaux_remove() is supposed to
handle. I guess that's a pre-existing bug (earlier error cases in the
probe don't, for instance, undo the pm_runtime state) but this makes
it worse.


-Doug
