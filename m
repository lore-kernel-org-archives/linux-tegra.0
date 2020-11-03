Return-Path: <SRS0=iIVP=EJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D2DC55178
	for <linux-tegra@archiver.kernel.org>; Tue,  3 Nov 2020 15:30:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3AAF22460
	for <linux-tegra@archiver.kernel.org>; Tue,  3 Nov 2020 15:30:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L+rhBqZr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbgKCPam (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 3 Nov 2020 10:30:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728513AbgKCP32 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Nov 2020 10:29:28 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB7CC0613D1
        for <linux-tegra@vger.kernel.org>; Tue,  3 Nov 2020 07:29:28 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id n15so19051211wrq.2
        for <linux-tegra@vger.kernel.org>; Tue, 03 Nov 2020 07:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qv94/ZM3OqIsQyfdq7kooGkcEz2R43AMJBBXVeVvpSo=;
        b=L+rhBqZrPHu1hMk1B22ZMBfbmQcnJ0oxUE5hzZb5mz8WPKFp8Irm6wLb/BoAYAGObo
         tSxaPFW95ouiwZYjUWz278/JMULIRP2VPYu8BVG3gMLhowzjU3m+XAlKZq0sdsuest3Z
         4eyOZt+VL1msl/6VEYJHesJUH30lpWqThKN0ZpxXmW2u6ccKslvvqCohzNBoAs+ineXA
         2BPZb7V9KaRO4cz2r5AI5o9RdGz9AhpUsPQEX6w0jTgQ8t/+3pIBbn6rUsyhqCmwiREp
         XBTgfOHpWv0TYR0TJP2Rqc9tcZG50ye8Mr/me6NBbNksf36o+Eh1YwiIly8uHrviOnHh
         1uaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qv94/ZM3OqIsQyfdq7kooGkcEz2R43AMJBBXVeVvpSo=;
        b=Y5pFR2V32u18w25o8eBJRGJIiMnKD8QofYJaNhtzM+OMT4d5eoALKxc7iM4PFIyWMN
         Z2Qc1d6YZli0u9jZoW7TxJlNb+BVtuUUbXcs8GAP12fBXStTjYnj49A/Gh1mq92sWMXF
         ycUmPvTL1oIOsyET/0EVVANlHozDC4rdTWfeARER0Bfolno1pzec1Uctmyhji0MZfnwd
         TLkFHgpxawIwRxKzgZ071g/AFNhCBRVnkiCbMuZXdfA1T/X1XWpJvQt2HXUVW3BADv8K
         LPXSFCBz1Sv5YKSs3yd+tWKqHjQsYmhpU/m+fJfEwKN7jC8d7kUotoNV1MouXoenXZHr
         A8GQ==
X-Gm-Message-State: AOAM5336L2v+aImsp41cU/zGO27B7+0YrOoKmOMGbjdTUknM8cUmD32+
        579NSy1RZqakjlzPA0Y5z1UzUA==
X-Google-Smtp-Source: ABdhPJyi9NazTE0zqEusEgvnUgW6JGZ1Lvjk0NIvtCyycOcgTQlu920h1Fnh8OqEBdUqfddyju0fqw==
X-Received: by 2002:a5d:46cf:: with SMTP id g15mr28534047wrs.342.1604417367277;
        Tue, 03 Nov 2020 07:29:27 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 07:29:26 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 13/25] soc: tegra: fuse: speedo-tegra124: Remove some set but unused variables
Date:   Tue,  3 Nov 2020 15:28:26 +0000
Message-Id: <20201103152838.1290217-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/soc/tegra/fuse/speedo-tegra124.c: In function ‘tegra124_init_speedo_data’:
 drivers/soc/tegra/fuse/speedo-tegra124.c:105:38: warning: variable ‘soc_iddq_value’ set but not used [-Wunused-but-set-variable]
 drivers/soc/tegra/fuse/speedo-tegra124.c:105:22: warning: variable ‘gpu_iddq_value’ set but not used [-Wunused-but-set-variable]
 drivers/soc/tegra/fuse/speedo-tegra124.c:105:6: warning: variable ‘cpu_iddq_value’ set but not used [-Wunused-but-set-variable]

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/tegra/fuse/speedo-tegra124.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/fuse/speedo-tegra124.c b/drivers/soc/tegra/fuse/speedo-tegra124.c
index bdbf76bb184fa..33747a2e54f3b 100644
--- a/drivers/soc/tegra/fuse/speedo-tegra124.c
+++ b/drivers/soc/tegra/fuse/speedo-tegra124.c
@@ -102,7 +102,6 @@ static void __init rev_sku_to_speedo_ids(struct tegra_sku_info *sku_info,
 void __init tegra124_init_speedo_data(struct tegra_sku_info *sku_info)
 {
 	int i, threshold, cpu_speedo_0_value, soc_speedo_0_value;
-	int cpu_iddq_value, gpu_iddq_value, soc_iddq_value;
 
 	BUILD_BUG_ON(ARRAY_SIZE(cpu_process_speedos) !=
 			THRESHOLD_INDEX_COUNT);
@@ -118,9 +117,9 @@ void __init tegra124_init_speedo_data(struct tegra_sku_info *sku_info)
 
 	soc_speedo_0_value = tegra_fuse_read_early(FUSE_SOC_SPEEDO_0);
 
-	cpu_iddq_value = tegra_fuse_read_early(FUSE_CPU_IDDQ);
-	soc_iddq_value = tegra_fuse_read_early(FUSE_SOC_IDDQ);
-	gpu_iddq_value = tegra_fuse_read_early(FUSE_GPU_IDDQ);
+	tegra_fuse_read_early(FUSE_CPU_IDDQ);
+	tegra_fuse_read_early(FUSE_SOC_IDDQ);
+	tegra_fuse_read_early(FUSE_GPU_IDDQ);
 
 	sku_info->cpu_speedo_value = cpu_speedo_0_value;
 
-- 
2.25.1

