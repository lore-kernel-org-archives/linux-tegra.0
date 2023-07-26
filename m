Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69617C001B0
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jul 2023 16:42:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbjGZQml (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jul 2023 12:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbjGZQml (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jul 2023 12:42:41 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F03A126AC;
        Wed, 26 Jul 2023 09:42:39 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fba86f069bso10903212e87.3;
        Wed, 26 Jul 2023 09:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690389758; x=1690994558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V6TFMPBF80cYVTDhJEh8/pvBxZxG1jUmhoRPJSGq0gs=;
        b=ZkBHPe9r7gXJIKI8OXvjFPGhIUUpBci9pi8pvGng0vHo06b9BrE4puEr5L0vvKBkTj
         J+3tctQWQAmTRUn2c2ZKfpTEr5hzLokHaSercBUc/w57TtEo/Q85ZECJjemySuzYmVX9
         CQgd5trhW9CW83UxmJejIf0hXnZJ+V+k+C2ol3zz52pghvrfmyq/16GHZqpotcCOaUU1
         9Ih/iLK+/CDaslc5ZxoDP3u7yQzMpER5B5NAn/Y9lKMKal/kizxenGJmwYp1DjEIJLGa
         BgQ5G/sz+YvUJZEYjGdine6A+duurBW8jfTLK3LcfjIVHiyFIXrfFYGEJ6A4eiyerLbB
         /grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690389758; x=1690994558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6TFMPBF80cYVTDhJEh8/pvBxZxG1jUmhoRPJSGq0gs=;
        b=X4LTGjPg75rJnBNCaPXIYVhj2VApCKmBtwqLcBJiykjROYE6QKwbUkMl8A1dOyamKl
         H7oZ1CndBFx4I+RU3pCH8E8M0TawvwMV6XGl24WvYyYUnRi/tgoFdv3bZnqYmkw3Id8a
         mdT0BPJgKBMzq7VbTcIf6IxZM9N0UiqIB9oqzmKh4k2Eaj8H56u5bDJitpd4kDHiEcva
         VdnlotdcucF43pXLxtP2fo+yrZrSymQnZBtfYTobAOkL5GQ5Oq7fjdnFfQ2mFAa0YZwp
         JVDXmBSyoVlDCNd3JJWOrPrMPQFh75woIu0tkGb6aIEk0jVUHSz3ugD+8hTppuq9tVuF
         KulQ==
X-Gm-Message-State: ABy/qLbPItNmqV9TJVyPXjQhLIuHi0wwYpEDfOF/scYl4GRvOrOKcD+a
        gfyT5egQR+Q/MrETwGVuZcv28KG6Mrw=
X-Google-Smtp-Source: APBJJlFIc3fZeNeCNBooNMXPO3qIK2kDEBBh6t2jwHRcx2t4iYyzRtZoAJ3mdv75dpqSz7P6cRQE1w==
X-Received: by 2002:a2e:6e11:0:b0:2b6:fca2:fc6e with SMTP id j17-20020a2e6e11000000b002b6fca2fc6emr1925345ljc.42.1690389757877;
        Wed, 26 Jul 2023 09:42:37 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id q11-20020a170906388b00b00988dbbd1f7esm9670276ejd.213.2023.07.26.09.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 09:42:37 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] arm64: tegra: Rename Tegra210 EMC cooling map
Date:   Wed, 26 Jul 2023 18:42:34 +0200
Message-ID: <20230726164234.2170955-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Rename the node to match the device tree bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 630a04bfc931..f520a1bde366 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -2077,7 +2077,7 @@ emc_throttle_trip: passive {
 			};
 
 			cooling-maps {
-				passive {
+				map-passive {
 					cooling-device = <&emc 1 1>;
 					trip = <&emc_throttle_trip>;
 				};
-- 
2.41.0

