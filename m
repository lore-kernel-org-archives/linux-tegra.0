Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF89AC00528
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Jul 2023 13:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbjGGNRW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Jul 2023 09:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjGGNRV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 09:17:21 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB4C1FC9;
        Fri,  7 Jul 2023 06:17:19 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-313e742a787so1616469f8f.1;
        Fri, 07 Jul 2023 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688735838; x=1691327838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v80poZORx0WdeR8eQJuJazZFWv7nv+nmLCXVZxPw2e8=;
        b=Z0y8hZhaxWaz/MLM0Pbl7KlcjLEySXdmFN5P/Bh5MS2sA8ZmPje2OjTk9OgGNGuUe+
         VFQvVZlwOVj+8n+FumVL/wrNcf4ZrdbLSZ4JOntNWH9izvwTPMkRKyaSfEN8zHP61Azm
         jCHv2U6SNVcRYigYCuVgwcKVps6eDStPIQl2/5KktOzbyHw6TOSFDvV4p+kLlD7pIUj2
         HsAQr3460lzD3cs8T00HSEFYenSPMsRhGkQcis19ftY8f8qpa1aE1Tq6ndWAFGI2s8yF
         gTm8gbAUbiL76o6ZEBtf8IxTUwHxRpkl8yRuUH0wL09e0tOL7Jv/MSqzytum6m3mOoNo
         euRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688735838; x=1691327838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v80poZORx0WdeR8eQJuJazZFWv7nv+nmLCXVZxPw2e8=;
        b=D3u6C4IZX1rhM3q3vfJbo6b82lPVIEoMs9BJRYbPYiw+/243NbfS2Du6XUFfxusLGW
         zh63c1q7JpukBetCMCwQs7p7pkTmtjm+BUCZiHiDepB9X5ASdjVOQn/NIbbofTzPuxct
         CYRKN6UmRYpDo2WVJkZ2LzCkM+EqkcRe3PRkSLabRX/sfqXJDNCn4NfndvfJ4RHTyYAe
         bLuydkOsX8GIJylKZA7E2P9qeNmTEdH4/9OphlhWlyy2szA6+geLnsVrUOZOd5QxLV5c
         IhVEePuycz8PsQZWrPBK26PML8dGIflaFhMdIhgQ4lWmM0nlysuQBW2IyXZDE8L/fqKp
         xQJQ==
X-Gm-Message-State: ABy/qLZRlPkLCyMfR5b1JCjPh62ukkOVjOKh9ohOqfwpKgIT8P68CLmN
        BIW3YwSzW85DTVqTDEPWvws=
X-Google-Smtp-Source: APBJJlFY2A0tKMZfTki1YCz40J52tl5DdfGDWDjdxw1g/GKz+X6Ewj4+BBXOj47EXtyKwF8r1lSSGw==
X-Received: by 2002:a5d:590f:0:b0:313:ed10:7f52 with SMTP id v15-20020a5d590f000000b00313ed107f52mr8196217wrd.18.1688735838269;
        Fri, 07 Jul 2023 06:17:18 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n21-20020a1c7215000000b003f91e32b1ebsm2460489wmc.17.2023.07.07.06.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 06:17:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 4/7] dt-bindings: arm: tegra: pmc: Increase maximum number of clocks per powergate
Date:   Fri,  7 Jul 2023 15:17:08 +0200
Message-ID: <20230707131711.2997956-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707131711.2997956-1-thierry.reding@gmail.com>
References: <20230707131711.2997956-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Some powergate definitions need more than 8 clocks, so bump the number
up to 10, which is the current maximum in any known device tree file.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index 1d8b99938323..82070d47ac7c 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -227,7 +227,7 @@ properties:
         properties:
           clocks:
             minItems: 1
-            maxItems: 8
+            maxItems: 10
 
           resets:
             minItems: 1
-- 
2.41.0

