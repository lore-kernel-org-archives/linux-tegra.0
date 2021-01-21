Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E0DC433E6
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 20:06:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78193224B2
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 20:06:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbhAUSrY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 13:47:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727434AbhAUS0A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 13:26:00 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C13C061793;
        Thu, 21 Jan 2021 10:23:30 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id j3so3601172ljb.9;
        Thu, 21 Jan 2021 10:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1cBynbltPC/InmbROCWOZHkosuVmX3nGRVytxcl7VwE=;
        b=KhSQVOM48d/jPNKoyHKARJ1ISaZNPnk/iUlPEhm4XQRiG5NWdWD1EgbopS4MaIQP/a
         PYfw2oMQxUC/pHXHCTS12gLcZ4A9443pYaY49/uku0QQJktOXDfdSDS0yvpt95QTdpYH
         Nkx5bU1pIUDnrg5By0M+N2GalmVjYbvWPHGqCOovZP+QID3XcvO55ThEv4mbjcbcNTNP
         g7bKsK6sQtRWzd3eEtjhMWdS40MXlo8rm6S7bGAsF1GsWVXQ6RdIPR5h9uV+WsmFOY3q
         U+JexWf5UYdGancEod5CbzIo1MvSUcuzR9aP0bSocQJQAcRQBmQ3olfYrMx2rc1iLoeR
         hyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1cBynbltPC/InmbROCWOZHkosuVmX3nGRVytxcl7VwE=;
        b=fPiDRkG8elFPtdPwS7ZA7sfRA8yUATMSeC8xJqxbcNt4OdJgFn1W4EqSQd8vuXOUYV
         c6eisgcIizFQq75lB0R50yua9We1dAHwdCi7aMhZAQSp0ONOuLQCMo08BYTV3ZULKQSP
         FVF8BmLshfQd/AXZP4BtDz73SwudH84G6+zUCg+wxOvxS7ApJ+jv8mn0HK57sctv/koC
         sOAiaVviXSLZhZwxauP2PG06ELIJHxfPSZXl5x857GaWH48EJ8J8kIWMcOgxTzAX4MCk
         2wF2QO08qZSj80KfVGWryTrMhb/KLolSHhevPDeMnXVb7T3vAJPgyayvjsMsAWmU7qxq
         F7CA==
X-Gm-Message-State: AOAM530kTGyJEacF/KH5J8RQhcFRWzGAifuSrDF5q6/yKXF7pGyFNyC9
        GEpYdEw1PloNAX2UjgrBg1Q=
X-Google-Smtp-Source: ABdhPJzBeW1Fvv8HSp0zHArlOE/R2B66rQ5PoGH/xWGXFp6HX4ier7iIvA29eW0XCgAKXiD69HsPuA==
X-Received: by 2002:a2e:b4b3:: with SMTP id q19mr283771ljm.121.1611253408719;
        Thu, 21 Jan 2021 10:23:28 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f186sm600537lfd.289.2021.01.21.10.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 10:23:28 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/13] ARM: tegra: acer-a500: Specify all CPU cores as cooling devices
Date:   Thu, 21 Jan 2021 21:23:03 +0300
Message-Id: <20210121182308.16080-9-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121182308.16080-1-digetx@gmail.com>
References: <20210121182308.16080-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If CPU0 is unplugged the cooling device can not rebind to CPU1. And if
CPU0 is plugged in again, the cooling device may fail to initialize.

If the CPUs are mapped with the physical CPU0 to Linux numbering
CPU1, the cooling device mapping will fail.

Hence specify all CPU cores as a cooling devices in the device-tree.

Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 64a303cc5395..8a98e4a9d994 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -841,9 +841,10 @@ cpu0: cpu@0 {
 			#cooling-cells = <2>;
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			cpu-supply = <&vdd_cpu>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -1073,7 +1074,8 @@ trip1: cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&trip0>;
-					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
-- 
2.29.2

