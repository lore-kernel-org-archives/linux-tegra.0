Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A84DC43217
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 18:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbiKQSkt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 13:40:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235064AbiKQSks (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 13:40:48 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E107F7FF1B;
        Thu, 17 Nov 2022 10:40:47 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id n21so7270442ejb.9;
        Thu, 17 Nov 2022 10:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1Y534FPxsILKuYr941GBaBsx9fst1FUuLv6sIi19Vk=;
        b=VkGk+0U6cBBKtd2N73D6xUj20mWTYj9z2tO2H7ULxskuzctUAZqtq+JcJL2RtdlPsC
         lQ0ap0XqRcig/75B4gx/g7uWtUYLJbrMMa5+nJXa6AjOpVz1A1RDtSrEMRkKTP2KocYZ
         qhxM1BlzZuIjImn045YYAj7aTqzJ2KnQuGyhMx8UZxzLEP33xjzJP6Y7E8Mh5093BEMN
         dzYtBOd4EGkOgMofNN9JyHuBhAMVNgRJ523p57BbfezDEwibZxv7WvVc21VgMEFIXUyG
         HJj9KrknPq/JG0NRRhbJgG8rRKu5lOyFP3GfGaKI0uHa1fdZQHdtaAin1901+luOjktW
         4H2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1Y534FPxsILKuYr941GBaBsx9fst1FUuLv6sIi19Vk=;
        b=ZbHitENNlOmkIXof7e9a3oUQ0DwYMX1WPqDy3NfGQZrWCeeO2ZHYiH2EIx31aCoYFW
         kKnS0W5UnnGGYQi9r2fBHMF5zkMae1TE4vZ4E5CP3oiDQ5Nu47dcB7SXZfxIlvMp+g25
         aGb7VppJWvyapJCimHixg+N1B+M//vjXK0sO2GjUv7oFZeeiD/rMuHsGDMvPJQp9IED7
         HVn6LmHAYxEjzM/k+kznQbyGxrAn1ZdoFt+kSA52nxTpGecoP8qrrY+wCZFxQIYAevvV
         E46izSXCB6d4XHPGySRZu5DjpCJr73iogFAG9sRnsPhaKAqW6ZY6EkbzJgoEBpNnl7PK
         lTKA==
X-Gm-Message-State: ANoB5pm7XsqgGjLUT+v2zZe7zeyVne3lJDZXmno2m58nz9o46i6Iqekj
        KSQvv4Ouf3p3WHnL0MWbbtQ=
X-Google-Smtp-Source: AA0mqf4gUTPwjVT7ASJewg8oNP3zMRDM6ATE7vRgNDo94NVRs0c0OcvNjf3/6CDgJqmkO5mUA7OA2w==
X-Received: by 2002:a17:907:98ea:b0:7ae:c1af:89af with SMTP id ke10-20020a17090798ea00b007aec1af89afmr3133088ejc.550.1668710446390;
        Thu, 17 Nov 2022 10:40:46 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p9-20020a170906604900b007b2a58e31dasm700772ejj.145.2022.11.17.10.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:40:45 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/8] dt-bindings: display: simple-framebuffer: Support system memory framebuffers
Date:   Thu, 17 Nov 2022 19:40:32 +0100
Message-Id: <20221117184039.2291937-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117184039.2291937-1-thierry.reding@gmail.com>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to support framebuffers residing in system memory, allow the
memory-region property to override the framebuffer memory specification
in the "reg" property.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index dd64f70b5014..3e9857eb002e 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -63,6 +63,11 @@ properties:
   reg:
     description: Location and size of the framebuffer memory
 
+  memory-region:
+    maxItems: 1
+    description: Phandle to a node describing the memory to be used for the
+      framebuffer. If present, overrides the "reg" property (if one exists).
+
   clocks:
     description: List of clocks used by the framebuffer.
 
-- 
2.38.1

