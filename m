Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA66C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:06:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A553060FED
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:06:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235081AbhKLMJL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:09:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235000AbhKLMI4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:08:56 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A44C06122E;
        Fri, 12 Nov 2021 04:06:03 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so6606421wmd.1;
        Fri, 12 Nov 2021 04:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b8xXQKtUyU9ebK+LdHYtVXL4JcEXXJuMuyVb0n2sCgQ=;
        b=WtPqGku5T4tS8GxIq6sWMOGq6IMgMgFPpGouSYF4s7wJMbURuBvD5HzrUOplpYYJ/l
         7p4zyAtXTwmw6p0cW0jEMOP1HhgZIkqYvpDzTn4nTOsWqAF2K36uc7mniKHeLmMCx2+M
         +WzdlL2CprxJzba+reJjg4Fg3hEWuRpVlXYL4+kUJ++Ut44nHrtRr4/dCuNJVW50G6uV
         xAl3CPpodyJb3Dwz6aGsPybprgZ2KVzgp0b60aXajApqXoBKgi9lIv+Adt+jqh/Orbo/
         Fq0UKBIYk0vi5AsvNx1QkTOQS8ovXbksgmCbqgXCHhPakSFk7vCtO9m1yWPqNquMKavs
         gJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b8xXQKtUyU9ebK+LdHYtVXL4JcEXXJuMuyVb0n2sCgQ=;
        b=3WGk6NZhuuPsXOYzR/ZJrB303sBc3J/5P1uFL81w5QmPmpvpm28Cb9GwLfasKpDw1q
         QDmXY2BmN8ReNjCwbeUxCARkINnXedMh5OHfsolpctuDioKzALBNBIqptXauJJfbeVJt
         VfQdvGo9DbqXWLD1THfTF1KisdJMsmj/HaW5mUCuJSRcw5Bq9/dRADI0iGHVzwy0RAjR
         qoPWhXOWKoTScYCkDzTYBKJN5WzKWHGPcJ44Q2h5NMBB8R02lzmknF0DvouHd+UGXa97
         SB5bit7tkO2qYS+dL7epFQM649IZCETfLmNfev8ncUbcDm2G2o7dNAyaMZN/mKaZW7oI
         x7Eg==
X-Gm-Message-State: AOAM533dpCobytT8bB6JZnyD4jD2YEg3UR3ndk1YtqhQmX/7LK/ow0mf
        stKuN8WqUjL4ywXWsIhDBRM=
X-Google-Smtp-Source: ABdhPJwzSVfdAVtw0g+CwpY7QeuOaIbeHrUxvGAsgFEBnbIbk2+uLDE+kSE1KBZzhMKyUUaFZ4ibnw==
X-Received: by 2002:a05:600c:2189:: with SMTP id e9mr33538478wme.35.1636718762312;
        Fri, 12 Nov 2021 04:06:02 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id c6sm14481866wmq.46.2021.11.12.04.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:06:01 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 14/15] dt-bindings: serial: tegra-tcu: Convert to json-schema
Date:   Fri, 12 Nov 2021 13:05:17 +0100
Message-Id: <20211112120518.3679793-15-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112120518.3679793-1-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com>
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

