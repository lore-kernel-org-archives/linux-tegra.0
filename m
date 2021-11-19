Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD813C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:38:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9646E61108
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:38:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235959AbhKSOl4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 09:41:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbhKSOl4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 09:41:56 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA150C061574;
        Fri, 19 Nov 2021 06:38:54 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id f7-20020a1c1f07000000b0032ee11917ceso7719046wmf.0;
        Fri, 19 Nov 2021 06:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mTVMj8DP5Po1wfrviYqE1m4fi5ffVZmvpMq4wXcFS4Q=;
        b=lXzASvGzaAenmhdlPYAuGxxMYhS4T6VmH/LiN4jzLsm86IsqsDkrQEv/MmnhiWUWDZ
         JsQVYAalt2nreuoSOhtapNHsbLn4+CE+8IJITaiKYoqLijXTMGxa/0nSySObcqB6RVvW
         yhySbLVR+rtFAjWAyiWx5IoxnnMXNeidu7H60nF4phLURTGcsU5MNroyejZBYD1hSguW
         mglmUGLL2zQ2Gay8jVKnsrbB+xW44tkquDF+QCoZNAu98OxasZ0mPtOsVLI88g6GoAbS
         qAeAMqH4/71xbg+D3CrKuSj2/t2+AW4hmiQjiVf2YpLY7pod4KZNp2UVkUOAgunSkhvA
         haGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mTVMj8DP5Po1wfrviYqE1m4fi5ffVZmvpMq4wXcFS4Q=;
        b=yYVkLD7GJVGgCg9vNkZs386YXo6yR1JJOIwp4otDgVeW7C0Zun8VZPqONAVZIlv5Ed
         EmqB8w7cVUSkim9B+2ZVV/NVCsJFbWJXDZ2LYKDl7I9H489i5t5QmQNlsQH7xCqGKRCW
         NlAZHksQF2XGU1/HIr50ot/8JCKM16CMrX5OMRxiTZnjGP5PgtrvTwrY5MNs5/eCuFdI
         WLt/+JBrV0/1/iTXgXuA9rCKoPdO38NL8NdtJo3tIVDKfgiBas2h9TmzqUUe8Hi1hP6p
         XeSk6LbL7qnGlfUztaCM6Bn9a/H4HeaY8r1GbI00U2fnqNgnmm5v+Kf4ksqFxjMn1bua
         99ag==
X-Gm-Message-State: AOAM533oyMMA7F9uE7oTroUemRwWpRLjotWQ1seg6ogGJU4nQtpZTj2e
        IWHVw7I+354BFv5GDnzO/UicZmyaObM07g==
X-Google-Smtp-Source: ABdhPJyWe1bhKIHG2VMhxl8chwyIRVCoD2qi/GpsRNPu6xG5sgVvZ0DDpG9CcCed9T1xu2pAVkHrOA==
X-Received: by 2002:a05:600c:17c3:: with SMTP id y3mr153833wmo.136.1637332733146;
        Fri, 19 Nov 2021 06:38:53 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id z14sm3387551wrp.70.2021.11.19.06.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 06:38:52 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 03/16] dt-bindings: mailbox: tegra: Convert to json-schema
Date:   Fri, 19 Nov 2021 15:38:26 +0100
Message-Id: <20211119143839.1950739-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119143839.1950739-1-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the NVIDIA Tegra HSP bindings from the free-form text format to
json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add missing additionalProperties: false

 .../bindings/mailbox/nvidia,tegra186-hsp.txt  |  72 ------------
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml | 111 ++++++++++++++++++
 2 files changed, 111 insertions(+), 72 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt
deleted file mode 100644
index ff3eafc5a882..000000000000
--- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt
+++ /dev/null
@@ -1,72 +0,0 @@
-NVIDIA Tegra Hardware Synchronization Primitives (HSP)
-
-The HSP modules are used for the processors to share resources and communicate
-together. It provides a set of hardware synchronization primitives for
-interprocessor communication. So the interprocessor communication (IPC)
-protocols can use hardware synchronization primitives, when operating between
-two processors not in an SMP relationship.
-
-The features that HSP supported are shared mailboxes, shared semaphores,
-arbitrated semaphores and doorbells.
-
-Required properties:
-- name : Should be hsp
-- compatible
-    Array of strings.
-    one of:
-    - "nvidia,tegra186-hsp"
-    - "nvidia,tegra194-hsp", "nvidia,tegra186-hsp"
-- reg : Offset and length of the register set for the device.
-- interrupt-names
-    Array of strings.
-    Contains a list of names for the interrupts described by the interrupt
-    property. May contain the following entries, in any order:
-    - "doorbell"
-    - "sharedN", where 'N' is a number from zero up to the number of
-      external interrupts supported by the HSP instance minus one.
-    Users of this binding MUST look up entries in the interrupt property
-    by name, using this interrupt-names property to do so.
-- interrupts
-    Array of interrupt specifiers.
-    Must contain one entry per entry in the interrupt-names property,
-    in a matching order.
-- #mbox-cells : Should be 2.
-
-The mbox specifier of the "mboxes" property in the client node should contain
-two cells. The first cell determines the HSP type and the second cell is used
-to identify the mailbox that the client is going to use.
-
-For doorbells, the second cell specifies the index of the doorbell to use.
-
-For shared mailboxes, the second cell is composed of two fields:
-- bits 31..24:
-    A bit mask of flags that further specify how the shared mailbox will be
-    used. Valid flags are:
-    - bit 31:
-        Defines the direction of the mailbox. If set, the mailbox will be used
-        as a producer (i.e. used to send data). If cleared, the mailbox is the
-        consumer of data sent by a producer.
-
-- bits 23.. 0:
-    The index of the shared mailbox to use. The number of available mailboxes
-    may vary by instance of the HSP block and SoC generation.
-
-The following file contains definitions that can be used to construct mailbox
-specifiers:
-
-    <dt-bindings/mailbox/tegra186-hsp.h>
-
-Example:
-
-hsp_top0: hsp@3c00000 {
-	compatible = "nvidia,tegra186-hsp";
-	reg = <0x0 0x03c00000 0x0 0xa0000>;
-	interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "doorbell";
-	#mbox-cells = <2>;
-};
-
-client {
-	...
-	mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_XXX>;
-};
diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
new file mode 100644
index 000000000000..c43fc4c56f77
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/nvidia,tegra186-hsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Hardware Synchronization Primitives (HSP)
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  The HSP modules are used for the processors to share resources and
+  communicate together. It provides a set of hardware synchronization
+  primitives for interprocessor communication. So the interprocessor
+  communication (IPC) protocols can use hardware synchronization
+  primitives, when operating between two processors not in an SMP
+  relationship.
+
+  The features that HSP supported are shared mailboxes, shared
+  semaphores, arbitrated semaphores and doorbells.
+
+  The mbox specifier of the "mboxes" property in the client node should
+  contain two cells. The first cell determines the HSP type and the
+  second cell is used to identify the mailbox that the client is going
+  to use.
+
+  For doorbells, the second cell specifies the index of the doorbell to
+  use.
+
+  For shared mailboxes, the second cell is composed of two fields:
+    - bits 31..24:
+        A bit mask of flags that further specify how the shared mailbox
+        will be used. Valid flags are:
+          - bit 31:
+              Defines the direction of the mailbox. If set, the mailbox
+              will be used as a producer (i.e. used to send data). If
+              cleared, the mailbox is the consumer of data sent by a
+              producer.
+
+    - bits 23..0:
+        The index of the shared mailbox to use. The number of available
+        mailboxes may vary by instance of the HSP block and SoC
+        generation.
+
+    The following file contains definitions that can be used to
+    construct mailbox specifiers:
+
+        <dt-bindings/mailbox/tegra186-hsp.h>
+
+properties:
+  $nodename:
+    pattern: "^hsp@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - const: nvidia,tegra186-hsp
+      - const: nvidia,tegra194-hsp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 9
+
+  interrupt-names:
+    oneOf:
+      # shared interrupts are optional
+      - items:
+          - const: doorbell
+
+      - items:
+          - const: doorbell
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+
+      - items:
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+
+  "#mbox-cells":
+    const: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/mailbox/tegra186-hsp.h>
+
+    hsp_top0: hsp@3c00000 {
+        compatible = "nvidia,tegra186-hsp";
+        reg = <0x03c00000 0xa0000>;
+        interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "doorbell";
+        #mbox-cells = <2>;
+    };
+
+    client {
+        mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_CCPLEX>;
+    };
-- 
2.33.1

