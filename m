Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BB8C7EE2D
	for <linux-tegra@archiver.kernel.org>; Tue, 16 May 2023 09:59:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbjEPJ7K (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 May 2023 05:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbjEPJ7J (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 May 2023 05:59:09 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E64330EA;
        Tue, 16 May 2023 02:59:00 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bc3088b7aso25628957a12.3;
        Tue, 16 May 2023 02:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684231138; x=1686823138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGXCJbTSxM/apZJVdaLhkJcV+DZJnEq8zMQ1Fcik5QM=;
        b=No+6IoRe/dvX3r+VKvWG07HpeNuADaMNPfRqiWgjW9US+PGffRG8dFdAW4RBGWUhm2
         VM36wc6rRhFsgnI0UDEpxcbN/qzFOFrc2wddFfKyf0P2n/9YYhUUwZaGXYAyrXvSjxoo
         KRPY5pMlgtMPJz17sF4Hmuyq+p0AUCdsWc3FSSJpNwX8ND6nxkaWTsKJxQizfjodMLZP
         h8wEkrJraWuaxKyDhJXyFNQwa36Lcl0vew/6SufxPocUbFeoowJgx1SrLegboFCRKcIs
         MXiyl+x58cYqGl+qmGp9YAG8WeVv/RRiBks66fh2uhFP0zyFJrw4hqa9srRXXcB5nV6N
         KVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684231138; x=1686823138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGXCJbTSxM/apZJVdaLhkJcV+DZJnEq8zMQ1Fcik5QM=;
        b=eqHgNHPP4cTHKpfqnozkgfJ8Oc0X0OvOmwGPyu1TUePRRIFts5R+t+N5RyHDIjP/gs
         8U9kmfe8h9FGU5Jia5QuzMG2DDcWnI/nv+rso6F+l3Pa5S2iTXVz/Ue2XAH/a440aVqC
         9ma4ND+AL8My2lQtZxOqgfhZnsVPDPAH+/p7EH3xwrCMAQIxiN52oX9ujbFWaNGz6+Fv
         0BnuYzCq1fwR0ZOPurBYO33byofCpAGqZqXTwffyIpmWYjkq1cOywDQhOPRJ6fifuxPt
         25X2xhCaUsP5T7+PZUyvIGoQewmkKvLuwkbnu7zhWoErLvrDMISJtiqDFqbazRmWbLKH
         V7wg==
X-Gm-Message-State: AC+VfDzfv9dx85c/Bt2PQbK8zfZlYD+bOQZecBzWyJaz8jhoDWAjE1oC
        4DOIwunD2YBNh/no5GnY5QIQKzDptiXuPQ==
X-Google-Smtp-Source: ACHHUZ549x2YVARZ66JkumJfvsU+HT952kTe2q0Y58qvY1iqtclV0nllrQcbHaCdSHTcFnpXzDQLvQ==
X-Received: by 2002:aa7:c546:0:b0:4fc:709f:7abd with SMTP id s6-20020aa7c546000000b004fc709f7abdmr29167479edr.2.1684231138473;
        Tue, 16 May 2023 02:58:58 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n7-20020aa7d047000000b004fbdfbb5acesm8264603edo.89.2023.05.16.02.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 02:58:58 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/3] arm64: tegra: Support Jetson Orin Nano Developer Kit
Date:   Tue, 16 May 2023 11:58:50 +0200
Message-Id: <20230516095850.2426604-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516095850.2426604-1-thierry.reding@gmail.com>
References: <20230516095850.2426604-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The NVIDIA Jetson Orin Nano Developer Kit is the combination of the
NVIDIA Jetson Orin Nano (P3767, SKU 5) module and the P3768 carrier
board.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/Makefile                |  2 ++
 .../arm64/boot/dts/nvidia/tegra234-p3767-0005.dtsi | 14 ++++++++++++++
 .../dts/nvidia/tegra234-p3768-0000+p3767-0005.dts  | 13 +++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3767-0005.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index 2ea0058979d3..c38c809fe577 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -11,6 +11,7 @@ DTC_FLAGS_tegra194-p3509-0000+p3668-0001 := -@
 DTC_FLAGS_tegra234-p3737-0000+p3701-0000 := -@
 DTC_FLAGS_tegra234-p3740-0002+p3701-0008 := -@
 DTC_FLAGS_tegra234-p3768-0000+p3767-0000 := -@
+DTC_FLAGS_tegra234-p3768-0000+p3767-0005 := -@
 
 dtb-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra132-norrin.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2371-0000.dtb
@@ -28,3 +29,4 @@ dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-sim-vdk.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3737-0000+p3701-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3740-0002+p3701-0008.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0000.dtb
+dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0005.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767-0005.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767-0005.dtsi
new file mode 100644
index 000000000000..232fa95ef4ae
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767-0005.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "tegra234-p3767.dtsi"
+
+/ {
+	compatible = "nvidia,p3767-0005", "nvidia,tegra234";
+	model = "NVIDIA Jetson Orin Nano";
+
+	bus@0 {
+		hda@3510000 {
+			nvidia,model = "NVIDIA Jetson Orin Nano HDA";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts
new file mode 100644
index 000000000000..ba66c1845f75
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/input/gpio-keys.h>
+
+#include "tegra234-p3767-0005.dtsi"
+#include "tegra234-p3768-0000.dtsi"
+
+/ {
+	compatible = "nvidia,p3768-0000+p3767-0005", "nvidia,p3767-0005", "nvidia,tegra234";
+	model = "NVIDIA Jetson Orin Nano Developer Kit";
+};
-- 
2.40.1

