Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4A6C4332F
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Nov 2022 11:36:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbiKCLgE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Nov 2022 07:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbiKCLf4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Nov 2022 07:35:56 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C695B120B4
        for <linux-tegra@vger.kernel.org>; Thu,  3 Nov 2022 04:35:53 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id bj12so4301408ejb.13
        for <linux-tegra@vger.kernel.org>; Thu, 03 Nov 2022 04:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YkwU1HQBsEo9hpr/puDhcsyP2Y0lqn8u+c4ry9hkky4=;
        b=bBnveJ+OX1DZyfNi3JRh5dlNAIs1Wg/l3xqeOfuV+rzi7d7EfzmG37n1lBg+mZOcDY
         I+PKtrSZs2Hhiexn9besp2D5S7IXBR1vccJn+ABBdpqp3/U3zwL+SQwlgNUtLeT95rLd
         sLfiCNRZ0cf7JH2522x1jRdxVZ9dqeRApR2YVQu/wU31692JIntq2cF7yx97OWkFRiV8
         /tFYUZsAqjGUU0q72hV7/Agx3ZO9RBk+/KEzB1y8RbEaq3gJwB419jI7Z6HnNVjz23TW
         YnRk1iNFw5EZoyn9Tkr4qkUhIVb8PWGisB6JDCHmdIHkyorrEIt3x8bg9XzCoa7DYnkl
         qrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YkwU1HQBsEo9hpr/puDhcsyP2Y0lqn8u+c4ry9hkky4=;
        b=uIQ+roeQLAef4ZiO0nknbTKBLQ9HgD9LZW6Bsrsmya93NqLuSC/Cy9h40rP3O3a1fl
         dviwwFNgwkDoFaYuCOK99tcbyG20UFoa7BcvwJvQtOHR9iLiBum2qenRsJ4E7HgJaGTy
         XyohmVAJcQHzPPxXjOJKrrumo+A6wmeiWhN4B3iUPvrq3e8KEvTqyOjqJupfwmUjuf8m
         PCRTsrYQx3ZoMaAENMK/425VGeSTiZ3qvPSg9HSNOuz1ZNGyNEMiNM6iv74ci9bptm6m
         3oaGUH/9vbr11IkG1y0kkHw9QJtg2bhMu1iyiw2BnYW738E4THP7y/oktYCUGfnXb6rr
         yNew==
X-Gm-Message-State: ACrzQf1MJm5ZohmoZo+8GlNiCUg0j/yZS6/EWV5X5yzS8tBo4d8A/yad
        sn1NrRdrRryboXf1aPu0ZZM=
X-Google-Smtp-Source: AMsMyM6uFZKxjkAHWdoXVGyrvN3d/nEQhwxEAOjH+1GgmQBPA72nYzOUB6cSZLaegf8ez9GHzCytZw==
X-Received: by 2002:a17:906:9bcd:b0:7ae:2679:c47 with SMTP id de13-20020a1709069bcd00b007ae26790c47mr284673ejc.353.1667475352150;
        Thu, 03 Nov 2022 04:35:52 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a13-20020a17090680cd00b00787a6adab7csm384285ejx.147.2022.11.03.04.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 04:35:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: tegra: Add missing compatible string to Ethernet USB device
Date:   Thu,  3 Nov 2022 12:35:48 +0100
Message-Id: <20221103113548.1462723-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

According to the DT schema in usb-device.yaml, each USB device node
needs a compatible string, so add one for the built-in USB Ethernet
device on Jetson TX1.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index a44c56c1e56e..4286e04e685c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1368,6 +1368,7 @@ usb@70090000 {
 		#size-cells = <0>;
 
 		ethernet@1 {
+			compatible = "usb955,9ff";
 			reg = <1>;
 		};
 	};
-- 
2.38.1

