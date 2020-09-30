Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2293CC2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 07:21:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF976207C3
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 07:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601450514;
	bh=4a1eMMEYAX2Q7JPaPum/diACL5G6etmpf/ER/kUFzFc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=MkDSOLTjw07GnCclCZ7pVq8wy5o23RHYv2P9dKpgIjeHZ11yGzU7vv2yCqhmsvQu2
	 Y5nAaDzgnlpPrV+v8EsqECTGOnBtWG+hewlsZncXLpy/Pzlmpga606lWdhlOMpaD9D
	 NwIIj1tj8Y30JUOhZu1bzNIGy3nODoFXPybU1FCU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgI3HVy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 03:21:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:49806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725440AbgI3HVy (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 03:21:54 -0400
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2ABBC207F7;
        Wed, 30 Sep 2020 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601450513;
        bh=4a1eMMEYAX2Q7JPaPum/diACL5G6etmpf/ER/kUFzFc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Czho7HwzyRF7Mi48JpASgGht5fus9HLOx2UtQvXNOkPDnaSEBx+TWZ+wFvlgJs1iu
         Cgi7EgdS10NBr4lKOTxku/InGl1nIa4iKqgOvtLqu/FoZroJZiDCeS+7+qA7K2a+h/
         p9Hyi7SAimqApMkz3cieHJAvh6ankpC/7KaoolxY=
Received: by mail-ej1-f52.google.com with SMTP id qp15so370386ejb.3;
        Wed, 30 Sep 2020 00:21:53 -0700 (PDT)
X-Gm-Message-State: AOAM533HeHQfMPbPdoaD8ZC7tA/tZ/TG1xHAv1vmMfEA7bgSSp0vCc7u
        XscH7/eOLJeQ3Bo1jdujIK5rNvZEs8T/i7s0Eoc=
X-Google-Smtp-Source: ABdhPJyETPcYXIqZ2N+Xzy7w6ZTbtg26NVcWQiK3ImgKAugFHBNnmA6vP/uftFY/WRGJMfqhGWRbK3gSMphJ2OgouGE=
X-Received: by 2002:a17:906:1984:: with SMTP id g4mr1410359ejd.119.1601450511650;
 Wed, 30 Sep 2020 00:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200930003013.31289-1-nicoleotsuka@gmail.com> <20200930003013.31289-2-nicoleotsuka@gmail.com>
In-Reply-To: <20200930003013.31289-2-nicoleotsuka@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 30 Sep 2020 09:21:39 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeye7b0j1oB21JmBwc277_1RYWQ0SC0Otf+F62HK=sjjA@mail.gmail.com>
Message-ID: <CAJKOXPeye7b0j1oB21JmBwc277_1RYWQ0SC0Otf+F62HK=sjjA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] memory: tegra: Add helper function tegra_get_memory_controller
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 30 Sep 2020 at 02:35, Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> This can be used by both tegra-smmu and tegra20-devfreq drivers.
>
> Suggested-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>
> Changelog
> v1->v2
>  * N/A
>
>  drivers/memory/tegra/mc.c | 23 +++++++++++++++++++++++
>  include/soc/tegra/mc.h    |  1 +
>  2 files changed, 24 insertions(+)
>
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index ec8403557ed4..09352ad66dcc 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -42,6 +42,29 @@ static const struct of_device_id tegra_mc_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, tegra_mc_of_match);

> +struct tegra_mc *tegra_get_memory_controller(void)
> +{

Add kerneldoc and mention dropping of reference to the device after use.

Best regards,
Krzysztof

> +       struct platform_device *pdev;
> +       struct device_node *np;
> +       struct tegra_mc *mc;
> +
> +       np = of_find_matching_node_and_match(NULL, tegra_mc_of_match, NULL);
> +       if (!np)
> +               return ERR_PTR(-ENOENT);
> +
> +       pdev = of_find_device_by_node(np);
> +       of_node_put(np);
> +       if (!pdev)
> +               return ERR_PTR(-ENODEV);
> +
> +       mc = platform_get_drvdata(pdev);
> +       if (!mc)
> +               return ERR_PTR(-EPROBE_DEFER);
> +
> +       return mc;
> +}
> +EXPORT_SYMBOL_GPL(tegra_get_memory_controller);
> +
>  static int tegra_mc_block_dma_common(struct tegra_mc *mc,
>                                      const struct tegra_mc_reset *rst)
>  {
> diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
> index 1238e35653d1..c72718fd589f 100644
> --- a/include/soc/tegra/mc.h
> +++ b/include/soc/tegra/mc.h
> @@ -183,5 +183,6 @@ struct tegra_mc {
>
>  int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
>  unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
> +struct tegra_mc *tegra_get_memory_controller(void);
>
>  #endif /* __SOC_TEGRA_MC_H__ */
> --
> 2.17.1
>
