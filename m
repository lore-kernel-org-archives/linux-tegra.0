Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FAFBC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B5B1613A3
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235974AbhKSOmL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 09:42:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbhKSOmL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 09:42:11 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0ACC061748;
        Fri, 19 Nov 2021 06:39:09 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id b12so18529960wrh.4;
        Fri, 19 Nov 2021 06:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jQt3bGvPXR3AJH0Wpc4Hw/qwqDdumuScQ+nidDp9608=;
        b=kJdlkr7/0xGuBZqPdpB6AUoLVwI1+5hmjBWwFpwYuKCmZyAzOGNSqSnjk96I+S9PZJ
         ip0FX0OUAJEyYH5e6le1mzSba4jz+kLefESPgqVhy1iy2/lrPU7Z+nOnKqugxoy/FbcS
         mMrhku/2UCQWbwTD06kXcy0jsUwUvvw2IL73XOtOK+msryL+piBayoBqk4fjxRATv39P
         S3JVwFpJSC93IwACRL4c1sWzDBZesaZ0zuYxHaJ21cNVH4AN7EC9KHSgYHEkekrfSR75
         Mg/N9b4qtplmRYJ+6p13ar61ytmzfnfsAYoFKApd0yC6tF7CTkKsG0p91pUYSahcVwg3
         3vEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jQt3bGvPXR3AJH0Wpc4Hw/qwqDdumuScQ+nidDp9608=;
        b=EySjo7gEPzt8GswwQM7FHBNNkNxmcLqiqpEW2ZauhrmK8gsqHQN55ps+5rYirVuOai
         wiaQEuHfAhp0b08LvhPc2L4sZHZX/GJo8rMl3VEKNYpdlICYINnC1r2fnCRVfwXE6/99
         uI87YL17hkN1jeeupMxlrM4/R2rO8hTRAkoWSA7eRGQQtvZsfZvs8qTFN2pKbw97fJJs
         LclKkFpBKwHPXpzh1T+SMvUyl7f5IT4/v+lWAwJ+K5DbNTrN1K0fo/Sj+rM5+Ju+gsfX
         RKjWX135JeFbYk+TvimwGCpvVnKoJHRir3biLkSrGGrc7LikAnIeJChJndTpJ8GmG0T9
         kgSA==
X-Gm-Message-State: AOAM5329jjYZaZftwJFcqhb1rmrf495JHRlg/UXKjDDMd81xnbBi6vjT
        Us5Q9LN9PX9ThJRnDIj4EgXXCwyTjFLvgw==
X-Google-Smtp-Source: ABdhPJyV02yiQs9fkib5ZsBclMYwhGNrHe9lu0/MEjKpSnSjn9Pa1VVgpWMKEZt+RA+GrqsVgC5OTQ==
X-Received: by 2002:adf:d20e:: with SMTP id j14mr7904920wrh.220.1637332748044;
        Fri, 19 Nov 2021 06:39:08 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id h2sm2999388wrz.23.2021.11.19.06.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 06:39:07 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 09/16] dt-bindings: mmc: tegra: Document Tegra234 SDHCI
Date:   Fri, 19 Nov 2021 15:38:32 +0100
Message-Id: <20211119143839.1950739-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119143839.1950739-1-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the compatible string for the SDHCI block found on the Tegra234 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
index 1c3b9bbea6b4..a361896323d0 100644
--- a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
@@ -33,6 +33,12 @@ properties:
           - const: nvidia,tegra132-sdhci
           - const: nvidia,tegra124-sdhci
 
+      - items:
+          - enum:
+              - nvidia,tegra194-sdhci
+              - nvidia,tegra234-sdhci
+          - const: nvidia,tegra186-sdhci
+
   reg:
     maxItems: 1
 
-- 
2.33.1

