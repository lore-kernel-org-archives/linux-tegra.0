Return-Path: <SRS0=VMTZ=DX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E5FC433E7
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 14:45:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0BD720866
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 14:45:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="CTyvvR6L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409275AbgJPOpC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Oct 2020 10:45:02 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:5324 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409251AbgJPOpB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 10:45:01 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f89b1e10001>; Fri, 16 Oct 2020 07:44:49 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 14:44:56 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 14:44:50 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <p.zabel@pengutronix.de>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v4 15/15] arm64: tegra: Audio graph sound card for Jetson Nano and TX1
Date:   Fri, 16 Oct 2020 20:13:02 +0530
Message-ID: <1602859382-19505-16-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602859489; bh=Zmo3gEQj1Q3iW8/ujdilA5fA/ZPa/RKFHm549VsxnfY=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=CTyvvR6Lx9YH+r3bSF2kJmkRpphh8Yv0KMn83L23xSqHPbA4QQ7IPLgtgHwht1LUF
         3unP0MW5gTkvtdAk/VZq0788gpCeUe2lkWAdK55f7kaExZhL7aOC6sM5Me+i1eXC7W
         zDTLFCaeedAQUe3Kc7B0q0GxTc8VIDO3+XtgGomTfbol9zTSIuXJbh4lPBIxSohpSP
         9l+O0+fw9eylAKLYp1uNAIUNZd7xFudKsbEu13ng2mIF680kR7vEHQE80N8GlJKbMG
         vx1+vpryG3k1oIcQcc3ITjsv/WX4x/WDJexH6Eyuyr/JtNKxG3l0fnA/L5D1Qzli0b
         aZ+Wc1tpqi9ag==
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
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 262 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 146 ++++++++++++
 2 files changed, 408 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 4c9c2a0..dab24b4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -3,6 +3,7 @@
 
 #include "tegra210-p2180.dtsi"
 #include "tegra210-p2597.dtsi"
+#include "tegra210-audio-graph.dtsi"
 
 / {
 	model = "NVIDIA Jetson TX1 Developer Kit";
@@ -127,4 +128,265 @@
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
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s1_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s1_ep>;
+			};
+		};
+		i2s1_port: port@1 {
+			reg = <1>;
+			i2s1_dap: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_i2s2 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s2_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s2_ep>;
+			};
+		};
+		i2s2_port: port@1 {
+			reg = <1>;
+			i2s2_dap: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_i2s3 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s3_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s3_ep>;
+			};
+		};
+		i2s3_port: port@1 {
+			reg = <1>;
+			i2s3_dap_ep: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_i2s4 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s4_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s4_ep>;
+			};
+		};
+		i2s4_port: port@1 {
+			reg = <1>;
+			i2s4_dap: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_i2s5 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s5_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s5_ep>;
+			};
+		};
+		i2s5_port: port@1 {
+			reg = <1>;
+			i2s5_dap: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_dmic1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dmic1_cif_ep: endpoint {
+				remote-endpoint = <&xbar_dmic1_ep>;
+			};
+		};
+		dmic1_port: port@1 {
+			reg = <1>;
+			dmic1_dap: endpoint {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_dmic2 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dmic2_cif_ep: endpoint {
+				remote-endpoint = <&xbar_dmic2_ep>;
+			};
+		};
+		dmic2_port: port@1 {
+			reg = <1>;
+			dmic2_dap: endpoint {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_dmic3 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dmic3_cif_ep: endpoint {
+				remote-endpoint = <&xbar_dmic3_ep>;
+			};
+		};
+		dmic3_port: port@1 {
+			reg = <1>;
+			dmic3_dap: endpoint {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 859241d..1216b65c8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/mfd/max77620.h>
 
 #include "tegra210.dtsi"
+#include "tegra210-audio-graph.dtsi"
 
 / {
 	model = "NVIDIA Jetson Nano Developer Kit";
@@ -870,4 +871,149 @@
 
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
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s3_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s3_ep>;
+			};
+		};
+		i2s3_port: port@1 {
+			reg = <1>;
+			i2s3_dap_ep: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_i2s4 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s4_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s4_ep>;
+			};
+		};
+		i2s4_port: port@1 {
+			reg = <1>;
+			i2s4_dap: endpoint@0 {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_dmic1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dmic1_cif_ep: endpoint@0 {
+				remote-endpoint = <&xbar_dmic1_ep>;
+			};
+		};
+		dmic1_port: port@1 {
+			reg = <1>;
+			dmic1_dap: endpoint@0 {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_dmic2 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dmic2_cif_ep: endpoint@0 {
+				remote-endpoint = <&xbar_dmic2_ep>;
+			};
+		};
+		dmic2_port: port@1 {
+			reg = <1>;
+			dmic2_dap: endpoint@0 {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
 };
-- 
2.7.4

