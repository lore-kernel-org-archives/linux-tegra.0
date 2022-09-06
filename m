Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E66C54EE9
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Sep 2022 11:55:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234203AbiIFLzH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Sep 2022 07:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234166AbiIFLzG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Sep 2022 07:55:06 -0400
X-Greylist: delayed 1037 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 06 Sep 2022 04:55:03 PDT
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E6255C375;
        Tue,  6 Sep 2022 04:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=vxGf31ifyf//71TFFbElG9Jl/12kbtji9QBfXgEQi5A=; b=KqmoGrLYdnNXt4KMWljC0My8+t
        0NpCW+QDnp7a5maSVpfFrsRqAoGCEvwwkghgZKozFUGBwLj5TwmzBrcwBBILW7oLxzHHkcDklpuCx
        ymntnCx2R16DodGc4vW5cJ1QKomU5rmsGMFkyU9P4m4gD23sEcpWaLYCKSw+ioKQh2UaQOz5fgfFU
        fYmyC8wmacYeefDGI0jLAAyEfqrew/XjTCraKPQtluzrt5gZV393Nu9TyHq8idH+gTgEk9B0CeGAG
        Ol7RP1L8npeHUynL2KyWsBaiLg7Il3Fx+eCLJ1Yi1oGGMrHwKV3GRteO/tUmUhaWazL19tg/M1ym1
        7h3OjogA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1oVWKw-008BVO-Lq; Tue, 06 Sep 2022 14:01:46 +0300
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Fix ranges for host1x nodes
Date:   Tue,  6 Sep 2022 14:01:34 +0300
Message-Id: <20220906110134.2312707-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

The currently specified 'ranges' properties don't actually include
all devices under the host1x bus on Tegra194 and Tegra234. Expand
them appropriately.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index d0ed55e5c860..812f0177912f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1863,7 +1863,7 @@ host1x@13e00000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			ranges = <0x15000000 0x15000000 0x01000000>;
+			ranges = <0x14800000 0x14800000 0x02800000>;
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HOST1XDMAR &emc>;
 			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_HOST1X>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 81a0f599685f..b8f56e2e6c0a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -565,7 +565,7 @@ host1x@13e00000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			ranges = <0x15000000 0x15000000 0x01000000>;
+			ranges = <0x14800000 0x14800000 0x02000000>;
 			interconnects = <&mc TEGRA234_MEMORY_CLIENT_HOST1XDMAR &emc>;
 			interconnect-names = "dma-mem";
 			iommus = <&smmu_niso1 TEGRA234_SID_HOST1X>;
-- 
2.37.0

