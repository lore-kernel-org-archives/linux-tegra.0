Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5F3C48BE5
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 14:22:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FD3E613AD
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 14:22:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbhFVOZC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Jun 2021 10:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbhFVOZC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Jun 2021 10:25:02 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91413C061574;
        Tue, 22 Jun 2021 07:22:44 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id gn32so7405083ejc.2;
        Tue, 22 Jun 2021 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l1wxL7/RZgkd7tzTUkekvfvdCHWar3oCq1tWFko1E9o=;
        b=K0s90OpuUasXmEcnW7aJ7+aN10JN9D4RtXySCNUKeNDWoB/rlU4u/V76NM+yI4o3di
         rQtJBHeVzkMMzo2ljfPapl1JkqtNcmv+F+ldsUtksi19aeRTTut3VybuCaX63T3OKC/x
         3Ku6e7dqufAqjIqu/MZPrHC003ATxbVhjZOf0AhPlQR3rUIsItlgwuVrIduSs3JgmaNL
         ES5pwMOR5HGdrcg6o3J84uCSprufkpIbNZ20f4Mvya2cg//QZmb3gFazPv0niO8ckA3a
         Ts5rujQEnD5zib+gc3QCYT1tnU+1GwrNF3rvKexL6nq39zgOzzf/P3qrlE49Bdz7vQNU
         jjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l1wxL7/RZgkd7tzTUkekvfvdCHWar3oCq1tWFko1E9o=;
        b=QjamAB/bl0NX75Vgiato10tQoAJIixgASxnOglG7HV+EeVCEPD97KMgLk9lRDR2RkA
         gW2E6bltF0J+fZRBtPCic61/amfNZ6IraRykDficOvYhp6TmhEFBumJ2D8mVWsX8josn
         kNJGeLrjdyDYMU/JhOU5en0o4clQ2pxvSG6WCyTXFVldJG4OZM8g5drZ3IXbWKvUx6rV
         EwyNl/46HLW5EJwpi3MsHyG0SfcMtf/NQYmo7U5E/VgVFfCnlQyEsKsW+W1cZOdG9yM1
         kVrVlYY2HBruSGoTb49Xky8yJhPwz56YlhPv7WviBXHy7+9xVY+r5+ICUkSQwnAFw4yx
         ogEg==
X-Gm-Message-State: AOAM5330EQXsGkFkd8V/sFDqN3QmIrNY3dmbiafsmPvS55D0/Q8QA285
        +0+vCij9U8ASPidg+Nm9K6XJG88WhU0=
X-Google-Smtp-Source: ABdhPJxnOLah/gAWqNsAI+1P63GgZm12QCYFmmCIcOQ3qQH7mu0OD2mRNbvbGNsbxKfK2NLOkkfAZg==
X-Received: by 2002:a17:907:9cc:: with SMTP id bx12mr4326755ejc.25.1624371763050;
        Tue, 22 Jun 2021 07:22:43 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v8sm12117666edc.59.2021.06.22.07.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 07:22:42 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clock: tegra: Fix USB controller nodes in examples
Date:   Tue, 22 Jun 2021 16:24:35 +0200
Message-Id: <20210622142436.4014610-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

A subsequent patch will convert the USB controller device tree bindings
to json-schema, which will cause the DT validation to point out various
issues with the examples in the clock and reset controller bindings.

Fix these issues so that the subsequent patch will not cause validation
warnings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/clock/nvidia,tegra124-car.yaml           | 11 ++++++++---
 .../devicetree/bindings/clock/nvidia,tegra20-car.yaml |  5 +++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
index ec7ab1483652..d5a873097379 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
@@ -99,6 +99,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/tegra124-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     car: clock-controller@60006000 {
         compatible = "nvidia,tegra124-car";
@@ -107,9 +108,13 @@ examples:
         #reset-cells = <1>;
     };
 
-    usb-controller@c5004000 {
-        compatible = "nvidia,tegra20-ehci";
-        reg = <0xc5004000 0x4000>;
+    usb-controller@7d000000 {
+        compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci";
+        reg = <0x7d000000 0x4000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        phy_type = "utmi";
         clocks = <&car TEGRA124_CLK_USB2>;
         resets = <&car TEGRA124_CLK_USB2>;
+        reset-names = "usb";
+        nvidia,phy = <&phy1>;
     };
diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
index 459d2a525393..11e6d9513373 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
@@ -53,6 +53,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     car: clock-controller@60006000 {
         compatible = "nvidia,tegra20-car";
@@ -64,6 +65,10 @@ examples:
     usb-controller@c5004000 {
         compatible = "nvidia,tegra20-ehci";
         reg = <0xc5004000 0x4000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        phy_type = "utmi";
         clocks = <&car TEGRA20_CLK_USB2>;
         resets = <&car TEGRA20_CLK_USB2>;
+        reset-names = "usb";
+        nvidia,phy = <&phy1>;
     };
-- 
2.32.0

