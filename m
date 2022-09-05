Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3723FC6FA8C
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Sep 2022 16:33:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbiIEQdV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Sep 2022 12:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236403AbiIEQdR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Sep 2022 12:33:17 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD1852DC2;
        Mon,  5 Sep 2022 09:33:10 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id p16so18071017ejb.9;
        Mon, 05 Sep 2022 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=f5DwtJDoisx1vYAodm+93SFt8NZfEbF1NT6PIDTV9Oo=;
        b=TCSozw31wwW8nYR10JQsH0smjE0+iQ5+sn1v9GoPEFiqzHBH6mV1VFiByfJlSvFnul
         rFqydVMnKv1odQ+feq4o27dh+W705PgqzDPxXiJYD4sP0vkIzB/neF90/lYM2JsEs6oK
         UuWIO1UFbX/5e09U68+uv5bozOn1wxMdi5UG5wwsjIVKY7oN4zSs6bE14xRYYRNBny8d
         iHvXYdaJ9VeZLdLhMATTAd3ABbmS1rTim2Ru7Ul8IEhEj3eInImwIOlKZG6/MAPUX8oT
         jtATu5Aq5aFzELkTb3OOwyfEiWbZqp3++90JU5+2iG5qxodD0M08m4DGvabj7EUhYq00
         gPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=f5DwtJDoisx1vYAodm+93SFt8NZfEbF1NT6PIDTV9Oo=;
        b=qEHLfGqJd3ZMT4qn2hidsJJxuW3JQeA6j79hFoxCqhPDvaWvcLAnQIvvPD6FKAuJmz
         YizJ0vavL5G43YnPnRzCHUHLkFW88p0Cs96mpjCJazhSghJ394Fxbr1VKWOnuSjOnWOY
         GVe5t0HK74ziUlic8bVdjfkq2YfNBK3M3d2Um2+Mr4p/TZbucYWE+ZgxBdq4XhS3b8Kh
         nDBgQiBHTGBloYccmGrURBE3Sz2LdXFHZRkdn9pHd0/a1D6bXXHib7KXJsDXEH4oJFL7
         arCzlzwNCpdqbyBRHqEkz5F+oRaDwm7FlUlAkcz973mks2w33yykR2WBn1H9utAIIvil
         +TVQ==
X-Gm-Message-State: ACgBeo37V3A5I/iqrq3MklTZK5WlVCt55ZgqcBkl7lrEDf+rRXr90JoP
        g5ePtOOUH6juhGcXr5zrT4A=
X-Google-Smtp-Source: AA6agR6dax21NvyJRvB7GnjhDUGZA1kjZbVNthvB8vSgspGmVWvTvRSAlv6zzfsIrWX0d6q89/wJfA==
X-Received: by 2002:a17:906:9bcd:b0:73d:df4f:2e92 with SMTP id de13-20020a1709069bcd00b0073ddf4f2e92mr31955422ejc.576.1662395588280;
        Mon, 05 Sep 2022 09:33:08 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l21-20020a056402231500b00445f2dc2901sm6688063eda.21.2022.09.05.09.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 09:33:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: reserved-memory: Support framebuffer reserved memory
Date:   Mon,  5 Sep 2022 18:32:56 +0200
Message-Id: <20220905163300.391692-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905163300.391692-1-thierry.reding@gmail.com>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
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
 .../bindings/reserved-memory/framebuffer.yaml | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
new file mode 100644
index 000000000000..80574854025d
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
@@ -0,0 +1,46 @@
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
+  - $ref: "reserved-memory.yaml"
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
+      chosen {
+        framebuffer {
+          compatible = "simple-framebuffer";
+          memory-region = <&fb>;
+        };
+      };
+
+      reserved-memory {
+          #address-cells = <1>;
+          #size-cells = <1>;
+          ranges;
+
+          fb: framebuffer@80000000 {
+              compatible = "framebuffer";
+              reg = <0x80000000 0x007e9000>;
+          };
+      };
+
+...
-- 
2.37.2

