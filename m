Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E51FC7EE37
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 10:55:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239231AbjFIKzz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 06:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239126AbjFIKzw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 06:55:52 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9666E199D
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 03:55:50 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5149c76f4dbso2934923a12.1
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 03:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686308149; x=1688900149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zb/n1uKkl6zCJR22MO4oBlDKyV7/xZBROTLNhtH/YLA=;
        b=WuyI0LZvzTwfkK4VrJmGWvD2bpLoUafZEA94WQiGSKJ/vnMmXeqIFgVfh8GMDCAQF9
         lnpe4jqoXZDS3E1O5fg7FzCwwzd+JTKbeAGgU1D+pwWNu9t4/1Ndi0IBr/LfAjE5Hyt7
         VCbVido8x8n6gumM+riVzfcQP0ehn4AwLjVHsPt7KFSgFTP0IMKmnrvMFtjh9Lzh/Y81
         BRCz/dEh1PEhcJMeHN9i9zX7tkSxQoqDPRwgMaZL1kEC1E5JyScL3FUWCWaK0Hdja3pX
         QxQZBAjEEhue3+ePURAlUni2/uK+OurRYwWCVNdaoNXbt1sTogaD+PD22Gh2AlIO7caQ
         Uuqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686308149; x=1688900149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zb/n1uKkl6zCJR22MO4oBlDKyV7/xZBROTLNhtH/YLA=;
        b=JTkafn4xGox6tki7JmBv3lnJniAfkzm2JG1wmnqk6n/fqCQmN3GMBZnLfac3SjAJVC
         fi0zvFW0X1qODwzzHvGBRcU+YSNVeyhT8OjF8zPjJszDf1BuFQbToBFuc8vQsUBpiRXU
         QYx6ljQ467gjVa9WSZlPoXFk6OrhRRQ6oB82ONQ03TEU/U/DEjm3bNBcbE2ZaDqG/bd0
         +TqQHCaOC48437Zxqad+xcj8f0tqEZHZPj45355xJC2btWzlTC4Ce3dDFyH/eZ4e+NDh
         sF9BdFrTY2twSfWGoRUDDgW6BS50NoGzrBhdnwo9ol7fdRvd1z+gjsQ15Yr+d8BaDP7D
         U/ag==
X-Gm-Message-State: AC+VfDy6namnB+aIAPy7gURKrQRawIaO/+0wKctD6hFzjlvJzhWhnqVL
        5XmZ92OdoB5OEJtv6z16/Wc=
X-Google-Smtp-Source: ACHHUZ7G+mdWzfRZ9PaQKpeA7xSLxAQ/QZgCFNBjdtO1iL0Xmh/Vwj0w8DQuqrWmu1aVFpvN6YMgUA==
X-Received: by 2002:a17:907:36c8:b0:978:af67:c7ea with SMTP id bj8-20020a17090736c800b00978af67c7eamr1508291ejc.41.1686308148820;
        Fri, 09 Jun 2023 03:55:48 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id e26-20020a170906045a00b0096fc35ca733sm1140780eja.41.2023.06.09.03.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 03:55:48 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Shubhi Garg <shgarg@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] arm64: tegra: Add a few blank lines for better readability
Date:   Fri,  9 Jun 2023 12:55:43 +0200
Message-Id: <20230609105543.3730161-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609105543.3730161-1-thierry.reding@gmail.com>
References: <20230609105543.3730161-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Surround device tree nodes with blank lines for increased readability.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index e499010fc673..5f3d6dcf10a2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2247,6 +2247,7 @@ TEGRA234_AON_GPIO(AA, 4)
 
 		i2c@c240000 {
 			status = "okay";
+
 			typec@8 {
 				compatible = "cypress,cypd4226";
 				reg = <0x08>;
@@ -2254,22 +2255,27 @@ typec@8 {
 				interrupts = <TEGRA234_MAIN_GPIO(Y, 4) IRQ_TYPE_LEVEL_LOW>;
 				firmware-name = "nvidia,jetson-agx-xavier";
 				status = "okay";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				ccg_typec_con0: connector@0 {
 					compatible = "usb-c-connector";
 					reg = <0>;
 					label = "USB-C";
 					data-role = "host";
+
 					ports {
 						#address-cells = <1>;
 						#size-cells = <0>;
+
 						port@0 {
 							reg = <0>;
 							hs_ucsi_ccg_p0: endpoint {
 								remote-endpoint = <&hs_typec_p0>;
 							};
 						};
+
 						port@1 {
 							reg = <1>;
 							ss_ucsi_ccg_p0: endpoint {
@@ -2278,20 +2284,24 @@ ss_ucsi_ccg_p0: endpoint {
 						};
 					};
 				};
+
 				ccg_typec_con1: connector@1 {
 					compatible = "usb-c-connector";
 					reg = <1>;
 					label = "USB-C";
 					data-role = "dual";
+
 					ports {
 						#address-cells = <1>;
 						#size-cells = <0>;
+
 						port@0 {
 							reg = <0>;
 							hs_ucsi_ccg_p1: endpoint {
 								remote-endpoint = <&hs_typec_p1>;
 							};
 						};
+
 						port@1 {
 							reg = <1>;
 							ss_ucsi_ccg_p1: endpoint {
-- 
2.40.1

