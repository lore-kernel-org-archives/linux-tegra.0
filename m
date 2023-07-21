Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A08C04FE0
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 13:58:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjGUN6h (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 09:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231435AbjGUN6d (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 09:58:33 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4EE2D7B;
        Fri, 21 Jul 2023 06:58:09 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-98df3dea907so306416766b.3;
        Fri, 21 Jul 2023 06:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689947887; x=1690552687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9QzZNbbrymcGuQ98ayrqzTSqxAz1iUWuJh/S6uzquo=;
        b=LcA7ZG9MQHTBBWjbwDlzTNZTh0nRFLKcXNBgAasNidXHnugBJ3etSHzYzjkxBZg+Zh
         CkFNukd/B8OW+2qrXNsu1DSuw4XX2yRYGvzeQT8NpZn8/Jw1hTiyVPI5pPRvzIzd9uXu
         QOdTdGEA412nlyj27E87HY3p/B1jDbStZLEE8bhhkqK7X2OdMEmZZSt11CxH09X/JRki
         ktSzMrGukbEGH64aTEZ3rFq0vHTtG6X4QRl9Orrv7bXGyHuFdDhD3L7HEg7EyztWWeXA
         MrSn+ey9fh8BHhJJF2QoYwGWEtczqpsm9VhJB0ommKZ01fEuLqmGbOJw63yOr+QzIegT
         K2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689947887; x=1690552687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9QzZNbbrymcGuQ98ayrqzTSqxAz1iUWuJh/S6uzquo=;
        b=G/5m+SMcg7SWkWoA4GjFWABTwXLdGdNNiCXU5Xkz+8hFlqAgu0XToAE11GY0Iq38eF
         D2ce+wBHWuYR3GbFNyl/iEzBR049zZMmKDbslXG0lcKN+wOmCWAlKAG4HmdArHcEnf7L
         6v1wzOSm2Ay7kQoWrKU1pV0lWdRRsKR4ajeWO8qgt/f97+DL08Mn9n/Luukq+lH3kflD
         T2oxF5Dhh+lFGrsgFm5TXkcDwSbiwwy6C4n8dDII4vAnA0zBSBHpjrxBcj19EwVckviv
         esbgL6yYnlj1dBEZZhHp6WTKUygM6nv7YJr5OkvVlzf6PglxLVQDnPeN2Zi62rbAYutr
         If+g==
X-Gm-Message-State: ABy/qLYZAx4vhCOl2ROVppiCG3inY6ZpAMN8M61A/UTDwyC8e6vg6y2P
        aS3VxgFythHoYLH+S4tEMiA=
X-Google-Smtp-Source: APBJJlHQNtGfTWy1kkifDxB6j1cLENCYkT8jLsIRKJji94y6OhWvXI/9hXB0IFaPaY5ivDUjdYoGQA==
X-Received: by 2002:a17:906:10ca:b0:992:16bb:2b6e with SMTP id v10-20020a17090610ca00b0099216bb2b6emr1679445ejv.29.1689947887254;
        Fri, 21 Jul 2023 06:58:07 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id lg23-20020a170906f89700b0098733a40bb7sm2221507ejb.155.2023.07.21.06.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 06:58:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 7/7] dt-bindings: arm: tegra: pmc: Relicense and move into soc/tegra directory
Date:   Fri, 21 Jul 2023 15:57:59 +0200
Message-ID: <20230721135759.2994770-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721135759.2994770-1-thierry.reding@gmail.com>
References: <20230721135759.2994770-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Dual-license this binding for consistency with other Tegra bindings and
move it into the soc/tegra directory.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add Reviewed-by: from Rob

 .../bindings/{arm => soc}/tegra/nvidia,tegra20-pmc.yaml       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/{arm => soc}/tegra/nvidia,tegra20-pmc.yaml (99%)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
rename to Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
index 67d69926f756..a2b8d59026ee 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
@@ -1,7 +1,7 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20-pmc.yaml#
+$id: http://devicetree.org/schemas/soc/tegra/nvidia,tegra20-pmc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Tegra Power Management Controller (PMC)
-- 
2.41.0

