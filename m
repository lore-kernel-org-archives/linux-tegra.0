Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4B01CD2C;
	Sun,  1 Mar 2026 01:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329336; cv=none; b=RdlOsUSHP04pf/vG7OXz6vAgssZo6G/tQzVKfnvI6xsjtmrUk/zm9XqQS1GRnU3KV5e4MP4/mhnr2ZpFNkFSTArxFxXjcGrbdwZV+kaYkn37UEhvp+byN7y5e6Kq45oKLy5+sL0G5Ou/8ndlM6OoxW9kjyTDVFWlnko3Z1DndZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329336; c=relaxed/simple;
	bh=vsoR3yyadeUCCksgORzAW8aDQlA2LTTwDmnMVbYdUZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SrsZlPjiOcNC6k6cZBFivpvOmOH/xM3MkAhGTdONyqmqOjt8ckz/YCSS8MAhYtbdgvYJu6EkiRooptQ0IJRzRiNC9MbkjS04niDx4NE2gAvbhABbCStXx+uDJ8xGogGBvn8XaaKLsV9RPpQ2zMLspoAH0f3dDAqn44lSqnifsrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvz6YTYi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvz6YTYi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D557C19421;
	Sun,  1 Mar 2026 01:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329335;
	bh=vsoR3yyadeUCCksgORzAW8aDQlA2LTTwDmnMVbYdUZ0=;
	h=From:To:Cc:Subject:Date:From;
	b=pvz6YTYicfYLpKmMt2tuEiTr3iG5ev/r6jgUuwc2cREuVobJ7NxPFZAL3mDNi94zA
	 5dZXxnOmnAaxDIoCSALa3P03/1yBPUC2fDcAYdMeyYFTZTLPYWwl9VLVa6Pd0MJuPE
	 EZ/18ZTole8CD0HtEdyAKfCkB4pbix4/C6qZG3g0YmP4fXMRHqtH5Aezs6AAiz4Qti
	 gSxQh9Cwq0jrbKDPqOdE5r3NPjHyR5hU8frbxQvTCbngHTdx45/arykG9mnxC2uHLH
	 gu/xFaO05PbmbXZVhn8pHJiq11XFjnLVNt/42Hc30OKZZYCA8iCBIzP51+PbpMJFkK
	 s49qwTTHSQlrQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lihaoxiang@isrc.iscas.ac.cn
Cc: Brian Masney <bmasney@redhat.com>,
	Thierry Reding <treding@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: FAILED: Patch "clk: tegra: tegra124-emc: Fix potential memory leak in tegra124_clk_register_emc()" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:42:13 -0500
Message-ID: <20260301014214.1704043-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From fce0d0bd9c20fefd180ea9e8362d619182f97a1d Mon Sep 17 00:00:00 2001
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Date: Thu, 15 Jan 2026 13:05:42 +0800
Subject: [PATCH] clk: tegra: tegra124-emc: Fix potential memory leak in
 tegra124_clk_register_emc()

If clk_register() fails, call kfree to release "tegra".

Fixes: 2db04f16b589 ("clk: tegra: Add EMC clock driver")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra124-emc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
index 2a6db04342815..0f6fb776b2298 100644
--- a/drivers/clk/tegra/clk-tegra124-emc.c
+++ b/drivers/clk/tegra/clk-tegra124-emc.c
@@ -538,8 +538,10 @@ struct clk *tegra124_clk_register_emc(void __iomem *base, struct device_node *np
 	tegra->hw.init = &init;
 
 	clk = clk_register(NULL, &tegra->hw);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
+		kfree(tegra);
 		return clk;
+	}
 
 	tegra->prev_parent = clk_hw_get_parent_by_index(
 		&tegra->hw, emc_get_parent(&tegra->hw))->clk;
-- 
2.51.0




