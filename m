Return-Path: <SRS0=iIVP=EJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EF7C2D0A3
	for <linux-tegra@archiver.kernel.org>; Tue,  3 Nov 2020 15:30:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 914BC223C7
	for <linux-tegra@archiver.kernel.org>; Tue,  3 Nov 2020 15:30:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qkv/V/cs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728659AbgKCP3o (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 3 Nov 2020 10:29:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728657AbgKCP3n (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Nov 2020 10:29:43 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26E2C0617A6
        for <linux-tegra@vger.kernel.org>; Tue,  3 Nov 2020 07:29:42 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id g12so18980613wrp.10
        for <linux-tegra@vger.kernel.org>; Tue, 03 Nov 2020 07:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MFpjk4zX/2wadqqqsM0maoUWA+IXg/GlxrDq3yCnAFA=;
        b=Qkv/V/csOn9qV3pYb6lVPgWvEdd3Ta8GDAq86IVNAUc3c0jR6XNImUocikmt93rRg2
         h1Gyw2dnX6+eku//9wJYPUfZDgdiZRw8yMNfhxwLvZyJR7/rgIpW8JHwUhGw+JQ+/01l
         JRpT/oiFbltYm10ijlqHJ5+3lKj2M+nEQSvVXJe+ieToN2rbOJSYzmNLewUITApjxA99
         KI71SXemg3k+zgI3lASOaj//Tf42Pjyc2/Da0Hc3n6eyPIypsQtkyzSNoDFQ8TpgLJfW
         O2nf19pS/jbIlnE9RfqOtyWG3BpGwjS5NSWttgumNXbln287Z4zPVmVQChWlnaCc47Uy
         Wm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MFpjk4zX/2wadqqqsM0maoUWA+IXg/GlxrDq3yCnAFA=;
        b=PS2VzxFrJs/04+2USDSKNtcUaIvPmF3Cz03tMzqwEj8Gas9hxKVJ/O7BXWx+JwFIDF
         EDdhkcyXjPQ1TrdDWZqdHradR7dAlMTn6X3aWX3MNTxA1qNoLDfCeK30bEhotvLzGB4A
         5/610MWNEai8v2pTO1nHsLQHIU8o1YbHzDs05bpRriMhnpOUeBupZWAj+c2qjhNZTKlI
         WcvtVGjaZuX1l2HdYrJeXgwmSxQJw9ZGh/YImLVGg2xufXAfdxIo1WVr68tegCRLpN/x
         ihaEq45m4snfLe6tDLSe5arFdB6oMJDifF3sRavsbp6zwWae0Vtk8vnGJjmzVUTdpsPo
         4oqA==
X-Gm-Message-State: AOAM532I7SULlxvv1vbRAqx+GyE+ni5xgQMcFLMuv+9j+QxmZYZeiVij
        iq1YpxWBAshVMWkNSWIoxCTNyg==
X-Google-Smtp-Source: ABdhPJyApWsuQrwG87jrLEV9umSx+qWrIi0rU75XA05LIQc9vRCphOrnl1PsoRjfi3qvIDo9fZrhSA==
X-Received: by 2002:a5d:664b:: with SMTP id f11mr25450929wrw.195.1604417381575;
        Tue, 03 Nov 2020 07:29:41 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 07:29:40 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 24/25] soc: tegra: fuse: speedo-tegra210: Remove a group of set but unused variables
Date:   Tue,  3 Nov 2020 15:28:37 +0000
Message-Id: <20201103152838.1290217-25-lee.jones@linaro.org>
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

 drivers/soc/tegra/fuse/speedo-tegra210.c: In function ‘tegra210_init_speedo_data’:
 drivers/soc/tegra/fuse/speedo-tegra210.c:105:56: warning: variable ‘soc_iddq’ set but not used [-Wunused-but-set-variable]
 drivers/soc/tegra/fuse/speedo-tegra210.c:105:46: warning: variable ‘gpu_iddq’ set but not used [-Wunused-but-set-variable]
 drivers/soc/tegra/fuse/speedo-tegra210.c:105:36: warning: variable ‘cpu_iddq’ set but not used [-Wunused-but-set-variable]

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/tegra/fuse/speedo-tegra210.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/tegra/fuse/speedo-tegra210.c
index 70d3f6e1aa33d..7f2cc09a00bbf 100644
--- a/drivers/soc/tegra/fuse/speedo-tegra210.c
+++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
@@ -102,7 +102,7 @@ static int get_process_id(int value, const u32 *speedos, unsigned int num)
 
 void __init tegra210_init_speedo_data(struct tegra_sku_info *sku_info)
 {
-	int cpu_speedo[3], soc_speedo[3], cpu_iddq, gpu_iddq, soc_iddq;
+	int cpu_speedo[3], soc_speedo[3];
 	unsigned int index;
 	u8 speedo_revision;
 
@@ -122,9 +122,9 @@ void __init tegra210_init_speedo_data(struct tegra_sku_info *sku_info)
 	soc_speedo[1] = tegra_fuse_read_early(FUSE_SOC_SPEEDO_1);
 	soc_speedo[2] = tegra_fuse_read_early(FUSE_SOC_SPEEDO_2);
 
-	cpu_iddq = tegra_fuse_read_early(FUSE_CPU_IDDQ) * 4;
-	soc_iddq = tegra_fuse_read_early(FUSE_SOC_IDDQ) * 4;
-	gpu_iddq = tegra_fuse_read_early(FUSE_GPU_IDDQ) * 5;
+	tegra_fuse_read_early(FUSE_CPU_IDDQ);
+	tegra_fuse_read_early(FUSE_SOC_IDDQ);
+	tegra_fuse_read_early(FUSE_GPU_IDDQ);
 
 	/*
 	 * Determine CPU, GPU and SoC speedo values depending on speedo fusing
-- 
2.25.1

