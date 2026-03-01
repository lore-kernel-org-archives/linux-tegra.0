Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A477430B9A;
	Sun,  1 Mar 2026 02:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330441; cv=none; b=oOhFfwkrt3xIm35PxDcHaYwN70MBA0AxE6Wn68hcWefl9fcrAnDS6OEyK5/EKOceNJ5ST2Ju17la/XVBpLonKGMC7otk2KZ9MG80tBy9S2z+vWWcOPGFdQqlc/mlgcWthcVIH0WWsKfmJ3prUuSdhvcJkASDjiL9jdLDtw55GnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330441; c=relaxed/simple;
	bh=RgXcPaat3tveaK8mP/9fTOe4MdR3mGv+69bcMh/qW3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QybmXLQARmrNI/zDdzWPRiPrjOIAQRKBBD4ofD7YOeV5KpG2YtE7TL4X5An6ck5yOqNufTnLyFGlEBjI/o9+kZ44gJZCnrlmNbO/7Xf+8X5GLjz5tws+ODbz7LsCqM0qJS3p0X8FEOM0gTsZmIOL0SEmAQox2bt25aEWkIzQEHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFlgt9qF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFlgt9qF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F1EC19421;
	Sun,  1 Mar 2026 02:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330441;
	bh=RgXcPaat3tveaK8mP/9fTOe4MdR3mGv+69bcMh/qW3Y=;
	h=From:To:Cc:Subject:Date:From;
	b=dFlgt9qFsRFa15Rdkp+ksHKP1kqd1rsxgyeresWLnF+Y1abG6gAsJRb3z37tL6tWz
	 kCz+n+hZWX8uYLFM7HkhxohAD7p5vSHeYl8b5afTsw+gNSY4rtGSH6DeM8BruBwZwb
	 a1hwsw+cByHa8oRtDVY5KMqye1bDlFgkdWS65bV4Vs3OWEnMclvzV7MatfI63UQASs
	 Aunie+8uZoJN49qskiy6UDSAT39AGGgB7KrlfDKz2JWhCBWLCLfvwiv3bOaKA6V7al
	 uNNx6teGQm0K+8Nf7PMbaM/tsm7905rZo4JzqD1xECWsF9JjpcGWktelyG9AOniByk
	 qQRrfrocA7P5Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lihaoxiang@isrc.iscas.ac.cn
Cc: Brian Masney <bmasney@redhat.com>,
	Thierry Reding <treding@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: FAILED: Patch "clk: tegra: tegra124-emc: Fix potential memory leak in tegra124_clk_register_emc()" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:00:39 -0500
Message-ID: <20260301020039.1726787-1-sashal@kernel.org>
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

The patch below does not apply to the 5.10-stable tree.
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




