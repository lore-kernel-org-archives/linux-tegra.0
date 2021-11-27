Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F711C433EF
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Nov 2021 14:28:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237867AbhK0Obv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 27 Nov 2021 09:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239154AbhK0O3t (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Nov 2021 09:29:49 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F36C061746;
        Sat, 27 Nov 2021 06:26:34 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id i63so24617298lji.3;
        Sat, 27 Nov 2021 06:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=niwYK5N2j/3/WOUVbzxqfWl0+I+uux5zlGux9lfzEBE=;
        b=aBF/0UgMq1eEqdc3/MQtDKEMmY3H8BF32Bfzg4Ohb1dHYvNr33cxvujBw5yNPTrkzy
         DOZbG40pS0s6c1p54bMbSP2OEWbZ3OsoBXRBz7Ro7ZBQKO8j1xA3XgYkn226GhNZxBQB
         LfdO63a6idEyfZEmJhE1XotwONS7AeVnAJrk34pAHOWC/DIuRtGRBIGFm8H0j0s5YHUE
         onEzeB53mggHNPIsA5FJWIlFScvImPMFA4SZPqH6Hi99mhyhgKjk1wPTQ7+mQnEmynDv
         VN062NIfq6a1Xf9AOhNZ6I35C4cZ5HLbB5gK+XrcrtkemKvDDv8gIvlLyUS50QxPUd6n
         6MsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=niwYK5N2j/3/WOUVbzxqfWl0+I+uux5zlGux9lfzEBE=;
        b=CHoJGWKSzVUkuClHXEdxl2yovZ62KT83ftlXgbhjpY8Ar1wFBXwmFi6XmRHhyYM9jR
         qmIjvM4cYtuLQTsAdxH4tvixkPEBNyr6TFyz6NijTXrzsHhVPJvbWD+oAlapq6lSywaK
         4G3qVfBBLhQiJl6vdWxrx0ctqQkt+excbWSwDWOQ22fJVKEkck0hU4n+i3lWuDGvN04S
         ZaSUDKW00ykyQxCsYxR+EHdFbv4TrJ5ZtfmR84aR5dMWWFQ9D0cEHDwANARX4s83tVPA
         JY+uqSkAL5g64QFDoSMyEaDVBrIlE2W8vYigVKu/9te/fz1cXsc/U3kzfWzjmIcaqrFH
         cT1Q==
X-Gm-Message-State: AOAM530Xy1J9HKluld4XUVlqGokmQhfyKuILa6hSkY9uDNWuXqp0iMe2
        B8RuQUDmODhAA9gFnjvBWzE=
X-Google-Smtp-Source: ABdhPJyAug0uU+UxsbjFI5Eo38u5rjdmLcoMA/j46B4RO9YE3tOoxOiQd1pi4h//xTPPEm7O20bSXw==
X-Received: by 2002:a2e:3a18:: with SMTP id h24mr39669607lja.372.1638023192822;
        Sat, 27 Nov 2021 06:26:32 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t22sm812382ljg.83.2021.11.27.06.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 06:26:32 -0800 (PST)
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
Subject: [PATCH v3 02/14] dt-bindings: ARM: tegra: Document Pegatron Chagall
Date:   Sat, 27 Nov 2021 17:23:15 +0300
Message-Id: <20211127142327.17692-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211127142327.17692-1-digetx@gmail.com>
References: <20211127142327.17692-1-digetx@gmail.com>
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

