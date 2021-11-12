Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC46C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B06B61039
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234940AbhKLMjN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:39:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231652AbhKLMjM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:39:12 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7922DC061766;
        Fri, 12 Nov 2021 04:36:21 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id b12so15287826wrh.4;
        Fri, 12 Nov 2021 04:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zHiTZHyfCPKYIMhub7GuBrT8ulvTaEX2NWZm9Yhsbb4=;
        b=W+ite0oDuvPmWMP65ro6yPN67E5dAA+ZnZOZjJxz/aJTE870XxyHBKn0AOkt7wkeid
         Zm4IIYEvM82+QXoucCC9dMwvgjdFthw8R1fP74Onm/7PeSPMGQ2e4TKiWTPyNZx/JLWm
         KR1kaBQD4ixmJ4XxYBJgLQMgp+o2HMdvJ5LVKI+WOz6dPFFc0Ar4U2FOy4vDfvOsWymV
         aVW5GhfqT7LApLV5VO7UAZdh9UJvPlDQP4nYkuBgv9PGZdU4dEOA145zeXWLTzaP6TCR
         XVW5sRwMhVI2DMXb1sNTZIpgRKvM0Q9OP+WCi/3kh8PdXZlBwUbCYpnuJLuZp5AcvRav
         K7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zHiTZHyfCPKYIMhub7GuBrT8ulvTaEX2NWZm9Yhsbb4=;
        b=LWnkrPBrSXuf/LsauCEIEU82uMic2DE55Bna/XdoKiJvQbLMhhxZvHsFQc5HO7lDj6
         R7VU1ISlZE7JqjW5pqLAI4OzyF+p2JoBZSxg1LlTQaOU14lz2jdlA+/hN18tY1Oz5iOi
         byNvGd+CSCFmaejKJxHT+/sGYE0cSuzS+PON9y+Fc+Csv3H2NEhlNnkL+6seFt8XRl+5
         WFGE1nPJULKjBjScjLpnDczDQqa4NeHlKFcpzB7mNu1kjnP1hF5EOvA4fEfeZTkeUvBE
         SPQA2GncCV+ciD+r8QV+U96UAGAJPQVCO8LaJ06CpwfivIBDLb8GGrHl6rdNoUWmv3pi
         GofA==
X-Gm-Message-State: AOAM5331YVLybaOzzQYlCCn6qbGAGCZ84A090CoKhchmlo4zJpshgHMP
        B2AD9iHmsCsdHHPjKR7QMy0=
X-Google-Smtp-Source: ABdhPJwigPesw0YSxeUU+3t05dwjD/rfupyAJjvypCLSX4uz37bT2r5oVhLl3fDZR4A4urhiO6SnhA==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr18335060wrr.365.1636720580101;
        Fri, 12 Nov 2021 04:36:20 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id o3sm12459754wms.10.2021.11.12.04.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:36:19 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 11/11] arm64: tegra: Add NVIDIA Jetson AGX Orin Developer Kit support
Date:   Fri, 12 Nov 2021 13:35:42 +0100
Message-Id: <20211112123542.3680629-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112123542.3680629-1-thierry.reding@gmail.com>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

The Jetson AGX Orin Developer Kit is a continuation of the Jetson
Developer Kit line using the new NVIDIA Tegra234 (Orin) SoC.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/Makefile           |  1 +
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  | 25 +++++++++++++++++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 24 ++++++++++++++++++
 .../boot/dts/nvidia/tegra234-p3737-0000.dtsi  |  5 ++++
 4 files changed, 55 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index c80f7dc2935e..ea3f338fd013 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -12,3 +12,4 @@ dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p2972-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0001.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-sim-vdk.dtb
+dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3737-0000+p3701-0000.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
new file mode 100644
index 000000000000..d3c936822186
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "tegra234.dtsi"
+
+/ {
+	model = "NVIDIA Jetson AGX Orin";
+	compatible = "nvidia,p3701-0000", "nvidia,tegra234";
+
+	bus@0 {
+		mmc@3460000 {
+			status = "okay";
+			bus-width = <8>;
+			non-removable;
+			only-1-8-v;
+		};
+
+		rtc@c2a0000 {
+			status = "okay";
+		};
+
+		pmc@c360000 {
+			nvidia,invert-interrupt;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
new file mode 100644
index 000000000000..e3bb874869df
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra234-p3701-0000.dtsi"
+#include "tegra234-p3737-0000.dtsi"
+
+/ {
+	model = "NVIDIA Jetson AGX Orin Developer Kit";
+	compatible = "nvidia,p3737-0000+p3701-0000", "nvidia,p3701-0000", "nvidia,tegra234";
+
+	aliases {
+		mmc3 = "/bus@0/mmc@3460000";
+		serial0 = &tcu;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,115200n8";
+		stdout-path = "serial0:115200n8";
+	};
+
+	tcu {
+		status = "okay";
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
new file mode 100644
index 000000000000..a85993c85e45
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	compatible = "nvidia,p3737-0000";
+};
-- 
2.33.1

