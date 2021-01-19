Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B121C4332B
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 12:07:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57A4F20754
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 12:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392182AbhASMC0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 07:02:26 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:15811 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387494AbhASJ3o (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 04:29:44 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6006a6570001>; Tue, 19 Jan 2021 01:28:56 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 09:28:55 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Jan 2021 09:28:52 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <kuninori.morimoto.gx@renesas.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [RESEND PATCH v6 5/6] arm64: tegra: Audio graph header for Tegra210
Date:   Tue, 19 Jan 2021 14:58:15 +0530
Message-ID: <1611048496-24650-6-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611048536; bh=N3YeQvDKJduX5rcoNDcv6iWQ9sjVvrYYOtuEvh0ZCJo=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=IiKZ/gmShJ4GCYlIp5VJ1K5kB4mI8e6aA8N4zC256M87TfQciuURyz3IKSBsV+1E0
         mQuVhNIGSIWCeo8/9iwJ33T+2Ymrov4ZGOk8QwvsGx950L+AZNZ7GWqMGFbL4P5HCG
         8gogBXGpUzZGb73bea1JQ2uqL8IniYaYJSwbHOClJ0jLeLd8RLF41kh96v2MrsE9xt
         hxP62HquMpYSHOMDZlNE5/ZWTSfZ5WF2qidHVJDgUzzM9z2K/Ef0zjs1ClXeqYurA9
         gwIYrh/6UEc68RkEKlQyBTgraBm5IfWJP8TLgu+oWDIUY7exL4z/YDWrxDTblXgNZl
         +cHciyKFJOlUw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Expose a header which describes DT bindings required to use audio-graph
based sound card. All Tegra210 based platforms can include this header
and add platform specific information. Currently, from SoC point of view,
all links are exposed for ADMAIF, AHUB, I2S and DMIC components.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 153 +++++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
new file mode 100644
index 0000000..5c54358
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
@@ -0,0 +1,153 @@
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
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		admaif1_port: port@0 {
+			reg = <0>;
+			admaif1_ep: endpoint {
+				remote-endpoint = <&xbar_admaif1_ep>;
+			};
+		};
+		admaif2_port: port@1 {
+			reg = <1>;
+			admaif2_ep: endpoint {
+				remote-endpoint = <&xbar_admaif2_ep>;
+			};
+		};
+		admaif3_port: port@2 {
+			reg = <2>;
+			admaif3_ep: endpoint {
+				remote-endpoint = <&xbar_admaif3_ep>;
+			};
+		};
+		admaif4_port: port@3 {
+			reg = <3>;
+			admaif4_ep: endpoint {
+				remote-endpoint = <&xbar_admaif4_ep>;
+			};
+		};
+		admaif5_port: port@4 {
+			reg = <4>;
+			admaif5_ep: endpoint {
+				remote-endpoint = <&xbar_admaif5_ep>;
+			};
+		};
+		admaif6_port: port@5 {
+			reg = <5>;
+			admaif6_ep: endpoint {
+				remote-endpoint = <&xbar_admaif6_ep>;
+			};
+		};
+		admaif7_port: port@6 {
+			reg = <6>;
+			admaif7_ep: endpoint {
+				remote-endpoint = <&xbar_admaif7_ep>;
+			};
+		};
+		admaif8_port: port@7 {
+			reg = <7>;
+			admaif8_ep: endpoint {
+				remote-endpoint = <&xbar_admaif8_ep>;
+			};
+		};
+		admaif9_port: port@8 {
+			reg = <8>;
+			admaif9_ep: endpoint {
+				remote-endpoint = <&xbar_admaif9_ep>;
+			};
+		};
+		admaif10_port: port@9 {
+			reg = <9>;
+			admaif10_ep: endpoint {
+				remote-endpoint = <&xbar_admaif10_ep>;
+			};
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

