Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8050CC433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 22:02:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67C8D60FE8
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 22:02:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234738AbhKNWFq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Nov 2021 17:05:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236193AbhKNWFE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Nov 2021 17:05:04 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6A6C061206;
        Sun, 14 Nov 2021 14:01:57 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 1so31254598ljv.2;
        Sun, 14 Nov 2021 14:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=niwYK5N2j/3/WOUVbzxqfWl0+I+uux5zlGux9lfzEBE=;
        b=ZUaRBc+LBlNybsdo+fXtiZKbuN1OERmVNpX3rovkjPBu+PHAc9mcpQNx/dURw1rAD9
         OUZ0WNglz3R9RPlNWYGpTvNoqwZYzbeM/lAijOrlC3T3GuDUWySecu3KnLy1h8bYCsng
         mPUcuS79oY9hHwHYeuKYpa/mdzv4BmNwyKa7+/kNo5ytmfzWCZa2LyVWrKDZ2FogfdjH
         hQNKYW1ZOzafoPNlTezUO0s7eViCDsIGYtAWq502ZrsFTJrC/OBzOy5x00NGShcqKbVS
         0AitlOPPgf3R/H3GN8Eg06itQT7gNK3WRh6IdQ1jqx92Y12wSbYNF0MlEoa0u04O3SN+
         Pwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=niwYK5N2j/3/WOUVbzxqfWl0+I+uux5zlGux9lfzEBE=;
        b=ZrWkEj9CMnabZwOBf3KNZfEF9E/KyqPE7V7yjECVlj91V+AujXieZygT6ivkc1W6lo
         QvY6b6EdyB9ELI8+Cj8Hv16WebhunPB4WtZ8fFMJPzuLv8xZNI4Ivx0QipNxuDfCjNsq
         2ZeKS3u4LuiFre5ERcUM9fPG4VrQvZewHQIRuhN/zvlGB24ly7gQ4iX/lVjL+RcR8NXR
         FHiFFbiClQXfXYuDcDfISpWZ/ZHKpg8sbkpSkDM+PO//39y8P58kl8ft12G26GgGFKwV
         lw+tczoltE8LKae/5wbvw1ddXqd6a1LvIdDRNAKO1V0qhaWHNSApCfaX9fysqBW71HpA
         SNlQ==
X-Gm-Message-State: AOAM5312YtBVUbjNmHU/g7TiBABpPseHSgSdEEonSuThwXVnh0PlyTSo
        xUraF3/8m9ZyeBBaDBKg0gU=
X-Google-Smtp-Source: ABdhPJzPt+TI5iHe2TQYcpiDJd8oOAAD9OmA4mZ77/bT9v78/4aNBlEJfP/2TMA2z2tYtONYEGeOFg==
X-Received: by 2002:a2e:a176:: with SMTP id u22mr34257637ljl.116.1636927316191;
        Sun, 14 Nov 2021 14:01:56 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id t5sm1353842lfd.80.2021.11.14.14.01.55
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
Subject: [PATCH v1 02/14] dt-bindings: ARM: tegra: Document Pegatron Chagall
Date:   Mon, 15 Nov 2021 01:01:07 +0300
Message-Id: <20211114220119.18909-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114220119.18909-1-digetx@gmail.com>
References: <20211114220119.18909-1-digetx@gmail.com>
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

