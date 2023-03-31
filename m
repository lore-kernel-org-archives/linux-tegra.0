Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AEFC77B60
	for <linux-tegra@archiver.kernel.org>; Fri, 31 Mar 2023 16:35:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbjCaQfx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 31 Mar 2023 12:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbjCaQf3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 Mar 2023 12:35:29 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CFEE26241;
        Fri, 31 Mar 2023 09:32:04 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id y4so91929977edo.2;
        Fri, 31 Mar 2023 09:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680280323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smpYk+SvIOdF1cVr5HIokSgBtMJt2dI4bxJEZeJfCBc=;
        b=ll0iw/Po3mkwpImlU3qm3AJHiFTi5ALsAzmowCR4xTO9jmgT4eZEn3aSC4DXQ1MU4P
         zBtSfSJCUJTY5S8H5IwZmiKu4Hm0KeWuG+hxBVSqssWXeoun8qxqSuDEP2k5v5R2WB2a
         XG+SaDcGo6aC+/oVRoEtT8kwU7x5DKcX0UznFV/51FLshchDHqNES7oOXgT73o6FuWn1
         4lA2GUwHVXDuU+S7/gZRzTlZq3yT3q8xcLqX+awdRrDbtiUntvR5yWuUdRkodMdfo2j4
         hD9M4l1aVtJHgshroOq7AnfRrP6MZYYk3sNQcDjOBSAeA2uyof3284LUXER8KaMy+dnT
         2vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680280323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smpYk+SvIOdF1cVr5HIokSgBtMJt2dI4bxJEZeJfCBc=;
        b=J4OKlAKM3XGi/GMW2sd7/gdGd7NNuAxBaqLNXGZA3TsJNkcPyAp4FV9fMIusSnSEA3
         B17jgQxVPFV4bzkEJxlTgIWhynpkx8sW5cOfg1OvAGp4nr3ZViBl45+tupD+l9cN89Zl
         wrTcPp2tV5BZmI68GbAoKVFvbuxN1o3UUFiNwIt4mZSK2J6k/ihSFbhsuZtxep8jmKnW
         tkygNkeb/TXpWfMwXye4/pHFHAWEr7X/9EAfnn94kloxfzMMRuQnrLZGLGavssLGO3AE
         r/FfBeeux/630NuQPH6dGhjTnKDL9VxIKmwqPKrv3kq8CF4gGC9p/DkL25x5EK1tJbfO
         oHFw==
X-Gm-Message-State: AAQBX9ec4tvKrk4Czuru0mLvO/jrMQSaWlOMbLLpZRHRjf+qN4vaZ11I
        9wa00PJphsv2RgvVtuep6dQ=
X-Google-Smtp-Source: AKy350Y2EO7RPSXK/4EnGLWHXEZ4U4OidSMKtof4fDjCHLmFow5/v5iqbMuE2pROnSidYHr+1NevBA==
X-Received: by 2002:aa7:cb01:0:b0:4af:81fb:4c72 with SMTP id s1-20020aa7cb01000000b004af81fb4c72mr22988767edt.34.1680280323098;
        Fri, 31 Mar 2023 09:32:03 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r3-20020a50d683000000b00502719a3966sm738558edi.18.2023.03.31.09.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:32:02 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] arm64: tegra: Support Jetson Orin Nano Developer Kit
Date:   Fri, 31 Mar 2023 18:31:59 +0200
Message-Id: <20230331163159.17145-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331163159.17145-1-thierry.reding@gmail.com>
References: <20230331163159.17145-1-thierry.reding@gmail.com>
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
index 1406d5d40b8f..9c679fe3ec3e 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -10,6 +10,7 @@ DTC_FLAGS_tegra194-p3509-0000+p3668-0000 := -@
 DTC_FLAGS_tegra194-p3509-0000+p3668-0001 := -@
 DTC_FLAGS_tegra234-p3737-0000+p3701-0000 := -@
 DTC_FLAGS_tegra234-p3768-0000+p3767-0000 := -@
+DTC_FLAGS_tegra234-p3768-0000+p3767-0005 := -@
 
 dtb-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra132-norrin.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2371-0000.dtb
@@ -26,3 +27,4 @@ dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0001.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-sim-vdk.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3737-0000+p3701-0000.dtb
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
2.40.0

