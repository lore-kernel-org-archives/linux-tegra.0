Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDC0480DC0;
	Thu, 27 Aug 2026 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842494; cv=none; b=GtbiFQJkgG52uULqO4YTJLa4AGoBwc0RImnPMC3orPGQToV4/206BV/DG2DTLgL5hlHcgpedhhDLqDVRUiigZVxwtPtAXR12q/UMXTeDfORLrC7RY+yibJUN6sTNAhmKeLaAuKS2jly9aXPxyINalOQ/ut26ltpY4SiJxh4Ukgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842494; c=relaxed/simple;
	bh=ZoLnrbq9OmhUOt3YPM41FbeK/hzc3j3UfOvoooT8Ui8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJVlWOQortJPcbJ6/Y9MY0BpB4oIDaKNNJTnqxd0HT2RdCg6l/3+i7Fxjcrim5fV1xUfEmX69+YzTKOtcQc1GQMxUg8pi/BOEubHYpaVO+vhL3teXj3QARhmKdb2kcYWhQqVICYbe/xXz7HFYitpc3TYY6N+xCV082W5Lzq53MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNfxjmXQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNfxjmXQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 106521F00A3D;
	Thu, 27 Aug 2026 14:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787842481;
	bh=0oQZFi64KowCZClI/Y3BcpoEfkQNo4XtG7Tc8TCq14U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hNfxjmXQ5s5Zcv2JOTuiG8BUFmJkDr1X8gsh33aGWNtypSPL0kKqY01wsHQY1Qodr
	 8gUyqLqwh4Hi3DylXfNZNGs08EVZw7+0UV8aPcgbtZ42FWOs616D+0NRJx9NeKduUb
	 dtp+/qmepnpKq4/SuSPNUxms8jkKwBM3vIYC1qkrJ0LklV07M2GjyqWCrP2cVrWRwb
	 8h93V4yTK16dJEyA84M6no9hLw4f5DlBNkQ2Gm8IztQLx5i2ps5o6cO+b+FZvP1L8M
	 Lol8Sf1bMU+eo+WkWmzQXsCTo6vUOAvE7o0xxFtxJytiqhK/Gj0Joau+NY9dfCtdNo
	 B9xsoxASQeVvA==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Thu, 27 Aug 2026 16:54:19 +0200
Subject: [PATCH 2/2] arm64: tegra: Enable GPIO keys on Jetson AGX Thor
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-tegra264-gpio-keys-v1-2-89518c5fb29f@nvidia.com>
References: <20260827-tegra264-gpio-keys-v1-0-89518c5fb29f@nvidia.com>
In-Reply-To: <20260827-tegra264-gpio-keys-v1-0-89518c5fb29f@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=treding@nvidia.com;
 h=from:subject:message-id; bh=FMUT29d0gCBS+bbRE+EGDX8krEn2mKOQhio+Xait+6k=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqkE+pPrnDS1pI49XnNisF6K4gMUx/YUPJhJPiF
 ZH6rWuF8KGJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCapBPqQAKCRDdI6zXfz6z
 oSAsD/9nSoo30uOOCcMh8ApfoFsKtresvBXQLySXEqqOfVzj/wn9HVylR+Os8xFhe/3CVeyKVM7
 w77RuCDPYwA4hsM0Ylh2sMnxdGbUJkFxybdzLYCYep+5lSfAt+z/pHB/RwVrnAequ7A6gCnV4tU
 HnQEs9BZljcg1fsvLsOemZwg9Z4TBpBmtgDwwRlVwcXLYYiYLOMSDOmlnVUhinrlhlkqC/vrGbI
 W6ho70k06lTNiQJSha5PKfPGGfHZhLqpy1up4bgHsmzeZrFCVJzn0SlEvCc+oy4ZjsRetXw7eb8
 Mfr+zTmm3V1JpqZMmX/riEqJ7lBEJO3Z9IasSd2CGxRd1eQNNfxZ2gGIGUTAiIBCJ7ek1gNA0xw
 deCYJ/ofMF+U1o/srKI+yqgpJt1XOZmGQQc/lPkKQzPE4USueTctCz/vg11Ga48spRp+NedKf/r
 onnWCYvmbvomHI8AEPN3uQza5mcWtNJQsojiiDLlL0UFFuGM43fcVYfYhbYtGta6hRUk9jydaL4
 AqeTh/5Dl6n76pEJdRjB8rrZ1EUglZeNh1p/w6PtmuxnmhEpU39VT2K4Jdi3EzbnximoxEcFxqY
 UXIzpded3Ibtz9MR/XhROQRhSvwv0XZbtNCT6EaIfC3slA3W5z6VphD2FEX6hgCs5P5+ywOIUU6
 k3389co6S3FWnNA==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

The power and force-recovery keys are mapped to standard GPIOs so they
can be enabled for all derived boards. In addition, the power key can be
used to wake the system from sleep, so it needs to be marked as a wakeup
source.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi | 23 ++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           |  1 +
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
index 45f8df9bbfd6..c4ba3322ed9a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
@@ -1,5 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/input/gpio-keys.h>
+
 / {
 	aliases {
 		serial0 = &{/bus@0/serial@c4e0000};
@@ -9,4 +12,24 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-force-recovery {
+			label = "Force Recovery";
+			gpios = <&gpio_aon TEGRA264_AON_GPIO(EE, 1) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_SLEEP>;
+		};
+
+		key-power {
+			label = "Power";
+			gpios = <&gpio_aon TEGRA264_AON_GPIO(AA, 5) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_POWER>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 013228a81723..a1a86022d638 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 
 #include <dt-bindings/clock/nvidia,tegra264.h>
+#include <dt-bindings/gpio/nvidia,tegra264-gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/tegra186-hsp.h>
 #include <dt-bindings/memory/nvidia,tegra264.h>

-- 
2.55.0

