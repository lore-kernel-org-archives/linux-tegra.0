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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B25BC07E9C
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:45:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7350761057
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:45:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232734AbhGKXrt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbhGKXrr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:47:47 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658A7C0613E9;
        Sun, 11 Jul 2021 16:44:58 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id i11so3746937qvv.12;
        Sun, 11 Jul 2021 16:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KJdxPBUta56zKY2A/GPPyayUN9N4DhRJNSq9joemkog=;
        b=OsOUcMFX5Lh5CXV8q2bNRnwGFoe2Irnj5CiR6hEvnYZm6U5HG4d7IqMWlXeZ2OdxKM
         XbtJXWua6Zx+WZAdgirqn9nDsbPMd3erBtqSkljZQYccgQMoEYmg/AcCwVaoh/RJyuds
         C7oU9gncraHyNGNzYul247O9CCRTo7OoSfn/8DsVGKdRZSXgVes5zwtWluWMglaKGsvL
         9Gn4DSfax2ULg6485ES0o33jX4wu03P4gvZABGIJhQTMtutpUSaP7KnWcHS5UvRjgfB8
         Woyr7lnP6T+3RByVNtSku400p6Aqm0xHAuqquCDhU37Tgjkm5zPLwQNHIuchZdLiAn7l
         0D7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KJdxPBUta56zKY2A/GPPyayUN9N4DhRJNSq9joemkog=;
        b=CN+JEhNlQRvpzUorlZOMb3jT1rdhf2np1ag3q59Yd57WJGnMkp6+jG6BpkVL6KLrR9
         gfyrLLwohMA896AgcygYMZuyvxhbbY/GhtuPq5QaqBRr+zjxsgzuMvBk8Lrk5BWQlgki
         OKfcCNftoiWsidCV68zAHaxZv1lzzX/bqfnPrcx5sckG7xLwesnlWm2fA0HBHsQKDtO/
         U9gJKHJLSG/0jpKxKYTY/dgRVQyORhj1L6W5r+1kJquL0/6wpCOF0mGmhRBWd+ps2fig
         dziqQr594gNQ7Cax5avtA+wKSUBnjlDNsiaDo0I5fwFOuEbaucI+IwIH5yaki481C+Xn
         8M6w==
X-Gm-Message-State: AOAM533lCUSDZE125gV0JpuQ65uY+XC0kOPyGFpUTEc+HDWtlzgoCYtt
        amJ6OlfTuluE0I7EHJgCBH8=
X-Google-Smtp-Source: ABdhPJzlnNAKVmIvDHOLtR5M3oL7o3zghfwdVhCxIXJpWp9KA6vPHeRXU3WQzjx4RB+BhbaKQoyV3A==
X-Received: by 2002:ad4:4b70:: with SMTP id m16mr10760758qvx.3.1626047097605;
        Sun, 11 Jul 2021 16:44:57 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id e123sm2146507qkf.103.2021.07.11.16.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:44:57 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 12/13] ARM: tegra: acer-a500: Improve thermal zones
Date:   Mon, 12 Jul 2021 02:44:02 +0300
Message-Id: <20210711234403.24691-13-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711234403.24691-1-digetx@gmail.com>
References: <20210711234403.24691-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use skin temperature for maintaining temperature that is suitable
specifically for A500. Add CPU thermal zone that protects silicon.
All these changes don't make a significant difference, but it is a
more correct definition of thermal zones.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../boot/dts/tegra20-acer-a500-picasso.dts    | 55 ++++++++++++++++---
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index c385b13d4faa..75ce986df958 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -1025,11 +1025,48 @@ sound {
 	};
 
 	thermal-zones {
+		/*
+		 * NCT1008 has two sensors:
+		 *
+		 *	0: internal that monitors ambient/skin temperature
+		 *	1: external that is connected to the CPU's diode
+		 *
+		 * Ideally we should use userspace thermal governor,
+		 * but it's a much more complex solution.  The "skin"
+		 * zone is a simpler solution which prevents A500 from
+		 * getting too hot from a user's tactile perspective.
+		 * The CPU zone is intended to protect silicon from damage.
+		 */
+
 		skin-thermal {
 			polling-delay-passive = <1000>; /* milliseconds */
-			polling-delay = <0>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
 
 			thermal-sensors = <&nct1008 0>;
+
+			trips {
+				trip0: skin-alert {
+					/* start throttling at 60C */
+					temperature = <60000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+
+				trip1: skin-crit {
+					/* shut down at 70C */
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&trip0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu-thermal {
@@ -1039,24 +1076,24 @@ cpu-thermal {
 			thermal-sensors = <&nct1008 1>;
 
 			trips {
-				trip0: cpu-alert0 {
-					/* start throttling at 60C */
-					temperature = <60000>;
+				trip2: cpu-alert {
+					/* throttle at 85C until temperature drops to 84.8C */
+					temperature = <85000>;
 					hysteresis = <200>;
 					type = "passive";
 				};
 
-				trip1: cpu-crit {
-					/* shut down at 70C */
-					temperature = <70000>;
+				trip3: cpu-crit {
+					/* shut down at 90C */
+					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
 
 			cooling-maps {
-				map0 {
-					trip = <&trip0>;
+				map1 {
+					trip = <&trip2>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
-- 
2.32.0

