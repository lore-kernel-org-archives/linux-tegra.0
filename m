Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686B0C4741F
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 17:35:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D6F620872
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 17:35:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="DHYd4jxv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732795AbgJARfl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 13:35:41 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13371 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732569AbgJARfl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 13:35:41 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f7613060000>; Thu, 01 Oct 2020 10:33:58 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 17:35:35 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 1 Oct 2020 17:35:30 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 12/13] arm64: tegra: Audio graph header for Tegra210
Date:   Thu, 1 Oct 2020 23:03:06 +0530
Message-ID: <1601573587-15288-13-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601573638; bh=PkseXU5CbX2QuJJk9JxJcAxWfFj4JQqkJYM2vQ38KEw=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=DHYd4jxv8uvpZoRkbW/aR7sjTPdjQL+M2EeWksQB4Fmw1k0+jcpUta35uUk1PGzqy
         sDbscY3MijiEzD7VgIl/yEviMz0v/TRPsIM+oYq7eczbOpuotX1B9HYb1aNM26WRgK
         0d2zT9Uw7Ror08EuYAv8OGNbY13aL6bDOu9WWnFCpKQcIN+FDlunrQBsQEz7tpCi0K
         FnCWnrumjFPUNTznqCZC5N52/R5ABQmpEjGOqDfNHW1oYm+oRTX5yTJ1eat5YzXCfJ
         aK16YcLtHVwL3R6Py703WrHvBuhBa29fvrBhH0Og5WZnWP6nlKbrJl6aUSqv8GGWIO
         pweOID51qeFPQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Expose a header which describes DT bindings required to use audio-graph
based sound card. All Tegra210 based platforms can include this header
and add platform specific information. Currently, from SoC point of view,
all links are exposed for ADMAIF, AHUB, I2S and DMIC components.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
new file mode 100644
index 0000000..6287d28c
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	tegra_sound {
+		status = "disabled";
+
+		clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
+			 <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+		clock-names = "pll_a", "plla_out0";
+
+		assigned-clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
+				  <&tegra_car TEGRA210_CLK_PLL_A_OUT0>,
+				  <&tegra_car TEGRA210_CLK_EXTERN1>;
+		assigned-clock-parents = <0>, <0>, <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+		assigned-clock-rates = <368640000>, <49152000>, <12288000>;
+	};
+};
+
+&tegra_admaif {
+	admaif1_port: port@0 {
+		admaif1_ep: endpoint {
+			remote-endpoint = <&xbar_admaif1_ep>;
+		};
+	};
+	admaif2_port: port@1 {
+		admaif2_ep: endpoint {
+			remote-endpoint = <&xbar_admaif2_ep>;
+		};
+	};
+	admaif3_port: port@2 {
+		admaif3_ep: endpoint {
+			remote-endpoint = <&xbar_admaif3_ep>;
+		};
+	};
+	admaif4_port: port@3 {
+		admaif4_ep: endpoint {
+			remote-endpoint = <&xbar_admaif4_ep>;
+		};
+	};
+	admaif5_port: port@4 {
+		admaif5_ep: endpoint {
+			remote-endpoint = <&xbar_admaif5_ep>;
+		};
+	};
+	admaif6_port: port@5 {
+		admaif6_ep: endpoint {
+			remote-endpoint = <&xbar_admaif6_ep>;
+		};
+	};
+	admaif7_port: port@6 {
+		admaif7_ep: endpoint {
+			remote-endpoint = <&xbar_admaif7_ep>;
+		};
+	};
+	admaif8_port: port@7 {
+		admaif8_ep: endpoint {
+			remote-endpoint = <&xbar_admaif8_ep>;
+		};
+	};
+	admaif9_port: port@8 {
+		admaif9_ep: endpoint {
+			remote-endpoint = <&xbar_admaif9_ep>;
+		};
+	};
+	admaif10_port: port@9 {
+		admaif10_ep: endpoint {
+			remote-endpoint = <&xbar_admaif10_ep>;
+		};
+	};
+};
+
+&tegra_ahub {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0x0>;
+			xbar_admaif1_ep: endpoint {
+				remote-endpoint = <&admaif1_ep>;
+			};
+		};
+		port@1 {
+			reg = <0x1>;
+			xbar_admaif2_ep: endpoint {
+				remote-endpoint = <&admaif2_ep>;
+			};
+		};
+		port@2 {
+			reg = <0x2>;
+			xbar_admaif3_ep: endpoint {
+				remote-endpoint = <&admaif3_ep>;
+			};
+		};
+		port@3 {
+			reg = <0x3>;
+			xbar_admaif4_ep: endpoint {
+				remote-endpoint = <&admaif4_ep>;
+			};
+		};
+		port@4 {
+			reg = <0x4>;
+			xbar_admaif5_ep: endpoint {
+				remote-endpoint = <&admaif5_ep>;
+			};
+		};
+		port@5 {
+			reg = <0x5>;
+			xbar_admaif6_ep: endpoint {
+				remote-endpoint = <&admaif6_ep>;
+			};
+		};
+		port@6 {
+			reg = <0x6>;
+			xbar_admaif7_ep: endpoint {
+				remote-endpoint = <&admaif7_ep>;
+			};
+		};
+		port@7 {
+			reg = <0x7>;
+			xbar_admaif8_ep: endpoint {
+				remote-endpoint = <&admaif8_ep>;
+			};
+		};
+		port@8 {
+			reg = <0x8>;
+			xbar_admaif9_ep: endpoint {
+				remote-endpoint = <&admaif9_ep>;
+			};
+		};
+		port@9 {
+			reg = <0x9>;
+			xbar_admaif10_ep: endpoint {
+				remote-endpoint = <&admaif10_ep>;
+			};
+		};
+	};
+};
-- 
2.7.4

