Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14D9C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242876AbhLIR3a (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242849AbhLIR33 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:29 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254C9C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:55 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id v11so10903776wrw.10
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QU8yqsZf4hKB+fILRAdxJxvXG8LL+orBzsCkhhSWakA=;
        b=OC1woNge25SlEzP+3iif4IbgPczqrCHBzT7D6IyUzio7aWgPzTIzIngaa856ksv0za
         p/VFpzmDj4BSNdEvwrxkdRyz1nhh4GQU8iaU9qgFQc47Yb069JrHA/eZuT9Z0LgERJt3
         8ls8+sBw3JFmO1CHEG8miWFST84oNKpoysKL/Dj+04RNZ9Cz+fxaaf2PZvPHuWDYrzXs
         q8Rn7PWel3QuXfKwxhu5dNDsuODKfa8aRig/O/5Uo7wxNopGCbu8+vm/vADv20NZ/TJN
         zpL2G9BPa/aWACMDYc1MjtteCuIT8VQO1dX0JTtrlY9YN/WFFiMmFDRUF9GyH4z8Qs6o
         w7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QU8yqsZf4hKB+fILRAdxJxvXG8LL+orBzsCkhhSWakA=;
        b=RSW6ZXqQ1b6DfP0bwx8fEakR4tQwnv9tZ6HBpmBOcuoSBcOIv49NNZf+5arFuxK0k5
         1VCqAtSEeY89a08fQWB8yeElireGdkcQFP6hbkPXYWiPSgBAjONUPcDkV+1qKNBf+IDP
         NnIkT2005qDfT7I7PUrsKfR5XApghVPX541zxDYDnAXkQEHAn+kwzOANMpGZR3I6WRvs
         9HY2oIvxxI+O8Mcj2egbropv86p8nZuQlCfbORqfrZXIjQ99qWJms8pAfgkUKPU/uOL8
         Ed5Sc38ElQYbLxwRbvwa4xJIOi3hHO+kjRW5b+y0H9mnAty3FAwW1sK0Py5WxuG4n0KS
         jqpQ==
X-Gm-Message-State: AOAM532nDETneaZKV7y6GJTz6nxgxdXw3lFa65ck190+xqa1QXrHxdQc
        qxy+BjYD4DxZ2o+VAjdPHGE=
X-Google-Smtp-Source: ABdhPJzc8U18ZKJcnbp8ybrgXYC9jkmJdpzM+OiKbEt25MyB+vQgyCvrwOM0Uk+tIwirt4ut6SJ5sA==
X-Received: by 2002:a05:6000:144a:: with SMTP id v10mr7803206wrx.315.1639070753710;
        Thu, 09 Dec 2021 09:25:53 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id x4sm9191551wmi.3.2021.12.09.09.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:52 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 19/30] arm64: tegra: Drop unused properties for Tegra194 PCIe
Date:   Thu,  9 Dec 2021 18:24:52 +0100
Message-Id: <20211209172503.617716-20-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The num-viewport property is never used and can be dropped, whereas the
"iommus" property is not needed since we use "iommu-map-mask" and
"iommu-map" already.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 675e9f5db2c3..969b965ee125 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -2005,7 +2005,6 @@ pcie@14100000 {
 		#size-cells = <2>;
 		device_type = "pci";
 		num-lanes = <1>;
-		num-viewport = <8>;
 		linux,pci-domain = <1>;
 
 		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_1>;
@@ -2038,7 +2037,6 @@ pcie@14100000 {
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE1R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE1W &emc>;
 		interconnect-names = "dma-mem", "write";
-		iommus = <&smmu TEGRA194_SID_PCIE1>;
 		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE1 0x1000>;
 		iommu-map-mask = <0x0>;
 		dma-coherent;
@@ -2059,7 +2057,6 @@ pcie@14120000 {
 		#size-cells = <2>;
 		device_type = "pci";
 		num-lanes = <1>;
-		num-viewport = <8>;
 		linux,pci-domain = <2>;
 
 		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_2>;
@@ -2092,7 +2089,6 @@ pcie@14120000 {
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE2AR &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE2AW &emc>;
 		interconnect-names = "dma-mem", "write";
-		iommus = <&smmu TEGRA194_SID_PCIE2>;
 		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE2 0x1000>;
 		iommu-map-mask = <0x0>;
 		dma-coherent;
@@ -2113,7 +2109,6 @@ pcie@14140000 {
 		#size-cells = <2>;
 		device_type = "pci";
 		num-lanes = <1>;
-		num-viewport = <8>;
 		linux,pci-domain = <3>;
 
 		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_3>;
@@ -2146,7 +2141,6 @@ pcie@14140000 {
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE3R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE3W &emc>;
 		interconnect-names = "dma-mem", "write";
-		iommus = <&smmu TEGRA194_SID_PCIE3>;
 		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE3 0x1000>;
 		iommu-map-mask = <0x0>;
 		dma-coherent;
@@ -2167,7 +2161,6 @@ pcie@14160000 {
 		#size-cells = <2>;
 		device_type = "pci";
 		num-lanes = <4>;
-		num-viewport = <8>;
 		linux,pci-domain = <4>;
 
 		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_4>;
@@ -2200,7 +2193,6 @@ pcie@14160000 {
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE4R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE4W &emc>;
 		interconnect-names = "dma-mem", "write";
-		iommus = <&smmu TEGRA194_SID_PCIE4>;
 		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE4 0x1000>;
 		iommu-map-mask = <0x0>;
 		dma-coherent;
@@ -2221,7 +2213,6 @@ pcie@14180000 {
 		#size-cells = <2>;
 		device_type = "pci";
 		num-lanes = <8>;
-		num-viewport = <8>;
 		linux,pci-domain = <0>;
 
 		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_0>;
@@ -2254,7 +2245,6 @@ pcie@14180000 {
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE0R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE0W &emc>;
 		interconnect-names = "dma-mem", "write";
-		iommus = <&smmu TEGRA194_SID_PCIE0>;
 		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE0 0x1000>;
 		iommu-map-mask = <0x0>;
 		dma-coherent;
@@ -2275,7 +2265,6 @@ pcie@141a0000 {
 		#size-cells = <2>;
 		device_type = "pci";
 		num-lanes = <8>;
-		num-viewport = <8>;
 		linux,pci-domain = <5>;
 
 		pinctrl-names = "default";
@@ -2312,7 +2301,6 @@ pcie@141a0000 {
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE5R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE5W &emc>;
 		interconnect-names = "dma-mem", "write";
-		iommus = <&smmu TEGRA194_SID_PCIE5>;
 		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE5 0x1000>;
 		iommu-map-mask = <0x0>;
 		dma-coherent;
@@ -2352,7 +2340,6 @@ pcie-ep@14160000 {
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE4R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE4W &emc>;
 		interconnect-names = "dma-mem", "write";
-		iommus = <&smmu TEGRA194_SID_PCIE4>;
 		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE4 0x1000>;
 		iommu-map-mask = <0x0>;
 		dma-coherent;
@@ -2392,7 +2379,6 @@ pcie-ep@14180000 {
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE0R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE0W &emc>;
 		interconnect-names = "dma-mem", "write";
-		iommus = <&smmu TEGRA194_SID_PCIE0>;
 		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE0 0x1000>;
 		iommu-map-mask = <0x0>;
 		dma-coherent;
@@ -2435,7 +2421,6 @@ pcie-ep@141a0000 {
 		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE5R &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_PCIE5W &emc>;
 		interconnect-names = "dma-mem", "write";
-		iommus = <&smmu TEGRA194_SID_PCIE5>;
 		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE5 0x1000>;
 		iommu-map-mask = <0x0>;
 		dma-coherent;
-- 
2.34.1

