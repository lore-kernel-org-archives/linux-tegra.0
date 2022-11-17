Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A5CC43219
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 18:40:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240509AbiKQSkx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 13:40:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235064AbiKQSkw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 13:40:52 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 564587FF33;
        Thu, 17 Nov 2022 10:40:51 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id i21so3849676edj.10;
        Thu, 17 Nov 2022 10:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWVJf0S9kqs87h9L8NvjpGJOac1XzRow1tUHd0R/FGA=;
        b=A71LMLctjhFiGB+nzlkmn8+VI54b2dfeC6yJdUT/jMVgQ9Bhm3+spI29djFRnYJG+t
         Jrs0YL7rFykG6AsiuJLGbVz0MCUVGrvxsgqH2CphFUZm1rzNZss7Fy6IrCK1749DnPhP
         cGD0aU4PCo0oYeMThSZw3FMjv3gQrIlSBEE2ehNkGJ3SDOcNW6EZqSepWQRi/lYlSxWW
         YviuzuzCw9pDq48d9B3bLNfLX6Q6+LsTAIKBYqi3D5Zy/1mxNJqIdqg3hcmh6ohpRL0X
         gdp1MXvzqoIhiY2i3GjweP6APYPTXVnQUuk+vopyhfIqSvoCNYRfrlq1FgNOddTjlaWD
         Oebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWVJf0S9kqs87h9L8NvjpGJOac1XzRow1tUHd0R/FGA=;
        b=AhE1GKdGKicPMGC4JdDLw6iZcWEaSCh9WCVrVVCDhuXjTZLxOCtc+wpJbtwNMtkUqP
         gjHoCXKhfHsJwgaFgID2OlQq7pnwk/SCqxfdsWscHZ7lG7RY1ZpJ855xTKnOjtlE2J2Y
         Xyny2HN6+K0mUp1wvVLq46sd1lDTgSE073TVCJTjnL1AAE0o/+1s01AOhfRDVMOi92Hp
         mvXYoh8xOFurMpDusdiOmZehfOfP2NK9RJPiithk8djTHpKfEtRjPJR/1vWZ3jtd8trM
         f+C8XxqYui/U4HuNbnhpXi3vhyh2qd5KxRyEkNM130R9q2RhHzqP5zo4mMbO3jKWBA8N
         sNNA==
X-Gm-Message-State: ANoB5pmkij16pzwS9GLgr7VUjz03m08Fp8MdrQmQDu1Tl2j+wy6jTkPH
        fC5jJ3ac/3nUOm7TNK6mr78=
X-Google-Smtp-Source: AA0mqf4ZN5qTTfZsCmLUrTJuTNa2VWaQn9Ue2FfHJHLlMaOUGDKOLjB1jb8zyRCSe523ljqglGha9w==
X-Received: by 2002:aa7:dd45:0:b0:45a:3c66:b0e4 with SMTP id o5-20020aa7dd45000000b0045a3c66b0e4mr3373267edw.33.1668710449770;
        Thu, 17 Nov 2022 10:40:49 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u22-20020aa7d896000000b00459f4974128sm874496edq.50.2022.11.17.10.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:40:49 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 3/8] dt-bindings: reserved-memory: Support framebuffer reserved memory
Date:   Thu, 17 Nov 2022 19:40:34 +0100
Message-Id: <20221117184039.2291937-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117184039.2291937-1-thierry.reding@gmail.com>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Document the "framebuffer" compatible string for reserved memory nodes
to annotate reserved memory regions used for framebuffer carveouts.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- use four spaces for indentation in example (as recommended elsewhere)
- add explicit root node
- drop unneeded quotes

 .../bindings/reserved-memory/framebuffer.yaml | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
new file mode 100644
index 000000000000..05b6648b3458
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: /reserved-memory framebuffer node bindings
+
+maintainers:
+  - devicetree-spec@vger.kernel.org
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: framebuffer
+    description: >
+      This indicates a region of memory meant to be used as a framebuffer for
+      a set of display devices. It can be used by an operating system to keep
+      the framebuffer from being overwritten and use it as the backing memory
+      for a display device (such as simple-framebuffer).
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    / {
+        compatible = "foo";
+        model = "foo";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        chosen {
+            framebuffer {
+                compatible = "simple-framebuffer";
+                memory-region = <&fb>;
+            };
+        };
+
+        reserved-memory {
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+
+            fb: framebuffer@80000000 {
+                compatible = "framebuffer";
+                reg = <0x80000000 0x007e9000>;
+            };
+        };
+    };
+...
-- 
2.38.1

