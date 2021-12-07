Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665EEC433F5
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Dec 2021 15:08:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233968AbhLGPLe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Dec 2021 10:11:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233627AbhLGPLe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Dec 2021 10:11:34 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EECA2C061574;
        Tue,  7 Dec 2021 07:08:03 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id a9so30063586wrr.8;
        Tue, 07 Dec 2021 07:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/RhMDsMYpJArj85ePJZA76IVQF/IHDWU7SNFhbUBUTI=;
        b=dgw2zeSVUupAmUvu1P8BZSoOduMra+cMYNjWSPg35k5/FeE2+qb8O2qTlzJFjER7/F
         WK3qsTV3dVwOuGZHr0DjH365AD0B+y7oTBAlVyRMSkNL7aVY8yZKTSh2F/bVKc/IXsYO
         yk3Bc3Hqb5weMkspXuQoylVp7yz2vV7ne/MhXNlVbnCIz7vi7J/m/BAWy6/ceY+Sr8m8
         A/95Z+KW/FGoh1xKpfwkzyGEijHYLE+6nPiXVT6DKLA5fVF7v0HF1WGWl2p6bu3ICAe2
         g1anFudrzryE92MWnn8TIRbyRYsACTkUDtDgwenkml4wBr+AuFX/mXE4VItZxdWlFH8S
         oz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/RhMDsMYpJArj85ePJZA76IVQF/IHDWU7SNFhbUBUTI=;
        b=yeDWv665tyrZQKeNm6YXBXIiR7VHDgiFajOsdQEbt3AERLq4OIwzz3sGoSGyj30+R+
         M9WA8W1HsWHtT3d3DkXfw9kIy91f9x9iBvoG2jDxDr3Rh8d8MhGZoj72ftzGXKKywc4M
         bfdtTVWRk+43coedKXLp0FPtQwQDBGjDgX7c9mqo8ydTBYNtxqxJEmG988D8P0kCA3po
         Q1bf/7OabNhkW101i35KELVVgPzQlEn+E7hKWRWNjQPwPH14IfhH4pajmrDwEdD2aLg9
         erB8pINPy7+mOmKghFp8qbfu74LfwMcsWt/Tpk1fZMq4U/u532/7bdM/fe3v8cXI9ntN
         z9gg==
X-Gm-Message-State: AOAM530D9D8FqXnd8yIq9OU4os5O9xdR/cCVzUpIoT6Oe5fDXaQdtws6
        iyrSBBAgkPxa4CBC0qfdTStBIc0ZY+ohug==
X-Google-Smtp-Source: ABdhPJwCsE4EfZj1BDtABSuSPH0m8azfXayNzV69e+L8Do5HH43Um319dVT5lEsQVeA/KutJ30YXCg==
X-Received: by 2002:a5d:52c3:: with SMTP id r3mr52542133wrv.115.1638889682511;
        Tue, 07 Dec 2021 07:08:02 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id z18sm14633280wrq.11.2021.12.07.07.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 07:08:01 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] arm64: perf: Support Denver and Carmel PMUs
Date:   Tue,  7 Dec 2021 16:07:45 +0100
Message-Id: <20211207150746.444478-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211207150746.444478-1-thierry.reding@gmail.com>
References: <20211207150746.444478-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add support for the NVIDIA Denver and Carmel PMUs using the generic
PMUv3 event map for now.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/kernel/perf_event.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
index b4044469527e..8c8cf369c450 100644
--- a/arch/arm64/kernel/perf_event.c
+++ b/arch/arm64/kernel/perf_event.c
@@ -1247,6 +1247,18 @@ static int armv8_vulcan_pmu_init(struct arm_pmu *cpu_pmu)
 				       armv8_vulcan_map_event);
 }
 
+static int armv8_denver_pmu_init(struct arm_pmu *cpu_pmu)
+{
+	return armv8_pmu_init_nogroups(cpu_pmu, "armv8_nvidia_denver",
+				       armv8_pmuv3_map_event);
+}
+
+static int armv8_carmel_pmu_init(struct arm_pmu *cpu_pmu)
+{
+	return armv8_pmu_init_nogroups(cpu_pmu, "armv8_nvidia_carmel",
+				       armv8_pmuv3_map_event);
+}
+
 static const struct of_device_id armv8_pmu_of_device_ids[] = {
 	{.compatible = "arm,armv8-pmuv3",	.data = armv8_pmuv3_init},
 	{.compatible = "arm,cortex-a34-pmu",	.data = armv8_a34_pmu_init},
@@ -1265,6 +1277,8 @@ static const struct of_device_id armv8_pmu_of_device_ids[] = {
 	{.compatible = "arm,neoverse-n1-pmu",	.data = armv8_n1_pmu_init},
 	{.compatible = "cavium,thunder-pmu",	.data = armv8_thunder_pmu_init},
 	{.compatible = "brcm,vulcan-pmu",	.data = armv8_vulcan_pmu_init},
+	{.compatible = "nvidia,denver-pmu",	.data = armv8_denver_pmu_init},
+	{.compatible = "nvidia,carmel-pmu",	.data = armv8_carmel_pmu_init},
 	{},
 };
 
-- 
2.33.1

