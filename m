Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6A8C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 03:21:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3306260F4A
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 03:21:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhKLDYf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Nov 2021 22:24:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbhKLDYf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Nov 2021 22:24:35 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34073C061766;
        Thu, 11 Nov 2021 19:21:45 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 136so2228743pgc.0;
        Thu, 11 Nov 2021 19:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WR5AGczr091yNTi2gDGKy+tB2yNi+2EZuQhR7DLAXiY=;
        b=U6/mW9tKxTplgdMbWP+vVfSVbURkU1CtAekOBs5Ck7yFeJFWD0CAfIt/wVJEm5nNtt
         SUnORTS2EyRE4mfYE8f3zmp3m3cJYUPua30CstN/u9/nLzuGkvy4sEeEuySkz6yc/OnE
         dk7Jf8DpBWZe8zilm7c5WCV/wZ7usO6nkJUd9NKuwgj18dLzINDRW7cLXHG2Mq/ho4BK
         6cgAoo6ITXPHrGZbNpme7MD1Gpd8y87WqOICFGdnh6CkpZHn13pthkT0IHe2svHl02My
         xYpEN4+UJ03/hOPulFqMbKf9YWXKPIUCRdn7/rqiq5137vpdqxgZLyjlndAQTyboQVX1
         moeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WR5AGczr091yNTi2gDGKy+tB2yNi+2EZuQhR7DLAXiY=;
        b=wapy6Jzaq+uhqt1TtGQshYv+OFJAFcnQAtZHQxGJnt/ajeezHqD+P8ua6ntqEoOtTa
         zxsxHdwj8V4Ch1yqj/6cNxxkcfZT5XPrji8YpVonrRdCpmPL4KNfj/i98qd3cDBmtVqq
         B9Dfh6o7Ky9MzB0CNvbY4kPBKAxlqIU6rdDkvRVJHBiXuO6Nv/0ljrqbvbGgWPxZaEaU
         r7NQUJYDVhvBDLqevM3sBPhF82fMYfaOi1/C174OuX2CjOh3HuWUh7auI9Ll4Z7LPSRt
         nKKrJ5jCA4/Phx3IrlpeRo/suaEsg7C+XO/cgOG9+Z8N2kCtz1ID/Pw9Az4ZHlsjjzLc
         B5vg==
X-Gm-Message-State: AOAM532K/iRdT4txUw8RRj1dUQXiDKkHzU5Ewzc39a/WlCiTtho8DULW
        arMjuozogw6slfQsg+7hGXA=
X-Google-Smtp-Source: ABdhPJxrqxnneJ2ksSxKG2ubvACd0PbawIumj0slhgQu7cRLF0Kxr8LSMeRBO1a8jSw9InIGtSgdkA==
X-Received: by 2002:a05:6a00:230d:b0:49f:b8ad:ae23 with SMTP id h13-20020a056a00230d00b0049fb8adae23mr11130812pfh.80.1636687304678;
        Thu, 11 Nov 2021 19:21:44 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id e15sm4587224pfv.131.2021.11.11.19.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 19:21:44 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To:     thierry.reding@gmail.com
Cc:     airlied@linux.ie, daniel@ffwll.ch, jonathanh@nvidia.com,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, chiminghao <chi.minghao@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cm>
Subject: [PATCH] drivers:gpu: remove unneeded variable
Date:   Fri, 12 Nov 2021 03:21:02 +0000
Message-Id: <20211112032102.5289-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: chiminghao <chi.minghao@zte.com.cn>

Fix the following coccicheck REVIEW:
./drivers/gpu/drm/tegra/dpaux.c:282:13-16 REVIEW Unneeded variable

Reported-by: Zeal Robot <zealci@zte.com.cm>
Signed-off-by: chiminghao <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/tegra/dpaux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 1f96e416fa08..b65b21f26d2b 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -279,7 +279,6 @@ static void tegra_dpaux_hotplug(struct work_struct *work)
 static irqreturn_t tegra_dpaux_irq(int irq, void *data)
 {
 	struct tegra_dpaux *dpaux = data;
-	irqreturn_t ret = IRQ_HANDLED;
 	u32 value;
 
 	/* clear interrupts */
@@ -296,7 +295,7 @@ static irqreturn_t tegra_dpaux_irq(int irq, void *data)
 	if (value & DPAUX_INTR_AUX_DONE)
 		complete(&dpaux->complete);
 
-	return ret;
+	return IRQ_HANDLED;
 }
 
 enum tegra_dpaux_functions {
-- 
2.25.1

