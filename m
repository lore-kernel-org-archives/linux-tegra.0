Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB435C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Mar 2022 10:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235112AbiCRKjH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Mar 2022 06:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235071AbiCRKi7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Mar 2022 06:38:59 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 669D92D88A0;
        Fri, 18 Mar 2022 03:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AFcuMPAoZaB+CVanO7VceCwI9IK81XJZLPVFmZZXE/0=;
  b=N2XY89svB28mcxJnbsqMaDr65Hi8QP+uW5L+0y6Pr3BNMzMvHHhnpj66
   JMuzPHn9KG+u/Z/VDJJaQbrWPY5oWnnynDxFHUE6uCEkW/HY0cIwKLa05
   RpZtYkBR6NwJfb9jHxDSCuPJnaenY+Kg4L9rGtjZMgfZoaszlfsifgfRJ
   k=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,192,1643670000"; 
   d="scan'208";a="8935639"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 11:37:36 +0100
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Russell King <linux@armlinux.org.uk>
Cc:     kernel-janitors@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: tegra: fix typos in comments
Date:   Fri, 18 Mar 2022 11:37:03 +0100
Message-Id: <20220318103729.157574-8-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/arm/mach-tegra/platsmp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/platsmp.c b/arch/arm/mach-tegra/platsmp.c
index e6911a14c096..1f57e7c0feae 100644
--- a/arch/arm/mach-tegra/platsmp.c
+++ b/arch/arm/mach-tegra/platsmp.c
@@ -83,7 +83,7 @@ static int tegra30_boot_secondary(unsigned int cpu, struct task_struct *idle)
 	 * For warm boot CPU that was resumed from CPU hotplug, the
 	 * power will be resumed automatically after un-halting the
 	 * flow controller of the warm boot CPU. We need to wait for
-	 * the confirmaiton that the CPU is powered then removing
+	 * the confirmation that the CPU is powered then removing
 	 * the IO clamps.
 	 * For cold boot CPU, do not wait. After the cold boot CPU be
 	 * booted, it will run to tegra_secondary_init() and set

