Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2D7C07E9E
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jul 2021 10:32:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 946F161476
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jul 2021 10:32:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbhGHKev (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Jul 2021 06:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbhGHKev (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Jul 2021 06:34:51 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ADC1C061574;
        Thu,  8 Jul 2021 03:32:09 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id f17so6878722wrt.6;
        Thu, 08 Jul 2021 03:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DMo1FwPXUmdGeHuTylB1bhXZtdOnnUeT5f6CbSUaCzs=;
        b=p1FAx0sXOfW6uoejHheFl6xvVQZqCqeoJDup1pcl51HWurhVMhnRCKEsJ1RAQFooXl
         QJ60l7CT0z5JrFWInnEHnVZwDIkYjw2aTrwu1XB2ZDbggC51KvsGl0/sf/d6AIoUbqrw
         cTjDR63q6xN5qLSHPbnliQAk3djKNdR6PYveqztvQ7zA1n3zovLDGKzbJ7ZieeE7q7+Q
         RaaQb3N7RO94pciVu14NO/AFmQ3dk4RS6clfXnNiaU+uHL7FSdt0b+uHcKaiT29aSCwH
         NGHrQZTN7Kv1AXaDHq10myQ1w6EVxd+QwJsvFXjLPAIVzFqbaCQ00OT53LiKqJxL5WZZ
         oNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DMo1FwPXUmdGeHuTylB1bhXZtdOnnUeT5f6CbSUaCzs=;
        b=Lfz6fbpu9LOCW1IQJw1TbnkaXCV/Spu9rF0k4tzlj9TCCATKyDgeIEoKVCTey4Hew+
         6cCkOGnhvTYA6M1GrPenE/Me+xfL7QxfTtWTqpulHzNslzD2DrwphkBSTDoHBluiMOdq
         ekI6zml34TgDNtth1Z2f0AReqzMhF+5WrGdZN13ScGUj+fk+6iBk5HKD+o9WxGI1eIaB
         HvlottDbAYfSGvBBqqvHk3XJBFOhihpOC/7u8MJFsfZWLzXL79GUe2E9zB2i9Cyc414S
         8I6zEnirEZeN8Y7P+5HCfcayQ6QfnZ/8TUX4a0FRbS+s6v84kFC5wYoYvlyP0hrlCtwJ
         WzLg==
X-Gm-Message-State: AOAM533PPU0RPEd8ITyRJXJKumdZB6XuY7cJ9/BJ5D8ixqurtDBdEflE
        YFQnWeI/HX3GaAi2wJ+BaEw=
X-Google-Smtp-Source: ABdhPJzlvFcZx5xlorsp2MwJBbqPjX+k+YaeqaloucD+hMVipmfutFPdh/YzQIe6ATjQbbORHM8SLA==
X-Received: by 2002:a5d:6702:: with SMTP id o2mr27199118wru.405.1625740327975;
        Thu, 08 Jul 2021 03:32:07 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g10sm1383954wrq.63.2021.07.08.03.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 03:32:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: tegra: Enable audio IOMMU support on Tegra194
Date:   Thu,  8 Jul 2021 12:34:32 +0200
Message-Id: <20210708103432.1690385-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708103432.1690385-1-thierry.reding@gmail.com>
References: <20210708103432.1690385-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add iommus and interconnects properties to the ADMAIF device tree node
on Tegra194. This ensures that the correct SID is used for translation
of physical to I/O virtual addresses and that the path to system memory
is properly described, which in turn can impact the range of memory that
the device can address.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index b7d532841390..07e61f084123 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -200,6 +200,10 @@ tegra_admaif: admaif@290f000 {
 						    "rx19", "tx19",
 						    "rx20", "tx20";
 					status = "disabled";
+					interconnects = <&mc TEGRA194_MEMORY_CLIENT_APEDMAR &emc>,
+							<&mc TEGRA194_MEMORY_CLIENT_APEDMAW &emc>;
+					interconnect-names = "dma-mem", "write";
+					iommus = <&smmu TEGRA194_SID_APE>;
 				};
 
 				tegra_i2s1: i2s@2901000 {
-- 
2.32.0

