Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B88CC4361B
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Dec 2020 18:45:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 498ED23F37
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Dec 2020 18:45:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405461AbgLKREv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Dec 2020 12:04:51 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2531 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393748AbgLKREM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Dec 2020 12:04:12 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fd3a63e0001>; Fri, 11 Dec 2020 09:02:54 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Dec
 2020 17:02:54 +0000
Received: from skomatineni-linux.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 11 Dec 2020 17:02:53 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 10/13] media: v4l2-fwnode: Update V4L2_FWNODE_CSI2_MAX_DATA_LANES to 8
Date:   Fri, 11 Dec 2020 09:02:39 -0800
Message-ID: <1607706162-1548-11-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
References: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607706174; bh=T2kKcHbh237nA+bLfoyfA+byZop0LilULPGoxcKxFf4=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=hfdETD9cA7/O9qBR/62R03oztZy6DA1uEbRUNfV/p+dLUivHdvdT6vR0MmkeuQHp9
         wCKbXZskM2AXdVLxDFDS1unHBILKs06rbabMTkMVSDP5+xToohggP57FMR1fsPCzFb
         qf8Hgh+WHDvPms3khlPV78dvDXps6S9LaZ1rPvCmY72kPAyrBXQb4SWOLuHf19+CQF
         z6Sh24p7DopoqRt/zvIGUVI5o+BDQZjlxm/DMbS+QJ1iRoTKk0Vg/m0k3K5rOqy1kP
         saqPq2T6WPsidhWk76KW8scfWYC4eXcPA61V3V84XruBTJJjjNK5c9jP2Srpc22jKi
         5RxO/a91hsVMw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Some CSI2 receivers support 8 data lanes.

So, this patch updates CSI2 maximum data lanes to be 8.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 include/media/v4l2-fwnode.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 4e1f6e1d..92401c1 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -25,7 +25,7 @@ struct fwnode_handle;
 struct v4l2_async_notifier;
 struct v4l2_async_subdev;
 
-#define V4L2_FWNODE_CSI2_MAX_DATA_LANES	4
+#define V4L2_FWNODE_CSI2_MAX_DATA_LANES	8
 
 /**
  * struct v4l2_fwnode_bus_mipi_csi2 - MIPI CSI-2 bus data structure
-- 
2.7.4

