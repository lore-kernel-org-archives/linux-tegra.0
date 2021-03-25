Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C802BC433E8
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 13:04:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A27AC619E4
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 13:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbhCYND7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 09:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbhCYNDq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 09:03:46 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E6BC06174A
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 06:03:46 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id j9so477680wrx.12
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=soDQPERcrxQizYmqdP8N6MWaU4yIdYvo3zzWt15BZzE=;
        b=Yz7sN/FBKYsKSIUZt9s/LRF3RLppTSjBQmvvybhJ72OxUeMV3voK7qqhFK3s7qhtGV
         vBmE3cpmnGk3Buy4gOFCBwq+ZqaMi8wT5GdS9Sby/n1uGSnXMoWsR7BjRIP8xahEhmxi
         7scm5D+Q3fKaIkcA05yI5QEfTTtnF/ao13t/4UdJaNzRSafrw82SPefU5mW2Vn35b31A
         axK0xh0xldW9j75n3DLwwIEyO9gtIgd7fh5rg8MuLLp1zuoa/H5f0sGsIMqOa2CbHudt
         OjvYaQZ+zKZ8BGTzV3SYUel+1lIWYIw9AXgKJNbeGb3VpsW9Ec0eZOSg4LY2g9nZwuJ4
         JCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=soDQPERcrxQizYmqdP8N6MWaU4yIdYvo3zzWt15BZzE=;
        b=kB5OGwegABSggEhbd+FagNOTAIizhg5Hc9HlhfLoy0pZoc7T1Ptcwrm5ysAsYGBUaV
         D1ceqLoCLeJecdfF45JPsV3IgV0nPxB+XivJ3TNa82HYgr7qUzB8gLbP9lqi0oHzmfrf
         ph6PoA27MNkhcQD+Pf38/7D+ayYafoopCU0ENzOUNoiI+3DeU1k4emLfzcqYwk8TqFGK
         5sHKqga5cqb1GyD1y4ZUqd0ZzgW2ZCYy2bIllQ0AZcB18WO1+4ax1rmqUvMwtDO8RMuK
         LtNwCYk9aYvuIB3hpn0hwyTSW4anU8bfePlt8EF4C0tdiNZlJP0pcKcdxVXB2sj5K2OG
         ZD5A==
X-Gm-Message-State: AOAM530tyzCJ6rT182FH7dDecB7PJeynZqK/PycwPVh+S2Yc5M0o7UsK
        1Nmg0Yx5d1Ir7hQePk9t7V8=
X-Google-Smtp-Source: ABdhPJwIdcfztl0HN1bHqneYRtw+MqoKgp1xBJX4Q+4Px6g8uIOonnw8AMlOhYIbAOuwqNsqpoT77g==
X-Received: by 2002:a5d:684d:: with SMTP id o13mr9166505wrw.235.1616677425265;
        Thu, 25 Mar 2021 06:03:45 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b12sm7530911wrf.39.2021.03.25.06.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 06:03:44 -0700 (PDT)
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
Subject: [PATCH 8/9] arm64: tegra: Hook up memory controller to SMMU on Tegra186
Date:   Thu, 25 Mar 2021 14:03:31 +0100
Message-Id: <20210325130332.778208-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325130332.778208-1-thierry.reding@gmail.com>
References: <20210325130332.778208-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Tegra186 and later, the memory controller needs to be programmed in
coordination with any of the ARM SMMU instances to configure the stream
ID used for each memory client.

To support this, add a phandle reference to the memory controller to the
SMMU device tree node.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 9f75bbf00cf7..e9fdf9e18d37 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1152,6 +1152,8 @@ smmu: iommu@12000000 {
 		stream-match-mask = <0x7f80>;
 		#global-interrupts = <1>;
 		#iommu-cells = <1>;
+
+		nvidia,memory-controller = <&mc>;
 	};
 
 	host1x@13e00000 {
-- 
2.30.2

