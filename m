Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C19238171;
	Sun,  1 Mar 2026 01:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328195; cv=none; b=GplMhnW05kER6qXjqatx4Ma/p5gbHnKEf+jgDVH+9FLwBqqfjfLlfH7hOJsmTxE+8nLUBhqWVaI1kuxRHG6ILTbMwuyv5J1HaVNdiygn8HYz5pXKWHYb1hlQ803SdJX3YG1DsCY220MgoL0kLUxF8Kv6csrtkArCA51JxWFU1fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328195; c=relaxed/simple;
	bh=JvPsAWRl7A5TNresg7NgehnF90HT3KeZx5T6cofBRCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PJiidR1ql3huiPd4JmnOFmF5JfM2M9ZIfIN3cynHkqSD2mZmuVtEFEPXEyy00EuccsQTmJCBHmB8fnPNV2LamwH/ULiWPfpM0+59pzW+jwFqq6PaEr7uw5dP0EO7QWcpRu4aO9Zk6oYnF3FrOXs9iTdcfApA5Fe+CMJGk819hOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d69ngT9d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d69ngT9d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F094AC19424;
	Sun,  1 Mar 2026 01:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328194;
	bh=JvPsAWRl7A5TNresg7NgehnF90HT3KeZx5T6cofBRCg=;
	h=From:To:Cc:Subject:Date:From;
	b=d69ngT9dQThn9lmqWR9wgLshUSTLRE1PUrx6hWxoT2rO3M7JC/yud1lj4wWsAPA9k
	 5fo4E3JYP/4AW7qg2s3Rr+eKfVksyI3rpRAesa3y9oEJLlZzHRFa52CTraPJku2+HD
	 BhfyZgnj0i3pT+XKuagAMpTlwfYoidCWY5Su6mgLAhsf25MOumPlDst3Hy97Pn5g50
	 RHMLX5dx5tcAu1FL8bpQfpm0tm1IEwWW91DWrLu5m3ahA37/AmLZoDUOF/ZDJK9WzU
	 isLPfGTS+P6Q3+yrJ5ZLTYuk4kYWQm8mJZUPWenbvZyflR5A8UmB+TcwoFF5U6ZWmE
	 grVuHzCqujZFw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	johan@kernel.org
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: FAILED: Patch "clk: tegra: tegra124-emc: fix device leak on set_rate()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:23:12 -0500
Message-ID: <20260301012312.1679886-1-sashal@kernel.org>
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




