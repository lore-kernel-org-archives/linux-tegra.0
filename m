Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BB532BF4B;
	Fri, 28 Aug 2026 11:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917936; cv=none; b=Q+xBTsmKBvrv26MlVTZh4bMF+Br/x7x91ON76No/JBo75MP2W56h9RHXYjjMJRT5bKHTo2+EGA8MJKSm1KTTP6DYDDztXjro4/mr5RGbAJQonuhIQZnkI5GJFrMvKrchxAl3FQofFstK/H1160T81cl52VvMK2erzyu0BMXu6Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917936; c=relaxed/simple;
	bh=gG2CbM2u6TmysQTxpoOe5BODyoWCT1j7W05U9DU6yHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VAwddeLI9OtITcfFRFB/V7o20H7p5HGgUdOyn5uOn2bmuYwogsHiXyaMF0PhBHGK8aEZNTelOMBbFmvHzbc8GVZBWImtmZN3ZdeIC7UG/k70q1H2/VLK9ApBqW109LImcae2cHDjuFP8D0DZXyZiKlcOyKaqB7btMKRgI3I5JPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdfzBVRV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdfzBVRV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635631F00A3D;
	Fri, 28 Aug 2026 11:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787917922;
	bh=P28sB6K3sJRCfiuN+FcPvtop805Z234fNqsa7lD6qCU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OdfzBVRVY4gXTT2XKyFVqTbbFoce5mZ3ecUK0aBnJMC+uFvnrC1YQQfZBzHIQcwLX
	 hu9eKbpaNJp6RTT0emz+hO5gl5fARKrSclWY1IbG2wEXhS8fB5yGuUT8qku3mzyqGP
	 RpaPQ0WoXhHvHsgjV78t4eiYmKrJ7wpPPySTtfGvaPwHxWUW8C95HLKyAFi9wdIYPY
	 NzFNemN7Cw/z/nu990/a6dSquSucbsYLMX9rBMYwGfCcGcMSj0OibohZtNnUdn8CDJ
	 iiqWHDhGqObNc0eKajNQZfQ4DZU3syCt9hOwjWPKTeG9IkQ2KBtlSX0WTNZGkz/wzb
	 /2qpS/nlKeHKQ==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Fri, 28 Aug 2026 13:51:38 +0200
Subject: [PATCH v2 2/3] arm64: tegra: Add thermal zones for Tegra264
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-tegra264-fan-v2-2-a460389d8ef5@nvidia.com>
References: <20260828-tegra264-fan-v2-0-a460389d8ef5@nvidia.com>
In-Reply-To: <20260828-tegra264-fan-v2-0-a460389d8ef5@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2970; i=treding@nvidia.com;
 h=from:subject:message-id; bh=dP9aJ8Xqhp6Gk+Qp2TKG1UPeFLFWgmi95sK8ad9l9w0=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqkXZZwCp9KDe1M2ODQCFxjxo/vPHmjkLZVD6Er
 ERIXs1QXTeJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCapF2WQAKCRDdI6zXfz6z
 obUID/0Vt62Qbl1kNOS5LWBk6vjDsVRd3pEs2GkUf4/3i+FbRYjHpOqHUAxycYWIJgABUsIPkfP
 8VriYru+BiKMjtNAH+LBqYPIJugZUkkSiCKHIsYaXNhLy6Z/m3dTOLWXwXsV8sGpuTGvIJWDr3W
 qrJiNA1WfB6rzj+5pAoeYsWsqiI3ORmJuRtULG2jHDutkkh7GzIySrErzenMsVi/ttEkL6Hz4rW
 cJK8ax2pmVy2ClW3WtD4inVtOyoxrq9iDJzB3n6ireucUw1RC8soUlnQDZ6W4Url8uCEGBxoPH2
 cQEEmkoOF39U4M644dmY9VsrIv4ivWdhFNyK+rTRIOYSAkvIt+RhtPNmfUBOa95ahuW5tkkdxoO
 4xhXMokNI7pZlYTAT0pjqHVvwQpJgJilfhbW/mJpJ3G9NyGFCh2KgQKu+vTgAOh1kijBpzkTKvU
 hWK0sD+saLqBUBgp0P2CFXAW6NzkTfvZ23v9saqE/vwHlt77ShFJnXV8izra1wEpMjB8D2ozGsI
 +KmPTobrUSXEkxyWas5XVMubei2WMasCzgXfjC14FC1gHMngkGLy0jip8N6kJiKV1UAVJeyiUD7
 dJYE+yS1B3vE/i3GDgJxCPJz8UFernxXPQqUUdLtVqhFs5SUtz0YZLVTzOT6HtqN4Kx6AwZYtrM
 4hR90sDv9vM7v4Q==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Add the thermal zones exposed by the BPMP on Tegra264 so that cooling
devices can be attached to them in board-level DTS files.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- move thermal header below DTS directory
- fix typo in include guard comment
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 29 ++++++++++++++++++++++
 .../boot/dts/nvidia/thermal/nvidia,tegra264-bpmp.h | 20 +++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 630c20523dcf..953d50af0c08 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -7,6 +7,8 @@
 #include <dt-bindings/power/nvidia,tegra264-bpmp.h>
 #include <dt-bindings/reset/nvidia,tegra264.h>
 
+#include "thermal/nvidia,tegra264-bpmp.h"
+
 / {
 	compatible = "nvidia,tegra264";
 	interrupt-parent = <&gic>;
@@ -4625,6 +4627,33 @@ sound {
 		status = "disabled";
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA264_THERMAL_ZONE_CPU_MAX>;
+			status = "disabled";
+		};
+
+		gpu-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA264_THERMAL_ZONE_GPU_MAX>;
+			status = "disabled";
+		};
+
+		soc012-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA264_THERMAL_ZONE_SOC_012_MAX>;
+			status = "disabled";
+		};
+
+		soc345-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA264_THERMAL_ZONE_SOC_345_MAX>;
+			status = "disabled";
+		};
+
+		tj-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA264_THERMAL_ZONE_TJ_MAX>;
+			status = "disabled";
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
diff --git a/arch/arm64/boot/dts/nvidia/thermal/nvidia,tegra264-bpmp.h b/arch/arm64/boot/dts/nvidia/thermal/nvidia,tegra264-bpmp.h
new file mode 100644
index 000000000000..29695881f4cc
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/thermal/nvidia,tegra264-bpmp.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/* SPDX-FileCopyrightText: Copyright (c) 2023-2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved. */
+
+#ifndef DT_BINDINGS_THERMAL_NVIDIA_TEGRA264_BPMP_H
+#define DT_BINDINGS_THERMAL_NVIDIA_TEGRA264_BPMP_H
+
+#define TEGRA264_THERMAL_ZONE_TJ_MAX		0
+#define TEGRA264_THERMAL_ZONE_TJ_MIN		1
+#define TEGRA264_THERMAL_ZONE_GPU_AVG		2
+#define TEGRA264_THERMAL_ZONE_CPU_AVG		3
+#define TEGRA264_THERMAL_ZONE_SOC_012_AVG	4
+#define TEGRA264_THERMAL_ZONE_SOC_45_AVG	5
+#define TEGRA264_THERMAL_ZONE_SOC_3_AVG		6
+#define TEGRA264_THERMAL_ZONE_GPU_MAX		7
+#define TEGRA264_THERMAL_ZONE_CPU_MAX		8
+#define TEGRA264_THERMAL_ZONE_SOC_012_MAX	9
+#define TEGRA264_THERMAL_ZONE_SOC_345_MAX	10
+#define TEGRA264_THERMAL_ZONE_TJ_AVG		11
+
+#endif /* DT_BINDINGS_THERMAL_NVIDIA_TEGRA264_BPMP_H */

-- 
2.55.0

