Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F0DC74A5B
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Mar 2023 15:07:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbjC2PHX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Mar 2023 11:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjC2PHW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Mar 2023 11:07:22 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D9735B7;
        Wed, 29 Mar 2023 08:07:17 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id b20so64678335edd.1;
        Wed, 29 Mar 2023 08:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680102436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urzvodPCAGhfqi2EGiuZIZ1TFiaE63Fj1P+4W8yWfH0=;
        b=BVgP6rm8w4s7YwaUxETfy06Z70rwJtlhSAN63afhCWK0MGSl0Un7qF7vDEcv9cC8Lu
         AzvBYlTOS6sdhEcWl5l9+23NmOO9EivxMfEiGeuDKP4uBXjtznFNSCW65Xf/Ln03i1iI
         2dLnp41PgnW7s5ETRv1wW2eVnEXrmGTRSntT4IDLDLjLMfOkrJ+9AAyILgQ5uI56q6Xr
         2MTp27y8TGSi38CBwoaawUYpLs63B0CQHw9ZFDWeN2q3w0uIGk2k0hJB99kczklkRXvw
         4xS2i5EDp6fNp40/AyDyevJN07G+ldYdMV8a6BOz1NqcsifHliNTMCs4YUEEX5UJR/Uj
         9BRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680102436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urzvodPCAGhfqi2EGiuZIZ1TFiaE63Fj1P+4W8yWfH0=;
        b=vckFnZ+yER9Hra0QmlcoAsBwmyJ4p/eVUyfZawwmAHHYsGOt9ysaUr5NtmhUjcVWAM
         wLlTiEiCsDespJMqDT9r5yQhP0/CVzesvvKDlQoz4Fslc6xm/UHQzCuFLCQl2TFX0sL2
         /t7xj0qDBR435hm4Iz1IYiUlioU6aaALpZYO2z3ppbUsVGGoAvcb6KpXkssexKNCEiTk
         dHYVxTkqbQom7Qma9OFDZmiNK0WFJLcKoMDWKu+waoHluzt4NdsGjpNa8zjFDXH7yQKz
         whK76X/b5SY9b5IKBLQsr5iT7wg+ZGVHaCQbVKj3SyiOt6Ivwc0Yf87PrdeVoSDVD8NB
         W7xA==
X-Gm-Message-State: AAQBX9cFUOtI1ENIq0HCJYd0ffRffgAGYGpBv2AO4NfFTY7SUEgQUS9y
        gQ3S9dTL0e6gQaGMplehN7M=
X-Google-Smtp-Source: AKy350bzcLeDJRyj3EN5E96/6HGU6AakMYtGGCS7Cx4i2tyCnQRYAMqCe11gcOrfM4+8X/Xzf+04tQ==
X-Received: by 2002:a17:907:77d3:b0:92b:f019:d5eb with SMTP id kz19-20020a17090777d300b0092bf019d5ebmr18846498ejc.44.1680102435738;
        Wed, 29 Mar 2023 08:07:15 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p23-20020a1709066a9700b008d53ea69227sm16540890ejr.224.2023.03.29.08.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:07:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: tegra: Document Jetson Orin NX
Date:   Wed, 29 Mar 2023 17:07:07 +0200
Message-Id: <20230329150710.773441-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230329150710.773441-1-thierry.reding@gmail.com>
References: <20230329150710.773441-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Jetson Orin NX is the latest iteration in the NX family of Jetson
products. Document the compatible strings used for these devices.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 1f62253f9410..c1a62eb1b925 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -167,5 +167,9 @@ properties:
           - const: nvidia,p3737-0000+p3701-0000
           - const: nvidia,p3701-0000
           - const: nvidia,tegra234
+      - description: Jetson Orin NX
+        items:
+          - const: nvidia,p3767-0000
+          - const: nvidia,tegra234
 
 additionalProperties: true
-- 
2.40.0

