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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6690FC433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 17:47:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5151461A38
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 17:47:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhCZRql (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 13:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbhCZRq0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 13:46:26 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA261C0613AA;
        Fri, 26 Mar 2021 10:46:25 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id kt15so9617795ejb.12;
        Fri, 26 Mar 2021 10:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZyjQstMKafy6ZwlXwntaGGf+iH65jXnP8mReHmdqy2E=;
        b=jUkZ+LOx2Gq2dQqZLh3YIvYxddazHkVum2LmF2SdWir1o4PzXe80EgweIITASHvm20
         zoDHkFGqgdPr5nOFc/NooAIcP0LaToJ3067cVCQXKLhn/2WA8WNYBeuJWF0WgdgMKeqB
         05AOxAOaKcE3HwnmWhzcJeXUfSE70ZA18NUcAs0zdgTJD5JH7ejqvsGUsHj4sUGOvJdF
         8efF3pIfIFvtqEIFR7mw41akhOx4egxtUQxS/vU2d7g7aXOmdqWU5D4YBdGA48ocYlBL
         tayGtAgaDCeD1DCiaVtBf/97TrMgNfnmPH2T/9esEc+7a9Ima7sv0opD6mB9ewDGIGWD
         ldnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZyjQstMKafy6ZwlXwntaGGf+iH65jXnP8mReHmdqy2E=;
        b=jYke8JSN2NuPQFVfUbf83L0D76ZpiJ9G0oNYp5QjqZN4M0FTQpJYTrnZ6L/V+pyCaD
         j405QMwo0kFchhZqG4KR/1pqwY872djKb+T/9iIlMDYMVFY0upsU7TsEU2HGT1EsMP70
         YMA+sYt+mp37lMOghm4L89QEMWjtOXdO03UKx+rEL6qzp+3mPk5/Wz5ivMjLkFzXQMoK
         C7/EQ6JK0ayYxboDrc8jYI/wSu9n48mHtJibZufW9CJ1wXGpfin0o+90sGocT+PRS/NN
         JPS/bTr0lCv33cdmUsZGheiKOJN0xV+Uflla5RZX7NUk3to0wqn8GogJCoDwV+mQ20IF
         Sk/A==
X-Gm-Message-State: AOAM533Qx3IKzLZYBbJVTdxSaoYa6rb+xbnXUtLRe/XMPzMf/SqNrBB1
        tLpPqRslFvp2VAbGHpiu61g=
X-Google-Smtp-Source: ABdhPJy072vjxQqYj8rALJYaBGBQNxPiaJtMHAfrBmbsK5H4jZ186ALJeUkJQ0hzNrKkge9PmEZeHg==
X-Received: by 2002:a17:906:aed6:: with SMTP id me22mr16940903ejb.146.1616780784680;
        Fri, 26 Mar 2021 10:46:24 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v24sm4141978ejw.17.2021.03.26.10.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 10:46:23 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: serial: tegra-tcu: Convert to json-schema
Date:   Fri, 26 Mar 2021 18:46:39 +0100
Message-Id: <20210326174641.1612738-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326174641.1612738-1-thierry.reding@gmail.com>
References: <20210326174641.1612738-1-thierry.reding@gmail.com>
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
index 000000000000..0a321658ccb5
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
+    pattern: "^tcu(@.*)?$"
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
+    tcu: tcu {
+        compatible = "nvidia,tegra194-tcu";
+        mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_SM 0>,
+                 <&hsp_aon TEGRA_HSP_MBOX_TYPE_SM 1>;
+        mbox-names = "rx", "tx";
+    };
-- 
2.30.2

