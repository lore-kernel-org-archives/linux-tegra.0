Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB912C43334
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Jun 2022 12:32:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237586AbiFOMcq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Jun 2022 08:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236110AbiFOMco (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Jun 2022 08:32:44 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E59921403C;
        Wed, 15 Jun 2022 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=yVxto
        WzxfVXc9Waao1MVmOuzqFd4U+QS86n1nMvSL/o=; b=WGCYTv1DzPjzZztRfimdW
        2R0kmwl7Qod0F2sBNMT3yWnvNK8YIHQddLHIL0LOIy2dXtaMlhP27tYCMUa7h6sx
        CvQ6wa4Xx8sZ7NcdevRT+oufUfVTmeWmotiLzd/NaXlO/0OYbGrN50z+CnF7MJ+M
        gZP6Vk17MfMbXViehYzqr4=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowACHgdlg0aliDgNqDQ--.43205S2;
        Wed, 15 Jun 2022 20:32:32 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        windhl@126.com
Subject: [PATCH] drivers: soc: tegra: fuse: Add missing of_node_put() in tegra-apbmisc.c
Date:   Wed, 15 Jun 2022 20:32:32 +0800
Message-Id: <20220615123232.3965673-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowACHgdlg0aliDgNqDQ--.43205S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFW3GryrZw1kZrWDXryDAwb_yoWkGwb_WF
        4UWr93XFWUuFs7Wrya9r43ZryqvayIqFn2gr4Iyr93Gw17XFnxJF4j9r1DCw13Zws2gFyD
        Aw12vFy8Ar43WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_znQ7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuAEhF2JVj38QFgAAsO
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

In tegra_init_apbmisc(), of_find_matching_node() will return a node
pointer with refcount incremented. We should use of_node_put in each
fail path or when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 590c862538d0..24e54e766581 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -182,12 +182,12 @@ void __init tegra_init_apbmisc(void)
 		 */
 		if (of_address_to_resource(np, 0, &apbmisc) < 0) {
 			pr_err("failed to get APBMISC registers\n");
-			return;
+			goto out_put;
 		}
 
 		if (of_address_to_resource(np, 1, &straps) < 0) {
 			pr_err("failed to get strapping options registers\n");
-			return;
+			goto out_put;
 		}
 	}
 
@@ -208,4 +208,7 @@ void __init tegra_init_apbmisc(void)
 	}
 
 	long_ram_code = of_property_read_bool(np, "nvidia,long-ram-code");
+
+out_put:
+	of_node_put(np);
 }
-- 
2.25.1

