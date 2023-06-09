Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2812C7EE25
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 13:17:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241273AbjFINR2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 09:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240414AbjFINR1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 09:17:27 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F493A93
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 06:17:16 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-977d6aa3758so322083266b.0
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 06:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686316635; x=1688908635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=27xOaIKor53tJdIY0gSQdyGh6TpLXAuBBRqqH4KillU=;
        b=ZOUgrCe2Q7Pi/HlNi/SuId98ku3GaU9N7zwzDoh+DxmeLUMtxcxeZ0wg7YGgBM99ai
         aWmz9DwiZFlhpCc+oV0KVhj7rcuR8wHkpdEnjlMuFDegSluPJkChQx+KYnySTUHz0sIA
         ETRMNZDVDfO3PGBD9FMJinUoaGm97amiSGK8MnjXLgkDpdOOQVBhLSWIN2q1pELN3NKb
         XDfeOVyI7JmYjsZ921mUOGEE274XYRubRvPd+4gNBzdhtTOgyVhilMAYKAum48tYX+9M
         +Pa5I2chBYhJExEclXJQbXTIEsbn1MCVUdgsT29CP50nxlfSOJ5RDWqyvQCHxuXaiZzA
         XBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686316635; x=1688908635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27xOaIKor53tJdIY0gSQdyGh6TpLXAuBBRqqH4KillU=;
        b=irL0xBrYP38Sj/yinQaB1gYgAdXtKKVQgueiMInPn6NZsyfpqNWeAC7eglw/8ka3HC
         wwtMae3eYwppeT/FdEFaWwGrQ4ItDyecUD1SaMGo34Y4pejXLS+p9At8My4Jbh/AqAxV
         HnUai3jPWpsKfYnBaTAi+M7W8yQIibzRjvGBXVS+rK2LFBSACEA1uSIotTkX28ukm0WC
         lhsC/hVPYqHrMlWm9bD2WctMAOqhHw/jkCBPNf4Zq9ZvAe/eOnNsWcr3Cdaf1mwEXStR
         8c+0VvDyy8xXPivybmqhoZIsCSmdFGLhr9Gix3Q31/ihUSXLT8vmpcvIC3yJrZb/Ayt1
         b3cQ==
X-Gm-Message-State: AC+VfDy0xjg05IH4UoyyWItdB5A71p73HNG6R8H7MX0tF5IzfQbo/UX+
        +Gt/5ToK9yGEFv4WhMAJLf261T4b7hA=
X-Google-Smtp-Source: ACHHUZ6izVa2eEm6GKE9IlDObKS/7K7a7T2nPQsTsLQY5kPb45erDovGfIXe1tcwqvSoxRPnD4VRmw==
X-Received: by 2002:a17:907:803:b0:973:d751:840f with SMTP id wv3-20020a170907080300b00973d751840fmr1611019ejb.77.1686316635048;
        Fri, 09 Jun 2023 06:17:15 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u20-20020a170906781400b009764f0c5fe6sm1313158ejm.7.2023.06.09.06.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 06:17:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Yi-Wei Wang <yiweiw@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/4] arm64: tegra: Add Tegra234 thermal support
Date:   Fri,  9 Jun 2023 15:17:08 +0200
Message-Id: <20230609131711.3826912-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add device tree node for the BPMP thermal node on Tegra234 and add
thermal zone definitions.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 53 +++++++++++++++++++
 .../thermal/tegra234-bpmp-thermal.h           | 19 +++++++
 2 files changed, 72 insertions(+)
 create mode 100644 include/dt-bindings/thermal/tegra234-bpmp-thermal.h

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 6e66f41695c0..c17abe054dab 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
 #include <dt-bindings/power/tegra234-powergate.h>
 #include <dt-bindings/reset/tegra234-reset.h>
+#include <dt-bindings/thermal/tegra234-bpmp-thermal.h>
 
 / {
 	compatible = "nvidia,tegra234";
@@ -3163,6 +3164,11 @@ bpmp_i2c: i2c {
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+
+		bpmp_thermal: thermal {
+			compatible = "nvidia,tegra186-bpmp-thermal";
+			#thermal-sensor-cells = <1>;
+		};
 	};
 
 	cpus {
@@ -3653,6 +3659,53 @@ sound {
 					 <&bpmp TEGRA234_CLK_PLLA_OUT0>;
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_CPU>;
+			status = "disabled";
+		};
+
+		gpu-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_GPU>;
+			status = "disabled";
+		};
+
+		cv0-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_CV0>;
+			status = "disabled";
+		};
+
+		cv1-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_CV1>;
+			status = "disabled";
+		};
+
+		cv2-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_CV2>;
+			status = "disabled";
+		};
+
+		soc0-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_SOC0>;
+			status = "disabled";
+		};
+
+		soc1-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_SOC1>;
+			status = "disabled";
+		};
+
+		soc2-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_SOC2>;
+			status = "disabled";
+		};
+
+		tj-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_TJ_MAX>;
+			status = "disabled";
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
diff --git a/include/dt-bindings/thermal/tegra234-bpmp-thermal.h b/include/dt-bindings/thermal/tegra234-bpmp-thermal.h
new file mode 100644
index 000000000000..934787950932
--- /dev/null
+++ b/include/dt-bindings/thermal/tegra234-bpmp-thermal.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This header provides constants for binding nvidia,tegra234-bpmp-thermal.
+ */
+
+#ifndef _DT_BINDINGS_THERMAL_TEGRA234_BPMP_THERMAL_H
+#define _DT_BINDINGS_THERMAL_TEGRA234_BPMP_THERMAL_H
+
+#define TEGRA234_BPMP_THERMAL_ZONE_CPU		0
+#define TEGRA234_BPMP_THERMAL_ZONE_GPU		1
+#define TEGRA234_BPMP_THERMAL_ZONE_CV0		2
+#define TEGRA234_BPMP_THERMAL_ZONE_CV1		3
+#define TEGRA234_BPMP_THERMAL_ZONE_CV2		4
+#define TEGRA234_BPMP_THERMAL_ZONE_SOC0		5
+#define TEGRA234_BPMP_THERMAL_ZONE_SOC1		6
+#define TEGRA234_BPMP_THERMAL_ZONE_SOC2		7
+#define TEGRA234_BPMP_THERMAL_ZONE_TJ_MAX	8
+
+#endif
-- 
2.40.1

