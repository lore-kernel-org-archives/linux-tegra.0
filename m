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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2269CC63777
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 16:14:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1C39223FD
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 16:14:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6Qs3qJd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbgKTQOH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Nov 2020 11:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728513AbgKTQOG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Nov 2020 11:14:06 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BD5C0613CF
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2020 08:14:05 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id p8so10594282wrx.5
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2020 08:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OHFaV8aWUgmoy0pBq3M33bxizG7JYxoF/RkNWGpM7gU=;
        b=e6Qs3qJdDiLjwxdYZwMd2ajHPEkw10KmuLiM7suIj+1fzXy6oscyNNtoMx0BjWEbYF
         9cBef+vvUv8Usun4tgulAI/IdQYSSi/RRIx2B+3iMhkT0A/GEZ2EsM/sf0LvObY/hTZi
         BwvpNyLnNGgtWXwm7U1XaO+vSWNAaMLvSqzamfvXEe1ahvttdvfPZR0/ZpkEfq0So7NU
         eApVA3cErZ0ZisfeH5qH9nKnNiABWKe7mJYeGXtbDswIL8kdKCtXgYHjb07YaYaIMPZy
         1eeJtd8QPLeEzCi1aVVgdBymijl8q18Pwm1xPkNma0l48a3ygTyMXoKVVGsnnQxOyuBB
         YQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OHFaV8aWUgmoy0pBq3M33bxizG7JYxoF/RkNWGpM7gU=;
        b=pU/vgRZTRdFCGv6YC2TyBafZQbrNwsNuTZ7362WZfABfNcQjTwydzSMlhNh8AHXOfb
         rENOp86+4quVP98swMWRFEKPvBFshx70eelojNLi52SoQ6xOqOC/483PCYzFaFH53gbn
         5ePP+q9aHy3XrR7d5GbslI0x1HPlYCKGS9MaC/Rh13lHVuy9Z9rSo66fS1Hf/ImHDWtx
         6tEUtLShXmgHjOHVUT3gGvMS7ydeBxXdpoMOBdH44A6sEDBoeV4x/FB4Hcel04Wo61Jw
         a3ZAToRfd5kejjIKIwUXzzaiG6Nn1xPXKXIWd/MQcqyte6CuDcqCkbwtsdgoKxu8BguY
         OiHg==
X-Gm-Message-State: AOAM533ZBz6QMsaUPC9JN4qKh5I6rrIp+r3BNumRTPo3lMq8YoVWskl3
        G20udPWT4CGj9BanNl2DALI=
X-Google-Smtp-Source: ABdhPJyXTb19C/nI6eN/TIgWjXf3bC58q9ubyyE14ZBMF+FKeRXFCNJryluDP7NGVzB8SvQtUX5xog==
X-Received: by 2002:adf:f183:: with SMTP id h3mr17382964wro.239.1605888844216;
        Fri, 20 Nov 2020 08:14:04 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id m7sm3253409wmc.22.2020.11.20.08.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 08:14:03 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: Hook up edp interrupt on Tegra132 SOCTHERM
Date:   Fri, 20 Nov 2020 17:13:56 +0100
Message-Id: <20201120161356.3880457-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120161356.3880457-1-thierry.reding@gmail.com>
References: <20201120161356.3880457-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

For some reason this was never hooked up. Do it now so that over-current
interrupts can be logged.

Reported-by: Nicolas Chauvet <kwizart@gmail.com>
Suggested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index e40281510c0c..de420a117e59 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -865,7 +865,9 @@ soctherm: thermal-sensor@700e2000 {
 		reg = <0x0 0x700e2000 0x0 0x600>, /* 0: SOC_THERM reg_base */
 		      <0x0 0x70040000 0x0 0x200>; /* 2: CCROC reg_base */
 		reg-names = "soctherm-reg", "ccroc-reg";
-		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIT_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "thermal", "edp";
 		clocks = <&tegra_car TEGRA124_CLK_TSENSOR>,
 		         <&tegra_car TEGRA124_CLK_SOC_THERM>;
 		clock-names = "tsensor", "soctherm";
-- 
2.29.2

