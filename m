Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8158C4743C
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 14:14:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F6F26120D
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 14:14:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhFUOQV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Jun 2021 10:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbhFUOQU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Jun 2021 10:16:20 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F4CC061574;
        Mon, 21 Jun 2021 07:14:05 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id h11so2381515wrx.5;
        Mon, 21 Jun 2021 07:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l1wxL7/RZgkd7tzTUkekvfvdCHWar3oCq1tWFko1E9o=;
        b=RuksT6jTR8FRNNY+r+xkD9D05mnTIAzomimttWV8HrkQiP6qs+LaCDvepu7wkURaDw
         6+bjKabwE1K5qbkpz6PXmDPgkD5pDdho39AbIUw2tX1ytfPvEHNAejH9fgba7AXxtoI9
         CrK/iVmqR612IHN3etPmtCkpcTVR/C3bJbblCQUFwMbySvwf6RoB7NBKBl32eoBDiz4N
         KBlVE1WAa1fFg+vW+iMCK8i7Xg7AtWzxYkT2YThQQV4gM13lZq2INxSGggRMfFFgroHJ
         hteSfCxPrfIXAjkfEXWXfQ12cjhNi4Irli4lPolXvqY8Pg4DMpfBnyPZBBB3UqA7MwOe
         vEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l1wxL7/RZgkd7tzTUkekvfvdCHWar3oCq1tWFko1E9o=;
        b=eZsI2QcQvxi3EaRv+VrYJ89zHSBXOjou1yHBEmpM4wxoXAGaYskZwbvHHyWSSKMfCN
         vsKX69xuCcbZsJzLSBVe9CKOmXDmallCDAzOSetcfWDMsJUJVU8pEuvG2BXb7oEwTGbn
         83UE6JM8eO1DUn3VdxkGQ8oeFEMaGpKR9qyUr9wrQoyP4UOTJ9Hlk8bewMSgROCvyfNA
         +sixjtmiETvC71jklt5ZJB6dfAj0YHBYRt9TM28hdbmRpku9aAohVXHWTTpg6TqHNCGx
         rpDStv2kuEMtUZO7sF7UaaSzw3yTyXKXtibu8Ww9GiDBuI3sq0ewQfITWybXUULApwfV
         RiWg==
X-Gm-Message-State: AOAM532b2WD+kFs/sOKZXmA8AxwFhQUM5qDKYybWt0wXQGUG4Zo+fXbW
        /9hHTzPr2k+1GekQCLOiYck=
X-Google-Smtp-Source: ABdhPJwvfVK82TRkJ9edAJjGFovTzoAfUgqKsZ1ehD0CESqOH5He4xP1LHxPExUT10LLiFBzzlkeuw==
X-Received: by 2002:a5d:6d8c:: with SMTP id l12mr29183005wrs.189.1624284844108;
        Mon, 21 Jun 2021 07:14:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id j17sm7725707wrx.0.2021.06.21.07.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 07:14:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: tegra: Fix USB controller nodes in examples
Date:   Mon, 21 Jun 2021 16:15:58 +0200
Message-Id: <20210621141559.2881667-1-thierry.reding@gmail.com>
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

