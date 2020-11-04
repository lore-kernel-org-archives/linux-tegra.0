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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8FDC2D0A3
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 14:13:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74B1F22280
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 14:13:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRKOU8vW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730140AbgKDONI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 Nov 2020 09:13:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbgKDONF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Nov 2020 09:13:05 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2727C0613D3
        for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2020 06:13:04 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id d24so23073220ljg.10
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2020 06:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xlc0MWHt15HPSLrLzL3s9EyCUnRKIC0CHM1QmQg0a/E=;
        b=BRKOU8vWfpOZyHqVJlMAa3rHVsBDXJaMUzpVjD9yMrEWRlFTMTjFfeDp0mP5SopyhN
         hn0EOZFpzdlfUGfbJgzARVl/0BbjsKZaYzhe/nw9HoEyUJeu5GvHwKzd1PRkYfUPF0gp
         lF5xwEKw/A1O0zOrkYlh+OEUfZdOkoOlLog7GDE5m04ytmCxQ/CYAHEQQnuUlY8P1Jhx
         9zvemw/ll7ytZqG6dVxCIKk4jt/qSWH76MRYpvLxuyhCyRKNd+Ood75OC60OJpebyRxe
         NT3ljeQ8XYuHBi/lhXpYZGY9FaK/15tw19Vu3xoUEdVX+72X+cybG8/IQtoHjXT4gMeF
         M5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xlc0MWHt15HPSLrLzL3s9EyCUnRKIC0CHM1QmQg0a/E=;
        b=F+68XAJ2EpH2HhxUWDYmsj6pRA2exff/JyHx1PKAUYusgm2YLYKIGYnIzsbek1KZHE
         3x5KsepVjL5sgGyy82M+sskiu+TFjOKXTqfyCKroNe1pakzCA9VEz1Q+D3fM36otrZHe
         i1hoF/b6OlMtxj69Veffi82n1bGDVSyor/8lXClgmvIHhgueXmIJ78T48nva8IjdsJHq
         HULTa9LKV3EiFzv5p38YBjn1mLIwHa7jR16Krl1YGwituAWYLizfwb0C4g09JWWJ95nr
         EQfbEuCKEcLsxzszPY5oawzKcmeIvKK4dNz5+oHVW8DMcfkbyduOOLIVJ71RPmsKFZIe
         /yMw==
X-Gm-Message-State: AOAM532aiNyP/p+MUwaHYsCd5XrsRWluJoNy476j+hMbAiAWfIDrx1gg
        T36n/WJWRNjPy9cZhD26YoM=
X-Google-Smtp-Source: ABdhPJzCeTNHBR6t1XYHp7RLl4GctJAKhLggpCMKTbLqI7HjZEz7LVwzPGU+LQ+/SCI9MaCLC4mgOQ==
X-Received: by 2002:a2e:87c6:: with SMTP id v6mr11256812ljj.233.1604499183354;
        Wed, 04 Nov 2020 06:13:03 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.gmail.com with ESMTPSA id z10sm411853lfi.76.2020.11.04.06.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 06:13:02 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/8] ARM: tegra: acer-a500: Add power-supply to lvds-encoder node
Date:   Wed,  4 Nov 2020 17:12:45 +0300
Message-Id: <20201104141251.25834-3-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104141251.25834-1-digetx@gmail.com>
References: <20201104141251.25834-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The lvds-encoder binding now supports power-supply property, let's specify
it in the device-tree for completeness.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 8e3e79b734b0..09329cb4993a 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -950,6 +950,7 @@ lvds-encoder {
 		compatible = "ti,sn75lvds83", "lvds-encoder";
 
 		powerdown-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_LOW>;
+		power-supply = <&vdd_3v3_sys>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.27.0

