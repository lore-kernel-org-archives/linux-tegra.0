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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C61CC47094
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 16:25:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 700F0613E9
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 16:25:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbhFJQ1A (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Jun 2021 12:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbhFJQ1A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Jun 2021 12:27:00 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C7AC061760;
        Thu, 10 Jun 2021 09:25:03 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id bn21so5761329ljb.1;
        Thu, 10 Jun 2021 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6QucbuFgOMWEGN4VFEHi2XvTZe9V4ccPJlTWt4NGrBo=;
        b=c4MEbVnfe38PR6J6KsIGT0/uYuEW08pi28SwT7rCIxc0BhUFIclOwg1baQFC0IE9QV
         7oumeIFy65yJ6YqYIjSL7Iueq3Utafk2Ag7BUFT/ySjW8ZsDqC8McDqVsYO6oLqriXHl
         H9mD94xABW+u6p3WIyp1DMBmmAg5870Gx3oLwrOZDvb/VQ+ZsVNaZ6KYzrxL+sSZdLYJ
         Kvi4pul5Sz/lBYNTws5taOH6xlzu/WigpzgZVioO+17+GJUtlYGm63v5TDMEwYk4BZ4a
         Ql6Ru3aKjAOo7gmO5ih3Q3gYXENfSO9mmFE59uPHDnOgxZo+axdZIYL//HBI2kFgbKHv
         A/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6QucbuFgOMWEGN4VFEHi2XvTZe9V4ccPJlTWt4NGrBo=;
        b=Yda7mGDrmHYf79DtZrxdyEfN+WyYnxXNJqXcNl2wyETM6hB7U65PP6ignEs7ZPU7qM
         Z3YbROSATR70wfeLMsY2QykFxjea80PwcrB7j6r96li5ewpvmZMAxOPUGCNgtp/U7oh9
         /AQ47ocBzJdZzqL0Lh8RYYr/1F6Vd/NQs2KgBji31f7/oD/9/t9nepIe9YHlo+80zO+x
         mCjK92vLdSyldDJnFwb1h2bs+m5hXEGXQb0AKMvP6u32YVAcxneeLDEXpMUQkpHZ+xSK
         g60Jh1yrh+QXP3FuVFKcTqzd4qGcV8k1ZxScHfe4ZGY9wLjzxsKNocZNyLG/e8vbqbb2
         q1sQ==
X-Gm-Message-State: AOAM5324CrzFvVjUAIDaVkS5JsI9STYg4xphWdqXy0MV+H0BRNjrzieO
        EfFnUt3NkBBnN0PfkE4Z5Fw=
X-Google-Smtp-Source: ABdhPJznV2QY0x8c0KOwBDbjwAj9tpENJVZ19e/DvBB3y8XWi2CuG965bvQ2EMAEG9C60/84ZCqtCA==
X-Received: by 2002:a05:651c:178b:: with SMTP id bn11mr2829559ljb.43.1623342301810;
        Thu, 10 Jun 2021 09:25:01 -0700 (PDT)
Received: from localhost.localdomain (94-29-21-60.dynamic.spd-mgts.ru. [94.29.21.60])
        by smtp.gmail.com with ESMTPSA id g2sm340507lfu.173.2021.06.10.09.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 09:25:01 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1] of: reserved-memory: Add stub for RESERVEDMEM_OF_DECLARE()
Date:   Thu, 10 Jun 2021 19:23:13 +0300
Message-Id: <20210610162313.20942-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The reserved-memory Kconfig could be disabled when drivers are
compile-tested. In this case RESERVEDMEM_OF_DECLARE() produces a
noisy warning about the orphaned __reservedmem_of_table section.
Add the missing stub that fixes the warning. In particular this is
needed for compile-testing of NVIDIA Tegra210 memory driver which
uses reserved-memory.

Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/of.h              | 11 +++++++----
 include/linux/of_reserved_mem.h |  8 ++++++--
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index d8db8d3592fd..9c2e71e202d1 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1329,6 +1329,12 @@ static inline int of_get_available_child_count(const struct device_node *np)
 	return num;
 }
 
+#define _OF_DECLARE_STUB(table, name, compat, fn, fn_type)		\
+	static const struct of_device_id __of_table_##name		\
+		__attribute__((unused))					\
+		 = { .compatible = compat,				\
+		     .data = (fn == (fn_type)NULL) ? fn : fn }
+
 #if defined(CONFIG_OF) && !defined(MODULE)
 #define _OF_DECLARE(table, name, compat, fn, fn_type)			\
 	static const struct of_device_id __of_table_##name		\
@@ -1338,10 +1344,7 @@ static inline int of_get_available_child_count(const struct device_node *np)
 		     .data = (fn == (fn_type)NULL) ? fn : fn  }
 #else
 #define _OF_DECLARE(table, name, compat, fn, fn_type)			\
-	static const struct of_device_id __of_table_##name		\
-		__attribute__((unused))					\
-		 = { .compatible = compat,				\
-		     .data = (fn == (fn_type)NULL) ? fn : fn }
+	_OF_DECLARE_STUB(table, name, compat, fn, fn_type)
 #endif
 
 typedef int (*of_init_fn_2)(struct device_node *, struct device_node *);
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 76e4a0fffba4..4de2a24cadc9 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -27,11 +27,11 @@ struct reserved_mem_ops {
 
 typedef int (*reservedmem_of_init_fn)(struct reserved_mem *rmem);
 
+#ifdef CONFIG_OF_RESERVED_MEM
+
 #define RESERVEDMEM_OF_DECLARE(name, compat, init)			\
 	_OF_DECLARE(reservedmem, name, compat, init, reservedmem_of_init_fn)
 
-#ifdef CONFIG_OF_RESERVED_MEM
-
 int of_reserved_mem_device_init_by_idx(struct device *dev,
 				       struct device_node *np, int idx);
 int of_reserved_mem_device_init_by_name(struct device *dev,
@@ -41,6 +41,10 @@ void of_reserved_mem_device_release(struct device *dev);
 
 struct reserved_mem *of_reserved_mem_lookup(struct device_node *np);
 #else
+
+#define RESERVEDMEM_OF_DECLARE(name, compat, init)			\
+	_OF_DECLARE_STUB(reservedmem, name, compat, init, reservedmem_of_init_fn)
+
 static inline int of_reserved_mem_device_init_by_idx(struct device *dev,
 					struct device_node *np, int idx)
 {
-- 
2.30.2

