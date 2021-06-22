Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCD5C49EA2
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 14:22:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C834161374
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 14:22:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhFVOZD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Jun 2021 10:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbhFVOZC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Jun 2021 10:25:02 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60183C061756;
        Tue, 22 Jun 2021 07:22:46 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id q14so2621876eds.5;
        Tue, 22 Jun 2021 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gKFa9cbppvuSzICTPCyOrCLDkwJRcl6t3DzrxGzA/dw=;
        b=I+uKF56Gn/CjXdVBmgDr0ESzogsO8XEg4sPLQ28pDtZiDI0lek/jseRmmLijm1SPye
         1SIKihRWsiDqfXSuoj7H/PmhWTVVhZtR2xa7T993kj45Q55oSfDShmgx3+ITp6QkQR9p
         sNsZ5xr5X10g+2uQ4cWgKCFEJUsBBXBfDZMUEaNb/zPFXcsScuS4iHIrAFn9yav8yaNR
         lQqWSlbrvWT5ZBdN9hzb654yQz0PMtn2kmF3gTXHaLVg3H/0ZeUYI2bK1Kz3ufT62+F5
         t/2p9R+hq/u6rA3DNjZOqLQFBsAJjpoSH8pKeWGLZLTOknjFgDYl+j9L1/CBNsGYnNRh
         fpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gKFa9cbppvuSzICTPCyOrCLDkwJRcl6t3DzrxGzA/dw=;
        b=TYerjw9gorvocKOs2bkoRJ+0Rp8ceqQekSQlFCiXdLGzTbn7N7BPSbZHOKeUDhZsJi
         ibeayjWzeIWXl/vz1U57q38a3eGXdAxDgAkQQYMcxPOk5/zjFXCVZKD0lNXsIhHECmgW
         ENAnPrg3xUQia7yZF2TyaLoD+aDuJxzxQi63+Zy2DPiSouAERh4vroAGXIhDUSFOttRG
         fmnvtqt+KV72BMb7EtZzSCZ/P0H7W1dLigkPv+DGgYQfnHrZydBr6f8wjCkfEi9HSzsG
         Pq650jxrkmvnPzCmK/puLc9UcALQYp+9ppQdMYaXtImrnRfuocSUptffCwZkdNOxT9Tf
         EUlQ==
X-Gm-Message-State: AOAM532UB+y+HoNyutJ9ECWLami+t6Je6GuP/qAu/QQ3G5Um1zi50Qgt
        oxFwFJUfmWEpM8Q6ldekJE0=
X-Google-Smtp-Source: ABdhPJxHuIeC+bfIDGXEWab2/pNXQbgJwer0PCekKjMU5VnJeSCiOaJiwRV3CkZIQbYdd/PHv4n3QQ==
X-Received: by 2002:a05:6402:3492:: with SMTP id v18mr5342791edc.130.1624371765004;
        Tue, 22 Jun 2021 07:22:45 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id j19sm2748996ejo.3.2021.06.22.07.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 07:22:44 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: usb: tegra: Convert to json-schema
Date:   Tue, 22 Jun 2021 16:24:36 +0200
Message-Id: <20210622142436.4014610-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622142436.4014610-1-thierry.reding@gmail.com>
References: <20210622142436.4014610-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the old plain-text device tree bindings for the USB EHCI
controller found on NVIDIA Tegra SoCs to the json-schema format.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- drop unneeded clock-names property
- fix indentation issues

 .../bindings/usb/nvidia,tegra20-ehci.txt      |  23 ---
 .../bindings/usb/nvidia,tegra20-ehci.yaml     | 150 ++++++++++++++++++
 2 files changed, 150 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
deleted file mode 100644
index f60785f73d3d..000000000000
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Tegra SOC USB controllers
-
-The device node for a USB controller that is part of a Tegra
-SOC is as described in the document "Open Firmware Recommended
-Practice : Universal Serial Bus" with the following modifications
-and additions :
-
-Required properties :
- - compatible : For Tegra20, must contain "nvidia,tegra20-ehci".
-   For Tegra30, must contain "nvidia,tegra30-ehci".  Otherwise, must contain
-   "nvidia,<chip>-ehci" plus at least one of the above, where <chip> is
-   tegra114, tegra124, tegra132, or tegra210.
- - nvidia,phy : phandle of the PHY that the controller is connected to.
- - clocks : Must contain one entry, for the module clock.
-   See ../clocks/clock-bindings.txt for details.
- - resets : Must contain an entry for each entry in reset-names.
-   See ../reset/reset.txt for details.
- - reset-names : Must include the following entries:
-   - usb
-
-Optional properties:
- - nvidia,needs-double-reset : boolean is to be set for some of the Tegra20
-   USB ports, which need reset twice due to hardware issues.
diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml
new file mode 100644
index 000000000000..079cae44b8d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/nvidia,tegra20-ehci.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Device tree binding for NVIDIA Tegra USB controllers
+
+description: |
+  The device node for a USB controller that is part of a Tegra SOC is as
+  described in the document "Open Firmware Recommended Practice : Universal
+  Serial Bus". Modifications and additions are detailed in this document.
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - nvidia,tegra210-ehci
+              - nvidia,tegra124-ehci
+              - nvidia,tegra114-ehci
+          - const: nvidia,tegra30-ehci
+      - items:
+          - const: nvidia,tegra30-ehci
+      - items:
+          - const: nvidia,tegra20-ehci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  phy_type:
+    $ref: /schemas/types.yaml#/definitions/string
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: usb
+
+  nvidia,phy:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle of the PHY that the controller is connected to
+
+  nvidia,needs-double-reset:
+    type: boolean
+    description:
+      This must be set for some instances of the USB controller found on
+      Tegra20 that need to be reset twice due to some hardware issue.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - reset-names
+  - phy_type
+  - nvidia,phy
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@c5000000 {
+        compatible = "nvidia,tegra20-ehci";
+        reg = <0xc5000000 0x4000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        phy_type = "utmi";
+        clocks = <&tegra_car TEGRA20_CLK_USBD>;
+        resets = <&tegra_car 22>;
+        reset-names = "usb";
+        nvidia,needs-double-reset;
+        nvidia,phy = <&phy1>;
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@7d000000 {
+        compatible = "nvidia,tegra30-ehci";
+        reg = <0x7d000000 0x4000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        phy_type = "utmi";
+        clocks = <&tegra_car TEGRA30_CLK_USBD>;
+        resets = <&tegra_car 22>;
+        reset-names = "usb";
+        nvidia,needs-double-reset;
+        nvidia,phy = <&phy1>;
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra114-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@7d000000 {
+        compatible = "nvidia,tegra114-ehci", "nvidia,tegra30-ehci";
+        reg = <0x7d000000 0x4000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        phy_type = "utmi";
+        clocks = <&tegra_car TEGRA114_CLK_USBD>;
+        resets = <&tegra_car 22>;
+        reset-names = "usb";
+        nvidia,phy = <&phy1>;
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra124-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@7d000000 {
+        compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci";
+        reg = <0x7d000000 0x4000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        phy_type = "utmi";
+        clocks = <&tegra_car TEGRA124_CLK_USBD>;
+        resets = <&tegra_car 22>;
+        reset-names = "usb";
+        nvidia,phy = <&phy1>;
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@7d000000 {
+        compatible = "nvidia,tegra210-ehci", "nvidia,tegra30-ehci";
+        reg = <0x7d000000 0x4000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        phy_type = "utmi";
+        clocks = <&tegra_car TEGRA210_CLK_USBD>;
+        resets = <&tegra_car 22>;
+        reset-names = "usb";
+        nvidia,phy = <&phy1>;
+    };
-- 
2.32.0

