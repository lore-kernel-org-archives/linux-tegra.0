Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378474;
	b=hBdj/5jye4tLfa0nyS40aDjVEAiqRTXmkEcZV68ujglGK6PG41Z/83brmwirggbg56VB
	 T45+7UN+vUGnlYAkVIilkMjt+ZmdUsaJ0hTm8fncGOvSA3+0ytzfuQYpT5ykoQvn/BwaT
	 JnBoqvBBF5SkO3kdlmZzNO2FFP8xnSB0UpCopQHWifQ8vU9X3xWCT2Pm8K/iMaeGQuAOc
	 aIRKsiCFB9OY5TShZrgSwRNNcydvaWE7Go9A+o4ETvAmBPRpbBTcjau0VviF61XpkJOaL
	 GWNR5pfFHN7a5J1524U/KVhgjZnOEvePLAMDYcIffX9FkQg0yS6WmLy3Kk34Pzo4GTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=43C9bHqJisdAiTlKpHe0KRIkeYtDhHYePbH6vei7RK0=;
	b=VVaIqqpQLH5/fAgel8cXFmE8B2KSUEIbF3MD7sNpslaAEkK7nd/yGROeo/Emqlm4SPtd
	 Flsj3Im+2EDBkMKSEBFHRqpSggfwZba2bMm+km0uJxJk39DU/f5McHroBVRfE6V8t6rs4
	 /UEa0hDMyOVdMOFl9oWxpvCCyeJYrI6u6vjg51iuLg4WzbfxZ2LezhKlgkggze0yzgFyb
	 3A5PGmUAFRpPSlrcSOgXtTpzHkKNfdI+hQohYXzfEwCOGrIHggbxiT2Jvjozpy5JnlxHZ
	 1t/UqM+BVs4I4o0OJujF34AIW+zMIkzBpRZiefqJnyAgn8M6zq13mv8Z6ReJ3yQyZTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GD11zxSi;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF50606A337
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 20:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF50606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GD11zxSi
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6bab10842f8so597799a12.0
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 12:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378472; x=1795983272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43C9bHqJisdAiTlKpHe0KRIkeYtDhHYePbH6vei7RK0=;
        b=GD11zxSiqy4Bn6JUPtpI2nzRDhPvnQ8oPMB0enhNHvhAbU8Tug1YknC/gXCIwxymdV
         zidBrWfwT2WuR3UnCSQiFs4Z1VtoIf6wwSl2MBzxqx7XdZ7iQZj5kYNdd/+/D1WV8yqB
         Z5kO0WaWrD8prhA3s38DVOvV/2aPBJ9AYsxiBd/1Ec+kbPguwKTYSBp8+NqH4TkFpVXJ
         nZEOru06DOxWW89F/wjAS/t8FlrX2Fl/cUHdShpSjgEQjDBr5kCQNQW52/fZWZ1c6LHd
         pg6cLdYJAWzQc73ppZJeBQD0NaVNEuuavBE8Ma+Avp0I2QL4P8oj5rxf6coc2MzOeryP
         0hIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378472; x=1795983272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=43C9bHqJisdAiTlKpHe0KRIkeYtDhHYePbH6vei7RK0=;
        b=d/chppetTbus5txogUM1udJSu3jJpLxxSrk6DxHHrU8KIoKOP7/WXlFjVhExUzGd33
         ihEk8U518ARVG7sU5mW1m9MV//gwz1FujdyOOxajX5CtF0cVXFCc2YdOLwUvoAebaB7b
         3GW7zXs2e4iw9pmcTkxbsx9HqI7W2KST2FYSOW0iyoiKATfgQYjjd11xjYV/XAEFeZda
         lrGD72T9+AznsrttiRnEfNKu4QJlVwYZCz1qz3/8YTcgEaaqIS7AFno2y6lf/bSIN397
         OHhHkCqOAEfNJ5CF42iPXAiaJg4egeSrDQ2fXm80McbzwOYEEdo06ww5VFEirqugR+RJ
         97Lg==
X-Forwarded-Encrypted: i=1; AL+hErEi2sdJ55JbjfmrHi9A+QppMndUvgVslfLy28149SeU68OgVpKXzJrqGZHL/o7Ft+grGRfMiUza5RLr+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9yQ6FhansaiuGg9FYZH3LbYpTQU+N3Me6K/5D5YGezc4LNG/Cg
	hKFJDL2pQA0MxtBOajE4dijdx4C1wswWb3llX71wpw/9mwPjW733LiPG
X-Gm-Gg: AZFdTZem4/rrwwCC/QtqpmXm4cGFBU6rIy67TTT2wC5sKavb8ZqMuVj71GyLtG6PnYO
	Q4gAUbahYRfBD+U/TfdJPtTV12QFapID4qrpbTaoXvOXBkeyK4z8mNOWlmscYpgt9pVGj/Wt/QR
	nHCpCCFCVFs6HCnGll0+9RKh9SFqmZk/irZheOcVWKUJ+o9+bAj4bQqM9pBbnZANiIi2ovKIRED
	ChiYSxZrOaXaAA1UIubPRum6px8DrEInHoEDRze1uzwBotOFLvdjaj10xd3A0akrpNTIsK2Mqks
	/LhC3FHsRV2KaSE3ousUt9hhWn8brDP/p49iCcifWPBA3qCWtqWD05uvZiGnZ/7vkL0HIxY0TaU
	9LY6DnA/JmXwqSDtWe219o5jRehI1R1nq2WEL/h9LSvedrE5RfGIzjx2Rne2RUzfCiLTax0XXaC
	L2XjEXnCDUQTIxNnsK5L66H7RLY8l5bgmFX/FAyvrbZYIJnokVNNf9EYfcK2+tvhJBxmCyROe51
	6ll2g71G7ZV6fXr1qf4ZW5ljfXnPCSLO+mtjrYUsyTXgX2gdDu7WA75r31kZ3q3PoLk3Zgxynt9
	xBTmpmipIg5HhByH6v4Nx5BIfmKGsVhJRih2BIjQYDgrq7ESUGqHJ4mEWtheYMMlrW8EwqGLbtc
	FoRKg25GdIg==
X-Received: by 2002:a05:6402:5652:b0:6b7:6485:2413 with SMTP id 4fb4d7f45d1cf-6ba1fae101fmr5953289a12.5.1795378472042;
        Sun, 22 Nov 2026 12:14:32 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:31 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/18] ARM: tegra: Diverge Tegra Note 7 device tree to support its common versions
Date: Sun, 22 Nov 2026 22:13:51 +0200
Message-ID: <20261122201407.23742-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tegra Note 7 has at least 4 different revisions. To reflect this, the
existing Tegra Note 7 device tree is set as a common base, and the
differences are placed in separate trees. These separate device trees will
be populated in subsequent commits.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/Makefile                  |  6 ++++--
 .../dts/nvidia/tegra114-nvidia-tegranote7c.dts     | 14 ++++++++++++++
 ...n7.dts => tegra114-nvidia-tegratab-common.dtsi} |  4 ----
 .../dts/nvidia/tegra114-nvidia-tegratab-p1640.dts  |  9 +++++++++
 .../dts/nvidia/tegra114-nvidia-tegratab-p1988.dts  |  9 +++++++++
 5 files changed, 36 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegranote7c.dts
 rename arch/arm/boot/dts/nvidia/{tegra114-tn7.dts => tegra114-nvidia-tegratab-common.dtsi} (98%)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts

diff --git a/arch/arm/boot/dts/nvidia/Makefile b/arch/arm/boot/dts/nvidia/Makefile
index 7fc27cb8e74ae..f06b2595bcd86 100644
--- a/arch/arm/boot/dts/nvidia/Makefile
+++ b/arch/arm/boot/dts/nvidia/Makefile
@@ -5,8 +5,10 @@ dtb-$(CONFIG_ARCH_TEGRA_114_SOC) += \
 	tegra114-microsoft-surface-2-0b.dtb \
 	tegra114-microsoft-surface-2-13.dtb \
 	tegra114-microsoft-surface-2-efi.dtb \
-	tegra114-roth.dtb \
-	tegra114-tn7.dtb
+	tegra114-nvidia-tegranote7c.dtb \
+	tegra114-nvidia-tegratab-p1640.dtb \
+	tegra114-nvidia-tegratab-p1988.dtb \
+	tegra114-roth.dtb
 dtb-$(CONFIG_ARCH_TEGRA_124_SOC) += \
 	tegra124-apalis-eval.dtb \
 	tegra124-apalis-v1.2-eval.dtb \
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegranote7c.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegranote7c.dts
new file mode 100644
index 0000000000000..1b50d5bbbbdf7
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegranote7c.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "tegra114-nvidia-tegratab-p1988.dts"
+
+/*
+ * The LTE version of the Tegra Note 7 appears to be identical to the P1988
+ * revision of the Tegratab. The main difference is the modem, which is
+ * connected to the second USB controller configured in HSIC mode.
+ */
+
+/ {
+	model = "NVIDIA Tegra Note 7 LTE";
+	compatible = "nvidia,tegranote7c", "nvidia,tegra114";
+};
diff --git a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
similarity index 98%
rename from arch/arm/boot/dts/nvidia/tegra114-tn7.dts
rename to arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 4b1e47364fdbc..e4ba975fcc3db 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -1,13 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
-/dts-v1/;
 
 #include <dt-bindings/input/input.h>
 #include "tegra114.dtsi"
 
 / {
-	model = "Tegra Note 7";
-	compatible = "nvidia,tn7", "nvidia,tegra114";
-
 	chosen {
 		/* TN7's bootloader's arguments need to be overridden */
 		bootargs = "console=ttyS0,115200n8 console=tty1 gpt fbcon=rotate:2";
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
new file mode 100644
index 0000000000000..409df3de17a82
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra114-nvidia-tegratab-common.dtsi"
+
+/ {
+	model = "Nvidia Tegra Note 7 (P1640)";
+	compatible = "nvidia,tegratab", "nvidia,tegra114";
+};
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
new file mode 100644
index 0000000000000..00126da319ec7
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra114-nvidia-tegratab-common.dtsi"
+
+/ {
+	model = "Nvidia Tegra Note 7 (P1988)";
+	compatible = "nvidia,tegratab", "nvidia,tegra114";
+};
-- 
2.53.0

