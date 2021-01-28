Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0C0C433E6
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 18:32:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1253A64E20
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 18:32:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhA1Sc2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Jan 2021 13:32:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232168AbhA1Sa1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Jan 2021 13:30:27 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA37C061574;
        Thu, 28 Jan 2021 10:29:46 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id u14so5352867wmq.4;
        Thu, 28 Jan 2021 10:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=New2v2T3Uy5ybbNiA0IfE0qGrUAXUx9CUscR4MiRx4g=;
        b=negjh9Y0yWRG+F8PtiY7LtzqzO8MgXwRiT2wJeq/+PY8wei8/Eu1rcOubDi34QeCxK
         G2hBmRESsB8OTwvVF1gwjfPHHJr78ZBcBk9vmnnqCO5DUFxOHdhmq2yXqjhV0FOE1/hx
         l+/BT56aDY6rNpMxVPrE7sMbxArAKcuUrBp9puGYe3CYQFtX5zNfOLo7EGXKQ8Vrj949
         nu+pldclWd0QswZdh4YUcBixu5fE/6GheG2E8yKlDd+8owwy0DspmPl2JfBbMPElzr81
         TVwGVc/xrPU78wxrYQrdzxD75fPXyZdIn+EGrWruzS7DUmPu75PFMkjXAi4i6J5PhmUp
         e8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=New2v2T3Uy5ybbNiA0IfE0qGrUAXUx9CUscR4MiRx4g=;
        b=gPOiTA11bcY0+/Ksc9OeADhDr+yA5Gl2daoejmvTYejEAyPV1v0CBkmLbGoX6e4SAk
         Cmni0bwuWu1+rwuBD32omAGHPjXIIhr11axwDgITt+56mq5V1BJntINYIG09rN2jXzii
         MGu/z1RqDTesBSySZ1txBTT+cFTnk6gJ23dxW8zouT8ReXeYpM81ZR8ogyb3CsXJVkx/
         NchqZ2bMIYQQftO7pAYWUpHxmkLpDzXvAB4KjI91r4kw1gD2BGq7xH6YVxY8mi3HKDCC
         th661jwf+su0IUJQ8ARh/5SbGA/VQSrpkb9y91cZpw6TL1OMTDC0gt4hqYMiRMbmmVUu
         LXoQ==
X-Gm-Message-State: AOAM533tkVXIwja/QFT7dynRSrTm7x4+gA0wzl0hgErKsdDbSZvYeAJt
        tHil02CEW+sy3n5kTL+JGGo=
X-Google-Smtp-Source: ABdhPJwZibqCZKaj7K/3nQ4liF9/wo4NQ9rg4TBgRonsnAJEDzFD9xtzlBImh6C7jPIbjHU4pKdMtA==
X-Received: by 2002:a1c:e2d7:: with SMTP id z206mr540274wmg.168.1611858585368;
        Thu, 28 Jan 2021 10:29:45 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a16sm7549538wrr.89.2021.01.28.10.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 10:29:44 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: tegra: Document Jetson Xavier NX eMMC SKU
Date:   Thu, 28 Jan 2021 19:29:40 +0100
Message-Id: <20210128182940.11845-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Two different SKUs exist for the Jetson Xavier NX module, so document
the compatible strings for both, as well as the developer kits that come
with each of the SKUs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index c5fbf869aa93..b9f75e20fef5 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -120,10 +120,18 @@ properties:
         items:
           - const: nvidia,p3668-0000
           - const: nvidia,tegra194
+      - description: Jetson Xavier NX (eMMC)
+        items:
+          - const: nvidia,p3668-0001
+          - const: nvidia,tegra194
       - description: Jetson Xavier NX Developer Kit
         items:
           - const: nvidia,p3509-0000+p3668-0000
           - const: nvidia,tegra194
+      - description: Jetson Xavier NX Developer Kit (eMMC)
+        items:
+          - const: nvidia,p3509-0000+p3668-0001
+          - const: nvidia,tegra194
       - items:
           - enum:
               - nvidia,tegra234-vdk
-- 
2.30.0

