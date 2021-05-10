Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACFDC43600
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 15:05:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90A4461493
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 15:05:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233916AbhEJPG6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 11:06:58 -0400
Received: from mga03.intel.com ([134.134.136.65]:18899 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235326AbhEJPFY (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 11:05:24 -0400
IronPort-SDR: 3d5S3Swa/9p9Ugalhr8YwapLF6TJL2CYMzXfJm9s3KELeX4eI2GRlLMRMZUDR0Vs+43a0oG97Y
 u1ObvhnBRwSQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="199266347"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; 
   d="scan'208";a="199266347"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 08:04:02 -0700
IronPort-SDR: IOjie96ZhmgBakkWhU2dJA996iOyKlZJgdodqHtw3Qv0We3mF69WZ562+YavWqrvP7cHA1djcp
 KCtcD6gLXJ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; 
   d="scan'208";a="468259165"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 10 May 2021 08:03:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 88ECF1D2; Mon, 10 May 2021 18:04:16 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Petr Mladek <pmladek@suse.com>, JC Kuo <jckuo@nvidia.com>,
        Joe Perches <joe@perches.com>,
        Sumit Garg <sumit.garg@linaro.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-nilfs@vger.kernel.org,
        kgdb-bugreport@lists.sourceforge.net
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v1 4/4] usb: host: xhci-tegra: Switch to use %ptTs
Date:   Mon, 10 May 2021 18:04:13 +0300
Message-Id: <20210510150413.59356-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
References: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use %ptTs instead of open coded variant to print contents
of time64_t type in human readable form.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/host/xhci-tegra.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index ce97ff054c68..937b78cba89b 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -890,7 +890,6 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 	struct xhci_op_regs __iomem *op;
 	unsigned long timeout;
 	time64_t timestamp;
-	struct tm time;
 	u64 address;
 	u32 value;
 	int err;
@@ -987,11 +986,8 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 	}
 
 	timestamp = le32_to_cpu(header->fwimg_created_time);
-	time64_to_tm(timestamp, 0, &time);
 
-	dev_info(dev, "Firmware timestamp: %ld-%02d-%02d %02d:%02d:%02d UTC\n",
-		 time.tm_year + 1900, time.tm_mon + 1, time.tm_mday,
-		 time.tm_hour, time.tm_min, time.tm_sec);
+	dev_info(dev, "Firmware timestamp: %ptTs UTC\n", &timestamp);
 
 	return 0;
 }
-- 
2.30.2

