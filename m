Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDA9C001DF
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jul 2023 16:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbjGZQ2C (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jul 2023 12:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbjGZQ1x (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jul 2023 12:27:53 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4EEB26A8;
        Wed, 26 Jul 2023 09:27:51 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51ff0e3d8c1so9908883a12.0;
        Wed, 26 Jul 2023 09:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690388870; x=1690993670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYtxsERINvfOgj4TjnONVaidkuvzw8sv8zecGnhSGTU=;
        b=Up+R6SbCK4R25JybpPE1RDnPYTMXiFQMheC5lvIt5b+v2SbL6y29GQSiGUKpMtmlqN
         wq2qRmpr+NjwlmVKF4tCjXDIdQ+1RyACFKwD5xmFufYYIEBeiKTqZAt7ESOnOWYe7ncC
         VhHyuAjSgcDH0Np83ubYHxS9x7pDHt0Wg8menD2d2KD7aIo0b51rDrgxHEocfcdR4Cw+
         YWw8wmKm4RRLWhh5p6PQLW6hPkpO0dGylOFX/Phfp6BWU+oYihlKEjBv/5ljHaEvrGEW
         NSRTRgkncMZVn2gIDb4dlW7oQRLfHAiMLGm/QT+JA8xmD3kPjm9UKqbgHAU5bkXumgsS
         +gCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690388870; x=1690993670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYtxsERINvfOgj4TjnONVaidkuvzw8sv8zecGnhSGTU=;
        b=NjEyuNAWQ91XBFmPZcwplH4UBGHKCLZ57DuuP+UEUWUMWGLWYk711vPigAscLVpkUT
         vCISl+2vxB0rTR59qbtx+XNMlmc++6ZjVPsJbWOVNjczgOMgDgJlfFep2f+tlRes1n5W
         5/1uXMryhWp7RddJLztDWY3Nwr10QIDfhf3JmC0D0jDTpPYMLlqsGHwHmATRcSPEs45i
         WagnAQmYfKxGnlw9nfQwmePHVCSRdMUe6hMyVSL+cSvqoE0oiDY3MOvUsg/G5GF0usJy
         KG6weGhspB0lfvvk1lRqaP8JHr8CLryGjSvZ6QZoW1fj1FkMfaGvdeEQtHE5MG1Pq506
         fr2w==
X-Gm-Message-State: ABy/qLbT/SA4hDlnoX95FqdGi7Cq8cJiH5dEr9z4siA7m8BkQxzCPbJa
        c5tWhdeXRXBJ1ToVexLt1bc=
X-Google-Smtp-Source: APBJJlERoF8DBHU9+zebZYkFfAIEOeM8AYTpjEMG1v4zWHGfF23Sc2xHVI4t/edgPGQm7bIMgtjgwg==
X-Received: by 2002:aa7:ca59:0:b0:522:2711:871 with SMTP id j25-20020aa7ca59000000b0052227110871mr1898683edt.1.1690388870053;
        Wed, 26 Jul 2023 09:27:50 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id w22-20020a056402071600b005221b918e33sm6146730edx.22.2023.07.26.09.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 09:27:49 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/7] dt-bindings: arm: tegra: pmc: Remove useless boilerplate descriptions
Date:   Wed, 26 Jul 2023 18:27:39 +0200
Message-ID: <20230726162744.2113008-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726162744.2113008-1-thierry.reding@gmail.com>
References: <20230726162744.2113008-1-thierry.reding@gmail.com>
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

