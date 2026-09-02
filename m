Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEB443FD11;
	Wed,  2 Sep 2026 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344264; cv=none; b=PIIsvrFjsnWYUH19gLNwygX8RqDveKPh6lbc3J4N2hX/5VJVK1T/LY70kyMFp9bV4tZlE+Emb1UzUkpH0V+N2WAqgpRcZXnTgyyDuVUafeIkek+mnjus4Ex+UkhF421u4C6koDELWzZ1z3X0krmqOL0L/DcH54+M16V+9uXD9n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344264; c=relaxed/simple;
	bh=tEKiKggN1rUKPjPhlu2QJU1ffF7vNLcL/k5Z+n29dtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XWa4WdAGTNLa9gTTg+QZCN8Of2QV6FlZUzY/x+dOVWa3cJ6O8AeOYE22kwwHFYIk0JDUxgvT59lislxA0VpaKHJxSLZhuGMPfegxQYkOi1054SWd/D4uVcVS+EvJwyvuWIj5LKHi3UTp3W7DcNBwdGwJa9cv5bf4M7T/GlQOHC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mg5G3iUu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mg5G3iUu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588D81F00A3A;
	Wed,  2 Sep 2026 10:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344262;
	bh=3VQTs81ZAz4E6fDz/QZlplVlF71GpIh2VKs/CSdOiZI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mg5G3iUuk5aA20v39CXfCS11CWPeex3adpy6LKwpR2XBMgTvpHpfF72LiGQXOsMf/
	 W5IKQ1MzVD5cK65j4y1Q0MX4eeA/03O+q0WAeorTxAXxyZ/IwNkyFcdvd5IbcN5PQy
	 QSQGNakfGeGf/RNVPFJXrmxE35WBLstfnzGhPsLl/F0IDYw+IXvmr/Pd79vwSCw/3m
	 uJDjICY2Z1Xb0HPPboVod8uqTYJFdF8q2JBzg3aqFDXl1Gywc7vBmMSsEm77XQd6t9
	 pUcaJHPPj4bkjrDdsxEGVRa5rgIVHrll7DjgZtestqVykHo0owqT5hO67YLF6s+x2n
	 LVwqaZiZZDnrw==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 02 Sep 2026 12:17:44 +0200
Subject: [PATCH 8/8] arm64: tegra: Clean up some whitespace issues on
 Tegra264
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-tegra-ahub-dt-cleanup-v1-8-028f3c5e72f6@nvidia.com>
References: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
In-Reply-To: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Charan Pedumuru <charan.pedumuru@gmail.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=25297; i=treding@nvidia.com;
 h=from:subject:message-id; bh=kRqN8Qxq+TFAQbzKJQeayHK8HQsX44xJTReAIa+mH24=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBql/fHlcjvhgDl+Du52Jkwn8NFnega+ZK5cdTGz
 RtCmy8JfmqJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCapf3xwAKCRDdI6zXfz6z
 oeaOD/969YnfdIPss+34+6KJouMjzy2oyJw1zB+z1SN6sJUdy7C6WtaA9buX6oHk6xdesX4Bgmc
 5u1tiPd1Z4gwGgK9/vSwX7B+7MbYMiSjxPYflbh14s/wsMYyC/CdW7Eg+hqEOWtaSTcmkzX7Wvx
 TpETT1wBZ0bx+B8B0AAITg5kFVVE0vXfw1gQLM4Vh05vrWwmQmqldQVYQJLQ/lAYbNJ8ueRL75/
 6HCLZ8fcRVJwi6wfj+i8tumr1PyNEQCcVDv2x7n33DKZ0E8BOYcf3EQbaqMyXwlbCq/RVCv63dv
 9sJSeYKNLleM/LaO6CFVr6gjVzo48bFJnyMg9/XBLex32WOeXV6U72JQfhG5DVqpCvX8VLIjgrC
 1Lv5xFQeWr9JXdd31DX4xXd8gOLlMvU6bzaPd1CP2xdgrApEVBtv5u8oqtnjUNfn88QECnDZhzX
 bdtEpQLrhdC9UV6Lx1DYoFfeXdSO2ppVqEMyHK8A5lXRo9A/asIUWkZnFlZnV/dyktlRM5q5+4E
 kDyYXkc8EbDoiVQHT9ktz7xKPH3vmWyVSuXd91424NPx1UAYrzbUgMMjPivzaYqDG6JTRJ3++Qo
 yOPNA36qUEwDX0ZaCwNKbGmsAISsM28Sk0e+KnJbu4sVJWo6AwcFwl9KwQnpBKais5zFW54hd3g
 6AJG3qjE8rb+OXA==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Properly align property names and values, and remove gratuitous
wrapping.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 376 +++++++++++++++----------------
 1 file changed, 177 insertions(+), 199 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 4ed7dabafee5..f011cd6e56e0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -122,9 +122,9 @@ hsp_top: hsp@8800000 {
 
 		aconnect@9000000 {
 			compatible = "nvidia,tegra264-aconnect",
-					"nvidia,tegra210-aconnect";
+				     "nvidia,tegra210-aconnect";
 			clocks = <&bpmp TEGRA264_CLK_APE>,
-				<&bpmp TEGRA264_CLK_ADSP>;
+				 <&bpmp TEGRA264_CLK_ADSP>;
 			clock-names = "ape", "apb2ape";
 			power-domains = <&bpmp TEGRA264_POWER_DOMAIN_AUD>;
 			status = "disabled";
@@ -138,69 +138,69 @@ adma: dma-controller@9440000 {
 				reg = <0x9440000 0xb0000>;
 				interrupt-parent = <&agic_page0>;
 				interrupts = <GIC_SPI 0x90 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0x91 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0x92 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0x93 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0x94 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0x95 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0x96 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0x97 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0x98 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0x99 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0x9a IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0x9b IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0x9c IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0x9d IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0x9e IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0x9f IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xa0 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xa1 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xa2 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xa3 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xa4 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xa5 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xa6 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xa7 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xa8 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xa9 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xaa IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xab IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xac IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xad IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xae IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xaf IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xb0 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xb1 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xb2 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xb3 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xb4 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xb5 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xb6 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xb7 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xb8 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xb9 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xba IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xbb IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xbc IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xbd IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xbe IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xbf IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xc0 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xc1 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xc2 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xc3 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xc4 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xc5 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xc6 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xc7 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xc8 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xc9 IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xca IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xcb IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xcc IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xcd IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xce IRQ_TYPE_LEVEL_HIGH>,
-					   <GIC_SPI 0xcf IRQ_TYPE_LEVEL_HIGH>;
+					     <GIC_SPI 0x91 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0x92 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0x93 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0x94 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0x95 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0x96 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0x97 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0x98 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0x99 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0x9a IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0x9b IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0x9c IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0x9d IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0x9e IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0x9f IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xa0 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xa1 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xa2 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xa3 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xa4 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xa5 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xa6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xa7 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xa8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xa9 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xaa IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xab IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xac IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xad IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xae IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xaf IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xb0 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xb1 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xb2 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xb3 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xb4 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xb5 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xb6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xb7 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xb8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xb9 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xba IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xbb IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xbc IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xbd IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xbe IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xbf IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xc0 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xc1 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xc2 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xc3 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xc4 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xc5 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xc6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xc7 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xc8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xc9 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xca IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xcb IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xcc IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xcd IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xce IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 0xcf IRQ_TYPE_LEVEL_HIGH>;
 				#dma-cells = <1>;
 				clocks = <&bpmp TEGRA264_CLK_AHUB>;
 				clock-names = "d_audio";
@@ -226,7 +226,7 @@ tegra_i2s1: i2s@9280000 {
 					compatible = "nvidia,tegra264-i2s";
 					reg = <0x9280000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_I2S1>,
-					       <&bpmp TEGRA264_CLK_I2S1_SCLK_IN>;
+						 <&bpmp TEGRA264_CLK_I2S1_SCLK_IN>;
 					clock-names = "i2s", "sync_input";
 					assigned-clocks = <&bpmp TEGRA264_CLK_I2S1>;
 					assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLA1_OUT1>;
@@ -296,7 +296,7 @@ tegra_i2s3: i2s@92a0000 {
 					compatible = "nvidia,tegra264-i2s";
 					reg = <0x92a0000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_I2S3>,
-					       <&bpmp TEGRA264_CLK_I2S3_SCLK_IN>;
+						 <&bpmp TEGRA264_CLK_I2S3_SCLK_IN>;
 					clock-names = "i2s", "sync_input";
 					assigned-clocks = <&bpmp TEGRA264_CLK_I2S3>;
 					assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLA1_OUT1>;
@@ -331,7 +331,7 @@ tegra_i2s4: i2s@92b0000 {
 					compatible = "nvidia,tegra264-i2s";
 					reg = <0x92b0000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_I2S4>,
-					       <&bpmp TEGRA264_CLK_I2S4_SCLK_IN>;
+						 <&bpmp TEGRA264_CLK_I2S4_SCLK_IN>;
 					clock-names = "i2s", "sync_input";
 					assigned-clocks = <&bpmp TEGRA264_CLK_I2S4>;
 					assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLA1_OUT1>;
@@ -366,7 +366,7 @@ tegra_i2s5: i2s@92c0000 {
 					compatible = "nvidia,tegra264-i2s";
 					reg = <0x92c0000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_I2S5>,
-					       <&bpmp TEGRA264_CLK_I2S5_SCLK_IN>;
+						 <&bpmp TEGRA264_CLK_I2S5_SCLK_IN>;
 					clock-names = "i2s", "sync_input";
 					assigned-clocks = <&bpmp TEGRA264_CLK_I2S5>;
 					assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLA1_OUT1>;
@@ -401,7 +401,7 @@ tegra_i2s6: i2s@92d0000 {
 					compatible = "nvidia,tegra264-i2s";
 					reg = <0x92d0000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_I2S6>,
-					       <&bpmp TEGRA264_CLK_I2S6_SCLK_IN>;
+						 <&bpmp TEGRA264_CLK_I2S6_SCLK_IN>;
 					clock-names = "i2s", "sync_input";
 					assigned-clocks = <&bpmp TEGRA264_CLK_I2S6>;
 					assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLA1_OUT1>;
@@ -436,7 +436,7 @@ tegra_i2s7: i2s@92e0000 {
 					compatible = "nvidia,tegra264-i2s";
 					reg = <0x92e0000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_I2S7>,
-					       <&bpmp TEGRA264_CLK_I2S7_SCLK_IN>;
+						 <&bpmp TEGRA264_CLK_I2S7_SCLK_IN>;
 					clock-names = "i2s", "sync_input";
 					assigned-clocks = <&bpmp TEGRA264_CLK_I2S7>;
 					assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLA1_OUT1>;
@@ -471,7 +471,7 @@ tegra_i2s8: i2s@92f0000 {
 					compatible = "nvidia,tegra264-i2s";
 					reg = <0x92f0000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_I2S8>,
-					       <&bpmp TEGRA264_CLK_I2S8_SCLK_IN>;
+						 <&bpmp TEGRA264_CLK_I2S8_SCLK_IN>;
 					clock-names = "i2s", "sync_input";
 					assigned-clocks = <&bpmp TEGRA264_CLK_I2S8>;
 					assigned-clock-parents = <&bpmp TEGRA264_CLK_PLLA1_OUT1>;
@@ -504,7 +504,7 @@ i2s8_dap: endpoint {
 
 				tegra_dmic1: dmic@9300000 {
 					compatible = "nvidia,tegra264-dmic",
-							"nvidia,tegra210-dmic";
+						     "nvidia,tegra210-dmic";
 					reg = <0x9300000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_DMIC1>;
 					clock-names = "dmic";
@@ -538,7 +538,7 @@ dmic1_dap: endpoint {
 
 				tegra_dmic2: dmic@9310000 {
 					compatible = "nvidia,tegra264-dmic",
-						   "nvidia,tegra210-dmic";
+						     "nvidia,tegra210-dmic";
 					reg = <0x9310000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_DMIC1>;
 					clock-names = "dmic";
@@ -572,7 +572,7 @@ dmic2_dap: endpoint {
 
 				tegra_dspk1: dspk@9380000 {
 					compatible = "nvidia,tegra264-dspk",
-							"nvidia,tegra186-dspk";
+						     "nvidia,tegra186-dspk";
 					reg = <0x9380000 0x10000>;
 					clocks = <&bpmp TEGRA264_CLK_DSPK1>;
 					clock-names = "dspk";
@@ -1220,74 +1220,73 @@ tegra_admaif: admaif@9610000 {
 					compatible = "nvidia,tegra264-admaif";
 					reg = <0x9610000 0x10000>;
 					dmas = <&adma 1>, <&adma 1>,
-					     <&adma 2>, <&adma 2>,
-					     <&adma 3>, <&adma 3>,
-					     <&adma 4>, <&adma 4>,
-					     <&adma 5>, <&adma 5>,
-					     <&adma 6>, <&adma 6>,
-					     <&adma 7>, <&adma 7>,
-					     <&adma 8>, <&adma 8>,
-					     <&adma 9>, <&adma 9>,
-					     <&adma 10>, <&adma 10>,
-					     <&adma 11>, <&adma 11>,
-					     <&adma 12>, <&adma 12>,
-					     <&adma 13>, <&adma 13>,
-					     <&adma 14>, <&adma 14>,
-					     <&adma 15>, <&adma 15>,
-					     <&adma 16>, <&adma 16>,
-					     <&adma 17>, <&adma 17>,
-					     <&adma 18>, <&adma 18>,
-					     <&adma 19>, <&adma 19>,
-					     <&adma 20>, <&adma 20>,
-					     <&adma 21>, <&adma 21>,
-					     <&adma 22>, <&adma 22>,
-					     <&adma 23>, <&adma 23>,
-					     <&adma 24>, <&adma 24>,
-					     <&adma 25>, <&adma 25>,
-					     <&adma 26>, <&adma 26>,
-					     <&adma 27>, <&adma 27>,
-					     <&adma 28>, <&adma 28>,
-					     <&adma 29>, <&adma 29>,
-					     <&adma 30>, <&adma 30>,
-					     <&adma 31>, <&adma 31>,
-					     <&adma 32>, <&adma 32>;
+					       <&adma 2>, <&adma 2>,
+					       <&adma 3>, <&adma 3>,
+					       <&adma 4>, <&adma 4>,
+					       <&adma 5>, <&adma 5>,
+					       <&adma 6>, <&adma 6>,
+					       <&adma 7>, <&adma 7>,
+					       <&adma 8>, <&adma 8>,
+					       <&adma 9>, <&adma 9>,
+					       <&adma 10>, <&adma 10>,
+					       <&adma 11>, <&adma 11>,
+					       <&adma 12>, <&adma 12>,
+					       <&adma 13>, <&adma 13>,
+					       <&adma 14>, <&adma 14>,
+					       <&adma 15>, <&adma 15>,
+					       <&adma 16>, <&adma 16>,
+					       <&adma 17>, <&adma 17>,
+					       <&adma 18>, <&adma 18>,
+					       <&adma 19>, <&adma 19>,
+					       <&adma 20>, <&adma 20>,
+					       <&adma 21>, <&adma 21>,
+					       <&adma 22>, <&adma 22>,
+					       <&adma 23>, <&adma 23>,
+					       <&adma 24>, <&adma 24>,
+					       <&adma 25>, <&adma 25>,
+					       <&adma 26>, <&adma 26>,
+					       <&adma 27>, <&adma 27>,
+					       <&adma 28>, <&adma 28>,
+					       <&adma 29>, <&adma 29>,
+					       <&adma 30>, <&adma 30>,
+					       <&adma 31>, <&adma 31>,
+					       <&adma 32>, <&adma 32>;
 					dma-names = "rx1", "tx1",
-						"rx2", "tx2",
-						"rx3", "tx3",
-						"rx4", "tx4",
-						"rx5", "tx5",
-						"rx6", "tx6",
-						"rx7", "tx7",
-						"rx8", "tx8",
-						"rx9", "tx9",
-						"rx10", "tx10",
-						"rx11", "tx11",
-						"rx12", "tx12",
-						"rx13", "tx13",
-						"rx14", "tx14",
-						"rx15", "tx15",
-						"rx16", "tx16",
-						"rx17", "tx17",
-						"rx18", "tx18",
-						"rx19", "tx19",
-						"rx20", "tx20",
-						"rx21", "tx21",
-						"rx22", "tx22",
-						"rx23", "tx23",
-						"rx24", "tx24",
-						"rx25", "tx25",
-						"rx26", "tx26",
-						"rx27", "tx27",
-						"rx28", "tx28",
-						"rx29", "tx29",
-						"rx30", "tx30",
-						"rx31", "tx31",
-						"rx32", "tx32";
+						    "rx2", "tx2",
+						    "rx3", "tx3",
+						    "rx4", "tx4",
+						    "rx5", "tx5",
+						    "rx6", "tx6",
+						    "rx7", "tx7",
+						    "rx8", "tx8",
+						    "rx9", "tx9",
+						    "rx10", "tx10",
+						    "rx11", "tx11",
+						    "rx12", "tx12",
+						    "rx13", "tx13",
+						    "rx14", "tx14",
+						    "rx15", "tx15",
+						    "rx16", "tx16",
+						    "rx17", "tx17",
+						    "rx18", "tx18",
+						    "rx19", "tx19",
+						    "rx20", "tx20",
+						    "rx21", "tx21",
+						    "rx22", "tx22",
+						    "rx23", "tx23",
+						    "rx24", "tx24",
+						    "rx25", "tx25",
+						    "rx26", "tx26",
+						    "rx27", "tx27",
+						    "rx28", "tx28",
+						    "rx29", "tx29",
+						    "rx30", "tx30",
+						    "rx31", "tx31",
+						    "rx32", "tx32";
 
-					 interconnects =
-						<&mc TEGRA264_MEMORY_CLIENT_APEDMAR &emc>,
-						<&mc TEGRA264_MEMORY_CLIENT_APEDMAW &emc>;
-						interconnect-names = "dma-mem", "write";
+					interconnects = <&mc TEGRA264_MEMORY_CLIENT_APEDMAR &emc>,
+							<&mc TEGRA264_MEMORY_CLIENT_APEDMAW &emc>;
+					interconnect-names = "dma-mem", "write";
 
 					iommus = <&smmu1 TEGRA264_SID_APE>;
 
@@ -1555,7 +1554,7 @@ admaif31: endpoint {
 
 				tegra_sfc1: sfc@9700000 {
 					compatible = "nvidia,tegra264-sfc",
-							"nvidia,tegra210-sfc";
+						     "nvidia,tegra210-sfc";
 					reg = <0x9700000 0x10000>;
 					sound-name-prefix = "SFC1";
 
@@ -1583,7 +1582,7 @@ sfc1_cif_out: endpoint {
 
 				tegra_sfc2: sfc@9710000 {
 					compatible = "nvidia,tegra264-sfc",
-							"nvidia,tegra210-sfc";
+						     "nvidia,tegra210-sfc";
 					reg = <0x9710000 x0 0x10000>;
 					sound-name-prefix = "SFC2";
 
@@ -1611,7 +1610,7 @@ sfc2_cif_out: endpoint {
 
 				tegra_sfc3: sfc@9720000 {
 					compatible = "nvidia,tegra264-sfc",
-							"nvidia,tegra210-sfc";
+						     "nvidia,tegra210-sfc";
 					reg = <0x9720000 0x10000>;
 					sound-name-prefix = "SFC3";
 
@@ -1639,7 +1638,7 @@ sfc3_cif_out: endpoint {
 
 				tegra_sfc4: sfc@9730000 {
 					compatible = "nvidia,tegra264-sfc",
-							"nvidia,tegra210-sfc";
+						     "nvidia,tegra210-sfc";
 					reg = <0x9730000 0x10000>;
 					sound-name-prefix = "SFC4";
 
@@ -1667,7 +1666,7 @@ sfc4_cif_out: endpoint {
 
 				tegra_ope1: processing-engine@9780000 {
 					compatible = "nvidia,tegra264-ope",
-							"nvidia,tegra210-ope";
+						     "nvidia,tegra210-ope";
 					reg = <0x9780000 0x10000>;
 					#address-cells = <1>;
 					#size-cells = <1>;
@@ -1676,13 +1675,13 @@ tegra_ope1: processing-engine@9780000 {
 
 					equalizer@9790000 {
 						compatible = "nvidia,tegra264-peq",
-								"nvidia,tegra210-peq";
+							     "nvidia,tegra210-peq";
 						reg = <0x9790000 0x10000>;
 					};
 
 					dynamic-range-compressor@97a0000 {
 						compatible = "nvidia,tegra264-mbdrc",
-								"nvidia,tegra210-mbdrc";
+							     "nvidia,tegra210-mbdrc";
 						reg = <0x97a0000 0x10000>;
 					};
 
@@ -1694,8 +1693,7 @@ port@0 {
 							reg = <0x0>;
 
 							ope1_cif_in_ep: endpoint {
-								remote-endpoint =
-									<&xbar_ope1_in_ep>;
+								remote-endpoint = <&xbar_ope1_in_ep>;
 							};
 						};
 
@@ -1703,8 +1701,7 @@ ope1_out_port: port@1 {
 							reg = <0x1>;
 
 							ope1_cif_out_ep: endpoint {
-								remote-endpoint =
-									<&xbar_ope1_out_ep>;
+								remote-endpoint = <&xbar_ope1_out_ep>;
 							};
 						};
 					};
@@ -1712,7 +1709,7 @@ ope1_cif_out_ep: endpoint {
 
 				tegra_mvc1: mvc@9800000 {
 					compatible = "nvidia,tegra264-mvc",
-							"nvidia,tegra210-mvc";
+						     "nvidia,tegra210-mvc";
 					reg = <0x9800000 0x10000>;
 					sound-name-prefix = "MVC1";
 
@@ -1740,7 +1737,7 @@ mvc1_cif_out: endpoint {
 
 				tegra_mvc2: mvc@9810000 {
 					compatible = "nvidia,tegra264-mvc",
-							"nvidia,tegra210-mvc";
+						     "nvidia,tegra210-mvc";
 					reg = <0x9810000 0x10000>;
 					sound-name-prefix = "MVC2";
 
@@ -1768,7 +1765,7 @@ mvc2_cif_out: endpoint {
 
 				tegra_amixer: amixer@9820000 {
 					compatible = "nvidia,tegra264-amixer",
-							"nvidia,tegra210-amixer";
+						     "nvidia,tegra210-amixer";
 					reg = <0x9820000 0x10000>;
 					sound-name-prefix = "MIXER1";
 
@@ -1911,8 +1908,7 @@ port@0 {
 							reg = <0x0>;
 
 							asrc_in1_ep: endpoint {
-								remote-endpoint =
-									<&xbar_asrc_in1_ep>;
+								remote-endpoint = <&xbar_asrc_in1_ep>;
 							};
 						};
 
@@ -1920,8 +1916,7 @@ port@1 {
 							reg = <0x1>;
 
 							asrc_in2_ep: endpoint {
-								remote-endpoint =
-									<&xbar_asrc_in2_ep>;
+								remote-endpoint = <&xbar_asrc_in2_ep>;
 							};
 						};
 
@@ -1929,8 +1924,7 @@ port@2 {
 							reg = <0x2>;
 
 							asrc_in3_ep: endpoint {
-								remote-endpoint =
-									<&xbar_asrc_in3_ep>;
+								remote-endpoint = <&xbar_asrc_in3_ep>;
 							};
 						};
 
@@ -1938,8 +1932,7 @@ port@3 {
 							reg = <0x3>;
 
 							asrc_in4_ep: endpoint {
-								remote-endpoint =
-									<&xbar_asrc_in4_ep>;
+								remote-endpoint = <&xbar_asrc_in4_ep>;
 							};
 						};
 
@@ -1947,8 +1940,7 @@ port@4 {
 							reg = <0x4>;
 
 							asrc_in5_ep: endpoint {
-								remote-endpoint =
-									<&xbar_asrc_in5_ep>;
+								remote-endpoint = <&xbar_asrc_in5_ep>;
 							};
 						};
 
@@ -1956,8 +1948,7 @@ port@5 {
 							reg = <0x5>;
 
 							asrc_in6_ep: endpoint {
-								remote-endpoint =
-									<&xbar_asrc_in6_ep>;
+								remote-endpoint = <&xbar_asrc_in6_ep>;
 							};
 						};
 
@@ -1965,8 +1956,7 @@ port@6 {
 							reg = <0x6>;
 
 							asrc_in7_ep: endpoint {
-								remote-endpoint =
-									<&xbar_asrc_in7_ep>;
+								remote-endpoint = <&xbar_asrc_in7_ep>;
 							};
 						};
 
@@ -1974,8 +1964,7 @@ asrc_out1_port: port@7 {
 							reg = <0x7>;
 
 							asrc_out1_ep: endpoint {
-								remote-endpoint =
-									<&xbar_asrc_out1_ep>;
+								remote-endpoint = <&xbar_asrc_out1_ep>;
 							};
 						};
 
@@ -1983,8 +1972,7 @@ asrc_out2_port: port@8 {
 							reg = <0x8>;
 
 							asrc_out2_ep: endpoint {
-								remote-endpoint =
-									<&xbar_asrc_out2_ep>;
+								remote-endpoint = <&xbar_asrc_out2_ep>;
 							};
 						};
 
@@ -1992,8 +1980,7 @@ asrc_out3_port: port@9 {
 							reg = <0x9>;
 
 							asrc_out3_ep: endpoint {
-								remote-endpoint =
-									<&xbar_asrc_out3_ep>;
+								remote-endpoint = <&xbar_asrc_out3_ep>;
 							};
 						};
 
@@ -2001,8 +1988,7 @@ asrc_out4_port: port@a {
 							reg = <0xa>;
 
 							asrc_out4_ep: endpoint {
-								remote-endpoint =
-									<&xbar_asrc_out4_ep>;
+								remote-endpoint = <&xbar_asrc_out4_ep>;
 							};
 						};
 
@@ -2010,8 +1996,7 @@ asrc_out5_port: port@b {
 							reg = <0xb>;
 
 							asrc_out5_ep: endpoint {
-								remote-endpoint =
-									<&xbar_asrc_out5_ep>;
+								remote-endpoint = <&xbar_asrc_out5_ep>;
 							};
 						};
 
@@ -2019,8 +2004,7 @@ asrc_out6_port: port@c {
 							reg = <0xc>;
 
 							asrc_out6_ep: endpoint {
-								remote-endpoint =
-									<&xbar_asrc_out6_ep>;
+								remote-endpoint = <&xbar_asrc_out6_ep>;
 							};
 						};
 					};
@@ -3194,13 +3178,12 @@ xbar_ope1_out_ep: endpoint {
 
 			agic_page0: interrupt-controller@9960000 {
 				compatible = "nvidia,tegra264-agic",
-						"nvidia,tegra210-agic";
+					     "nvidia,tegra210-agic";
 				#interrupt-cells = <3>;
 				interrupt-controller;
 				reg = <0x9961000 0x1000>,
 				      <0x9962000 0x1000>;
-				interrupts = <GIC_SPI 0x230
-					(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+				interrupts = <GIC_SPI 0x230 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 				clocks = <&bpmp TEGRA264_CLK_ADSP>;
 				clock-names = "clk";
 				status = "disabled";
@@ -3208,13 +3191,12 @@ agic_page0: interrupt-controller@9960000 {
 
 			agic_page1: interrupt-controller@9970000 {
 				compatible = "nvidia,tegra264-agic",
-					   "nvidia,tegra210-agic";
+					     "nvidia,tegra210-agic";
 				#interrupt-cells = <3>;
 				interrupt-controller;
 				reg = <0x9971000 0x1000>,
 				      <0x9972000 0x1000>;
-				interrupts = <GIC_SPI 0x231
-					(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+				interrupts = <GIC_SPI 0x231 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 				clocks = <&bpmp TEGRA264_CLK_ADSP>;
 				clock-names = "clk";
 				status = "disabled";
@@ -3222,13 +3204,12 @@ agic_page1: interrupt-controller@9970000 {
 
 			agic_page2: interrupt-controller@9980000 {
 				compatible = "nvidia,tegra264-agic",
-						"nvidia,tegra210-agic";
+					     "nvidia,tegra210-agic";
 				#interrupt-cells = <3>;
 				interrupt-controller;
 				reg = <0x9981000 0x1000>,
 				      <0x9982000 0x1000>;
-				interrupts = <GIC_SPI 0x232
-					(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+				interrupts = <GIC_SPI 0x232 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 				clocks = <&bpmp TEGRA264_CLK_ADSP>;
 				clock-names = "clk";
 				status = "disabled";
@@ -3236,13 +3217,12 @@ agic_page2: interrupt-controller@9980000 {
 
 			agic_page3: interrupt-controller@9990000 {
 				compatible = "nvidia,tegra264-agic",
-						"nvidia,tegra210-agic";
+					     "nvidia,tegra210-agic";
 				#interrupt-cells = <3>;
 				interrupt-controller;
 				reg = <0x9991000 0x1000>,
 				      <0x9992000 0x1000>;
-				interrupts = <GIC_SPI 0x233
-					(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+				interrupts = <GIC_SPI 0x233 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 				clocks = <&bpmp TEGRA264_CLK_ADSP>;
 				clock-names = "clk";
 				status = "disabled";
@@ -3250,13 +3230,12 @@ agic_page3: interrupt-controller@9990000 {
 
 			agic_page4: interrupt-controller@99a0000 {
 				compatible = "nvidia,tegra264-agic",
-						"nvidia,tegra210-agic";
+					     "nvidia,tegra210-agic";
 				#interrupt-cells = <3>;
 				interrupt-controller;
 				reg = <0x99a1000 0x1000>,
 				      <0x99a2000 0x1000>;
-				interrupts = <GIC_SPI 0x234
-					(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+				interrupts = <GIC_SPI 0x234 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 				clocks = <&bpmp TEGRA264_CLK_ADSP>;
 				clock-names = "clk";
 				status = "disabled";
@@ -3264,13 +3243,12 @@ agic_page4: interrupt-controller@99a0000 {
 
 			agic_page5: interrupt-controller@99b0000 {
 				compatible = "nvidia,tegra264-agic",
-						"nvidia,tegra210-agic";
+					     "nvidia,tegra210-agic";
 				#interrupt-cells = <3>;
 				interrupt-controller;
 				reg = <0x99b1000 0x1000>,
 				      <0x99b2000 0x1000>;
-				interrupts = <GIC_SPI 0x235
-					(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+				interrupts = <GIC_SPI 0x235 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 				clocks = <&bpmp TEGRA264_CLK_ADSP>;
 				clock-names = "clk";
 				status = "disabled";

-- 
2.55.0

