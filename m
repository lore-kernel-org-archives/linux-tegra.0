Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E49FC433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Mar 2022 18:06:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244652AbiCGSG6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Mar 2022 13:06:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244647AbiCGSG4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Mar 2022 13:06:56 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A667DE24
        for <linux-tegra@vger.kernel.org>; Mon,  7 Mar 2022 10:06:00 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id p15so33773844ejc.7
        for <linux-tegra@vger.kernel.org>; Mon, 07 Mar 2022 10:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HjVJhfYDKY6JhNaK8zTLW0LfkWsxKTe7EWmIfnlIFKw=;
        b=mvmaJHfKoQabSpTc5D1DiUY0P7i0afTKXwCLU+UvoLBNGo2n9SXIm4nWi88PdkhM38
         PT/bEl5XYy3CZywmWMO/y3HGYX5KTL4/8QE4E2MelJG5LfiIZqiyOhu8WLboR6oNJWGj
         et8idPnH4JkEdCaJ+qnOjC2evzgk3oGjLqMEOra79U2q50aJJ6YHuc8ltusMCNnMq9iZ
         +RN1yalXkd6jK9z9V7k8xOv5WCiUSkvUtdAK2nNtvPIUlso6FKUY261GM2pBKWlmG36Q
         47JWmIQn+v19Eg1fqGpPSFm+jUWcAWb89RuRra8s6zccVpX7DQcEPKWqPeuT/vrZZSu5
         m1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HjVJhfYDKY6JhNaK8zTLW0LfkWsxKTe7EWmIfnlIFKw=;
        b=XJ2gvW91nGHJEH5xOJtgU3UsbyB2Erkhp247NFplqP4h8ZyZyARMyDPtJ0rMjeaUI8
         CYmKOmBLtZuXYvN+bFiPgMU9t1i4ePJZklqLcYORKEWQj/EK+1LmBzJO0ag29l0P3Eta
         6x3LKvaDYarptNU9oA8MYPw0PzC4XTjCVXFrxyPYSTvyt6bV3PPE4xuj+nCm+Lpg1MBZ
         H0ufgfuB9JAoDrYkg0iZVxLFynFvj28jz1b9yhleb8su9/r4qGA3fjJ/3SgbSSGCDde/
         w5nVJgAXWWe9S3PScNgpmiWC5iDenZd2Pe+JqenXIFVS2ryHXpeYaWHrOrP+FjuWtmqz
         Fyww==
X-Gm-Message-State: AOAM53371HfXLUJZxWq+CwB7DaD68dq4WNsx/Ld1TJCX8Kkljxa8tRcr
        hhauUiBChoW4KULTSZenRqN/4z1kaHc=
X-Google-Smtp-Source: ABdhPJx4N6q/SoIpI+PjQSDZaEebx27zh3PpP2K0ITbePtOFmzaoGZKpM3HNQJ3O85c2xyy4ZjwwWQ==
X-Received: by 2002:a17:906:39da:b0:6cf:7f09:a7bc with SMTP id i26-20020a17090639da00b006cf7f09a7bcmr10468486eje.457.1646676358801;
        Mon, 07 Mar 2022 10:05:58 -0800 (PST)
Received: from localhost (pd9e51a48.dip0.t-ipconnect.de. [217.229.26.72])
        by smtp.gmail.com with ESMTPSA id z11-20020a50e68b000000b00412ec8b2180sm6585828edm.90.2022.03.07.10.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 10:05:57 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] ARM: tegra: Move Nyan FHD panels to AUX bus
Date:   Mon,  7 Mar 2022 19:03:44 +0100
Message-Id: <20220307180344.2168395-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Similarly to what was earlier done for other Nyan variants, move the eDP
panel on the FHD models to the AUX bus as well.

Suggested-by: Dmitry Osipenko <digetx@gmail.com>
Fixes: ef6fb9875ce0 ("ARM: tegra: Add device-tree for 1080p version of Nyan Big")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124-nyan-big-fhd.dts | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-nyan-big-fhd.dts b/arch/arm/boot/dts/tegra124-nyan-big-fhd.dts
index d35fb79d2f51..4db43324dafa 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big-fhd.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-big-fhd.dts
@@ -5,7 +5,13 @@
 
 / {
 	/* Version of Nyan Big with 1080p panel */
-	panel {
-		compatible = "auo,b133htn01";
+	host1x@50000000 {
+		dpaux@545c0000 {
+			aux-bus {
+				panel: panel {
+					compatible = "auo,b133htn01";
+				};
+			};
+		};
 	};
 };
-- 
2.35.1

