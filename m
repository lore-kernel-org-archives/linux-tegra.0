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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F46BC41518
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0383964E27
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377979AbhCCDb2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350256AbhCBMOh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 07:14:37 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A4FC061223;
        Tue,  2 Mar 2021 04:11:07 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id q23so23610613lji.8;
        Tue, 02 Mar 2021 04:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1cBynbltPC/InmbROCWOZHkosuVmX3nGRVytxcl7VwE=;
        b=r++83xuUqykpCl3Sr4jAoNZBtD/vX6lzmQznlni2WA5b2DmU2xcwxq0yk1Y9YJ+Bid
         RcnDYa4YjltAn60IaC4ElzzrKqBAq2ysu7zosdlB+LVhdV+edp1/vdzfWobsXeesWkF+
         2U4rW0YUy+c4UT+LnNmVTxLSQSaMRqRu6ivjCb11udta0LkKhg4ht1PigvO6XuMTlTN1
         B0PEW61NSlSFCJiMFWL2LS9CmqdBWBoKNoeqtAk9Ue6qGIXs0758F8veWJwM0biLzyiO
         Jf6sYY73NaiFEAMFQaI0AI4519ZdRbBbkUKWvHN08aOZLNkU7e/otx+gt/fcHfvNkDCK
         oH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1cBynbltPC/InmbROCWOZHkosuVmX3nGRVytxcl7VwE=;
        b=hxxdO6Uh3b93IxgMylisN+iRjQRUxQJ/AylHoObfS35DnhfEaq//8tkJeUYsrwR6Sk
         WBUnj2WQSjL1aboiEbgpz4hipa4A1qfIVlrdlIPNTWdAPG8ZRigPnmtubGNpjF399VnW
         DRzuqbIM1org1qRpMLfkNskzlOhcchmn2LXdNGt2V/34PFqShwgV4LSVLLfy8t+RUBKq
         RfNRl+7c8N+iSeJiS1zMpV6Z4+8wzI7qtgSaIbw9CKr8wpQn+QTHFIbWmeOcVklAbIQW
         edy4NQWQMHdwiR7PwPw98cdXbLneZis0gOd9dzNIvoiICFDEgrDGsVuGJW63ZWkAfMzC
         oGww==
X-Gm-Message-State: AOAM5304q0SKxxEJlX12BwPGWM1h0HHBhblNYlc/TKQhGHXCV8qD66mn
        9SWTlkCxrD5No/vRLtldcry8VAQk3/c=
X-Google-Smtp-Source: ABdhPJyEz2KPtWcHCDUoukP6lQVLCVS3CFvJ7dUmYfwhhOLE9qyRDyDTMQDFAdj9QlAI7olinMR7IQ==
X-Received: by 2002:a2e:9c8e:: with SMTP id x14mr9990711lji.312.1614687065578;
        Tue, 02 Mar 2021 04:11:05 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id d21sm835097ljo.55.2021.03.02.04.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 04:11:05 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/14] ARM: tegra: acer-a500: Specify all CPU cores as cooling devices
Date:   Tue,  2 Mar 2021 15:09:57 +0300
Message-Id: <20210302121003.15058-9-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302121003.15058-1-digetx@gmail.com>
References: <20210302121003.15058-1-digetx@gmail.com>
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

