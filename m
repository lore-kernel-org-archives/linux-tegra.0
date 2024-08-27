Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E23D1A08BB;
	Tue, 27 Aug 2024 11:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758700; cv=none; b=V8eRFhPWMRvS64d/cIzAdvrDJxLRRAW6vmr4VUgcv+xbdhfAiUVy7rdLl4NJEY33o8/4uQl0hGX5LfBTA06UXeJjiq3g63O+xDu3X7gqgJsc7Cb2jiDD3vekywBN8qEoDSuwVh9cWXzldUNVFTZt0kkrkbWlv4DmcQ6Au78ZCNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758700; c=relaxed/simple;
	bh=AzNUIafzH+8sYR1mWnVz5793pPJ3NWiNtwEnj9Iyclo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iwzXSKROzisyucInWGaZftp91jEEni6yO0KqUg+v3C+BazHN8rEUk5t/eQCukNdJQY/yLZUt79meUWxWAOMgTVbz8RYA8yfpir/JzW1UxRPctyfAhT6teTG0OmNJrFs8kkFW/J1GcA0fMK6jsSj8S3m33cQOG2LrmJAK2pMin3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WtQQv39T5zQqgc;
	Tue, 27 Aug 2024 19:33:27 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 26A9B18010B;
	Tue, 27 Aug 2024 19:38:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 19:38:15 +0800
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
Subject: [PATCH -next 6/8] soc: dove: Simplify with scoped for each OF child loop
Date: Tue, 27 Aug 2024 19:46:05 +0800
Message-ID: <20240827114607.4019972-7-ruanjinjie@huawei.com>
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
 drivers/soc/dove/pmu.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/dove/pmu.c b/drivers/soc/dove/pmu.c
index 6202dbcd20a8..75f5fc3cb2c6 100644
--- a/drivers/soc/dove/pmu.c
+++ b/drivers/soc/dove/pmu.c
@@ -372,7 +372,7 @@ int __init dove_init_pmu_legacy(const struct dove_pmu_initdata *initdata)
  */
 int __init dove_init_pmu(void)
 {
-	struct device_node *np_pmu, *domains_node, *np;
+	struct device_node *np_pmu, *domains_node;
 	struct pmu_data *pmu;
 	int ret, parent_irq;
 
@@ -405,21 +405,18 @@ int __init dove_init_pmu(void)
 
 	pmu_reset_init(pmu);
 
-	for_each_available_child_of_node(domains_node, np) {
+	for_each_available_child_of_node_scoped(domains_node, np) {
 		struct of_phandle_args args;
 		struct pmu_domain *domain;
 
 		domain = kzalloc(sizeof(*domain), GFP_KERNEL);
-		if (!domain) {
-			of_node_put(np);
+		if (!domain)
 			break;
-		}
 
 		domain->pmu = pmu;
 		domain->base.name = kasprintf(GFP_KERNEL, "%pOFn", np);
 		if (!domain->base.name) {
 			kfree(domain);
-			of_node_put(np);
 			break;
 		}
 
-- 
2.34.1

