Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDF3C001E0
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Jul 2023 13:17:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbjGGNR0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Jul 2023 09:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbjGGNRY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 09:17:24 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3461FC9;
        Fri,  7 Jul 2023 06:17:22 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso20426775e9.3;
        Fri, 07 Jul 2023 06:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688735841; x=1691327841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ck6fwpfDkUHjqvfaLifjQqp/JbwbuNDqeDY5YxFVtno=;
        b=Hr7dr6H8CgN04ZCDpXvkJtdNI67ekD5iDH65Zp+JrZKoIxrNgz1y/H14NYlKHaqenP
         gSqelmD9Vtk68qLJQz5luTq+V0FL3CCq7qg8jsRHYqgu2ELa5vFhqWg84XD7HTHuStab
         FxBXw27vGrkYdOZJL85uolv5OM3okJe/OQRfmn4vmRwd6VR28XR7U+4T63MZe3+CXman
         kSwLh+7+XgoUohLDMBj/jlVamyT4st5ZaVPGGaf9VwNhhvbSMEjKweRhy9V1+NNoIC67
         yr1gnN5Kdl3ZnnZfajkmRj0ocjLfrsOR87m2iZHIzSTQxcgNR5WK5KN0OTepCp3/iK4w
         jxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688735841; x=1691327841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ck6fwpfDkUHjqvfaLifjQqp/JbwbuNDqeDY5YxFVtno=;
        b=iorx/ZrRZRaWVfEUhVJq+5+Z35y37jrr9DIm22RJZpchPm+UhNGv09GuAWNXY1+V91
         0FTj99+2+enlnDESmFW7TOUgdoH2wrz2bSc+ixpdr8E4bJ5Es9bVRWp49/5rqYe9dDzY
         BVDJxgOElYXdU+VWpDBnJftTRyeKUhC6eYe5gatm61uuzaw7doZTPB9OJX4BKoKrkYqD
         giQKiQNi9HCzvHqpfSuf/8zPjgsfiRhwyU8sBICbM5SzabQzn67L8bsOvdaY2/idazVd
         NYAVE/LsTdJB3TOUjUL8TrgsQCSzWlNs2CmVEtkGuVrKsVJQhIDPEV+P2bW5YYgYzANp
         NbZQ==
X-Gm-Message-State: ABy/qLZW1SYmsdTOxE6oxOutw712obIStiGHUt6evqQOCBgVAl0/p+cy
        r8ujd3S7jrJmPcIYMt75nqU=
X-Google-Smtp-Source: APBJJlHWjUWB5rq0ypMUZGTx/eAJvRL1aGSAM4KiDATeZyMRJR/LpcmhvyVwBzQ92jaa0fkF2qucSg==
X-Received: by 2002:a05:600c:c8:b0:3fb:ce46:c0b3 with SMTP id u8-20020a05600c00c800b003fbce46c0b3mr4474728wmm.35.1688735841015;
        Fri, 07 Jul 2023 06:17:21 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l11-20020a5d668b000000b003063db8f45bsm4444818wru.23.2023.07.07.06.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 06:17:20 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 7/7] dt-bindings: arm: tegra: pmc: Relicense and move into soc/tegra directory
Date:   Fri,  7 Jul 2023 15:17:11 +0200
Message-ID: <20230707131711.2997956-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707131711.2997956-1-thierry.reding@gmail.com>
References: <20230707131711.2997956-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Dual-license this binding for consistency with other Tegra bindings and
move it into the soc/tegra directory.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/{arm => soc}/tegra/nvidia,tegra20-pmc.yaml       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/{arm => soc}/tegra/nvidia,tegra20-pmc.yaml (99%)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
rename to Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
index f709a4a0853c..ef42f07e0572 100644
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

