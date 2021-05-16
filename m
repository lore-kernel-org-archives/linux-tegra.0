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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B418FC433B4
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:13:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 997E76117A
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:13:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbhEPQOd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 12:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbhEPQOb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 12:14:31 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D184C06174A;
        Sun, 16 May 2021 09:13:15 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 131so4315209ljj.3;
        Sun, 16 May 2021 09:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HXT+IvjVluiKH3yhs5geuypz9CaKXis2aNZdKmGa0hs=;
        b=VpNSp5sTj82VHq1x8rPglSLKU+du/lRZSmzxHj1V/HxCgEfJfmYnmf+qGDTLahPPao
         wVHxHwKTL4n1q9W8Q7+M7nDncVo8Ct8ON9r4uxTvXbCl4/booVH0HY5iXTjaX5t9pwz6
         3zGpf+Q1I4tWj0K1zqFNkpxu9/JMSpBHlSxQ8qnYiAXzah8TKap3qWmnX5Dq0w4sxiIB
         HL4d/vGgBR37Q3Zj/SLOE+qwP4qwdnIDs+mzeuOUvAHL2EHZ/i3ahCwt/NU9y3ORw5HI
         4ti+v9Wt4kUo7G1d7t8M0ug697uiu1mUKSJE4G0R8vrcW9IoIAQ0NoxTsa9qawF2l6V1
         mxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HXT+IvjVluiKH3yhs5geuypz9CaKXis2aNZdKmGa0hs=;
        b=eGr1Ug0zskx0RUSyfyBD8EqAiXm/8EU4VVHIhXpdAPUk0PRPBAoOBdhd6Qo2n9anbJ
         6zhFdqGgQvdt+V2Of2s7gD5N3mHH03trOMqvGKThBUze4A4yfkgvLK+xXhVXLwFMlj5E
         7mNqji+6paMcsSxbEpZjVG6J9Ct76IZ6jwYcofDdxugqViyc+aOY8POXcNB5GtJw9Me7
         IFRvksOQguN4eHRgAD2yGRhbLlrk5mW3CAncH7pwz36Zr78WfwUJkE5Hv4jhEEI8ymbN
         7amHWUzjGimjRsjcEsjggHvyw+ymaTmQfw+zqIfASpusMSEnUu+GmQdqTRQNXASAo20u
         np6g==
X-Gm-Message-State: AOAM533ey14EKMGQsGhd+fR5UOeF8jdz7vhJqVFA362um7dhA9wq449/
        mKL8ZYpQV7s5H/NaZVAcxoA=
X-Google-Smtp-Source: ABdhPJx6RNdiMDuuZKehBL8orzIbs0zFWck1PdaZ1aZE52bMvJm60TTEhiH7Lyjhp4LVu1TOOCgjbA==
X-Received: by 2002:a05:651c:21b:: with SMTP id y27mr43091505ljn.72.1621181594232;
        Sun, 16 May 2021 09:13:14 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id d27sm1712547lfq.290.2021.05.16.09.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 09:13:13 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 1/4] soc/tegra: fuse: Add missing stubs
Date:   Sun, 16 May 2021 19:12:11 +0300
Message-Id: <20210516161214.4693-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516161214.4693-1-digetx@gmail.com>
References: <20210516161214.4693-1-digetx@gmail.com>
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

