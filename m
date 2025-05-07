Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8D372635;
	Wed,  7 May 2025 14:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628701; cv=none; b=P7wLXOHH0+lv/khI6ef8vvdwh0DQsfyUQHfZWgwj52pYToIA9oFY37ejfLJhEFTbVNeAvssfdyay76s50NYbMWLcYgOt9rSeYnLBwMLFq7QxkOKI4A6IG6M0GujDX3YFvCbMKQM45bHNCG+WLGGZMhjLEUfTkeo3pWFYBcQB7yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628701; c=relaxed/simple;
	bh=qgOXVS3uiOU5cM4Ku8pQlo1r3r+xgmzgLTfCXfnPk+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ukwuRugpP4/5TihA8Ee0vHvdkXkiGFdSpvK6fNsolCXAqF7F3pVfxU7dOOx2upLu7zlJaCl+bQefpVMeOAmqORV/Ra5MSXgX3p6Cuuscci3UqQTrqJLapTv9pcqZCrn41HePrBgPsREUamMnUI+AgHgpPX/LZOCZLADX1+R+YGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCCMihFG; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCCMihFG"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3995ff6b066so3484035f8f.3;
        Wed, 07 May 2025 07:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628698; x=1747233498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbaHkQtQrQfve1siYsg8GFliEdoPcVYlup1lmgOUvQ0=;
        b=ZCCMihFGmOrJ736bHKf5UyRWutAhA6FP5Am6muXP1SYFbCwJUE7jEUIkj3jLotCAYH
         T08ofwc88O+cQ2vhjMd0PxRmts/2XE+LEXzOdB4Gsf6PpNEmqRZWHrjPKnVy5piObHc1
         IIE3V4dvxeCF2GwVugpz2cGn4evOpgm4roC1XtA3EQQvQYan4aBSSChrs9Jl3+ZQx4Yx
         7OPsNBzBtbteXs+eACBvYLBVMGYE9eY2tDeiKpIntKvS56nnRDsrKK9wo8s3Dl2A3OA3
         etd4aEeFYAzKwJ9SNbpV8p2/lPgYq/Jvo3MzS8vQ9M9FvLA5wL3ZiI2qIBy07DnPJShf
         pMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628698; x=1747233498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbaHkQtQrQfve1siYsg8GFliEdoPcVYlup1lmgOUvQ0=;
        b=BImTuLhq9qGDttIvIX+OS8nY0G0ZSC3JR6z1iuHBBpIIxovPmvy3i3V7Rut+MgfhHb
         l+wlFrCr0uo4Vwnq1Oy6h5wWtryhoep6CjwxEVPyQ16fImpMkyo/WEr1pjmyxqCyhl+K
         pJ9oMuY3uGA0rBFiQtfnvDEKPvgma88e3o79MJGtKlb3lzXntYHKGSgdTS3yftAkX+cV
         NqAeVUT2DWrCg57METmui6F5Mk81y28sA4i1DPZ3gQY0mKae5jyY9WO6X0ay+Y/uelWp
         TURllUcEQW3SCk+SufUX/rVDMUBL9pJVIeMAlvhtMjly3CH3AQrpcZMShGJWvY0CfPS7
         G7QQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0YM+eUzCYoH7s8fBiUZ4mY+dpCeAHKzSRuFkjrk8FKAUmFjfkpNKYAdT7ovyv4VmHabPccjKsmlAh@vger.kernel.org, AJvYcCV6SvBzSiPtvlijguI5uoq7ZUIkAzo03PbcqRzoba3RloSsiyhxgXUfvYk6JnHs+MfcNysIY7xTSyS00yk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfvh40wtOxDEViu801cliYnhGED3HVzeP02qd9lnTd2byaHsmx
	rOXlYcq39oYo3jZ9AbQrJ/MNgiuyjUmqnLWiw8epbk3E60vVvQps
X-Gm-Gg: ASbGncvSZmQlLVkDAx9+d/FOk9tCLjXyFLsg5C2rEIR3BFSUec3T6kkmeFWAIehr1/v
	39USa7q239euirvT7dHFvw5WglHXVfznu690/2ehsQKSxz0pnn8ojUozyV5rsghLty4HhFnW3Sr
	suQbCzehGK5pYsohv5S64kjSSx9E0s7TMtS9lVkVZNUgFsr2h1nfUssIuxNHFC5ejNOa3NW2PsN
	TxfU3LbshtYw4rPm4Yezdy+241x4M8QYtlByDkcHvAwlSX+gJXh+9y4pyoAgoDNB/fTos/axZm0
	2s+2F15WpjJoA9jOuA/jg3KDJkPR4M6tUIXDiijOGycTYHJqKV0StDmin2GibDYrZHQjLLa67Kd
	4AwUNuSr++5Y1ZrZWeKeneD4d2S/oRPJ/
X-Google-Smtp-Source: AGHT+IGYNKab8V1AgUhTMk5nBJpFGPuJZr2l6irKlge2al5oS+JLeYqJPgX/NhWMNzzKlRWrRNRQmA==
X-Received: by 2002:a05:6000:18a5:b0:3a0:b63f:c88c with SMTP id ffacd0b85a97d-3a0b63fcbcdmr1889507f8f.58.1746628698354;
        Wed, 07 May 2025 07:38:18 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b1ff8453sm4744868f8f.34.2025.05.07.07.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:17 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/8] arm64: tegra: Add p3971-0089+p3834-0008 support
Date: Wed,  7 May 2025 16:38:01 +0200
Message-ID: <20250507143802.1230919-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507143802.1230919-1-thierry.reding@gmail.com>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The P3971-0089+P3834-0008 is an engineering reference platform for the
Tegra264 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/Makefile           |  2 ++
 .../boot/dts/nvidia/tegra264-p3834-0008.dtsi  |  7 +++++
 .../arm64/boot/dts/nvidia/tegra264-p3834.dtsi | 30 +++++++++++++++++++
 .../nvidia/tegra264-p3971-0089+p3834-0008.dts | 11 +++++++
 .../dts/nvidia/tegra264-p3971-0089+p3834.dtsi | 14 +++++++++
 .../boot/dts/nvidia/tegra264-p3971-0089.dtsi  |  3 ++
 .../arm64/boot/dts/nvidia/tegra264-p3971.dtsi |  4 +++
 7 files changed, 71 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index 0fbb8a494dba..171e08c94d5a 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -12,6 +12,7 @@ DTC_FLAGS_tegra234-p3737-0000+p3701-0000 := -@
 DTC_FLAGS_tegra234-p3740-0002+p3701-0008 := -@
 DTC_FLAGS_tegra234-p3768-0000+p3767-0000 := -@
 DTC_FLAGS_tegra234-p3768-0000+p3767-0005 := -@
+DTC_FLAGS_tegra264-p3971-0089+p3834-0008 := -@
 
 dtb-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra132-norrin.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2371-0000.dtb
@@ -31,3 +32,4 @@ dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3737-0000+p3701-0008.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3740-0002+p3701-0008.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0005.dtb
+dtb-$(CONFIG_ARCH_TEGRA_264_SOC) += tegra264-p3971-0089+p3834-0008.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
new file mode 100644
index 000000000000..94ace6784749
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+#include "tegra264-p3834.dtsi"
+
+/ {
+	compatible = "nvidia,p3834-0008", "nvidia,tegra264";
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
new file mode 100644
index 000000000000..06795c82427a
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+#include "tegra264.dtsi"
+
+/ {
+	compatible = "nvidia,p3834", "nvidia,tegra264";
+
+	aliases {
+	};
+
+	bus@0 {
+		serial@c4e0000 {
+			status = "okay";
+		};
+
+		serial@c5a0000 {
+			status = "okay";
+		};
+	};
+
+	bus@8100000000 {
+		iommu@5000000 {
+			status = "okay";
+		};
+
+		iommu@6000000 {
+			status = "okay";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts b/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
new file mode 100644
index 000000000000..3a6f4b7e6b75
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+// module files must be included first
+#include "tegra264-p3834-0008.dtsi"
+#include "tegra264-p3971-0089+p3834.dtsi"
+
+/ {
+	model = "NVIDIA P3971-0089+P3834-0008 Engineering Reference Platform";
+	compatible = "nvidia,p3971-0089+p3834-0008", "nvidia,p3834-0008", "nvidia,tegra264";
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
new file mode 100644
index 000000000000..46cfa8f1da1c
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+#include "tegra264-p3971-0089.dtsi"
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
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
new file mode 100644
index 000000000000..e8576cf2a0b6
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+#include "tegra264-p3971.dtsi"
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
new file mode 100644
index 000000000000..6b6259b7310f
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
@@ -0,0 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+/ {
+};
-- 
2.49.0

