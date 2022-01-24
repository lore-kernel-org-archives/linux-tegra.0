Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB410C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Jan 2022 14:41:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239903AbiAXOls (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 Jan 2022 09:41:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239912AbiAXOlr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Jan 2022 09:41:47 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D9CC06173B
        for <linux-tegra@vger.kernel.org>; Mon, 24 Jan 2022 06:41:47 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id p27so50028131lfa.1
        for <linux-tegra@vger.kernel.org>; Mon, 24 Jan 2022 06:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dt0TIjFH2rj7vzbGPRJ1VIsaxBP8dFaOgztWn+GtXbs=;
        b=NGbOY41d8mvU/UOsgSm6XBtkvTxs2nEvDfQRp42uJB2ZUoDNXmlDIJCfX8kPKCe+Vo
         3ZtF06uAG3blwhIR4P7oQ4glHodNVlQNAMMOj2lzVqDeeKr8ipVku2zXaVmteFUMTkGg
         LV2v7D3GRDJky1oCuRPn8F0xHR3FpteoeydnddRIi/pzlWHc9YPy0ljbN4ElTV3o7Unc
         OxAJHX33gOwZbPbrGtCnn8FH6hlPklp2mxbRsYOA0Pg+Sn8QwGR7Y/F2+nZijKkC/hXX
         d99umKDneeSLxiaIq1wz7EGqanLzMSJV2ih9MA3bThD/RSRozcpErzg7J6UY1WjbFpnS
         IYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dt0TIjFH2rj7vzbGPRJ1VIsaxBP8dFaOgztWn+GtXbs=;
        b=1IZQpOIifP2xpkow8iw5r4P5IE+5ZYeOsw7d4WbGjqNOousW/0iXlO9ihwRc0nRURW
         V27rRJuOHYdpDCAYiWb9ODQ2vRqBKVdYRyacw0Hnce+wq/9C0IpQr1uaEauTzy88KwkC
         cNdZpOyneUlEjY7hyHBdU1Dt03aM2qZjyUAMruuPCbYAY4R1pOm8D+0rPBadO8drqc/O
         AUnyAlcEQvGGnmfrD2GaBf1Ilomdw5Tw0Okd24k4045jM5g5MjNiRYINJmVkR/GdX7/9
         3NBYkdT50RCHkKkGofPQwFHoATQdhNODtpFbOg61hlkINysYTpFnJW7p33d7YuaPgSCz
         xxOg==
X-Gm-Message-State: AOAM533tQv0vTgTvkP9BX1pVGxAGcuLf1qssWcZDNtpmsMViw+/TMEU5
        +YAzu9MTf9BiuwWEwB/7AveU7y/YLLu7yQSZ3TvQbg==
X-Google-Smtp-Source: ABdhPJwnzmeErgUKcLme9VHJTI4yfBT7Ilrk5WKCFJr7Lh2Lp4vrh4hTPIoOoNSW8/g/lAVOV3W1hTWHpwqofKoWRFs=
X-Received: by 2002:a2e:9187:: with SMTP id f7mr5213711ljg.463.1643035305614;
 Mon, 24 Jan 2022 06:41:45 -0800 (PST)
MIME-Version: 1.0
References: <1642050969-21152-1-git-send-email-anrao@nvidia.com>
In-Reply-To: <1642050969-21152-1-git-send-email-anrao@nvidia.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 24 Jan 2022 15:41:09 +0100
Message-ID: <CAPDyKFo6X4z_gEUSjKqV6gKk6hiBRzMRUKK_7LFcct4WYg=_qg@mail.gmail.com>
Subject: Re: [PATCH] mmc: tegra: Enable wake on SD card event
To:     Aniruddha Rao <anrao@nvidia.com>
Cc:     adrian.hunter@intel.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, p.zabel@pengutronix.de,
        linux-mmc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 13 Jan 2022 at 06:16, Aniruddha Rao <anrao@nvidia.com> wrote:
>
> Enable GPIO wake source on SD card detect line.
> Physical card insertion/removal event should wake the system
> from suspend.
>
> Signed-off-by: Aniruddha Rao <anrao@nvidia.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-tegra.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 35ebba0..5c84bd5 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -1673,6 +1673,9 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
>         /* HW busy detection is supported, but R1B responses are required. */
>         host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
>
> +       /* GPIO CD can be set as a wakeup source */
> +       host->mmc->caps |= MMC_CAP_CD_WAKE;
> +
>         tegra_sdhci_parse_dt(host);
>
>         tegra_host->power_gpio = devm_gpiod_get_optional(&pdev->dev, "power",
> @@ -1840,7 +1843,7 @@ static int sdhci_tegra_suspend(struct device *dev)
>                 return ret;
>         }
>
> -       return 0;
> +       return mmc_gpio_set_cd_wake(host->mmc, true);
>  }
>
>  static int sdhci_tegra_resume(struct device *dev)
> @@ -1848,6 +1851,10 @@ static int sdhci_tegra_resume(struct device *dev)
>         struct sdhci_host *host = dev_get_drvdata(dev);
>         int ret;
>
> +       ret = mmc_gpio_set_cd_wake(host->mmc, false);
> +       if (ret)
> +               return ret;
> +
>         ret = pm_runtime_force_resume(dev);
>         if (ret)
>                 return ret;
> --
> 2.7.4
>
