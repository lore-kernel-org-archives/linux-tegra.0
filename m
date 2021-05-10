Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D442C43462
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 20:28:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AC9461433
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 20:28:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbhEJU3O (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 16:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbhEJU3M (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 16:29:12 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 665B0C061574;
        Mon, 10 May 2021 13:28:07 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id j10so25266325lfb.12;
        Mon, 10 May 2021 13:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dw+QlXrsFBiM0zWqW8M+Hk3AOAvI8eXnbQfBtso36FY=;
        b=eoYvWHwVMh+bc2fyZJpdD1jWbKQ7oDtVWB43tLb8YXwUdA1HkdEAuDhvJbczeXXxN6
         5xBQX4bZJ8ipZ8L/AniL2l6I+LpDbb1p8BvQ+YAwzi/VWe0ksN/UYs9+APyeSvo3oO0g
         cjuxUY0AwqktEFxrchzz7i1JV8mc1QQkjrM3hFRlTODB2kEpWv0WC3xlyyJ57vQu3yEX
         QZpDNlAi7wCVECsbptdC5K704AF6Swx8DLiQ0/YbiRMgT7PIvHwKk6iftg4RTFXayQC2
         sQfQIApc0VJVMeufMzQbrzKQdzIz7t+ijgf91GdWGXvCWhGAmW3QGLDM2wCWKtHgZRAu
         DFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dw+QlXrsFBiM0zWqW8M+Hk3AOAvI8eXnbQfBtso36FY=;
        b=ptNhc23mQFopqqvGUomGPBdrQtiiYYUjX4R6uUY7bSi472a5+1o83KwkuadpVW/6vq
         R7G5exfafez7fuXj8RsxIULOXXiC7BZD/Tyy/vt5lVkgx9EsdJFEs33jzIW12ZiTLu3O
         PBmDVAR6GPa0fq7R42pmi/9YOypmb/13DoznfYU6NKZf6sP4s8xMTpLOdyiE0eVVpYwN
         xRcl/XtiM2rALrQJ6MeXnWJCNdyyIXs/qoUtJItXyfi9gBEoQsnko1M4Y53VmmwFEWX3
         CuWFCcy9S/aqL/geZ1bcCSKhj7jpspIcdS/MKwUAmN+NGQGfv4QvYNuuTwPe98E5OudJ
         +/bA==
X-Gm-Message-State: AOAM5303qfjwF9ayWLQNQ2qI6eZ/jYgOVPcH7NECqRt03qm9CS8TOvF3
        aotKkaucyM6UjBHSH/ZgauzkBEtLFhQ=
X-Google-Smtp-Source: ABdhPJwpGNm/kNL1UdBVp5V5rUJOGVIvn8KK8Immcm2wXvyStQnG9sGeJfwamPShpvJZeX7C4LhB1Q==
X-Received: by 2002:ac2:4246:: with SMTP id m6mr18215649lfl.611.1620678485998;
        Mon, 10 May 2021 13:28:05 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id z23sm2360662lfq.241.2021.05.10.13.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 13:28:05 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/10] ARM: tegra: acer-a500: Bump thermal trips by 10C
Date:   Mon, 10 May 2021 23:25:53 +0300
Message-Id: <20210510202600.12156-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510202600.12156-1-digetx@gmail.com>
References: <20210510202600.12156-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

It's possible to hit the temperature of the thermal zone in a very warm
environment under a constant load, like watching a video using software
decoding. It's even easier to hit the limit with a slightly overclocked
CPU. Bump the temperature limit by 10C in order to improve user
experience. Acer A500 has a large board and 10" display panel which are
used for the heat dissipation, the SoC is placed far away from battery,
hence we can safely bump the temperature limit.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index eff9bfb2d442..15b7965599ee 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -1059,15 +1059,15 @@ cpu-thermal {
 
 			trips {
 				trip0: cpu-alert0 {
-					/* start throttling at 50C */
-					temperature = <50000>;
+					/* start throttling at 60C */
+					temperature = <60000>;
 					hysteresis = <200>;
 					type = "passive";
 				};
 
 				trip1: cpu-crit {
-					/* shut down at 60C */
-					temperature = <60000>;
+					/* shut down at 70C */
+					temperature = <70000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
-- 
2.30.2

