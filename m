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
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED76BC43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB521208DB
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7uaVhuT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgIQKIc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgIQKI2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:08:28 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6998C06174A
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:27 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id z9so1437754wmk.1
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N86/DIEqSdmVeNovc1C8yzK8wvdIFptYxOOR5li2DG0=;
        b=h7uaVhuTp4wSTvD2NLgfh/IwrRIYbFnG7GU+LOFWvIDK/z1rOVkK3JEIWKWKZ9PZD9
         PUOv99As1raF39mTz69mbqCuQpHcfEIk3dYGHufTqNeNTgbQaLbwgMNS6y0NqoQ8AR18
         20ukg4NNXdllQnkFRFWOzvoaGs+74KoiE1uhGfQsfEk3q8qlC7AJtwNa4zCKUYRHhYYh
         diUbsvvyHqxDy1jwz2mTv7PhCKSvzD6i1uZ6txcv1R709vcyW/ZYiqrVtd3zA78+sNSp
         UVbfd1Df7uBUe/PRwj7H0Hah/70FSrkmbBqGYxIJkLIv7zTRpntf01i/CH1osohc5dav
         JpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N86/DIEqSdmVeNovc1C8yzK8wvdIFptYxOOR5li2DG0=;
        b=MfIiun+varmmKkT6F0y3sdKW3XdN153Z4N2O7p/oeh+88+YgIbA/tpPNX/7Fg6TBq5
         3Rztl+Yfbxe113ongEh3i57L/3IfEsevXU01ybXJQa5nI2RE5EI7mDy6FNaKGszs78gS
         ndX0iGmxKze6ctbDuweqeDL5t7VVB5NF9K667zV8F18VJCFclQzIe0Puour7nQyQYuzo
         mIocN4DlL8dsGSSOk3fcPRCuZcIEyFeiKZV/RA5/93t8KdYPjjq7WlOfSQMZJWAUYW56
         J/GOK+5KnjU83Ys8srolxamsVU7KU0Inrd0kmKQNxRvRxALPyhB1bGiPZdv3cVlSWD9l
         harQ==
X-Gm-Message-State: AOAM532O2/YEEnytdt1IbJk8JRr/FGw9lr6ppJcbVmCkZsxXGDaGuMyU
        mKRjoWKc9JUqYFQoqTDVnbg=
X-Google-Smtp-Source: ABdhPJzdl8RuDIVdPW1fqzC6HY3feTC/hljvQxd8RYFUyALq/rWFjliORmOm3vKOYrxf57k4WWBpVQ==
X-Received: by 2002:a1c:9e0e:: with SMTP id h14mr9053657wme.18.1600337305025;
        Thu, 17 Sep 2020 03:08:25 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id w7sm38562346wrm.92.2020.09.17.03.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:08:24 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 10/14] soc/tegra: misc: Add Tegra234 support
Date:   Thu, 17 Sep 2020 12:07:48 +0200
Message-Id: <20200917100752.3516153-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917100752.3516153-1-thierry.reding@gmail.com>
References: <20200917100752.3516153-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The MISC block is largely similar to that found on earlier chips, but
not completely compatible. Allow binding to the instantiation found on
Tegra234.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 0e4eb2656f44..cee207d10024 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -95,6 +95,7 @@ static const struct of_device_id apbmisc_match[] __initconst = {
 	{ .compatible = "nvidia,tegra20-apbmisc", },
 	{ .compatible = "nvidia,tegra186-misc", },
 	{ .compatible = "nvidia,tegra194-misc", },
+	{ .compatible = "nvidia,tegra234-misc", },
 	{},
 };
 
-- 
2.28.0

