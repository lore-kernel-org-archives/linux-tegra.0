Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B188AC433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 11:48:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79E4521655
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 11:48:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYEi0omm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgIQLr5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 07:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgIQLfX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 07:35:23 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AE1C061756;
        Thu, 17 Sep 2020 04:35:23 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id y1so1197745pgk.8;
        Thu, 17 Sep 2020 04:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=44JkQ0xk/m6YNhH3hVjpFztigV1A13fyXiwxKi+U+Xc=;
        b=VYEi0ommvZ/cuDCP/38rRPYUvZFPkgwB+TFwx9CUcF0Rrc6CxikinYRSo8JLeozSM4
         nZuR/iudhktaOl9035RVAB1bWwE2aNPKQ68RqJ2moK7wErajVDa2W4KsVdgnxqATvPsH
         qesyy7x4S9n/tF5N6LU7GbCS2rAPfNYR31ArlBn5YdLYdyd3k5GY0UvtN38CEeWqksWS
         +2t76vzN9kETK9E65XfknlmpGtSxnX4uN06GS+Mm362bhgkQ8lrobYQdvP4612iOYdmD
         jaBuIkEgTga2SwFSc3gNmg9/eFJxTUGf+egOJ+Qm16Pdufzuscb9EXB7pVV8KRmOL+zM
         OSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=44JkQ0xk/m6YNhH3hVjpFztigV1A13fyXiwxKi+U+Xc=;
        b=O258ZyPics6QyFWliRQmw/AUMDERhrf8VbyozAwaJT7ao0CmKTaV5iqKo0Z5mAojx/
         irr2OI+zz/aJ/TacPycQC8TtpVF1xpmbtVr3YpXaHI9+ZBf/WTHwlAPDNKVP9xK5KebI
         nElZ7o4kBh7oOw7kGkx3fO0JtqPmo3UIKmhwg62jL3mI7IqU+ctajFC18LTXlImXwcqH
         Vg8Kp/7XCxsGD4GXnyIijBY0RtFA/pYTIqmz5euAu/rMRtYeUKW9zz7qsoLhI1EMmiYn
         KLQooplhem87Btd0JFUr/lAMc4fqDYNP7WhTrFJjBmloFs1xYTPo8o8RJLyUPy1Eq0bp
         CdkQ==
X-Gm-Message-State: AOAM530zRGX9Rh4ITTgkmRRoQl2oVsGpNbye3tBIehWkTAAfFJO46Gjm
        6I6WWNk/sisrrOz8CDdWLPwi9SHRD/U=
X-Google-Smtp-Source: ABdhPJyP5LqjnXvH1LhpCFGPDM4Dnp5PmbvsiDx0qDuxmUYG+ysZXqB6qzdfLj9uIk8o7d38xlH5Ng==
X-Received: by 2002:a05:6a00:1356:b029:13e:d13d:a084 with SMTP id k22-20020a056a001356b029013ed13da084mr26669802pfu.27.1600342522940;
        Thu, 17 Sep 2020 04:35:22 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id a138sm21128382pfd.19.2020.09.17.04.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:35:22 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     krzk@kernel.org, joro@8bytes.org
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
        vdumpa@nvidia.com, thierry.reding@gmail.com
Subject: [RESEND][PATCH 2/2] memory: tegra: Correct num_tlb_lines for tegra210
Date:   Thu, 17 Sep 2020 04:31:55 -0700
Message-Id: <20200917113155.13438-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917113155.13438-1-nicoleotsuka@gmail.com>
References: <20200917113155.13438-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

According to Tegra210 TRM, the default value of TLB_ACTIVE_LINES
field of register MC_SMMU_TLB_CONFIG_0 is 0x30. So num_tlb_lines
should be 48 (0x30) rather than 32 (0x20).

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index 51b537cfa5a7..4fbf8cbc6666 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -1074,7 +1074,7 @@ static const struct tegra_smmu_soc tegra210_smmu_soc = {
 	.num_groups = ARRAY_SIZE(tegra210_groups),
 	.supports_round_robin_arbitration = true,
 	.supports_request_limit = true,
-	.num_tlb_lines = 32,
+	.num_tlb_lines = 48,
 	.num_asids = 128,
 };
 
-- 
2.17.1

