Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CB9C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 04:34:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhLMEeO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Dec 2021 23:34:14 -0500
Received: from inva021.nxp.com ([92.121.34.21]:46214 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231620AbhLMEeO (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Dec 2021 23:34:14 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C5DDA20061A;
        Mon, 13 Dec 2021 05:34:12 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8C9DA200616;
        Mon, 13 Dec 2021 05:34:12 +0100 (CET)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 133EC183AC4C;
        Mon, 13 Dec 2021 12:34:10 +0800 (+08)
From:   Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, qiangqing.zhang@nxp.com,
        xiaoliang.yang_1@nxp.com
Subject: [PATCH v2] arm64: dts: imx8mp-evk: configure multiple queues on eqos
Date:   Mon, 13 Dec 2021 12:45:46 +0800
Message-Id: <20211213044546.9903-1-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Eqos ethernet support five queues on hardware, enable these queues and
configure the priority of each queue. Uses Strict Priority as scheduling
algorithms to ensure that the TSN function works.

The priority of each queue is a bitmask value that maps VLAN tag
priority to the queue. Since the hardware only supports five queues,
this patch maps priority 0-4 to queues one by one, and priority 5-7 to
queue 4.

The total fifo size of 5 queues is 8192 bytes, if enable 5 queues with
store-and-forward mode, it's not enough for large packets, which would
trigger fifo overflow frequently. This patch set DMA to thresh mode to
enable all 5 queues.

Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 57 ++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 7b99fad6e4d6..e4c69594f067 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -86,6 +86,9 @@
 	pinctrl-0 = <&pinctrl_eqos>;
 	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy0>;
+	snps,force_thresh_dma_mode;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,mtl-rx-config = <&mtl_rx_setup>;
 	status = "okay";
 
 	mdio {
@@ -99,6 +102,60 @@
 			eee-broken-1000t;
 		};
 	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <5>;
+		snps,tx-sched-sp;
+		queue0 {
+			snps,dcb-algorithm;
+			snps,priority = <0x1>;
+		};
+		queue1 {
+			snps,dcb-algorithm;
+			snps,priority = <0x2>;
+		};
+		queue2 {
+			snps,dcb-algorithm;
+			snps,priority = <0x4>;
+		};
+		queue3 {
+			snps,dcb-algorithm;
+			snps,priority = <0x8>;
+		};
+		queue4 {
+			snps,dcb-algorithm;
+			snps,priority = <0xf0>;
+		};
+	};
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <5>;
+		snps,rx-sched-sp;
+		queue0 {
+			snps,dcb-algorithm;
+			snps,priority = <0x1>;
+			snps,map-to-dma-channel = <0>;
+		};
+		queue1 {
+			snps,dcb-algorithm;
+			snps,priority = <0x2>;
+			snps,map-to-dma-channel = <1>;
+		};
+		queue2 {
+			snps,dcb-algorithm;
+			snps,priority = <0x4>;
+			snps,map-to-dma-channel = <2>;
+		};
+		queue3 {
+			snps,dcb-algorithm;
+			snps,priority = <0x8>;
+			snps,map-to-dma-channel = <3>;
+		};
+		queue4 {
+			snps,dcb-algorithm;
+			snps,priority = <0xf0>;
+			snps,map-to-dma-channel = <4>;
+		};
+	};
 };
 
 &fec {
-- 
2.17.1

