Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8F3C43461
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C99561076
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233435AbhDTR01 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233425AbhDTR0Z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 13:26:25 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E7FC06174A
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:54 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id g17so45363327edm.6
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oomLXdSqJJ9PIjxb6gjx8hnfwiARzBKAKbIJ+w2GrTw=;
        b=eE/13PLF3h3U0qvRTkYa6TeUrMFceFJuSDCUczRmCo2Inj1LBOjpIIB0rEy1W5bEJg
         iaFkgKCLCU5weuxcQXXmQWSLuOppEp4HTDHurXoCN3EJu0C0FKby+NxHs2UPNNlxNvhu
         sevbaWpTsCYpHjt6RonySoTnbugRJ7XIjZOneWBSgOFw1yqER9kLRq4bx66YZfdGfCYL
         rm3MS9bd60+fqsurfKzWzPYKPPcnAV3f0AefpJCwNWtqU/CYCnVJmQl3YFewcqnGX0Sw
         PufgcsGBdXj5Ji/JNEdi4GD8S8BEkQOU6lPrlnege8Xh5Ei8y7wLjPmOSOAJvBuF8EmA
         dP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oomLXdSqJJ9PIjxb6gjx8hnfwiARzBKAKbIJ+w2GrTw=;
        b=oHtYvr5OjzJleeJwCjDPc1nSgvK9o+jQsC7AT67q03K224NyJTpOPq67FkzSEGV33V
         SZqTwCVqz1jBDYbSFlNt7JHcufdBum86Xgnon4IQaMR2bO8e8iP5nB215z1FLGqaDPL1
         1vkV37I93tAw83SNVR3J9m4Up6FXdXA5iC2OD2hilZzqrdvsFIekQf9+cQf3NoyUj1jI
         V071+thQ2lXg9uhfPonIdyDwHTKv/fxSUQN5FNFAC7PBQ0HyJtDLHz+pt7hC1RvvSZu4
         HZaqABstKg3ANCALjy03mUGfRGcdERLIumb6DKMmiBLfyUsqkSvJ2bw9+kuSHPCuvdjr
         0UGg==
X-Gm-Message-State: AOAM5323y6wnPdW/sRm35/JE52mbXELSlm0VeL4xlr5FNzwpDdpP0JG0
        igOHya78N2rlnfc8PGEwe5Y=
X-Google-Smtp-Source: ABdhPJwfnXfCe8dBuEZlDPZLuHdnyjrWPd3VkOaXY4jZy4JvAnfGqF/RpKdpuvSmL+X2RLK3gzixrA==
X-Received: by 2002:aa7:c5c2:: with SMTP id h2mr19812329eds.38.1618939552800;
        Tue, 20 Apr 2021 10:25:52 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o17sm12106708edt.92.2021.04.20.10.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:25:51 -0700 (PDT)
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
Subject: [PATCH v2 08/10] arm64: tegra: Hook up memory controller to SMMU on Tegra186
Date:   Tue, 20 Apr 2021 19:26:17 +0200
Message-Id: <20210420172619.3782831-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420172619.3782831-1-thierry.reding@gmail.com>
References: <20210420172619.3782831-1-thierry.reding@gmail.com>
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
index a173f40256ae..d02f6bf3e2ca 100644
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

