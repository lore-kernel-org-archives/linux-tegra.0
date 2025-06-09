Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DAC27FB3E;
	Mon,  9 Jun 2025 04:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749443084; cv=none; b=Qq+LwxHzs7i1r3qJtTfnkZxMctdxfEl3aN76jhnqT59yeHjtFkgGVlV1F0W/fy9o7C8fuD/lb7t8tsJ6OJChIFcOk/ah1kXCGdxyJv43FsIP+QYDGpy7ED3yyGwasvLIGmIMnIw2LEwGVPDlDRw+5z1HXL1iczbMu1v/t+/sh0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749443084; c=relaxed/simple;
	bh=GpESXuLTnIpa0NyHz1NOghGb5dFFt5U0TuV49z0R2co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eFsdvTk9+STbLn0F7etGmYYDqvNnuVevOWQnzdW9WJjZjX5BjziHXeaU7kIsZysCQ/LvNWTuH2apTe+Rg0mS5TuRSBtBd9zkVGnloA64CdAJMWSYy4oaZfpZZT5AbuO5feHcMErw/PnmoxgBcEandaiLw3q4zdDqzzoF93LIXQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhPLBed8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhPLBed8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EF97C4CEF4;
	Mon,  9 Jun 2025 04:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749443084;
	bh=GpESXuLTnIpa0NyHz1NOghGb5dFFt5U0TuV49z0R2co=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HhPLBed8IpS8hXD74gwKc2z9JsnCSsTKqbvUPYQMIMI9LTNX159JUuK8Mv/baTPt9
	 br8SoVc4myYK809871+EDMjfOVJ9sX6hjfgt5le5I7juldhoeM19INiaOmGU4KrKaJ
	 rduaaA+CnHvkUQ9CablwKBYgkrBdyy3S00Lnh3EhAHVhYaZpqovuTocfWCNUpN6Iqq
	 UmKac/LgU9GE5luvdX5Vl27wr/Z943YmXSymyO7XBcpy35oYGN6ZWpoMXxukgJ/S9v
	 w4nHUi3kQVWiSsror7CO4l/b+xflgBnZ6cqUEdFi3ZUHC+B6VmzJnrsy09HxP4Z2OV
	 UjXI6vUuVpT/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE84C678DA;
	Mon,  9 Jun 2025 04:24:44 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 08 Jun 2025 23:24:36 -0500
Subject: [PATCH RFC 2/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer
 Kit support
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250608-p3452-v1-2-4c2c1d7e4310@gmail.com>
References: <20250608-p3452-v1-0-4c2c1d7e4310@gmail.com>
In-Reply-To: <20250608-p3452-v1-0-4c2c1d7e4310@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749443083; l=2561;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=YLiFsraUkGmyKrqoL/QLWSsEB+CXYWPoUrGhnNqenxg=;
 b=HBksLzvtJ5hPiZPk9cOzoPhlG3v0IACSpZhKFibj4Lrp0nhkGDw9BpdVfNsFWxjYCM2K8KbB7
 3Ie4LXe2ttgAF9/S6ZZV1ErEkzP4yfHAgb2JFovvmnDSx4LKCYA/XAU
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

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/Makefile                |  2 +
 arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts | 43 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)

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
index 0000000000000000000000000000000000000000..b86bd7f411088df1e48f4c2a61deaeae1f35d23e
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts
@@ -0,0 +1,43 @@
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
+			usb2-0 {
+				vbus-supply = <&vdd_5v0_sys>;
+			};
+
+			usb2-1 {
+				vbus-supply = <&vdd_5v0_usb>;
+			};
+
+			usb2-2 {
+				vbus-supply = <&vdd_5v0_usb>;
+			};
+
+			usb3-0 {
+				/delete-property/ vbus-supply;
+			};
+		};
+	};
+};

-- 
2.49.0


