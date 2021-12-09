Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA58C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243080AbhLIRiI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbhLIRiI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:08 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445DFC061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:34 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id t18so10937171wrg.11
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pvTF25sgid8OcxH/pXYwnx/vpyceYEz04DhflKfeokw=;
        b=S/Zfn4k/D/C6EyaegtEOEaptoaOXgeEI8B8W3NqjV/BxzmLMjqma2cU3Qu0bLYZx9m
         jdS0HFwPLvw748p34hVMd+vo9EkhC6zdSlhPmmujKh8opg+Rfvk/2/mWYgxY8TyKOBvr
         7zGr5YXD/iHgfXETLBj9cWfraC8hq9cWvRUGJ5n1smcVp+A/EJSjAcu30NwwaOoq/lHz
         LFD91Sdcw8LIqobZjB1gi6s398YFmiGNepkX34BXfRUdHuqA597feuOVWOMdX083mqXE
         ZpcT5kNKHiu5PHKFxJdsIjlEU5mKX0RkTObjTdD68u3wF7BudEIGhbySS4S+PQ5ODTb3
         AL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pvTF25sgid8OcxH/pXYwnx/vpyceYEz04DhflKfeokw=;
        b=FOa3DcBlR5cYwJWvyVAq85PCmL2qq4UPTljGok8+Wa5T2C2hRCOcLJPmNo7UbStPaL
         /+JNq3ui4KoXU2XfwZhxi+X1tPmXJaF9/FAg8CJ6oFGLuCfH85iqTGQjUSqPJH6Ayv90
         1xJljct023UFKuSfpaD0BtoUfAUGqhTe3tCKrt/ALDbmrWFnOP8mIy0WkwpucgopIwIl
         ycpxukhijKycVjE7yAKJYrezobu9hXgthEAJSuEW0iIy3DJOqEiibedE8cU7zxDM6BHP
         G7ySwxk2I0iFt7aUWI8gEZgdh9d0e5BOPBA8vVT26GgHN24HkX0WUiuKMcuRe8l7iCmH
         cRFQ==
X-Gm-Message-State: AOAM533kNMEfDrFzinKvXqH8Iist/2C9S0GjrU4R7+N7iQy2uvwqEjqz
        gTS6wItVU8wn4NqKvWwZYP0=
X-Google-Smtp-Source: ABdhPJwz5py/u4qeZtFKiwb+iKgnI+LVQJKWnwlvQGDmO1yysG4nqnUA0Wajmqt/GuKNnOp6g6jN3A==
X-Received: by 2002:a05:6000:2a2:: with SMTP id l2mr8010545wry.110.1639071272334;
        Thu, 09 Dec 2021 09:34:32 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id z6sm540320wmp.9.2021.12.09.09.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:31 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 12/25] ARM: tegra: Do not use unit-address for OPP nodes
Date:   Thu,  9 Dec 2021 18:33:43 +0100
Message-Id: <20211209173356.618460-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

OPP nodes do not have a "reg" property and therefore shouldn't have a
unit-address. Instead, use a dash instead of the '@' and ',' characters
to allow validation of the nodes against the DT schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../boot/dts/tegra124-peripherals-opp.dtsi    | 142 ++++++++---------
 .../boot/dts/tegra20-cpu-opp-microvolt.dtsi   |  82 +++++-----
 arch/arm/boot/dts/tegra20-cpu-opp.dtsi        |  82 +++++-----
 .../arm/boot/dts/tegra20-peripherals-opp.dtsi |  36 ++---
 .../boot/dts/tegra30-cpu-opp-microvolt.dtsi   | 144 +++++++++---------
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi        | 144 +++++++++---------
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 130 ++++++++--------
 7 files changed, 382 insertions(+), 378 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
index 781ac8601030..66ffb7f8aaa7 100644
--- a/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
@@ -1,421 +1,423 @@
 // SPDX-License-Identifier: GPL-2.0
 
 / {
-	emc_icc_dvfs_opp_table: emc-dvfs-opp-table {
+	/* EMC DVFS OPP table */
+	emc_icc_dvfs_opp_table: opp-table-dvfs0 {
 		compatible = "operating-points-v2";
 
-		opp@12750000,800 {
+		opp-12750000-800 {
 			opp-microvolt = <800000 800000 1150000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x0003>;
 		};
 
-		opp@12750000,950 {
+		opp-12750000-950 {
 			opp-microvolt = <950000 950000 1150000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@12750000,1050 {
+		opp-12750000-1050 {
 			opp-microvolt = <1050000 1050000 1150000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x0010>;
 		};
 
-		opp@12750000,1110 {
+		opp-12750000-1110 {
 			opp-microvolt = <1110000 1110000 1150000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x0004>;
 		};
 
-		opp@20400000,800 {
+		opp-20400000-800 {
 			opp-microvolt = <800000 800000 1150000>;
 			opp-hz = /bits/ 64 <20400000>;
 			opp-supported-hw = <0x0003>;
 		};
 
-		opp@20400000,950 {
+		opp-20400000-950 {
 			opp-microvolt = <950000 950000 1150000>;
 			opp-hz = /bits/ 64 <20400000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@20400000,1050 {
+		opp-20400000-1050 {
 			opp-microvolt = <1050000 1050000 1150000>;
 			opp-hz = /bits/ 64 <20400000>;
 			opp-supported-hw = <0x0010>;
 		};
 
-		opp@20400000,1110 {
+		opp-20400000-1110 {
 			opp-microvolt = <1110000 1110000 1150000>;
 			opp-hz = /bits/ 64 <20400000>;
 			opp-supported-hw = <0x0004>;
 		};
 
-		opp@40800000,800 {
+		opp-40800000-800 {
 			opp-microvolt = <800000 800000 1150000>;
 			opp-hz = /bits/ 64 <40800000>;
 			opp-supported-hw = <0x0003>;
 		};
 
-		opp@40800000,950 {
+		opp-40800000-950 {
 			opp-microvolt = <950000 950000 1150000>;
 			opp-hz = /bits/ 64 <40800000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@40800000,1050 {
+		opp-40800000-1050 {
 			opp-microvolt = <1050000 1050000 1150000>;
 			opp-hz = /bits/ 64 <40800000>;
 			opp-supported-hw = <0x0010>;
 		};
 
-		opp@40800000,1110 {
+		opp-40800000-1110 {
 			opp-microvolt = <1110000 1110000 1150000>;
 			opp-hz = /bits/ 64 <40800000>;
 			opp-supported-hw = <0x0004>;
 		};
 
-		opp@68000000,800 {
+		opp-68000000-800 {
 			opp-microvolt = <800000 800000 1150000>;
 			opp-hz = /bits/ 64 <68000000>;
 			opp-supported-hw = <0x0003>;
 		};
 
-		opp@68000000,950 {
+		opp-68000000-950 {
 			opp-microvolt = <950000 950000 1150000>;
 			opp-hz = /bits/ 64 <68000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@68000000,1050 {
+		opp-68000000-1050 {
 			opp-microvolt = <1050000 1050000 1150000>;
 			opp-hz = /bits/ 64 <68000000>;
 			opp-supported-hw = <0x0010>;
 		};
 
-		opp@68000000,1110 {
+		opp-68000000-1110 {
 			opp-microvolt = <1110000 1110000 1150000>;
 			opp-hz = /bits/ 64 <68000000>;
 			opp-supported-hw = <0x0004>;
 		};
 
-		opp@102000000,800 {
+		opp-102000000-800 {
 			opp-microvolt = <800000 800000 1150000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x0003>;
 		};
 
-		opp@102000000,950 {
+		opp-102000000-950 {
 			opp-microvolt = <950000 950000 1150000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@102000000,1050 {
+		opp-102000000-1050 {
 			opp-microvolt = <1050000 1050000 1150000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x0010>;
 		};
 
-		opp@102000000,1110 {
+		opp-102000000-1110 {
 			opp-microvolt = <1110000 1110000 1150000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x0004>;
 		};
 
-		opp@204000000,800 {
+		opp-204000000-800 {
 			opp-microvolt = <800000 800000 1150000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0003>;
 			opp-suspend;
 		};
 
-		opp@204000000,950 {
+		opp-204000000-950 {
 			opp-microvolt = <950000 950000 1150000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0008>;
 			opp-suspend;
 		};
 
-		opp@204000000,1050 {
+		opp-204000000-1050 {
 			opp-microvolt = <1050000 1050000 1150000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0010>;
 			opp-suspend;
 		};
 
-		opp@204000000,1110 {
+		opp-204000000-1110 {
 			opp-microvolt = <1110000 1110000 1150000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0004>;
 			opp-suspend;
 		};
 
-		opp@264000000,800 {
+		opp-264000000-800 {
 			opp-microvolt = <800000 800000 1150000>;
 			opp-hz = /bits/ 64 <264000000>;
 			opp-supported-hw = <0x0003>;
 		};
 
-		opp@264000000,950 {
+		opp-264000000-950 {
 			opp-microvolt = <950000 950000 1150000>;
 			opp-hz = /bits/ 64 <264000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@264000000,1050 {
+		opp-264000000-1050 {
 			opp-microvolt = <1050000 1050000 1150000>;
 			opp-hz = /bits/ 64 <264000000>;
 			opp-supported-hw = <0x0010>;
 		};
 
-		opp@264000000,1110 {
+		opp-264000000-1110 {
 			opp-microvolt = <1110000 1110000 1150000>;
 			opp-hz = /bits/ 64 <264000000>;
 			opp-supported-hw = <0x0004>;
 		};
 
-		opp@300000000,850 {
+		opp-300000000-850 {
 			opp-microvolt = <850000 850000 1150000>;
 			opp-hz = /bits/ 64 <300000000>;
 			opp-supported-hw = <0x0003>;
 		};
 
-		opp@300000000,950 {
+		opp-300000000-950 {
 			opp-microvolt = <950000 950000 1150000>;
 			opp-hz = /bits/ 64 <300000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@300000000,1050 {
+		opp-300000000-1050 {
 			opp-microvolt = <1050000 1050000 1150000>;
 			opp-hz = /bits/ 64 <300000000>;
 			opp-supported-hw = <0x0010>;
 		};
 
-		opp@300000000,1110 {
+		opp-300000000-1110 {
 			opp-microvolt = <1110000 1110000 1150000>;
 			opp-hz = /bits/ 64 <300000000>;
 			opp-supported-hw = <0x0004>;
 		};
 
-		opp@348000000,850 {
+		opp-348000000-850 {
 			opp-microvolt = <850000 850000 1150000>;
 			opp-hz = /bits/ 64 <348000000>;
 			opp-supported-hw = <0x0003>;
 		};
 
-		opp@348000000,950 {
+		opp-348000000-950 {
 			opp-microvolt = <950000 950000 1150000>;
 			opp-hz = /bits/ 64 <348000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@348000000,1050 {
+		opp-348000000-1050 {
 			opp-microvolt = <1050000 1050000 1150000>;
 			opp-hz = /bits/ 64 <348000000>;
 			opp-supported-hw = <0x0010>;
 		};
 
-		opp@348000000,1110 {
+		opp-348000000-1110 {
 			opp-microvolt = <1110000 1110000 1150000>;
 			opp-hz = /bits/ 64 <348000000>;
 			opp-supported-hw = <0x0004>;
 		};
 
-		opp@396000000,950 {
+		opp-396000000-950 {
 			opp-microvolt = <950000 950000 1150000>;
 			opp-hz = /bits/ 64 <396000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@396000000,1000 {
+		opp-396000000-1000 {
 			opp-microvolt = <1000000 1000000 1150000>;
 			opp-hz = /bits/ 64 <396000000>;
 			opp-supported-hw = <0x0003>;
 		};
 
-		opp@396000000,1050 {
+		opp-396000000-1050 {
 			opp-microvolt = <1050000 1050000 1150000>;
 			opp-hz = /bits/ 64 <396000000>;
 			opp-supported-hw = <0x0010>;
 		};
 
-		opp@396000000,1110 {
+		opp-396000000-1110 {
 			opp-microvolt = <1110000 1110000 1150000>;
 			opp-hz = /bits/ 64 <396000000>;
 			opp-supported-hw = <0x0004>;
 		};
 
-		opp@528000000,950 {
+		opp-528000000-950 {
 			opp-microvolt = <950000 950000 1150000>;
 			opp-hz = /bits/ 64 <528000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@528000000,1000 {
+		opp-528000000-1000 {
 			opp-microvolt = <1000000 1000000 1150000>;
 			opp-hz = /bits/ 64 <528000000>;
 			opp-supported-hw = <0x0003>;
 		};
 
-		opp@528000000,1050 {
+		opp-528000000-1050 {
 			opp-microvolt = <1050000 1050000 1150000>;
 			opp-hz = /bits/ 64 <528000000>;
 			opp-supported-hw = <0x0010>;
 		};
 
-		opp@528000000,1110 {
+		opp-528000000-1110 {
 			opp-microvolt = <1110000 1110000 1150000>;
 			opp-hz = /bits/ 64 <528000000>;
 			opp-supported-hw = <0x0004>;
 		};
 
-		opp@600000000,950 {
+		opp-600000000-950 {
 			opp-microvolt = <950000 950000 1150000>;
 			opp-hz = /bits/ 64 <600000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@600000000,1000 {
+		opp-600000000-1000 {
 			opp-microvolt = <1000000 1000000 1150000>;
 			opp-hz = /bits/ 64 <600000000>;
 			opp-supported-hw = <0x0003>;
 		};
 
-		opp@600000000,1050 {
+		opp-600000000-1050 {
 			opp-microvolt = <1050000 1050000 1150000>;
 			opp-hz = /bits/ 64 <600000000>;
 			opp-supported-hw = <0x0010>;
 		};
 
-		opp@600000000,1110 {
+		opp-600000000-1110 {
 			opp-microvolt = <1110000 1110000 1150000>;
 			opp-hz = /bits/ 64 <600000000>;
 			opp-supported-hw = <0x0004>;
 		};
 
-		opp@792000000,1000 {
+		opp-792000000-1000 {
 			opp-microvolt = <1000000 1000000 1150000>;
 			opp-hz = /bits/ 64 <792000000>;
 			opp-supported-hw = <0x000B>;
 		};
 
-		opp@792000000,1050 {
+		opp-792000000-1050 {
 			opp-microvolt = <1050000 1050000 1150000>;
 			opp-hz = /bits/ 64 <792000000>;
 			opp-supported-hw = <0x0010>;
 		};
 
-		opp@792000000,1110 {
+		opp-792000000-1110 {
 			opp-microvolt = <1110000 1110000 1150000>;
 			opp-hz = /bits/ 64 <792000000>;
 			opp-supported-hw = <0x0004>;
 		};
 
-		opp@924000000,1100 {
+		opp-924000000-1100 {
 			opp-microvolt = <1100000 1100000 1150000>;
 			opp-hz = /bits/ 64 <924000000>;
 			opp-supported-hw = <0x0013>;
 		};
 
-		opp@1200000000,1100 {
+		opp-1200000000-1100 {
 			opp-microvolt = <1100000 1100000 1150000>;
 			opp-hz = /bits/ 64 <1200000000>;
 			opp-supported-hw = <0x0003>;
 		};
 	};
 
-	emc_bw_dfs_opp_table: emc-bandwidth-opp-table {
+	/* EMC bandwidth OPP table */
+	emc_bw_dfs_opp_table: opp-table-dvfs1 {
 		compatible = "operating-points-v2";
 
-		opp@12750000 {
+		opp-12750000 {
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x001F>;
 			opp-peak-kBps = <204000>;
 		};
 
-		opp@20400000 {
+		opp-20400000 {
 			opp-hz = /bits/ 64 <20400000>;
 			opp-supported-hw = <0x001F>;
 			opp-peak-kBps = <326400>;
 		};
 
-		opp@40800000 {
+		opp-40800000 {
 			opp-hz = /bits/ 64 <40800000>;
 			opp-supported-hw = <0x001F>;
 			opp-peak-kBps = <652800>;
 		};
 
-		opp@68000000 {
+		opp-68000000 {
 			opp-hz = /bits/ 64 <68000000>;
 			opp-supported-hw = <0x001F>;
 			opp-peak-kBps = <1088000>;
 		};
 
-		opp@102000000 {
+		opp-102000000 {
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x001F>;
 			opp-peak-kBps = <1632000>;
 		};
 
-		opp@204000000 {
+		opp-204000000 {
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x001F>;
 			opp-peak-kBps = <3264000>;
 			opp-suspend;
 		};
 
-		opp@264000000 {
+		opp-264000000 {
 			opp-hz = /bits/ 64 <264000000>;
 			opp-supported-hw = <0x001F>;
 			opp-peak-kBps = <4224000>;
 		};
 
-		opp@300000000 {
+		opp-300000000 {
 			opp-hz = /bits/ 64 <300000000>;
 			opp-supported-hw = <0x001F>;
 			opp-peak-kBps = <4800000>;
 		};
 
-		opp@348000000 {
+		opp-348000000 {
 			opp-hz = /bits/ 64 <348000000>;
 			opp-supported-hw = <0x001F>;
 			opp-peak-kBps = <5568000>;
 		};
 
-		opp@396000000 {
+		opp-396000000 {
 			opp-hz = /bits/ 64 <396000000>;
 			opp-supported-hw = <0x001F>;
 			opp-peak-kBps = <6336000>;
 		};
 
-		opp@528000000 {
+		opp-528000000 {
 			opp-hz = /bits/ 64 <528000000>;
 			opp-supported-hw = <0x001F>;
 			opp-peak-kBps = <8448000>;
 		};
 
-		opp@600000000 {
+		opp-600000000 {
 			opp-hz = /bits/ 64 <600000000>;
 			opp-supported-hw = <0x001F>;
 			opp-peak-kBps = <9600000>;
 		};
 
-		opp@792000000 {
+		opp-792000000 {
 			opp-hz = /bits/ 64 <792000000>;
 			opp-supported-hw = <0x001F>;
 			opp-peak-kBps = <12672000>;
 		};
 
-		opp@924000000 {
+		opp-924000000 {
 			opp-hz = /bits/ 64 <924000000>;
 			opp-supported-hw = <0x0013>;
 			opp-peak-kBps = <14784000>;
 		};
 
-		opp@1200000000 {
+		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
 			opp-supported-hw = <0x0003>;
 			opp-peak-kBps = <19200000>;
diff --git a/arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi b/arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi
index 6f3e8c5fc5f0..7330c1b13d93 100644
--- a/arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi
+++ b/arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi
@@ -1,164 +1,164 @@
 // SPDX-License-Identifier: GPL-2.0
 
 / {
-	cpu0_opp_table: cpu_opp_table0 {
-		opp@216000000,750 {
+	cpu0_opp_table: opp-table-cpu0 {
+		opp-216000000-750 {
 			opp-microvolt = <750000 750000 1125000>;
 		};
 
-		opp@216000000,800 {
+		opp-216000000-800 {
 			opp-microvolt = <800000 800000 1125000>;
 		};
 
-		opp@312000000,750 {
+		opp-312000000-750 {
 			opp-microvolt = <750000 750000 1125000>;
 		};
 
-		opp@312000000,800 {
+		opp-312000000-800 {
 			opp-microvolt = <800000 800000 1125000>;
 		};
 
-		opp@456000000,750 {
+		opp-456000000-750 {
 			opp-microvolt = <750000 750000 1125000>;
 		};
 
-		opp@456000000,800 {
+		opp-456000000-800 {
 			opp-microvolt = <800000 800000 1125000>;
 		};
 
-		opp@456000000,825 {
+		opp-456000000-825 {
 			opp-microvolt = <825000 825000 1125000>;
 		};
 
-		opp@608000000,750 {
+		opp-608000000-750 {
 			opp-microvolt = <750000 750000 1125000>;
 		};
 
-		opp@608000000,800 {
+		opp-608000000-800 {
 			opp-microvolt = <800000 800000 1125000>;
 		};
 
-		opp@608000000,825 {
+		opp-608000000-825 {
 			opp-microvolt = <825000 825000 1125000>;
 		};
 
-		opp@608000000,850 {
+		opp-608000000-850 {
 			opp-microvolt = <850000 850000 1125000>;
 		};
 
-		opp@608000000,900 {
+		opp-608000000-900 {
 			opp-microvolt = <900000 900000 1125000>;
 		};
 
-		opp@760000000,775 {
+		opp-760000000-775 {
 			opp-microvolt = <775000 775000 1125000>;
 		};
 
-		opp@760000000,800 {
+		opp-760000000-800 {
 			opp-microvolt = <800000 800000 1125000>;
 		};
 
-		opp@760000000,850 {
+		opp-760000000-850 {
 			opp-microvolt = <850000 850000 1125000>;
 		};
 
-		opp@760000000,875 {
+		opp-760000000-875 {
 			opp-microvolt = <875000 875000 1125000>;
 		};
 
-		opp@760000000,900 {
+		opp-760000000-900 {
 			opp-microvolt = <900000 900000 1125000>;
 		};
 
-		opp@760000000,975 {
+		opp-760000000-975 {
 			opp-microvolt = <975000 975000 1125000>;
 		};
 
-		opp@816000000,800 {
+		opp-816000000-800 {
 			opp-microvolt = <800000 800000 1125000>;
 		};
 
-		opp@816000000,850 {
+		opp-816000000-850 {
 			opp-microvolt = <850000 850000 1125000>;
 		};
 
-		opp@816000000,875 {
+		opp-816000000-875 {
 			opp-microvolt = <875000 875000 1125000>;
 		};
 
-		opp@816000000,950 {
+		opp-816000000-950 {
 			opp-microvolt = <950000 950000 1125000>;
 		};
 
-		opp@816000000,1000 {
+		opp-816000000-1000 {
 			opp-microvolt = <1000000 1000000 1125000>;
 		};
 
-		opp@912000000,850 {
+		opp-912000000-850 {
 			opp-microvolt = <850000 850000 1125000>;
 		};
 
-		opp@912000000,900 {
+		opp-912000000-900 {
 			opp-microvolt = <900000 900000 1125000>;
 		};
 
-		opp@912000000,925 {
+		opp-912000000-925 {
 			opp-microvolt = <925000 925000 1125000>;
 		};
 
-		opp@912000000,950 {
+		opp-912000000-950 {
 			opp-microvolt = <950000 950000 1125000>;
 		};
 
-		opp@912000000,1000 {
+		opp-912000000-1000 {
 			opp-microvolt = <1000000 1000000 1125000>;
 		};
 
-		opp@912000000,1050 {
+		opp-912000000-1050 {
 			opp-microvolt = <1050000 1050000 1125000>;
 		};
 
-		opp@1000000000,875 {
+		opp-1000000000-875 {
 			opp-microvolt = <875000 875000 1125000>;
 		};
 
-		opp@1000000000,900 {
+		opp-1000000000-900 {
 			opp-microvolt = <900000 900000 1125000>;
 		};
 
-		opp@1000000000,950 {
+		opp-1000000000-950 {
 			opp-microvolt = <950000 950000 1125000>;
 		};
 
-		opp@1000000000,975 {
+		opp-1000000000-975 {
 			opp-microvolt = <975000 975000 1125000>;
 		};
 
-		opp@1000000000,1000 {
+		opp-1000000000-1000 {
 			opp-microvolt = <1000000 1000000 1125000>;
 		};
 
-		opp@1000000000,1025 {
+		opp-1000000000-1025 {
 			opp-microvolt = <1025000 1025000 1125000>;
 		};
 
-		opp@1000000000,1100 {
+		opp-1000000000-1100 {
 			opp-microvolt = <1100000 1100000 1125000>;
 		};
 
-		opp@1200000000,1000 {
+		opp-1200000000-1000 {
 			opp-microvolt = <1000000 1000000 1125000>;
 		};
 
-		opp@1200000000,1050 {
+		opp-1200000000-1050 {
 			opp-microvolt = <1050000 1050000 1125000>;
 		};
 
-		opp@1200000000,1100 {
+		opp-1200000000-1100 {
 			opp-microvolt = <1100000 1100000 1125000>;
 		};
 
-		opp@1200000000,1125 {
+		opp-1200000000-1125 {
 			opp-microvolt = <1125000 1125000 1125000>;
 		};
 	};
diff --git a/arch/arm/boot/dts/tegra20-cpu-opp.dtsi b/arch/arm/boot/dts/tegra20-cpu-opp.dtsi
index 135de316383b..47c8e78ca958 100644
--- a/arch/arm/boot/dts/tegra20-cpu-opp.dtsi
+++ b/arch/arm/boot/dts/tegra20-cpu-opp.dtsi
@@ -1,250 +1,250 @@
 // SPDX-License-Identifier: GPL-2.0
 
 / {
-	cpu0_opp_table: cpu_opp_table0 {
+	cpu0_opp_table: opp-table-cpu0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
-		opp@216000000,750 {
+		opp-216000000-750 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x0F 0x0003>;
 			opp-hz = /bits/ 64 <216000000>;
 			opp-suspend;
 		};
 
-		opp@216000000,800 {
+		opp-216000000-800 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x0F 0x0004>;
 			opp-hz = /bits/ 64 <216000000>;
 			opp-suspend;
 		};
 
-		opp@312000000,750 {
+		opp-312000000-750 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x0F 0x0003>;
 			opp-hz = /bits/ 64 <312000000>;
 		};
 
-		opp@312000000,800 {
+		opp-312000000-800 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x0F 0x0004>;
 			opp-hz = /bits/ 64 <312000000>;
 		};
 
-		opp@456000000,750 {
+		opp-456000000-750 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x0C 0x0003>;
 			opp-hz = /bits/ 64 <456000000>;
 		};
 
-		opp@456000000,800 {
+		opp-456000000-800 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x03 0x0006>, <0x04 0x0004>,
 					   <0x08 0x0004>;
 			opp-hz = /bits/ 64 <456000000>;
 		};
 
-		opp@456000000,825 {
+		opp-456000000-825 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x03 0x0001>;
 			opp-hz = /bits/ 64 <456000000>;
 		};
 
-		opp@608000000,750 {
+		opp-608000000-750 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x08 0x0003>;
 			opp-hz = /bits/ 64 <608000000>;
 		};
 
-		opp@608000000,800 {
+		opp-608000000-800 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x04 0x0006>, <0x08 0x0004>;
 			opp-hz = /bits/ 64 <608000000>;
 		};
 
-		opp@608000000,825 {
+		opp-608000000-825 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x04 0x0001>;
 			opp-hz = /bits/ 64 <608000000>;
 		};
 
-		opp@608000000,850 {
+		opp-608000000-850 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x03 0x0006>;
 			opp-hz = /bits/ 64 <608000000>;
 		};
 
-		opp@608000000,900 {
+		opp-608000000-900 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x03 0x0001>;
 			opp-hz = /bits/ 64 <608000000>;
 		};
 
-		opp@760000000,775 {
+		opp-760000000-775 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x08 0x0003>;
 			opp-hz = /bits/ 64 <760000000>;
 		};
 
-		opp@760000000,800 {
+		opp-760000000-800 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x08 0x0004>;
 			opp-hz = /bits/ 64 <760000000>;
 		};
 
-		opp@760000000,850 {
+		opp-760000000-850 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x04 0x0006>;
 			opp-hz = /bits/ 64 <760000000>;
 		};
 
-		opp@760000000,875 {
+		opp-760000000-875 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x04 0x0001>, <0x02 0x0002>,
 					   <0x01 0x0004>, <0x02 0x0004>;
 			opp-hz = /bits/ 64 <760000000>;
 		};
 
-		opp@760000000,900 {
+		opp-760000000-900 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x01 0x0002>;
 			opp-hz = /bits/ 64 <760000000>;
 		};
 
-		opp@760000000,975 {
+		opp-760000000-975 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x03 0x0001>;
 			opp-hz = /bits/ 64 <760000000>;
 		};
 
-		opp@816000000,800 {
+		opp-816000000-800 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x08 0x0007>;
 			opp-hz = /bits/ 64 <816000000>;
 		};
 
-		opp@816000000,850 {
+		opp-816000000-850 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x04 0x0002>;
 			opp-hz = /bits/ 64 <816000000>;
 		};
 
-		opp@816000000,875 {
+		opp-816000000-875 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x04 0x0005>;
 			opp-hz = /bits/ 64 <816000000>;
 		};
 
-		opp@816000000,950 {
+		opp-816000000-950 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x03 0x0006>;
 			opp-hz = /bits/ 64 <816000000>;
 		};
 
-		opp@816000000,1000 {
+		opp-816000000-1000 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x03 0x0001>;
 			opp-hz = /bits/ 64 <816000000>;
 		};
 
-		opp@912000000,850 {
+		opp-912000000-850 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x08 0x0007>;
 			opp-hz = /bits/ 64 <912000000>;
 		};
 
-		opp@912000000,900 {
+		opp-912000000-900 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x04 0x0002>;
 			opp-hz = /bits/ 64 <912000000>;
 		};
 
-		opp@912000000,925 {
+		opp-912000000-925 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x04 0x0001>;
 			opp-hz = /bits/ 64 <912000000>;
 		};
 
-		opp@912000000,950 {
+		opp-912000000-950 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x02 0x0006>, <0x01 0x0004>,
 					   <0x04 0x0004>;
 			opp-hz = /bits/ 64 <912000000>;
 		};
 
-		opp@912000000,1000 {
+		opp-912000000-1000 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x01 0x0002>;
 			opp-hz = /bits/ 64 <912000000>;
 		};
 
-		opp@912000000,1050 {
+		opp-912000000-1050 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x03 0x0001>;
 			opp-hz = /bits/ 64 <912000000>;
 		};
 
-		opp@1000000000,875 {
+		opp-1000000000-875 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x08 0x0007>;
 			opp-hz = /bits/ 64 <1000000000>;
 		};
 
-		opp@1000000000,900 {
+		opp-1000000000-900 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x04 0x0002>;
 			opp-hz = /bits/ 64 <1000000000>;
 		};
 
-		opp@1000000000,950 {
+		opp-1000000000-950 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x04 0x0004>;
 			opp-hz = /bits/ 64 <1000000000>;
 		};
 
-		opp@1000000000,975 {
+		opp-1000000000-975 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x04 0x0001>;
 			opp-hz = /bits/ 64 <1000000000>;
 		};
 
-		opp@1000000000,1000 {
+		opp-1000000000-1000 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x02 0x0006>, <0x01 0x0004>;
 			opp-hz = /bits/ 64 <1000000000>;
 		};
 
-		opp@1000000000,1025 {
+		opp-1000000000-1025 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x01 0x0002>;
 			opp-hz = /bits/ 64 <1000000000>;
 		};
 
-		opp@1000000000,1100 {
+		opp-1000000000-1100 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x03 0x0001>;
 			opp-hz = /bits/ 64 <1000000000>;
 		};
 
-		opp@1200000000,1000 {
+		opp-1200000000-1000 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x08 0x0004>;
 			opp-hz = /bits/ 64 <1200000000>;
 		};
 
-		opp@1200000000,1050 {
+		opp-1200000000-1050 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x04 0x0004>;
 			opp-hz = /bits/ 64 <1200000000>;
 		};
 
-		opp@1200000000,1100 {
+		opp-1200000000-1100 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x02 0x0004>;
 			opp-hz = /bits/ 64 <1200000000>;
 		};
 
-		opp@1200000000,1125 {
+		opp-1200000000-1125 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x01 0x0004>;
 			opp-hz = /bits/ 64 <1200000000>;
diff --git a/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
index ef3ad2e5f270..77c15fd61a9b 100644
--- a/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
@@ -1,107 +1,107 @@
 // SPDX-License-Identifier: GPL-2.0
 
 / {
-	emc_icc_dvfs_opp_table: emc-dvfs-opp-table {
+	emc_icc_dvfs_opp_table: opp-table {
 		compatible = "operating-points-v2";
 
-		opp@36000000 {
+		opp-36000000 {
 			opp-microvolt = <950000 950000 1300000>;
 			opp-hz = /bits/ 64 <36000000>;
 			opp-supported-hw = <0x000F>;
 		};
 
-		opp@47500000 {
+		opp-47500000 {
 			opp-microvolt = <950000 950000 1300000>;
 			opp-hz = /bits/ 64 <47500000>;
 			opp-supported-hw = <0x000F>;
 		};
 
-		opp@50000000 {
+		opp-50000000 {
 			opp-microvolt = <950000 950000 1300000>;
 			opp-hz = /bits/ 64 <50000000>;
 			opp-supported-hw = <0x000F>;
 		};
 
-		opp@54000000 {
+		opp-54000000 {
 			opp-microvolt = <950000 950000 1300000>;
 			opp-hz = /bits/ 64 <54000000>;
 			opp-supported-hw = <0x000F>;
 		};
 
-		opp@57000000 {
+		opp-57000000 {
 			opp-microvolt = <950000 950000 1300000>;
 			opp-hz = /bits/ 64 <57000000>;
 			opp-supported-hw = <0x000F>;
 		};
 
-		opp@100000000 {
+		opp-100000000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <100000000>;
 			opp-supported-hw = <0x000F>;
 		};
 
-		opp@108000000 {
+		opp-108000000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <108000000>;
 			opp-supported-hw = <0x000F>;
 		};
 
-		opp@126666000 {
+		opp-126666000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <126666000>;
 			opp-supported-hw = <0x000F>;
 		};
 
-		opp@150000000 {
+		opp-150000000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <150000000>;
 			opp-supported-hw = <0x000F>;
 		};
 
-		opp@190000000 {
+		opp-190000000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <190000000>;
 			opp-supported-hw = <0x000F>;
 		};
 
-		opp@216000000 {
+		opp-216000000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <216000000>;
 			opp-supported-hw = <0x000F>;
 			opp-suspend;
 		};
 
-		opp@300000000 {
+		opp-300000000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <300000000>;
 			opp-supported-hw = <0x000F>;
 		};
 
-		opp@333000000 {
+		opp-333000000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <333000000>;
 			opp-supported-hw = <0x000F>;
 		};
 
-		opp@380000000 {
+		opp-380000000 {
 			opp-microvolt = <1100000 1100000 1300000>;
 			opp-hz = /bits/ 64 <380000000>;
 			opp-supported-hw = <0x000F>;
 		};
 
-		opp@600000000 {
+		opp-600000000 {
 			opp-microvolt = <1200000 1200000 1300000>;
 			opp-hz = /bits/ 64 <600000000>;
 			opp-supported-hw = <0x000F>;
 		};
 
-		opp@666000000 {
+		opp-666000000 {
 			opp-microvolt = <1200000 1200000 1300000>;
 			opp-hz = /bits/ 64 <666000000>;
 			opp-supported-hw = <0x000F>;
 		};
 
-		opp@760000000 {
+		opp-760000000 {
 			opp-microvolt = <1300000 1300000 1300000>;
 			opp-hz = /bits/ 64 <760000000>;
 			opp-supported-hw = <0x000F>;
diff --git a/arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi b/arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi
index 1be715d2a442..b8e0e9117021 100644
--- a/arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi
+++ b/arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi
@@ -1,288 +1,288 @@
 // SPDX-License-Identifier: GPL-2.0
 
 / {
-	cpu0_opp_table: cpu_opp_table0 {
-		opp@51000000,800 {
+	cpu0_opp_table: opp-table-cpu0 {
+		opp-51000000-800 {
 			opp-microvolt = <800000 800000 1250000>;
 		};
 
-		opp@51000000,850 {
+		opp-51000000-850 {
 			opp-microvolt = <850000 850000 1250000>;
 		};
 
-		opp@51000000,912 {
+		opp-51000000-912 {
 			opp-microvolt = <912000 912000 1250000>;
 		};
 
-		opp@102000000,800 {
+		opp-102000000-800 {
 			opp-microvolt = <800000 800000 1250000>;
 		};
 
-		opp@102000000,850 {
+		opp-102000000-850 {
 			opp-microvolt = <850000 850000 1250000>;
 		};
 
-		opp@102000000,912 {
+		opp-102000000-912 {
 			opp-microvolt = <912000 912000 1250000>;
 		};
 
-		opp@204000000,800 {
+		opp-204000000-800 {
 			opp-microvolt = <800000 800000 1250000>;
 		};
 
-		opp@204000000,850 {
+		opp-204000000-850 {
 			opp-microvolt = <850000 850000 1250000>;
 		};
 
-		opp@204000000,912 {
+		opp-204000000-912 {
 			opp-microvolt = <912000 912000 1250000>;
 		};
 
-		opp@312000000,850 {
+		opp-312000000-850 {
 			opp-microvolt = <850000 850000 1250000>;
 		};
 
-		opp@312000000,912 {
+		opp-312000000-912 {
 			opp-microvolt = <912000 912000 1250000>;
 		};
 
-		opp@340000000,800 {
+		opp-340000000-800 {
 			opp-microvolt = <800000 800000 1250000>;
 		};
 
-		opp@340000000,850 {
+		opp-340000000-850 {
 			opp-microvolt = <850000 850000 1250000>;
 		};
 
-		opp@370000000,800 {
+		opp-370000000-800 {
 			opp-microvolt = <800000 800000 1250000>;
 		};
 
-		opp@456000000,850 {
+		opp-456000000-850 {
 			opp-microvolt = <850000 850000 1250000>;
 		};
 
-		opp@456000000,912 {
+		opp-456000000-912 {
 			opp-microvolt = <912000 912000 1250000>;
 		};
 
-		opp@475000000,800 {
+		opp-475000000-800 {
 			opp-microvolt = <800000 800000 1250000>;
 		};
 
-		opp@475000000,850 {
+		opp-475000000-850 {
 			opp-microvolt = <850000 850000 1250000>;
 		};
 
-		opp@608000000,850 {
+		opp-608000000-850 {
 			opp-microvolt = <850000 850000 1250000>;
 		};
 
-		opp@608000000,912 {
+		opp-608000000-912 {
 			opp-microvolt = <912000 912000 1250000>;
 		};
 
-		opp@620000000,850 {
+		opp-620000000-850 {
 			opp-microvolt = <850000 850000 1250000>;
 		};
 
-		opp@640000000,850 {
+		opp-640000000-850 {
 			opp-microvolt = <850000 850000 1250000>;
 		};
 
-		opp@640000000,900 {
+		opp-640000000-900 {
 			opp-microvolt = <900000 900000 1250000>;
 		};
 
-		opp@760000000,850 {
+		opp-760000000-850 {
 			opp-microvolt = <850000 850000 1250000>;
 		};
 
-		opp@760000000,900 {
+		opp-760000000-900 {
 			opp-microvolt = <900000 900000 1250000>;
 		};
 
-		opp@760000000,912 {
+		opp-760000000-912 {
 			opp-microvolt = <912000 912000 1250000>;
 		};
 
-		opp@760000000,975 {
+		opp-760000000-975 {
 			opp-microvolt = <975000 975000 1250000>;
 		};
 
-		opp@816000000,850 {
+		opp-816000000-850 {
 			opp-microvolt = <850000 850000 1250000>;
 		};
 
-		opp@816000000,912 {
+		opp-816000000-912 {
 			opp-microvolt = <912000 912000 1250000>;
 		};
 
-		opp@860000000,850 {
+		opp-860000000-850 {
 			opp-microvolt = <850000 850000 1250000>;
 		};
 
-		opp@860000000,900 {
+		opp-860000000-900 {
 			opp-microvolt = <900000 900000 1250000>;
 		};
 
-		opp@860000000,975 {
+		opp-860000000-975 {
 			opp-microvolt = <975000 975000 1250000>;
 		};
 
-		opp@860000000,1000 {
+		opp-860000000-1000 {
 			opp-microvolt = <1000000 1000000 1250000>;
 		};
 
-		opp@910000000,900 {
+		opp-910000000-900 {
 			opp-microvolt = <900000 900000 1250000>;
 		};
 
-		opp@1000000000,900 {
+		opp-1000000000-900 {
 			opp-microvolt = <900000 900000 1250000>;
 		};
 
-		opp@1000000000,975 {
+		opp-1000000000-975 {
 			opp-microvolt = <975000 975000 1250000>;
 		};
 
-		opp@1000000000,1000 {
+		opp-1000000000-1000 {
 			opp-microvolt = <1000000 1000000 1250000>;
 		};
 
-		opp@1000000000,1025 {
+		opp-1000000000-1025 {
 			opp-microvolt = <1025000 1025000 1250000>;
 		};
 
-		opp@1100000000,900 {
+		opp-1100000000-900 {
 			opp-microvolt = <900000 900000 1250000>;
 		};
 
-		opp@1100000000,975 {
+		opp-1100000000-975 {
 			opp-microvolt = <975000 975000 1250000>;
 		};
 
-		opp@1100000000,1000 {
+		opp-1100000000-1000 {
 			opp-microvolt = <1000000 1000000 1250000>;
 		};
 
-		opp@1100000000,1025 {
+		opp-1100000000-1025 {
 			opp-microvolt = <1025000 1025000 1250000>;
 		};
 
-		opp@1100000000,1075 {
+		opp-1100000000-1075 {
 			opp-microvolt = <1075000 1075000 1250000>;
 		};
 
-		opp@1150000000,975 {
+		opp-1150000000-975 {
 			opp-microvolt = <975000 975000 1250000>;
 		};
 
-		opp@1200000000,975 {
+		opp-1200000000-975 {
 			opp-microvolt = <975000 975000 1250000>;
 		};
 
-		opp@1200000000,1000 {
+		opp-1200000000-1000 {
 			opp-microvolt = <1000000 1000000 1250000>;
 		};
 
-		opp@1200000000,1025 {
+		opp-1200000000-1025 {
 			opp-microvolt = <1025000 1025000 1250000>;
 		};
 
-		opp@1200000000,1050 {
+		opp-1200000000-1050 {
 			opp-microvolt = <1050000 1050000 1250000>;
 		};
 
-		opp@1200000000,1075 {
+		opp-1200000000-1075 {
 			opp-microvolt = <1075000 1075000 1250000>;
 		};
 
-		opp@1200000000,1100 {
+		opp-1200000000-1100 {
 			opp-microvolt = <1100000 1100000 1250000>;
 		};
 
-		opp@1300000000,1000 {
+		opp-1300000000-1000 {
 			opp-microvolt = <1000000 1000000 1250000>;
 		};
 
-		opp@1300000000,1025 {
+		opp-1300000000-1025 {
 			opp-microvolt = <1025000 1025000 1250000>;
 		};
 
-		opp@1300000000,1050 {
+		opp-1300000000-1050 {
 			opp-microvolt = <1050000 1050000 1250000>;
 		};
 
-		opp@1300000000,1075 {
+		opp-1300000000-1075 {
 			opp-microvolt = <1075000 1075000 1250000>;
 		};
 
-		opp@1300000000,1100 {
+		opp-1300000000-1100 {
 			opp-microvolt = <1100000 1100000 1250000>;
 		};
 
-		opp@1300000000,1125 {
+		opp-1300000000-1125 {
 			opp-microvolt = <1125000 1125000 1250000>;
 		};
 
-		opp@1300000000,1150 {
+		opp-1300000000-1150 {
 			opp-microvolt = <1150000 1150000 1250000>;
 		};
 
-		opp@1300000000,1175 {
+		opp-1300000000-1175 {
 			opp-microvolt = <1175000 1175000 1250000>;
 		};
 
-		opp@1400000000,1100 {
+		opp-1400000000-1100 {
 			opp-microvolt = <1100000 1100000 1250000>;
 		};
 
-		opp@1400000000,1125 {
+		opp-1400000000-1125 {
 			opp-microvolt = <1125000 1125000 1250000>;
 		};
 
-		opp@1400000000,1150 {
+		opp-1400000000-1150 {
 			opp-microvolt = <1150000 1150000 1250000>;
 		};
 
-		opp@1400000000,1175 {
+		opp-1400000000-1175 {
 			opp-microvolt = <1175000 1175000 1250000>;
 		};
 
-		opp@1400000000,1237 {
+		opp-1400000000-1237 {
 			opp-microvolt = <1237000 1237000 1250000>;
 		};
 
-		opp@1500000000,1125 {
+		opp-1500000000-1125 {
 			opp-microvolt = <1125000 1125000 1250000>;
 		};
 
-		opp@1500000000,1150 {
+		opp-1500000000-1150 {
 			opp-microvolt = <1150000 1150000 1250000>;
 		};
 
-		opp@1500000000,1200 {
+		opp-1500000000-1200 {
 			opp-microvolt = <1200000 1200000 1250000>;
 		};
 
-		opp@1500000000,1237 {
+		opp-1500000000-1237 {
 			opp-microvolt = <1237000 1237000 1250000>;
 		};
 
-		opp@1600000000,1212 {
+		opp-1600000000-1212 {
 			opp-microvolt = <1212000 1212000 1250000>;
 		};
 
-		opp@1600000000,1237 {
+		opp-1600000000-1237 {
 			opp-microvolt = <1237000 1237000 1250000>;
 		};
 
-		opp@1700000000,1212 {
+		opp-1700000000-1212 {
 			opp-microvolt = <1212000 1212000 1250000>;
 		};
 
-		opp@1700000000,1237 {
+		opp-1700000000-1237 {
 			opp-microvolt = <1237000 1237000 1250000>;
 		};
 	};
diff --git a/arch/arm/boot/dts/tegra30-cpu-opp.dtsi b/arch/arm/boot/dts/tegra30-cpu-opp.dtsi
index 72f2fe26cc0e..5b9ebb75a09f 100644
--- a/arch/arm/boot/dts/tegra30-cpu-opp.dtsi
+++ b/arch/arm/boot/dts/tegra30-cpu-opp.dtsi
@@ -1,116 +1,116 @@
 // SPDX-License-Identifier: GPL-2.0
 
 / {
-	cpu0_opp_table: cpu_opp_table0 {
+	cpu0_opp_table: opp-table-cpu0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
-		opp@51000000,800 {
+		opp-51000000-800 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x31FE>;
 			opp-hz = /bits/ 64 <51000000>;
 		};
 
-		opp@51000000,850 {
+		opp-51000000-850 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0C01>;
 			opp-hz = /bits/ 64 <51000000>;
 		};
 
-		opp@51000000,912 {
+		opp-51000000-912 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0200>;
 			opp-hz = /bits/ 64 <51000000>;
 		};
 
-		opp@102000000,800 {
+		opp-102000000-800 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x31FE>;
 			opp-hz = /bits/ 64 <102000000>;
 		};
 
-		opp@102000000,850 {
+		opp-102000000-850 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0C01>;
 			opp-hz = /bits/ 64 <102000000>;
 		};
 
-		opp@102000000,912 {
+		opp-102000000-912 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0200>;
 			opp-hz = /bits/ 64 <102000000>;
 		};
 
-		opp@204000000,800 {
+		opp-204000000-800 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x31FE>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-suspend;
 		};
 
-		opp@204000000,850 {
+		opp-204000000-850 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0C01>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-suspend;
 		};
 
-		opp@204000000,912 {
+		opp-204000000-912 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0200>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-suspend;
 		};
 
-		opp@312000000,850 {
+		opp-312000000-850 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0C00>;
 			opp-hz = /bits/ 64 <312000000>;
 		};
 
-		opp@312000000,912 {
+		opp-312000000-912 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0200>;
 			opp-hz = /bits/ 64 <312000000>;
 		};
 
-		opp@340000000,800 {
+		opp-340000000-800 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0192>;
 			opp-hz = /bits/ 64 <340000000>;
 		};
 
-		opp@340000000,850 {
+		opp-340000000-850 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x0F 0x0001>;
 			opp-hz = /bits/ 64 <340000000>;
 		};
 
-		opp@370000000,800 {
+		opp-370000000-800 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1E 0x306C>;
 			opp-hz = /bits/ 64 <370000000>;
 		};
 
-		opp@456000000,850 {
+		opp-456000000-850 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0C00>;
 			opp-hz = /bits/ 64 <456000000>;
 		};
 
-		opp@456000000,912 {
+		opp-456000000-912 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0200>;
 			opp-hz = /bits/ 64 <456000000>;
 		};
 
-		opp@475000000,800 {
+		opp-475000000-800 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1E 0x31FE>;
 			opp-hz = /bits/ 64 <475000000>;
 		};
 
-		opp@475000000,850 {
+		opp-475000000-850 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x0F 0x0001>, <0x01 0x0002>,
 					   <0x01 0x0010>, <0x01 0x0080>,
@@ -118,25 +118,25 @@ opp@475000000,850 {
 			opp-hz = /bits/ 64 <475000000>;
 		};
 
-		opp@608000000,850 {
+		opp-608000000-850 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0400>;
 			opp-hz = /bits/ 64 <608000000>;
 		};
 
-		opp@608000000,912 {
+		opp-608000000-912 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0200>;
 			opp-hz = /bits/ 64 <608000000>;
 		};
 
-		opp@620000000,850 {
+		opp-620000000-850 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1E 0x306C>;
 			opp-hz = /bits/ 64 <620000000>;
 		};
 
-		opp@640000000,850 {
+		opp-640000000-850 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x0F 0x0001>, <0x02 0x0002>,
 					   <0x04 0x0002>, <0x08 0x0002>,
@@ -149,13 +149,13 @@ opp@640000000,850 {
 			opp-hz = /bits/ 64 <640000000>;
 		};
 
-		opp@640000000,900 {
+		opp-640000000-900 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x01 0x0192>;
 			opp-hz = /bits/ 64 <640000000>;
 		};
 
-		opp@760000000,850 {
+		opp-760000000-850 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1E 0x3461>, <0x08 0x0002>,
 					   <0x08 0x0004>, <0x08 0x0008>,
@@ -165,7 +165,7 @@ opp@760000000,850 {
 			opp-hz = /bits/ 64 <760000000>;
 		};
 
-		opp@760000000,900 {
+		opp-760000000-900 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x01 0x0001>, <0x02 0x0002>,
 					   <0x04 0x0002>, <0x02 0x0004>,
@@ -177,37 +177,37 @@ opp@760000000,900 {
 			opp-hz = /bits/ 64 <760000000>;
 		};
 
-		opp@760000000,912 {
+		opp-760000000-912 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0200>;
 			opp-hz = /bits/ 64 <760000000>;
 		};
 
-		opp@760000000,975 {
+		opp-760000000-975 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x01 0x0192>;
 			opp-hz = /bits/ 64 <760000000>;
 		};
 
-		opp@816000000,850 {
+		opp-816000000-850 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0400>;
 			opp-hz = /bits/ 64 <816000000>;
 		};
 
-		opp@816000000,912 {
+		opp-816000000-912 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0200>;
 			opp-hz = /bits/ 64 <816000000>;
 		};
 
-		opp@860000000,850 {
+		opp-860000000-850 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x0C 0x0001>;
 			opp-hz = /bits/ 64 <860000000>;
 		};
 
-		opp@860000000,900 {
+		opp-860000000-900 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x02 0x0001>, <0x04 0x0002>,
 					   <0x08 0x0002>, <0x04 0x0004>,
@@ -220,7 +220,7 @@ opp@860000000,900 {
 			opp-hz = /bits/ 64 <860000000>;
 		};
 
-		opp@860000000,975 {
+		opp-860000000-975 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x01 0x0001>, <0x02 0x0002>,
 					   <0x02 0x0004>, <0x02 0x0008>,
@@ -229,25 +229,25 @@ opp@860000000,975 {
 			opp-hz = /bits/ 64 <860000000>;
 		};
 
-		opp@860000000,1000 {
+		opp-860000000-1000 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x01 0x0192>;
 			opp-hz = /bits/ 64 <860000000>;
 		};
 
-		opp@910000000,900 {
+		opp-910000000-900 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x18 0x3060>;
 			opp-hz = /bits/ 64 <910000000>;
 		};
 
-		opp@1000000000,900 {
+		opp-1000000000-900 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x0C 0x0001>;
 			opp-hz = /bits/ 64 <1000000000>;
 		};
 
-		opp@1000000000,975 {
+		opp-1000000000-975 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x03 0x0001>, <0x04 0x0002>,
 					   <0x08 0x0002>, <0x04 0x0004>,
@@ -260,25 +260,25 @@ opp@1000000000,975 {
 			opp-hz = /bits/ 64 <1000000000>;
 		};
 
-		opp@1000000000,1000 {
+		opp-1000000000-1000 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x02 0x019E>;
 			opp-hz = /bits/ 64 <1000000000>;
 		};
 
-		opp@1000000000,1025 {
+		opp-1000000000-1025 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x01 0x0192>;
 			opp-hz = /bits/ 64 <1000000000>;
 		};
 
-		opp@1100000000,900 {
+		opp-1100000000-900 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x08 0x0001>;
 			opp-hz = /bits/ 64 <1100000000>;
 		};
 
-		opp@1100000000,975 {
+		opp-1100000000-975 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x06 0x0001>, <0x08 0x0002>,
 					   <0x08 0x0004>, <0x08 0x0008>,
@@ -288,7 +288,7 @@ opp@1100000000,975 {
 			opp-hz = /bits/ 64 <1100000000>;
 		};
 
-		opp@1100000000,1000 {
+		opp-1100000000-1000 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x01 0x0001>, <0x04 0x0002>,
 					   <0x04 0x0004>, <0x04 0x0008>,
@@ -297,31 +297,31 @@ opp@1100000000,1000 {
 			opp-hz = /bits/ 64 <1100000000>;
 		};
 
-		opp@1100000000,1025 {
+		opp-1100000000-1025 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x02 0x019E>;
 			opp-hz = /bits/ 64 <1100000000>;
 		};
 
-		opp@1100000000,1075 {
+		opp-1100000000-1075 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x01 0x0192>;
 			opp-hz = /bits/ 64 <1100000000>;
 		};
 
-		opp@1150000000,975 {
+		opp-1150000000-975 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x18 0x3060>;
 			opp-hz = /bits/ 64 <1150000000>;
 		};
 
-		opp@1200000000,975 {
+		opp-1200000000-975 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x08 0x0001>;
 			opp-hz = /bits/ 64 <1200000000>;
 		};
 
-		opp@1200000000,1000 {
+		opp-1200000000-1000 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x04 0x0001>, <0x08 0x0002>,
 					   <0x08 0x0004>, <0x08 0x0008>,
@@ -331,7 +331,7 @@ opp@1200000000,1000 {
 			opp-hz = /bits/ 64 <1200000000>;
 		};
 
-		opp@1200000000,1025 {
+		opp-1200000000-1025 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x02 0x0001>, <0x04 0x0002>,
 					   <0x04 0x0004>, <0x04 0x0008>,
@@ -340,39 +340,39 @@ opp@1200000000,1025 {
 			opp-hz = /bits/ 64 <1200000000>;
 		};
 
-		opp@1200000000,1050 {
+		opp-1200000000-1050 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x02 0x019E>;
 			opp-hz = /bits/ 64 <1200000000>;
 		};
 
-		opp@1200000000,1075 {
+		opp-1200000000-1075 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x01 0x0001>;
 			opp-hz = /bits/ 64 <1200000000>;
 		};
 
-		opp@1200000000,1100 {
+		opp-1200000000-1100 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x01 0x0192>;
 			opp-hz = /bits/ 64 <1200000000>;
 		};
 
-		opp@1300000000,1000 {
+		opp-1300000000-1000 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x08 0x0001>, <0x10 0x0080>,
 					   <0x10 0x0100>;
 			opp-hz = /bits/ 64 <1300000000>;
 		};
 
-		opp@1300000000,1025 {
+		opp-1300000000-1025 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x04 0x0001>, <0x08 0x0002>,
 					   <0x08 0x0080>, <0x08 0x0100>;
 			opp-hz = /bits/ 64 <1300000000>;
 		};
 
-		opp@1300000000,1050 {
+		opp-1300000000-1050 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x12 0x3061>, <0x04 0x0002>,
 					   <0x08 0x0004>, <0x08 0x0008>,
@@ -383,68 +383,68 @@ opp@1300000000,1050 {
 			opp-hz = /bits/ 64 <1300000000>;
 		};
 
-		opp@1300000000,1075 {
+		opp-1300000000-1075 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x02 0x0182>, <0x04 0x0004>,
 					   <0x04 0x0008>, <0x04 0x0010>;
 			opp-hz = /bits/ 64 <1300000000>;
 		};
 
-		opp@1300000000,1100 {
+		opp-1300000000-1100 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x02 0x001C>;
 			opp-hz = /bits/ 64 <1300000000>;
 		};
 
-		opp@1300000000,1125 {
+		opp-1300000000-1125 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x01 0x0001>;
 			opp-hz = /bits/ 64 <1300000000>;
 		};
 
-		opp@1300000000,1150 {
+		opp-1300000000-1150 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x01 0x0182>;
 			opp-hz = /bits/ 64 <1300000000>;
 		};
 
-		opp@1300000000,1175 {
+		opp-1300000000-1175 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x01 0x0010>;
 			opp-hz = /bits/ 64 <1300000000>;
 		};
 
-		opp@1400000000,1100 {
+		opp-1400000000-1100 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x18 0x307C>;
 			opp-hz = /bits/ 64 <1400000000>;
 		};
 
-		opp@1400000000,1125 {
+		opp-1400000000-1125 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x04 0x000C>;
 			opp-hz = /bits/ 64 <1400000000>;
 		};
 
-		opp@1400000000,1150 {
+		opp-1400000000-1150 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x02 0x000C>, <0x04 0x0010>;
 			opp-hz = /bits/ 64 <1400000000>;
 		};
 
-		opp@1400000000,1175 {
+		opp-1400000000-1175 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x02 0x0010>;
 			opp-hz = /bits/ 64 <1400000000>;
 		};
 
-		opp@1400000000,1237 {
+		opp-1400000000-1237 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x01 0x0010>;
 			opp-hz = /bits/ 64 <1400000000>;
 		};
 
-		opp@1500000000,1125 {
+		opp-1500000000-1125 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x08 0x0010>, <0x10 0x0020>,
 					   <0x10 0x0040>, <0x10 0x1000>,
@@ -452,7 +452,7 @@ opp@1500000000,1125 {
 			opp-hz = /bits/ 64 <1500000000>;
 		};
 
-		opp@1500000000,1150 {
+		opp-1500000000-1150 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x04 0x0010>, <0x08 0x0020>,
 					   <0x08 0x0040>, <0x08 0x1000>,
@@ -460,37 +460,37 @@ opp@1500000000,1150 {
 			opp-hz = /bits/ 64 <1500000000>;
 		};
 
-		opp@1500000000,1200 {
+		opp-1500000000-1200 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x02 0x0010>;
 			opp-hz = /bits/ 64 <1500000000>;
 		};
 
-		opp@1500000000,1237 {
+		opp-1500000000-1237 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x01 0x0010>;
 			opp-hz = /bits/ 64 <1500000000>;
 		};
 
-		opp@1600000000,1212 {
+		opp-1600000000-1212 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x10 0x3060>;
 			opp-hz = /bits/ 64 <1600000000>;
 		};
 
-		opp@1600000000,1237 {
+		opp-1600000000-1237 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x08 0x3060>;
 			opp-hz = /bits/ 64 <1600000000>;
 		};
 
-		opp@1700000000,1212 {
+		opp-1700000000-1212 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x10 0x3060>;
 			opp-hz = /bits/ 64 <1700000000>;
 		};
 
-		opp@1700000000,1237 {
+		opp-1700000000-1237 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x08 0x3060>;
 			opp-hz = /bits/ 64 <1700000000>;
diff --git a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
index 2c9780319725..f0f33c4f7648 100644
--- a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
@@ -1,383 +1,385 @@
 // SPDX-License-Identifier: GPL-2.0
 
 / {
-	emc_icc_dvfs_opp_table: emc-dvfs-opp-table {
+	/* EMC DVFS OPP table */
+	emc_icc_dvfs_opp_table: opp-table-dvfs0 {
 		compatible = "operating-points-v2";
 
-		opp@12750000,950 {
+		opp-12750000-950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x0006>;
 		};
 
-		opp@12750000,1000 {
+		opp-12750000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x0001>;
 		};
 
-		opp@12750000,1250 {
+		opp-12750000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@25500000,950 {
+		opp-25500000-950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <25500000>;
 			opp-supported-hw = <0x0006>;
 		};
 
-		opp@25500000,1000 {
+		opp-25500000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <25500000>;
 			opp-supported-hw = <0x0001>;
 		};
 
-		opp@25500000,1250 {
+		opp-25500000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <25500000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@27000000,950 {
+		opp-27000000-950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <27000000>;
 			opp-supported-hw = <0x0006>;
 		};
 
-		opp@27000000,1000 {
+		opp-27000000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <27000000>;
 			opp-supported-hw = <0x0001>;
 		};
 
-		opp@27000000,1250 {
+		opp-27000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <27000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@51000000,950 {
+		opp-51000000-950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <51000000>;
 			opp-supported-hw = <0x0006>;
 		};
 
-		opp@51000000,1000 {
+		opp-51000000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <51000000>;
 			opp-supported-hw = <0x0001>;
 		};
 
-		opp@51000000,1250 {
+		opp-51000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <51000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@54000000,950 {
+		opp-54000000-950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <54000000>;
 			opp-supported-hw = <0x0006>;
 		};
 
-		opp@54000000,1000 {
+		opp-54000000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <54000000>;
 			opp-supported-hw = <0x0001>;
 		};
 
-		opp@54000000,1250 {
+		opp-54000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <54000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@102000000,950 {
+		opp-102000000-950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x0006>;
 		};
 
-		opp@102000000,1000 {
+		opp-102000000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x0001>;
 		};
 
-		opp@102000000,1250 {
+		opp-102000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@108000000,1000 {
+		opp-108000000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <108000000>;
 			opp-supported-hw = <0x0007>;
 		};
 
-		opp@108000000,1250 {
+		opp-108000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <108000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@204000000,1000 {
+		opp-204000000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0007>;
 			opp-suspend;
 		};
 
-		opp@204000000,1250 {
+		opp-204000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0008>;
 			opp-suspend;
 		};
 
-		opp@333500000,1000 {
+		opp-333500000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <333500000>;
 			opp-supported-hw = <0x0006>;
 		};
 
-		opp@333500000,1200 {
+		opp-333500000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <333500000>;
 			opp-supported-hw = <0x0001>;
 		};
 
-		opp@333500000,1250 {
+		opp-333500000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <333500000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@375000000,1000 {
+		opp-375000000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <375000000>;
 			opp-supported-hw = <0x0006>;
 		};
 
-		opp@375000000,1200 {
+		opp-375000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <375000000>;
 			opp-supported-hw = <0x0001>;
 		};
 
-		opp@375000000,1250 {
+		opp-375000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <375000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@400000000,1000 {
+		opp-400000000-1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <400000000>;
 			opp-supported-hw = <0x0006>;
 		};
 
-		opp@400000000,1200 {
+		opp-400000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <400000000>;
 			opp-supported-hw = <0x0001>;
 		};
 
-		opp@400000000,1250 {
+		opp-400000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <400000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@416000000,1200 {
+		opp-416000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <416000000>;
 			opp-supported-hw = <0x0007>;
 		};
 
-		opp@416000000,1250 {
+		opp-416000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <416000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@450000000,1200 {
+		opp-450000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <450000000>;
 			opp-supported-hw = <0x0007>;
 		};
 
-		opp@450000000,1250 {
+		opp-450000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <450000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@533000000,1200 {
+		opp-533000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <533000000>;
 			opp-supported-hw = <0x0007>;
 		};
 
-		opp@533000000,1250 {
+		opp-533000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <533000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@625000000,1200 {
+		opp-625000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <625000000>;
 			opp-supported-hw = <0x0006>;
 		};
 
-		opp@625000000,1250 {
+		opp-625000000-1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <625000000>;
 			opp-supported-hw = <0x0008>;
 		};
 
-		opp@667000000,1200 {
+		opp-667000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <667000000>;
 			opp-supported-hw = <0x0006>;
 		};
 
-		opp@750000000,1300 {
+		opp-750000000-1300 {
 			opp-microvolt = <1300000 1300000 1350000>;
 			opp-hz = /bits/ 64 <750000000>;
 			opp-supported-hw = <0x0004>;
 		};
 
-		opp@800000000,1300 {
+		opp-800000000-1300 {
 			opp-microvolt = <1300000 1300000 1350000>;
 			opp-hz = /bits/ 64 <800000000>;
 			opp-supported-hw = <0x0004>;
 		};
 
-		opp@900000000,1350 {
+		opp-900000000-1350 {
 			opp-microvolt = <1350000 1350000 1350000>;
 			opp-hz = /bits/ 64 <900000000>;
 			opp-supported-hw = <0x0004>;
 		};
 	};
 
-	emc_bw_dfs_opp_table: emc-bandwidth-opp-table {
+	/* EMC bandwidth OPP table */
+	emc_bw_dfs_opp_table: opp-table-dvfs1 {
 		compatible = "operating-points-v2";
 
-		opp@12750000 {
+		opp-12750000 {
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x000F>;
 			opp-peak-kBps = <102000>;
 		};
 
-		opp@25500000 {
+		opp-25500000 {
 			opp-hz = /bits/ 64 <25500000>;
 			opp-supported-hw = <0x000F>;
 			opp-peak-kBps = <204000>;
 		};
 
-		opp@27000000 {
+		opp-27000000 {
 			opp-hz = /bits/ 64 <27000000>;
 			opp-supported-hw = <0x000F>;
 			opp-peak-kBps = <216000>;
 		};
 
-		opp@51000000 {
+		opp-51000000 {
 			opp-hz = /bits/ 64 <51000000>;
 			opp-supported-hw = <0x000F>;
 			opp-peak-kBps = <408000>;
 		};
 
-		opp@54000000 {
+		opp-54000000 {
 			opp-hz = /bits/ 64 <54000000>;
 			opp-supported-hw = <0x000F>;
 			opp-peak-kBps = <432000>;
 		};
 
-		opp@102000000 {
+		opp-102000000 {
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x000F>;
 			opp-peak-kBps = <816000>;
 		};
 
-		opp@108000000 {
+		opp-108000000 {
 			opp-hz = /bits/ 64 <108000000>;
 			opp-supported-hw = <0x000F>;
 			opp-peak-kBps = <864000>;
 		};
 
-		opp@204000000 {
+		opp-204000000 {
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x000F>;
 			opp-peak-kBps = <1632000>;
 			opp-suspend;
 		};
 
-		opp@333500000 {
+		opp-333500000 {
 			opp-hz = /bits/ 64 <333500000>;
 			opp-supported-hw = <0x000F>;
 			opp-peak-kBps = <2668000>;
 		};
 
-		opp@375000000 {
+		opp-375000000 {
 			opp-hz = /bits/ 64 <375000000>;
 			opp-supported-hw = <0x000F>;
 			opp-peak-kBps = <3000000>;
 		};
 
-		opp@400000000 {
+		opp-400000000 {
 			opp-hz = /bits/ 64 <400000000>;
 			opp-supported-hw = <0x000F>;
 			opp-peak-kBps = <3200000>;
 		};
 
-		opp@416000000 {
+		opp-416000000 {
 			opp-hz = /bits/ 64 <416000000>;
 			opp-supported-hw = <0x000F>;
 			opp-peak-kBps = <3328000>;
 		};
 
-		opp@450000000 {
+		opp-450000000 {
 			opp-hz = /bits/ 64 <450000000>;
 			opp-supported-hw = <0x000F>;
 			opp-peak-kBps = <3600000>;
 		};
 
-		opp@533000000 {
+		opp-533000000 {
 			opp-hz = /bits/ 64 <533000000>;
 			opp-supported-hw = <0x000F>;
 			opp-peak-kBps = <4264000>;
 		};
 
-		opp@625000000 {
+		opp-625000000 {
 			opp-hz = /bits/ 64 <625000000>;
 			opp-supported-hw = <0x000E>;
 			opp-peak-kBps = <5000000>;
 		};
 
-		opp@667000000 {
+		opp-667000000 {
 			opp-hz = /bits/ 64 <667000000>;
 			opp-supported-hw = <0x0006>;
 			opp-peak-kBps = <5336000>;
 		};
 
-		opp@750000000 {
+		opp-750000000 {
 			opp-hz = /bits/ 64 <750000000>;
 			opp-supported-hw = <0x0004>;
 			opp-peak-kBps = <6000000>;
 		};
 
-		opp@800000000 {
+		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
 			opp-supported-hw = <0x0004>;
 			opp-peak-kBps = <6400000>;
 		};
 
-		opp@900000000 {
+		opp-900000000 {
 			opp-hz = /bits/ 64 <900000000>;
 			opp-supported-hw = <0x0004>;
 			opp-peak-kBps = <7200000>;
-- 
2.34.1

