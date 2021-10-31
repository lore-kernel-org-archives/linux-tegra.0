Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46316C433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 31 Oct 2021 11:41:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0994A60C51
	for <linux-tegra@archiver.kernel.org>; Sun, 31 Oct 2021 11:41:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbhJaLnl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 31 Oct 2021 07:43:41 -0400
Received: from ixit.cz ([94.230.151.217]:40008 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229638AbhJaLnk (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 31 Oct 2021 07:43:40 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 2446B24E71;
        Sun, 31 Oct 2021 12:32:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1635679972;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=F+8gu9hZCCdEjt5uT/O7323gSxFeIkUT6UKFNzqTy2o=;
        b=bAMrXFCTCljUDf5oM9CfK7UtrwI1DLTqIm5MEFDYtqadhoSNVdHYxY/KZYVXdjAiV6dfEQ
        BrJ++SiWduMge1wCgna2L7YdQ0tcUQEkQl5oByKYS2IHHwwjgMXj8XsHSHIeGo0hKdZ7cl
        86nx8i2baMo+Ubt1Rj59mXIFZzmYZB8=
From:   David Heidelberg <david@ixit.cz>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        Thierry Reding <treding@nvidia.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Tegra194 P2U convert to YAML
Date:   Sun, 31 Oct 2021 12:32:36 +0100
Message-Id: <20211031113236.29712-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert Tegra194 P2U binding to the YAML format.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/phy/phy-tegra194-p2u.txt         | 28 ------------
 .../bindings/phy/phy-tegra194-p2u.yaml        | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
 create mode 100644 Documentation/devicetree/bindings/phy/phy-tegra194-p2u.yaml

diff --git a/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt b/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
deleted file mode 100644
index d23ff90baad5..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-NVIDIA Tegra194 P2U binding
-
-Tegra194 has two PHY bricks namely HSIO (High Speed IO) and NVHS (NVIDIA High
-Speed) each interfacing with 12 and 8 P2U instances respectively.
-A P2U instance is a glue logic between Synopsys DesignWare Core PCIe IP's PIPE
-interface and PHY of HSIO/NVHS bricks. Each P2U instance represents one PCIe
-lane.
-
-Required properties:
-- compatible: For Tegra19x, must contain "nvidia,tegra194-p2u".
-- reg: Should be the physical address space and length of respective each P2U
-       instance.
-- reg-names: Must include the entry "ctl".
-
-Required properties for PHY port node:
-- #phy-cells: Defined by generic PHY bindings.  Must be 0.
-
-Refer to phy/phy-bindings.txt for the generic PHY binding properties.
-
-Example:
-
-p2u_hsio_0: phy@3e10000 {
-	compatible = "nvidia,tegra194-p2u";
-	reg = <0x03e10000 0x10000>;
-	reg-names = "ctl";
-
-	#phy-cells = <0>;
-};
diff --git a/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.yaml b/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.yaml
new file mode 100644
index 000000000000..9a89d05efbda
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/phy-tegra194-p2u.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: NVIDIA Tegra194 P2U binding
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+
+description: >
+  Tegra194 has two PHY bricks namely HSIO (High Speed IO) and NVHS (NVIDIA High
+  Speed) each interfacing with 12 and 8 P2U instances respectively.
+  A P2U instance is a glue logic between Synopsys DesignWare Core PCIe IP's PIPE
+  interface and PHY of HSIO/NVHS bricks. Each P2U instance represents one PCIe
+  lane.
+
+properties:
+  compatible:
+    const: nvidia,tegra194-p2u
+
+  reg:
+    maxItems: 1
+    description: Should be the physical address space and length of respective each P2U instance.
+
+  reg-names:
+    items:
+      - const: ctl
+
+  '#phy-cells':
+    const: 0
+
+additionalProperties: false
+
+examples:
+  - |
+    p2u_hsio_0: phy@3e10000 {
+        compatible = "nvidia,tegra194-p2u";
+        reg = <0x03e10000 0x10000>;
+        reg-names = "ctl";
+
+        #phy-cells = <0>;
+    };
-- 
2.33.0

