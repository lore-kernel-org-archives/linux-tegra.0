Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040AE26E710;
	Sun,  1 Mar 2026 01:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328098; cv=none; b=YMVg2GUfGZVvofpWevuHgnBU2s32u14XI9ol9PdPYd9ijIdejXX+5Sl/z/8QEReOX6UJ27oC4Q9a2DTXyuEAiGvxn/MxPEFrzc7//iPbFN1vtRUfGlMIlgy63LTZcIEVsUUzHpC7EbpXIwdxDUxYAiHU3h498mflv2Z/RxEEmKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328098; c=relaxed/simple;
	bh=0Ox7k95bsA7AFaqgdTUobxUxF1b1PqcYR5KCI6k1nUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pa0GOUk2dPy/cD9xNp/Pi5bhSyjkWAp8WQyLTGLLFxZ5Jp5sh5GaXbPFd9xSpYdL/pJ+1tFgP8DigQQjpCbYGscfM5DYOci/nbJuSFuNg4YIIsFsGLDPm6kLLfDB4NkRQI0JkU4g6npECb3DnFY11f48ar2UdWFzxsTN5ISFCGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4hAdYdz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4hAdYdz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354BFC19424;
	Sun,  1 Mar 2026 01:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328097;
	bh=0Ox7k95bsA7AFaqgdTUobxUxF1b1PqcYR5KCI6k1nUA=;
	h=From:To:Cc:Subject:Date:From;
	b=k4hAdYdzjnXfn9claSTcWSKkMm94F8nz0BVSqcy9v8Ziz4Q80Ec6b5XzyXbztxdfq
	 SDNRmlFNTGysi7lohKt36AtXLY7k38/cGi1eovqk25l/FumAtrZ3cXC5XX5Oe+88Y4
	 65Bbs+MpTGzjHvstVSSzt2dZHA4+ZN3TQmoxAz3ARi7tTDAdN5QgleXcf5TNX3K22c
	 FKDzNle13hfVGGep7d/mNA9bKFi5w1rzd+iyJBe65Y6Fcqzd2x21git8ly0cu0jzKk
	 DxK62lk4tLXvfJAo9eKx/894FJs6PcTBcgECtChShGruksqmykqWTPJye6UYdspfIP
	 2YitekHPjhzdw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lihaoxiang@isrc.iscas.ac.cn
Cc: Brian Masney <bmasney@redhat.com>,
	Thierry Reding <treding@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: FAILED: Patch "clk: tegra: tegra124-emc: Fix potential memory leak in tegra124_clk_register_emc()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:21:35 -0500
Message-ID: <20260301012136.1677617-1-sashal@kernel.org>
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

The patch below does not apply to the 6.12-stable tree.
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




