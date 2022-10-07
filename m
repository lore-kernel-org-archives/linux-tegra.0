Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF337C43217
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 12:50:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbiJGMuH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 08:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiJGMuG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 08:50:06 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB4D2B60F;
        Fri,  7 Oct 2022 05:49:59 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a26so11120761ejc.4;
        Fri, 07 Oct 2022 05:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/DGi9HQh/INO76ufx6qo153czghX5f9wyf4yTlgdnU=;
        b=aDPiK9wgDuCz4iykhw/dpIIa1iCJJIzfjVwFJPE05jLGwbOb5Y9Jbi7xRrJ0kFvAM+
         98DH35bLCCPbb1e+/VgtbQ8LI7kSQMlcv5xVOekSPdapMDYrkz7wPGujvri5ib/ySiXj
         VsfZykt2TboOSqvJMQ2/MqZmVM0cn13QoXKGy9U31p0sxTavg5vPRwdD89hf1tSNCw8a
         sHrNaSx61u8KPf03hPcVluNJo6QoWfp7ZxUE9x554yCb7XpN/Ds9+elOSdJTv02BPxv1
         b2ZBrpI+RSF2egeWZF/DF/Kha7O049hgBhmEWkVkXhhhjqt021cLCOU33PhU5vwAyZHH
         XcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/DGi9HQh/INO76ufx6qo153czghX5f9wyf4yTlgdnU=;
        b=B+GEENoGXJ4dnU6HACMTRLDOk2fiYtfeeHfJjDUsusrwtZ1jb/joXXtTUfYRNQ9crP
         f6MtbrHy9S/GeHrDQrLDe6MZGydaPXGR77eJN5mK34QZb4/MkK8lcjDYxIas4EKbrScd
         erC8tUXE/6FcHetyBESR2V6cHJhlXch14iXzheWM3dybRhMDGDgAP4TwReuPtw4nSBmh
         5WrYuo0Nv8XrlUAzAy/cJNhgKpsI7t+0JzWCHmRskPkmV3EArFzaysO5BuNSWYhf/vpQ
         HmTW5AYBeLva3HtxcAsu5Juem3rGW8fKYnVW+UmiBAl2QtJcmXjyeRKMkngTsKN5UF9l
         Yz8w==
X-Gm-Message-State: ACrzQf2dUpuM03OnQj3EXSp1LCRELyROXMJcaGjDqKf7GIhpPt1Rdw+p
        zf0JRpB38t4reIqxWaqf4us=
X-Google-Smtp-Source: AMsMyM4pPVMkGNTzw9EHjcedFTuvHCXHVwUn1M83nCd/82dP2yu3uWlCgG662VxDuaHMUllmScMb0Q==
X-Received: by 2002:a17:907:9603:b0:742:9ed3:3af2 with SMTP id gb3-20020a170907960300b007429ed33af2mr3886671ejc.510.1665146997436;
        Fri, 07 Oct 2022 05:49:57 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p9-20020a05640243c900b004573052bf5esm1424166edc.49.2022.10.07.05.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 05:49:56 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 3/7] dt-bindings: reserved-memory: Support framebuffer reserved memory
Date:   Fri,  7 Oct 2022 14:49:42 +0200
Message-Id: <20221007124946.406808-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007124946.406808-1-thierry.reding@gmail.com>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Document the "framebuffer" compatible string for reserved memory nodes
to annotate reserved memory regions used for framebuffer carveouts.

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
2.37.3

