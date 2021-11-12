Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BD8C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:35:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13A9160F70
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:35:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234982AbhKLMis (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:38:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234976AbhKLMir (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:38:47 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45B1C061767;
        Fri, 12 Nov 2021 04:35:56 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id d3so15232481wrh.8;
        Fri, 12 Nov 2021 04:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aHU4++m+v1PFXNkNfN4KUUp2M62VL6LrCJgTAfczPnw=;
        b=B1VZWvNzjQxDfBevuUBxUdf9TebiP2fgqI9iNElhL85/hVHE2Oh/UCE5+FsihzUJuJ
         XC0fULdkW9qggO/AXdmws+ekv5skgvWpVcsDxjpMziO6LTkHFFtRtdLCsp1XfHqLx/mw
         4Jpl8MjXDEgLQWzaD3DPxjlMmlptYIwzCAB+njxjv1/ekqyyoBEX0Bk01MyO7iXPaQYX
         fm7VQwcSFgpJyEWMe2yxduq6Or38TO7bPNjfYZRj4uK5r0+8GuxSjMavhN2yz5BN41cY
         aQUsh5rY2/G03/m26FP/V19B8tnD8iE9w+UNy4J4PzDLlG7CsgjBkO+fktvCJA80Es4y
         MYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aHU4++m+v1PFXNkNfN4KUUp2M62VL6LrCJgTAfczPnw=;
        b=xIf8XaYahz3VqF/keF1F393pS5mN0ls4BzDnJuBbA+196LSzyAXAT3pbsNdWBN5wu9
         al8NR/YXvUwuJMBtb70nWnsy+OMUb+v2Cg1a0S9Hox48Ey3+mEVNGeP6cV33fkwWxJfo
         jqkxiSK2NZXVJbg5LAu29Z3ylzY+oTvzywub35w4k61TqtosL0Lsr6iD8erRpGRqrRUc
         pQm17MfxbVB1yrvu2LSBv7MgPMUHhbGgLnH2AwMI6Mj5/nHYnKfNTkchwkIFLXi3gI11
         OeTAcX4ajyA8HKAmpkbl72fKmeIHi7bYt5hZAmodFCgD8kRi0tvUKmWRyeL95IitNSZf
         FAsQ==
X-Gm-Message-State: AOAM532EDo+vRqFbBHnMJux36ULJMzV6QR6xGCpA/kT3NYws0CdE7jr7
        LSQouWVfGC9QASTRcCtrgac1d6uWqxxfTA==
X-Google-Smtp-Source: ABdhPJzI4jbH94wKRnr6APadQiI8PjVFSyWRw+JR+IJ2w4t7jX2+33hH1GcobPZ0Z09nu9X5le0SQw==
X-Received: by 2002:a5d:4411:: with SMTP id z17mr17754518wrq.59.1636720555479;
        Fri, 12 Nov 2021 04:35:55 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id be3sm1307960wmb.1.2021.11.12.04.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:35:54 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 02/11] dt-bindings: tegra: Document Jetson AGX Orin (and devkit)
Date:   Fri, 12 Nov 2021 13:35:33 +0100
Message-Id: <20211112123542.3680629-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112123542.3680629-1-thierry.reding@gmail.com>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the compatible strings for the Jetson AGX Orin and the
corresponding developer kit.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 0235b510e0b0..3bd0920da274 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -139,5 +139,14 @@ properties:
       - items:
           - const: nvidia,tegra234-vdk
           - const: nvidia,tegra234
+      - description: Jetson AGX Orin
+        items:
+          - const: nvidia,p3701-0000
+          - const: nvidia,tegra234
+      - description: Jetson AGX Orin Developer Kit
+        items:
+          - const: nvidia,p3737-0000+p3701-0000
+          - const: nvidia,p3701-0000
+          - const: nvidia,tegra234
 
 additionalProperties: true
-- 
2.33.1

