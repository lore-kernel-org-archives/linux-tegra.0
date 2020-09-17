Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284FAC43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBD112087D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOrg0eYa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbgIQKIP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgIQKIP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:08:15 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D77C06174A
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:14 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id w2so1392289wmi.1
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qDEdsImJGmPjV4cplSymy3fo44ZqgQp59/n5co17MVE=;
        b=KOrg0eYaDIXK2RkYD6TniyClh7P3BK9rKet96xBfhJ/LDs/PpPwDIENv7kVc/L9kXc
         zHaTVhOvKXBxV15+k5Bn1HzChi5oTYjXHJx6yc7uhpUJsg3ub0ck6bQKMphNHn9Ncw8M
         K89QxZ9OkgmQYx68ZtNcj+OlgpMtismBFbCfR9ukvMsGQavJOrAmzlnVRhFeybw+ufgq
         LgDD8JCEVuQYXcgjati4pL9+Lpfxe8eJx6BJbVRBw72fgBxQje/WH+gtxKobA0HPbHg3
         U3OjI87mJeKN3Q+dlAWWbnQq2UdBj35hJKS4wzXC7chk48wVxIROzcXEq96TogLk2QOS
         o4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qDEdsImJGmPjV4cplSymy3fo44ZqgQp59/n5co17MVE=;
        b=CfDrkSXfPHxRxRTVtQalMaYKq5+dfXYMUjAYfpICwJ/FhFD1OYN6VQvmDRrOQ661Aj
         DXGaJxEsYIIY3Iar4duu4o74+6563DG6RYz6ZnOthgOKwSMZVGvrfbvR9+IT6qImN1+F
         w3d2imiwR20nIpN7Bz5hj42hBZqrzNpplq2KIHrFs3WtO65bTbNmDfD+xdoIzRoBTqUu
         RN7xAxNdrAuWnjnseCH6Itxb2ZPs9KuB2cz157vNP/k3c652cfh2rZoOmRlYsdznGBgs
         d2MqiCKnKudzgXtC5lwIcg7nb38YK1+pETdc2n6zp34mekn0WEfP0mdNU4l54b47T+Ki
         0BVg==
X-Gm-Message-State: AOAM5330rPtpmn0Z0BCaYuUMFyLYqBg2olJTdPjAZKjIi1xSGXf/iH9s
        +omYjSzdlIgF5RqWJbYl/E+Rr1T5CGwlRQ==
X-Google-Smtp-Source: ABdhPJwAgAu6iq1atWEd8YCGH5KAF6xEi42zmB+6VcRG5jUkYGuUd1qAGv8452yMOgXNWYH9m9ronA==
X-Received: by 2002:a7b:c1d4:: with SMTP id a20mr9253846wmj.30.1600337291748;
        Thu, 17 Sep 2020 03:08:11 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id m3sm37940075wrs.83.2020.09.17.03.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:08:10 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 05/14] dt-bindings: fuse: tegra: Add Tegra234 support
Date:   Thu, 17 Sep 2020 12:07:43 +0200
Message-Id: <20200917100752.3516153-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917100752.3516153-1-thierry.reding@gmail.com>
References: <20200917100752.3516153-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra234 FUSE block is very similar to that on prior chips but not
completely compatible. Document the new compatible string.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
index 2aaf661c04ee..b109911669e4 100644
--- a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
+++ b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
@@ -7,6 +7,7 @@ Required properties:
   For Tegra132 must contain "nvidia,tegra132-efuse", "nvidia,tegra124-efuse".
   For Tegra210 must contain "nvidia,tegra210-efuse". For Tegra186 must contain
   "nvidia,tegra186-efuse". For Tegra194 must contain "nvidia,tegra194-efuse".
+  For Tegra234 must contain "nvidia,tegra234-efuse".
   Details:
   nvidia,tegra20-efuse: Tegra20 requires using APB DMA to read the fuse data
 	due to a hardware bug. Tegra20 also lacks certain information which is
-- 
2.28.0

