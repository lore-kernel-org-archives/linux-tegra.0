Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1E9C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243094AbhLIRiZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhLIRiZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:25 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54AA4C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:51 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id k37-20020a05600c1ca500b00330cb84834fso7148426wms.2
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cymjn62Bc94/0s5BgmiKE2DrvRhs5WBURtaV2oNuV0Q=;
        b=qFiokzWSkoLu4cWtldkWlZsxtiNjwY31fsKd1x6vqCIISA3N98IsFYRWloenZREYh3
         /MAhsbkh0Yk3eqtBl5CKQwycSCrS7RYfn/CJMGVt6Zv71NpRUDWl7LC3Aoz1Gazh9VnU
         NUnzROwJ1AJqd5vzdCMcoMEHU8kdsMcgp3oQUv2rDBI5w/z4J61BjLxt8Yq5tN+AneUZ
         PuK7Lw7TfDdiLQcdg0SnAQKRnjLumM6ebY6b/23rO7FjYdG9oubM3D9o4xBuPEZavrNT
         UOuo8ax2TPKZTvxfr+S6uf8ujdTJOLT4QEODZWlPw39FvPledVPDGmbdBmds9dt6Hb6M
         xlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cymjn62Bc94/0s5BgmiKE2DrvRhs5WBURtaV2oNuV0Q=;
        b=2DYpj9vSzbjLEveUV3gUMN4DZQyWnqdMKPyxL0tRndzMdekpUJdkOZJwum4MG84Qro
         kJuXt7MD8L+aFjsh3zB22duivYAil09eERNmb6YGAD4RG47XEn0DpyAdXCztcf6wJv1M
         PYwaprGYSnBCriJCkzBzAxArCNBfwI2O3u3LLhT10zFHZsbBRGGnhQbWdiDIsz906QdZ
         20k1hHYqES9JAz2eubyU4eZydvaDpdk5ZL95yUpaGewQfNqEqltx2zVAN5TT/FdnmCy6
         9UHRU1LShZxxPffvPqfZHs3Zi0212xoxLL9acpn85KPvsLu4pJqlu/fcNFQ96gYvpEw9
         Vysw==
X-Gm-Message-State: AOAM5324BkkAbwiYK9M9NrlZ117S1wDSemFgpJLfLmC3LixR0yOfViZV
        zYnyQfL88HnBRdCTK78VcUc=
X-Google-Smtp-Source: ABdhPJwx3O766CT5Nkx1eSkWsIiZdzcYFLPEPFaUb9+KmqJVlSffLd+WrG8m1OtjHh+3+8NmKylgfw==
X-Received: by 2002:a1c:9d48:: with SMTP id g69mr9342118wme.188.1639071289920;
        Thu, 09 Dec 2021 09:34:49 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id g4sm334138wro.12.2021.12.09.09.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:48 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 19/25] ARM: tegra: Add dummy backlight power supplies
Date:   Thu,  9 Dec 2021 18:33:50 +0100
Message-Id: <20211209173356.618460-20-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Medcom Wide and PAZ00 boards don't specify the power supply for the
backlight, which means that the Linux driver will provide a dummy one.
Wire up an explicit dummy to also make the DT schema validation succeed.
Unfortunately I don't have access to the schematics for these boards, so
I don't know if a more accurate description is possible.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra20-medcom-wide.dts | 3 +++
 arch/arm/boot/dts/tegra20-paz00.dts       | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dts/tegra20-medcom-wide.dts
index ed0e4012e140..b072d715999e 100644
--- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
+++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
@@ -54,6 +54,9 @@ backlight: backlight {
 
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
+
+		/* dummy */
+		power-supply = <&vdd_5v0_reg>;
 	};
 
 	panel: panel {
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index e4c6c1363fc5..dd80108ac72c 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -571,6 +571,9 @@ backlight: backlight {
 
 		brightness-levels = <0 16 32 48 64 80 96 112 128 144 160 176 192 208 224 240 255>;
 		default-brightness-level = <10>;
+
+		/* dummy */
+		power-supply = <&p5valw_reg>;
 	};
 
 	clk32k_in: clock-32k {
-- 
2.34.1

