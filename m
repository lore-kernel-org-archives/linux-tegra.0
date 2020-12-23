Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71918C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Dec 2020 00:02:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 391B122573
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Dec 2020 00:02:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgLWACh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Dec 2020 19:02:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgLWACh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Dec 2020 19:02:37 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6DCAC0613D3
        for <linux-tegra@vger.kernel.org>; Tue, 22 Dec 2020 16:01:56 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id b73so14535970edf.13
        for <linux-tegra@vger.kernel.org>; Tue, 22 Dec 2020 16:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fkrYUr3Os7KrZsC5hNgAx2k8T67FxAdgwdbrSELw5jo=;
        b=IVEhdMFKaxuwlvEY3r+/FUSFwJh8H48oFFl27EEpMJuDeBcZAgoKyrbwZOy5TOjrSl
         kPG7AORDrPKWO98VRfxul0NQ25Y/TTTEu2TA1G/F3s2s2cWSnmQIJ4JrcljY/5c4rmUp
         9AUpIbNaeeom+RCjGT52MC2PnQixj1BBJfLtYMgDzf6C2VXT1hTodEATJUbR12wXCXWF
         KJPkx8VlawWJpKcLgJ55eAyr1e1qkNcJ3jHVneCrFyEEs7xIUVHVTUuBNlTP4mUCVu2k
         KEWdTkdM0Ub95bXVepHUHbYiDrte7tbFgYC+5+00iRPuLfc1XjcFqPvICyMP1tXUAQIl
         q8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fkrYUr3Os7KrZsC5hNgAx2k8T67FxAdgwdbrSELw5jo=;
        b=mmwdaktdhjsFHIvNc+LdB8NFk/w3aZ+TGFQku2OBiEG7AnHO4Yp3DETpTyo25klsCV
         8I+kRzUVJaZ/ZaXUuzrvXIdRMTY66ATUhsPuDoJTnWvoo6hvo/epsRq0u50GhQfdVdH/
         PBbPFzrer83FqGro4TyxmjoL4HoTyJHZFWvpznQB3WN9om11S8qFL0vPail6o1BI+1mc
         jVEE0RJqWZdVhWzT226x6eQG8infBNmKkGmWS528gtm8lRuQOiBsxqRueIyna+aG36K4
         KnM+7EGVgGTRP3VKVfYP/KpWy5cLNGKz/QXXQ4J3NtVGgYeTzP/GM8U9D4CqhxxITxRw
         5Ktg==
X-Gm-Message-State: AOAM5307t99QiMw1C7sYGaQ+JzuU/mjGkk5u9J8i21KGFyoksr7Av6h/
        ianPPE5CjVoukswdkmZfThzyMjdYAJqZtw==
X-Google-Smtp-Source: ABdhPJzZzexNoia1h8HCbYJHElwClHtEcIvuOwsqArwg8iupucKtW7tvZ94E2KGbtuMrE1EPHZGgHw==
X-Received: by 2002:a05:6402:6c9:: with SMTP id n9mr22500649edy.43.1608681715647;
        Tue, 22 Dec 2020 16:01:55 -0800 (PST)
Received: from localhost.localdomain ([31.204.128.19])
        by smtp.gmail.com with ESMTPSA id p12sm7719360eds.39.2020.12.22.16.01.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 16:01:55 -0800 (PST)
From:   gabriele.modena@gmail.com
To:     linux-tegra@vger.kernel.org
Cc:     marvin24@gmx.de, Gabriele Modena <gabriele.modena@gmail.com>
Subject: [PATCH] Attempt to address a style issue in nvec_power.c
Date:   Wed, 23 Dec 2020 01:00:46 +0100
Message-Id: <20201223000046.35499-1-gabriele.modena@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Gabriele Modena <gabriele.modena@gmail.com>

When running checkpatch.pl on nvec_power.c I noticed
that it contained a style issue. This patch
attempts to address it by moving const after static.

Signed-off-by: Gabriele Modena <gabriele.modena@gmail.com>
---
 drivers/staging/nvec/nvec_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 0e861c4bfcbf..b1ef196e1cfe 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -338,7 +338,7 @@ static const struct power_supply_desc nvec_psy_desc = {
 };
 
 static int counter;
-static int const bat_iter[] = {
+static const int bat_iter[] = {
 	SLOT_STATUS, VOLTAGE, CURRENT, CAPACITY_REMAINING,
 #ifdef EC_FULL_DIAG
 	AVERAGE_CURRENT, TEMPERATURE, TIME_REMAINING,
-- 
2.11.0

