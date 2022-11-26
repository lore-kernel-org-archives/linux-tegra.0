Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63B6C4321E
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Nov 2022 04:50:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbiKZEui (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Nov 2022 23:50:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiKZEuh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Nov 2022 23:50:37 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9AD24F11
        for <linux-tegra@vger.kernel.org>; Fri, 25 Nov 2022 20:50:36 -0800 (PST)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NJzmm2jc7zRpVR;
        Sat, 26 Nov 2022 12:50:00 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 26 Nov 2022 12:50:34 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 26 Nov
 2022 12:50:33 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
        <airlied@gmail.com>, <daniel@ffwll.ch>, <mperttunen@nvidia.com>,
        <cyndis@kapsi.fi>
CC:     <yangyingliang@huawei.com>
Subject: [PATCH v2 0/2] gpu: host1x: possible double free and memory leak
Date:   Sat, 26 Nov 2022 12:48:20 +0800
Message-ID: <20221126044822.141269-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patchset fix two possible problems in the error path in
host1x_memory_context_list_init().

v1 -> v2:
  patch #1 don't return error code, if IOMMU is disabled.
  patch #2 make error handling code more clean.

  Put the two patches in one patchset.
  http://patchwork.ozlabs.org/project/linux-tegra/patch/20221028130300.1133520-1-yangyingliang@huawei.com/
  http://patchwork.ozlabs.org/project/linux-tegra/patch/20221124080559.3592650-1-yangyingliang@huawei.com/

Yang Yingliang (2):
  gpu: host1x: fix potential double free if IOMMU is disabled
  gpu: host1x: fix memory leak of device names

 drivers/gpu/host1x/context.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

-- 
2.25.1

