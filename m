Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB236C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:19:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A139F61075
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:19:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232462AbhKLNWA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:22:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232441AbhKLNV7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:21:59 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9F0C061766;
        Fri, 12 Nov 2021 05:19:08 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id r8so15414271wra.7;
        Fri, 12 Nov 2021 05:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gLhHuijXe+H5LtYE+wBBv82IIP962ldle2J6G2t95FE=;
        b=oD2u//cTeWXK3eU2723hZc/csyc98wE5Y8zi2wDs4Xq4qjeKnqbdRKMzYBfiy8ShKR
         N0jhOH5QG5GYlsIgR1SVkDAbyVhYckkl1kWTeUkfiCBaGg2uXN1cD3dYRK0J1KAGv9Ah
         donQKRhzBu8ZJWhEcgcm9qTSCL9z5GSYm+VjxECPVziL9KtE3aMHX7MRO2aT1583xtFn
         SRhxtGFpX5d0XVyLSjbQio9i9wvRl2lgX79cmEfpbrDM8fnyuoHdl1zkoPr1oPchhxki
         VXhQhldPHVxKpjwZ5A8b632NBeoyHR4fvGZsIKZzN9wYPxvwo1uzhIgT38cNrqh+w4b7
         zacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gLhHuijXe+H5LtYE+wBBv82IIP962ldle2J6G2t95FE=;
        b=WCC28F4jJqcUM4NedrtImdjY9ADMGj1hVwD6pK2+qt/vHYaMJ8cTfjmw0x71VkJHuG
         FiMRY+VbpIShQAv9G1nI+RG0k+94uk3B7S4JdWXKDBt48TltRK538vg4Y862KF115uKl
         POQy8SlUxzo7y6d4o5+pyzz5Bcw/H2sPKQGM+72lF7toXDSrnl7nEaXrC22h0acOCniv
         N4dnTW/A8Vo0eOi5Vi6GkncjUkaLspNFfkr6Th++2VeOGcj45x7dwFHtrcRUWVEsM2ZS
         Kq8eeZC7O9WWczaHBO8Bkk034gPjfqucE1sero8SLNOhDdg1cWbZ1R22OiBQatCrJoUs
         15AA==
X-Gm-Message-State: AOAM531cNd0n3NO9JvTA+lQ+kZdD6xpERlylh8R/T2zxYaHFhp34Sq3x
        5eld9MnSghAIKxr4fXjxOXg=
X-Google-Smtp-Source: ABdhPJx+lXAI/GX8Hq+Xs2ivDyVJV3jKzilcsVYRGlmbPIwhKCDKM6kirERgM2w2cSECddJzqoiqZA==
X-Received: by 2002:a5d:64e7:: with SMTP id g7mr18978577wri.350.1636723147521;
        Fri, 12 Nov 2021 05:19:07 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id y6sm6190535wrh.18.2021.11.12.05.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:19:06 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: cpus: Add ARM Cortex-A78
Date:   Fri, 12 Nov 2021 14:19:03 +0100
Message-Id: <20211112131904.3683428-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The ARM Cortex-A78 CPU can be found in a number of recent SoCs such as
the NVIDIA Tegra234 (Orin).

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index f2ab6423b4af..452bfd1d4ecc 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -137,6 +137,7 @@ properties:
       - arm,cortex-a75
       - arm,cortex-a76
       - arm,cortex-a77
+      - arm,cortex-a78
       - arm,cortex-m0
       - arm,cortex-m0+
       - arm,cortex-m1
-- 
2.33.1

