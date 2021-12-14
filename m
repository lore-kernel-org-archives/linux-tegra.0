Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDA3C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Dec 2021 20:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237668AbhLNUhk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Dec 2021 15:37:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237663AbhLNUhk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Dec 2021 15:37:40 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B0FC06173F
        for <linux-tegra@vger.kernel.org>; Tue, 14 Dec 2021 12:37:39 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id e24so13380913lfc.0
        for <linux-tegra@vger.kernel.org>; Tue, 14 Dec 2021 12:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rjQbYZg8144iiip1tDYRKwr2CkrjM2gUKNnhrsXHc3k=;
        b=pHi5A4/pju7+fEjLEURE3x/9YPiQ8cr+Fn8JARy+UxgdsrspFZFeswhb0HSOXv0pdH
         rQuU3ofhNHdH3yaBwuwgBclDM2PMX37gMYXyN6Za6rDc/5CncCLnaN5ncYP+CXzgQ+3O
         6Y1ZUqLqd4KtPnq/XwRudfhwvLDCqFVwE1pB2MxRhMjSHTL4IM/S+KQbh/xpOmygQVeK
         VtBhwNjHAJgJgvGuewpnW2yBe8vwOI0KjdovQJX1COvMB2rAUXR14kdQpM+3U1lU+80s
         tDNo+zK7bB3WiPvDoYU75d4fyXPJWZUD/taS4w19QVjzRTh1J/CszTfdqVQEStoRZOdz
         kviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rjQbYZg8144iiip1tDYRKwr2CkrjM2gUKNnhrsXHc3k=;
        b=FODDJHGLVbnGWMpsjh9XK8qNrSZOCBGRbCDWVcwQnVrpz8UcgIgSOzyuxf6H0Men69
         P/qe8TE595OUb9kpzVKGyp6MjB5+RLDbL898OZye/Ou5GytyKgpVGK9fTL1gflbnVFhV
         pXaKJBlI9s7jRO2n0JJzBQfMSUUDsXIsedOnPk8qDXwiDNl+VhNcmfFFpVNvIqGObF9e
         dWFGdRoybYOxNTxyZ0JnNQ1g250qALQx0buqE7NkBxfue4zfp2pxTZ6ZEoXYv/iGx1Zy
         Pm65jqAcW+3I6C8EUhmncrDP9DMwCGS5abJRbtlBe+lUDlI4+KaVmqDDNH872yXHffwh
         K9uw==
X-Gm-Message-State: AOAM531Plr2g0qh3OKEU6oWjk7/YuO73/w7K8Gu+adFQSPdBM/7hgLIJ
        y0uzmwDqP1tJjV/tSVLybCHaTlyYETm8MX/lef4PMg==
X-Google-Smtp-Source: ABdhPJyyeNuwTAyrLnEyLCFCzpP8lh05uAdQDCf/Oea93kQ9DAout+5VOBH+u9xReGe8d4Q8RVZT8yy69+6PAvVLFdw=
X-Received: by 2002:ac2:5607:: with SMTP id v7mr6855211lfd.71.1639514257788;
 Tue, 14 Dec 2021 12:37:37 -0800 (PST)
MIME-Version: 1.0
References: <3dd2473a-00ca-4c62-e17f-9392cf74cda4@intel.com> <20211214113653.4631-1-pshete@nvidia.com>
In-Reply-To: <20211214113653.4631-1-pshete@nvidia.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 14 Dec 2021 21:37:01 +0100
Message-ID: <CAPDyKFq1NMXrMw0Dn6T7-0J1C4QdNoi4dUfnB5=zMQKeyQoAdQ@mail.gmail.com>
Subject: Re: [PATCH v4] mmc: sdhci-tegra: Fix switch to HS400ES mode
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     adrian.hunter@intel.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, p.zabel@pengutronix.de,
        linux-mmc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, anrao@nvidia.com,
        smangipudi@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 14 Dec 2021 at 12:36, Prathamesh Shete <pshete@nvidia.com> wrote:
>
> When CMD13 is sent after switching to HS400ES mode, the bus
> is operating at either MMC_HIGH_26_MAX_DTR or MMC_HIGH_52_MAX_DTR.
> To meet Tegra SDHCI requirement at HS400ES mode, force SDHCI
> interface clock to MMC_HS200_MAX_DTR (200 MHz) so that host
> controller CAR clock and the interface clock are rate matched.
>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Applied for fixes and by adding a fixes and a stable tag, thanks!

Fixes: dfc9700cef77 ("mmc: tegra: Implement HS400 enhanced strobe")

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-tegra.c | 43 ++++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 387ce9cdbd7c..7be6674eebd5 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -354,23 +354,6 @@ static void tegra_sdhci_set_tap(struct sdhci_host *host, unsigned int tap)
>         }
>  }
>
> -static void tegra_sdhci_hs400_enhanced_strobe(struct mmc_host *mmc,
> -                                             struct mmc_ios *ios)
> -{
> -       struct sdhci_host *host = mmc_priv(mmc);
> -       u32 val;
> -
> -       val = sdhci_readl(host, SDHCI_TEGRA_VENDOR_SYS_SW_CTRL);
> -
> -       if (ios->enhanced_strobe)
> -               val |= SDHCI_TEGRA_SYS_SW_CTRL_ENHANCED_STROBE;
> -       else
> -               val &= ~SDHCI_TEGRA_SYS_SW_CTRL_ENHANCED_STROBE;
> -
> -       sdhci_writel(host, val, SDHCI_TEGRA_VENDOR_SYS_SW_CTRL);
> -
> -}
> -
>  static void tegra_sdhci_reset(struct sdhci_host *host, u8 mask)
>  {
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -791,6 +774,32 @@ static void tegra_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
>         }
>  }
>
> +static void tegra_sdhci_hs400_enhanced_strobe(struct mmc_host *mmc,
> +                                             struct mmc_ios *ios)
> +{
> +       struct sdhci_host *host = mmc_priv(mmc);
> +       u32 val;
> +
> +       val = sdhci_readl(host, SDHCI_TEGRA_VENDOR_SYS_SW_CTRL);
> +
> +       if (ios->enhanced_strobe) {
> +               val |= SDHCI_TEGRA_SYS_SW_CTRL_ENHANCED_STROBE;
> +               /*
> +                * When CMD13 is sent from mmc_select_hs400es() after
> +                * switching to HS400ES mode, the bus is operating at
> +                * either MMC_HIGH_26_MAX_DTR or MMC_HIGH_52_MAX_DTR.
> +                * To meet Tegra SDHCI requirement at HS400ES mode, force SDHCI
> +                * interface clock to MMC_HS200_MAX_DTR (200 MHz) so that host
> +                * controller CAR clock and the interface clock are rate matched.
> +                */
> +               tegra_sdhci_set_clock(host, MMC_HS200_MAX_DTR);
> +       } else {
> +               val &= ~SDHCI_TEGRA_SYS_SW_CTRL_ENHANCED_STROBE;
> +       }
> +
> +       sdhci_writel(host, val, SDHCI_TEGRA_VENDOR_SYS_SW_CTRL);
> +}
> +
>  static unsigned int tegra_sdhci_get_max_clock(struct sdhci_host *host)
>  {
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> --
> 2.17.1
>
