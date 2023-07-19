Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD7CC001E0
	for <linux-tegra@archiver.kernel.org>; Wed, 19 Jul 2023 18:46:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbjGSSqG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 Jul 2023 14:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbjGSSqF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Jul 2023 14:46:05 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D731BF6
        for <linux-tegra@vger.kernel.org>; Wed, 19 Jul 2023 11:46:03 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fba86f069bso11964332e87.3
        for <linux-tegra@vger.kernel.org>; Wed, 19 Jul 2023 11:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1689792361; x=1692384361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8P6p5GxD+C7LfK4xTVAmdgfr7J5QiZZmSr+c4qR0eQ4=;
        b=PNHMPmfGkc1gL3s+kuZsOV06iS0AVcua9wceAmdSEpVaau8usQXOmlxuVajPoqahSZ
         oXCeyXW3i7qO4gPQC3/B5Lo5Eqmi2HM4U13eYxzJby4ZFd5uR2kFc8wjOiArIEd55PBA
         FeCJue+xZBMErbY8RHL9QpZivP+scZ+Uhv+xiPlfw+QmU/c+xu8cJYkIrMEc/MG7elAK
         qWZ83FR4V9wLcNgcODc1mJlKxSJnwdLewAg5rcPN0PhCf2e09w5V1Bp1xL5H141MnfFQ
         Zld3xPSZJnzYVXtM2wQmsSZTU5Qt4Z0CaW8ampG4BzUMYrnqq3UfbUoP7KRh6XWbjalG
         17Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689792361; x=1692384361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8P6p5GxD+C7LfK4xTVAmdgfr7J5QiZZmSr+c4qR0eQ4=;
        b=KfvgaAx9pMHiXI6eQey9uU0BwWFWnif3xQaZHsbhE1kP4yTVNXNfAEhhj35F+OIIZH
         Qj2NvMdxKdYCZarMX4k1iMwrk4lKoKDOwumbDWqrkAXO3QEH7doruyeYElx6hOAXZSrX
         gf5L93n+HQORhloQUrE+oJfoDd6e4ai6EdPrTbXnMfeefhzMEsIhLSwkC5owm9uK/JHY
         SrVSennw2p0Rbixl0HZhHCGJh8sqSWSYY69RdJ49Dcv5iJVMp6nt3Mhx3MkD6Dd9tWw5
         7xO0B/pP9zpoSvcz65B3lUMYUM/PZ4KHRh92gcahBwWMCWEigWU6/GSXSIooPimpRaM6
         mz8Q==
X-Gm-Message-State: ABy/qLYNN/VN6aj/mBjS6Fez9g+maegXZFxZZUcKo5tPu3bpj6IHwvkK
        emEWkAkWyYwrzaf2O/Z0cER0/A==
X-Google-Smtp-Source: APBJJlFtrWyQNURr4DI24Yfx+KhHtEnbcs8mZXCEdNLSvmMP4IixrdRQLU+06NloRR7Z4XxkYEDlqQ==
X-Received: by 2002:a05:6512:250f:b0:4fb:8de9:ac0e with SMTP id be15-20020a056512250f00b004fb8de9ac0emr607490lfb.1.1689792361237;
        Wed, 19 Jul 2023 11:46:01 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id m8-20020ac24248000000b004fbad6bc93dsm1057209lfl.136.2023.07.19.11.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 11:46:00 -0700 (PDT)
Date:   Wed, 19 Jul 2023 20:45:59 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Rob Herring <robh@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Riesch <michael.riesch@wolfvision.net>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Ming Qian <ming.qian@nxp.com>, Shijie Qin <shijie.qin@nxp.com>,
        Zhou Peng <eagle.zhou@nxp.com>,
        Eddie James <eajames@linux.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Krz ysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Benoit Parrot <bparrot@ti.com>, Sean Young <sean@mess.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
        linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] media: Explicitly include correct DT includes
Message-ID: <ZLgvZ2ao1tgrRlFu@oden.dyn.berto.se>
References: <20230718143118.1065743-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230718143118.1065743-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Rob,

On 2023-07-18 08:31:14 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
> - Fix double include of of.h
> ---

For,

>  drivers/media/platform/renesas/rcar-isp.c                     | 2 +-
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c           | 1 -
>  drivers/media/platform/renesas/rcar-vin/rcar-csi2.c           | 1 -

Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
