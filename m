Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F17FC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:06:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 223E161077
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:06:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235000AbhKLNJ0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:09:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234961AbhKLNJZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:09:25 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A347C061767;
        Fri, 12 Nov 2021 05:06:34 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id c4so15379114wrd.9;
        Fri, 12 Nov 2021 05:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9nosp8S/rE3Sg+2Vu+u269jm6fcZZetxKqjytuWw9qw=;
        b=nZizuKNkt/0s/qwz3apj2SKm1AC3KS+0tf9VYNldYwhtEoTenwyee3C2V7382I2som
         wBPqKGkMA6pbuKN6eE1ndotMVl6wH9JA/3f+WVkkRM+5rc68xmcwe8fGYb4giAbKIA84
         8fgTHSe1LhTDInWwg7iBJx1j8sbOsx9LOLyEtrDZzTYcoiIbV1oBKfCQfIg9boueDaq2
         nAgu8iRvnQwdWb8DcUk1swcUglZ7u0Y4RIXlpg2BdHIqu7qBubDFNyCkNn8PnFDyyo2y
         KUGqdeJWEfV2bXeFCC2UWYJ1PH5s8Bc7/GS/FGr1wV/55lkU3r67gczanGmf5XMrx6ke
         Rlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9nosp8S/rE3Sg+2Vu+u269jm6fcZZetxKqjytuWw9qw=;
        b=o1Ggv1vKAsBBFah9401Z2XA+KBzxVl39P2Ryjg8zjvEPeW4ocpP888c+1VTld1cvNp
         25HGUc5jB6QhqjDub3s46bWTrPAvJYX7nyt0zjO/HYN1XGUqhQZ1GWAR9U920G0BadIh
         pnQFsA2gf7FgCbB0wZzGYvSQwdNEAS9ubwqqnUGpgGGugogSMPVQ8akT1TTY3w4aNyD2
         VrR3LG9zopHHNhuGyBVlaU/X8G4ujsWlkbpPzwZrvaJjjSuEcYIeLxjyp7+iKm0ozYJn
         hD1OW+OIKi6HXNcUak4mu9I0nbPLgpKfWVXRhaTS/6TfVekiggS7QqU1XRbmqTRhU0Kb
         0oiw==
X-Gm-Message-State: AOAM533UwbI9pIwp7xL3KppKaJQk3SfUSLSV4krR5v9uo+sNpO/MTHwR
        T/wxKjDMu01htRAjkvWqONo=
X-Google-Smtp-Source: ABdhPJy/aTRP1W201OXHen1cY18Cuk0+G2kwjMZXqOOFejc4dyR6bwZ3kmSshJESHh2EYv2pv4aMLA==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr18748754wri.377.1636722392872;
        Fri, 12 Nov 2021 05:06:32 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id y142sm3879803wmc.40.2021.11.12.05.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:06:31 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: memory: tegra: Document #interconnect-cells property
Date:   Fri, 12 Nov 2021 14:06:23 +0100
Message-Id: <20211112130627.3682795-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112130627.3682795-1-thierry.reding@gmail.com>
References: <20211112130627.3682795-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The #interconnect-cells properties are required to hook up memory
clients to the MC/EMC in interconnects properties. Add a description for
these properties.

Also, allow multiple reg and interrupt entries required by Tegra194 and
later.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../memory-controllers/nvidia,tegra186-mc.yaml       | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
index 611bda38d187..f6e4af4e86cf 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
@@ -33,10 +33,10 @@ properties:
           - nvidia,tegra194-mc
 
   reg:
-    maxItems: 1
+    maxItems: 3
 
   interrupts:
-    maxItems: 1
+    maxItems: 2
 
   "#address-cells":
     const: 2
@@ -48,6 +48,9 @@ properties:
 
   dma-ranges: true
 
+  "#interconnect-cells":
+    const: 1
+
 patternProperties:
   "^external-memory-controller@[0-9a-f]+$":
     description:
@@ -65,7 +68,7 @@ patternProperties:
               - nvidia,tegra194-emc
 
       reg:
-        maxItems: 1
+        maxItems: 2
 
       interrupts:
         maxItems: 1
@@ -78,6 +81,9 @@ patternProperties:
         items:
           - const: emc
 
+      "#interconnect-cells":
+        const: 0
+
       nvidia,bpmp:
         $ref: /schemas/types.yaml#/definitions/phandle
         description:
-- 
2.33.1

