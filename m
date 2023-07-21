Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FBEC001E0
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 13:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbjGUN6d (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 09:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231556AbjGUN6b (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 09:58:31 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FF130FF;
        Fri, 21 Jul 2023 06:58:05 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-992b27e1c55so306475766b.2;
        Fri, 21 Jul 2023 06:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689947883; x=1690552683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRDa+hXtdMdC6ZYOUEjHUlfDPteWrj1xebQwjE7g54o=;
        b=Q4zYfoCFspo6eRw6dSpFr4ss/iTcfDE61aduF8axDGPX1B7AM1e86J0/f9slVgfGhs
         I62z//MixkWJSLndiO11zDHMeStPjmb8oH08bsYjighwx1Y+shsP+x+qqzKge6V/KjYc
         Ed3oeYunr1S+SlqMoCiDyGe/StgYAGHN272cwJG3dIH/FJVBr+csnda6WgPAVvOWcRIO
         r8qPCcp+3cyL/mt2w8Nug9RNmGUSdowrXTtRs87EcnqWHttOoXjyiLZlslIfTi+cJLGB
         R4DXSEBbDP9WCvdd8B/rInXMMAZlVWFPsaPVDTY9XBpSny+2lHhRgayQ4vhwaNGTvZ0j
         9gsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689947883; x=1690552683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRDa+hXtdMdC6ZYOUEjHUlfDPteWrj1xebQwjE7g54o=;
        b=K4+YEunUKUqnqqZdFCg1tPbtj6Hi3Jwbjw4sXbKfZi2m4epXxa6EtXOaYXhnEFl9md
         qPttoQs48RdU/jeWQSj/giFB0dxFDXeMqxmDPBD3tAds6tGUDwQHxMLuJ7LDAfTlfLpP
         ftBOGjNo0BzYCwiBfk2H9SgqPyDuG7FZAhD5JuNXx3JzikGT44yhieStolt24hivN8jQ
         ifvMbOMTX+tRITrxIaYY4OgHHsJDEX/ws6cPNKAgAM1p//C6QFkbhGFsw/xZGrg47vpU
         B+iBdvSPyb3tGg1XT1G8NHbllJ9/3kAuRrgs4SuflP0UUw4L2GnQGmzxqI+KdZGMi3Jt
         VjQg==
X-Gm-Message-State: ABy/qLa+ZbF5Xsr2BX1RqrW2UB9DaxSP0kCnXErfb42BG5SCuSNS8vbG
        rKKk5YWeQ0Km2q1L+92pONc=
X-Google-Smtp-Source: APBJJlGXo6KJTtBvDxpzKoa0Ll06/93qqmYqGLS3iXNOGuxfLbZEIYNingZpfW6vsOFMLwngcnYOSA==
X-Received: by 2002:a17:906:cc13:b0:99b:4bd4:df5d with SMTP id ml19-20020a170906cc1300b0099b4bd4df5dmr1652607ejb.42.1689947883591;
        Fri, 21 Jul 2023 06:58:03 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id qp7-20020a170907206700b00992b66e54e9sm2208013ejb.214.2023.07.21.06.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 06:58:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 3/7] dt-bindings: arm: tegra: pmc: Move additionalProperties
Date:   Fri, 21 Jul 2023 15:57:55 +0200
Message-ID: <20230721135759.2994770-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721135759.2994770-1-thierry.reding@gmail.com>
References: <20230721135759.2994770-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

For indented subschemas it can be difficult to understand which block an
additionalProperties property belongs to. Moving it closer to the
beginning of a block is a good way to clarify this.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add Reviewed-by: from Rob

 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml         | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index 0ac258bc7be0..d6f2c5862841 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -126,6 +126,7 @@ properties:
     description: The vast majority of hardware blocks of Tegra SoC belong to a
       core power domain, which has a dedicated voltage rail that powers the
       blocks.
+    additionalProperties: false
     properties:
       operating-points-v2:
         description: Should contain level, voltages and opp-supported-hw
@@ -139,12 +140,11 @@ properties:
       - operating-points-v2
       - "#power-domain-cells"
 
-    additionalProperties: false
-
   i2c-thermtrip:
     type: object
     description: On Tegra30, Tegra114 and Tegra124 if i2c-thermtrip subnode
       exists, hardware-triggered thermal reset will be enabled.
+    additionalProperties: false
     properties:
       nvidia,i2c-controller-id:
         $ref: /schemas/types.yaml#/definitions/uint32
@@ -176,10 +176,9 @@ properties:
       - nvidia,reg-addr
       - nvidia,reg-data
 
-    additionalProperties: false
-
   powergates:
     type: object
+    additionalProperties: false
     description: |
       This node contains a hierarchy of power domain nodes, which should match
       the powergates on the Tegra SoC. Each powergate node represents a power-
@@ -224,7 +223,6 @@ properties:
       "^[a-z0-9]+$":
         type: object
         additionalProperties: false
-
         properties:
           clocks:
             minItems: 1
@@ -246,8 +244,6 @@ properties:
           - resets
           - '#power-domain-cells'
 
-    additionalProperties: false
-
 patternProperties:
   "^[a-f0-9]+-[a-f0-9]+$":
     type: object
-- 
2.41.0

