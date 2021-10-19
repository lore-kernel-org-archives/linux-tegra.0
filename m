Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F4AC433FE
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Oct 2021 08:55:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AA546115A
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Oct 2021 08:55:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234519AbhJSI5i (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Oct 2021 04:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234561AbhJSI5g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Oct 2021 04:57:36 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F18C061745
        for <linux-tegra@vger.kernel.org>; Tue, 19 Oct 2021 01:55:24 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id pf6-20020a17090b1d8600b0019fa884ab85so1460387pjb.5
        for <linux-tegra@vger.kernel.org>; Tue, 19 Oct 2021 01:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bfQpC7UQZpNqq1v0sLumWlo6NVzWJwEiwTHkqYg5h6A=;
        b=qDxz+misihGXlTA/r4pgSx5eCNWOMbtLHVRQQrxN6vBMhWa5g4a+oG6bivI5nm2mq1
         +nhWGUQM1E1mI3u6T/lsqhQO/MMB9iqvHPLz6UFsXK+gjiCRwA3/8Xz43VDFB1kKvxo4
         wIlF0Mop9np+pX0NkE2GBJGM2f0oPo48wkPgc5la+LtT8qUKlMTFqXsF/TDq2MfVt2f5
         cj81YfZ39cVUbVv+lSJCzuHWQcpkgGfoYfQKG2ln+6/bBHdzQYWID62+rzIiZKS9PyVj
         cTmEVqjy42Iz2FXw3CXdoBONf3EygmpT2FIuq7XV2nqOxQw6Z3VFMI76sUCeUaAB/c/r
         0OLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bfQpC7UQZpNqq1v0sLumWlo6NVzWJwEiwTHkqYg5h6A=;
        b=NoayOlRbu2Mt6HvEfreN6UxwidIs/TFDzroylHNMRpjnaoQ/VH5UpdSAsywO4+lN/g
         ZO8/ZQufA+yXFIvx279B4YHhXmPDvzjnpp1yowj2HlW1T49pLe9NTdaI6My6A6iKgHXH
         a128M8fFShhGurY294O4dtkbZycx0Tkv7JZdiXlVtvlwrh30znZgrN3O4Lk3blp75DfR
         9SLbfRYAX43HeVc9D7oR0NBB0HhP0qxGvfKMlg0qE24YkYyOlKdUQ09+EgCVefPNOiLE
         XjTQOwAypt/NwHWR/CCA7R8zypj6cN8nTXIcCy09Ls1IoW/lwT+CTNX6jQKELkW6614c
         zVQQ==
X-Gm-Message-State: AOAM533rtN+uhbRdgYMwERu7JTCKl4i9WoaKCw8pNnZzU3532p5kifQS
        e5GitkTIO+IS3GpK8K/SQSWL4f61HaoYWb/9xZiH7w==
X-Google-Smtp-Source: ABdhPJxsEa+yroDAhbHQrtQv2/06arqDDWoEpu77sno3nW/g9Vma85iKgTgN8MsdXKAY4s0Z2WIfTrOMJjqvUepGKS0=
X-Received: by 2002:a17:90b:4c0d:: with SMTP id na13mr5042549pjb.232.1634633723777;
 Tue, 19 Oct 2021 01:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211002233447.1105-1-digetx@gmail.com> <20211002233447.1105-3-digetx@gmail.com>
In-Reply-To: <20211002233447.1105-3-digetx@gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 19 Oct 2021 10:55:12 +0200
Message-ID: <CAG3jFyvtSU9ijnL7BwGEg09dgotT1H9Ox3A=Oi1GAAB1+SfoQg@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] drm/bridge: tc358768: Support pulse mode
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-tegra@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 3 Oct 2021 at 01:35, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Support pulse-mode synchronization which is supported and used by simple
> DSI panels like Panasonic VVX10F004B00.
>
> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # Asus TF700T
> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 66 ++++++++++++++++++++++---------
>  1 file changed, 48 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 18ae6605a803..10ebd0621ad3 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -785,24 +785,54 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>         /* START[0] */
>         tc358768_write(priv, TC358768_STARTCNTRL, 1);
>
> -       /* Set event mode */
> -       tc358768_write(priv, TC358768_DSI_EVENT, 1);
> -
> -       /* vsw (+ vbp) */
> -       tc358768_write(priv, TC358768_DSI_VSW,
> -                      mode->vtotal - mode->vsync_start);
> -       /* vbp (not used in event mode) */
> -       tc358768_write(priv, TC358768_DSI_VBPR, 0);
> -       /* vact */
> -       tc358768_write(priv, TC358768_DSI_VACT, mode->vdisplay);
> -
> -       /* (hsw + hbp) * byteclk * ndl / pclk */
> -       val = (u32)div_u64((mode->htotal - mode->hsync_start) *
> -                          ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
> -                          mode->clock * 1000);
> -       tc358768_write(priv, TC358768_DSI_HSW, val);
> -       /* hbp (not used in event mode) */
> -       tc358768_write(priv, TC358768_DSI_HBPR, 0);
> +       if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
> +               /* Set pulse mode */
> +               tc358768_write(priv, TC358768_DSI_EVENT, 0);
> +
> +               /* vact */
> +               tc358768_write(priv, TC358768_DSI_VACT, mode->vdisplay);
> +
> +               /* vsw */
> +               tc358768_write(priv, TC358768_DSI_VSW,
> +                              mode->vsync_end - mode->vsync_start);
> +               /* vbp */
> +               tc358768_write(priv, TC358768_DSI_VBPR,
> +                              mode->vtotal - mode->vsync_end);
> +
> +               /* hsw * byteclk * ndl / pclk */
> +               val = (u32)div_u64((mode->hsync_end - mode->hsync_start) *
> +                                  ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
> +                                  mode->clock * 1000);
> +               tc358768_write(priv, TC358768_DSI_HSW, val);
> +
> +               /* hbp * byteclk * ndl / pclk */
> +               val = (u32)div_u64((mode->htotal - mode->hsync_end) *
> +                                  ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
> +                                  mode->clock * 1000);
> +               tc358768_write(priv, TC358768_DSI_HBPR, val);
> +       } else {
> +               /* Set event mode */
> +               tc358768_write(priv, TC358768_DSI_EVENT, 1);
> +
> +               /* vact */
> +               tc358768_write(priv, TC358768_DSI_VACT, mode->vdisplay);
> +
> +               /* vsw (+ vbp) */
> +               tc358768_write(priv, TC358768_DSI_VSW,
> +                              mode->vtotal - mode->vsync_start);
> +               /* vbp (not used in event mode) */
> +               tc358768_write(priv, TC358768_DSI_VBPR, 0);
> +
> +               /* (hsw + hbp) * byteclk * ndl / pclk */
> +               val = (u32)div_u64((mode->htotal - mode->hsync_start) *
> +                                  ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
> +                                  mode->clock * 1000);
> +               tc358768_write(priv, TC358768_DSI_HSW, val);
> +
> +               /* hbp (not used in event mode) */
> +               tc358768_write(priv, TC358768_DSI_HBPR, 0);
> +       }
> +
>         /* hact (bytes) */
>         tc358768_write(priv, TC358768_DSI_HACT, hact);
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
