Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F6AC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCCFB61221
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235960AbhKSOmB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 09:42:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbhKSOmB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 09:42:01 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2BEC061574;
        Fri, 19 Nov 2021 06:38:59 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id b184-20020a1c1bc1000000b0033140bf8dd5so7659685wmb.5;
        Fri, 19 Nov 2021 06:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VOjo5CXprhYwBXJymhhEQ4r0sW37uqRZzASN8wfkw40=;
        b=SkxF/i1jAMZbRjF5Uphejn89VxK1uRz4pvidf4wW0a0YnEkista/KoARU1m6WpiyDz
         ME+EAMUPskNheRzi4fuxEfY5q2Lfdg5TPu0wG9vOTMZXVZDEbO2UOfPTLIENrnMhYCTG
         1UOFw6VJ/ZTottpVk4OO3k/ad1TVjvzqTW+IIMkFk2SIO6pWFlTOLR6CPhHIQfQrjI7v
         uXaMiWy47AVynGmAlArzQMtmSczVC0r8cW5eEmmuSkiPah3V9XHCKQ8PJDWF08wDho2M
         q2qNcGiIHPMoS/SqQH0ijgtgvohuEKJTiZOitBrr0luKFBu2mmw2ENL4/ZiiHI3L4T6p
         A7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VOjo5CXprhYwBXJymhhEQ4r0sW37uqRZzASN8wfkw40=;
        b=MZioZsu5w+voGZox6tVhgut9eupAmzn5UzkzYhbtzBxmN2UI/VXMMFyUV5LuBV2otT
         Xv/rODYg7033rwo9iqUfUjYiSWXfxpwPNa20YXh563KS8Rke9iq00VOWb+QI5x4JOfU3
         AhPDWjT2yejiZzRTCuVpt4ad5Preo/D0xRPxV2pgtfky5lMoRJzPURwNWHTCrYfZg+/1
         j1BgwmeXDkX25Ye1+MT2RsF0AuHoqOUjNXmdefePY68j8iZ+NocPpIuUmT1AWLWSn3kt
         OED90bMbsCDO6csyw4l7TkMa5I0hSekJsvCioQpHqDq8g8V9MHNROF2a6XHucR6wIvKH
         He9g==
X-Gm-Message-State: AOAM530Swe7SQ/n2p8aHgm6Z7hz6qzT6gxCfG0adBPr9+0mCaYHNkhdM
        AKOG660UazI04qGcClZHGbM=
X-Google-Smtp-Source: ABdhPJxrPb6iNG9iY5P5J25oC7V9i2TxSW/PRV12I9csDupZjmY6CsvXP+FfCDm6EcPgpmv/roYBUQ==
X-Received: by 2002:a1c:8015:: with SMTP id b21mr79343wmd.161.1637332738186;
        Fri, 19 Nov 2021 06:38:58 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id h15sm3153814wml.9.2021.11.19.06.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 06:38:57 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 05/16] dt-bindings: rtc: tegra: Convert to json-schema
Date:   Fri, 19 Nov 2021 15:38:28 +0100
Message-Id: <20211119143839.1950739-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119143839.1950739-1-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
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
Changes in v2:
- document clock-names property and add additionalProperties: false

 .../bindings/rtc/nvidia,tegra20-rtc.txt       | 24 --------
 .../bindings/rtc/nvidia,tegra20-rtc.yaml      | 60 +++++++++++++++++++
 2 files changed, 60 insertions(+), 24 deletions(-)
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
index 000000000000..94266de73cb9
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
@@ -0,0 +1,60 @@
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
+  clock-names:
+    items:
+      - const: rtc
+
+additionalProperties: false
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

