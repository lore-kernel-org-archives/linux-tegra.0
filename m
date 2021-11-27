Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F70C43217
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Nov 2021 14:28:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344918AbhK0Obt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 27 Nov 2021 09:31:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239069AbhK0O3s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Nov 2021 09:29:48 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93807C06173E;
        Sat, 27 Nov 2021 06:26:33 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id z8so24596020ljz.9;
        Sat, 27 Nov 2021 06:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XpGhfbw+LB+dcPD92P/sr6xIoHQTd+cfqs/Lkbt/2zU=;
        b=NtrAbVzGtndOEn211/nkvKArbqFFVOC+e+RFMf+g4OpNXjW+5goNKz9BPDciyhRYhI
         zrv5RoaYkwm+m+sRp98kSo35fCITG1SK5/uTXRZz8rRKyJrpxMbNqXVH0s3jq2IjNeS8
         ivw1XU7zhc92FKjEzXKiTicsWdDkeEVLkwrJH5tYz+yvbATgLfEd8FIqT6J0ILpaS5A7
         r+wsgIlvwns8cL4p9xw0dRYve6lTtIPxRqJ+xYi2W+bwnl/155bMkg+4sJNeE1HIw+o2
         chvm+NFFRp9W7l7ByuMzQXffW8RUrIz3kEMhVZ7haSEyUQUBt3JktVrcJnpC+tYMCBXT
         ovqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XpGhfbw+LB+dcPD92P/sr6xIoHQTd+cfqs/Lkbt/2zU=;
        b=HCvsGZD89/YC5qGHGNFtxrS7d5QtfIullLu1xq4kCLXDU78x/vS7q7kEGjhnnLS46U
         AM2LN9Xk85enQqqIWo6S2GeqXws+h870L2XnLdPjH24d2NHepWYjvxvrSGepiBw3BTLm
         IWV6XeO5+Aewu2ThUFwObphbxWY5Iv2Q2U7ci8XJm4eFbXdQq/pmKaqCksi09nt9XY37
         cY/5+uZYK4ty3qX4Df5tE91M+6anEkmzZBiNZaOPI8n1K7T6qv9ZlvTrZ1iS2O2M0Wol
         MQf4WbbrZbFuPLODQklSixrF5n0NFsKSRKs1iZmsfCJXVsT9fnMZXS7JAbZTo6l5OXQj
         otrQ==
X-Gm-Message-State: AOAM531kYYFv1khjBU/9FAOZaFnDWuFd4qs/ILqQcGHSOmGNjKCXdBP+
        APnOFpa9jG8jnw0bOqt54mhjEzLa0u4=
X-Google-Smtp-Source: ABdhPJwvpzWs59NxqkjZExT/LmL88ihoE8cqeLmSHzzsHFqI1q3BkLfE8/kv92k8a9DDETc4Rq94oQ==
X-Received: by 2002:a2e:a910:: with SMTP id j16mr10126085ljq.96.1638023191910;
        Sat, 27 Nov 2021 06:26:31 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t22sm812382ljg.83.2021.11.27.06.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 06:26:31 -0800 (PST)
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
Subject: [PATCH v3 01/14] dt-bindings: ARM: tegra: Document ASUS Transformers
Date:   Sat, 27 Nov 2021 17:23:14 +0300
Message-Id: <20211127142327.17692-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211127142327.17692-1-digetx@gmail.com>
References: <20211127142327.17692-1-digetx@gmail.com>
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

