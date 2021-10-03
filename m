Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2499C433F5
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 00:35:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90C6D61439
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 00:35:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234326AbhJCAhZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 2 Oct 2021 20:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234321AbhJCAhZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Oct 2021 20:37:25 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D24C0613EC;
        Sat,  2 Oct 2021 17:35:38 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id b192-20020a1c1bc9000000b0030cfaf18864so9609091wmb.4;
        Sat, 02 Oct 2021 17:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W/CLM3NjFJ+jE/VoO2ncG57+jK2RKmooryYVNTnraoQ=;
        b=bXPGd1AnrQOyMEa60VkCBPHFO3ZFSaCQWEqUT5DtR1rCpkvvhvbtOYtXO6vp69GQaU
         mDuSBaAQFezNYSI4gYisrBhUH3rohSBLjBlTtbKNm7f+mTKDyzWutrbboMmDnUKzs/2y
         v5UJ8VN8eR8giJC07h/jbitgWOjNDUzw7WgjxXSHenLYpQ0/o9OqCRKwNraMGP3en7Nc
         bCRFGSg12PwaN/ItCMVQ0NOpb0FjBeFROfpwqwkASO0oQomWrEE3SSB526DM/kYngGe4
         0BmuJ9sFHn+dfoVgALdbPgh6npaxYicHqcXVX1YX2FCakkhnbRFpRMK8LC6DUMFQv6Nm
         sKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W/CLM3NjFJ+jE/VoO2ncG57+jK2RKmooryYVNTnraoQ=;
        b=c0HvbCjSj3qINF0KtYsOd68ky7Wlmtazja1o4NQ6mUqOmTIG69gOHY8lMvqroKwTDN
         Q1dUhQv+61+PD5a7GGeDOvFeWxb3ipeAKqSOls3bjhuXsyZzFRZW2rj+YCQZJNVQ6X1Q
         XAtJUs+ZZyH9k8VSLB6GsPgxmIAp4abSVJoP8SsvYT3SfRAT4o8CaSLesYg2mOx5Jt2/
         lxm0lc85MguCvtzt/DD+S3Zih3eTVPW4gSa7ReN+p1GVNs8pizUVzRUIx3mkVrkn6EG5
         Npq/HAAprsn5D572TxT8d3+8s2UPArTAYkv3irwbtEVpjsKrsGom6wDKWZeO+uEpiIEy
         GZ+w==
X-Gm-Message-State: AOAM530AQDwL/N8dHBsvEb+M1iXziZa/Dak3XgKXEYvVcfRzbzjDE6zi
        zHwltO3FP73clLgXMjZ9aDzS0VnHVwM=
X-Google-Smtp-Source: ABdhPJxvS4gwmsX9I9gs4RCuZH5FoJMTLY1Nnx4ifXiKf8L82fe3aJNpEVw5Ds20WVcF8q3CXf8fPw==
X-Received: by 2002:a7b:c113:: with SMTP id w19mr11463397wmi.124.1633221337430;
        Sat, 02 Oct 2021 17:35:37 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru. [94.29.54.195])
        by smtp.gmail.com with ESMTPSA id m21sm10981445wmq.37.2021.10.02.17.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 17:35:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: memory: Add LPDDR2 binding
Date:   Sun,  3 Oct 2021 03:35:06 +0300
Message-Id: <20211003003509.28241-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211003003509.28241-1-digetx@gmail.com>
References: <20211003003509.28241-1-digetx@gmail.com>
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

