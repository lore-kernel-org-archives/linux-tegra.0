Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2911BCD37B4
	for <linux-tegra@archiver.kernel.org>; Sun, 17 Sep 2023 14:44:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbjIQOoC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 17 Sep 2023 10:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbjIQOnp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 17 Sep 2023 10:43:45 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCF612D;
        Sun, 17 Sep 2023 07:43:39 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2bf5bf33bcdso61986991fa.0;
        Sun, 17 Sep 2023 07:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694961817; x=1695566617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdaEbu6km8BqHRGwr2c7GCk1sImwIY5D3Zm1fNqAyQY=;
        b=g4dXHim1raAiDs+KEYBEtZnPenTcf/6UxkrN0AWYPowHIw113akz1ZkLbRrly/mhiI
         YcJ6jaOCKO5CLAMp5HNKuKyFdrEfYdRzc6vVCRHfZ2IhS1wZlUSIDSztVTpngsMq9VS6
         /oaKzK8xW3w+v7dJqFZ4zPiqgJ4IdlUSyGB1RZcb+X8g6o4HqCIHhIEhOzM7V2umov1E
         Ab6a7LIJwnoRvdAAjqHnhh9T781Kzoif/OYExfDfjEdfj7nsqTB8739h4KynWy3jSdyg
         BohEb4hQzs1eHZKSaLdDA8yhDEz+zrPmtMvbVbI5DjznTl8qS8BaCwkUbFF+rQ5UDWZc
         vQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694961817; x=1695566617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdaEbu6km8BqHRGwr2c7GCk1sImwIY5D3Zm1fNqAyQY=;
        b=GnSKhbisv33Gis6lKY/M6HF0JmBT3mDqREx2vsWJWEKA9f+jn4sBKD/nriJ1NxZu2I
         1pcLWP5eQ6WHpf/AN1v0qucLTSB4gYbY3C4u3uU3toBsawIEk4nKsmsZM/Dwo/JfAqyZ
         UVbCm7gGstQaGSnnh3857t33EkH4agAUqnAEPMRmLdihmIW1P1jp1++830Gpel4oDo5F
         2YMrYgfnNwdeVmiBeMJ/8jn9RlJVd1Ew3Bzuby0CAfsTWoTF2hu0Rt6PaVTRTdDRPUzq
         DPwro3Bqp0/5ti2mh0ENlPY7FEz/ksU9gpITkHiIaef5DdRl4RkcWkV5cj8NysEJ2sqW
         tw0g==
X-Gm-Message-State: AOJu0YxQNrlfxhm3LRJ0Dt/gIxwx8ExBQ9QFXtU3UJDG+Br3Cmvm1AK/
        XIk3E7uaobpJTQ4edc+kjRQ=
X-Google-Smtp-Source: AGHT+IEJIeAd3ewMw2+cvZVpanMlw/F0SbFIvtkFqTZ0ddrwDnzgxXx7HQKIxO9egvEEZV79PvH9eA==
X-Received: by 2002:a2e:9409:0:b0:2bd:1bca:ebee with SMTP id i9-20020a2e9409000000b002bd1bcaebeemr5200667ljh.19.1694961816913;
        Sun, 17 Sep 2023 07:43:36 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-123-246-155-gprs.simobil.net. [46.123.246.155])
        by smtp.gmail.com with ESMTPSA id x8-20020a1709065ac800b0099bccb03eadsm4998862ejs.205.2023.09.17.07.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 07:43:36 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Samin Guo <samin.guo@starfivetech.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Russell King <linux@armlinux.org.uk>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Jisheng Zhang <jszhang@kernel.org>
Cc:     netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 19/23] net: stmmac: dwmac-sunxi: use
 devm_stmmac_probe_config_dt()
Date:   Sun, 17 Sep 2023 16:43:33 +0200
Message-ID: <5714209.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230916075829.1560-20-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
 <20230916075829.1560-20-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Dne sobota, 16. september 2023 ob 09:58:25 CEST je Jisheng Zhang napisal(a):
> Simplify the driver's probe() function by using the devres
> variant of stmmac_probe_config_dt().
> 
> The remove_new() callback now needs to be switched to
> stmmac_pltfr_remove_no_dt().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 25 +++++++------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c index
> beceeae579bf..b857235f5b1f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
> @@ -108,36 +108,31 @@ static int sun7i_gmac_probe(struct platform_device
> *pdev) if (ret)
>  		return ret;
> 
> -	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat))
>  		return PTR_ERR(plat_dat);
> 
>  	gmac = devm_kzalloc(dev, sizeof(*gmac), GFP_KERNEL);
> -	if (!gmac) {
> -		ret = -ENOMEM;
> -		goto err_remove_config_dt;
> -	}
> +	if (!gmac)
> +		return -ENOMEM;
> 
>  	ret = of_get_phy_mode(dev->of_node, &gmac->interface);
>  	if (ret && ret != -ENODEV) {
>  		dev_err(dev, "Can't get phy-mode\n");
> -		goto err_remove_config_dt;
> +		return ret;
>  	}
> 
>  	gmac->tx_clk = devm_clk_get(dev, "allwinner_gmac_tx");
>  	if (IS_ERR(gmac->tx_clk)) {
>  		dev_err(dev, "could not get tx clock\n");
> -		ret = PTR_ERR(gmac->tx_clk);
> -		goto err_remove_config_dt;
> +		return PTR_ERR(gmac->tx_clk);
>  	}
> 
>  	/* Optional regulator for PHY */
>  	gmac->regulator = devm_regulator_get_optional(dev, "phy");
>  	if (IS_ERR(gmac->regulator)) {
> -		if (PTR_ERR(gmac->regulator) == -EPROBE_DEFER) {
> -			ret = -EPROBE_DEFER;
> -			goto err_remove_config_dt;
> -		}
> +		if (PTR_ERR(gmac->regulator) == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
>  		dev_info(dev, "no regulator found\n");
>  		gmac->regulator = NULL;
>  	}
> @@ -155,7 +150,7 @@ static int sun7i_gmac_probe(struct platform_device
> *pdev)
> 
>  	ret = sun7i_gmac_init(pdev, plat_dat->bsp_priv);
>  	if (ret)
> -		goto err_remove_config_dt;
> +		return ret;
> 
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>  	if (ret)
> @@ -165,8 +160,6 @@ static int sun7i_gmac_probe(struct platform_device
> *pdev)
> 
>  err_gmac_exit:
>  	sun7i_gmac_exit(pdev, plat_dat->bsp_priv);
> -err_remove_config_dt:
> -	stmmac_remove_config_dt(pdev, plat_dat);
> 
>  	return ret;
>  }
> @@ -179,7 +172,7 @@ MODULE_DEVICE_TABLE(of, sun7i_dwmac_match);
> 
>  static struct platform_driver sun7i_dwmac_driver = {
>  	.probe  = sun7i_gmac_probe,
> -	.remove_new = stmmac_pltfr_remove,
> +	.remove_new = stmmac_pltfr_remove_no_dt,
>  	.driver = {
>  		.name           = "sun7i-dwmac",
>  		.pm		= &stmmac_pltfr_pm_ops,




