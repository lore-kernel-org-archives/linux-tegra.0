Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEE7C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Dec 2021 10:27:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233395AbhLPK1j (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Dec 2021 05:27:39 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:26104 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233409AbhLPK1j (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Dec 2021 05:27:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1639650459; x=1671186459;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rMUU77kdFzlIi//vNRUMTj7Dozk89n2E2M03rivFdlo=;
  b=PGjkzZe+iE4Jbtj6VK3ADtMdCj0KlQ8a2OS/b+puNpLuu3bEcwvWCZGH
   7Y4VYwePDXgeCzYY32LppqVFPwCrR7UI1VuI3Shxu4qJRmz9cHnCQC23r
   uqnSeJVd3tkFvnP8G3P/uSB5SvwWDcsCvorxelkHgKGGnQxYqBiJ9LI08
   1TaoMm3PESM5SvDvJ28/lcs7R41rwgjn4yRQkNKcfMy+Wlxya6Xypiudl
   rMnXl6wKF7DyGWB6PpMwmdKDZMtzhkAfN6QkLViRNySS/RWz/4mlqlXEn
   fa7ArM/hQBW/8nj0vlTULaqMzLjDOWHr8kioX/nm+ClCouy2dcPJ4dALe
   w==;
X-IronPort-AV: E=Sophos;i="5.88,211,1635199200"; 
   d="scan'208";a="21092508"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Dec 2021 11:27:38 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 16 Dec 2021 11:27:38 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 16 Dec 2021 11:27:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1639650458; x=1671186458;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rMUU77kdFzlIi//vNRUMTj7Dozk89n2E2M03rivFdlo=;
  b=L67TQUZzrWxsYcUm2OEdUlLvXCv8MJxXvAvHHrv6tt38HcNqqcHPuv7/
   ABfpzSirpovr6/XHogbr+psy2BE2pl2hxvE7xlJfVdU6LC6b5xukZKB8i
   FvVmmj1w6NW2iTaa/bW/bsQccMi7qoOOyKjsF/J2bJ6Xpaf9fRKaLObli
   jDpwhbB7c2D6KDNxY7j+sEaJG/CSDsLb2+FVE2iez1nsD12cqsplutQmu
   dp/wO6pJzLb5rRH6YbcCHWFIyh2SKUFC/2Ub+Wh6aSFwg3W6Yb69WCCHm
   srm3LIrue/dlArcWPSZKnDAYuTEw9vzVk4aPiFMC/15TbORuUWS/TWG9B
   g==;
X-IronPort-AV: E=Sophos;i="5.88,211,1635199200"; 
   d="scan'208";a="21092507"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Dec 2021 11:27:38 +0100
Received: from steina-w (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D9BD5280065;
        Thu, 16 Dec 2021 11:27:37 +0100 (CET)
Message-ID: <edc76a76d0d65038ea1494004c7c4bba0068f88a.camel@ew.tq-group.com>
Subject: Re: (EXT) [PATCH v3] arm64: dts: imx8mp-evk: configure multiple
 queues on eqos
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Xiaoliang Yang <xiaoliang.yang_1@nxp.com>, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, qiangqing.zhang@nxp.com
Date:   Thu, 16 Dec 2021 11:27:35 +0100
In-Reply-To: <20211216092448.35927-1-xiaoliang.yang_1@nxp.com>
References: <20211216092448.35927-1-xiaoliang.yang_1@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Am Donnerstag, dem 16.12.2021 um 17:24 +0800 schrieb Xiaoliang Yang:
> Eqos ethernet support five queues on hardware, enable these queues
> and
> configure the priority of each queue. Uses Strict Priority as
> scheduling
> algorithms to ensure that the TSN function works.
> 
> The priority of each queue is a bitmask value that maps VLAN tag
> priority to the queue. Since the hardware only supports five queues,
> this patch maps priority 0-4 to queues one by one, and priority 5-7
> to
> queue 4.
> 
> The total fifo size of 5 queues is 8192 bytes, if enable 5 queues
> with
> store-and-forward mode, it's not enough for large packets, which
> would
> trigger fifo overflow frequently. This patch set DMA to thresh mode
> to
> enable all 5 queues.

Is there a specific reason to configure this only on board-level but
not for all imx8mp in general?

Thanks
Alexander

> Signed-off-by: Xiaoliang Yang <
> xiaoliang.yang_1@nxp.com
> >
> Reviewed-by: Joakim Zhang <
> qiangqing.zhang@nxp.com
> >
> ---
> v1->v2:
>  - Use bitmask to set priority attributes.
>  - Add default properties for each queue.
>  - Add CC to the maintainers.
> v2->v3:
>  - Add newline between properties and child node.
> 
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 68
> ++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index 7b99fad6e4d6..6fd1376258db 100644
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
> @@ -99,6 +102,71 @@
>  			eee-broken-1000t;
>  		};
>  	};
> +
> +	mtl_tx_setup: tx-queues-config {
> +		snps,tx-queues-to-use = <5>;
> +		snps,tx-sched-sp;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x1>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x2>;
> +		};
> +
> +		queue2 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x4>;
> +		};
> +
> +		queue3 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x8>;
> +		};
> +
> +		queue4 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0xf0>;
> +		};
> +	};
> +
> +	mtl_rx_setup: rx-queues-config {
> +		snps,rx-queues-to-use = <5>;
> +		snps,rx-sched-sp;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x1>;
> +			snps,map-to-dma-channel = <0>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x2>;
> +			snps,map-to-dma-channel = <1>;
> +		};
> +
> +		queue2 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x4>;
> +			snps,map-to-dma-channel = <2>;
> +		};
> +
> +		queue3 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x8>;
> +			snps,map-to-dma-channel = <3>;
> +		};
> +
> +		queue4 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0xf0>;
> +			snps,map-to-dma-channel = <4>;
> +		};
> +	};
>  };
>  
>  &fec {

