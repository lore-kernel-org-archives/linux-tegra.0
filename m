Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D189BC43217
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 01:32:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB87261B1F
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 01:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhJCBek (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 2 Oct 2021 21:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbhJCBeg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Oct 2021 21:34:36 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3EBC0613EC;
        Sat,  2 Oct 2021 18:32:50 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id r10so6071518wra.12;
        Sat, 02 Oct 2021 18:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W/CLM3NjFJ+jE/VoO2ncG57+jK2RKmooryYVNTnraoQ=;
        b=kqtIV4Yw4zceCFFiX8jCXWRkXBlVPl30q9h0sPKc7HVOvA1MzgBV7glxAZM3m9Uhj0
         3ls3CtF+MGQSfO4C+fVrnUHESHe1gTpiRmhHdO+2l8pbkNiqba6WKMimCnEbh5nicJCP
         OpKlgSU020CICn8gpofmp+4SNw8DX1xjeOFsbaw4daSO0/TeMy/iTxhXjFnZYtiT/8m3
         eQx8+0oCBcvOf7XRchn9vXSvvZJtge1L9JEPK+J/SRJXkLTK9Tc35QVhWv5Jxw/erRjP
         gU4EaZNvwsLg9u/opdEmKYaqzofv8TSV1vHzq8BCpNvS9SKcrTo6YKWvHyu+rdVNHGsU
         NBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W/CLM3NjFJ+jE/VoO2ncG57+jK2RKmooryYVNTnraoQ=;
        b=eA+d69zIn2uLvPs9qYARkSLDJdiDbQCKFxg+6FC3K49qwkxGegFR9g/DVnIIXRZnys
         AnXr7wv4LZRlESnhsRIbMp6atjLNTc1OpvdOA0DiCaJXutvpmgCXF3+0a4UMtINIasdW
         aGDXYZxK7CjffYMgxjMNzc+TyUNImFVDTuFn77pWUCZ5bbAKkTghdTC0yerlZ7OZdbhH
         C8ei8Fxn0m94lscz7DMBF/ElZTdmjh8wkKTiMAfD958vX7EfjeKu/BhpOrql5CK0+NYc
         mJAUZp40XPKva/09BSwtbA9jOhwioBF1hBhil9KZt/lJzuNPfIdY/isUZLpj0xrnq3Pw
         e5GA==
X-Gm-Message-State: AOAM533gRWjHY2KE0k0WrH3hKN1raOTNxd5wa2WMYe3dnXgT8wtF/G4y
        r+avjphcGIL7tc54RAGIq30=
X-Google-Smtp-Source: ABdhPJzrDJnK+TvkjMGX+4zrIUhbBTy0XWmCg69csPmwh2YboJqEMUzfOYalGerY46uQwyBjnBQvyw==
X-Received: by 2002:a5d:5255:: with SMTP id k21mr6016070wrc.421.1633224768877;
        Sat, 02 Oct 2021 18:32:48 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru. [94.29.54.195])
        by smtp.gmail.com with ESMTPSA id 20sm12481926wme.46.2021.10.02.18.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 18:32:48 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: memory: Add LPDDR2 binding
Date:   Sun,  3 Oct 2021 04:32:32 +0300
Message-Id: <20211003013235.2357-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211003013235.2357-1-digetx@gmail.com>
References: <20211003013235.2357-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add binding for standard LPDDR2 memory chip properties.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../memory-controllers/jedec,lpddr2.yaml      | 80 +++++++++++++++++++
 include/dt-bindings/memory/lpddr2.h           | 25 ++++++
 2 files changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/jedec,lpddr2.yaml
 create mode 100644 include/dt-bindings/memory/lpddr2.h

diff --git a/Documentation/devicetree/bindings/memory-controllers/jedec,lpddr2.yaml b/Documentation/devicetree/bindings/memory-controllers/jedec,lpddr2.yaml
new file mode 100644
index 000000000000..ef227eba1e4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/jedec,lpddr2.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/jedec,lpddr2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: JEDEC LPDDR2 SDRAM
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+properties:
+  jedec,lpddr2-manufacturer-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 255
+    description: |
+      Unique manufacturer ID of SDRAM chip. See MR5 description in JESD209-2.
+
+  jedec,lpddr2-revision-id1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 255
+    description: |
+      Revision 1 value of SDRAM chip.
+      See MR6 description in chip vendor specification.
+
+  jedec,lpddr2-revision-id2:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 255
+    description: |
+      Revision 2 value of SDRAM chip.
+      See MR7 description in chip vendor specification.
+
+  jedec,lpddr2-density-mbits:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Density in megabits of SDRAM chip. See MR8 description in JESD209-2.
+    enum:
+      - 64
+      - 128
+      - 256
+      - 512
+      - 1024
+      - 2048
+      - 4096
+      - 8192
+      - 16384
+      - 32768
+
+  jedec,lpddr2-io-width-bits:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      IO bus width in bits of SDRAM chip. See MR8 description in JESD209-2.
+    enum:
+      - 32
+      - 16
+      - 8
+
+  jedec,lpddr2-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      LPDDR type which corresponds to a number of words SDRAM pre-fetches
+      per column request. See MR8 description in JESD209-2.
+    enum:
+      - 0 # S4 (4 words prefetch architecture)
+      - 1 # S2 (2 words prefetch architecture)
+      - 2 # NVM (Non-volatile memory)
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/memory/lpddr2.h>
+
+    lpddr2 {
+        jedec,lpddr2-manufacturer-id = <LPDDR2_MANID_ELPIDA>;
+        jedec,lpddr2-revision-id1 = <1>;
+        jedec,lpddr2-density-mbits = <2048>;
+        jedec,lpddr2-io-width-bits = <16>;
+        jedec,lpddr2-type = <LPDDR2_TYPE_S4>;
+    };
diff --git a/include/dt-bindings/memory/lpddr2.h b/include/dt-bindings/memory/lpddr2.h
new file mode 100644
index 000000000000..e837b0d8a11e
--- /dev/null
+++ b/include/dt-bindings/memory/lpddr2.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+#ifndef _DT_BINDINGS_LPDDR2_H
+#define _DT_BINDINGS_LPDDR2_H
+
+#define LPDDR2_MANID_SAMSUNG		1
+#define LPDDR2_MANID_QIMONDA		2
+#define LPDDR2_MANID_ELPIDA		3
+#define LPDDR2_MANID_ETRON		4
+#define LPDDR2_MANID_NANYA		5
+#define LPDDR2_MANID_HYNIX		6
+#define LPDDR2_MANID_MOSEL		7
+#define LPDDR2_MANID_WINBOND		8
+#define LPDDR2_MANID_ESMT		9
+#define LPDDR2_MANID_SPANSION		11
+#define LPDDR2_MANID_SST		12
+#define LPDDR2_MANID_ZMOS		13
+#define LPDDR2_MANID_INTEL		14
+#define LPDDR2_MANID_NUMONYX		254
+#define LPDDR2_MANID_MICRON		255
+
+#define LPDDR2_TYPE_S4			0
+#define LPDDR2_TYPE_S2			1
+#define LPDDR2_TYPE_NVM			2
+
+#endif /*_DT_BINDINGS_LPDDR2_H */
-- 
2.32.0

