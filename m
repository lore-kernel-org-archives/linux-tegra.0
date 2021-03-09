Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CBBC433DB
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Mar 2021 14:42:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A497265243
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Mar 2021 14:42:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbhCIOmY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 9 Mar 2021 09:42:24 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:45197 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbhCIOmD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 9 Mar 2021 09:42:03 -0500
Received: from mwalle01.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 3F2AB2223A;
        Tue,  9 Mar 2021 15:42:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1615300922;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G77sUYs1EAeHVxP/hlKiAiqXQYIKCpapQrEwbpPNVXg=;
        b=s6iNLsfrWa87KzmdWW3KpGsdd9SzT0AD36yQr0f8FQy9+zO1LtxAk2bg0nRM12wqfp99L6
        YJ9gFMvAv7v/0lwzsukNxRLWOVQX100QsgNbePJ/M2etAOD0/nbTMSAOxXILihMwG31xwt
        mjhup/PqHo5iS4Gd6O1Dfk9XKtUddec=
From:   Michael Walle <michael@walle.cc>
To:     spujar@nvidia.com
Cc:     alsa-devel@alsa-project.org, broonie@kernel.org,
        devicetree@vger.kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, robh@kernel.org, sharadg@nvidia.com,
        thierry.reding@gmail.com
Subject: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
Date:   Tue,  9 Mar 2021 15:41:56 +0100
Message-Id: <20210309144156.18887-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

> If "clocks = <&xxx>" is specified from the CPU or Codec component
> device node, the clock is not getting enabled. Thus audio playback
> or capture fails.
> 
> Fix this by populating "simple_dai->clk" field when clocks property
> is specified from device node as well. Also tidy up by re-organising
> conditional statements of parsing logic.
> 
> Fixes: bb6fc620c2ed ("ASoC: simple-card-utils: add asoc_simple_card_parse_clk()")
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>

This actually breaks sound on my board
(arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts).
The codec on this board (wm8904) has a fixed clock input (only distinct
frequencies are supported) and uses the FLL of the codec to generate the
desired sample rate.

It seems that after this patch the clock rate of the codecs clock (rather
than the FLL) is tried to be changed. Which fails, because it doesn't
support arbitrary frequencies.

-michael

> ---
>  sound/soc/generic/simple-card-utils.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
> index bc0b62e..0754d70 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c
> @@ -173,16 +173,15 @@ int asoc_simple_parse_clk(struct device *dev,
>  	 *  or device's module clock.
>  	 */
>  	clk = devm_get_clk_from_child(dev, node, NULL);
> -	if (!IS_ERR(clk)) {
> -		simple_dai->sysclk = clk_get_rate(clk);
> +	if (IS_ERR(clk))
> +		clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
>  
> +	if (!IS_ERR(clk)) {
>  		simple_dai->clk = clk;
> -	} else if (!of_property_read_u32(node, "system-clock-frequency", &val)) {
> +		simple_dai->sysclk = clk_get_rate(clk);
> +	} else if (!of_property_read_u32(node, "system-clock-frequency",
> +					 &val)) {
>  		simple_dai->sysclk = val;
> -	} else {
> -		clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
> -		if (!IS_ERR(clk))
> -			simple_dai->sysclk = clk_get_rate(clk);
>  	}
>  
>  	if (of_property_read_bool(node, "system-clock-direction-out"))
> -- 
> 2.7.4
> 
> 
