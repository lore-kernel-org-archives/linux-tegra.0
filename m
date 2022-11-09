Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DAEC4321E
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Nov 2022 14:19:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbiKIOTq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Nov 2022 09:19:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbiKIOTg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Nov 2022 09:19:36 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36D01E3D5;
        Wed,  9 Nov 2022 06:19:27 -0800 (PST)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 5234DFF803;
        Wed,  9 Nov 2022 14:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1668003566;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=07aa8e8fT8doZikfGZmbSjdF5gbvueSS4qnnav2hELw=;
        b=WF/bT8xY6heplVG8iPYA60kQYXK5xpTQmnjVVbPc8xzh7WmGRpvhCMu015ps/0Zm/zejA1
        bRDsJTvC9OumkIhRW79VmwZgb4WrT9q4jahAEZDgQDPMmUVJrcrSSy/ESpp5RwgvWOBT8X
        DLk6gV3C8qoXr/3oemLP8fDbct4oXfHnuRrC9PBPSEUi7+n/Mg6qVR8AzOGdw8eToABYDy
        6zu+rDF9vFejFMD4F/50FqvnKS++agbfO5WRegmKuxeCAnbRSr+x4vSiC/ek/1ZoQefNy6
        zOModhZGUskX91Jb/5C9xcIcCTo+mee6pTMIBIusSLhKtJIhBSquXvMuQ8af3g==
From:   luca.ceresoli@bootlin.com
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH 04/23] ARM: dts: tegra20-tamonten: add label to avdd_vdac regulator
Date:   Wed,  9 Nov 2022 15:18:33 +0100
Message-Id: <20221109141852.729246-5-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

Useful to enable it from a board DTS.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 arch/arm/boot/dts/tegra20-tamonten.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
index 6d51a5572a34..703293e9bd41 100644
--- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
@@ -418,7 +418,7 @@ ldo5 {
 					regulator-max-microvolt = <2850000>;
 				};
 
-				ldo6 {
+				avdd_vdac_reg: ldo6 {
 					regulator-name = "vdd_ldo6,avdd_vdac";
 					/*
 					 * According to the Tegra 2 Automotive
-- 
2.34.1

