Return-Path: <SRS0=lnQj=EA=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57445C4363A
	for <linux-tegra@archiver.kernel.org>; Sun, 25 Oct 2020 22:39:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E65D22263
	for <linux-tegra@archiver.kernel.org>; Sun, 25 Oct 2020 22:39:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWHyex5S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1420241AbgJYWju (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 25 Oct 2020 18:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392172AbgJYWjp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 25 Oct 2020 18:39:45 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A6A6C061755
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2020 15:39:45 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id a7so9426341lfk.9
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2020 15:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KhvSSd9j9+TOfmC9KN7OzPwUsgYOpVFogeAEL+Nnw6Q=;
        b=UWHyex5SaWc55kJis+QVMg33d8THg248O3ADbVCgf39LeQUVBC58QaimMlJTu/I3HC
         g22spgmBlZbrR/sJeUiY7DiUfqTSN79Q2R+Tmtu0Tdh7epNNlNCuuJHAPmNWUOlY7t7j
         Ofvt7pN3B/m/ARRrqy/O6FXX4ucnnror6lawY0GaKolT/v6yTSLj9cZa7gDIHD3VjLWj
         u4X+mRrq8/p9K0GLqZb+tjRSpFE9sh/j8tH9PskPF8t/GrKac2HZBCgs45Re+86Uyv4H
         0BTcdQ73gT6nXaizyaZckyC0bGuwrRQxoKWOLOHl/KEAFF5ylaeQSmHeY5q8oVzRVaVK
         tZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KhvSSd9j9+TOfmC9KN7OzPwUsgYOpVFogeAEL+Nnw6Q=;
        b=YrVQCyzyRZ8SQBqq/CRDjS/nQT+8+/wz/UxXwhBXWk/DaBKxV1hVtLpC7RvqbCIDUn
         OrMDwJodbkSU1RTLGBKXbaURYSjbk5351Sxa0EiyVwhL8JyfaXhhm/p95Mqc2zIGozUQ
         F6dktqDvy8ztjN01z28CFqO/2+XHDZLTrDAzo0EFMHSUmrZbJZ0aqiMVloPs5HHj6X+n
         l9/mlcD1/mhyuKARrwhvoi3AguVpi3x/gxNeTQkxRmHlPz8Pw/GIeQzU9XCGWgkxCVAF
         jw15mkXOyl4e+udzHYGzrJiJ4URJrtItPcekA37rE+wsgUIN/MmsRAibMW1sED3p5dbj
         d8Xg==
X-Gm-Message-State: AOAM533sFKSOCh7txihKNco7Pm++ltwfeHV7UwEfkGyyMwCKrIwdu7/e
        GoL4QjhVT8XahrVnr1uMCbs=
X-Google-Smtp-Source: ABdhPJx5ZthHI3OrvnIO5Ij6Og2ticQqxwNFiG4obk2G/YBa4tqnBDeimFfEbLSDGxzFvdtnR3T2cA==
X-Received: by 2002:a19:2302:: with SMTP id j2mr3722435lfj.78.1603665583714;
        Sun, 25 Oct 2020 15:39:43 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.gmail.com with ESMTPSA id f15sm855957lfk.186.2020.10.25.15.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 15:39:43 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/6] ARM: tegra: nexus7: Correct thermal zone names
Date:   Mon, 26 Oct 2020 01:38:48 +0300
Message-Id: <20201025223851.6984-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025223851.6984-1-digetx@gmail.com>
References: <20201025223851.6984-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Rename thermal zones in order fix dt_binding_check warning telling that
names do not match the expected pattern.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 88ca03f57b3b..fa6bbec7cbc4 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -1240,14 +1240,14 @@ sound {
 	};
 
 	thermal-zones {
-		nct72-local {
+		skin-thermal {
 			polling-delay-passive = <1000>; /* milliseconds */
 			polling-delay = <0>; /* milliseconds */
 
 			thermal-sensors = <&nct72 0>;
 		};
 
-		nct72-remote {
+		cpu-thermal {
 			polling-delay-passive = <1000>; /* milliseconds */
 			polling-delay = <5000>; /* milliseconds */
 
-- 
2.27.0

