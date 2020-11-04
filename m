Return-Path: <SRS0=aGvU=EK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED8CC56201
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 14:13:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 375A8221E2
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 14:13:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSNdABzw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730196AbgKDONJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 Nov 2020 09:13:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729946AbgKDONJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Nov 2020 09:13:09 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49077C0613D3
        for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2020 06:13:09 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id l10so2119236lji.4
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2020 06:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iYCpk74oX9C0MAqSjufDggsq2XnN2OkNsDVinMU9G0k=;
        b=FSNdABzwe7UEHqj+cJ1NUo4IPqSOpurDN/yPZS3JzPomXPG0mGS344KwdgeAMyF6r5
         lwQJQX4ChkUWtpOpfKTOfQOrBmqTgHV3WqOwFCupThR502F2zNq37ja7Sai3BXz1vXAr
         i9uEJBwWYMxASYN+lx7OL40S8i69tMzXsEtbMmu5IchnErS0mn7/bRlUkrUMSWmnhcad
         8QnM74lsgXReBBZE0LLp+cb0HNdqmEw49vybcX0ZE2lXm9Wsc4AKtcf6K4IHHzWxdf9n
         YcRfuZsQ9oE/ea+CvdvFUbAodp0RZYg4x74S88jsFeQstfOvpXMZxGF9UjVelvWoeFBD
         TuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iYCpk74oX9C0MAqSjufDggsq2XnN2OkNsDVinMU9G0k=;
        b=JMACQhUGGnhBoCpgljLIj1qllWUywCsppeTXngEHOXtBjJ25X0qYdpJrOqZ2hckWUO
         x2yqerelDXxl2/hn2kwCaruTuqAtFmq9bZCuEERKzvj3Cq+n50RMwWj5tl/ih/j+4EZ7
         rwI5KkrrA9Pobdp8SVt8jsLfbHyM9o5MyVSmlrvQntB7bVg0ZhTNpctg48HoXp7I6aAj
         YSKIheJSWuy8ExKigQPlasAkNNSGaAXI80M3NfiMsNjwUuOq8p4GLUAKh8x+hI4KQm0l
         gidT3ZQP8m6/kmrpmnI75YZ66vwj+sZ/snFzERTfTf1ELgdo2qSPi2OCRIeJMMWP7Ybo
         DoJg==
X-Gm-Message-State: AOAM532dLQGT5B257EqkKadfNo/fKR3WYr1BBF2rG19RhflS09M5pz5w
        3DUy0Y19g4R4sCTdjjE9+z8zXnhlucU=
X-Google-Smtp-Source: ABdhPJzdnP37KXvq7e2AJUwXlwGexfIDUqNpuHwBrCVxGzNXDUAgfkXHki88vXrE1dfJItrAOM3fNA==
X-Received: by 2002:a2e:b61a:: with SMTP id r26mr11114674ljn.166.1604499187827;
        Wed, 04 Nov 2020 06:13:07 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.gmail.com with ESMTPSA id z10sm411853lfi.76.2020.11.04.06.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 06:13:07 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v2 7/8] ARM: tegra: nexus7: Set video decoder clock rate to 408MHz
Date:   Wed,  4 Nov 2020 17:12:50 +0300
Message-Id: <20201104141251.25834-8-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104141251.25834-1-digetx@gmail.com>
References: <20201104141251.25834-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The default 600MHz is technically unsupported on Nexus 7. Assign VDE clock
to 408MHz, which is supported by all hardware versions.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 7fe584d69f5d..fb5b33f1bcd8 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -107,6 +107,9 @@ init-low-power-mode-hog {
 	};
 
 	vde@6001a000 {
+		assigned-clocks = <&tegra_car TEGRA30_CLK_VDE>;
+		assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_P>;
+		assigned-clock-rates = <408000000>;
 		core-supply = <&vdd_core>;
 	};
 
-- 
2.27.0

