Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2567CC4332F
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 21:00:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244393AbhKXVEI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 16:04:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238121AbhKXVEH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 16:04:07 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A2D0C06173E;
        Wed, 24 Nov 2021 13:00:57 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id u3so10612999lfl.2;
        Wed, 24 Nov 2021 13:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XpGhfbw+LB+dcPD92P/sr6xIoHQTd+cfqs/Lkbt/2zU=;
        b=PQbnj92+SnW/kgDBLQM/T0OOLU9FMkJuzpEdt1WJnIfpauXztMKMHgd/zIo2GN8z4C
         ZpCpuTnoBa1WnFB04NpB3dITjOm/mjapkOh4znUtbVqqMZD0E/Kj37rtpy1aNOsBQwhn
         bUSlG5SRagPnrodg5jBYANZ+5rtB8X9YzUpM+rJIYGWmj/MKqbc4moA2ZI7hMDS/1Yv3
         kYMrqj3+UGF6tMekn4UHhzdaEk3oqflEuTxSckcImpiTwU3lLq5ICX6cet6gVIFe7wGl
         L1n6d5Nsi/Ad351sdX5KIyMePUOByMS1lD7RoUr7xlPJqUeDf0txNIUJ8930OHNXQjAI
         kGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XpGhfbw+LB+dcPD92P/sr6xIoHQTd+cfqs/Lkbt/2zU=;
        b=RWTlpiPd/ce9ejGypw0RsFn/rNM3iIxCRxUyv9pVO+CwrbQFpJ7AOPWybRpTvpWYCe
         O97OipUjVsiGpCazFVcp4QMjqQvbIUjerrBmJ++Bi4mRwkThpoOdGXRuqWaU0IaW1bJ8
         Mjqt1s+IsuUctiT822X8M2jgIZmEnDzu7ijYtj2D3EZtw41tRL5d/EMnr+UCwO5jWJ2g
         jRNx0yGVo8fPPkRzZHgo74YiziPVmzaY3xqOPKmryMA9gFQiyAv+0da0wUtOE3zStqc6
         aAw/IYwKUav0hUy9m8TLCBdZplJe0bLs76NqIqbrKRWXU0T9vOY5IEDrFPfqEc+ikFLz
         MLkg==
X-Gm-Message-State: AOAM530ytccD+9p2T3jfszJJimfXtGYdTnjx9cAKHQ5pFofeKotpIbXF
        nAOH6TEo59FJNpvHWUXFQuDSDu/EV5A=
X-Google-Smtp-Source: ABdhPJztiN3XutjegvUA6tBY7glkkspuC6w2ka3Cfy+BSSNK4jBZcsZK/g7azFyoLsdwkbDE9MY/KQ==
X-Received: by 2002:ac2:5dc2:: with SMTP id x2mr18392337lfq.228.1637787655356;
        Wed, 24 Nov 2021 13:00:55 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id 18sm79939ljr.17.2021.11.24.13.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:00:55 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Anton Bambura <jenneron@protonmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Nikola Milosavljevic <mnidza@outlook.com>,
        Ion Agorria <ion@agorria.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Thomas Graichen <thomas.graichen@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/14] dt-bindings: ARM: tegra: Document ASUS Transformers
Date:   Wed, 24 Nov 2021 23:59:09 +0300
Message-Id: <20211124205922.11930-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124205922.11930-1-digetx@gmail.com>
References: <20211124205922.11930-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Svyatoslav Ryhel <clamor95@gmail.com>

Document Tegra20/30/114-based ASUS Transformer Series tablet devices.
This group includes EeePad TF101, Prime TF201, Pad TF300T, TF300TG
Infinity TF700T, TF701T.

Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Anton Bambura <jenneron@protonmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index d79d36ac0c44..49ae6319336d 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -36,6 +36,9 @@ properties:
               - toradex,colibri_t20-iris
           - const: toradex,colibri_t20
           - const: nvidia,tegra20
+      - items:
+          - const: asus,tf101
+          - const: nvidia,tegra20
       - items:
           - const: acer,picasso
           - const: nvidia,tegra20
@@ -49,6 +52,18 @@ properties:
               - nvidia,cardhu-a04
           - const: nvidia,cardhu
           - const: nvidia,tegra30
+      - items:
+          - const: asus,tf201
+          - const: nvidia,tegra30
+      - items:
+          - const: asus,tf300t
+          - const: nvidia,tegra30
+      - items:
+          - const: asus,tf300tg
+          - const: nvidia,tegra30
+      - items:
+          - const: asus,tf700t
+          - const: nvidia,tegra30
       - items:
           - const: toradex,apalis_t30-eval
           - const: toradex,apalis_t30
@@ -76,6 +91,7 @@ properties:
           - const: nvidia,tegra30
       - items:
           - enum:
+              - asus,tf701t
               - nvidia,dalmore
               - nvidia,roth
               - nvidia,tn7
-- 
2.33.1

