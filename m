Return-Path: <SRS0=h/hb=EB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DD6C55178
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Oct 2020 16:11:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B05F124671
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Oct 2020 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603728696;
	bh=MvvTXPhG69td+8D1sJTke2O2+T03PtpLlVCyAQkLTEQ=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=z1gBvQL96MS2b8rmhm0gLrhr14hrQr2iscgHdnTQ/n68owP+Bl4NLmPACsFTMa0yT
	 Y4eJSqHTfcbAtvaVMgsOVQBb0CWOzXr3VJNBkP3dd2e1inCoiiz2ausDBjxI7aDy1A
	 B5DNM0tz8nqzx9TV2C4h4jOSw0r72iJwfyFIXOM8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1739555AbgJZQL0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Oct 2020 12:11:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:55882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2441629AbgJZQKc (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Oct 2020 12:10:32 -0400
Received: from localhost.localdomain (unknown [192.30.34.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 13D4F239D2;
        Mon, 26 Oct 2020 16:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603728631;
        bh=MvvTXPhG69td+8D1sJTke2O2+T03PtpLlVCyAQkLTEQ=;
        h=From:To:Cc:Subject:Date:From;
        b=nQZFvp9CrLRIw6Zqkh2IRhJv6+Thc9Skfmt5Y/hpWBs9uNqojRF7hQEKsDQ4buhmo
         7NpCkZpWhoiOuYgu/z2Oteq49BV1bnQRB9PTmjMWcE9SHLiYJ3crPvAA3UNoIw8Oyt
         OMBirbmnjJCywhByg4xFB6F/b5sNEAkMWifgDmV4=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>,
        Timo Alho <talho@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: tegra: fix strncpy()/strncat() confusion
Date:   Mon, 26 Oct 2020 17:10:19 +0100
Message-Id: <20201026161026.3707545-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The way that bpmp_populate_debugfs_inband() uses strncpy()
and strncat() makes no sense since the size argument for
the first is insufficient to contain the trailing '/'
and the second passes the length of the input rather than
the output, which triggers a warning:

In function 'strncat',
    inlined from 'bpmp_populate_debugfs_inband' at ../drivers/firmware/tegra/bpmp-debugfs.c:422:4:
include/linux/string.h:289:30: warning: '__builtin_strncat' specified bound depends on the length of the source argument [-Wstringop-overflow=]
  289 | #define __underlying_strncat __builtin_strncat
      |                              ^
include/linux/string.h:367:10: note: in expansion of macro '__underlying_strncat'
  367 |   return __underlying_strncat(p, q, count);
      |          ^~~~~~~~~~~~~~~~~~~~
drivers/firmware/tegra/bpmp-debugfs.c: In function 'bpmp_populate_debugfs_inband':
include/linux/string.h:288:29: note: length computed here
  288 | #define __underlying_strlen __builtin_strlen
      |                             ^
include/linux/string.h:321:10: note: in expansion of macro '__underlying_strlen'
  321 |   return __underlying_strlen(p);

Simplify this to use an snprintf() instead.

Fixes: 5e37b9c137ee ("firmware: tegra: Add support for in-band debug")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/firmware/tegra/bpmp-debugfs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index c1bbba9ee93a..9ec20ddc9a6b 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -412,16 +412,12 @@ static int bpmp_populate_debugfs_inband(struct tegra_bpmp *bpmp,
 				goto out;
 			}
 
-			len = strlen(ppath) + strlen(name) + 1;
+			len = snprintf("%s%s/", pathlen, ppath, name);
 			if (len >= pathlen) {
 				err = -EINVAL;
 				goto out;
 			}
 
-			strncpy(pathbuf, ppath, pathlen);
-			strncat(pathbuf, name, strlen(name));
-			strcat(pathbuf, "/");
-
 			err = bpmp_populate_debugfs_inband(bpmp, dentry,
 							   pathbuf);
 			if (err < 0)
-- 
2.27.0

