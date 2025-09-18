Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C5D2FE56B;
	Thu, 18 Sep 2025 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758197392; cv=none; b=TVoTpr6Zy+qqxvhuMT6oxhENapgi8UppikaWbkyf68EsXK7c4rzjjQT3p1DTFA506sZMTtuNu1vBw+AUKgsnLNWIBIIJqasxxRscXUSGVAxvM9dFAjq+r5jXf8uwEIHcIJXteoLH0IUqH0N4xOzwscA2U83QSIC8jIQs4L7Yviw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758197392; c=relaxed/simple;
	bh=kxvoxyFm3bsmG5fR/QhS8oki8BVLBIs9xvRNaDN6iBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eEAbjjmIDyL1i50chN0nAv7GkupMQEEejsOXoZsaFU7q+tAMIMT5U3S6i89jFzJ4Cu/N/fxWd+p/j66ZEz8RPHy4ipB+ra1m1cd/7yHBf16Ug/v5qdxtQq6ysBoijAHeC/PaFc0s5uepxwLOY+IYYPMnQAsqQupByTaXRehDEJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClUm3upV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClUm3upV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C558DC4CEEB;
	Thu, 18 Sep 2025 12:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758197392;
	bh=kxvoxyFm3bsmG5fR/QhS8oki8BVLBIs9xvRNaDN6iBQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ClUm3upV2LwuB3YH7Sm8fKswv4hTKSUAzjgIiOM9F+UdrzwDD5jcCQjDeSvz2ikwX
	 m2hBKLBpG10n2nVy5M2YSy2JKItJeFxt55x7PLCaTptQ3DE+5DA3VsthscKMjhwVsI
	 xURiLzmJLMzxJmPvvrGd/0mfTNtOIaYgdmCED+kQ6fexFDPX6dIIhCJBLEHRyHPTJe
	 TkdsDYj7oWD9FFUFTV/pVIL0rsxxpmqH+H6PVasfhwh+WBYsiLHpattspfcIRD8L33
	 VwWhFqpEUy4wWIXiUAqpRI0U9FWN3NbDUGVMVhD57R3wxu098nEAR+1XIA4AyVp042
	 XqrYzMwn14BgA==
From: Niklas Cassel <cassel@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Vidya Sagar <vidyas@nvidia.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Gautham Srinivasan <gauthams@nvidia.com>,
	Niklas Cassel <cassel@kernel.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Add pinctrl definition for PCIe C4 EP
Date: Thu, 18 Sep 2025 14:01:39 +0200
Message-ID: <20250918120138.17572-2-cassel@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1964; i=cassel@kernel.org; h=from:subject; bh=6PJXltUOQm1nMFJJzkygNCQvMogAYb5v8LmPSXMSDoo=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDJOf1ksM4/ZXuve8YTX7LstuP5Vis2r0yqPueK9WKpu3 yvD3TGpHaUsDGJcDLJiiiy+P1z2F3e7TzmueMcGZg4rE8gQBi5OAZjI1TxGhscTeMJU1wjsOvKb n1VvD1cc0+IHhu7sR87cyz97LfrH0nJGhvkR6uLbW5ZOK4jObRPz8s1gebh897nGJd3u6w6YV07 V5QEA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit

From: Gautham Srinivasan <gauthams@nvidia.com>

Commit 0580286d0d22 ("arm64: tegra: Add Tegra234 PCIe C4 EP definition")
added the device tree entry "pcie-ep@14160000" for C4 endpoint. However,
it missed pinctrl definition. Without the pinctl definition, the C4
endpoint of Jetson Orin Nano does not work. Add the missing definition.

Signed-off-by: Gautham Srinivasan <gauthams@nvidia.com>
[cassel: add to the existing nodes instead of creating new ones]
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index df034dbb82853..dd3e51b7d35ef 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/power/tegra234-powergate.h>
 #include <dt-bindings/reset/tegra234-reset.h>
 #include <dt-bindings/thermal/tegra234-bpmp-thermal.h>
+#include <dt-bindings/pinctrl/pinctrl-tegra.h>
 
 / {
 	compatible = "nvidia,tegra234";
@@ -127,6 +128,17 @@ gpio: gpio@2200000 {
 		pinmux: pinmux@2430000 {
 			compatible = "nvidia,tegra234-pinmux";
 			reg = <0x0 0x2430000 0x0 0x19100>;
+
+			pex_rst_c4_in_state: pex_rst_c4_in {
+				pex_rst {
+					nvidia,pins = "pex_l4_rst_n_pl1";
+					nvidia,function = "rsvd1";
+					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+					nvidia,tristate = <TEGRA_PIN_ENABLE>;
+					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+					nvidia,lpdr = <TEGRA_PIN_DISABLE>;
+				};
+			};
 		};
 
 		gpcdma: dma-controller@2600000 {
@@ -4881,6 +4893,8 @@ pcie-ep@14160000 {
 			       <&bpmp TEGRA234_RESET_PEX0_CORE_4>;
 			reset-names = "apb", "core";
 
+			pinctrl-names = "default";
+			pinctrl-0 = <&pex_rst_c4_in_state>;
 			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;  /* controller interrupt */
 			interrupt-names = "intr";
 			nvidia,bpmp = <&bpmp 4>;
-- 
2.51.0

