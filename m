Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EC3C38A23
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 17:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbjATRbV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 12:31:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbjATRbS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 12:31:18 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B95AED90;
        Fri, 20 Jan 2023 09:31:11 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id o17-20020a05600c511100b003db021ef437so4234778wms.4;
        Fri, 20 Jan 2023 09:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdoQo1d/Fewt3gQuyYh4h+Gkl8pP1KOY6qOThytv+hI=;
        b=GNFViGqK9tTqpMZxDI3CBJeCm+MDtwGO3ieRWsOwQy6zL8z7EvKqrmid1acMPEBvIR
         in4jNFQkQoqort6U/nPqcaiKrfUyDdEPY4TKthYQ0p+pCDv/17zZGDoPs7CkjxJullPf
         9Xkiq5p7aQpALvn9z9bwAp0Shg+fTP92laBL28OOj8DyWOa3kGJ0X3e9xDyuN61kv8iE
         fIptJO2I2rfSVo8tJv4sTWYekeKn7iozC4CM3Nf6ObF0tl89+zKA+LTcgHFznUQ8tQ40
         AVPXJo85vEEB5LGBlsQsswxZjIFL2qC34FulqyYrkQZQ7N3tf7/FIjdysOtdA3rPS9kH
         naZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdoQo1d/Fewt3gQuyYh4h+Gkl8pP1KOY6qOThytv+hI=;
        b=DUXkAvBPhWi2xw8Kzdi+iALcZx99t/GdraKTgqYeU5U3DGswXLhOBbPIqGcVzwLQgK
         gEcU5EI7UcAGTpcSAaNmqHlbgVtYgkcr1eZEG0CCjvxfZjNPs1u03n7dDlbqOeLEJLnq
         kfs6bo4FZ6D7f8CYyjAShYWTAcFJ9VzKxK50tYeFQFviP8f07kdebyJNUCE24v0dgGr5
         zBgVuokqomc6is7tCZBvhkcPiykrKSlU+vBkNl6ResTk7jk3+ndF0+KpqBsAosovN8NY
         mvV7z+ka0trdhGVpTPn1Kl+rLlt8jb4Rieg48oCqfPTpl5EPBEFzErP5VFOdJwCP3IXJ
         vkwg==
X-Gm-Message-State: AFqh2kpTGIsn50eSXwMQ92JmyXAbNu6yWvQoDGlGohr51r/+UW9YCJGr
        VtiH41TdhYryEUuhedGL/YI=
X-Google-Smtp-Source: AMrXdXtgdksTbxRuG65zLEjDS1QUbMxH8ikWgpCZ64qimjbW2UYEGnrJEg6MWlLS/MimjoSmAWPcaw==
X-Received: by 2002:a05:600c:4e93:b0:3db:d3f:a91f with SMTP id f19-20020a05600c4e9300b003db0d3fa91fmr12757322wmq.23.1674235869712;
        Fri, 20 Jan 2023 09:31:09 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l30-20020a05600c1d1e00b003c6b70a4d69sm3311363wms.42.2023.01.20.09.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:31:09 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 3/8] dt-bindings: reserved-memory: Support framebuffer reserved memory
Date:   Fri, 20 Jan 2023 18:30:58 +0100
Message-Id: <20230120173103.4002342-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120173103.4002342-1-thierry.reding@gmail.com>
References: <20230120173103.4002342-1-thierry.reding@gmail.com>
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
2.39.0

