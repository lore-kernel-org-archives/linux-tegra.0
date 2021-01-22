Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0712C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:39:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 883B223B08
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:39:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728491AbhAVUix (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 15:38:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730251AbhAVU26 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 15:28:58 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76BB4C061A2D;
        Fri, 22 Jan 2021 12:25:15 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id q8so9275018lfm.10;
        Fri, 22 Jan 2021 12:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b+B62XwmqyZC9IlWhkday5kt92nQ4ggX2fs7NsJsHQ4=;
        b=bdeuCrJoFfd6ftO0JUtHn/oDKORKTCIY7nWts8KPCxl88M8YdVK83XxGerJTMzOy+c
         dqdcUSpSjrkLWO5KGEZmn+H4uC44XMuHPrf6bXm6UfloGJIns5p2ZyOpyz4pjDYIRWAA
         PLHFp0AoOgXpS/sAsngmIvtnX4N3yuxXOEHwndpPHpwNbV9khJvjVugTYwsEQJEfH3Xn
         vjie1JpRQbPQQOCnEK+XDVtMGN7fosjDI9T8fh42kkOmuE+dEc7uudDA0mUTZBdq2QZe
         olB8fN14asu+2MNCaI/2klpczsWK7z6drPJ8ZBxXoWXyh1j6eK3+4ZwxTSFgMY0pawVW
         ot6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b+B62XwmqyZC9IlWhkday5kt92nQ4ggX2fs7NsJsHQ4=;
        b=K/2wYlVjPPE85HP1Gc+kbJGUfLkqZ/9wlMkXI3VxEMeLdbeAqUymgaSyAxZVRYHmJr
         aTkaMeJn79jf+8KVxz0CHJpUoxZNvjWx9LyTMVDGgLtTnRrhV6ABLhnTInMZWTvaaAEJ
         DkFvBuD2sbUPLBCxQxApcN2/fUyj1sLjKYdql295Pjsh4M5bIBGE8aGk3so8mb97vlx+
         5RyeTuqh5uZJrr3zJpcIaT8Id+JIHPiJR47lDcfSjQLjm4A0U4Q9FZXytJsPCU16Xmvp
         TJwM6lejFTO3aN2W71iq1jLv3FznqJRO70KyzTJAxbb5P77T4NVWILvr5AAwao94mIu7
         xv1w==
X-Gm-Message-State: AOAM533gNB4ldK1r7P02VAYpeMbmwATcSW0SUiR/560CH09qlBFZdpBr
        unqFiC0bkJKl0S3ShDIsSHI=
X-Google-Smtp-Source: ABdhPJzpj12bRLw+RDc1CuLIC+XHz5tl6xSiTeXsCC2ZzcOYFBzuBXukQKJYwoTmoSdDhqhR7fGU5A==
X-Received: by 2002:a05:6512:2251:: with SMTP id i17mr2821668lfu.566.1611347114065;
        Fri, 22 Jan 2021 12:25:14 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id q5sm996921lfr.172.2021.01.22.12.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:25:13 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/13] ARM: tegra: acer-a500: Specify all CPU cores as cooling devices
Date:   Fri, 22 Jan 2021 23:24:52 +0300
Message-Id: <20210122202457.13326-9-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122202457.13326-1-digetx@gmail.com>
References: <20210122202457.13326-1-digetx@gmail.com>
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
index 0d228e2dd158..4dcec18b677b 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -838,9 +838,10 @@ cpu0: cpu@0 {
 			#cooling-cells = <2>;
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			cpu-supply = <&vdd_cpu>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -1070,7 +1071,8 @@ trip1: cpu-crit {
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

