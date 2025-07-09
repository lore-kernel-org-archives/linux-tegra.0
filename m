Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3A5268FDE;
	Wed,  9 Jul 2025 23:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752102856; cv=none; b=uP4PJea8t7jQvLaVZ38bgrrgQUZqN7DGBVU6n/eevQ3UYHAHrzV+gfEYhW98vxSb7vQBSkikj2TYuQ9ugSOZbGQkwv8EemMQjG7bl9nsjVLlChtvcH9Re/GPFdKgoixdyD2Q/B7eaXmddCnRUnLsDd5KC54jcBO/mA5nvJtfd6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752102856; c=relaxed/simple;
	bh=D1y+rPayQvrsH+Ew130NKJ+tRrInZSykLMXjMP2YSj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hiqpSJT1iBzdOXceep7RRb4+q/Ql9YOc1+GhWJbB2IfNWTRLK2Io2Do/01OSD4FDVzn+L+p/jXVwrlV07PNLUOantIEg9j3k3qpuM9me5GIzIDqyAW1eEK10JcJ7HPVHfeMWTg4PVPw9pI0R/Qlxj8bxwEl9eRjPRW6te5hEDa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ytp29Av4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ytp29Av4"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso433414f8f.1;
        Wed, 09 Jul 2025 16:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752102853; x=1752707653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbXL/S0flV/EERwUX8pQUxtS3ncEMTjhJUUaajeXmYg=;
        b=Ytp29Av4h8Y9X9Uj9GA2WU+v89nNf2I4Ls2joztZAhqI+DXOt0AfZbACUCKDBqmT6U
         V3bpoPCTHmhwrorx0HIjOHHJi/WRyx/209ayyupdnnOu1rOfkHLJNO/vCC8kfxdoKp5B
         kdDtaJCb0v9sOhdMMDGCmxVTIFdWCk5ALhYQorryIvF0xKiPvjgWe7uyBl2HRs3xo4wI
         4KbhLsG/qId0Nj8EH7y/NYpDUJqORJWb0gsOn+abRdjc+D0J6fwAjuoAOlNha367+DnM
         nZnmM/JAKn+0k35w/kq6WoL9EiLPf4d3/pRq4bbPO9kKGHzx4daqz6KKJXL+9HIHSNFv
         quuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752102853; x=1752707653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbXL/S0flV/EERwUX8pQUxtS3ncEMTjhJUUaajeXmYg=;
        b=GhnPGCIVwQiRYUxzJ+9/TDwlc4inftg+ItZN/zHOHIKW8tJAYqlZGnuGJDyM9EwWFE
         XX8d1CYso+VVW3vv2cM8G+cl+jPRWAUuqsbkBRB9vKCeVIReg4/h2cDIIlW+sYa6/dXG
         YKUjvsOBM+ULrC/nyzmVHtyqQVaalILRWccskhRpSi0LG8sVrVmmrbf/d3btPSZFQLbI
         qYMwZmIe4j7Oi7XhofLbKUawlSKWk7g/aa5HhQxCC6/oNC6GynIc5CceT8UWcMJzolvH
         SYamh44eoqtr2440IBEHH1+85MdyY9m2nev6a9zFofJV3kyknw5SO1dCHW2FbioJgxxA
         I8uw==
X-Forwarded-Encrypted: i=1; AJvYcCWEbCnnuvHCk0jTsaclJuuDn9e+u13xI9HPIQrXLjAYnrTd5HpipIxpL9r7xfHXlxxekmn20nNw3jfv@vger.kernel.org
X-Gm-Message-State: AOJu0YxOe5M2miwdEJCRRhZ2OFkv/vxKGfQ1Ohf0rKA51QpWejd+v33f
	yh0/t91lnNlnZIC7972PDV4Bb2oVVlM+UkfTnVNBR7qeMBADHfMpoHzM
X-Gm-Gg: ASbGncvumOIOhmtly8FSWGXZZC0OsXOROSJhSblT0ZSxP5mZq4GBzI3isGo5uVz2AsS
	ygfX9Gq8z1ca1Q2LI8XJMxvIBPg3+3qKOKbPeCTheRBfOPxYSejR4jv9kLn9EtBO8nE0AJuj13A
	y41ujnm10INqYqDCCH1SIVG1SBGmOL4lSlGLftWsMWfT4eJvtelTHjdySWSSKjZuk5yDPxf6Cjh
	cjlGrY2NSf/WcsKt5G+ubzIZL5AOTzaSHU7aZ5wi8it3OENIK2SvISgLMOUTRKv7B8EgoLw3SCt
	K8Y2IW8y4eP3W/yKm0SCNes70fwbC+nOQ7ghs67uZ3qWa626akZWCWS/6PfiBbXz4COaGJYBdwP
	wjcOcEsZThm3PnZx8Ob3Rt0pbGEi1XMp0G7AIK8cou72M9OhZhind9w==
X-Google-Smtp-Source: AGHT+IHJeSZcFJN2vEousoLxhSuB/8CQ4ebukITBDnvU7lDlxRGB5m500Ny2GNYptWz7HSlFjF2XYA==
X-Received: by 2002:a05:6000:42c5:b0:3a4:fea6:d49f with SMTP id ffacd0b85a97d-3b5e86d242fmr242863f8f.49.1752102853197;
        Wed, 09 Jul 2025 16:14:13 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8bd1792sm216936f8f.13.2025.07.09.16.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 16:14:12 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] arm64: tegra: Add p3971-0089+p3834-0008 support
Date: Thu, 10 Jul 2025 01:13:59 +0200
Message-ID: <20250709231401.3767130-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709231401.3767130-1-thierry.reding@gmail.com>
References: <20250709231401.3767130-1-thierry.reding@gmail.com>
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
2.50.0

