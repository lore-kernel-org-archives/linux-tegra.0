Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2446C54EAA
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 12:57:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbjAXM5w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 07:57:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233906AbjAXM5t (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 07:57:49 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F263C65A6
        for <linux-tegra@vger.kernel.org>; Tue, 24 Jan 2023 04:57:46 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id z13so14623068plg.6
        for <linux-tegra@vger.kernel.org>; Tue, 24 Jan 2023 04:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pHDwofD6SNKiSG9J7TUSJkrmFZQrL5w821eu/p8EPRU=;
        b=iPN6ih9dkMLk+5Z2aO/raD5la104GDCNl3CCUgRjXeNfrMc1eRRQLX+rW/a5QmZO+m
         B5bXAwh1T1YLSp3rlbm8FEnva/gJP3n3OZYoMOG77PVmiWJagWclMj6tHYAK+pMUsXE6
         +CjNrIrurjl+60nhpqO6rp6LooQAlirhjPvvmRM3LPQ4rAOOyT2ZBxeOjwqYIlfhL4lE
         CDYW1321n16C9CBrp3BhFS1Jp1ctyQTPyCxk6dKfdcYO6VyAQqB06pX4VPHDdtvEHyJp
         6Q3bbPNirD14g9/iLGGTr5bZQBj6ZQGdhdG6dDIzD6wr1RuFw1GLdUgOA8PWfnMm1Ojg
         KrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHDwofD6SNKiSG9J7TUSJkrmFZQrL5w821eu/p8EPRU=;
        b=7DT9HQcmLii+6WFr2Qeddl+X1dNSbDZo82tE4Gm7iJG6u2mfVS7uOHY0IJC8HtV7bk
         A7gq5nRIQVeefVMWQ+lUg4/u2HpG7pXIiyDG59q2RCJlGIRQa+9j+8YsVjYeUfVijC3W
         UUIy7hOfs2djTMKan9hupd1STTzcMTQip8pZvytXqzEVNVdKVcY3lSoSelCbZ83lh6se
         N+kHVzMxvCE60Xm+rLu5W23hA12FlfyCW7IA2uJTLusE+4CNRu3/lIRYYKZT8YigN2/m
         Nt9YogWr7X5ePN0LO2p5yK8bJb0d9jcOFsT1ijhkmLIhlLE3A3QREkntVZqD2ZA7f5R7
         Bniw==
X-Gm-Message-State: AFqh2kp7t/5cHgztLMIsoDsdm/MhXApExFKA7+117f01T6N/iuMaEOSD
        waL8LTVH/2FHqo9Cwb7zqZkNFzBLI9qMJrsycj5QMg==
X-Google-Smtp-Source: AMrXdXsXrzgXKblU35lGXnG8geMzqwtmylKWGg/S46lL+qzXF/CIo+TO3fVEgZ6gox2a0BBdn7y53nUVeSWujIcNZtM=
X-Received: by 2002:a17:90a:730a:b0:229:7d95:a476 with SMTP id
 m10-20020a17090a730a00b002297d95a476mr3744415pjk.84.1674565066523; Tue, 24
 Jan 2023 04:57:46 -0800 (PST)
MIME-Version: 1.0
References: <20230120085722.171965-1-krzysztof.kozlowski@linaro.org> <20230120085722.171965-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120085722.171965-2-krzysztof.kozlowski@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 24 Jan 2023 13:57:09 +0100
Message-ID: <CAPDyKFraR3BNa4874S4ZVHxTQNZWuSVOOpbGZ_Vnzfwe3ik7=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: mmc: correct pwrseq node names
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tony Huang <tonyhuang.sunplus@gmail.com>,
        Li-hao Kuo <lhjeff911@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Markus Pargmann <mpa@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-actions@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 20 Jan 2023 at 09:57, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Node names should be generic and should not contain underscores.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml   | 2 +-
>  Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml | 2 +-
>  Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml
> index 911a5996e099..588be73168fa 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml
> @@ -41,7 +41,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> -    sdhci0_pwrseq {
> +    pwrseq {
>        compatible = "mmc-pwrseq-emmc";
>        reset-gpios = <&gpio1 12 GPIO_ACTIVE_LOW>;
>      };
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml
> index 3397dbff88c2..b35e00e8c65e 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml
> @@ -35,7 +35,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> -    wifi_pwrseq: wifi_pwrseq {
> +    pwrseq {
>        compatible = "mmc-pwrseq-sd8787";
>        powerdown-gpios = <&twl_gpio 0 GPIO_ACTIVE_LOW>;
>        reset-gpios = <&twl_gpio 1 GPIO_ACTIVE_LOW>;
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml
> index 64e3644eefeb..00feaafc1063 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml
> @@ -55,7 +55,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> -    sdhci0_pwrseq {
> +    pwrseq {
>        compatible = "mmc-pwrseq-simple";
>        reset-gpios = <&gpio1 12 GPIO_ACTIVE_LOW>;
>        clocks = <&clk_32768_ck>;
> --
> 2.34.1
>
