Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6F5C433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 09:05:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiJGJF1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 05:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiJGJF0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 05:05:26 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C161A4862
        for <linux-tegra@vger.kernel.org>; Fri,  7 Oct 2022 02:05:24 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d10so4379225pfh.6
        for <linux-tegra@vger.kernel.org>; Fri, 07 Oct 2022 02:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vuJolKOvcivD/aX91qIw8K+wkQRzYxb0y/y1JZ9OmnA=;
        b=VMucyp3eulkyWa4RtK33D5vsDdmOx3E/5uQASe5XFyBc7QvZuu4g64YGeCqYMhawug
         ME5vfLEOBdt/XKVL8wVkuDE0oFZbAQwP1yBezOGvcHfUUWAXoZUtdeQTinVJRWT8pCSX
         /GQQTFltv2Fz0fYnMAFq+wXoKyHXcGOaSHDeZkEVGFAbRVSINJ0J3YUAn095cpTI71jq
         I4MyfBFjeLyhtN6o94yh6V4lAm0CFLs2jb89EqQ0UAfNd4Hr1mQBZEpajmt+8hM+Qcij
         1onKQgdMymLVLwl5nOK/TMAuX7f2MFxxZNu0Axk64TsudUs+UCQpjwwzuzJw63xlzX+p
         sVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vuJolKOvcivD/aX91qIw8K+wkQRzYxb0y/y1JZ9OmnA=;
        b=IajpPmqXAFEKdo54whkZzA8Bty/7tqJeLVM38cpynCP4o8hYKLigzCx+wIVGGrR7iM
         BBfW6WFS1QZP7Qqlb6ZoXp9ffBAYNHFYh0KKJqjTDwxx80Qc3eux9yg8uxURXddcCa+i
         +Vjkqtm2aZXHDMYOFGFckBAdEQdJVi59zRio8xsB6ZmYD5trapDeLmlbEaRuGfUahBeu
         s+n6RDhhHDImGBwIlbUPtrxW02xqhIDLI1zAxIwe/gKZOklr9HLsTBETs4lNeNmk7Tnl
         85RHTI+zYu7p12Q5hvOcrxfluRUTL5pheL6M3YRGm17ZrNhPOzVEij8xRhttPSMXSuYG
         6w0A==
X-Gm-Message-State: ACrzQf2itGVuYApKB2JpA8npjeLKwRB6s2Kvb7TrtoPqTJCNigDD2sSM
        /YpS2SwenUMS2eJmMC/c/Jw992/h6Kni/yiYjehy4Q==
X-Google-Smtp-Source: AMsMyM64mfUZgwPaHuURYaWD48vnFONQ5XCe+zQV5qK4djTsOG42Yp4NYuS7nB7GGU3nnFAZ+lm7I/aSnkyo1ewOiMg=
X-Received: by 2002:a63:90c1:0:b0:450:75b5:29fe with SMTP id
 a184-20020a6390c1000000b0045075b529femr3514159pge.541.1665133523790; Fri, 07
 Oct 2022 02:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <Yz6zfrVq9cP/wrJb@orome> <20221006130622.22900-1-pshete@nvidia.com>
 <20221006130622.22900-4-pshete@nvidia.com>
In-Reply-To: <20221006130622.22900-4-pshete@nvidia.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 7 Oct 2022 11:04:47 +0200
Message-ID: <CAPDyKFq5mocPRZO97=f0TiNsgXntT+R9+XRK94MTvFPUBF4tig@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] mmc: sdhci-tegra: Use actual clock rate for SW
 tuning correction
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     adrian.hunter@intel.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, p.zabel@pengutronix.de,
        linux-mmc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, anrao@nvidia.com,
        smangipudi@nvidia.com, kyarlagadda@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 6 Oct 2022 at 15:07, Prathamesh Shete <pshete@nvidia.com> wrote:
>
> Ensure tegra_host member "curr_clk_rate" holds the actual clock rate
> instead of requested clock rate for proper use during tuning correction
> algorithm. Actual clk rate may not be the same as the requested clk
> frequency depending on the parent clock source set. Tuning correction
> algorithm depends on certain parameters which are sensitive to current
> clk rate. If the host clk is selected instead of the actual clock rate,
> tuning correction algorithm may end up applying invalid correction,
> which could result in errors
>
> Fixes: ea8fc5953e8b ("mmc: tegra: update hw tuning process")
>
> Signed-off-by: Aniruddha TVS Rao <anrao@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 3663c5d0efe0..ccbb26a66284 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -783,7 +783,7 @@ static void tegra_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
>                 dev_err(dev, "failed to set clk rate to %luHz: %d\n",
>                         host_clk, err);
>
> -       tegra_host->curr_clk_rate = host_clk;
> +       tegra_host->curr_clk_rate = clk_get_rate(pltfm_host->clk);
>         if (tegra_host->ddr_signaling)
>                 host->max_clk = host_clk;
>         else
> --
> 2.17.1
>
