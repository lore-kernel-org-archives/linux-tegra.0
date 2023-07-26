Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F626C04FDF
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jul 2023 16:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbjGZQ2E (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jul 2023 12:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbjGZQ1y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jul 2023 12:27:54 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE8E26AE;
        Wed, 26 Jul 2023 09:27:52 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99b9421aaebso525244566b.2;
        Wed, 26 Jul 2023 09:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690388871; x=1690993671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRDa+hXtdMdC6ZYOUEjHUlfDPteWrj1xebQwjE7g54o=;
        b=FLj4+F81aNZHX0YoxEp2mF+uBHA5gMb9p5MqM6f12i14QAuHOcN2R8pTw/eSuB71u3
         LpHCHBxiUmT4mYOMnWZT4wTQohf7bMPFrBV5CnElUsspZ1y1qdPw+fcMd1902nJThenD
         L7rX6htJFZ6XS61YqjIR7bs+sF0n1FrjKmrBOi9HMxKHEfJ7M1tACJW091WedrMriQlE
         vZDJODOG8yutkFXQUJvYeQ0ZC7+uK+Ku/Q54lK0jIDkp9RtkulRTKWbbtAQdPrInNkHf
         qyjYsE/3wNZ0IHpTrtljRKMQ0JpweCz81fbPTDmoukO174bu7JvsjFTMnm7SY+tYo+Fb
         cMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690388871; x=1690993671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRDa+hXtdMdC6ZYOUEjHUlfDPteWrj1xebQwjE7g54o=;
        b=Z2rTMl+ob7YFuN+YZvJSlqEgm/zz29EzhkEUGjrAxrYRXbwnVUMJwKGVTg2Nq9gaeW
         ipWg8Oe2LFZju6PyhPRNWmotpJ6/AMBaqytsK4lRhsLMTl7x0B0U2QzY/CjSd1R1dEaH
         2Ki3sEVBcPwWUav/glpx8iiwrDJXZ4YAdbUU00f5NgRB332mf49NpybmE9H4m7Ifv45c
         Kwz1VR/zI+AfVaOrcUe27Ask2f6D43XBJfD6nFLi4dN7jG+oIMw6HQ9dR6It6cxdGCh1
         hxtRL0+2Uba9kDIiuxlJfbIHx79fs8nKHtYbduMuNqYSzfM34k3O/ScDtZLgTEyO/mGZ
         9urQ==
X-Gm-Message-State: ABy/qLYVKFTqp7GJz9wgcKzDzhPFkMGsFPLE+r7F3pqXds72knEWolqP
        mzA37ophA8fNh+q6aZg648E=
X-Google-Smtp-Source: APBJJlEUh3KU5LH9y4EFPMSZ1xHsmeKWZfXDXyc/XJJg8W+/BzKkIAUuA40vhX0FBW2ykgaYCfW1Mg==
X-Received: by 2002:a17:906:7698:b0:994:577:f9dd with SMTP id o24-20020a170906769800b009940577f9ddmr2032836ejm.9.1690388870981;
        Wed, 26 Jul 2023 09:27:50 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n10-20020a170906164a00b00977cad140a8sm9766474ejd.218.2023.07.26.09.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 09:27:50 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 3/7] dt-bindings: arm: tegra: pmc: Move additionalProperties
Date:   Wed, 26 Jul 2023 18:27:40 +0200
Message-ID: <20230726162744.2113008-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726162744.2113008-1-thierry.reding@gmail.com>
References: <20230726162744.2113008-1-thierry.reding@gmail.com>
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

