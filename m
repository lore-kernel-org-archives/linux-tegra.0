Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F036C4332F
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 12:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbiJGMuB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 08:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiJGMuA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 08:50:00 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0DA1C914;
        Fri,  7 Oct 2022 05:49:55 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id nb11so11117067ejc.5;
        Fri, 07 Oct 2022 05:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1/Q7FM/6wVesragT+lLg++XOxeD1OeWXwDpmo+CaG4=;
        b=gaNnBrbV3Xpns8rk5Qd2ry9waUgicBEUDrQg2WurXif06s4ezs2estOIDdE2FEIiOA
         ObAzX3FwLvIYWmXxhhqpyItjUUQScNGn+4XGhSzOGzlYBzLlns9ejTj0T/ai0qtMrXm0
         Zs1/YqHVjQUvudyKHj8viF3OLGZ5ql6YW21PKR9A5J4+QgtG2KJt3h+W8A7N1lGQNkp1
         sHguNhGwf/DvgLRpiTo1kgkxhBwNK0FcB76BZyUHCkrVmspiVcbzteV/l1hVi2y2CO9G
         lnaJOupMuhh4zBKgdvVBPcT898mjZnGQgdSb5feisnV1/WUzlZXCsCG2XzBijUwbxr4+
         H2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1/Q7FM/6wVesragT+lLg++XOxeD1OeWXwDpmo+CaG4=;
        b=YEJKASX6HdzjR4vJM2CZ5o5gBobtfD05Ld30V6hUhSfCPpozR2GBffZJJ2MBeHt3vX
         00RibKfOtFM/3jlL9DBwLcGOYmjv7vep63E/ZNkO+e9vmoy2sqBcLY+Hd/XadBLWC+OY
         UqvbN0CGZTJVd4RRMBSskpJprkm1PuL1m04LpAx/2rRrQex+/ZmNgjfztJwqd4yUWGBq
         +KqS21UUnZfw/ms0fJsq6NPo2vFGtMrzJ2h0DYJTcoL1rpDhdWIRTxANfuXW3vJ2PT8q
         2OXGeCsBNmQuSR9nXehTZvh6A95ZqdR+vIm61Vy0Hknd+1yOm2CwIsvpMOdrJ21OGAG6
         oAXw==
X-Gm-Message-State: ACrzQf0tDFJtrjDtgW1ItTw33T5w3u0HGnqx2sKRA2QWRbLTt6h2l2YS
        lDuroEvIRP4ixZrMlUSHQ90=
X-Google-Smtp-Source: AMsMyM6j/Lz5Ph/6n8cFQ5VxJzYs0uHKqNXN6rVCej8vqUFmcXN0/IqXNi/OGIs9ykHYRMPeWm5aJg==
X-Received: by 2002:a17:906:5d11:b0:787:807e:5b8a with SMTP id g17-20020a1709065d1100b00787807e5b8amr3895992ejt.559.1665146993991;
        Fri, 07 Oct 2022 05:49:53 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id w22-20020a1709067c9600b007812ba2a360sm1186786ejo.149.2022.10.07.05.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 05:49:53 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: display: simple-framebuffer: Support system memory framebuffers
Date:   Fri,  7 Oct 2022 14:49:40 +0200
Message-Id: <20221007124946.406808-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007124946.406808-1-thierry.reding@gmail.com>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to support framebuffers residing in system memory, allow the
memory-region property to override the framebuffer memory specification
in the "reg" property.

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
2.37.3

