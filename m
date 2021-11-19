Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970DAC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E40361265
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235972AbhKSOmJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 09:42:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbhKSOmJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 09:42:09 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 328E7C061574;
        Fri, 19 Nov 2021 06:39:07 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id t30so18485082wra.10;
        Fri, 19 Nov 2021 06:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=09NuwAV48ntRNAePO8qE+ZrwRqhuYbMQxZq5zKa4Rxs=;
        b=kPhthXKwt9JQoqZrQ+HY6PYO6PUh9qpvQ1ZwTAyi7Vx/8z2YN8T3ael6L3wQJIP7CG
         PXm9+EaB6BDShWK56WFSOP358tPQZwdLPoICcf4bwLQytGZ/haQEJfZGO42G1++SGkvm
         N9aqZVy0TrTAi4QyeJPExCSJO0QTi5Ygty26FAXYUnDaEiVe1S486D8TKFS/cLXduRs7
         dzsWiCTeNrGTDiHOuONe6kLZ/1nNHYGX9dO9Uho31WulNVk5duAJpRTfSo1hXiNETZu8
         ijyjvYY9oSNS1YQcY8nvUr9iGvYpyzwl+JUc1mEhW80ZU/b13NkGDS3/MTW7xIniLFwa
         bjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=09NuwAV48ntRNAePO8qE+ZrwRqhuYbMQxZq5zKa4Rxs=;
        b=b+0MxYEIq3ma7NdABomWPZxPOSUwmZYBVS8BFjVJghDHbmZtu/Ug1yCiWegrYQKrY3
         4Q/aLU/QPAr+wqCAXRMUabRDquSh+zKP+XiHWg1/JQqx2OlOomQIiFxVJWQ0rq74+DvT
         HGlpkg2jSG+9PVExFVkShXhM1j3Qhe143FXadBLPXrEPeV0exOMgrUC63eOxvZ2Hy8YV
         3W1BOjmUgLx0cRHB3aL3AOEHpr8VJVwUvm6xQOllRuxVa5I+CLiAmK0TYiOTvonzgGhb
         u/PTfKlFr02MQYocjDNhHUXgDeEgr+gwaqU7G9ejw+5RsRjB6lozLJDUpv8WwBwglBOX
         bBmQ==
X-Gm-Message-State: AOAM532486QqHfRW4oV8Gbv7yPNs/w9LpoYpTHg3b6IRRs4l51SETU+W
        /z7MrOp6CzUjjmVm1MP5Mw5sR2E1YfkYaA==
X-Google-Smtp-Source: ABdhPJxqP27JjRsmoFa9GF9wMTI5FVcpWFn8VCgD9bL7fnCHC54GDKyTtK7WpjNcZ7BympZs1zVGTA==
X-Received: by 2002:a5d:522e:: with SMTP id i14mr8040608wra.43.1637332745705;
        Fri, 19 Nov 2021 06:39:05 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id d1sm2996979wrz.92.2021.11.19.06.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 06:39:04 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 08/16] dt-bindings: fuse: tegra: Document Tegra234 FUSE
Date:   Fri, 19 Nov 2021 15:38:31 +0100
Message-Id: <20211119143839.1950739-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119143839.1950739-1-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the compatible string for the FUSE block found on the Tegra234 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
index 8d608e722ab2..ce1056174778 100644
--- a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
+++ b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
@@ -21,6 +21,7 @@ properties:
           - nvidia,tegra210-efuse
           - nvidia,tegra186-efuse
           - nvidia,tegra194-efuse
+          - nvidia,tegra234-efuse
 
       - items:
           - const: nvidia,tegra132-efuse
-- 
2.33.1

