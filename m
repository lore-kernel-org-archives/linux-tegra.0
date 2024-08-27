Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B09F139580;
	Tue, 27 Aug 2024 11:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758697; cv=none; b=GSdZoZ741Mw6xLs8v3vN/Il/e8kLZ1C+4Z0sOIh+oXJMk0ywwF01lXcrarDZuiRUdm9mylnnvA4XQNghaRd6UzDCS71cq264MGumaYv/1xzebkkhDjVWxVEQ7ZzZbGQta/pulRBxvkLqO4VKEAPQcXf1AAla2NtQ+a9W5vyaaNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758697; c=relaxed/simple;
	bh=9FiT4KOjeSpsuGdIY54eLGMfP1nfFbHTEbzlmvp5RXs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WfHDyPWRcxKbQinIzOG9sqG4z8MwiXeP3Qu+wyUuZVnqBY8l+nltaSZEt9SnDUJMCrEM1Mpuu2o+e5cwivERetcaCD9VZnzSLYAGYTkLgloslcUvsMeujC+qrXh6Dcrpy+LAyYiWtLvOy+yMmuuayaZiOF6R+zxwzBN8l1vDFHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WtQWS6HGQzyQYJ;
	Tue, 27 Aug 2024 19:37:24 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 0FFB6140137;
	Tue, 27 Aug 2024 19:38:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 19:38:11 +0800
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
Subject: [PATCH -next 0/8] soc: Simplify with scoped for each OF child loop and dev_err_probe()
Date: Tue, 27 Aug 2024 19:45:59 +0800
Message-ID: <20240827114607.4019972-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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

Use for_each_child_of_node_scoped() to simplify code.

Jinjie Ruan (8):
  soc: fsl: cpm1: Simplify with scoped for each OF child loop
  soc: fsl: cpm1: Simplify with dev_err_probe()
  soc: fsl: cpm1: qmc: Simplify with scoped for each OF child
  soc: fsl: cpm1: qmc: Simplify with dev_err_probe()
  soc/tegra: pmc: Simplify with scoped for each OF child loop
  soc: dove: Simplify with scoped for each OF child loop
  soc: ti: knav_dma: Simplify with scoped for each OF child loop
  soc: ti: knav_qmss_queue: Simplify with scoped for each OF child loop

 drivers/soc/dove/pmu.c           |  9 ++--
 drivers/soc/fsl/qe/qmc.c         | 66 ++++++++---------------
 drivers/soc/fsl/qe/tsa.c         | 90 ++++++++++----------------------
 drivers/soc/tegra/pmc.c          | 12 ++---
 drivers/soc/ti/knav_dma.c        | 16 ++----
 drivers/soc/ti/knav_qmss_queue.c | 57 +++++++-------------
 6 files changed, 80 insertions(+), 170 deletions(-)

-- 
2.34.1

