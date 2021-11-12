Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7931FC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:05:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65B5B60F0F
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:05:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234969AbhKLMId (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:08:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234910AbhKLMIa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:08:30 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A44EC061766;
        Fri, 12 Nov 2021 04:05:39 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d24so15175823wra.0;
        Fri, 12 Nov 2021 04:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WqpR9TGnc9TO8ksc0jSexoKzYBPDJ21d8Lpx8Q9gmRU=;
        b=Wv8v1fVEvI81i9mWKgqCxx3rPK+XniUVeDaGJ8nXhV8GJqBRhKM4jCoa4SSk4RVW6b
         /coGYjlQHw6MQu5AY6M91CnUqpotReK3711Nt5zdOZkkER4otuSOgjn6hPX1zHU0PwGo
         6ng/gPJzMM2iX8/OhU9+e3oJRpmvz+9ZHvsFeSPEwphS7xUz3dCPAKCN+0hnpthz6I/H
         ylFgJN/z1qcoH46PRHBNDazrrwDRHEp9fGCeAx8GeVQn0MimhqSYalhSvl2GdlCxfaxs
         FQH/K1ZRVsIP8wB+B+/sYvO2SrZZpKd+/a1RG7SaTcQZkFAP6DJRCo2hiAz6tMZYT/oe
         9+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WqpR9TGnc9TO8ksc0jSexoKzYBPDJ21d8Lpx8Q9gmRU=;
        b=4ctfYdF2LjJghD4JiT3i2fArT0NeN/7FdYydArLrFkqZr/f5UyfKgW+dlNKh4Bgfz5
         9r104C/jv4SClJMIlVjwekOwe52KF+4lpR4XjzSPdS2bJc3sYAiWW0EUMIH+bTa/TWiU
         +a93aRupv80CdOjozyu1LETSbJBz0fO1IKQxXm0gt8OIGNgPuEteIMpSqbETjiJAtHn7
         8UIavFX+ncuV+yrkmqSPZ0M5sxOO0f5xqPJDBJvrVOddlyQc5vsIbUmLvLW/ZAL8xWAu
         TZnM2UcrJShHCtPU5r6nA6qdDc+1N8gipIAR7KCk2c3uSdI5bgC806c1sNdsVRbZPRK3
         ymOQ==
X-Gm-Message-State: AOAM530zcCVJDJVaL82zhO5GJlwMRNQ2rZZpbAT0RRFxTht1lRSLjPxD
        NKSoQb1PFOgqWwnHKw5+XPw=
X-Google-Smtp-Source: ABdhPJx4sT4tlvgTpPXkHEt03rzslVX3qQCxMKPPRUVhnSvAS1ZcSUh0B5/T8pynOhv//CFF88zSbg==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr18336473wrr.189.1636718737956;
        Fri, 12 Nov 2021 04:05:37 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id l15sm5382184wme.47.2021.11.12.04.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:05:37 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 05/15] dt-bindings: rtc: tegra: Convert to json-schema
Date:   Fri, 12 Nov 2021 13:05:08 +0100
Message-Id: <20211112120518.3679793-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112120518.3679793-1-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the NVIDIA Tegra RTC bindings from the free-form text format to
json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/rtc/nvidia,tegra20-rtc.txt       | 24 ---------
 .../bindings/rtc/nvidia,tegra20-rtc.yaml      | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.txt b/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.txt
deleted file mode 100644
index b7d98ed3e098..000000000000
--- a/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-NVIDIA Tegra20 real-time clock
-
-The Tegra RTC maintains seconds and milliseconds counters, and five alarm
-registers. The alarms and other interrupts may wake the system from low-power
-state.
-
-Required properties:
-
-- compatible : For Tegra20, must contain "nvidia,tegra20-rtc".  Otherwise,
-  must contain '"nvidia,<chip>-rtc", "nvidia,tegra20-rtc"', where <chip>
-  can be tegra30, tegra114, tegra124, or tegra132.
-- reg : Specifies base physical address and size of the registers.
-- interrupts : A single interrupt specifier.
-- clocks : Must contain one entry, for the module clock.
-  See ../clocks/clock-bindings.txt for details.
-
-Example:
-
-timer {
-	compatible = "nvidia,tegra20-rtc";
-	reg = <0x7000e000 0x100>;
-	interrupts = <0 2 0x04>;
-	clocks = <&tegra_car 4>;
-};
diff --git a/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml b/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
new file mode 100644
index 000000000000..a96154882161
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nvidia,tegra20-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra real-time clock
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  The Tegra RTC maintains seconds and milliseconds counters, and five
+  alarm registers. The alarms and other interrupts may wake the system
+  from low-power state.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nvidia,tegra20-rtc
+      - items:
+          - enum:
+              - nvidia,tegra30-rtc
+              - nvidia,tegra114-rtc
+              - nvidia,tegra124-rtc
+              - nvidia,tegra210-rtc
+              - nvidia,tegra186-rtc
+              - nvidia,tegra194-rtc
+          - const: nvidia,tegra20-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    timer@7000e000 {
+        compatible = "nvidia,tegra20-rtc";
+        reg = <0x7000e000 0x100>;
+        interrupts = <0 2 0x04>;
+        clocks = <&tegra_car 4>;
+    };
-- 
2.33.1

