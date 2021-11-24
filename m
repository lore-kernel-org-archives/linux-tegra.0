Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA0CC4321E
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 22:06:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345341AbhKXWKH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 17:10:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352104AbhKXWJ5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 17:09:57 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9B1C06175D;
        Wed, 24 Nov 2021 14:06:47 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id u22so8383000lju.7;
        Wed, 24 Nov 2021 14:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n2CS486VK3pErXweLhn8rqAyzxInSDaJTqOjIWkbv/Q=;
        b=AzhidqPUkoUns8QOS62dAH1aAyY6x8WzVSMaCWSMW/v7EjfiKy6xrqhiqXmtxhUCmC
         /2G7YwfhBCmAhfarvaBJPMX6gaEcOnjUiG+Q+tOfpv7zbn0bRKLu+xWhqlyEz3y9hlU3
         oNRBMFHqkO74xCuNB5bRP5swXj65BF2de/4RtXs86ACsZT4NJiyw0ioVlhTr5kow+TM4
         S76hg0ZNS780AvAd1wHLb00xgPLbneEOhx7vragCXrctYxh4jYNgnW4qHXpytxHBeGrA
         B08iJ56WOCm7lFe5CwvMgy9Jg+21GDCxsdSkFq0eohdxR7psifo27PBS1xxiUThkk1In
         EhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n2CS486VK3pErXweLhn8rqAyzxInSDaJTqOjIWkbv/Q=;
        b=0j77POLuAW4DtPlkBEBSRQIpqdheATNbCgXwtegRILXb43GE54+ADMId4q3aIGG+6S
         2D9qymxmmJxmGHRUdqP+RVq1l+tztxqDF5uk39vG9Rz5U8L4ymmOwjU/weX715HZtqXQ
         MSzCYgzyO7AUB9LCuSzl63PiGBd/IXZAOPap+2CibjG3WdDZC2kWcBkqlYAu38PPMZWW
         2OHwXkgM3WUnnXr1qj/E1+lZrg9pkOE3/70tkMgxP/csq93gw+cbEHnug97dlR73rQny
         XOFryf2t2nxv5cFoOHRoykythN3xU8HX1QekE/hZ+2seHPmjoEzDjgEWinXGwgvnE7sO
         hqMg==
X-Gm-Message-State: AOAM533wW/Azs9m2RcX014fGPiix9gT6yBjWdqFj+A62EUWfzmxxd6CR
        ClNLRMBvpCQUjjepjoMuHhg=
X-Google-Smtp-Source: ABdhPJwRHr0nxYuROaGQUAZSqmgr+yRP+LZJ4IR9xN3LqBlcWJvx+zvAwwT+8xfj2BU3q2YKedVOLw==
X-Received: by 2002:a2e:94d7:: with SMTP id r23mr19197418ljh.224.1637791605366;
        Wed, 24 Nov 2021 14:06:45 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:06:45 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v1 18/20] ARM: tegra: Add HDMI audio graph to Tegra20 device-tree
Date:   Thu, 25 Nov 2021 01:00:55 +0300
Message-Id: <20211124220057.15763-19-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add HDMI audio graph to Tegra20 device-tree to enable HDMI audio on
Tegra20 devices.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 799da7dc929b..a2cdc591b4be 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -186,7 +186,7 @@ rgb {
 			};
 		};
 
-		hdmi@54280000 {
+		tegra_hdmi: hdmi@54280000 {
 			compatible = "nvidia,tegra20-hdmi";
 			reg = <0x54280000 0x00040000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
@@ -1063,4 +1063,24 @@ pmu {
 		interrupt-affinity = <&{/cpus/cpu@0}>,
 				     <&{/cpus/cpu@1}>;
 	};
+
+	sound-hdmi {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "NVIDIA Tegra20 HDMI";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+
+			cpu {
+				sound-dai = <&tegra_spdif>;
+			};
+
+			codec {
+				sound-dai = <&tegra_hdmi>;
+			};
+		};
+	};
 };
-- 
2.33.1

