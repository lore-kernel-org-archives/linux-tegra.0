Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEE7C46CA1
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Sep 2023 11:51:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237827AbjIRLu6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 18 Sep 2023 07:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241761AbjIRLui (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Sep 2023 07:50:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D503E6
        for <linux-tegra@vger.kernel.org>; Mon, 18 Sep 2023 04:50:30 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAD37C433C7;
        Mon, 18 Sep 2023 11:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695037829;
        bh=oT5snbuM6TfIDJhxJsWR/PSxNRbw+iiiuFc7Xp3a8+I=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=uZ7FGpqOOOW4QGMAG4E31OhORIcesAUkf7+AMd+dsPzh46DiEGuFjAIIhigCjpVJL
         DwbZLMUVDePIq6nrbjOfTbzXtettFFgIyY2rnnqxkUb/zAQgp+ndayV41JWxb1zLMo
         AbI3ombnz9obEikffx68Z0fVqGGNkZQKYCDV1P39O8JxfbAfmD/97IyEGrtWpqGfsP
         5sR9Uc4vWEZJBRM/S+0t5Q8N7s9KRKP6pCpKx6h60qwQV1CKH3ulLO4OQM8TnaNqdb
         K5zs590+yp6+YrY9ggF3Ph/91j0zolaKDFIYLi5JTOTbhB+mIXrp/jkzKzlYTTCB0Q
         EXB1uzYcbpgnw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B4871E11F41;
        Mon, 18 Sep 2023 11:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 00/22] convert to devm_stmmac_probe_config_dt
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169503782973.2272.13506822186977436052.git-patchwork-notify@kernel.org>
Date:   Mon, 18 Sep 2023 11:50:29 +0000
References: <20230916075829.1560-1-jszhang@kernel.org>
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
To:     Jisheng Zhang <jszhang@kernel.org>
Cc:     peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
        joabreu@synopsys.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, vz@mleia.com,
        neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        kernel@esmil.dk, samin.guo@starfivetech.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        thierry.reding@gmail.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        linux@armlinux.org.uk, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Sat, 16 Sep 2023 15:58:06 +0800 you wrote:
> Russell pointed out there's a new devm_stmmac_probe_config_dt()
> helper now when reviewing my starfive gmac error handling patch[1].
> After greping the code, this nice helper was introduced by Bartosz in
> [2], I think it's time to convert all dwmac users to this helper and
> finally complete the TODO in [2] "but once all users of the old
> stmmac_pltfr_remove() are converted to the devres helper, it will be
> renamed back to stmmac_pltfr_remove() and the no_dt function removed."
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/23] net: stmmac: dwmac-anarion: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/6f799fd9dda7
  - [net-next,v2,02/23] net: stmmac: dwmac-dwc-qos-eth: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/0485825dd6a8
  - [net-next,v2,03/23] net: stmmac: dwmac-generic: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/d53b19d2a1a8
  - [net-next,v2,04/23] net: stmmac: dwmac-generic: use devm_stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/14ec0fc582c5
  - [net-next,v2,05/23] net: stmmac: dwmac-imx: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/115c9248b19b
  - [net-next,v2,06/23] net: stmmac: dwmac-ingenic: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/6bb53b2abf30
  - [net-next,v2,07/23] net: stmmac: dwmac-intel-plat: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/abea8fd5e801
  - [net-next,v2,08/23] net: stmmac: dwmac-ipq806x: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/72ab86c27d4e
  - [net-next,v2,09/23] net: stmmac: dwmac-lpc18xx: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/d30c08a3b001
  - [net-next,v2,10/23] net: stmmac: dwmac-mediatek: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/d7209c056a49
  - [net-next,v2,11/23] net: stmmac: dwmac-meson: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/780b63ae208e
  - [net-next,v2,12/23] net: stmmac: dwmac-meson8b: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/551022d680ec
  - [net-next,v2,13/23] net: stmmac: dwmac-rk: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/8eee20e10d6f
  - [net-next,v2,14/23] net: stmmac: dwmac-socfpga: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/9086d3f2b560
  - [net-next,v2,15/23] net: stmmac: dwmac-starfive: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/6d6c11937359
  - [net-next,v2,16/23] net: stmmac: dwmac-sti: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/c9445e0bd729
  - [net-next,v2,17/23] net: stmmac: dwmac-stm32: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/373845154618
  - [net-next,v2,18/23] net: stmmac: dwmac-sun8i: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/9bdf6909877c
  - [net-next,v2,19/23] net: stmmac: dwmac-sunxi: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/291595337626
  - [net-next,v2,20/23] net: stmmac: dwmac-tegra: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/acf73ccff08e
  - [net-next,v2,21/23] net: stmmac: dwmac-visconti: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/d336a117b593
  - [net-next,v2,22/23] net: stmmac: rename stmmac_pltfr_remove_no_dt to stmmac_pltfr_remove
    https://git.kernel.org/netdev/net-next/c/2c9fc838067b
  - [net-next,v2,23/23] net: stmmac: make stmmac_{probe|remove}_config_dt static
    https://git.kernel.org/netdev/net-next/c/b2504f649bda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


