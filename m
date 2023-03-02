Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88B5C7EE30
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Mar 2023 09:34:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjCBJeB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Mar 2023 04:34:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjCBJeA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Mar 2023 04:34:00 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B67BA1515D;
        Thu,  2 Mar 2023 01:33:59 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id g3so9565202eda.1;
        Thu, 02 Mar 2023 01:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677749638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gljsncSazEBidrD5SMWZ+vpM35ok5DGJL+jTv+84I8=;
        b=AyJJBhuxms+sTAfhOqaP/czHtGKtFZ4naopBeyoLB55PzJvZP+znndHtScsgjHMvsK
         X2H+ND2QQUNYr6gMANLyKt2KAnkqtQKuIbXbEfokglJ6o3Q7XQK7ptHovzx3Cpj6/QFP
         b0tGhF0YHRyDjmNARdktno+M5XLcr+n/PB98eDjeShMSqOVfF/9iVIGtI51JSG+jc82f
         +ZH7RFfRR0CEAEe8bVuDdNCF8rRW19oK7wGn0Uw3RdaScSON2i2ZRpO4s9G2BcC4cP+Q
         49O3pXSIO3bakrVFNM+6rZzslFNdFvQ8lTH7q7gPk/nz61Yhsn/T40Q97IJ112qNJg6/
         V1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677749638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gljsncSazEBidrD5SMWZ+vpM35ok5DGJL+jTv+84I8=;
        b=jFgMvprfonQWLxVQ0ScP6MYOKVDg6mkhUA6ABUMIQ49FZXFAJ9TET/CKSJ8Y0iM5ln
         kfbiTySRPmjxdo0itNZStG5oxKhNYwkoXWY1gEr1L94TzfYYGrICTvkqn13+gSk15xGP
         Hz/3Rlq2wAkJQSGpnfa75qVcyga267eu1aDSuQum/I+sE+p1bZC86n3WSpA/PxBlx6v8
         jx5ph/hbKddMY3KMG+7yN9rmxbH10F/6GzwIZDzdloLeylOudxvTIugNU6oIbF8x1yBy
         vp8hwf73JrVo7SFmxL/OUzduNAxIOg6JARy4GLDlR6erAncVqgp8x3jJfbLoWF8dobrR
         Djqw==
X-Gm-Message-State: AO0yUKVMpe8uwedZWjg65uP7bOSLgZBoSexcX46dymVwUitIRwR86oPr
        ojakk2rDArDrCS1cIfOu5iHhp/amVZE=
X-Google-Smtp-Source: AK7set/B38J1OEUNHsptqkT4jA+2Xqre/FJ9esyq2rILMyXBd1lnt3elRdMzTx9Hp9M+tKda+LcptQ==
X-Received: by 2002:a17:906:d8c8:b0:82e:a57b:cc9b with SMTP id re8-20020a170906d8c800b0082ea57bcc9bmr1640072ejb.24.1677749638245;
        Thu, 02 Mar 2023 01:33:58 -0800 (PST)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id e6-20020a170906248600b008e53874f8d8sm6826428ejb.180.2023.03.02.01.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:33:57 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] dt-bindings: tegra: Document P3768+P3767 reference platform
Date:   Thu,  2 Mar 2023 10:33:51 +0100
Message-Id: <20230302093353.3873247-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302093353.3873247-1-thierry.reding@gmail.com>
References: <20230302093353.3873247-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Document the combination of the P3768 carrier board with the P3767
(Jetson Orin NX) module.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 6c13d5e5719a..014b32f780fe 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -217,5 +217,9 @@ properties:
         items:
           - const: nvidia,p3767-0000
           - const: nvidia,tegra234
+      - items:
+          - const: nvidia,p3768-0000+p3767-0000
+          - const: nvidia,p3767-0000
+          - const: nvidia,tegra234
 
 additionalProperties: true
-- 
2.39.2

