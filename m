Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D10C433ED
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Apr 2021 13:24:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAECB61434
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Apr 2021 13:24:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233536AbhD2NYq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Apr 2021 09:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232867AbhD2NYq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Apr 2021 09:24:46 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A635C06138B
        for <linux-tegra@vger.kernel.org>; Thu, 29 Apr 2021 06:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=kKWqnWUgeMWlYvA95WTibhXaZ8rUQUchwmszu3X17K4=; b=huwk7+T3JjNbcSU8d4hO6a0z7Y
        lmsO6gF36BdniBB16Xq/YQa3kTO6aeS5n0BukFC9uBMyf/cfdzkjfSKu3oyLKySVbwYmxlo8PFmJE
        36xb4gCvxJ/Bn5Ktjcr0EW+1rd+y0Sp4/YdFRpDC6eBXPEumuOt8HaT6r1OqLqwQO9M2nbTBxIpQ7
        DzF2tAnN+6aezqdwfwTJf4f6GofmUs7XLUn+w3PTux4x3Rqy2YLeLWDmdD71QzLRazktaexvg7O8A
        AADGPyUj4bUM4SuMQblkE6zz6s34YEAH84c56ysFNEz7MSyucm5i5ViFDF6WA6s9mYjXfKX8VwVkk
        LTTq5dEA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1lc6e1-0004U6-Dv; Thu, 29 Apr 2021 16:23:53 +0300
From:   Mikko Perttunen <cyndis@kapsi.fi>
List-Id: <linux-firmware.lore.kernel.org>
To:     linux-firmware@kernel.org
Cc:     linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH] firmware: nvidia: Add VIC firmware for Tegra194
Date:   Thu, 29 Apr 2021 16:23:01 +0300
Message-Id: <20210429132301.49868-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

Add the firmware file for the VIC falcon controller on
NVIDIA Tegra194.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 WHENCE                  |   2 ++
 nvidia/tegra194/vic.bin | Bin 0 -> 22784 bytes
 2 files changed, 2 insertions(+)
 create mode 100644 nvidia/tegra194/vic.bin

diff --git a/WHENCE b/WHENCE
index 3c293040f019..d931dc582481 100644
--- a/WHENCE
+++ b/WHENCE
@@ -4141,6 +4141,8 @@ Link: nvidia/tegra210/vic.bin -> vic04_ucode.bin
 File: nvidia/tegra186/vic04_ucode.bin
 Link: nvidia/tegra186/vic.bin -> vic04_ucode.bin
 
+File: nvidia/tegra194/vic.bin
+
 Licence: Redistributable. See LICENCE.nvidia for details
 
 --------------------------------------------------------------------------
diff --git a/nvidia/tegra194/vic.bin b/nvidia/tegra194/vic.bin
new file mode 100644
index 0000000000000000000000000000000000000000..97fe518f30f07f9a9f122ca801417891df6cf41f
GIT binary patch
literal 22784
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

literal 0
HcmV?d00001

-- 
2.30.1

