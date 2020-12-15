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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B245C4361B
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 13:54:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CD50224B8
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 13:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbgLONyZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Dec 2020 08:54:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727348AbgLONyT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Dec 2020 08:54:19 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B032C06179C;
        Tue, 15 Dec 2020 05:53:38 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id a12so39530542lfl.6;
        Tue, 15 Dec 2020 05:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gDzaS/pPeZh5EiQsya+W0nBISDtLWznXodq8DvMAkkc=;
        b=JQJYWAVAr9iF6vLnV7Wck1vs/TRGHWt5u2TbU/e6BR6bgmNodpmNt4jlM9WG1krWPW
         KVDiUAY7zRS0McEaur8CLPcLsH2SokbFWqpFrF+ZewYhUXL3q6BeRgb9Ns5CysAHCh1h
         +ik4nHs0o6P2Znww+lg1qdl48fYwQPEv05ZOZHg0cfhw6d3XNCb+NNs+TtB3QJmBMsu3
         vHk6jZJlfTfnWl44J3sbwNHvTMEHQfsqtuSwNMmSH7I4Azj4qMkMUXvw+luTJLkO8fjs
         Q+abUGxFXxD/HB9EvH4qMzxTj0nPopLWA7h+3Kg9d+TT9PDbmvgi7r8+B8I4XhGkhqJO
         Z/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gDzaS/pPeZh5EiQsya+W0nBISDtLWznXodq8DvMAkkc=;
        b=H7gvTjt0CCF6vtgfzFcuk8+2iNM3TsRo6axlW6vdYuEX1nUN+XEpC3iicxODF49vre
         hjlBuHpMEy+XCNttnkU1XxHgoL9FCiAdHyCM9e1XKDntUn4SXM5QD3U428YLG/wcRDId
         7C2tpEk+o/ahp4TGUjOk0xBVvUXllYnkKztEh69yday0ODy5BbFy4MgQ19nWRstTtSAe
         SkBbhLxmvBVLrGRrCq0vQfIzzjahLBGvAK2gxfPDX4oRkzT5jWrFAr3zT6eRN5urEM2S
         q5AQI6g/7S6HACGyEO4Po1u9Tnr+RWKGMjXSo4edxXQ2GHXwISzYOoOXFYZHjmIaxHD/
         WJag==
X-Gm-Message-State: AOAM532oa3LX416NUCER+jqh9bYUiGR7ORuaqCtoWLiXCPkbs8zEjr6I
        LuWXttxhz1JSbpQc7lygcZTMWEvfEas=
X-Google-Smtp-Source: ABdhPJyoiFDi6yirdb/3UJoHXAC3ipvpCvxxsUUnB7EAzueDX1L1rTCpMDe2+omlMJYQvtJi4D6OBw==
X-Received: by 2002:a2e:a584:: with SMTP id m4mr3656220ljp.247.1608040417011;
        Tue, 15 Dec 2020 05:53:37 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id v7sm214842lfg.9.2020.12.15.05.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 05:53:36 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] ARM: tegra: Fix misplaced tegra_uart_config in decompressor
Date:   Tue, 15 Dec 2020 16:52:22 +0300
Message-Id: <20201215135222.6899-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The tegra_uart_config of the DEBUG_LL code is now placed right at the
start of the .text section after commit which enabled debug output in the
decompressor. Tegra devices are not booting anymore if DEBUG_LL is enabled
since tegra_uart_config data is executes as a code. Fix the misplaced
tegra_uart_config storage by embedding it into the code.

Cc: stable@vger.kernel.org
Fixes: 2596a72d3384 ("ARM: 9009/1: uncompress: Enable debug in head.S")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/include/debug/tegra.S | 54 +++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/arm/include/debug/tegra.S b/arch/arm/include/debug/tegra.S
index 98daa7f48314..7267516db0ba 100644
--- a/arch/arm/include/debug/tegra.S
+++ b/arch/arm/include/debug/tegra.S
@@ -149,7 +149,34 @@
 
 		.align
 99:		.word	.
+#if defined(ZIMAGE)
+		.word	. + 4
+/*
+ * Storage for the state maintained by the macro.
+ *
+ * In the kernel proper, this data is located in arch/arm/mach-tegra/tegra.c.
+ * That's because this header is included from multiple files, and we only
+ * want a single copy of the data. In particular, the UART probing code above
+ * assumes it's running using physical addresses. This is true when this file
+ * is included from head.o, but not when included from debug.o. So we need
+ * to share the probe results between the two copies, rather than having
+ * to re-run the probing again later.
+ *
+ * In the decompressor, we put the storage right here, since common.c
+ * isn't included in the decompressor build. This storage data gets put in
+ * .text even though it's really data, since .data is discarded from the
+ * decompressor. Luckily, .text is writeable in the decompressor, unless
+ * CONFIG_ZBOOT_ROM. That dependency is handled in arch/arm/Kconfig.debug.
+ */
+		/* Debug UART initialization required */
+		.word 1
+		/* Debug UART physical address */
+		.word 0
+		/* Debug UART virtual address */
+		.word 0
+#else
 		.word	tegra_uart_config
+#endif
 		.ltorg
 
 		/* Load previously selected UART address */
@@ -189,30 +216,3 @@
 
 		.macro	waituarttxrdy,rd,rx
 		.endm
-
-/*
- * Storage for the state maintained by the macros above.
- *
- * In the kernel proper, this data is located in arch/arm/mach-tegra/tegra.c.
- * That's because this header is included from multiple files, and we only
- * want a single copy of the data. In particular, the UART probing code above
- * assumes it's running using physical addresses. This is true when this file
- * is included from head.o, but not when included from debug.o. So we need
- * to share the probe results between the two copies, rather than having
- * to re-run the probing again later.
- *
- * In the decompressor, we put the symbol/storage right here, since common.c
- * isn't included in the decompressor build. This symbol gets put in .text
- * even though it's really data, since .data is discarded from the
- * decompressor. Luckily, .text is writeable in the decompressor, unless
- * CONFIG_ZBOOT_ROM. That dependency is handled in arch/arm/Kconfig.debug.
- */
-#if defined(ZIMAGE)
-tegra_uart_config:
-	/* Debug UART initialization required */
-	.word 1
-	/* Debug UART physical address */
-	.word 0
-	/* Debug UART virtual address */
-	.word 0
-#endif
-- 
2.29.2

