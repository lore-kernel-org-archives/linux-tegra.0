Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDE0C2D0E4
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 04:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 191C3246E8
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 04:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+m6UTeo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgKSEpY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 18 Nov 2020 23:45:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgKSEpY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Nov 2020 23:45:24 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBC1C0613D4;
        Wed, 18 Nov 2020 20:45:24 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id q10so3272874pfn.0;
        Wed, 18 Nov 2020 20:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/68HdcONNdfxqmI5NXeK/Rq9pZHHixki1T94CcD+01g=;
        b=I+m6UTeofulo4NbM+pe+OCPDHvY5PVoyljlaDLItiCEtvcMIx7voSoITiJ4KOXHr19
         9E4ndoNIrVfNmjyzkFvaVIbgDesdNcszk7aaxTZt1OQKzLUgkCV9kyFHBqr1Jl2+IRuS
         2WuUe1jZCM8lois0B/NG/9hxnTssX21aftln+ElA8eEe6/Z5vJEZrmebRKa9hIbSq+VZ
         CMwUoM44uIyckbOplWHponYuxlv2b8CAqGAWwL4Mw7auuIs3AJy2L6HQfM2X88U/cmYy
         uVcMSLM9HSJ91Dc68SS7siWSZTx2IYCbVGVbCeFBK7jQ+WssLuHtfeStH16N8LxmC3JS
         R6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/68HdcONNdfxqmI5NXeK/Rq9pZHHixki1T94CcD+01g=;
        b=bYjasS78Z0KeXwdKMraYaitMTHeAb91ynykkaSuI780OtYWFFP3hdp7Wafbp1bDYqS
         ArdhGrBDjMaM7PYvviN7XW68yX/NePLa4d4K5u1lI7oMyzEX5zmeitAh27opPjj5xAE8
         oRY49FFeoxEuEhCyaj+8+BwphOKv9Vix/KJhEXkGjkBh9Mce9jkZhXUJNpwjG8QgUQ/s
         Z86fWb6x9Q77FNMil57SVMalZJO7sqEmKHOWYbL3XptAds+WWkjsjfqPlfouoSFgxCTy
         RUxzidNusZ8uhV9IuDNbZYtRSJLpH+qJbOMFC8fC6Ih4OpPt63pc0ur7cNi6fdOkI+CV
         DiHw==
X-Gm-Message-State: AOAM530kgOCGIYtWOtQAqgr0FCtok3dmERnClQHZwOSovIZarYAXmzn8
        uC1+KCUpNzC0v4Edqdrrey7qy3AV/yZpVg==
X-Google-Smtp-Source: ABdhPJyy17LiL37vAytwsAgqZW3JtdBC8BRpGixmXQp0VAbXDX9xkvgUfy6ztTCaAJVm0AXTbB7BHg==
X-Received: by 2002:a17:90b:1218:: with SMTP id gl24mr2377843pjb.131.1605761123713;
        Wed, 18 Nov 2020 20:45:23 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id r36sm24662974pgb.75.2020.11.18.20.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 20:45:23 -0800 (PST)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH] soc/tegra: fuse: Fix index bug in get_process_id
Date:   Wed, 18 Nov 2020 20:44:57 -0800
Message-Id: <20201119044457.29528-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch simply fixes a bug of referencing speedos[num] in every
for-loop iteration in get_process_id function.

Fixes: 0dc5a0d83675 ("soc/tegra: fuse: Add Tegra210 support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/soc/tegra/fuse/speedo-tegra210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/tegra/fuse/speedo-tegra210.c
index 7394a8d694cb..695d0b7f9a8a 100644
--- a/drivers/soc/tegra/fuse/speedo-tegra210.c
+++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
@@ -94,7 +94,7 @@ static int get_process_id(int value, const u32 *speedos, unsigned int num)
 	unsigned int i;
 
 	for (i = 0; i < num; i++)
-		if (value < speedos[num])
+		if (value < speedos[i])
 			return i;
 
 	return -EINVAL;
-- 
2.17.1

