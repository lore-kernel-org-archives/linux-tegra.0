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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCD1C28E89
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6587864E27
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377916AbhCCDbU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350254AbhCBMOh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 07:14:37 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8EFDC061226;
        Tue,  2 Mar 2021 04:11:08 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id q23so23610725lji.8;
        Tue, 02 Mar 2021 04:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rdupt1UDK+oerUYqy2oy5jodn6cciH+E0fxTCOAF0cE=;
        b=XopjqVPLoag5Q1cfHs2qDlou5T8ChZGKSF/uGINBvFPvqgwpSC8WSt31GRoJboVcV7
         PBwgDoqSHx2bT7oJx8xlgkEv67Pd55AFX2FaZ+PjhyinjKkx1pGDE9aIGygRD/+sNVNW
         hXyehYrzFxPraRB43TtDP9iBozeg/7GwCWLJY1LKo0nu4r//+J930REeUttSmv5B7n4P
         UEgDV7O05L8xEbja9L70Ff0lnLIt3es6g1Sbw+4gvNVXEnG83DMKBSiGn/q2lX+lItM1
         6BSUX5cPAaldJr95+GCog/HYIt0ezf3B609oQ7ErludJgK9ole+1ly9OtU6ZUVaPxfCQ
         Zmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rdupt1UDK+oerUYqy2oy5jodn6cciH+E0fxTCOAF0cE=;
        b=kKhjVAcSsr0o0YsRqdepsiUq9xObkJKzhzfLbQwiQXmXAE/6+I5oGAsSyybdelSvB6
         j9ZeQ4ywwODAGtC3Up8xjAlUStzhEw2ZeCo8hoOAm+ks+wykbK8+pdFK58jCu16qomBN
         7uSNUVoQkZzO4pf0T9rWZ4begwxZd420wzAjL5gEi72WElP8RTIcwf/hUKzpwlrIJpqZ
         VQubMRKsTltSDPXWEqJiL1xEjKA8GLh2lKYb5H3BBEIvQvk21zxBlOc5DASnZEgwL2KH
         AQII6kYifXkwzIWmI9aNdWih+3ENwv8LpKnzH/9oiBMYaEMeoZ/wVZ/Cbgpk5d6fD3Xq
         al0g==
X-Gm-Message-State: AOAM532Ur/SimAaIYKMzSfqXZCv3zglj9U1C+o6vBBnOq8mJA5KC5DgF
        tb0IbCjyWqlE4S1Me2QKKlE=
X-Google-Smtp-Source: ABdhPJxuwq9cW+xxlD8orsejBoXhOjneLZH/yCcyx0Wxq8EicXuvVK7igZG9ZZA/P3fRTYIcQwCJyA==
X-Received: by 2002:a2e:508:: with SMTP id 8mr11948709ljf.207.1614687067435;
        Tue, 02 Mar 2021 04:11:07 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id d21sm835097ljo.55.2021.03.02.04.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 04:11:07 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/14] ARM: tegra: ouya: Specify all CPU cores as cooling devices
Date:   Tue,  2 Mar 2021 15:10:00 +0300
Message-Id: <20210302121003.15058-12-digetx@gmail.com>
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

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-ouya.dts | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
index 0368b3b816ef..d36511d95d5a 100644
--- a/arch/arm/boot/dts/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/tegra30-ouya.dts
@@ -391,19 +391,23 @@ cpu0: cpu@0 {
 			cpu-supply = <&vdd_cpu>;
 			#cooling-cells = <2>;
 		};
-		cpu@1 {
+
+		cpu1: cpu@1 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			cpu-supply = <&vdd_cpu>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@2 {
+		cpu2: cpu@2 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			cpu-supply = <&vdd_cpu>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@3 {
+		cpu3: cpu@3 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			cpu-supply = <&vdd_cpu>;
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -455,7 +459,10 @@ map0 {
 				};
 				map1 {
 					trip = <&cpu_alert1>;
-					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
-- 
2.29.2

