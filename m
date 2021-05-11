Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1439CC43461
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 15:40:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC95E616ED
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 15:40:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231941AbhEKPlI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 11:41:08 -0400
Received: from mga06.intel.com ([134.134.136.31]:28260 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231950AbhEKPlF (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 11:41:05 -0400
IronPort-SDR: 4CvMoR5p5RTzYkYGS4ujcI/gf9dP23Z9j1enE8tuM9NkLaYC7FwokJWPVKm9w6qYCL8PAsasSs
 9uKgykm11liQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="260734862"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
   d="scan'208";a="260734862"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 08:39:45 -0700
IronPort-SDR: BmOdmLk95HugbOBhf/VKi8M9ccrx7snWj519gBrlC2bQnNhtXA3yQfhaFPsqxh2n6tgM7lv4WM
 FP1+rlI4gmjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
   d="scan'208";a="434604794"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 11 May 2021 08:39:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2186BD7; Tue, 11 May 2021 18:40:00 +0300 (EEST)
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
Subject: [PATCH v2 1/4] lib/vsprintf: Allow to override ISO 8601 date and time separator
Date:   Tue, 11 May 2021 18:39:55 +0300
Message-Id: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

ISO 8601 defines 'T' as a separator between date and time. Though,
some ABIs use time and date with ' ' (space) separator instead.

Add a flavour to the %pt specifier to override default separator.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: fixed the parameters set, renamed variable and dropped comment (Petr)
 Documentation/core-api/printk-formats.rst |  7 ++++++-
 lib/test_printf.c                         |  5 +++++
 lib/vsprintf.c                            | 22 +++++++++++++++++-----
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index f063a384c7c8..1dd4ebf0be79 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -514,9 +514,10 @@ Time and date
 ::
 
 	%pt[RT]			YYYY-mm-ddTHH:MM:SS
+	%pt[RT]s		YYYY-mm-dd HH:MM:SS
 	%pt[RT]d		YYYY-mm-dd
 	%pt[RT]t		HH:MM:SS
-	%pt[RT][dt][r]
+	%pt[RT][dt][r][s]
 
 For printing date and time as represented by::
 
@@ -528,6 +529,10 @@ in human readable format.
 By default year will be incremented by 1900 and month by 1.
 Use %pt[RT]r (raw) to suppress this behaviour.
 
+The %pt[RT]s (space) will override ISO 8601 separator by using ' ' (space)
+instead of 'T' (Capital T) between date and time. It won't have any effect
+when date or time is omitted.
+
 Passed by reference.
 
 struct clk
diff --git a/lib/test_printf.c b/lib/test_printf.c
index ec0d5976bb69..8ac71aee46af 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -528,6 +528,11 @@ time_and_date(void)
 	test("0119-00-04T15:32:23", "%ptTr", &t);
 	test("15:32:23|2019-01-04", "%ptTt|%ptTd", &t, &t);
 	test("15:32:23|0119-00-04", "%ptTtr|%ptTdr", &t, &t);
+
+	test("2019-01-04 15:32:23", "%ptTs", &t);
+	test("0119-00-04 15:32:23", "%ptTsr", &t);
+	test("15:32:23|2019-01-04", "%ptTts|%ptTds", &t, &t);
+	test("15:32:23|0119-00-04", "%ptTtrs|%ptTdrs", &t, &t);
 }
 
 static void __init
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index f0c35d9b65bf..14a4e4e8a657 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1834,7 +1834,8 @@ char *rtc_str(char *buf, char *end, const struct rtc_time *tm,
 	      struct printf_spec spec, const char *fmt)
 {
 	bool have_t = true, have_d = true;
-	bool raw = false;
+	bool raw = false, iso8601_separator = true;
+	bool found = true;
 	int count = 2;
 
 	if (check_pointer(&buf, end, tm, spec))
@@ -1851,14 +1852,25 @@ char *rtc_str(char *buf, char *end, const struct rtc_time *tm,
 		break;
 	}
 
-	raw = fmt[count] == 'r';
+	do {
+		switch (fmt[count++]) {
+		case 'r':
+			raw = true;
+			break;
+		case 's':
+			iso8601_separator = false;
+			break;
+		default:
+			found = false;
+			break;
+		}
+	} while (found);
 
 	if (have_d)
 		buf = date_str(buf, end, tm, raw);
 	if (have_d && have_t) {
-		/* Respect ISO 8601 */
 		if (buf < end)
-			*buf = 'T';
+			*buf = iso8601_separator ? 'T' : ' ';
 		buf++;
 	}
 	if (have_t)
@@ -2298,7 +2310,7 @@ early_param("no_hash_pointers", no_hash_pointers_enable);
  * - 'd[234]' For a dentry name (optionally 2-4 last components)
  * - 'D[234]' Same as 'd' but for a struct file
  * - 'g' For block_device name (gendisk + partition number)
- * - 't[RT][dt][r]' For time and date as represented by:
+ * - 't[RT][dt][r][s]' For time and date as represented by:
  *      R    struct rtc_time
  *      T    time64_t
  * - 'C' For a clock, it prints the name (Common Clock Framework) or address
-- 
2.30.2

