Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB2BC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Dec 2021 06:49:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbhLPGtb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Dec 2021 01:49:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbhLPGta (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Dec 2021 01:49:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82FC1C061574;
        Wed, 15 Dec 2021 22:49:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2220A61B2A;
        Thu, 16 Dec 2021 06:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB31BC36AE4;
        Thu, 16 Dec 2021 06:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639637369;
        bh=7bvL5hDSJ7fdSl4gbMctBcUCFh5zcS7vNHoxGI5MSo0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rR7NMNgHONWMJMJ/7b0ptVDtxIccYvBdtV/r6qwDBIX6fITBvEYAjgrdQ0gD+Eyyo
         VXzPvgc1aFeNz/O1H0X4FZItuoraxgNKY3+QRG88NTBZap79GfDt8HJM83Ciqus6Gl
         5KTVOHOiC1S7yeok57BVL5GxGpS/hOoGscyx8NWhUPH5/A7t9DNrSBALFw3KIthcDy
         mnpTavLOdPmWVHgHDoQQI3a8O1GGaQ6Rwr6LS26ciE8fVlZjkjnDo/A16T3wPBqKi5
         l8QGlOX06Xa1QDnpzvr56gaQiHR066cgjHj8YjVnxpWojfbVFSyuHqdeuKWxXIEyo2
         tPejS3DfsCszg==
Date:   Thu, 16 Dec 2021 14:49:23 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
Cc:     robh+dt@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, qiangqing.zhang@nxp.com
Subject: Re: [PATCH v2] arm64: dts: imx8mp-evk: configure multiple queues on
 eqos
Message-ID: <20211216064922.GW4216@dragon>
References: <20211213044546.9903-1-xiaoliang.yang_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213044546.9903-1-xiaoliang.yang_1@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Dec 13, 2021 at 12:45:46PM +0800, Xiaoliang Yang wrote:
> Eqos ethernet support five queues on hardware, enable these queues and
> configure the priority of each queue. Uses Strict Priority as scheduling
> algorithms to ensure that the TSN function works.
> 
> The priority of each queue is a bitmask value that maps VLAN tag
> priority to the queue. Since the hardware only supports five queues,
> this patch maps priority 0-4 to queues one by one, and priority 5-7 to
> queue 4.
> 
> The total fifo size of 5 queues is 8192 bytes, if enable 5 queues with
> store-and-forward mode, it's not enough for large packets, which would
> trigger fifo overflow frequently. This patch set DMA to thresh mode to
> enable all 5 queues.
> 
> Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 57 ++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index 7b99fad6e4d6..e4c69594f067 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -86,6 +86,9 @@
>  	pinctrl-0 = <&pinctrl_eqos>;
>  	phy-mode = "rgmii-id";
>  	phy-handle = <&ethphy0>;
> +	snps,force_thresh_dma_mode;
> +	snps,mtl-tx-config = <&mtl_tx_setup>;
> +	snps,mtl-rx-config = <&mtl_rx_setup>;
>  	status = "okay";
>  
>  	mdio {
> @@ -99,6 +102,60 @@
>  			eee-broken-1000t;
>  		};
>  	};
> +
> +	mtl_tx_setup: tx-queues-config {
> +		snps,tx-queues-to-use = <5>;
> +		snps,tx-sched-sp;

Please have a newline between properties and child node ...

> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x1>;
> +		};

... and also between nodes.

> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x2>;
> +		};
> +		queue2 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x4>;
> +		};
> +		queue3 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x8>;
> +		};
> +		queue4 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0xf0>;
> +		};
> +	};

Ditto

Shawn

> +	mtl_rx_setup: rx-queues-config {
> +		snps,rx-queues-to-use = <5>;
> +		snps,rx-sched-sp;
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x1>;
> +			snps,map-to-dma-channel = <0>;
> +		};
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x2>;
> +			snps,map-to-dma-channel = <1>;
> +		};
> +		queue2 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x4>;
> +			snps,map-to-dma-channel = <2>;
> +		};
> +		queue3 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x8>;
> +			snps,map-to-dma-channel = <3>;
> +		};
> +		queue4 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0xf0>;
> +			snps,map-to-dma-channel = <4>;
> +		};
> +	};
>  };
>  
>  &fec {
> -- 
> 2.17.1
> 
