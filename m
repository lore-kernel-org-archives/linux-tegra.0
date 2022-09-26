Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288C4C6FA82
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Sep 2022 02:37:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233163AbiIZChR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 25 Sep 2022 22:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233157AbiIZChL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 25 Sep 2022 22:37:11 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC4F2B27C;
        Sun, 25 Sep 2022 19:33:50 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MbRZQ6vZbzpVRT;
        Mon, 26 Sep 2022 10:30:54 +0800 (CST)
Received: from huawei.com (10.67.175.83) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 10:33:48 +0800
From:   ruanjinjie <ruanjinjie@huawei.com>
To:     <thierry.reding@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <jonathanh@nvidia.com>, <dri-devel@lists.freedesktop.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] drm/tegra: make gather_bo_ops static
Date:   Mon, 26 Sep 2022 10:29:59 +0800
Message-ID: <20220926022959.739074-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.175.83]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The symbol is not used outside of the file, so mark it static.

Fixes the following warning:

./drivers/gpu/drm/tegra/submit.c:136:28: warning: symbol 'gather_bo_ops'
was not declared. Should it be static?

Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/tegra/submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index 84041fc8239a..066f88564169 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -133,7 +133,7 @@ static void gather_bo_munmap(struct host1x_bo *host_bo, void *addr)
 {
 }
 
-const struct host1x_bo_ops gather_bo_ops = {
+static const struct host1x_bo_ops gather_bo_ops = {
 	.get = gather_bo_get,
 	.put = gather_bo_put,
 	.pin = gather_bo_pin,
-- 
2.25.1

