Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71791C4332F
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 22:02:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5621F61104
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 22:02:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236247AbhKNWFj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Nov 2021 17:05:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234808AbhKNWFD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Nov 2021 17:05:03 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D06C061204;
        Sun, 14 Nov 2021 14:01:57 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id e11so31149520ljo.13;
        Sun, 14 Nov 2021 14:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XpGhfbw+LB+dcPD92P/sr6xIoHQTd+cfqs/Lkbt/2zU=;
        b=JQ8lShLVG+ugpPAgHRwDtNXMqKZrlilrryZNaknpMhv+VC/uMXc1fTiZisy4eAq5i9
         mwFUBpJYAprO3z6Sg/N17IvFmd7CM5+UVPI+FBroEPQG8ocz9OnT9aI9//2fandgROuF
         PouNADubZCmlvlOH+SKvwqHqbpvqAalvb/FU+NDVoGCVh/rFpRYxIsae4HIB/6vqmp9Q
         P/xuCZmnWzZfEvM6vyxQd5gbwrbWYpDC5eKONtflFxdw+JQMCu5wQI3hWI+v9hKn/mJ9
         Ldz2kslIz7aBJ875CaOXWfYXaA9Za5OPvIqKDePRRDx9V6sw7ma/jHSfZv9z4YQfO+kb
         tBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XpGhfbw+LB+dcPD92P/sr6xIoHQTd+cfqs/Lkbt/2zU=;
        b=tW1IOh+QdQlpv+e38PSeY5lDEa2eXAuzWn50n7JdLm/1iRH27A7mA/5/OzMr5zf5LL
         oNZTncoxkUHu5dqkCbtH+ULNhx7gCF5GbcrlzG3RKtki0ackzR4KlDZqTgxI4Cjvs93K
         F2KN1Ep5HaD2maNkaR5DWetFQFoZRhEGPvr//2Gydz9Ueso4hRWQILlIJiBWNl3dFXni
         ThfaCoOWLqDfliY0kZIXYAqhto1n7AoyDsQlwvl3KtEuwvlhL/+Vl0FSunyfU7PPQKfE
         8MRVr7n8CxCuojYzJe+4SFdmy+jW1rHpT8DJ4DmW5JoCnafZ1X48Jpi/W7qNDhRDWDnF
         p+fg==
X-Gm-Message-State: AOAM530n/chrvZ1Q5MloQTSr92QX2hvcfNxQwHZebRQ2WYDn3b1TZMFr
        /kqMwno1FtmAryIt6PUKKd0=
X-Google-Smtp-Source: ABdhPJx43+Mv+cvX821s1vcMcXsFSPLB4o28aqYouMziIjynT3WH3IIah0wPaJhGOOvpEaMHspxKMQ==
X-Received: by 2002:a2e:8848:: with SMTP id z8mr33685669ljj.429.1636927315289;
        Sun, 14 Nov 2021 14:01:55 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id t5sm1353842lfd.80.2021.11.14.14.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:01:55 -0800 (PST)
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
Subject: [PATCH v1 01/14] dt-bindings: ARM: tegra: Document ASUS Transformers
Date:   Mon, 15 Nov 2021 01:01:06 +0300
Message-Id: <20211114220119.18909-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114220119.18909-1-digetx@gmail.com>
References: <20211114220119.18909-1-digetx@gmail.com>
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

