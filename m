Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E4FC43462
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Apr 2021 11:18:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10D7261029
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Apr 2021 11:18:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234833AbhDSLTG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Apr 2021 07:19:06 -0400
Received: from mail-m17635.qiye.163.com ([59.111.176.35]:19758 "EHLO
        mail-m17635.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234812AbhDSLTG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Apr 2021 07:19:06 -0400
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
        by mail-m17635.qiye.163.com (Hmail) with ESMTPA id DC40E400513;
        Mon, 19 Apr 2021 19:18:34 +0800 (CST)
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] drm/tegra: Remove duplicate struct declaration
Date:   Mon, 19 Apr 2021 19:18:26 +0800
Message-Id: <20210419111827.41390-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQh8dQ1ZMHR0YGEJDGB5NT05VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nio6MBw4Dz8cChQRSUJISxUs
        EhFPCzBVSlVKTUpDQ0hKSkpOT0JCVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
        TVVKTklVSk9OVUpDSVlXWQgBWUFKTE1JNwY+
X-HM-Tid: 0a78e9da837dd991kuwsdc40e400513
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

struct tegra_dc is declared at 13rd line.
The declaration here is unnecessary. Remove it.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/gpu/drm/tegra/hub.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hub.h b/drivers/gpu/drm/tegra/hub.h
index 3efa1be07ff8..23c4b2115ed1 100644
--- a/drivers/gpu/drm/tegra/hub.h
+++ b/drivers/gpu/drm/tegra/hub.h
@@ -72,7 +72,6 @@ to_tegra_display_hub_state(struct drm_private_state *priv)
 	return container_of(priv, struct tegra_display_hub_state, base);
 }
 
-struct tegra_dc;
 struct tegra_plane;
 
 int tegra_display_hub_prepare(struct tegra_display_hub *hub);
-- 
2.25.1

