Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADD4C7EE43
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 13:17:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240414AbjFINR3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 09:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241344AbjFINR1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 09:17:27 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BADA430FA
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 06:17:19 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-977c8423dccso611732666b.1
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686316638; x=1688908638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZC+83IQO3tDZMU/hWCwdjKY5MKgqfTZ0+ZA7DpdIrU=;
        b=qMssm9puo1o75pg9F23DYqWlv0d1oJJMi36KjsU8Xlf+XbustpNOvfTacAMqQa9kS3
         Dc0Fw8obOCj5bBsWXX8suCcBQDnXaSzryO/tpcbBnKoBIf4aytXxmfJEoj9l4vaur55g
         fNZAmkYs0lCbBb6/WRFPdep1aExQ3GZr0klb+JALeacHTVr2PWHcpE2KrgH2eG6cFaCx
         ibDg1fa4S4I3PSie7fHhdDN2lxzfJtQp0HvfbZ4kWfc+X+wsOfuKKLcswvVeSOxek3/V
         Mb/Yu3vk9eaToxeyFSt2KjbAxBQFTB+/tazANFFzrNtSAFYA06Lonb2zkd9+OKUbCvfQ
         DtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686316638; x=1688908638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZC+83IQO3tDZMU/hWCwdjKY5MKgqfTZ0+ZA7DpdIrU=;
        b=b/+9ZKRrue7tMXMJgoeZ19W0qCqmt44mwc4VsxjrrWtfGDaFwnSg+M2dvSqt1z8+AE
         ZyRVsfoUIXCeyF8Ji6kYJocFN9ODh8duA/HV0rkuNF2C8XDiiXp6vvsfy8LI+XPGI5GA
         BEhuhEXGht/NWT01FWu4tgtPvgqPKfZzslwr10oGJoTfVyugaILRsfwV+7K20iylU1pA
         knyvwiNbMlDjzJCWJ6mUF9fXd8HVEr3imYiV2uDGxHWlwVD04+Da2lFYQ8BMoe1mmVnY
         pEEyujMpI6EOKu/aDG9ZktteigLr+mWMZUVc54Lm7wnC4vVw6BLuChZkoOGdsHf+fSDR
         dPpA==
X-Gm-Message-State: AC+VfDwpD48AYQtP48Fm9XnnZ1DPyH1R/nCu+0kjYMZlAsaas8HHeO5g
        1Haegf/LXlxIyH40NWUGITk=
X-Google-Smtp-Source: ACHHUZ4KEOpk7BhaDINZT6G+VtByluz6b9BSkystW9LxtzXosN/M+oBkSxtHnoeX46RT62YlreGiDw==
X-Received: by 2002:a17:907:3ea9:b0:977:d55a:6946 with SMTP id hs41-20020a1709073ea900b00977d55a6946mr1610614ejc.36.1686316638221;
        Fri, 09 Jun 2023 06:17:18 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090671c800b009659fa6eeddsm1269796ejk.196.2023.06.09.06.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 06:17:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Yi-Wei Wang <yiweiw@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 4/4] arm64: tegra: Enable thermal support on Jetson Orin Nano
Date:   Fri,  9 Jun 2023 15:17:11 +0200
Message-Id: <20230609131711.3826912-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609131711.3826912-1-thierry.reding@gmail.com>
References: <20230609131711.3826912-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Enable the TJ thermal zone and hook up cooling maps for the PWM-
controlled fan and two trip points.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../nvidia/tegra234-p3768-0000+p3767-0005.dts | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts
index ba66c1845f75..9b86aa6f7dbe 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts
@@ -10,4 +10,24 @@
 / {
 	compatible = "nvidia,p3768-0000+p3767-0005", "nvidia,p3767-0005", "nvidia,tegra234";
 	model = "NVIDIA Jetson Orin Nano Developer Kit";
+
+	pwm-fan {
+		cooling-levels = <0 187 255>;
+	};
+
+	thermal-zones {
+		tj-thermal {
+			cooling-maps {
+				map-active-0 {
+					cooling-device = <&fan 0 1>;
+					trip = <&tj_trip_active0>;
+				};
+
+				map-active-1 {
+					cooling-device = <&fan 1 2>;
+					trip = <&tj_trip_active1>;
+				};
+			};
+		};
+	};
 };
-- 
2.40.1

