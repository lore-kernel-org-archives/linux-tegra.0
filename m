Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7766C43332
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88F4764E66
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377920AbhCCDbU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350255AbhCBMOh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 07:14:37 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D80C0611C0;
        Tue,  2 Mar 2021 04:11:09 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id m11so22748469lji.10;
        Tue, 02 Mar 2021 04:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vf+9cpXQr7hrQ9itCdssJG4n/IaJKoI9Dc3YxNuM01M=;
        b=a79JNTAmxtvNJ5JGuSE0z336l1mDz/zK5uQW46fWtOKbjeUZMVxjS5M02Z+V1jX7+s
         Mc0Rc0LWXtHQKlNebHfmdKZn5QxH+4LMVRx0O6TXKeIRsGuso9q5LkJPzuk09EhMWHml
         /1BQQNn2gkxFWR9dLZbj6OW4bRZpBKjEt8koEz30KOosrC0BjrQu5r2lt2bsxVt6FHGv
         PY9ySGUrspX7uUei7VTeXiLTbc0NjZBUMtqS9IaMeAHaUL6Tr7uftQwd+U56QRy+iu56
         4DQxbnno/OnhVBkFCUuzwwovOJyF2Yrn/HNa5vkfpsPl46lqu1Y3O/R5CXDTMDSzabks
         dp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vf+9cpXQr7hrQ9itCdssJG4n/IaJKoI9Dc3YxNuM01M=;
        b=UEhwA0N1sM2V3bzXdYzv6fy5oQoCR7fgvSvQ+FcXjOwF6AlUV60pwp3Wg30+9i2O+Z
         Rk6zzMMCzvYIrqBz2z799z1VaDArMXNmod7nww9/rRGhUPO/MBBX53+HbRavpUkIDp/r
         UsZrXb2lvd3nHYh1mXl12+swCOPSn+vEStw1FVCZ/A5mjrhd3pFKZjAfnx/dUGEeOaiT
         PmYh81Lu5JEecamvLH7YlOx/oQYeDz7RBYK4vtIb3Y56d3sgPm097pEr/jgWikP2cgcm
         6gEf3lnmdL8J5M+YZjyAMED1EbS/53ESxQZbIgHnqOizxzSZZ/0Gwf5hK8paZgitU9uR
         Ac0A==
X-Gm-Message-State: AOAM5319Wt5IRsXsudD2qDhjPH43226kZaTYk5zsO9XkwbxpC7k0dA2F
        3P804Chg8GA/wIPIVbmUnsI=
X-Google-Smtp-Source: ABdhPJx17FjX9XMyDkvkanTtQAXGc7m7HBy2dzBAzTomZweAQ3sJUw+Dvy01XtoDy/oWcwRGzJb0fQ==
X-Received: by 2002:a2e:8e87:: with SMTP id z7mr575457ljk.142.1614687068046;
        Tue, 02 Mar 2021 04:11:08 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id d21sm835097ljo.55.2021.03.02.04.11.07
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
Subject: [PATCH v3 12/14] ARM: tegra: Specify CPU suspend OPP in device-tree
Date:   Tue,  2 Mar 2021 15:10:01 +0300
Message-Id: <20210302121003.15058-13-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302121003.15058-1-digetx@gmail.com>
References: <20210302121003.15058-1-digetx@gmail.com>
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

