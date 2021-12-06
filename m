Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805E6C433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  6 Dec 2021 16:09:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356318AbhLFQMb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 6 Dec 2021 11:12:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243949AbhLFQId (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Dec 2021 11:08:33 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 779D8C0A88A9;
        Mon,  6 Dec 2021 07:46:27 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o29so8516466wms.2;
        Mon, 06 Dec 2021 07:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I6tp7FFhJACS8QWvJrV4J18ejcDzbxbLkmoezmrRFt0=;
        b=n13ximXnQOahmYmejBNmkPry0M6Eu5jpASd0nFbE5KkDYPs+PyPs9Rd3F4EE/HK4/x
         Gn8/dTpYxJxysQUcvLBAu45VgnBj0i5MnUeQkr4QVrHKctk/xbjMs2uSE0Y1muCxzy/Q
         QU76UolzAf7d7VrYYnwcgA8MEV9ynf2vskedehauqWKaUjZLjrgsHczwPmuFP+S+gkth
         380Ps6S9TmBU9nCfw5TyhFmzUizeBFbfc69fD0+RDDRzTz/4smsQj4lJLaOLQJN9qyPQ
         OIQA0NpcRVDls3Qq/S6WIJEymLuiqYKYMH4vGZ4ZU6DHUBpaQu6SbWE3D/eC1GI5wznZ
         ANlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I6tp7FFhJACS8QWvJrV4J18ejcDzbxbLkmoezmrRFt0=;
        b=8CxpQll8IK+RLf6nlxSDVJp+RVS/Xx8F3vpXigu2+nEwFQT86WPKOhR/ZTXH/gN+RM
         b4u0Oq7LjbdWnfnO/nkNs7z8nQZY8OGEZ3lJlAY7Icnm9Ij8Drv719hKPkJ6pQdVKqgb
         HSgge2POeYyc6GvdeVNSjRZm2BSUqJt1vFXD40rzzym6vh/IISE/l0jGpsDX0f2F1hjx
         gjV4qGPJ1r74shNsJMumhjisBvzB34VyYid53+16HOG1d6mDyn63WsdKvTtUfUqjw67Z
         Qvkqr0SqgxQsUij8BvyR47aKRWqOi0IGH+BLPTplAothlqXXb/rgYV4XojDgrls2xvts
         nj4g==
X-Gm-Message-State: AOAM531BOGoD/4rWIvMDd1q8G0rFvSDfkiZFCTlUqy4ggYKLihGo7/Pu
        jVwF/DmbEYRUZx0L1mJZwMc2e7mkUk8=
X-Google-Smtp-Source: ABdhPJyekBe6dnXPs6YOJehgDST53pxv0RT0H/3MI6ngt8Cji7hflRixjLv1vGzfGSLx/T0I4wYVNQ==
X-Received: by 2002:a05:600c:4f55:: with SMTP id m21mr40236724wmq.68.1638805586114;
        Mon, 06 Dec 2021 07:46:26 -0800 (PST)
Received: from localhost (pd9e51d39.dip0.t-ipconnect.de. [217.229.29.57])
        by smtp.gmail.com with ESMTPSA id j40sm13799400wms.19.2021.12.06.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 07:46:25 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Sameer Pujar <spujar@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: tegra: Document interconnects property
Date:   Mon,  6 Dec 2021 16:46:24 +0100
Message-Id: <20211206154624.229018-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the interconnects and interconnect-names properties to the bindings
for the sound card on various NVIDIA Tegra based boards. These are used
to describe the device's memory paths to and from memory.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/sound/nvidia,tegra-audio-graph-card.yaml  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
index 5bdd30a8a404..b4bee466d67a 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
@@ -44,6 +44,16 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    items:
+      - description: APE read memory client
+      - description: APE write memory client
+
+  interconnect-names:
+    items:
+      - const: dma-mem # read
+      - const: write
+
   iommus:
     maxItems: 1
 
-- 
2.33.1

