Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94913C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Nov 2021 16:37:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378821AbhKZQku (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Nov 2021 11:40:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234710AbhKZQit (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Nov 2021 11:38:49 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC22FC061D75;
        Fri, 26 Nov 2021 08:19:59 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id r26so25481330lfn.8;
        Fri, 26 Nov 2021 08:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n2CS486VK3pErXweLhn8rqAyzxInSDaJTqOjIWkbv/Q=;
        b=o1DWMEb1T5JGVr+QWfi0T8rJPO9ShLpM0eQbXgMMr1Ed0qb2n7CzvFC7hCAawvCPjx
         FV77MEtaOndwrCgVn5Sl4KDEhJsbBKzAxNGNRXVBjPaL/LmhyrnWk260AE3Kij5qsMxv
         WaEC377zdSgBY0l6XBQdtMnvb65ENAdKn+3FvcPi/297odNW3wdI6m3NJI+lf72WHljj
         EVyvLb6/gON+hYDViwFpZGMAbtDN6k8BbdmGS2dSfkwbEVaklbvQsAgfgDnwTBcx6lTG
         HnR5BI5gcu1hbvTRG2a3Rbio74zanVGBd4Pj8kVpHVZ9Er58G3FegIsKtV4ByQChJjjw
         EDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n2CS486VK3pErXweLhn8rqAyzxInSDaJTqOjIWkbv/Q=;
        b=dkxejMJOjgszwsfZxuwt8a7A9syT3Nkf4l2Pi/HIGwu/vboS0aEkzJ4t9kDw+h9C93
         9jEoaanyI60yoUSdVWj/7qETLhhjSwJGi8VeG/Nlw2jBFOeCQkhUHEdRUc6LzGzCiIby
         Aqf0dHuVZmT6TUUCZfLar7wOrW/umwfjdV+RohvH4O6fw8qqhB8cwqo3+uLTI8GVVKrP
         iM6fbbkZKhtP/R+CqtCQOXhpn6UOWw5cbTB0qpH88Ku0rI9cshZf25O1oZG56btmzLXV
         MTysncUape4CNPfci83EZjO/nylVAX9zAJwM1zLRHIEFuFLfNenj/OOVC2zW5VZTkCt8
         cndQ==
X-Gm-Message-State: AOAM531fGtbotq24psdycxAahbceYP1TU4/WmNx51SIcIEI67k5R7F1G
        18Dkohu89ABcdA8Avl8sQ24=
X-Google-Smtp-Source: ABdhPJxufa09SdYBqo/kYgmkWvAdAZeSGh63a/rnmEQbEH51oFmeKfaB2ac9qq451gtYc6UF3a/UoQ==
X-Received: by 2002:ac2:4571:: with SMTP id k17mr29916266lfm.631.1637943598334;
        Fri, 26 Nov 2021 08:19:58 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:19:57 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 18/20] ARM: tegra: Add HDMI audio graph to Tegra20 device-tree
Date:   Fri, 26 Nov 2021 19:18:05 +0300
Message-Id: <20211126161807.15776-19-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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

