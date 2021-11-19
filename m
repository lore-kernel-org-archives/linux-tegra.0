Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2989CC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 146EA6142A
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234472AbhKSOm2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 09:42:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233963AbhKSOm0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 09:42:26 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E155BC061574;
        Fri, 19 Nov 2021 06:39:24 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id s13so18568883wrb.3;
        Fri, 19 Nov 2021 06:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b8xXQKtUyU9ebK+LdHYtVXL4JcEXXJuMuyVb0n2sCgQ=;
        b=DObCJ8XEVvjACTO8d5Gkj0R8aQ7Toyurl1GVbrXLA3KtxFPx1XWWpzFYKlYrmvmCIb
         +tP3Rk3zhr+zlyNwumSevEWmj1zL1uDCSp4aduwwvGsUUvJ+oE/6maiae2dx30nqJMFH
         lQGpBN42RI9HQXjOc5brB0NTy3bXsIKhWgBCz+xAjOfgqDh6+W+JCoXh+x5PekDDigQX
         GiVR5lCssRvuvAsASHH1b+wazQXd/ydPbp3rv6TZnH2CONXB33gyU0NOlOov7HzBb6yB
         oY/LC+HsheU0fsoY82LwZWbqyINpk9yErEoI/NvZBBfPwCmh8Nqk66rEsbpAWX2yMSvr
         drjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b8xXQKtUyU9ebK+LdHYtVXL4JcEXXJuMuyVb0n2sCgQ=;
        b=Cy8QC2E0IKD8FAnVj7RBOPie31e1HqFi0Ccw8ICnJom4nM2tZbnkAUIJzuX3qxag6z
         ht6BKnQZzXxvY/zD9Il32Ew10htHFhGPoDw52yyVyF8PFYDfTTKNzkIob2BB6CAIc+n2
         whL2CqlYctSi+Z0XCwIB725KRgFLRfdBfCmTfIEz3dpDMVvbDpAaTEIBswFtcVuhPywV
         4UqyQHhBqlFPBKbxdwFOsZT4zZAOmv6smE2fVvT+ZHa1FahHNayXjGoEdjs3UejGmAMu
         8H9CXqfEyIIqgKO/7V8o+bCu2vKusZ+p5FHo8ScTZyvUTsnSAOx1rOthuq49qEX3OMkW
         dJ1A==
X-Gm-Message-State: AOAM5306WTgnb2D6f/1y2oheU9gHJLtTJ0vARxMGK4Q0L+N0dnCxjdk1
        vwNVqW9FHZ65LPxtNLnYbjE=
X-Google-Smtp-Source: ABdhPJyZGTWEsSVQz6DxxMnET1TZxQNmGYr5raFuoEHzMUAom+FilekC6qNFWg7yl7PQnfFIhavquw==
X-Received: by 2002:a5d:5385:: with SMTP id d5mr7923432wrv.132.1637332763380;
        Fri, 19 Nov 2021 06:39:23 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id q123sm12226713wma.30.2021.11.19.06.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 06:39:22 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 15/16] dt-bindings: serial: tegra-tcu: Convert to json-schema
Date:   Fri, 19 Nov 2021 15:38:38 +0100
Message-Id: <20211119143839.1950739-16-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119143839.1950739-1-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the Tegra TCU device tree bindings to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/serial/nvidia,tegra194-tcu.txt   | 35 ------------
 .../bindings/serial/nvidia,tegra194-tcu.yaml  | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.txt
 create mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml

diff --git a/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.txt b/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.txt
deleted file mode 100644
index 085a8591accd..000000000000
--- a/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-NVIDIA Tegra Combined UART (TCU)
-
-The TCU is a system for sharing a hardware UART instance among multiple
-systems within the Tegra SoC. It is implemented through a mailbox-
-based protocol where each "virtual UART" has a pair of mailboxes, one
-for transmitting and one for receiving, that is used to communicate
-with the hardware implementing the TCU.
-
-Required properties:
-- name : Should be tcu
-- compatible
-    Array of strings
-    One of:
-    - "nvidia,tegra194-tcu"
-- mbox-names:
-    "rx" - Mailbox for receiving data from hardware UART
-    "tx" - Mailbox for transmitting data to hardware UART
-- mboxes: Mailboxes corresponding to the mbox-names.
-
-This node is a mailbox consumer. See the following files for details of
-the mailbox subsystem, and the specifiers implemented by the relevant
-provider(s):
-
-- .../mailbox/mailbox.txt
-- .../mailbox/nvidia,tegra186-hsp.txt
-
-Example bindings:
------------------
-
-tcu: tcu {
-	compatible = "nvidia,tegra194-tcu";
-	mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_SM 0>,
-	         <&hsp_aon TEGRA_HSP_MBOX_TYPE_SM 1>;
-	mbox-names = "rx", "tx";
-};
diff --git a/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml b/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
new file mode 100644
index 000000000000..7987eca0bb52
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/nvidia,tegra194-tcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Combined UART (TCU)
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jonathan Hunter <jonathanh@nvidia.com>
+
+description:
+  The TCU is a system for sharing a hardware UART instance among multiple
+  systems within the Tegra SoC. It is implemented through a mailbox-
+  based protocol where each "virtual UART" has a pair of mailboxes, one
+  for transmitting and one for receiving, that is used to communicate
+  with the hardware implementing the TCU.
+
+properties:
+  $nodename:
+    pattern: "^serial(@.*)?$"
+
+  compatible:
+    const: nvidia,tegra194-tcu
+
+  mbox-names:
+    items:
+      - const: rx
+      - const: tx
+
+  mboxes:
+    description: |
+      List of phandles to mailbox channels used for receiving and
+      transmitting data from and to the hardware UART.
+    items:
+      - description: mailbox for receiving data from hardware UART
+      - description: mailbox for transmitting data to hardware UART
+
+required:
+  - compatible
+  - mbox-names
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/mailbox/tegra186-hsp.h>
+
+    tcu: serial {
+        compatible = "nvidia,tegra194-tcu";
+        mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_SM 0>,
+                 <&hsp_aon TEGRA_HSP_MBOX_TYPE_SM 1>;
+        mbox-names = "rx", "tx";
+    };
-- 
2.33.1

