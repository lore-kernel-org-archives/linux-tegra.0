Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE192C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Apr 2022 07:17:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbiDMHT0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Apr 2022 03:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbiDMHTZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Apr 2022 03:19:25 -0400
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5B5C5BE39;
        Wed, 13 Apr 2022 00:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=IPpag
        3+972R44s++fbd4ZAcZ5wlqRJ02VxB1aGKpffw=; b=nEdXCtMrzOZ/zONktw5jg
        1I09nJfdWLc33D9fu4tR5TH6vmjjL10DqtJS9HSLlbGPhEu2/zLYK8ZaIdcQwIAp
        3lT1Sui3EmoDWNwM4loA5wVd3I+nL3blvsJBCcEIqrNLcdFRcsfXuXZIH8R3GBI1
        4362rJv8MdczpkWAwIpCWI=
Received: from ubuntu.localdomain (unknown [58.213.83.157])
        by smtp1 (Coremail) with SMTP id C8mowACXpycocFZimRLWAQ--.47686S4;
        Wed, 13 Apr 2022 14:39:38 +0800 (CST)
From:   Bernard Zhao <zhaojunkui2008@126.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     bernard@vivo.com, Bernard Zhao <zhaojunkui2008@126.com>
Subject: [PATCH] gpu/host1x: remove useless if(ptr) check to kfree
Date:   Tue, 12 Apr 2022 23:39:34 -0700
Message-Id: <20220413063934.23571-1-zhaojunkui2008@126.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowACXpycocFZimRLWAQ--.47686S4
X-Coremail-Antispam: 1Uf129KBjvdXoW5KrWxZr1UAw1xWFyfXr48Crg_yoWxXwb_ur
        1kJr1kW3yrGFnYqa17ArnxZrW0yFZ8uaykZryIga4rtryUCrn8Jw17ur1fu3WrWa1rGFyD
        A3WxtrW5Jw17KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRpwZzPUUUUU==
X-Originating-IP: [58.213.83.157]
X-CM-SenderInfo: p2kd0y5xqn3xasqqmqqrswhudrp/1tbiYArhqlpEG2eDWwAAsb
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch remove useless if(ptr) check to kfree.

Signed-off-by: Bernard Zhao <zhaojunkui2008@126.com>
---
 drivers/gpu/host1x/fence.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
index ecab72882192..05b36bfc8b74 100644
--- a/drivers/gpu/host1x/fence.c
+++ b/drivers/gpu/host1x/fence.c
@@ -93,8 +93,7 @@ static void host1x_syncpt_fence_release(struct dma_fence *f)
 {
 	struct host1x_syncpt_fence *sf = to_host1x_fence(f);
 
-	if (sf->waiter)
-		kfree(sf->waiter);
+	kfree(sf->waiter);
 
 	dma_fence_free(f);
 }
-- 
2.33.1

