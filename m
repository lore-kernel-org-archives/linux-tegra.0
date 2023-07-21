Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5C6EB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 13:58:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjGUN6c (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 09:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbjGUN6a (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 09:58:30 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9C63AA8;
        Fri, 21 Jul 2023 06:58:04 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-991da766865so307497166b.0;
        Fri, 21 Jul 2023 06:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689947883; x=1690552683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYtxsERINvfOgj4TjnONVaidkuvzw8sv8zecGnhSGTU=;
        b=GOyp6a7CNYyq6UbVYr7VmE8D+bXYRGraPwUeI19n4sLxVnheM07+DNEvz0nc9QFUr2
         eovpJvbftUONq3cQcAMOMDcz0lJBl3FLsqpDw4ijThHqOFi6WcrlINXWyCcTP90Qm+Q5
         OySY9C1ldFpHPLU+5AzSOu//YVfdJ0fnjeAGx86qo1DjZYdx8g31jnh9NpNE2UR5ShwQ
         bbt2zEWxLFN5Tetcw21Q0gSFUCA0u/0FVZWlTQHPBFDC5Mv/5PfHwQXBd4O0Ol+uakYR
         Nac0IJkvkpO4/qS1sx+QBVJ8uG+WOWrFuvmxyJ7dzNl+wYtpB6D+vZKlBtv/X1hoP7P8
         7CLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689947883; x=1690552683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYtxsERINvfOgj4TjnONVaidkuvzw8sv8zecGnhSGTU=;
        b=MXo+81xVjba+58d5evBuUe7Kh4X0cB2yltSnYF8A19MW4O6FwZamSCSynh3btheXLP
         flt/g/ykrioJNgtjo9d8asd8U2q5X2CExirtaZio1xkjyduAFjUwaMrywP1gjf5dhyS5
         PAq1hh8Upzufh26KKXew3RS2QLADYpQe99sMako0815zsGQZkbWySyueViNeoECWx2tv
         LM77a2pGyHtCQKLeYWNWW2zwdQilnUT6CiFbopv3gxtTPthGCbpndOj88pEYSTRU/iFW
         xmXdq0p6NJLqLmkRPYfqqGkZXxnjrKIb5xpL7q/Cc2nQ2XfY5SIAnWy2/u4AjoExDUqD
         inRA==
X-Gm-Message-State: ABy/qLbR9YKLBxV316hjp5uo1rTArEYfC1JghrvVbtZTU8x6Mr8e8jsK
        YvWYswC1uyja4nvT5ZRHrrA=
X-Google-Smtp-Source: APBJJlGK5sNXwgeiMcH8XhtWrLWaHd4qRoqbwtzBqKGyIcOyamL7eg1DMuX41JgiwBfo5/S2VJy3WQ==
X-Received: by 2002:a17:906:2086:b0:991:fef4:bb7 with SMTP id 6-20020a170906208600b00991fef40bb7mr1641707ejq.73.1689947882619;
        Fri, 21 Jul 2023 06:58:02 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p2-20020a17090628c200b00997e99a662bsm2193899ejd.20.2023.07.21.06.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 06:58:01 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/7] dt-bindings: arm: tegra: pmc: Remove useless boilerplate descriptions
Date:   Fri, 21 Jul 2023 15:57:54 +0200
Message-ID: <20230721135759.2994770-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721135759.2994770-1-thierry.reding@gmail.com>
References: <20230721135759.2994770-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The descriptions for the clocks and resets properties are no longer
useful in the context of json-schema, so drop them.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- drop description of "reg" property
- add Reviewed-by: from Rob

 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml      | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index 38fe66142547..0ac258bc7be0 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -21,8 +21,6 @@ properties:
 
   reg:
     maxItems: 1
-    description:
-      Offset and length of the register set for the device.
 
   clock-names:
     items:
@@ -33,9 +31,6 @@ properties:
 
   clocks:
     maxItems: 2
-    description:
-      Must contain an entry for each entry in clock-names.
-      See ../clocks/clocks-bindings.txt for details.
 
   '#clock-cells':
     const: 1
@@ -234,18 +229,10 @@ properties:
           clocks:
             minItems: 1
             maxItems: 8
-            description:
-              Must contain an entry for each clock required by the PMC
-              for controlling a power-gate.
-              See ../clocks/clock-bindings.txt document for more details.
 
           resets:
             minItems: 1
             maxItems: 8
-            description:
-              Must contain an entry for each reset required by the PMC
-              for controlling a power-gate.
-              See ../reset/reset.txt for more details.
 
           power-domains:
             maxItems: 1
-- 
2.41.0

