Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82EFC43462
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A371961076
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233436AbhDTR0a (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233425AbhDTR0a (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 13:26:30 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE6CC06174A
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:58 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id d21so25958524edv.9
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b+gcX7QLYFedaKK3PFF/F9GzHOyqGf+ot42j7r1TxHs=;
        b=sOFsUmtlOkQ1FNXEJgFbhY1pSTlHraytgyFe1/zfDkQq0R3qks8fy5Gv1+b+pQJ8JB
         LQK/eDSbcL7lrLnXeeRxdecgQEHe9WJONDYUvvKy3jirv4XJ/DIYOFAn2TrHCvsHINTa
         NRPf61ok9OinrN7mlnkCWs7jys0yPZfKdkTvQ6dIWa0qevTu9YV2yFa7TRtj/Jy1wBB7
         4AhBWQ7MIftyf5852WoHsekyCxUWEgxeerPynoaShxB14LuYzbEc+077PX2KVQ7V9V8L
         wsIdl9xXw9LmEasbbO+u7YbAswflpLrIEhkQI+kQO7JxrnfCA02TrlFTH2TGd2ipLb5z
         nuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b+gcX7QLYFedaKK3PFF/F9GzHOyqGf+ot42j7r1TxHs=;
        b=MUJifi5CjqFQtpPFA/N35WYLX7sqTQAgazcd4//9PljoREgQjuarWfZna57FxPWwRm
         2vukHNJ4qI8zs8e3in32WATkSZSxcqwCAZpyMfRx1lBNQLMJtuuNw9GtPy6LjrKFsldU
         achAPnhT8nTviFNqMRpcSVX10wVZWWd0KoNYR05mSlcTqiBzFpo96teYgbsJ5KlEAHTW
         dRjqdIROcqS+axJH/HV5NFt/idVmsAQlGWy61jqz6q7qFwhdkbz5LhrZIN+YdQlqCvXB
         hHAM99nGXGWxw4gun3qAsFoHg2+hUNqjPfRXDeoZuYkU2Ql63mRdXavx9RWLGVraKHUc
         X6sg==
X-Gm-Message-State: AOAM532MaNoACZOf0F7z2PvyrZYG9K1eCnqWq9ZXkeseVkASPz6dO9dN
        158a8QC6BYXT3hYz21eBWK8=
X-Google-Smtp-Source: ABdhPJyn6VVoJVjh1rOjZCxZEO80f8/wc1nwEZrQ6XMCSWenGkk+FcfiKE+WbZ2gJzzNVqcPPOqQDg==
X-Received: by 2002:a05:6402:7cf:: with SMTP id u15mr27230480edy.297.1618939557077;
        Tue, 20 Apr 2021 10:25:57 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id pv21sm13187833ejb.109.2021.04.20.10.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:25:56 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 10/10] arm64: tegra: Enable SMMU support for display on Tegra194
Date:   Tue, 20 Apr 2021 19:26:19 +0200
Message-Id: <20210420172619.3782831-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420172619.3782831-1-thierry.reding@gmail.com>
References: <20210420172619.3782831-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The display controllers are attached to a separate ARM SMMU instance
that is dedicated to servicing isochronous memory clients. Add this ISO
instance of the ARM SMMU to device tree and attach all four display
controllers to it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 80 ++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 6ed296e27158..00f8248f216e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1305,6 +1305,82 @@ pmc: pmc@c360000 {
 			interrupt-controller;
 		};
 
+		smmu_iso: iommu@10000000 {
+			compatible = "nvidia,tegra194-smmu", "nvidia,smmu-500";
+			reg = <0x10000000 0x800000>;
+			interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
+			stream-match-mask = <0x7f80>;
+			#global-interrupts = <1>;
+			#iommu-cells = <1>;
+
+			nvidia,memory-controller = <&mc>;
+			status = "okay";
+		};
+
 		smmu: iommu@12000000 {
 			compatible = "nvidia,tegra194-smmu", "nvidia,smmu-500";
 			reg = <0x12000000 0x800000>,
@@ -1441,6 +1517,7 @@ display@15200000 {
 					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
 							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
 					interconnect-names = "dma-mem", "read-1";
+					iommus = <&smmu_iso TEGRA194_SID_NVDISPLAY>;
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
 					nvidia,head = <0>;
@@ -1459,6 +1536,7 @@ display@15210000 {
 					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
 							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
 					interconnect-names = "dma-mem", "read-1";
+					iommus = <&smmu_iso TEGRA194_SID_NVDISPLAY>;
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
 					nvidia,head = <1>;
@@ -1477,6 +1555,7 @@ display@15220000 {
 					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
 							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
 					interconnect-names = "dma-mem", "read-1";
+					iommus = <&smmu_iso TEGRA194_SID_NVDISPLAY>;
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
 					nvidia,head = <2>;
@@ -1495,6 +1574,7 @@ display@15230000 {
 					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
 							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
 					interconnect-names = "dma-mem", "read-1";
+					iommus = <&smmu_iso TEGRA194_SID_NVDISPLAY>;
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
 					nvidia,head = <3>;
-- 
2.30.2

