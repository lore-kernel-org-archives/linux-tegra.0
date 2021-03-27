Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26597C433DB
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Mar 2021 07:37:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C54A0619FF
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Mar 2021 07:37:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbhC0Hgx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 27 Mar 2021 03:36:53 -0400
Received: from mail-m17637.qiye.163.com ([59.111.176.37]:27986 "EHLO
        mail-m17637.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbhC0Hga (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Mar 2021 03:36:30 -0400
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
        by mail-m17637.qiye.163.com (Hmail) with ESMTPA id 8F57F9800B1;
        Sat, 27 Mar 2021 15:36:28 +0800 (CST)
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] drm: tegra: hub: struct tegra_dc is declared twice
Date:   Sat, 27 Mar 2021 15:36:17 +0800
Message-Id: <20210327073617.1487123-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZGB9IHhkdSU4dQ0sdVkpNSk1DSEtOQ0NDS05VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pwg6Nww*Qj8VTzM9FAstCgJD
        NigwCxFVSlVKTUpNQ0hLTkNCSk5KVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
        TVVKTklVSk9OVUpDSVlXWQgBWUFJS0hLNwY+
X-HM-Tid: 0a78729ce741d992kuws8f57f9800b1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

struct tegra_dc has been declared at 13rd line.
Remove the duplicate.
Move struct tegra_plane declaration forward.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/gpu/drm/tegra/hub.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hub.h b/drivers/gpu/drm/tegra/hub.h
index 3efa1be07ff8..36593bb36072 100644
--- a/drivers/gpu/drm/tegra/hub.h
+++ b/drivers/gpu/drm/tegra/hub.h
@@ -11,6 +11,7 @@
 #include "plane.h"
 
 struct tegra_dc;
+struct tegra_plane;
 
 struct tegra_windowgroup {
 	unsigned int usecount;
@@ -72,9 +73,6 @@ to_tegra_display_hub_state(struct drm_private_state *priv)
 	return container_of(priv, struct tegra_display_hub_state, base);
 }
 
-struct tegra_dc;
-struct tegra_plane;
-
 int tegra_display_hub_prepare(struct tegra_display_hub *hub);
 void tegra_display_hub_cleanup(struct tegra_display_hub *hub);
 
-- 
2.25.1

