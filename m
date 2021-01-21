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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991A0C433E9
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 19:48:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6517E23A3A
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 19:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbhAUSrk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 13:47:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727552AbhAUS0A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 13:26:00 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EBEC0617A9;
        Thu, 21 Jan 2021 10:23:33 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id q8so3856975lfm.10;
        Thu, 21 Jan 2021 10:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vf+9cpXQr7hrQ9itCdssJG4n/IaJKoI9Dc3YxNuM01M=;
        b=o5Ye9gMF72fWHRBui21mTmICrBvCc5m9GXhaKHXa0eQguL40is2zgkaqEQlMynGhPo
         nitqtjR+M5tfz6nEmb80NB+iKhoetuV5eHQ7Z7I5Y0GMS6tLIS9Zi5074V7Mt6Lktss9
         SltRsP0fWngxdEwwUzAH2D+ADfv9QQZxU/4ntlaRz6iLMNxwpBi5NXm78A8ZkjAVkrhb
         xsDyCMT4yo0zYf193olm5DkQ4sikcJ9QDyU9/316wGJNtCwBSgNw388Hz0/6iCzWHab1
         Ec5AbDBDr7SbAlbfbdhBgkOmpCkn2+tkmaAZ9nJSWSfbMKGkkNZ62XwJmq4XCrBbq0dP
         m/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vf+9cpXQr7hrQ9itCdssJG4n/IaJKoI9Dc3YxNuM01M=;
        b=mdjMZ6FUszW5vTRPYyZ7v8O0uFfAPPcYiqJZeqpe5M1nm/O0VW2pw8SVwlL/jMiH+o
         2NJow4LPcs57ygkFrI6qNychSfJ+w3CTk4zBAb/qN0h5wBNjJvEP2CbIrQg0snJe33zm
         Lm5W7VSE1n1nyjgLrIAoue74Wro7fFt9WJlG/SSYVLMnknjJOmjgszdFd0R/oJSw6BQ3
         W7P6ydOXQcYtXIQ8/EMJjUtgX6zBEY2YhrMnW+klKmOrbGOAJeIo5NY6ACByLxAuthcm
         grshsfM24RHw0gMn/AUbBLUTlBgAkrA5FnmZyq5N7KcipT37OntC+tFIN6wsIC9UwLsR
         WO8Q==
X-Gm-Message-State: AOAM532rXpPXrlIv2oOIEXctFlQzQZ9jQ5nFHUfOuNHgPnzpyKv+XIrA
        MpfoqcQZgzOMDqX6ii1lKe7ZJXM36nU=
X-Google-Smtp-Source: ABdhPJwWbwh9KY8Tgl9qgPq1NZeHo/yQR3AVqMoBwuFZEFSV2OBQN2fr41MltvUP5ilxNIPDLj2AQA==
X-Received: by 2002:a19:8bc6:: with SMTP id n189mr215509lfd.291.1611253411859;
        Thu, 21 Jan 2021 10:23:31 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f186sm600537lfd.289.2021.01.21.10.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 10:23:31 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 12/13] ARM: tegra: Specify CPU suspend OPP in device-tree
Date:   Thu, 21 Jan 2021 21:23:07 +0300
Message-Id: <20210121182308.16080-13-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121182308.16080-1-digetx@gmail.com>
References: <20210121182308.16080-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Specify CPU suspend OPP in a device-tree, just for consistency. Now CPU
will always suspend on the same frequency.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-cpu-opp.dtsi | 2 ++
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-cpu-opp.dtsi b/arch/arm/boot/dts/tegra20-cpu-opp.dtsi
index 702a635e88e7..135de316383b 100644
--- a/arch/arm/boot/dts/tegra20-cpu-opp.dtsi
+++ b/arch/arm/boot/dts/tegra20-cpu-opp.dtsi
@@ -9,12 +9,14 @@ opp@216000000,750 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x0F 0x0003>;
 			opp-hz = /bits/ 64 <216000000>;
+			opp-suspend;
 		};
 
 		opp@216000000,800 {
 			clock-latency-ns = <400000>;
 			opp-supported-hw = <0x0F 0x0004>;
 			opp-hz = /bits/ 64 <216000000>;
+			opp-suspend;
 		};
 
 		opp@312000000,750 {
diff --git a/arch/arm/boot/dts/tegra30-cpu-opp.dtsi b/arch/arm/boot/dts/tegra30-cpu-opp.dtsi
index 0f7135006d19..72f2fe26cc0e 100644
--- a/arch/arm/boot/dts/tegra30-cpu-opp.dtsi
+++ b/arch/arm/boot/dts/tegra30-cpu-opp.dtsi
@@ -45,18 +45,21 @@ opp@204000000,800 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x31FE>;
 			opp-hz = /bits/ 64 <204000000>;
+			opp-suspend;
 		};
 
 		opp@204000000,850 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0C01>;
 			opp-hz = /bits/ 64 <204000000>;
+			opp-suspend;
 		};
 
 		opp@204000000,912 {
 			clock-latency-ns = <100000>;
 			opp-supported-hw = <0x1F 0x0200>;
 			opp-hz = /bits/ 64 <204000000>;
+			opp-suspend;
 		};
 
 		opp@312000000,850 {
-- 
2.29.2

