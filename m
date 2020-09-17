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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5352AC43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B9F52087D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AG4HHZYh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgIQKIM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgIQKIL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:08:11 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D50C06174A
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:11 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id b79so1426626wmb.4
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kwIhMiKwFA9UbevhkK+ZQGnCqGV++rJhNBk/vocGlqk=;
        b=AG4HHZYh/lS4KCl8vF1CBlBPRAA3wg00sNAGurd/cshinKyzmKEZ27FWrgLivznShB
         yIliV7lRx5ws/J2OenlKgdZ8DxmCknQEdNm9e6ewfJctiAuZ96LQjHhA8MOzAfWCvGlj
         XaZDlJkfQTo763Y63mQ6KdB0YP8OBmeEJVOZTSpieUV7QRLzDv8RULZ7eDDxrOclaEtn
         O48rRt6MC5OjtX8hInBDBESe4UDfp+Lt+z5sdvymnzn1tzIOPnlRcNEBz+kDGbNN+ycn
         daGRi57nlLxN9Dc3+Df6GxHQpVYLy5hPP++VmJI9sn8ybHnqPlu7JxVrBJu2ybnPahd8
         Bvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kwIhMiKwFA9UbevhkK+ZQGnCqGV++rJhNBk/vocGlqk=;
        b=nptaRAVXNx6JiUo2uyWMt9zX8MVjxIb6Rsei64zha4tM2jYf8tnxgKsOmeXPHgbSWJ
         0SN74+S4t30ig/p+wzvkjXVTcHCdKmwtC4GSOaYG7Qoo96wLi7bznBMbMzAO6yfB1ZOs
         dhyeekWr7vQF+HXcGxJVivRVeH+ykHAdYPCasF/z/zNq3UxlptTIHRCI4jFs2KCoEhfv
         BNEW1JjoHFokY6C7FXHR0PqmenJCeYQqKeczDwkIrDhfrM4waPjCbKCWgnOfgTiRm5VF
         t2jeD9ii+G44/2y5JfpAGP9wm9M2q1Il2CR30VjQk5P6k/o0t+NvkaMqbn51ZF8Oq6I7
         tBgA==
X-Gm-Message-State: AOAM531GbWkfFe3fqs5BN6GbmpgdHIhfD9pI8e9417kAcsTGM57TJ9fU
        dJAz+Iukt/mttso+F9o0hVY=
X-Google-Smtp-Source: ABdhPJxGNXnzvTSiOWew8AxmTOG7GJ/ghclcyySs/R7BA+KwOjDkYDpgQT+sVAAg1uGKeNGRLWECpg==
X-Received: by 2002:a7b:c1c3:: with SMTP id a3mr9976780wmj.68.1600337289049;
        Thu, 17 Sep 2020 03:08:09 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id i11sm38591935wre.32.2020.09.17.03.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:08:08 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 04/14] dt-bindings: tegra: Add Tegra234 VDK compatible
Date:   Thu, 17 Sep 2020 12:07:42 +0200
Message-Id: <20200917100752.3516153-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917100752.3516153-1-thierry.reding@gmail.com>
References: <20200917100752.3516153-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The NVIDIA Tegra234 VDK is a simulation platform for the Orin SoC. It
supports a subset of the peripherals that will be available in the final
chip and serves as a bootstrapping platform.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index e0b3debaee9e..85006ca503a7 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -119,3 +119,7 @@ properties:
         items:
           - const: nvidia,p3509-0000+p3668-0000
           - const: nvidia,tegra194
+      - items:
+          - enum:
+              - nvidia,tegra234-vdk
+          - const: nvidia,tegra234
-- 
2.28.0

