Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764962C1788;
	Sun,  1 Mar 2026 01:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328780; cv=none; b=Z89jjob6D5DZyltJeGw7bvOC+kWspL+P9H5MYJQo5r4deKOwkDXz+BL6AHRClEcz4L4gUrB8fxRgcc8yabUMEi2PygVvNJPdMiq9geoGwkeegnomjNwE3+/xtOz5io9uoVUiHvbg56VAsyD2hCyLGNWQqPAfBJdrgzk7cUGVd+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328780; c=relaxed/simple;
	bh=YprwY4GuCPHJiogG0GgbvQEZUMdlTc50FVsRCTE6+s0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P2HEHnGMO1eSXeHmHVKcoEo1zRPtGAGEYp67bG+9PZNIXJPXubEggBiUNDNNiV6Bz/Qmrz89DUzCW6EOaFW+psX/YNLgAktPImnpzIPdVECjITVWNEw+dIuHLA9uy58JHrZNHGJiFYpOy8qV2jR1HkybMgqZD6QcvIY8RoZhZ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVW61yBw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVW61yBw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3245C19421;
	Sun,  1 Mar 2026 01:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328780;
	bh=YprwY4GuCPHJiogG0GgbvQEZUMdlTc50FVsRCTE6+s0=;
	h=From:To:Cc:Subject:Date:From;
	b=YVW61yBwNQQFtvxdV3VMyyRaflV0hpZawhKtX1sANm3xR9RgtJBfi4uI2hdyk4Rj2
	 97DRGLonsn7KNaODdM/LTaSMdT1BS99u9QB7RwqysTuZ6o6nHoTXwhwF99KiJ8s/Np
	 +3m7cmpAnVqxSGLdhiuTPOBR7RKLNuEqQXrG6pzxVS2lywLxdDHvFM7Awq22P7qtTT
	 XSnDCMUJ56JJJNbNsnh+F8mEsPSNRr0yRoASAD6FUIYdsvcvYcUI28cFnEERnrclIb
	 NZ02tES0Ue2V4DQSmxNSiRFNkkXxkNwfLi0HZ7oAND7epODWc8zZYczynYiW8IfkML
	 sD45DOnnXCPKg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lihaoxiang@isrc.iscas.ac.cn
Cc: Brian Masney <bmasney@redhat.com>,
	Thierry Reding <treding@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: FAILED: Patch "clk: tegra: tegra124-emc: Fix potential memory leak in tegra124_clk_register_emc()" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:32:58 -0500
Message-ID: <20260301013258.1692111-1-sashal@kernel.org>
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

The patch below does not apply to the 6.6-stable tree.
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




