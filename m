Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8210D145A1F;
	Sun,  1 Mar 2026 01:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329403; cv=none; b=IUJ7rpTgQo6kdSV4SqNRu1milVRzu3MLJ8CEZgVeZ6je8coEmPSCd+KWTeKAoOsqXfSPRlAwXIhtCaRWcm9gZGchPEdeJ+lK4/SkGyRaelaK9fewo4vta44zSbbiTiTL9DJLrY2gwHyMNw3Ot29GRwVh2BteprAySinU9ehrfK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329403; c=relaxed/simple;
	bh=/F/ToFn6UCh1yw1eEivyu0FetzvXUx4TUhqrueZDDgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nuw1DMkl6uKPaDc6kP8x4CjJ2PFImRV62zwkZyGtoS+nA2C+/WG57sBtPFky9O5mQchxnzT4EVdxfc+ej4GHdOWCdv4zPMuCKHqYDM1lDgWDG81/lA6xWkB0L1i5/UbrbDzXW0fc3Z1FnH699xNqdTTZME/b1zDLHOs87Lvtm1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KoK+6agm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KoK+6agm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A325BC19424;
	Sun,  1 Mar 2026 01:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329403;
	bh=/F/ToFn6UCh1yw1eEivyu0FetzvXUx4TUhqrueZDDgg=;
	h=From:To:Cc:Subject:Date:From;
	b=KoK+6agmh4MNQXfEWxa5UvtWG6XyUoDmfI6yq7g5SUsqswdoufFtTfE1YKpKXO5H2
	 TGbtuOGm+0oQTWokcIQVthmm9ii4O61pVG+njCRzs18lYOZI5MHslcl5saezeU/qTL
	 Qo8znMYUz0EcLR8wP3hP0DtFeZuUUzg/BGHhOXFpyCLsZvUTvcThDhwNxRmrxNhR1p
	 jfI0cQ9D1TQG1jlJDgSLZc9l3L4py18ZXu0KvZvwcUrY6DJfc8DU16fIOnzdYFAA0u
	 iDDJEclabUCapA6VnlJ1Gg9IiikIZcU9KaZDx1dNk4gE+VRebXEXMwlZg2vZ5PZ79X
	 zLHWK/eDJdOEA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	johan@kernel.org
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: FAILED: Patch "clk: tegra: tegra124-emc: fix device leak on set_rate()" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:43:21 -0500
Message-ID: <20260301014321.1705438-1-sashal@kernel.org>
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

From da61439c63d34ae6503d080a847f144d587e3a48 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Fri, 21 Nov 2025 17:40:03 +0100
Subject: [PATCH] clk: tegra: tegra124-emc: fix device leak on set_rate()

Make sure to drop the reference taken when looking up the EMC device and
its driver data on first set_rate().

Note that holding a reference to a device does not prevent its driver
data from going away so there is no point in keeping the reference.

Fixes: 2db04f16b589 ("clk: tegra: Add EMC clock driver")
Fixes: 6d6ef58c2470 ("clk: tegra: tegra124-emc: Fix missing put_device() call in emc_ensure_emc_driver")
Cc: stable@vger.kernel.org	# 4.2: 6d6ef58c2470
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Miaoqian Lin <linmq006@gmail.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/tegra/clk-tegra124-emc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
index 2a6db04342815..2777e70da8b99 100644
--- a/drivers/clk/tegra/clk-tegra124-emc.c
+++ b/drivers/clk/tegra/clk-tegra124-emc.c
@@ -197,8 +197,8 @@ static struct tegra_emc *emc_ensure_emc_driver(struct tegra_clk_emc *tegra)
 	tegra->emc_node = NULL;
 
 	tegra->emc = platform_get_drvdata(pdev);
+	put_device(&pdev->dev);
 	if (!tegra->emc) {
-		put_device(&pdev->dev);
 		pr_err("%s: cannot find EMC driver\n", __func__);
 		return NULL;
 	}
-- 
2.51.0




