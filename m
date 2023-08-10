Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40702C001DE
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Aug 2023 21:54:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbjHJVyt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Aug 2023 17:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbjHJVyo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Aug 2023 17:54:44 -0400
X-Greylist: delayed 514 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Aug 2023 14:54:41 PDT
Received: from out-123.mta1.migadu.com (out-123.mta1.migadu.com [IPv6:2001:41d0:203:375::7b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 820072D76
        for <linux-tegra@vger.kernel.org>; Thu, 10 Aug 2023 14:54:41 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
        t=1691703962;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=CMRt6eti4fdq/fHfQcqLDtDcyJiYOUnl9aiu4vyyz5s=;
        b=S3RF8RxxB8OLfW7zhWk7sZ7pxCINQuSY/OStvk1aYqKS5FvTMc1VELfBl5ArfhDh5P6nvB
        bIem0bUm7lZzqTcQi89qMF9tYBhlBx6a48lT5mRLRmXQVXgzUyEmRimymWwCG2UKhqWsH7
        q7QbSvmXgvfiOohcASDxt7tECcolEUw=
From:   Rayyan Ansari <rayyan@ansari.sh>
To:     linux-tegra@vger.kernel.org
Cc:     Rayyan Ansari <rayyan@ansari.sh>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: tegra: Enable IOMMU for host1x on Tegra132
Date:   Thu, 10 Aug 2023 22:45:41 +0100
Message-ID: <20230810214543.16235-1-rayyan@ansari.sh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the iommu property to the host1x node to register it with its
swgroup.

Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 8b78be8f4f9d..7e24a212c7e4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -93,6 +93,8 @@ host1x@50000000 {
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
 
+		iommus = <&mc TEGRA_SWGROUP_HC>;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
 
-- 
2.41.0

