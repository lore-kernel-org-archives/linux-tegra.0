Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240FFC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 11:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCB0C23103
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 11:38:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729862AbhALLiZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 06:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729523AbhALLiY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 06:38:24 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09ACFC061575
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 03:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=j0tFJ4PTsbEyOOS9crz150IXZd+LYRNiBCWMdF0RqTs=; b=znUFsjd4fOOeNkYwXVIBHHt2KN
        fAmkm/hDHBxv8qEVumKVWfi+DpUZTgZzKaS9mVXZr9orUnoiqBnXE5unfbvonervbsRTYqgA/Ga1T
        HgDwMNOZqxGgKqbpW3Pacz8pTFd6WNYuHed9NJkQEYtY5zd+ysW3Zbprbi3y9Lotpua35w1A6R66M
        FlNQMnE2MtGcTNR/XQSIX0ugeLJcQ8RktWg6OKGnsCjY60Bj0eRy8AfiYa5gJ5GrzmvRI1IOfoZC4
        VF9b162BHmnfo/6YS0OdKvcHPSMFuw2vyxMpajAtcrn5hAv8yF3VU75rsupUyvpj81m3aLt6VeGT3
        SavkEvlQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kzHzZ-0000zo-0q; Tue, 12 Jan 2021 13:37:41 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 2/2] drm/tegra: vic: Add comments on STREAMID registers
Date:   Tue, 12 Jan 2021 13:37:07 +0200
Message-Id: <20210112113707.3837876-2-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210112113707.3837876-1-mperttunen@nvidia.com>
References: <20210112113707.3837876-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add comments clarifying use of the THI_STREAMID0 and THI_STREAMID1
registers.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index a3dbb8813faf..48e98a60ab6e 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -117,7 +117,19 @@ static int vic_boot(struct vic *vic)
 		if (spec->num_ids > 0) {
 			value = spec->ids[0] & 0xffff;
 
+			/*
+			 * STREAMID0 is used for input/output buffers.
+			 * Initialize it to SID_VIC in case context isolation
+			 * is not enabled, and SID_VIC is used for both firmware
+			 * and data buffers.
+			 *
+			 * If context isolation is enabled, it will be
+			 * overridden by the SETSTREAMID opcode as part of
+			 * each job.
+			 */
 			vic_writel(vic, value, VIC_THI_STREAMID0);
+
+			/* STREAMID1 is used for firmware loading. */
 			vic_writel(vic, value, VIC_THI_STREAMID1);
 		}
 	}
-- 
2.30.0

