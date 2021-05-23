Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3485C47085
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC11961168
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbhEWX6E (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 May 2021 19:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232037AbhEWX6C (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 May 2021 19:58:02 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4BA5C061756;
        Sun, 23 May 2021 16:56:33 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id v5so31181359ljg.12;
        Sun, 23 May 2021 16:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MpvhPzX1ymg5vSIOj/R3c0XtSN9hCFreWZQ1rMcnPsI=;
        b=QyWkmTzxYCt90Z8KdFxCKVvjljk2oYwWSLjmMgJ9SimCxxdmWmY6YP5Fo2t9PEs3xl
         y0OXXKFsYObWXYkSpeSOIxdmlisEdcvx8eVnBxHaesYi2sAnYZyG1uYp5q5Urs82v8kk
         F5xHe8qLUdhW6QHNi696dZu24ll+lxwR2w3nNj8gEbLLpQoLGWDKRm2qjU2DH5vM18K9
         OeH3vnszSjk6qB+nY6Y7fzStME2ts2BaxxRPpfrMUByd0/EedQLSV0jMLVX/fs52bf3r
         Tah+5TUDZ0paoZTqI42BDOBr/dKfOMj1M3SX8vsKQaPRuWnnhbCjwoQE5mHeqtTqeeWh
         lxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MpvhPzX1ymg5vSIOj/R3c0XtSN9hCFreWZQ1rMcnPsI=;
        b=au1d9bjJmLBn5ymPBM3QPJGFKioad0TRxREmhH9WWrW2AmIQREtvHSloh6qPobXqlF
         wP558mjDUpWCUWSadoiAUbPeOzUZi57vnwkYNZ6kWs8CLACTS+LJ+/Mswx20QOd5qNWN
         CdJT8UJYFEG8q0aStiku56AUoUrdvH5agf5y7EhVzoAXmEefVzzp7dQd5uXKzGj7h3iO
         0GIu/APotxp+0To0u4gqXjlFmTSJ8Gj9Tk9xLDkOM4idnxMH749OB35jCSLQA43B0KT6
         QrBHk777yxltGvi2OyupLk0sU1MLmm0S9XUBO+YdE2keBZXwrMdtRG685HUk7rRfnbRD
         llZw==
X-Gm-Message-State: AOAM533Pz2Lx9/hKY2+DeZ6ri0UrDOBDn0AGNfm8tF7GGK2W0ei2MymZ
        UjDQkk8SMuq5GDeMorFSjbY=
X-Google-Smtp-Source: ABdhPJzD0kOaSu31tu2RIX4r32z9rtPujOvi7Q/nkRexmgRdTsqYkZmJNq36lQE3+XcOdsZ5+9FIMA==
X-Received: by 2002:a05:651c:14c:: with SMTP id c12mr9009930ljd.72.1621814192271;
        Sun, 23 May 2021 16:56:32 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.gmail.com with ESMTPSA id h4sm1092987lfv.247.2021.05.23.16.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 16:56:32 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Ion Agorria <ion@agorria.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: thermal: Add binding for Tegra30 thermal sensor
Date:   Mon, 24 May 2021 02:56:14 +0300
Message-Id: <20210523235620.31538-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210523235620.31538-1-digetx@gmail.com>
References: <20210523235620.31538-1-digetx@gmail.com>
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

Reviewed-by: Rob Herring <robh@kernel.org>
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

