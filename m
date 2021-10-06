Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB899C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 22:49:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2F706103D
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 22:49:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239955AbhJFWvM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 18:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239867AbhJFWto (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 18:49:44 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2140AC061753;
        Wed,  6 Oct 2021 15:47:51 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id d20so2983238qvm.8;
        Wed, 06 Oct 2021 15:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BvWjlblERvEujcsevvSOTWFd4bsGuB/Z9p30ro3lPrw=;
        b=gwzlD0aOL23lNlP8PhJuLLGOgDLD6QhM2OQx2C7f/VQeC3yd6hXRnn6OqD/8ZpHCDx
         RHb4aQoCMQuJAXpqE9hGavZgD3DjKT+9uOb+7qtNByK4ZAy7gpaurH6x9XVzGUOzhQIn
         td4v0TCAHIf4/IXvbfEAC+lvtb+j42sG0apzpGArklIFrkkFfZdHFCT4FbRYBA3UbfQC
         6PGON3Ko86+rTu7dM89AYQ3i8q86SnHD1heAZx9UWtoAbeDF35Am0ZvIiaD8ADcRFUAN
         4N2zCSHPQWkHYAUnE5ZAucXD7iigIc6BqdP8Q93WdaiZqwVL/bUgUI3sKgTTdC/5sVIa
         JKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BvWjlblERvEujcsevvSOTWFd4bsGuB/Z9p30ro3lPrw=;
        b=KnIID7gXQ+EdVJUqDdaiN/AHDXUirKRdpXF2fp4ty1ZkXsH7AQdDBlNvChNFbpg4oz
         0NNizho6K5ArErVKlJWROfkcv5Y519bP6Rw03DAknsq4YoK32G/YUfDRKx6TSVAlo9EG
         vcfaH+rA7CfN3PnnLxzPLjCe81vDqpnvU1UjLE5chJtDN4WZaNbrBNI8JXTppai4aJUC
         Iq5+pXQkhNCSI86bKJZBnRQJAieU2tBSPtv0xz28hrADjENYhrxuBjL2lkNS7pBgc/M/
         W8Lw57azHmTs79g5I8CglLzdQmZWAWrv+9PH3j94a9rpOsJeyIK5mj1VfhoVQdsH93bh
         15Dg==
X-Gm-Message-State: AOAM53278av91zPRgIPNtclY6Cx7P9l5JpcevxaVXfU0wEy6dp2y0py4
        w6WBX3WQ0C4MnRzleUqErAg=
X-Google-Smtp-Source: ABdhPJz5SV9RKlXlMUdX2ZDCPsrhtW9/3gZgnErLYiCCzmmXfv6o/TQvjxviYxWldOmP20+Zx7a9DQ==
X-Received: by 2002:a05:6214:140d:: with SMTP id n13mr740814qvx.22.1633560470385;
        Wed, 06 Oct 2021 15:47:50 -0700 (PDT)
Received: from localhost.localdomain (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.gmail.com with ESMTPSA id n11sm14738166qtk.92.2021.10.06.15.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 15:47:50 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 5/9] dt-bindings: Add vendor prefix for Elpida Memory
Date:   Thu,  7 Oct 2021 01:46:55 +0300
Message-Id: <20211006224659.21434-6-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211006224659.21434-1-digetx@gmail.com>
References: <20211006224659.21434-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Elpida Memory designed, manufactured and sold dynamic random-access
memory (DRAM) products. It was acquired by Micron Technology in 2013,
still there are many devices with components from Elpida. Document the
vendor prefix.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 1d77f151555b..8e06e3049a4f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -355,6 +355,8 @@ patternProperties:
     description: Shenzhen Elida Technology Co., Ltd.
   "^elimo,.*":
     description: Elimo Engineering Ltd.
+  "^elpida,.*":
+    description: Elpida Memory, Inc.
   "^embest,.*":
     description: Shenzhen Embest Technology Co., Ltd.
   "^emlid,.*":
-- 
2.32.0

