Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71883A3835;
	Fri, 20 Mar 2026 23:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774050214; cv=none; b=uF61hpQbuHK1EGbT7xcmcE/DVDjwtsqeFCLfsKsa2ObrRMLroCjEh4bjBS6ph2FAiE1HhQQEFkgbijPAxRRTitu3oHLU+W8xI0W0VlARgKcfInl9MPcN7DWpQLJCOWKrEP7d9KurSVZjq3BuxAW77EusMlL9RKCiEg31pogGi98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774050214; c=relaxed/simple;
	bh=zYzOxpfLlxdjy9u2mLO8H9uBkr/4C9BCqOd1KYg3G3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OpUyJNVWkwiMAGTOWYQ5yIJiyt1xd3Ah2Dp0yvY1ZjZWe50TOuX68RihvOKNAFoFa0W2SMXB4linoh31E4fQzvn6T7yNGVgKpM+dA/Tj1mFz6NUVwzt170p8UdLu9qwpDAp6nLd9C3nF4xzs0MSkfp7SJR1llGuLSg38hVV3wUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvfLH4pg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvfLH4pg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD8DC2BC9E;
	Fri, 20 Mar 2026 23:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774050214;
	bh=zYzOxpfLlxdjy9u2mLO8H9uBkr/4C9BCqOd1KYg3G3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hvfLH4pgCd0PlrLaEyiHnULiZDfQQbKfNlatweNXCM4T3aybZHckww2Y9uwAYwHin
	 oNk1cp5z6zqMqBr9MQGtfMKQQTkgNHI0LF4WULCyVpWfHhBgDVaOFnHahb99T3NaVj
	 vU2CJsz0eSv641B0U+o5dWioEsRcvpixyXo8mi8zF9diByEphhQyJlxWZX331U8Z9P
	 lwzPU3p2ZpRzzgR/vU6qcswwQlKKzlZbJX98D3n/xRxj8KyfAigSwIGyqHT0ZJqieF
	 D9uCMQldjkAEvx1m1B1XAQlUv+Nex6gtl/iNNCQcAvSMNGtBuFKkhZthylK/7Xbc0Q
	 HGWDbf6K7QqCw==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] arm64: tegra: Add Jetson AGX Thor Developer Kit support
Date: Sat, 21 Mar 2026 00:43:29 +0100
Message-ID: <20260320234329.2579213-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260320234329.2579213-1-thierry.reding@kernel.org>
References: <20260320234329.2579213-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Add basic support for the Jetson AGX Thor Developer Kit. It's quite
similar to the existing reference platform but has a slightly different
carrier board with different mass storage options and I/O.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/Makefile                  |  2 ++
 .../dts/nvidia/tegra264-p4071-0000+p3834-0008.dts    | 11 +++++++++++
 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi   | 12 ++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index b139cbd14442..72c0cb5efa47 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -14,6 +14,7 @@ DTC_FLAGS_tegra234-p3740-0002+p3701-0008 := -@
 DTC_FLAGS_tegra234-p3768-0000+p3767-0000 := -@
 DTC_FLAGS_tegra234-p3768-0000+p3767-0005 := -@
 DTC_FLAGS_tegra264-p3971-0089+p3834-0008 := -@
+DTC_FLAGS_tegra264-p4071-0000+p3834-0008 := -@
 
 dtb-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra132-norrin.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2371-0000.dtb
@@ -35,3 +36,4 @@ dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3740-0002+p3701-0008.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0005.dtb
 dtb-$(CONFIG_ARCH_TEGRA_264_SOC) += tegra264-p3971-0089+p3834-0008.dtb
+dtb-$(CONFIG_ARCH_TEGRA_264_SOC) += tegra264-p4071-0000+p3834-0008.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts
new file mode 100644
index 000000000000..df6555b6d0e0
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+// module files must be included first
+#include "tegra264-p3834-0008.dtsi"
+#include "tegra264-p4071-0000+p3834.dtsi"
+
+/ {
+	model = "NVIDIA Jetson AGX Thor Developer Kit";
+	compatible = "nvidia,p4071-0000+p3834-0008", "nvidia,p3834-0008", "nvidia,tegra264";
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
new file mode 100644
index 000000000000..45f8df9bbfd6
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+/ {
+	aliases {
+		serial0 = &{/bus@0/serial@c4e0000};
+		serial1 = &{/bus@0/serial@c5a0000};
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
-- 
2.52.0

