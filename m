Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F4F1A0710;
	Tue, 27 Aug 2024 11:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758699; cv=none; b=Bghqw9dX11JPeC8IapD+S324Ysk1aMujPADU5oWDf5LpQLb3yY2J8pIqx8oezmAyWH6LKCZl8zt9+YUwJ5JL1D0JtabKfnP5GiDJeuOY83HQOE/1qgNwbD3XprwJG0/1941RLg8XfpbVbjmBN2tYWQ3FzioIi8w9o3xuSSoJ2rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758699; c=relaxed/simple;
	bh=51D4MVbrbie62zBZ4PBe0caLTe04rtIHKvrD3K2vD1g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bA170kwW48IYrbJITVndLhFJP23DpI+0gqaqdiD6916015cx+tV6VLJwUncxNe/YihjWOgqjQVvuLsaySISb49ZTP/8PxNP5MfovzidHxkwl4f+a4n5dbVSUw68khdUO1wX7X3Fk2bLKWYGgxRLEIpsHqOqQQgL1adEeWzIZ8wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WtQWX139WzyQZW;
	Tue, 27 Aug 2024 19:37:28 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 51D4B1402DE;
	Tue, 27 Aug 2024 19:38:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 19:38:14 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <andrew@lunn.ch>, <sebastian.hesselbarth@gmail.com>,
	<gregory.clement@bootlin.com>, <herve.codina@bootlin.com>,
	<qiang.zhao@nxp.com>, <christophe.leroy@csgroup.eu>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <nm@ti.com>,
	<ssantosh@kernel.org>, <petlozup@nvidia.com>, <pshete@nvidia.com>,
	<ruanjinjie@huawei.com>, <christophe.jaillet@wanadoo.fr>,
	<ulf.hansson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-tegra@vger.kernel.org>, <krzk@kernel.org>, <jic23@kernel.org>
Subject: [PATCH -next 5/8] soc/tegra: pmc: Simplify with scoped for each OF child loop
Date: Tue, 27 Aug 2024 19:46:04 +0800
Message-ID: <20240827114607.4019972-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827114607.4019972-1-ruanjinjie@huawei.com>
References: <20240827114607.4019972-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/soc/tegra/pmc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 6c37d6eb8b49..a08c377933c5 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1438,7 +1438,7 @@ static int tegra_powergate_init(struct tegra_pmc *pmc,
 				struct device_node *parent)
 {
 	struct of_phandle_args child_args, parent_args;
-	struct device_node *np, *child;
+	struct device_node *np;
 	int err = 0;
 
 	/*
@@ -1457,12 +1457,10 @@ static int tegra_powergate_init(struct tegra_pmc *pmc,
 	if (!np)
 		return 0;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		err = tegra_powergate_add(pmc, child);
-		if (err < 0) {
-			of_node_put(child);
+		if (err < 0)
 			break;
-		}
 
 		if (of_parse_phandle_with_args(child, "power-domains",
 					       "#power-domain-cells",
@@ -1474,10 +1472,8 @@ static int tegra_powergate_init(struct tegra_pmc *pmc,
 
 		err = of_genpd_add_subdomain(&parent_args, &child_args);
 		of_node_put(parent_args.np);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			break;
-		}
 	}
 
 	of_node_put(np);
-- 
2.34.1

