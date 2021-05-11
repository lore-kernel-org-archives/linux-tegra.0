Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D5AC43461
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 15:39:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37C036191D
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 15:39:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbhEKPk4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 11:40:56 -0400
Received: from mga11.intel.com ([192.55.52.93]:42690 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231844AbhEKPkz (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 11:40:55 -0400
IronPort-SDR: xRUX7XWprC3mABLXp1L4Cv1wpdRXaeXGNcfSeoJUicractfQlvhAieYgZTuO2Gn6vzCIQfVHly
 Px9rXjfCLoqA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="196377032"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
   d="scan'208";a="196377032"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 08:39:46 -0700
IronPort-SDR: 86nZRXlTLEaCDpZ77Kn6dY841tLXMMFInjNL2kB6ChDDRP8mHmyFf4eIjAZI0NIK1sw0HbHnIq
 Vz7xzlUM6U6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
   d="scan'208";a="392345254"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 11 May 2021 08:39:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 41F98249; Tue, 11 May 2021 18:40:01 +0300 (EEST)
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
Subject: [PATCH v2 3/4] nilfs2: Switch to use %ptTs
Date:   Tue, 11 May 2021 18:39:57 +0300
Message-Id: <20210511153958.34527-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
References: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use %ptTs instead of open coded variant to print contents
of time64_t type in human readable form.

Use sysfs_emit() at the same time in the changed functions.

Cc: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Cc: linux-nilfs@vger.kernel.org
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
v2: collected tags
 fs/nilfs2/sysfs.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/fs/nilfs2/sysfs.c b/fs/nilfs2/sysfs.c
index 303d71430bdd..4e10423f0448 100644
--- a/fs/nilfs2/sysfs.c
+++ b/fs/nilfs2/sysfs.c
@@ -19,19 +19,6 @@
 /* /sys/fs/<nilfs>/ */
 static struct kset *nilfs_kset;
 
-#define NILFS_SHOW_TIME(time_t_val, buf) ({ \
-		struct tm res; \
-		int count = 0; \
-		time64_to_tm(time_t_val, 0, &res); \
-		res.tm_year += 1900; \
-		res.tm_mon += 1; \
-		count = scnprintf(buf, PAGE_SIZE, \
-				    "%ld-%.2d-%.2d %.2d:%.2d:%.2d\n", \
-				    res.tm_year, res.tm_mon, res.tm_mday, \
-				    res.tm_hour, res.tm_min, res.tm_sec);\
-		count; \
-})
-
 #define NILFS_DEV_INT_GROUP_OPS(name, parent_name) \
 static ssize_t nilfs_##name##_attr_show(struct kobject *kobj, \
 					struct attribute *attr, char *buf) \
@@ -576,7 +563,7 @@ nilfs_segctor_last_seg_write_time_show(struct nilfs_segctor_attr *attr,
 	ctime = nilfs->ns_ctime;
 	up_read(&nilfs->ns_segctor_sem);
 
-	return NILFS_SHOW_TIME(ctime, buf);
+	return sysfs_emit(buf, "%ptTs\n", &ctime);
 }
 
 static ssize_t
@@ -604,7 +591,7 @@ nilfs_segctor_last_nongc_write_time_show(struct nilfs_segctor_attr *attr,
 	nongc_ctime = nilfs->ns_nongc_ctime;
 	up_read(&nilfs->ns_segctor_sem);
 
-	return NILFS_SHOW_TIME(nongc_ctime, buf);
+	return sysfs_emit(buf, "%ptTs\n", &nongc_ctime);
 }
 
 static ssize_t
@@ -724,7 +711,7 @@ nilfs_superblock_sb_write_time_show(struct nilfs_superblock_attr *attr,
 	sbwtime = nilfs->ns_sbwtime;
 	up_read(&nilfs->ns_sem);
 
-	return NILFS_SHOW_TIME(sbwtime, buf);
+	return sysfs_emit(buf, "%ptTs\n", &sbwtime);
 }
 
 static ssize_t
-- 
2.30.2

