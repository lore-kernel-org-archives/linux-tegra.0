Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0524DC433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 15:40:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CABEA616EB
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 15:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbhEKPlF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 11:41:05 -0400
Received: from mga06.intel.com ([134.134.136.31]:28260 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231890AbhEKPk6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 11:40:58 -0400
IronPort-SDR: QQ4Sjl5kMqyNo+51Lmncu1VMRud0Nm/Odk8kZGS/tADH8uo99J3m9ecc1+6vBCp7yiWgAv6m1W
 MSoAtVeU2pRQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="260734858"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
   d="scan'208";a="260734858"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 08:39:45 -0700
IronPort-SDR: sLP3qUCam69dXxLCBSz/8ZlJdIgbpLY4sMvgUT0yRXe1Fga2ANFRGVLCfv7Gn7pm2jPjT5o8Bd
 Qrgqnd9cArVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
   d="scan'208";a="434604792"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 11 May 2021 08:39:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 30C4093; Tue, 11 May 2021 18:40:01 +0300 (EEST)
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
Subject: [PATCH v2 2/4] kdb: Switch to use %ptTs
Date:   Tue, 11 May 2021 18:39:56 +0300
Message-Id: <20210511153958.34527-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
References: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use %ptTs instead of open-coded variant to print contents
of time64_t type in human readable form.

Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: kgdb-bugreport@lists.sourceforge.net
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v2: collected tags
 kernel/debug/kdb/kdb_main.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 1baa96a2ecb8..622410c45da1 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -2488,7 +2488,6 @@ static void kdb_sysinfo(struct sysinfo *val)
 static int kdb_summary(int argc, const char **argv)
 {
 	time64_t now;
-	struct tm tm;
 	struct sysinfo val;
 
 	if (argc)
@@ -2502,13 +2501,7 @@ static int kdb_summary(int argc, const char **argv)
 	kdb_printf("domainname %s\n", init_uts_ns.name.domainname);
 
 	now = __ktime_get_real_seconds();
-	time64_to_tm(now, 0, &tm);
-	kdb_printf("date       %04ld-%02d-%02d %02d:%02d:%02d "
-		   "tz_minuteswest %d\n",
-		1900+tm.tm_year, tm.tm_mon+1, tm.tm_mday,
-		tm.tm_hour, tm.tm_min, tm.tm_sec,
-		sys_tz.tz_minuteswest);
-
+	kdb_printf("date       %ptTs tz_minuteswest %d\n", &now, sys_tz.tz_minuteswest);
 	kdb_sysinfo(&val);
 	kdb_printf("uptime     ");
 	if (val.uptime > (24*60*60)) {
-- 
2.30.2

