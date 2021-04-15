Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AEAC433B4
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Apr 2021 15:29:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C750611AB
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Apr 2021 15:29:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233533AbhDOPaJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Apr 2021 11:30:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:60024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233606AbhDOPaH (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Apr 2021 11:30:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 838E86101C;
        Thu, 15 Apr 2021 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618500584;
        bh=z1SA4q9mQ38Sp1cmrlxiVoVqhe/PV0miNVm8NDA+J3E=;
        h=From:To:Cc:Subject:Date:From;
        b=GV94Cr4V/6tnbMioEh0KYbJYGrn2GmgMcSDKJU8nt+u2Z5i64Y2be8M1hn1/gQshs
         opxNYcxc8Q5ZxrOtZph5V5f4a+q481wjKNFj4ej7Cw+vqe77CUEdi3+tBkmmagaUIL
         QouYyx/dTzaExzlKroMRY/BElBZWM0BULVkKDbxtIWvy36qBqUlQdEnEQfav5smcDx
         UNlJ5rDJP1wX8LtunPp6qzTTmFCvZQS5TC8DqipSlJ8rV8NXjxKGmODK1bUv13yI6h
         BF5yBsIwT3hdyJd7E7oqFZ5XFpC37H0vWSPEbHD6ww5XPN4yo4Yz50QjGEyxF3Pnfz
         FZL26DKz5CRTQ==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] drm/tegra: Fix shift overflow in tegra_shared_plane_atomic_update
Date:   Thu, 15 Apr 2021 08:29:14 -0700
Message-Id: <20210415152913.1363964-1-nathan@kernel.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a5
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Clang warns:

drivers/gpu/drm/tegra/hub.c:513:11: warning: shift count >= width of
type [-Wshift-count-overflow]
                base |= BIT(39);
                        ^~~~~~~

BIT is unsigned long, which is 32-bit on ARCH=arm, hence the overflow
warning. Switch to BIT_ULL, which is 64-bit and will not overflow.

Fixes: 7b6f846785f4 ("drm/tegra: Support sector layout on Tegra194")
Link: https://github.com/ClangBuiltLinux/linux/issues/1351
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/tegra/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 79bff8b48271..bfae8a02f55b 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -510,7 +510,7 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 	 * dGPU sector layout.
 	 */
 	if (tegra_plane_state->tiling.sector_layout == TEGRA_BO_SECTOR_LAYOUT_GPU)
-		base |= BIT(39);
+		base |= BIT_ULL(39);
 #endif
 
 	tegra_plane_writel(p, tegra_plane_state->format, DC_WIN_COLOR_DEPTH);

base-commit: 0265531f0897f890da3f9c2958707af099c7d974
-- 
2.31.1.272.g89b43f80a5

