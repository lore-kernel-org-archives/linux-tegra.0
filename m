Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C05EB64D7
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Jun 2023 20:12:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbjFUUM1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Jun 2023 16:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjFUUM0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Jun 2023 16:12:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFEC41994;
        Wed, 21 Jun 2023 13:12:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6ADC7616BF;
        Wed, 21 Jun 2023 20:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1674C433C8;
        Wed, 21 Jun 2023 20:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687378344;
        bh=8RXgYeONVucyquW4A3CflngjSvC4JEQrRvUxtAhm7HA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HluFPHhN5+SHUh/irMDQj0oGOleU+xATOkRWi+GmjbDeIE6sGPwiSLqeozIXyD8Ed
         00oacTdK55HACZf0v3FAPpjYkUbeciFTToOHTnazkPCp/VP3UMUR/IinxZ80uizWeV
         PUi4/n8PbTKupr3afYHg3EmdRqCMWhksgAzHc3epQKfOG0H6mfxHdSm91241Nco/1E
         Um5GOtfegPeC9Ls08dhKZ3MZkmd+i3RygrJWpKoO8Aw/ulsxgLPJDOmsQ4/wcNmYf+
         vxL5XI1ZkXGZBBOrszxV+u1IN5oQohQN5ZJ+3bRZlP4hjjSX03JwdxjXGTd/BfrLxR
         UuoRnT7oi89IQ==
Date:   Wed, 21 Jun 2023 13:12:22 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next 00/12] net: stmmac: replace boolean fields in
 plat_stmmacenet_data with flags
Message-ID: <20230621131222.071b9fc3@kernel.org>
In-Reply-To: <20230621182558.544417-1-brgl@bgdev.pl>
References: <20230621182558.544417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 21 Jun 2023 20:25:46 +0200 Bartosz Golaszewski wrote:
> As suggested by Jose Abreu: let's drop all 12 boolean fields in
> plat_stmmacenet_data and replace them with a common bitfield.

Is that what Jose meant, or:

-	bool has_integrated_pcs;
+	u32 has_integrated_pcs:1;

?
