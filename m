Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797EBC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242849AbhLIR3q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242908AbhLIR3q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:46 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722EDC0617A1
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:26:12 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id c4so10910880wrd.9
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JtXU+DMDLDfLNzDZiFdyBboIv/D+jS1WmRGKpwuk5kU=;
        b=HayYS88hRj4tw298S/zFWFJnR8qPyxZ61yNfsaOIS2Fycf9m+T/8aEzE6RnsrRRmGy
         Epz4RkGl89IFHW+RuGGjoR708z8TQY7j8YlteSzwvKWZQAjtg0jXOPqncnIoZWvnQvK6
         TTld3pk5wJrl3v20Z4E40CGGcPfopAyCoFo49iZcdmxMsmOrsHBHmK0qJVaNg/Ut8Sav
         A0FNJvHa/zhDect07WVtM9SCxxCtNAEtmKC3b6sVVexR+bn62XT2LEvR0Khpfr9yOt0E
         SHaZyrQhdL8di2evVrI4qZR1RS5WZG9UgHE96Zoid7sDgT1qShGG7akzg8qvpMEO7jih
         IPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JtXU+DMDLDfLNzDZiFdyBboIv/D+jS1WmRGKpwuk5kU=;
        b=zgYXsbci4zIrKHA5E7vSmXzcAdAoTK4Omk8uu+Kh7Fzw8huQaG+nKsleI8pwA7LrmN
         dSxlE+dz8HEYFEsDaJq+WTDe0+HWjOS01OlKdN81ZOC9Yo2GzjBJzM2yqf6f99coX6iX
         qTjjH+jAn57gRA0sRzjETaAIczqW/XDRxHQo0D6wfBHxEzZ8Q9ZPp+c4DsV1WdMjJ1fy
         K3Lvpcf1cfVqjSsCRmweTdHbTvd4rrW2g+rqySB7MeWH8b+L/mWxnNo9uOcfg/M9gVK9
         JZa2JbReoWkjn8uytsFYJmcBn01yWrfLNv0rw1ZKU0louErpfkepp5lsA48jg1GZX506
         zMGQ==
X-Gm-Message-State: AOAM532uRnn05okhNWmn+PnYzsMw1qSmsV5uXpZlKrFWGt/AF2WURaV0
        qAoZEkuHgwazpKHx2d1niEs=
X-Google-Smtp-Source: ABdhPJxC8rEm7rFuNzhWNt1v6BNg5BUwhPLtSP/AmT7HI8XWWAlfYt1/xjhr8chmvcu8NYfXOCmfgw==
X-Received: by 2002:a5d:614f:: with SMTP id y15mr7937627wrt.587.1639070770989;
        Thu, 09 Dec 2021 09:26:10 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id v2sm355105wmc.36.2021.12.09.09.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:26:10 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 26/30] arm64: tegra: jetson-nano: Remove extra PLL power supplies for PCIe and XUSB
Date:   Thu,  9 Dec 2021 18:24:59 +0100
Message-Id: <20211209172503.617716-27-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The XUSB pad controller handles the various PLL power supplies, so
remove any references to them from the PCIe and XUSB controller device
tree nodes.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 542f51c07781..72c2dc3c14ea 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -30,11 +30,8 @@ memory@80000000 {
 	pcie@1003000 {
 		status = "okay";
 
-		avdd-pll-uerefe-supply = <&vdd_pex_1v05>;
 		hvddio-pex-supply = <&vdd_1v8>;
 		dvddio-pex-supply = <&vdd_pex_1v05>;
-		dvdd-pex-pll-supply = <&vdd_pex_1v05>;
-		hvdd-pex-pll-e-supply = <&vdd_1v8>;
 		vddio-pex-ctl-supply = <&vdd_1v8>;
 
 		pci@1,0 {
@@ -446,11 +443,6 @@ usb@70090000 {
 		avdd-usb-supply = <&vdd_3v3_sys>;
 		dvddio-pex-supply = <&vdd_pex_1v05>;
 		hvddio-pex-supply = <&vdd_1v8>;
-		/* these really belong to the XUSB pad controller */
-		avdd-pll-utmip-supply = <&vdd_1v8>;
-		avdd-pll-uerefe-supply = <&vdd_pex_1v05>;
-		dvdd-usb-ss-pll-supply = <&vdd_pex_1v05>;
-		hvdd-usb-ss-pll-e-supply = <&vdd_1v8>;
 
 		status = "okay";
 	};
-- 
2.34.1

