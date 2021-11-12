Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33337C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1765460F93
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234976AbhKLMjA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:39:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234894AbhKLMi7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:38:59 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ABC1C061766;
        Fri, 12 Nov 2021 04:36:08 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id w29so15200292wra.12;
        Fri, 12 Nov 2021 04:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+qGnkXG1+NRqhRAlPuguf+Ywnx8OYEijb49VN2NaBSg=;
        b=VvJCrkJUxgAitILtVBx5QqoCeFzAzROZV0K5ph11PkH5Qy/jkFS5s9aJS6GlKhFAk7
         SJ9ylmg8Um/jTRJz+VWPtH7+KsQuH/NZQnSvCv5fK0FYJfTlrCfhLzI0dhUX4v2tAJMT
         H47hUoy8oGOhk85FDjkJ1fZopPJnzgGEFsLOJTkxAeLtYDX9qBGzPlNGd87PuA/Bhm+D
         UOCqMv5/Lul6XU7K7V5n4ZcPpG6jqGxY7sDQsL/0kd8d8amy5PWoarqrT/NSyJiwf3lt
         NXPWcGC52DGol1Iyxqa4da3gQeEWyLAJ/qzTJAeME5ayJqKn3MDkPwB/Eq60jbUhoi7g
         WQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+qGnkXG1+NRqhRAlPuguf+Ywnx8OYEijb49VN2NaBSg=;
        b=SfZd44WMKGbQBF8D+nuERdcA92drA0cw+0gBf+NsEYUlB1dkXgv9UkYkvHGz31KEOe
         N38uOPc2UTo9R7V7wo28uDn1SZ/rwYx+eSCMqVqTBms/4zGh+2WedPmTnvwCnB8DHEkc
         bzwt4YIXjfeq6h3NxwkHEDIt2gw/Nfdrd/Z9tsVYaqjK1bcbUrVI0U/hckX5iMkiFq/D
         Jp/EqIGs64KMEbQnP3rut4F8pWnOzcnB8Ezl+JVAKwPcpb/BvVJdStdlIfo+b+OReQdH
         0y1ry5WkliSiIIJVufS0aabBUf1xrXJ2d04rn6xWRNc5Qaw6fMHd2Jw0OyuGqAmJq7l9
         KBcA==
X-Gm-Message-State: AOAM5316GYhpoYOqS4lutVhW7/5rQVw7G4reCa2LI0rOX9+gFYbDr6BI
        vghQZspJQx1tW+/2AIcsCgo=
X-Google-Smtp-Source: ABdhPJxe4GpVLfOkonCIcpE5dKJ9/YHmfKL5ni201JmBmJpoJrCAE5r/EFJzJviWsvyJn8iV68c1pQ==
X-Received: by 2002:adf:e78c:: with SMTP id n12mr18087817wrm.83.1636720566997;
        Fri, 12 Nov 2021 04:36:06 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id a1sm6899956wri.89.2021.11.12.04.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:36:06 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/11] arm64: tegra: Fixup SYSRAM references
Date:   Fri, 12 Nov 2021 13:35:37 +0100
Message-Id: <20211112123542.3680629-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112123542.3680629-1-thierry.reding@gmail.com>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The json-schema bindings for SRAM expect the nodes to be called "sram"
rather than "sysram" or "shmem". Furthermore, place the brackets around
the SYSRAM references such that a two-element array is created rather
than a two-element array nested in a single-element array. This is not
relevant for device tree itself, but allows the nodes to be properly
validated against json-schema bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 9ac4f0140700..5f8132884be0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1771,7 +1771,7 @@ bpmp: bpmp {
 		iommus = <&smmu TEGRA186_SID_BPMP>;
 		mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB
 				    TEGRA_HSP_DB_MASTER_BPMP>;
-		shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
+		shmem = <&cpu_bpmp_tx>, <&cpu_bpmp_rx>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 851e049b3519..8d29b7fdb044 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -2467,7 +2467,7 @@ bpmp: bpmp {
 		compatible = "nvidia,tegra186-bpmp";
 		mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB
 				    TEGRA_HSP_DB_MASTER_BPMP>;
-		shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
+		shmem = <&cpu_bpmp_tx>, <&cpu_bpmp_rx>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index f0efb3a62804..28961ed31d87 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -122,20 +122,20 @@ gic: interrupt-controller@f400000 {
 		};
 	};
 
-	sysram@40000000 {
+	sram@40000000 {
 		compatible = "nvidia,tegra234-sysram", "mmio-sram";
 		reg = <0x0 0x40000000 0x0 0x50000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x40000000 0x50000>;
 
-		cpu_bpmp_tx: shmem@4e000 {
+		cpu_bpmp_tx: sram@4e000 {
 			reg = <0x4e000 0x1000>;
 			label = "cpu-bpmp-tx";
 			pool;
 		};
 
-		cpu_bpmp_rx: shmem@4f000 {
+		cpu_bpmp_rx: sram@4f000 {
 			reg = <0x4f000 0x1000>;
 			label = "cpu-bpmp-rx";
 			pool;
@@ -146,7 +146,7 @@ bpmp: bpmp {
 		compatible = "nvidia,tegra234-bpmp", "nvidia,tegra186-bpmp";
 		mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB
 				    TEGRA_HSP_DB_MASTER_BPMP>;
-		shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
+		shmem = <&cpu_bpmp_tx>, <&cpu_bpmp_rx>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
-- 
2.33.1

