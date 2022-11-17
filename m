Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2337FC4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 17:56:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239803AbiKQR4b (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 12:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240272AbiKQR4Z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 12:56:25 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B962430549;
        Thu, 17 Nov 2022 09:56:24 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id n20so7162919ejh.0;
        Thu, 17 Nov 2022 09:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQDnSbf4DcrWvVaT28NGjUH2wowuhCIXjnxhIp+2Kjw=;
        b=SBdk8bxAEsR225srAItGVBu41N634LiqCOQqycuycYIcW7mpLMl4V1RNA6HnM7CbSb
         jUTg+FrNdae/7U+i4LVY42lqejjaREHGjkEdlCpiwepsHC/7pleOD7lFe9twTXNLgTuW
         IakIrMnCNvzqHpDTlQNgDwt2Cln3Zo/CkUgf5D7F00ce8rnxm4bP62P6vZ6BwNAGHjTM
         RpHDu17kar22OyetLBN8Md/IbSMopwB9MEJsMnXd45ijHf1Clw91GhfvB6SsHY1/SdFR
         V0d544gqQNbb0C5AvBy9mJ3hOQ/80Yqxmelk4ZP4bBDfDdgsoc3waZCN/NYxE4ynSwwc
         6NOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQDnSbf4DcrWvVaT28NGjUH2wowuhCIXjnxhIp+2Kjw=;
        b=LE8w7jRyn9VObv+W7Kxwr9NQD1cGzVwu8yuZOb1hQaReE9HpqcR0K32jR9CB4pjekp
         fjLR9C6ls/+6ednVTtuzQjBLfFWw4ME/5L9JysUk3w3h7sk8cL70IYEXp8s9gihiQjLi
         l7bW2MGt7n7BAdv1GjrE4tdA8xoIQ3O7aNwf1JR0yZfC1zOVUVZM0BvPFbtdNVyUx67l
         0mVt262+lzBWyNOl8lDrYD6AZuyj0Es4JuD0hhoEkcf/YP6wm9YQcZ6wB0RUa0wz0Tlw
         epHaMrx8DlWK7K5TmL8zbOPHFGLGyJ/eZQryVQ0n/CF3Ktl+Uui1SFgY1RrdOPBbcmxY
         +Tqw==
X-Gm-Message-State: ANoB5plSZY8CLgRfJoGJIDPUOjhJdL2j2GlihDylvOraPR8+hfDd6zf/
        lFxl9H0aIs93935IgmtEWbQ=
X-Google-Smtp-Source: AA0mqf6/qCMjZ20YPZ4FD8Phm6bMKswlkZbzWtsSfDJ4DI2YBS5NeUi61KPbx4fJr01CHkDigWFQPw==
X-Received: by 2002:a17:906:f189:b0:7ae:3fa3:d7c6 with SMTP id gs9-20020a170906f18900b007ae3fa3d7c6mr2865624ejb.494.1668707783091;
        Thu, 17 Nov 2022 09:56:23 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p23-20020a05640210d700b00463b9d47e1fsm813008edu.71.2022.11.17.09.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 09:56:22 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH] dt-bindings: tegra: Allow #{address,size}-cells = <2>
Date:   Thu, 17 Nov 2022 18:56:19 +0100
Message-Id: <20221117175619.2284668-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Both 1 and 2 are valid values for #address-cells and #size-cells on the
various busses specified in these bindings, so explicitly allow 2.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml     | 4 ++--
 .../bindings/display/tegra/nvidia,tegra186-display.yaml       | 4 ++--
 .../devicetree/bindings/sound/nvidia,tegra210-ahub.yaml       | 4 ++--
 .../devicetree/bindings/sound/nvidia,tegra210-ope.yaml        | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml b/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml
index d3ed048c9521..4157e885c6e7 100644
--- a/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml
+++ b/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml
@@ -40,10 +40,10 @@ properties:
     maxItems: 1
 
   "#address-cells":
-    const: 1
+    enum: [ 1, 2 ]
 
   "#size-cells":
-    const: 1
+    enum: [ 1, 2 ]
 
   ranges: true
 
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml
index 55e672493c12..b236bdc3c9e5 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml
@@ -21,10 +21,10 @@ properties:
       - nvidia,tegra234-display
 
   '#address-cells':
-    const: 1
+    enum: [ 1, 2 ]
 
   '#size-cells':
-    const: 1
+    enum: [ 1, 2 ]
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
index 89f7805de274..c4abac81f207 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -50,10 +50,10 @@ properties:
     maxItems: 1
 
   "#address-cells":
-    const: 1
+    enum: [ 1, 2 ]
 
   "#size-cells":
-    const: 1
+    enum: [ 1, 2 ]
 
   ranges: true
 
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml
index 9dc9ba590fa3..ed4416fe2f52 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml
@@ -34,10 +34,10 @@ properties:
     maxItems: 1
 
   "#address-cells":
-    const: 1
+    enum: [ 1, 2 ]
 
   "#size-cells":
-    const: 1
+    enum: [ 1, 2 ]
 
   ranges: true
 
-- 
2.38.1

