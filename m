Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2266AEE49A5
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Aug 2023 07:17:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbjHVHR2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Aug 2023 03:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233233AbjHVHR1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Aug 2023 03:17:27 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC881984
        for <linux-tegra@vger.kernel.org>; Tue, 22 Aug 2023 00:16:50 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RVLCn3PG0zVkZJ;
        Tue, 22 Aug 2023 15:13:09 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 15:15:23 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <thierry.reding@gmail.com>,
        <mperttunen@nvidia.com>, <jonathanh@nvidia.com>,
        <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 0/2] drm: Use PTR_ERR_OR_ZERO() to simplify code
Date:   Tue, 22 Aug 2023 15:15:01 +0800
Message-ID: <20230822071503.178000-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

PTR_ERR_OR_ZERO() return the error code within @ptr if it is
an error pointer, otherwise return 0. So use it to simplify code.

Jinjie Ruan (2):
  drm/bridge: Use PTR_ERR_OR_ZERO() to simplify code
  drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code

 drivers/gpu/drm/bridge/tc358762.c | 10 ++--------
 drivers/gpu/drm/bridge/tc358764.c |  5 +----
 drivers/gpu/drm/tegra/drm.c       |  5 +----
 drivers/gpu/drm/tegra/gem.c       |  5 +----
 4 files changed, 5 insertions(+), 20 deletions(-)

-- 
2.34.1

