Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8F8C4320A
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C43D6023B
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233313AbhHBVVD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 17:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233255AbhHBVU4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 17:20:56 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE68C061764;
        Mon,  2 Aug 2021 14:20:46 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z2so36253455lft.1;
        Mon, 02 Aug 2021 14:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h2tayO+VW0Pxa/hyOd1sZ0d0vUIZoHzaMSTDNtloZ98=;
        b=MSXb6hmHrasOzqopilqrcG0Qktg8AzZvp2h+4AkaudpkiSFH1EKvIYVkXddsJhl+oY
         uGGbz6lfQooVDwg8oAaLn6Qhwan3mS/PadLUnxYKtBzotbhbT3L4gFF+Md2hk1sU5kYC
         98UN5B9mm23mim1zMd9cbF5Ks8qVWQy2c3Yg3Ltskep0ycnjEYn6qP8VSM86z9d2CVtM
         aXG5J3NQpI2xE+ZgcaLCShkSA+PRgdUtXeIj70yMKAbSMUK6RPVnVaDq3IxI9T1myxbB
         gDM8iOPiHi+118u/xWcipsZFdUrjBVVYJDMHfYczJeULI05sO2lugfQtKYQnwnusf9HM
         QxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h2tayO+VW0Pxa/hyOd1sZ0d0vUIZoHzaMSTDNtloZ98=;
        b=mO8SKsp3j/ypeGY+yCjH+dLarSd/CqoZPI4ohYcSpo3ijaum9Wj8mkDIFqHOh5ooYp
         w2MEGkoPizf5R1GhA8bJyjJgOdbDdn2CY4A+01kmyJziIl3t75jIo/pYkGBwmiaYN3q7
         gUps8yEMO8Nn36jnolu21XBHGqqaRu8n2pcRc+dxNZ+hEsUV+YfmaqcG6FVCe5wjbchR
         ZZ8vYl8etlvI8t7JSgZ5LaSiXaOuj4KpG2kHYxfPLdNqHMfqpGCEIKga74UrIzn2fTty
         /ypEzqMGh187sWwQRbtdkX82y3RpBgoooWxLjLbBucBOKEWkY9q4eQUMCC0HttJjx+lB
         Mihw==
X-Gm-Message-State: AOAM530pBWgIWDWaklCOrn5PpzyiEIqk9LiYV8euA7048O4Vlfptp5zm
        KsnKr/HwQi4CYceEIn+t7aQ=
X-Google-Smtp-Source: ABdhPJwhNNpuZV+RpOFW34Rk5197ur8V5nGRrsUt89AuH/abCZYKesmtThr1rzu0iOQAg3n2R8IDQw==
X-Received: by 2002:a05:6512:2097:: with SMTP id t23mr6534079lfr.506.1627939244593;
        Mon, 02 Aug 2021 14:20:44 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id p14sm764942lfa.117.2021.08.02.14.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 14:20:44 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 14/15] ARM: tegra: acer-a500: Improve thermal zones
Date:   Tue,  3 Aug 2021 00:19:46 +0300
Message-Id: <20210802211947.19715-15-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802211947.19715-1-digetx@gmail.com>
References: <20210802211947.19715-1-digetx@gmail.com>
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
index 87fef4cb630f..2280d75b66ab 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -1029,11 +1029,48 @@ sound {
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
@@ -1043,24 +1080,24 @@ cpu-thermal {
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

