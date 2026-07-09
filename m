Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012064.outbound.protection.outlook.com [40.107.75.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBE543847F;
	Thu,  9 Jul 2026 13:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605594; cv=fail; b=AL1UfnRkKn7d8eSFsEcfWYLOcQnTyd0cenuJxU/iiljhmY+5uAoZ4CAqjyN1wAbcGNdVFdvXDFQGzPwXurP15vv37jnb06+huam8dUUvW26Z3jCuvVto42pqd3mGvGs3CQwI7CTZvqW6yU8kdSnoPz1owjD/xB+cEnS/oMSTpKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605594; c=relaxed/simple;
	bh=3/4xxrNz3c1AZYrhIg1o5cSzv8wljIQzf/z+mJbZ6Ko=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ch0lUiqWT7jln/UYC5PulL4qMfa5O7/mAumIJ1B07hzIOZBBqiO2tj7hQXTHgqjbpos3MVTUivqYX6LFtDhcrEgWh4k9OxQ/3HRz/1p5MAZNQJ+YEOuQAJnzNRwO3cY4Yv3mpwHrPnth/ZX4lObyXgMEpMmI2X8eBkW27ATqgq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=hX3MIDT9; arc=fail smtp.client-ip=40.107.75.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="hX3MIDT9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLMrn92DSyOkADGQPlp7jeoLiNwYYMubqN9W8wu4gXWp/4sAZ1IZKUUyDsSO7BWbgseAdgOpKiKXd++ipxzOEULQfQbc68G8MvUbE7HVQJ42HougBotcyhCvGgYrVlQ5Ys7ePSQUVMz3CJ+aD3tejvfzV7XM1dalMGpCWM7wOakUEDZ3BOm2pKQV+aK0uG5DJeEw8lohtAKjo6UkSZF44e2QfI1/87P+9B9Y3/ayGgWcaYhslcU55BfbdShi7hYf1Hm0Iv97tFqhyr1Ik7l0nKyWGbRYNQBh8l2qpPTDSeeuXxAmReXiAxEygPCftI5+9ML/CV0+3tlBCuC+4ZK3Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4oqAMkdo0NEjFrJJDvKqHpv2koIVyJ+ho8osZTAhkA=;
 b=lp0UjJSeT0Z5kwFITU6jLJov1TbupH7t1uywErPsvS/suOik3AJCznwhmZTpJap0XajGdN3PolsEpZcyXCgdLnDEkefPkkFEGYT4sQ5023SvZ95wb9KO9IZ52wLzAGzZpVWUJZ6XJYq8XW8Bv4up0s8rMAa2TqlekUvi3YJGR1Qr1Y7xfahzScb8Jd+D+FzxIOK/DnZwGiPO+0LkFwiAFOXzvTRG3vBJff+F8TZIAHS5ZBcRgdkzMF26KGCeNNMpt69HuT+U+qGgszomSuLdMA7wT8h+amaTzJ3p/idS8gfd0SNzqKs8arFA3WXmNaDCE5yR4u96zjV0+4tiR8YSTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4oqAMkdo0NEjFrJJDvKqHpv2koIVyJ+ho8osZTAhkA=;
 b=hX3MIDT94ntYZHRFoPaABzb1nFSBmcQBxCz1hH9TY+R3UxCS0bvwC5ozkgVvKUve1FmZTcNRgtLKlFrXsWDX0q5wKSEv2ht7BtNGy2aIBRiT3nf+mGYvCDy3Oesv7MX5nWO1NiQh730jUS/rLfB6jjkVCRZpfJhLfx7LUlffJS3T8GM0731PCSq8m2eco9pl2uNy/uOVKQIURwVTWx6VwwcaJhA4uTML0QEgy72oq3lz1Ff9Xk1U1vbmVExxgJDmOxD9fioRrtPDjoqXiz8KjwLLZ+yOrPNAMF4AetUXlBNiOJ3+8XQKjs4OvtgiEdc+WnBPJK0S0b0obbS8OPmiBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SE2PPF271E4F3E3.apcprd06.prod.outlook.com (2603:1096:108:1::7c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 9 Jul 2026
 13:59:47 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 13:59:47 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 23/26] dmaengine: tegra20-apb-dma: Remove redundant dev_err()/dev_err_probe()
Date: Thu,  9 Jul 2026 21:58:27 +0800
Message-Id: <20260709135846.97972-24-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709135846.97972-1-panchuang@vivo.com>
References: <20260709135846.97972-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0073.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SE2PPF271E4F3E3:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9412f8-a899-4f32-4fb4-08deddc25670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|52116014|38350700014|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	Q3OVNXO0nZxGgkxXQnM0KM8oXZ/s4KOEL/XucNKbrOy4ZciSpFJmE5t3g9ALSkWqosz5EDvhrz+QMWs0eh2+Rfef4wAGP0kHd0IbXydHXvYkkQIrc/28eM88kL0w6dxuGNB/ov6fWGXontUPF33AOsX2xLhuTkI9MEpmb88C1n6xcCZyn3Hesv9PfR1SmVt8yUb6td0eJUsjSkM9pql/CyNASDDaTlDoCHPAaqG5/ekzahXm5ONAIXroqgRXzKOFEEZ1v8CYg2ODS6mmAN1kXZ0Jj/tSl1T0NnTYb+968QBP3hs8aJyi1QUznvnJk76t4+lut0YGZQE/LRzvR2K3jtV57bOu7kyj+20suCqHP3PloF2+zK7bqfFKY+UetJ8gDNcn/xt5hSq6OanupQWUsSmCvvz6JhAsXSVUfFHIQNh5xDYa5hpgE6Gyn8VTCCK3rIrBKjsEwW9N48K9mJFCPpc+qdv20U50qIfviv25JLh7rN/9LskEbs3jhibiPE8V2kK8fSwJwKKHs6yRCk2tKT5lVygAXBM/pM6J41vG2W1y3gSt5h9YQKiWFcoOhv66Krtwcs3D7Q3pF3pUaEYR8/jUQG5SyS9PHnEz4g2GC73u7sTjGHvD7KU+MWJ9qQdfo2kZte31Wq1y/znCqJRqhtDi8wa4jo+/eop0ou1AdI47rofEzAaWzhuXLpfu0aPW046em8pgcxf3zLZ20zcdK5H7y8SJlXAPUxq+o+Iidz0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(52116014)(38350700014)(18002099003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x0uuFJ4jBhVVkugwaAGEQKlYtO8Ki0ox5Yn9iHUAhFZeiJjmqHh0RDcLvTH/?=
 =?us-ascii?Q?sp0qVUOEqR4+I3W5/SPpxLUV5di/zCGtWAMDzV6Vs27zhD3YHVz7duI2Ou3q?=
 =?us-ascii?Q?f+T1c+3H6ZD5nNeQcesxsp+V0u/xNnBVIEQb9KRNzwpjthL7/SBaqfd7a6fd?=
 =?us-ascii?Q?MobThJcIPapT8SWJQZkg59hw1JvY2zdH+r7KLgpaXYaMmDTDLS21TVEjaDe5?=
 =?us-ascii?Q?zRSWWSOCiCH9fPaaOj7s1vvPU3+e8+t2GoOIx7jFj3m9Ecor52/PXQZ47tIY?=
 =?us-ascii?Q?ryrQ2Lw8qgyR/hSTeWIzYKkIPTwM2Qchgm2I7AGvVsVofqoxtv2Kwx0vjfpR?=
 =?us-ascii?Q?yETO1bdaL1kuxFQxpVYYL5xYRErhYXZpVhJMLLCGvgNt0k62hbHMI0WpyqRA?=
 =?us-ascii?Q?V2sq3BN7Hu+ZEvO2BGCr9F1jDMGRE9a/l+1//UZdIk+t4FOLrYVslPgbsEai?=
 =?us-ascii?Q?M1UxdcJ0MiaNOCDkY0gr2aB6wMxxKZ33SCn+oNGnZN+Y8UL1IoYQoPkq2wfa?=
 =?us-ascii?Q?5+IQWtSVROuboSamtuIuTkSVgeAMcEeQr+H18dbLExFvyQjgr6jA7KGHq2Nj?=
 =?us-ascii?Q?b+0GaaJgGFkT+QkiAmbJRWIh4Y8CEWnZf42eNekRC7j12KueZ5dbDFzw6iJa?=
 =?us-ascii?Q?X2RWOgeXVnmDE4j50YE0CLrfhV8y9+ElRL6Ztt06a/5W7LjZp+T/N8PPro6k?=
 =?us-ascii?Q?sHH+4sg4XsU43OZU6Fxj+ptTGMrtV60t1zzZM4682nMa125MnqudFMg6jtUU?=
 =?us-ascii?Q?Lx1fjsn9CCjbvpugd0Z9XN1VWrNEpE96zjmB1GHO5I4YtRVThfTh4lJWT/mx?=
 =?us-ascii?Q?igjNf7EEAi8h+K8eCifdeAspvtP1Hs0KSHRmllPANy01aF7fe5SBDujDO1vL?=
 =?us-ascii?Q?gdQeF+Cmj0AotNNfkYQpqtK1+pFWJ3Csr+DlF+a0x0rODvZV9KCU8Y0rSymV?=
 =?us-ascii?Q?uQMXbmXj9T+IxawwckKFijYpPGBZWmMekV7p3eVXg3pwpkygqQUE3Fbr1B7Y?=
 =?us-ascii?Q?mVaxqeCLZROEz5YdSrgZvc3S0L+64bKjODpjKy06X24S6J3byqSfBg6ELF8p?=
 =?us-ascii?Q?8FN8E0lESFldQ/stUQAOJgL34GW7lCAq3+1ENyHMpEozqA4NxpvFvhpCu3Lj?=
 =?us-ascii?Q?fhl950cpJnIaNEE/OQR6YPjg59IH986VFpLZdpGgxq5ySN/LiEwVYPnJrIfh?=
 =?us-ascii?Q?roiP/IqXKveHYNWgWf6zio7ipcS/dlNEHqPdTgY4EV3dyOWy6hdI7JJTh4JG?=
 =?us-ascii?Q?WWGRL5CRz8jFk4DqTfVbw/qRsmoL6U1mDfwKCcK8jrNdwP1/4WoE2+jYrVrZ?=
 =?us-ascii?Q?msU8f7iF2WyHjU3xNQ5SBZMgxAF0VUgBLEesJ3WaYwskE/XY+jOmVFvF+7fd?=
 =?us-ascii?Q?OTv0rpdjIqhBnYhu3uTpwkafwfVSkSgtx6bXXBM8VIGUfH0ZITUWa1N+EgbJ?=
 =?us-ascii?Q?k8t0pjoQ0jVFRHlL9Lin+ZCazVRJY71BZHLpFpGmL0PM8oPc3/lbpAvz89Gz?=
 =?us-ascii?Q?rSfKMOZGdQryOY188KwPNRqWAPy0Ns4uX+nkfRUGfhoiR6IU+SC4NqrbsUTO?=
 =?us-ascii?Q?Ek9phPHZOi+qV/Ngwv3Xc5UUUTlxga4UwgJahB2HIbDx0WCT0zTcChj4e+Oa?=
 =?us-ascii?Q?VxtvHTYAYHgzqNLP1F3hyVUHo8XIkOa06rxL+VCC2Qu4N2CMAPtlsynM6+y+?=
 =?us-ascii?Q?Fa7goRJVz7P9nCDavU3wedCDaRYk91ECONnblX5v2C3NLAnTFK9hrYZ/F+wb?=
 =?us-ascii?Q?tigqB99Glg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9412f8-a899-4f32-4fb4-08deddc25670
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 13:59:47.8273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GbU3J43QVeWQXG6WyeyR3WM6Iz3DUMj+YJ0LLavBLp+J0SZf00Rp6s8TsUOBEukjnzb5E71EsV+nYx2rMrG6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF271E4F3E3

The devm_request_irq() now automatically logs detailed error messages on
failure. This eliminates the need for driver-specific dev_err() and
dev_err_probe() calls that previously printed generic messages.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/dma/tegra20-apb-dma.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 640b8a218c9a..fcfd2f35c821 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1496,12 +1496,8 @@ static int tegra_dma_probe(struct platform_device *pdev)
 		snprintf(tdc->name, sizeof(tdc->name), "apbdma.%d", i);
 		ret = devm_request_irq(&pdev->dev, irq, tegra_dma_isr, 0,
 				       tdc->name, tdc);
-		if (ret) {
-			dev_err(&pdev->dev,
-				"request_irq failed with err %d channel %d\n",
-				ret, i);
+		if (ret)
 			goto err_pm_disable;
-		}
 
 		tdc->dma_chan.device = &tdma->dma_dev;
 		dma_cookie_init(&tdc->dma_chan);
-- 
2.34.1

