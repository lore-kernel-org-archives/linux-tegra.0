Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA17C43219
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 21:01:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245581AbhKXVEK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 16:04:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236826AbhKXVEJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 16:04:09 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E76D6C061574;
        Wed, 24 Nov 2021 13:00:58 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id b40so10547931lfv.10;
        Wed, 24 Nov 2021 13:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=niwYK5N2j/3/WOUVbzxqfWl0+I+uux5zlGux9lfzEBE=;
        b=B2lIFL72cTGJXc4UfclGW6xuKt/8QfJhxi5n95xMdXhsDqUWwJ2BKM4UaHdSv3wZ8L
         nz2mO8xuhflygLwZ2fyD8l/AnX5m97MB15k0VRoFk+UyDvB6BlhRfO8zJjPIsaRyXllk
         3qFoB1J/ro8k1UB9ws62hMMr0EcJ+30unyKPkp+ma6cniNz5NW9uo/H0aKGm7vclecPR
         HPNjzlUCx5pK6nmAZnk81wHGE46/tlH2nddGpA/ppyPiFhDQ6ZI1MFPFWfUEpGwYtlL5
         oDXPrfq0omSeaDKCWPpkA/gB13iK5Tl3MBsQCztd8D09bN+CQjebBNYL24U1/Otza7nc
         wDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=niwYK5N2j/3/WOUVbzxqfWl0+I+uux5zlGux9lfzEBE=;
        b=f42KDLewlexqiPF1hfA0z1batwq1frLWWFQyKDuB/3mF8vQh5sVxIb8zNb3RNN8Kmj
         fRA+yUZW7g1+kTF+b0J1eSig2eJD8xX5TvxiBmt0IuRmCNkuIuZ4CpDb29gdtsXiR9U+
         0HaYest8uhAQtH/cuKEurLnkggBnhrVkxSBru34h47Gea+hWjrVRipsI9hq6Q2oS8SCb
         766TbLpTMCP7DkE7Wm/+m2RkoHGUzbhlw3fdLydID0uNcyaAdi1NmjpLjLcOHQfPnBhQ
         3gzBKzd6HE52M+tnI5lc0mr0fGk02mRLUtQuyD8ZACMC9vomjD+arF8IgPe9GOAk07vc
         5EBA==
X-Gm-Message-State: AOAM53281E6mLPBoq4LyzNTo34ItYeVl7idV/JWpoFlD6bIAde0OWXGG
        ca0BTUqrodkZM7L7sERsfpo=
X-Google-Smtp-Source: ABdhPJyG+uXSvoQLjH0dAs2OgO/yUR2RQa97TYpLpi+wUiDVfEkql0eZeMpNzDuQDf7Ry3O4sbE4Dg==
X-Received: by 2002:a05:6512:10c5:: with SMTP id k5mr18335558lfg.34.1637787656495;
        Wed, 24 Nov 2021 13:00:56 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id 18sm79939ljr.17.2021.11.24.13.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:00:56 -0800 (PST)
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
Subject: [PATCH v2 02/14] dt-bindings: ARM: tegra: Document Pegatron Chagall
Date:   Wed, 24 Nov 2021 23:59:10 +0300
Message-Id: <20211124205922.11930-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124205922.11930-1-digetx@gmail.com>
References: <20211124205922.11930-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: David Heidelberg <david@ixit.cz>

Document Pegatron Chagall, which is Tegra30-based tablet device.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 49ae6319336d..91a7d4a75fe6 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -89,6 +89,9 @@ properties:
       - items:
           - const: ouya,ouya
           - const: nvidia,tegra30
+      - items:
+          - const: pegatron,chagall
+          - const: nvidia,tegra30
       - items:
           - enum:
               - asus,tf701t
-- 
2.33.1

