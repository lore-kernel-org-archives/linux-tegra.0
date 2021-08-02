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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E2EC4338F
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AB7760EEA
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233363AbhHBVVF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 17:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233243AbhHBVU5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 17:20:57 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB17C06175F;
        Mon,  2 Aug 2021 14:20:46 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id n6so25612836ljp.9;
        Mon, 02 Aug 2021 14:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z64X4Bjo7bOqkNFciGParEdzoTdYBC/xDLLBMEJIUck=;
        b=PZFLlBSz/ywSBUO3RsLj2qMDDEldFmgyCXdfvQ3DrYQPtmB4fn6L2/ZOIxf/jBnVM1
         k2iEeYlPI8GKanYCWvpoctRcsvVSAdbyX3VDb8kZ6bS4EWLYpOiyfBONXvANRlOeL9jd
         a+Pzr6m/X3JbU+TgOxu9Rx9WfTRt6Duxe1nkfmfuCxXnV5bvStjhiEjA7XUS7E3eBaI+
         ofgNDrGz0ACw4SFFpJ7iY8PFe1J0WQqasz4kBlhdRKhbxtO2/Y1tP6wYRKJF3FXuhDqD
         j56UJQsFrY8cjE8fmlZ9KDkq3e9h/HQVp6lgLM6yYkDjip3HVp6vz1o7GiZC5/d9HZG+
         OEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z64X4Bjo7bOqkNFciGParEdzoTdYBC/xDLLBMEJIUck=;
        b=TyoshdCueqbFNWWo1vgCSzN+GWxolZLVb0EM6a4XERflmnpnqkvdEm5uYAfLP+xrYA
         fKK6Z/drsTrBMdLaBz7vsvT9HZyVKHawOiMs6a4DHQHXHstIWebpyOzIngdYlAzS8eLc
         1BSKbk+1Dd+lEyMgcqjbFx4wOpT5KSN4MU6dhYxFiRyS0LV1Nxx2p5D+KAIrVWEO4N5Q
         LoqoP091oOYLpZiB0APcze6DCG5JhPtmwykJLklsTV+djkB14Gkgdz0tovZ8YUPlVm0S
         7mmMkliSMcrFFZ+Fl8x+8a3prVisI+flX7+YuBw+RuB3VJ+BfmTJurX+I//SmNEYdDGH
         idAQ==
X-Gm-Message-State: AOAM532GfMupVvJ6tfmgIJdssJxSkir6fxOsWkeBcBR/AvP/QivLOLyh
        FRmhojkH6ttrCkKPXl8GTvE=
X-Google-Smtp-Source: ABdhPJyRcYi0N6fRSERPZdTmowA3+1Zk4DWhHxZQ770qKBuFy8VcYjAui4F+XZSGVY28DVfSZZKKbg==
X-Received: by 2002:a2e:868c:: with SMTP id l12mr12754865lji.134.1627939245194;
        Mon, 02 Aug 2021 14:20:45 -0700 (PDT)
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
Subject: [PATCH v2 15/15] ARM: tegra: nexus7: Improve thermal zones
Date:   Tue,  3 Aug 2021 00:19:47 +0300
Message-Id: <20210802211947.19715-16-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802211947.19715-1-digetx@gmail.com>
References: <20210802211947.19715-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use skin temperature for maintaining temperature that is suitable
specifically for Nexus 7. Add CPU thermal zone that protects silicon.
All these changes don't make a significant difference, but it is a
more correct definition of thermal zones.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 56 +++++++++++++++++--
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 33985fca956f..9732cd6f20b7 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -1255,21 +1255,34 @@ sound {
 	};
 
 	thermal-zones {
-		cpu-thermal {
+		/*
+		 * NCT72 has two sensors:
+		 *
+		 *	0: internal that monitors ambient/skin temperature
+		 *	1: external that is connected to the CPU's diode
+		 *
+		 * Ideally we should use userspace thermal governor,
+		 * but it's a much more complex solution.  The "skin"
+		 * zone is a simpler solution which prevents Nexus 7
+		 * from getting too hot from a user's tactile perspective.
+		 * The CPU zone is intended to protect silicon from damage.
+		 */
+
+		skin-thermal {
 			polling-delay-passive = <1000>; /* milliseconds */
 			polling-delay = <5000>; /* milliseconds */
 
-			thermal-sensors = <&nct72 1>;
+			thermal-sensors = <&nct72 0>;
 
 			trips {
-				trip0: cpu-alert0 {
+				trip0: skin-alert {
 					/* throttle at 57C until temperature drops to 56.8C */
 					temperature = <57000>;
 					hysteresis = <200>;
 					type = "passive";
 				};
 
-				trip1: cpu-crit {
+				trip1: skin-crit {
 					/* shut down at 65C */
 					temperature = <65000>;
 					hysteresis = <2000>;
@@ -1289,5 +1302,40 @@ map0 {
 				};
 			};
 		};
+
+		cpu-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&nct72 1>;
+
+			trips {
+				trip2: cpu-alert {
+					/* throttle at 85C until temperature drops to 84.8C */
+					temperature = <85000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+
+				trip3: cpu-crit {
+					/* shut down at 90C */
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map1 {
+					trip = <&trip2>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&actmon THERMAL_NO_LIMIT
+								  THERMAL_NO_LIMIT>;
+				};
+			};
+		};
 	};
 };
-- 
2.32.0

