Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F61C433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 21:37:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 051E061465
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 21:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbhEJViq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 17:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbhEJVip (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 17:38:45 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86217C061574;
        Mon, 10 May 2021 14:37:39 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id c15so8085486ljr.7;
        Mon, 10 May 2021 14:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HXT+IvjVluiKH3yhs5geuypz9CaKXis2aNZdKmGa0hs=;
        b=O+TxIjPO26qr48bDHdb9liMywr0CqvmXm1p6DLSjYKpVZ09gVbTAcho3xKRkPsN+7e
         lT3Z7mcLc8fvTaHPLeyDLYxanPltNiauA/pTc8KjcMuxsiTCaWlvpoZnJnXK51TkbYg6
         B+uZvtRQm0x5nPr8uiaJvH+1Y98HBQvv0PBoEnI9cwa9NWSD42EP42e9me45eHHZ6szu
         whTcD2JcsZN2bzDjSfhjDz3udTmhe4ri7WQHX0vZvfDlinwmzlDUoIQlq8BhOvmL4g35
         fDr9VP51CRfOxxTI3E2gWOHCNG0vD12F6aO76/ij6d0E/F5zboXiV3+/u0/eCkoCLyMV
         rJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HXT+IvjVluiKH3yhs5geuypz9CaKXis2aNZdKmGa0hs=;
        b=bCStLHMzvMsFAkQZxFms7GMOvpGLwff18qUiRuQ3sdXOy7bKC4OzgiyKk5VA23z2D6
         xwYvNfRLoIym0NdiADY/zHjq1XJOkkVX4L90Kt+D1tDilRgwRgtiiRJf9Nc/3w/boo67
         y5FMbcW9vxJnkQrtvt1BL6f8/odvsXqwJ1wzuhWsbG5553prURnaUGL1wa5V3nUaZzKC
         D/d+0M07KRR9Y5NMa5cOAqnl4fIgyPAyUCMrek1WhHMSeMEAcQAwYnv1rsQ9JAMp0Tze
         ppAx92KFRasXAKf6vyh0FryHuOLZbncXgboP28cVzpF7MhFp/DMwI/EV+kcNYBslTIXc
         hrVQ==
X-Gm-Message-State: AOAM530Dh1pNydjL01D2UADXm3bxWvYp9N5UmdksD/fFoMMVIxdBMc9H
        BnBOzuQAnSjR41mdAOc0swVBcVkdRoQ=
X-Google-Smtp-Source: ABdhPJxpIh1mj6JIIXtctrQbiSCadNsajl6xEwe3nXIV8DSJ2vZ87IxdcIA+r5Jpc6sJw++tRL7H4w==
X-Received: by 2002:a2e:a28f:: with SMTP id k15mr21133725lja.163.1620682658116;
        Mon, 10 May 2021 14:37:38 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id 9sm431315lfm.271.2021.05.10.14.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 14:37:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/2] soc/tegra: fuse: Add missing stubs
Date:   Tue, 11 May 2021 00:37:28 +0300
Message-Id: <20210510213729.7095-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510213729.7095-1-digetx@gmail.com>
References: <20210510213729.7095-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add missing stubs that will allow Tegra memory driver to be compile-tested
by kernel build bots.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/soc/tegra/fuse.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 78cbc787a4dc..990701f788bc 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -52,14 +52,28 @@ struct tegra_sku_info {
 	enum tegra_revision revision;
 };
 
+#ifdef CONFIG_ARCH_TEGRA
+extern struct tegra_sku_info tegra_sku_info;
 u32 tegra_read_straps(void);
 u32 tegra_read_ram_code(void);
 int tegra_fuse_readl(unsigned long offset, u32 *value);
-
-#ifdef CONFIG_ARCH_TEGRA
-extern struct tegra_sku_info tegra_sku_info;
 #else
 static struct tegra_sku_info tegra_sku_info __maybe_unused;
+
+static inline u32 tegra_read_straps(void)
+{
+	return 0;
+}
+
+static inline u32 tegra_read_ram_code(void)
+{
+	return 0;
+}
+
+static inline int tegra_fuse_readl(unsigned long offset, u32 *value)
+{
+	return -ENODEV;
+}
 #endif
 
 struct device *tegra_soc_device_register(void);
-- 
2.30.2

