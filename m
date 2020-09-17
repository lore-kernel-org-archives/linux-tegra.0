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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806C0C43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3878F2087D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GH0RH1wH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgIQKII (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgIQKID (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:08:03 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4ABBC06174A
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:02 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id z4so1410602wrr.4
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t/knsyRBmfuowKEryvwF6FXG5P9Byc/LEhIHije4hyM=;
        b=GH0RH1wH/pMckesP06xq3yYfBkgy7xETCPMmo88fg2btw3zlZ3hpz/Chqq3/RNdsBi
         r62o7Y4JbXfswAddxfFEtj0E0JwNAJMweIplYNtBQfw6XmDi074ibXJyV/kS+feafuLB
         3+oIl+TscupcTyM9esHHCbvMfU13aRkiUnC4C86T9sVHES/tLSJfDEKelnXKN9e1ukZn
         wz/i8FiBI+rgYWxUj8tCTqDcwKsRHdkuEYDFo68/Ti6qY0UwzD5EnRzB3ffsGeZuovMq
         6zKg9NY0lLG4iAQTJDtsl/W8e6CSzj0rIzB3jAr2KLmKA1Ojm1iTWMFApNLLwpfv80lh
         LvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t/knsyRBmfuowKEryvwF6FXG5P9Byc/LEhIHije4hyM=;
        b=HolKQayG8kdJL/qqmjUjF/NVT+VQZLMHtMJ/Uy+mXuqAlb2gwBpw7j1kKh6MFyVClE
         G0Fa7kVFC6NOFLJ8QR0Y178tF8HUjidqgXd7uH/QCTw+GLeeTg1w0WcTrjf9/zVzYPmT
         mjEYvjxBiZrjg1URqaFEtDdelyYQv4g3D232iRHbN6THXvNkGJO3YJRfgEIvB2rShwu/
         iVnIlHPLgF4mzUCexCRE9FNCZK95bCtvam3rUJV/FKJiL73EybFfzj3vB59GXU73bvr3
         G+ou/sV0QgigPxt/Gg/tfKgOJMvgk+yts/8BbjQMKkJAMQSzC0P5V6pQtC/xc1opK9Iw
         M79w==
X-Gm-Message-State: AOAM532hNDHmsP9S/vvk9z3V6tssubhKpmNQhxRcXVPFi+dn1CO1QJku
        CtoNd3dH3PwPDqcsGJ18f5E=
X-Google-Smtp-Source: ABdhPJx1A47oG1vla1IuzoyG2ECZbYk7RbyFhsZVRT/Z8rnQG34qitRx9uslbAOhwWDDY5Co4XVl2Q==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr8265801wrp.390.1600337281325;
        Thu, 17 Sep 2020 03:08:01 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id l8sm37295430wrx.22.2020.09.17.03.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:08:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 01/14] dt-bindings: misc: tegra-apbmisc: Add missing compatible strings
Date:   Thu, 17 Sep 2020 12:07:39 +0200
Message-Id: <20200917100752.3516153-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917100752.3516153-1-thierry.reding@gmail.com>
References: <20200917100752.3516153-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The compatible string for the Tegra210 APBMISC block was missing from
the bindings. Add it and while at it, rewrite the description of the
compatible string to make it clearer.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Note that this actually changes the compatible string for Tegra132 to
reflect what current device trees actually ship with.

 .../bindings/misc/nvidia,tegra20-apbmisc.txt        | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt b/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
index 4556359c5876..83f6a251ba3e 100644
--- a/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
+++ b/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
@@ -1,10 +1,13 @@
-NVIDIA Tegra20/Tegra30/Tegr114/Tegra124 apbmisc block
+NVIDIA Tegra APBMISC block
 
 Required properties:
-- compatible : For Tegra20, must be "nvidia,tegra20-apbmisc".  For Tegra30,
-  must be "nvidia,tegra30-apbmisc".  Otherwise, must contain
-  "nvidia,<chip>-apbmisc", plus one of the above, where <chip> is tegra114,
-  tegra124, tegra132.
+- compatible: Must be:
+  - Tegra20: "nvidia,tegra20-apbmisc"
+  - Tegra30: "nvidia,tegra30-apbmisc", "nvidia,tegra20-apbmisc"
+  - Tegra114: "nvidia,tegra114-apbmisc", "nvidia,tegra20-apbmisc"
+  - Tegra124: "nvidia,tegra124-apbmisc", "nvidia,tegra20-apbmisc"
+  - Tegra132: "nvidia,tegra124-apbmisc", "nvidia,tegra20-apbmisc"
+  - Tegra210: "nvidia,tegra210-apbmisc", "nvidia,tegra20-apbmisc"
 - reg: Should contain 2 entries: the first entry gives the physical address
        and length of the registers which contain revision and debug features.
        The second entry gives the physical address and length of the
-- 
2.28.0

