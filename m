Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3092C4727E
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 17:35:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C633208C7
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 17:35:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="KDVNuZDL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732782AbgJARfq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 13:35:46 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18343 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732096AbgJARfq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 13:35:46 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f7613650003>; Thu, 01 Oct 2020 10:35:33 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 17:35:44 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 1 Oct 2020 17:35:39 +0000
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
Subject: [PATCH v3 13/13] arm64: tegra: Audio graph sound card for Jetson Nano and TX1
Date:   Thu, 1 Oct 2020 23:03:07 +0530
Message-ID: <1601573587-15288-14-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601573733; bh=FVCTJ/LjockOVXWhbR6LZEgg4awLPuvPGT0FAOMXvyE=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=KDVNuZDLJjpNyYXwTVztiqbm6E7/84pyostQnk2+Dc/PixpdG0N1MVZpnY7EusF6j
         +Wf2mkO6w8nXInPbcL6bAIaAMPBGJuudWhG//8nMA0/dyxyMc91TegPDOorGY3ykPu
         18VSrgmrjth4IAzPCJJzQQSX1Kr7tDu06G/h8nlT935XmOP49nP6xmKI3NPewOwJiA
         Y/fNyOjJliyewJ5GMaYdsk6xheCL8tVNFAsw/3vtK05B2suq4xmqfpmkPDg0ioeCX6
         33hnBMaDulbp+T1XXkrMx5QD+1DzbHRiVZG/9pAdTfzdywGFdKeKb0fIHDuN9Al2Zy
         Ht27tL339olUw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable support for audio-graph based sound card on Jetson-Nano and
Jetson-TX1. Depending on the platform, required I/O interfaces are
enabled.

 * Jetson-Nano: Enable I2S3, I2S4, DMIC1 and DMIC2.
 * Jetson-TX1: Enable all I2S and DMIC interfaces.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 219 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 124 ++++++++++++
 2 files changed, 343 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 4c9c2a0..1233d67 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -3,6 +3,7 @@
 
 #include "tegra210-p2180.dtsi"
 #include "tegra210-p2597.dtsi"
+#include "tegra210-audio-graph.dtsi"
 
 / {
 	model = "NVIDIA Jetson TX1 Developer Kit";
@@ -127,4 +128,222 @@
 			status = "okay";
 		};
 	};
+
+	tegra_sound {
+		status = "okay";
+
+		compatible = "nvidia,tegra210-audio-graph-card";
+
+		dais = /* FE */
+		       <&admaif1_port>, <&admaif2_port>, <&admaif3_port>,
+		       <&admaif4_port>, <&admaif5_port>, <&admaif6_port>,
+		       <&admaif7_port>, <&admaif8_port>, <&admaif9_port>,
+		       <&admaif10_port>,
+		       /* Router */
+		       <&xbar_i2s1_port>, <&xbar_i2s2_port>, <&xbar_i2s3_port>,
+		       <&xbar_i2s4_port>, <&xbar_i2s5_port>, <&xbar_dmic1_port>,
+		       <&xbar_dmic2_port>, <&xbar_dmic3_port>,
+		       /* I/O DAP Ports */
+		       <&i2s1_port>, <&i2s2_port>, <&i2s3_port>, <&i2s4_port>,
+		       <&i2s5_port>, <&dmic1_port>, <&dmic2_port>, <&dmic3_port>;
+
+		label = "jetson-tx1-ape";
+	};
+};
+
+&tegra_admaif {
+	status = "okay";
+};
+
+&tegra_ahub {
+	status = "okay";
+
+	ports {
+		xbar_i2s1_port: port@a {
+			reg = <0xa>;
+			xbar_i2s1_ep: endpoint {
+				remote-endpoint = <&i2s1_cif_ep>;
+			};
+		};
+		xbar_i2s2_port: port@b {
+			reg = <0xb>;
+			xbar_i2s2_ep: endpoint {
+				remote-endpoint = <&i2s2_cif_ep>;
+			};
+		};
+		xbar_i2s3_port: port@c {
+			reg = <0xc>;
+			xbar_i2s3_ep: endpoint {
+				remote-endpoint = <&i2s3_cif_ep>;
+			};
+		};
+		xbar_i2s4_port: port@d {
+			reg = <0xd>;
+			xbar_i2s4_ep: endpoint {
+				remote-endpoint = <&i2s4_cif_ep>;
+			};
+		};
+		xbar_i2s5_port: port@e {
+			reg = <0xe>;
+			xbar_i2s5_ep: endpoint {
+				remote-endpoint = <&i2s5_cif_ep>;
+			};
+		};
+		xbar_dmic1_port: port@f {
+			reg = <0xf>;
+			xbar_dmic1_ep: endpoint {
+				remote-endpoint = <&dmic1_cif_ep>;
+			};
+		};
+		xbar_dmic2_port: port@10 {
+			reg = <0x10>;
+			xbar_dmic2_ep: endpoint {
+				remote-endpoint = <&dmic2_cif_ep>;
+			};
+		};
+		xbar_dmic3_port: port@11 {
+			reg = <0x11>;
+			xbar_dmic3_ep: endpoint {
+				remote-endpoint = <&dmic3_cif_ep>;
+			};
+		};
+	};
+};
+
+&tegra_i2s1 {
+	status = "okay";
+
+	port@0 {
+		i2s1_cif_ep: endpoint {
+			remote-endpoint = <&xbar_i2s1_ep>;
+		};
+	};
+
+	i2s1_port: port@1 {
+		i2s1_dap: endpoint {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_i2s2 {
+	status = "okay";
+
+	port@0 {
+		i2s2_cif_ep: endpoint {
+			remote-endpoint = <&xbar_i2s2_ep>;
+		};
+	};
+
+	i2s2_port: port@1 {
+		i2s2_dap: endpoint {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_i2s3 {
+	status = "okay";
+
+	port@0 {
+		i2s3_cif_ep: endpoint {
+			remote-endpoint = <&xbar_i2s3_ep>;
+		};
+	};
+
+	i2s3_port: port@1 {
+		i2s3_dap_ep: endpoint {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_i2s4 {
+	status = "okay";
+
+	port@0 {
+		i2s4_cif_ep: endpoint {
+			remote-endpoint = <&xbar_i2s4_ep>;
+		};
+	};
+
+	i2s4_port: port@1 {
+		i2s4_dap: endpoint {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_i2s5 {
+	status = "okay";
+
+	port@0 {
+		i2s5_cif_ep: endpoint {
+			remote-endpoint = <&xbar_i2s5_ep>;
+		};
+	};
+
+	i2s5_port: port@1 {
+		i2s5_dap: endpoint {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_dmic1 {
+	status = "okay";
+
+	port@0 {
+		dmic1_cif_ep: endpoint {
+			remote-endpoint = <&xbar_dmic1_ep>;
+		};
+	};
+
+	dmic1_port: port@1 {
+		dmic1_dap: endpoint {
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_dmic2 {
+	status = "okay";
+
+	port@0 {
+		dmic2_cif_ep: endpoint {
+			remote-endpoint = <&xbar_dmic2_ep>;
+		};
+	};
+
+	dmic2_port: port@1 {
+		dmic2_dap: endpoint {
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_dmic3 {
+	status = "okay";
+
+	port@0 {
+		dmic3_cif_ep: endpoint {
+			remote-endpoint = <&xbar_dmic3_ep>;
+		};
+	};
+
+	dmic3_port: port@1 {
+		dmic3_dap: endpoint {
+			/* Placeholder for external Codec */
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 859241d..fcce8eed 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/mfd/max77620.h>
 
 #include "tegra210.dtsi"
+#include "tegra210-audio-graph.dtsi"
 
 / {
 	model = "NVIDIA Jetson Nano Developer Kit";
@@ -870,4 +871,127 @@
 
 		vin-supply = <&vdd_5v0_sys>;
 	};
+
+	tegra_sound {
+		status = "okay";
+
+		compatible = "nvidia,tegra210-audio-graph-card";
+
+		dais = /* FE */
+		       <&admaif1_port>, <&admaif2_port>, <&admaif3_port>,
+		       <&admaif4_port>, <&admaif5_port>, <&admaif6_port>,
+		       <&admaif7_port>, <&admaif8_port>, <&admaif9_port>,
+		       <&admaif10_port>,
+		       /* Router */
+		       <&xbar_i2s3_port>, <&xbar_i2s4_port>,
+		       <&xbar_dmic1_port>, <&xbar_dmic2_port>,
+		       /* I/O DAP Ports */
+		       <&i2s3_port>, <&i2s4_port>,
+		       <&dmic1_port>, <&dmic2_port>;
+
+		label = "jetson-nano-ape";
+	};
+};
+
+&tegra_admaif {
+	status = "okay";
+};
+
+&tegra_ahub {
+	status = "okay";
+
+	ports {
+		xbar_i2s3_port: port@c {
+			reg = <0xc>;
+			xbar_i2s3_ep: endpoint {
+				remote-endpoint = <&i2s3_cif_ep>;
+			};
+		};
+		xbar_i2s4_port: port@d {
+			reg = <0xd>;
+			xbar_i2s4_ep: endpoint {
+				remote-endpoint = <&i2s4_cif_ep>;
+			};
+		};
+		xbar_dmic1_port: port@f {
+			reg = <0xf>;
+			xbar_dmic1_ep: endpoint {
+				remote-endpoint = <&dmic1_cif_ep>;
+			};
+		};
+		xbar_dmic2_port: port@10 {
+			reg = <0x10>;
+			xbar_dmic2_ep: endpoint {
+				remote-endpoint = <&dmic2_cif_ep>;
+			};
+		};
+	};
+};
+
+&tegra_i2s3 {
+	status = "okay";
+
+	port@0 {
+		i2s3_cif_ep: endpoint {
+			remote-endpoint = <&xbar_i2s3_ep>;
+		};
+	};
+
+	i2s3_port: port@1 {
+		i2s3_dap_ep: endpoint {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_i2s4 {
+	status = "okay";
+
+	port@0 {
+		i2s4_cif_ep: endpoint {
+			remote-endpoint = <&xbar_i2s4_ep>;
+		};
+	};
+
+	i2s4_port: port@1 {
+		i2s4_dap: endpoint@0 {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_dmic1 {
+	status = "okay";
+
+	port@0 {
+		dmic1_cif_ep: endpoint@0 {
+			remote-endpoint = <&xbar_dmic1_ep>;
+		};
+	};
+
+	dmic1_port: port@1 {
+		dmic1_dap: endpoint@0 {
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_dmic2 {
+	status = "okay";
+
+	port@0 {
+		dmic2_cif_ep: endpoint@0 {
+			remote-endpoint = <&xbar_dmic2_ep>;
+		};
+	};
+
+	dmic2_port: port@1 {
+		dmic2_dap: endpoint@0 {
+			/* Placeholder for external Codec */
+		};
+	};
 };
-- 
2.7.4

