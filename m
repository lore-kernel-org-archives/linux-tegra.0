Return-Path: <SRS0=h/hb=EB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E48DC2D0A3
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Oct 2020 16:50:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D717F221FC
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Oct 2020 16:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603731020;
	bh=RL766Tz5kKTS6+hZ5d7QbkmR7LmzywMZ451dW3cIvns=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=nBSPPbNBHN26Dwh4UzpQvVkssoSYERbB/GEVpHP1lINhdUT87X3bTIkZiTYbRXP06
	 ywDQoWN6qMl26jM2WM7BhO6cKqCq+zvQ5m/0zCdx0MHYug8INNhDGZRd8OXjEWFeWF
	 gj/stQrIbcUqmaWl+4z+8cNxhEKCPAeu8FLZSXmo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781255AbgJZQuU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Oct 2020 12:50:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:43482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1786321AbgJZQtq (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Oct 2020 12:49:46 -0400
Received: from localhost.localdomain (unknown [192.30.34.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E9252221FC;
        Mon, 26 Oct 2020 16:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603730986;
        bh=RL766Tz5kKTS6+hZ5d7QbkmR7LmzywMZ451dW3cIvns=;
        h=From:To:Cc:Subject:Date:From;
        b=vSEVqhGMLk9CuisEXVYM5AMsksW+yyUTVJaIRWlLoqsmbj7fNlGB67V493rakD6Y3
         klRjCNWhOrQfyLKikCgCnA7+X8VLJZC+e2KCEYjM+M3aJiF5XgXUrNBqfHS9dwOoo5
         ckDFiDiOt9RM+xpMes9rzLYO+/7G0fi2D4xlFvjA=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Thierry Reding <treding@nvidia.com>,
        Timo Alho <talho@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] firmware: tegra: fix strncpy()/strncat() confusion
Date:   Mon, 26 Oct 2020 17:49:21 +0100
Message-Id: <20201026164937.3722420-1-arnd@kernel.org>
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
v2: Use the correct arguments for snprintf(), as pointed out by Arvind Sankar
---
 drivers/firmware/tegra/bpmp-debugfs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index c1bbba9ee93a..440d99c63638 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -412,16 +412,12 @@ static int bpmp_populate_debugfs_inband(struct tegra_bpmp *bpmp,
 				goto out;
 			}
 
-			len = strlen(ppath) + strlen(name) + 1;
+			len = snprintf(pathbuf, pathlen, "%s%s/", ppath, name);
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

