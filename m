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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B9FC433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:40:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E251423B04
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:40:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729582AbhAVUjq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 15:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729513AbhAVU2h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 15:28:37 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF5CEC061A32;
        Fri, 22 Jan 2021 12:25:18 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id v24so9302318lfr.7;
        Fri, 22 Jan 2021 12:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vf+9cpXQr7hrQ9itCdssJG4n/IaJKoI9Dc3YxNuM01M=;
        b=rZhKs2D1aJb6qS9R0QataRsQ7sS+OdEH+9WL0gktBo7+NhXq+G23tXZjrvrZlxc9/d
         hk6Vh9RJj+Twi7eEftJdeHYw7wDGmlXjtrZM3AjEI8FlSMOvBX4C+QaIhtYoDJ5d+8hI
         irLNKKREskJDGYk5/y179JgvOyBC4ltQNVwo6fMwXYqzOVmQdCISXJ2xMJRFlRy9HBYd
         zPtfR0UXBMqVepZV1uwabIMnXZWLHQ4TLtezhJ7ZeySKJcVnzVivNwheQm4ixzxJAO+9
         2vhu5xrKn8cLfNUJcPB/qGAg9kkwxkOrRRuqJyGsL69h/7OiEPWUYrdjK8cWOv2+uRKf
         ioeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vf+9cpXQr7hrQ9itCdssJG4n/IaJKoI9Dc3YxNuM01M=;
        b=mRNe0e2FzZIVc3Cerd0WFQOQPmkF0u68UAAJOEXmYcgIp7HpXexVU7y9uRJ/2wD+o6
         sssqcPiyuucjjF+p6ARB6rSQrRp/TOohU6cj+KQC8x/92Pcc0v5sNHJZz49Mgi+PVAED
         1VEagSvB/qvXXr5MQCtLnH98ulz0fnxvr8nvOHOk8N7MhvmB+FkdiPH7XWq97BMQFPJV
         V0Il9OcJcKbQE0EcGEc4syt+N15JBA3hXQ2sgKx212WRs1+AAi2uzh/w8IwrKd+eP3o+
         Sb2MA+gEVV1LNT61nzAcB/WMis/Gy7iN7ioOiW+4l4ffPOVxMnraytiIrCctCgqUEvlR
         /GFg==
X-Gm-Message-State: AOAM533OV/WJepHS6Ps/w0C7IBVtCdvyxhyNrP01rdUBJJlbGpVupeMJ
        u1Tm8bUDPRaot0poOIUblJ4=
X-Google-Smtp-Source: ABdhPJykCDty2zqk1aBZxpt2wxSSi/saD5Nytv29FpkyleNYXHFb4/rolIueJiL+/457y4v9HQI96A==
X-Received: by 2002:ac2:5ccb:: with SMTP id f11mr790981lfq.410.1611347117428;
        Fri, 22 Jan 2021 12:25:17 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id q5sm996921lfr.172.2021.01.22.12.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:25:17 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] ARM: tegra: Specify CPU suspend OPP in device-tree
Date:   Fri, 22 Jan 2021 23:24:56 +0300
Message-Id: <20210122202457.13326-13-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122202457.13326-1-digetx@gmail.com>
References: <20210122202457.13326-1-digetx@gmail.com>
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

