Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB40EB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 13:13:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjGUNNd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 09:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbjGUNNb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 09:13:31 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F9F30DB;
        Fri, 21 Jul 2023 06:13:26 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-993a37b79e2so302938366b.1;
        Fri, 21 Jul 2023 06:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689945204; x=1690550004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1ygg2Jn0dhD6FjKNZtwLf4GFouySs0VxaChZ+hIHFI=;
        b=A8ce8Wv1hqz+dhMozEqVKU3Q5gbwjy3MoJ9HNcCltj8vUbqCuhdM5PHBhei1FNfqzF
         6dudhjS0CtKUD4n+OmMkNndQlnrKniYVtKIVZEIAehPshPyseLsGlEu7RLScnesKSxqA
         OXx+WMw4iglP6u14nArJgOI9NP3N/cJROWV1C/u73O1g3mN4Swn3fRG8g3zSEh/HDgcg
         EBQlwWR5KMRQwTH/viVJeu4dSpg0cunXegVwbT3JN9gBqayaxk0glSSGgPeOJAJ076ek
         8veNfICJ0etF/vaIzhVGVGt8s/2SBDDOJY2anx/WRxuJFyFaU47fvV/8+xKNKjtZRh4B
         IYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689945204; x=1690550004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1ygg2Jn0dhD6FjKNZtwLf4GFouySs0VxaChZ+hIHFI=;
        b=Y36RKXbORC18H3s6qyaIMTYL9nx27ahsRzQBlWYlvywwW7DbiDQ1BSVXOwgOLsHgLq
         UUb5DTYwtHAXNfwAZvcndlP7gu7AuYO6TEW1KuYsLSmXnTllITSX33zCQ0hPNVYc+vNQ
         iN3TdA3tXuBihb+1hWuxfTk6q+jRqUH7sMNbGp5qG5HRgRoS7g+BivXzEC1a2l2hM440
         JpYVFdMeUAcEIs4U2SWdbI6Mw/zyWe/sS9QhS38T5zk+PoeoYZ6RYW83HUu7EqG5lIsU
         Oj1cBUTmw9xCr2QLPzSMZbic2sGWsMTN0qX9iyCt8O5xrb4u4xj9+Y0VWdXcxrhu3QeZ
         YhTA==
X-Gm-Message-State: ABy/qLYanVAfnThrk97vAwT3FuTKMqOlzcpllj+7KJEzkYfSIINcWDK4
        q5di0vzlWcu8NOEchKotA78=
X-Google-Smtp-Source: APBJJlHAtsOTOWgZFH3Pd4W1FZW8zutVblaO2WWAjSmBrQKyzTvNO4p3eMK3Hoxgutnv80gvTh6L/g==
X-Received: by 2002:a17:906:7386:b0:99a:8053:158 with SMTP id f6-20020a170906738600b0099a80530158mr1691434ejl.68.1689945204493;
        Fri, 21 Jul 2023 06:13:24 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id jx16-20020a170906ca5000b00993664a9987sm2167822ejb.103.2023.07.21.06.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 06:13:23 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: clock: tegra: Document Tegra132 compatible
Date:   Fri, 21 Jul 2023 15:13:22 +0200
Message-ID: <20230721131322.2991364-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721131322.2991364-1-thierry.reding@gmail.com>
References: <20230721131322.2991364-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra132 clock and reset controller is largely compatible with the
version found on Tegra124 but it does have slight differences in what
clocks it exposes, so a separate compatible string is needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/clock/nvidia,tegra124-car.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
index 0fc55f441ac3..2d7736a10178 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
@@ -27,7 +27,9 @@ description: |
 
 properties:
   compatible:
-    const: nvidia,tegra124-car
+    enum:
+      - nvidia,tegra124-car
+      - nvidia,tegra132-car
 
   reg:
     maxItems: 1
-- 
2.41.0

