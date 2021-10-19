Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A682C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Oct 2021 09:27:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3683661212
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Oct 2021 09:27:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234519AbhJSJaI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Oct 2021 05:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234996AbhJSJaI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Oct 2021 05:30:08 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17516C061745
        for <linux-tegra@vger.kernel.org>; Tue, 19 Oct 2021 02:27:56 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id e10so8370651plh.8
        for <linux-tegra@vger.kernel.org>; Tue, 19 Oct 2021 02:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WqQuigPQkG7yIJnoURmwHOZ7CYWB7+IfTh42MrwnNsA=;
        b=HgX0s/Pmlc/k5zz3N/9Rz1+xZgFix7E3aZtwr7ii6m5YGE6II1pdsylJDHgE3SYIFx
         QsnmdcjwNrozuscdBbI9oIJEQPZ0U+ExW6GHDxOlF3sEzP3LXAMvCpun74Cd4v0BuLJu
         JR/sJtnKHJXNeSfaCS0bTxYUo2rFEzwjVsU4WjOqtIkBQJIWE9wLdZG2yoo+IxEoXuOS
         8fw3kHVoMQ5dzBAxlyQVeRYM796JtvP/ipqutDWZiJefoZ7GkGZvB/cfk5z+cWk4pH9Q
         6Lh/0oCqrvq1xERjNJWQ378uDfdS2r2+X/CTWXCqT8+wn+Ie1IZSGbi/z0B47kefVM6w
         nS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WqQuigPQkG7yIJnoURmwHOZ7CYWB7+IfTh42MrwnNsA=;
        b=KkY5QG0uoIQL4J0fXYd9q1cgkTtsBRlZ3zyrnPSSL4xJfOLf7vfQJR0SCURbwoeEZF
         wZq2vucJCp98EVcSFmJ83c3hMadZLoGg68Ancpb5N+YDv7BZJrzQ8Q5MT4WpEGHI+qNf
         xs8Hwgm74q47RfMJXBuudoKMPLmoRHbUSJCHOC7f5HKz7W4NJDtCsYG+wBJG1ZXYaNlr
         ScFcaIjhQpcpwjEsDE5t2pqGfI7eIAV8JK5XJCVl+y9kbIB1vxMRQ3lPQqsyYGhCe9Mw
         JDX+8HCCkDxfqog6/QsDYzEKa+osrsIXmQ4W8ogiBCcATwX7otz6qlHqrUC3PrVmCUAz
         ahwA==
X-Gm-Message-State: AOAM532pCNUMkzrLlHszPbSqFlbSavsAG3xUDEDUS4ewOiC+JEO1GwdO
        /FJq7EQJ7loWeZqMvC6mniKg4WG9vscmwnaEsyWDWQ==
X-Google-Smtp-Source: ABdhPJwrhmSxlRtYdBf+1xoIqYntrpTC3t1Cb9/54BAEeKiXHf4bI6D9JM/OrpP2k//fY9NFIe2XMN+J+V15C1C83K8=
X-Received: by 2002:a17:90b:1644:: with SMTP id il4mr5260442pjb.179.1634635675569;
 Tue, 19 Oct 2021 02:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211002233447.1105-1-digetx@gmail.com> <20211002233447.1105-4-digetx@gmail.com>
In-Reply-To: <20211002233447.1105-4-digetx@gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 19 Oct 2021 11:27:44 +0200
Message-ID: <CAG3jFytqbBqucgT2g76Us-8JV-d-RWo8ErHF0z28WCzhU9nTSw@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] drm/bridge: tc358768: Calculate video start delay
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
> Calculate video start delay based on the display timing instead
> of hardcoding it to a default value. This fixes "trembling" display
> output on Asus Transformer TF700T which uses Panasonic VVX10F004B00
> display panel.
>
> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # Asus TF700T
> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 10ebd0621ad3..5b3f8723bd3d 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -634,7 +634,8 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>         u32 val, val2, lptxcnt, hact, data_type;
>         const struct drm_display_mode *mode;
>         u32 dsibclk_nsk, dsiclk_nsk, ui_nsk, phy_delay_nsk;
> -       u32 dsiclk, dsibclk;
> +       u32 dsiclk, dsibclk, video_start;
> +       const u32 internal_delay = 40;
>         int ret, i;
>
>         tc358768_hw_enable(priv);
> @@ -663,23 +664,27 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>         case MIPI_DSI_FMT_RGB888:
>                 val |= (0x3 << 4);
>                 hact = mode->hdisplay * 3;
> +               video_start = (mode->htotal - mode->hsync_start) * 3;
>                 data_type = MIPI_DSI_PACKED_PIXEL_STREAM_24;
>                 break;
>         case MIPI_DSI_FMT_RGB666:
>                 val |= (0x4 << 4);
>                 hact = mode->hdisplay * 3;
> +               video_start = (mode->htotal - mode->hsync_start) * 3;
>                 data_type = MIPI_DSI_PACKED_PIXEL_STREAM_18;
>                 break;
>
>         case MIPI_DSI_FMT_RGB666_PACKED:
>                 val |= (0x4 << 4) | BIT(3);
>                 hact = mode->hdisplay * 18 / 8;
> +               video_start = (mode->htotal - mode->hsync_start) * 18 / 8;
>                 data_type = MIPI_DSI_PIXEL_STREAM_3BYTE_18;
>                 break;
>
>         case MIPI_DSI_FMT_RGB565:
>                 val |= (0x5 << 4);
>                 hact = mode->hdisplay * 2;
> +               video_start = (mode->htotal - mode->hsync_start) * 2;
>                 data_type = MIPI_DSI_PACKED_PIXEL_STREAM_16;
>                 break;
>         default:
> @@ -690,7 +695,8 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>         }
>
>         /* VSDly[9:0] */
> -       tc358768_write(priv, TC358768_VSDLY, 1);
> +       video_start = max(video_start, internal_delay + 1) - internal_delay;
> +       tc358768_write(priv, TC358768_VSDLY, video_start);
>
>         tc358768_write(priv, TC358768_DATAFMT, val);
>         tc358768_write(priv, TC358768_DSITX_DT, data_type);
> --
> 2.32.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
