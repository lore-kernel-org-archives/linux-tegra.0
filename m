Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7536BC433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 10:42:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B72164F29
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 10:42:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbhCLKmR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Mar 2021 05:42:17 -0500
Received: from mga01.intel.com ([192.55.52.88]:2746 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233502AbhCLKmQ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Mar 2021 05:42:16 -0500
IronPort-SDR: DLbCV6sa/Rpnw96S89YonuzZMDSqWK3AKO1Cf9g0l6keTx4BrnR6ztdMiryTnVeHno7u5MG1ly
 OYkVqRB3xqug==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="208654194"
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; 
   d="scan'208";a="208654194"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 02:42:16 -0800
IronPort-SDR: lrru8RAxkndzRxmq9W2bwQL5FCcFJnKdj5MKxIxaPz15SgJxne5ZmfPpcX2bRAsGDC/kDa3Qgf
 hK/YMX8BNsdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; 
   d="scan'208";a="510297037"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Mar 2021 02:42:15 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] ARM: tegra: paz00: Handle device properties with software node API
Date:   Fri, 12 Mar 2021 13:42:27 +0300
Message-Id: <20210312104227.50111-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.1
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
2.30.1

