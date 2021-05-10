Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E614C433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:40:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 718DD615FF
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbhEJWly (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 18:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbhEJWlx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 18:41:53 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938F9C06175F;
        Mon, 10 May 2021 15:40:45 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x20so25756009lfu.6;
        Mon, 10 May 2021 15:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=feUpaQUMAX2c/2pBZJjGRmDCgLs1mCtBF6+qHuM6rfU=;
        b=ABfgyHJyR9LHS4G70qjOzgXjNGVvkUDsD6744svtFwctFURU/wd+Jzlduxw9EPDps8
         GG7jTk/hlNAzrPSzI9368LSiNK+SlOq4EbK1SZl5YJksUGUYicdZWHlSkD7LdNv89hS9
         uB7jr3+fuWNqX1HPebjTJY8bxDz9hy/Pn2H68EOgDpqouE9ZtS0CQPX2m2LsGa+QOvCu
         N9UI59vTW4Hqbk459CGbw7uQuNr663D5H0ThkRkyzwN1cBPlSVLoGB64cqWBCoKSWILm
         4XVOHkBfXv72taTp2NdLhx3+J8GO0TJPI4PoPQfk+orWbUI5ttIs8PdkFF/sbLp6q3Ic
         nlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=feUpaQUMAX2c/2pBZJjGRmDCgLs1mCtBF6+qHuM6rfU=;
        b=KE/P7+AvGKW8FmNz9PWkHS0Pev/afqr9ph3uSHoQAZID5iqqMntI5V93LCwnp5S3Ro
         +26LMlU46kUBqWj6lthKi7/J7fbiYnqxwweoyGPOGrbgCJxx4lXBAYq7yhY8kWd0siGt
         b9OW4kGQ6j5PIQM/Z8eGAqBluJ7r0gmI0lMWOW00bOIsCcsZufrYTt3OgNVWDrsTphlA
         3CW3t/4g1hNhns6wwH75AAB/WcrR9dla4jDZZzm1qrYQI0TRVPENiogXa+N9U1N5SOLO
         HDQjLFNqUQ68OBb4KkSn3h7OCWXOY+EmsD6jDreGghMAEuPTeZYmpNnLFNhnoBwru1Gk
         Wfew==
X-Gm-Message-State: AOAM533lWa42Is9gS/ljnGjDC8c1HLaAb6i/4e14ZwckhhBrlGDteyrX
        sd+R0wqOLnp23d3W/50/ct4=
X-Google-Smtp-Source: ABdhPJzLnHM7c5hEXgssu6ack/pcWF0QECFTY0ty5gxRl5DwWnsSnCeDtiFdz3gr9brFZP03D7JIKg==
X-Received: by 2002:a19:9152:: with SMTP id y18mr18444252lfj.436.1620686444104;
        Mon, 10 May 2021 15:40:44 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id g24sm2780698lja.63.2021.05.10.15.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 15:40:43 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Ion Agorria <ion@agorria.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/7] dt-bindings: thermal: Add binding for Tegra30 thermal sensor
Date:   Tue, 11 May 2021 01:38:10 +0300
Message-Id: <20210510223816.18565-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510223816.18565-1-digetx@gmail.com>
References: <20210510223816.18565-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

All NVIDIA Tegra30 SoCs have on-chip sensors which monitor temperature
and voltage of the SoC. Sensors also controls CPU x2 freq throttle and
emits emergency shutdown signal. TSENSOR has has two separate channels
for each sensor placed in a different parts of the SoC. Add binding for
the sensor hardware.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../thermal/nvidia,tegra30-tsensor.yaml       | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml

diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
new file mode 100644
index 000000000000..6182090d313c
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/nvidia,tegra30-tsensor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra30 Thermal Sensor
+
+maintainers:
+  - Dmitry Osipenko <digetx@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description: |
+  TSENSOR provides thermal and voltage sensors which monitor temperature
+  and voltage of the chip. Sensors are placed across the die to gauge the
+  temperature of the whole chip. The TSENSOR module:
+
+    Generates an interrupt to SW to lower temperature via DVFS on reaching
+    a certain thermal/voltage threshold.
+
+    Generates a signal to the CAR to reduce CPU frequency by half on reaching
+    a certain thermal/voltage threshold.
+
+    Generates a signal to the PMC when the temperature reaches dangerously high
+    levels to reset the chip and sets a flag in the PMC.
+
+  TSENSOR has two channels which monitor two different spots of the SoC.
+
+properties:
+  compatible:
+    const: nvidia,tegra30-tsensor
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+  "#cooling-cells":
+    const: 2
+
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+  assigned-clocks: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - interrupts
+  - "#thermal-sensor-cells"
+  - "#cooling-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    thermal-sensor@70014000 {
+      compatible = "nvidia,tegra30-tsensor";
+      reg = <0x70014000 0x500>;
+      interrupts = <0 102 4>;
+      clocks = <&clk 100>;
+      resets = <&rst 100>;
+
+      #thermal-sensor-cells = <1>;
+      #cooling-cells = <2>;
+    };
-- 
2.30.2

