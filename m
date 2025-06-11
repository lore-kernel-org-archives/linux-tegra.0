Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DF6288C0C;
	Wed, 11 Jun 2025 18:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749668026; cv=none; b=s2JRM+waULqjkTbbVrifdGN/P+SNH374mvhe4O58+1Nqyc97xCWVTnlIbCHS7ma5t/nXZ+5Rsi0alnyAdWiIGB4VYEOAbzlfV1WbvNDm6omPrnO0/yxy9lTEFB1PHYKiu2iMq/+bvJC/LiMfZ3c1S4IWcaVR2rzO/9uOS/k2oNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749668026; c=relaxed/simple;
	bh=OrWtfE0k8fSxvMydg+gq6xQRUTFOXMBiDeg+VK4LNAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OErOr4iktmHq3LSn/KM1uqGTK5EeHCP1cZW/RteYAdIO3xhvKc+Xqvgc0idUoTmiILw+QQ88KPx4HBAwyCq+u6nKW77Hlw7e2gdTTVOm+S1Wzd4li+5QwtVpybv7ecdIWI0K9LsH9vWq0uQoPik2UQgukmuy3vyKnkI/GhNbAdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1nPY+BW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1nPY+BW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD1A7C4CEF1;
	Wed, 11 Jun 2025 18:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749668025;
	bh=OrWtfE0k8fSxvMydg+gq6xQRUTFOXMBiDeg+VK4LNAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e1nPY+BWIXwpv6n98YDwrMgmy1z0RPEtC9XT5DnT+Ih4yEO3htdSeK6UD0sh3GjST
	 NVfKMrKRaAaR12HmHO2q3YqufBY9024ycYH60MwmKUmBC0rIEFSOkUQPpGLXA3L3Z3
	 F6BtTaD6gAHTw8C7Lj86Tmh+S27mrkKBPUb+i2JmlqeplZ3M4WnKu+duAp4hD7P0GM
	 E0z4tk4bzw2ENkdzVHI9/PmJvh9SXV9CJIgRO80bx9qtvqp1ww+StdRteY+W/iAg1l
	 tDBne7eBp0hfPdoO/HcHaaiH8COPONmGcBoaoxOgVgvRAB41RrnBLXZzt8W5t2q+S2
	 geXZV1NOldLiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5F2C71141;
	Wed, 11 Jun 2025 18:53:45 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 11 Jun 2025 13:53:38 -0500
Subject: [PATCH v2 2/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer
 Kit support
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-p3452-v2-2-fd2679706c63@gmail.com>
References: <20250611-p3452-v2-0-fd2679706c63@gmail.com>
In-Reply-To: <20250611-p3452-v2-0-fd2679706c63@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749668025; l=3203;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=42OimoFJFrvH09yIqaz1jWdoda8v/mnkO8i3GiH9JpM=;
 b=s9iva6uoq+uW+o+2KkN3I/3FReqx2GkSwk5aFp5eApaNzLaZxXMZdb9o6G5SFcQyryaIz6W4u
 hJeNJRTC1A3DPtrb7saPzfe9Bq4TIacnCWDgeuliVkSm52C6EnDKWeU
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

This devkit is very similar to P3450, except it has less ram, no display
port, and only 3 usb host ports. Derive from P3450 and disable the
hardware that is unavailable.

Gpio PA6 is used to control the hdmi power rail and needs to be on for
hotplug detect to work. This is mapped to the 3.3V usb hub on P3450.
That usb rail is not used here, so delete the regulator to avoid
conflicts.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/Makefile                |  2 +
 arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts | 59 ++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index 0fbb8a494dba5089d9b7243e766bd6028b7f3744..2989550e0d482e0dde09c1ff89930f7eb7b5b644 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -3,6 +3,7 @@
 # Enables support for device-tree overlays
 DTC_FLAGS_tegra210-p2371-2180 := -@
 DTC_FLAGS_tegra210-p3450-0000 := -@
+DTC_FLAGS_tegra210-p3541-0000 := -@
 DTC_FLAGS_tegra186-p2771-0000 := -@
 DTC_FLAGS_tegra186-p3509-0000+p3636-0001 := -@
 DTC_FLAGS_tegra194-p2972-0000 := -@
@@ -18,6 +19,7 @@ dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2371-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2371-2180.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2571.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p3450-0000.dtb
+dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p3541-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-smaug.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2894-0050-a08.dtb
 dtb-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186-p2771-0000.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts
new file mode 100644
index 0000000000000000000000000000000000000000..b86e271dde0bee7ceb70f16113eba5cf06da98e2
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra210-p3450-0000.dts"
+
+/ {
+	model = "NVIDIA Jetson Nano 2GB Developer Kit";
+	compatible = "nvidia,p3541-0000", "nvidia,p3450-0000", "nvidia,tegra210";
+
+	memory@80000000 {
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+
+	host1x@50000000 {
+		sor@54540000 {
+			status = "disabled";
+		};
+
+		dpaux@545c0000 {
+			status = "disabled";
+		};
+	};
+
+	padctl@7009f000 {
+		ports {
+			usb2-1 {
+				vbus-supply = <&vdd_hub_5v0>;
+			};
+
+			usb2-2 {
+				vbus-supply = <&vdd_hub_5v0>;
+			};
+
+			usb3-0 {
+				/delete-property/ vbus-supply;
+			};
+		};
+	};
+
+	regulator-vdd-hdmi-5v0 {
+		gpio = <&gpio TEGRA_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/delete-node/ regulator-vdd-hub-3v3;
+
+	vdd_hub_5v0: regulator-vdd-hub-5v0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VDD_HUB_5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&gpio TEGRA_GPIO(I, 2) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vdd_5v0_sys>;
+	};
+};

-- 
2.49.0


