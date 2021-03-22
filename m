Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4122C433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 22 Mar 2021 11:13:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C64861990
	for <linux-tegra@archiver.kernel.org>; Mon, 22 Mar 2021 11:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhCVLMt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 22 Mar 2021 07:12:49 -0400
Received: from mga07.intel.com ([134.134.136.100]:63080 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230189AbhCVLMf (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Mar 2021 07:12:35 -0400
IronPort-SDR: 0r1DVUhRVaiPq8MB4DUrDtYEdEYt15A7DJUNYW9O3fHCHk3OONo8o/uNQr/Qm71hBAOgg7HX97
 FI0/EGUg2IGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="254247616"
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; 
   d="scan'208";a="254247616"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 04:12:33 -0700
IronPort-SDR: RNI6TEEpZmnkks7/3wJ5Br5bQT+uiNHCT39xpi+T3yylzGLTJRVa9nWpX5J7G6SMo36NMOcbCW
 Xc0Lf7m0yqsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; 
   d="scan'208";a="513270016"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 22 Mar 2021 04:12:32 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: tegra: paz00: Handle device properties with software node API
Date:   Mon, 22 Mar 2021 14:12:45 +0300
Message-Id: <20210322111245.3784-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The old device property API is going to be removed.
Replacing the device_add_properties() call with the software
node API equivalent, device_create_managed_software_node().

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 arch/arm/mach-tegra/board-paz00.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/board-paz00.c
index b5c990a7a5af5..18d37f90cdfe3 100644
--- a/arch/arm/mach-tegra/board-paz00.c
+++ b/arch/arm/mach-tegra/board-paz00.c
@@ -36,7 +36,7 @@ static struct gpiod_lookup_table wifi_gpio_lookup = {
 
 void __init tegra_paz00_wifikill_init(void)
 {
-	platform_device_add_properties(&wifi_rfkill_device, wifi_rfkill_prop);
+	device_create_managed_software_node(&wifi_rfkill_device.dev, wifi_rfkill_prop, NULL);
 	gpiod_add_lookup_table(&wifi_gpio_lookup);
 	platform_device_register(&wifi_rfkill_device);
 }
-- 
2.30.2

