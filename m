Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0212B342514;
	Fri, 18 Sep 2026 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722438; cv=none; b=ZtA6ABRSFhq6M9/di7yEify0LjJQ7a3ES5qUyEAzbL9pqg+sdLE+F87Z4+7uxML8Tl115UfrmPRyWoXLH5Q9jbXyeF36jugdsZH6KZ/RDL6VxkDC5/K+c6kyKqhZyVvSUGkFaxcO8ByTD4TcWqTV9MiKu/T8FmBO00yxQkiVzAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722438; c=relaxed/simple;
	bh=2Um907s1I8QJ+sKFjO+ivkQiLeMQobxhytsnnNk6niA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t15pdx0XTbAOZKd56cMt64nc538PoBQHsLCexOZgi7hxI70ubL2qdv1qyFz1+rggYrHiVa5PVuvuRbnAGBPB0sW0gbh/uffdhenk2U2BchWhWW1u2xVS2dK3uDpT1Z9yQYAuIHJedeTHdzr5L4CIievAIy6z5H23B12pUjwX+ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3VM0Qf4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3VM0Qf4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2201F000FF;
	Fri, 18 Sep 2026 09:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789722436;
	bh=2nCw6KkfIi4BffRTdVZ1uGCrQblL43sxgakuDypKl2M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=K3VM0Qf4CNGu65pCv6VleHhBv9TMkF+XKl7gQR38XzzizJ5qeNuYJf37nxo7XgYJG
	 ETZNuFGDLLCwxfvBQS7QoDS/dgu4Re9WrklN58GpckJ5gmqBczYQ/7KeQ3ocIzR/1f
	 vJ/GMH6XdH5hb6XZl7hAU1Fy4Hb0hOGoeoUwN72MzySiVn3DbMUMEEQgALxDy3u2xw
	 v0jGOaJV9t6oa3OyDso9ySoiDGe6TdPTE5n33bBniQBnIhnYO/SeGYnb7oEceGQu0h
	 t3oAifR4buRUdcubIs4jSibdFiVgAgvM40g6ns54nP+2t18oq+rQvF2vIz1YrCEu4e
	 ugVGGkCIIh9EQ==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Fri, 18 Sep 2026 11:06:53 +0200
Subject: [PATCH 1/5] arm64: tegra: Add missing *-cells properties for I2C
 controllers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-tegra264-i2c-v1-1-3adac7aae717@nvidia.com>
References: <20260918-tegra264-i2c-v1-0-3adac7aae717@nvidia.com>
In-Reply-To: <20260918-tegra264-i2c-v1-0-3adac7aae717@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5712; i=treding@nvidia.com;
 h=from:subject:message-id; bh=hbiISH/xEfQuYpC+KSzNmyszX4beKE3WE4XSekJaBfA=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqrP8+XYCPu93lPL5cUOfKjOLzCbNLHbb7k8UPX
 TRfXsUIpJiJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaqz/PgAKCRDdI6zXfz6z
 ofSTEACDLnThW+DH+Mbol3PcWlF8L+fLNqtjF/qWJ4fl5vMZOmytrR5LNgdo/8Rk2KMet9/DcEt
 rXU4rwZgiKKUhgGZEArXL+8DFKIctohW29aL9L8X95kAJ6ytIi5xjG4KegMvK7tctNhDZPCrG1P
 OimF5XeqEMUBxb42DctpaImqkbvXaAzLHIL46aARH3hYoC5etB42IFnnyztED8AigF9VU1yYt1c
 PHeOjhR4l8Ex9bIJUvcQrOyLMpmsLi14IIjLNVsIgX/J4Jmy3Pwna9ZsuSaISXo1dZqSTVPKIxB
 SkqrjtDxht9JvA2pdmE0vchULCUlY9wlUJA6yC0pmrhodS3bG7Kd9z2rBaVzJ+RIgf/dwZ/zloX
 p5PBkd8u2zFpYjhyuo2QbHhYjNf8fTtMlCfr061LF+rX6tbnydmg9vmDonzydoDrEj3e7xLv0sb
 pId0Z4cCJeIp1lwX/RDrxImwcsJnmB9ha+r7Li27jSlVqng3PRp7H1bPtawdAgDPrb3pim4vO4A
 Dl2yrxE3URMSFuFY455BjQzYf5jJfCvZZT94eOgLxwZ/h3tHRt7m2zbg6oFuaENuZePScYfRwkg
 2DZhQcOQ+quR0fy3DftnZptbYOOYkaJ+kCrXMRq97/U4ipIJ8OVOF+UHccJabFZmg9ab6/o2Fxt
 dT0KHNOX07SjT0g==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

The I2C controllers on Tegra264 are missing the #address-cells and
devices are added below them.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index b84f93ad227e..a5049e1a0571 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3311,6 +3311,8 @@ i2c2: i2c@c600000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x0 0x0c600000 0x0 0x10000>;
 			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA264_CLK_AON_I2C>,
 				 <&bpmp TEGRA264_CLK_PLLAON>;
@@ -3326,6 +3328,8 @@ i2c3: i2c@c610000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x0 0x0c610000 0x0 0x10000>;
 			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA264_CLK_AON_I2C>,
 				 <&bpmp TEGRA264_CLK_PLLAON>;
@@ -3623,6 +3627,8 @@ i2c14: i2c@c410000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c410000 0x0 0x10000>;
 			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
 				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
@@ -3638,6 +3644,8 @@ i2c15: i2c@c420000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c420000 0x0 0x10000>;
 			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
 				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
@@ -3653,6 +3661,8 @@ i2c16: i2c@c430000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c430000 0x0 0x10000>;
 			interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
 				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
@@ -3728,6 +3738,8 @@ i2c0: i2c@c630000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c630000 0x0 0x10000>;
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
 				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
@@ -3743,6 +3755,8 @@ i2c1: i2c@c640000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c640000 0x0 0x10000>;
 			interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
 				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
@@ -3758,6 +3772,8 @@ i2c4: i2c@c650000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c650000 0x0 0x10000>;
 			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
 				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
@@ -3773,6 +3789,8 @@ i2c6: i2c@c670000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c670000 0x0 0x10000>;
 			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
 				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
@@ -3788,6 +3806,8 @@ i2c7: i2c@c680000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c680000 0x0 0x10000>;
 			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
 				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
@@ -3803,6 +3823,8 @@ i2c8: i2c@c690000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c690000 0x0 0x10000>;
 			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
 				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
@@ -3818,6 +3840,8 @@ i2c9: i2c@c6a0000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c6a0000 0x0 0x10000>;
 			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
 				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
@@ -3833,6 +3857,8 @@ i2c10: i2c@c6b0000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c6b0000 0x0 0x10000>;
 			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
 				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
@@ -3848,6 +3874,8 @@ i2c11: i2c@c6c0000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c6c0000 0x0 0x10000>;
 			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
 				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;
@@ -3863,6 +3891,8 @@ i2c12: i2c@c6d0000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c6d0000 0x0 0x10000>;
 			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			clock-frequency = <400000>;
 			clocks = <&bpmp TEGRA264_CLK_TOP_I2C>,
 				 <&bpmp TEGRA264_CLK_PLLP_OUT0>;

-- 
2.55.0

