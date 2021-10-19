Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7C4C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Oct 2021 08:47:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B179861212
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Oct 2021 08:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234698AbhJSItx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Oct 2021 04:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhJSItw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Oct 2021 04:49:52 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437F8C061745
        for <linux-tegra@vger.kernel.org>; Tue, 19 Oct 2021 01:47:40 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id om14so14150372pjb.5
        for <linux-tegra@vger.kernel.org>; Tue, 19 Oct 2021 01:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=znWZG2M98SQpNWFciGHdUDcSpYrmNay3HXZ/Xgvx0nQ=;
        b=hEkwiTfRoPxhHXNChWGHFpjXsRoCzFgOhcDJVcFb2EUxBXvPL7YNM8vzDqEaxifEWt
         XyRsaOLf513n3Hm4cwHeZ3PNg1jzY05CvpllA4duP87gf31xWcixHlMPT1KNTTUSklSo
         TxKcopEN7uwFOndGqsIxBJvcAZsL0LPoc84zRBq28ske+f60EbSlDD7vieQOOA84dtO3
         AjyF/oEsSWufzljc/T1xKLjQwfiPSEFkDlSg+HkfoMzQE6/ItzxefQSjo7m/1Kjsr2k9
         iHKJK3rtoZp7ygnxscq++fK5OCElm4OJPbqnvGI92ogkFL9tHfMFSJc2Gt/gQh34Fzw0
         8PzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=znWZG2M98SQpNWFciGHdUDcSpYrmNay3HXZ/Xgvx0nQ=;
        b=Z2hOltPI/4BH4cmg9BmsPI8aRXafqFTTB+leWwnfvc5k7hPHGCP2hHmWExGanJZ+LA
         yYbDrdvKNTbCm+jYf8OKg3FdAssxZNOYGUZlVvAtv1UjS4eVdpXhc+hrTwkzDDWDg4q0
         fKva3GBBQzbr94tEfVm+qxx+jqz62ut2i3YfqCss3uaGZT2UVfxTSevptlWpk0bUScZA
         Zo/LEvxpY/oto6P7DhsEQpQRsyECyosM73CRyy0/cQzIFLgpdZihw4nwKiyfTa/CQJvJ
         59a6iY2ndI1DZYwyVkEKBXRuNQNxugai+chtyhsUKAqLOqkkRqZqZ2PnIdbFZhTBttQc
         ju6w==
X-Gm-Message-State: AOAM532qScu8/zHSpYOH11O0xUo0/Kf5MokSHB7wZTOHxGQdQKhyU1Q+
        Z3aKiOGnvKZlVCJC9b/8IeeE/EAgLqOxEimlsn0D+g==
X-Google-Smtp-Source: ABdhPJwJ5xzkp1s6vmtXEwTN3PMELy5xyWA5fOFd8eRIT/kgvNpG/hpMer48La8Bi54Wv63ViFaFTb4JBmjnj9bdod0=
X-Received: by 2002:a17:90b:4c0d:: with SMTP id na13mr5003522pjb.232.1634633259748;
 Tue, 19 Oct 2021 01:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211002233447.1105-1-digetx@gmail.com> <20211002233447.1105-2-digetx@gmail.com>
In-Reply-To: <20211002233447.1105-2-digetx@gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 19 Oct 2021 10:47:28 +0200
Message-ID: <CAG3jFyuYjCgUZWbksYvfw0iSOi-hTuFqvbwSamU+9HFG5MxHBQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] drm/bridge: tc358768: Enable reference clock
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

Hey Dmitry,

Thanks for submitting this series.

On Sun, 3 Oct 2021 at 01:35, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> The driver assumes that reference clock is always-enabled, but this is
> hardware-dependent and not true for ASUS Transformer TF700T. Make driver
> enable / disable the reference clock.
>
> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # Asus TF700T
> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index a3db532bbdd1..18ae6605a803 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -237,6 +237,10 @@ static void tc358768_hw_enable(struct tc358768_priv *priv)
>         if (priv->enabled)
>                 return;
>
> +       ret = clk_prepare_enable(priv->refclk);
> +       if (ret < 0)
> +               dev_err(priv->dev, "error enabling refclk (%d)\n", ret);
> +
>         ret = regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv->supplies);
>         if (ret < 0)
>                 dev_err(priv->dev, "error enabling regulators (%d)\n", ret);
> @@ -274,6 +278,8 @@ static void tc358768_hw_disable(struct tc358768_priv *priv)
>         if (ret < 0)
>                 dev_err(priv->dev, "error disabling regulators (%d)\n", ret);
>
> +       clk_disable_unprepare(priv->refclk);
> +
>         priv->enabled = false;
>  }
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
