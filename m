Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012021.outbound.protection.outlook.com [52.101.48.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1F83AA1BB;
	Thu, 30 Apr 2026 09:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542764; cv=fail; b=EXnNj+7jLNTEt+IBs5Ln8CivnW4W9DxYVoWz9nksgOzGkmY+J3Xw8l29U92gCEhX2F/RMos0s/cPhepUXdzCTCk/i6VzjURg5LNkR4lTSB//MWM+Gk663VBVo5wui0UESOxN7gJthqV7AqEbvljmj8lUZ8VJJ6Fk1FOWKqAHP0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542764; c=relaxed/simple;
	bh=gy1a9eQll6/T6BHX6Mv9v5OYzWZYb6L9oO2q9SFUxHU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=APleVNTbLnAPfuSGYI2ARTT7xM8LkMbMNzYfrtJOTFuvuwp6OkTarfTsZIVB4TIumyghge17nomgYvuup7ICALHGoYpyFk6HrFhA+tpSCTBh83EnWTDgiKGeYdnzk2MQdVNT9Qok9MwjODIzLq0c6EbElU/ZgLU9XBlpSZsvVc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jJPLrKi/; arc=fail smtp.client-ip=52.101.48.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jJPLrKi/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhiQXjIq2BsGny7A9OzPxcqeIFJMxi1LnOolrjeNb1BmSB5Ukle8aeej6w/5OWVU3PgbLrfcOYu3QufCSPBRQbkULi/rrpTs8TRSYKeFocj9p6jMBkHUewTS+OS7jW52PCo2vo8fH4gY7trpBv6DHlKl54V29ND7yIsCPywxzYvWePokKcOnPw6FnSQT7OpoC1d4BucHzdbisUY4+b4IxFs3BWcDN1Trt4tqhZ9k9wcVu/oiV001AXEvLf7Lypnvdc2165d0i3/ckMhsDIpOKVedd2DM0uso0lF4JqPhuwfQe1yMm4ojX+TVETrWNuWOwv+llwMkdG/kNpJDl++6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SX1uK2u/biXtXjzl77wrhn1R/t2jzzHTZxyMJQF/5M0=;
 b=n6/uCgKJPLrlwppYQt5oIGcXKX0iCzlnt8Ehr9qhoY54gx8sKU5sZFlmWnhY1+43oHzCJwlc4xZJv1+Bu2WXHKM+VdXnBTyHpW4J2uUOFF8K0NOkY5cW64LUPm8diE0WBvQ7bIXF0xBNt5JXITv7z6olIcniMlVHzjSqrD5I3JGCaK6YlKfxMkWMl+CZzBIblOwTUfilEAG3FNAvCWpFtbAhV272yNrkBPhZZAAzsEVFjrx+nQTETnzZU5ZLqok+o7bCVvKMzPJxxa4jpG/NxfFUAdvyoG3zGjuyEwvb4om8nZ8tjrV0xWiQbZI4NhMpoPd4Fm3YR8NkohLRmtc3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SX1uK2u/biXtXjzl77wrhn1R/t2jzzHTZxyMJQF/5M0=;
 b=jJPLrKi/43ktoWRN42KqGMTcBM+wDlE4XJaRnuwPiP6S3A80GowJhE3jGupCKNum05S9a5hZ4PWAgZjKPJpCQ9tWZvZEfdUehPfHyRArKYqoVNmjtgyzFDjuKT3za2kyI8Uyi2GZd6MuCtJjlXbSOyinuLG98HZOeR75QERQvd5iT/FT+cQ8NlsEu43s7VvYZjOLyQXVYn5j6AU7iN+O+4D+VOSuPQhspZLcNLfFikNhb0kn2Z9PrNN53mrWQYsgmURYngLzT8+C3+3L2dW8tBRT1E6G/PC00r4YPWvM6MyvXUX8o4PruluHHgHp0Tm6Iiw+BgoBF/vP5jVsC3GQUA==
Received: from CH2PR07CA0065.namprd07.prod.outlook.com (2603:10b6:610:5b::39)
 by DS4PR12MB9633.namprd12.prod.outlook.com (2603:10b6:8:27f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.12; Thu, 30 Apr
 2026 09:52:39 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::47) by CH2PR07CA0065.outlook.office365.com
 (2603:10b6:610:5b::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Thu,
 30 Apr 2026 09:52:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 09:52:38 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 02:52:22 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 02:52:22 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 30 Apr 2026 02:52:21 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <ketanp@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH V3 3/3] memory: tegra: Restore MC interrupt masks on resume
Date: Thu, 30 Apr 2026 09:52:02 +0000
Message-ID: <20260430095202.1167651-4-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260430095202.1167651-1-amhetre@nvidia.com>
References: <20260430095202.1167651-1-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|DS4PR12MB9633:EE_
X-MS-Office365-Filtering-Correlation-Id: e648401a-e776-40e6-5a69-08dea69e3708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	QtC/h2QI6JS/ryUNDOiBXMQcQFMzzqY9PiP4irXtyP4eQ8gP0MMNvONxhYTNyaG8OqLKZ+IYRZ/l5pZRHhQW1IzoMR1TovixBH3pcegfPAFSDpNvAli+DpAWjJ1dLucqV44VfwL10zcssBENIpqtCUJuQLha/gYKkyuP0o0nEkkJkp0YChBmVs4eoeAmCV7PrTljU/ZldS3GtJml6zxyyqgDg8KXP68Tt3eOhdwnfzXyXCpv+ZlngY5ZhXJThJ7X5/EyoVlU0iaL01booRwa2AmYwHSSzjrM8b0par2wqxEo4xgLnQzfs8B0USX/MeQb/fF1G7+YUeR9maAkdZVkRm1Y2dZu2iMQeTEICfwTBW2aCakPkBB4b9uoLBqjYvldoaK23W2JqZCToRaaYeeaN7fpNUuxqaaiWkrjeLMytTgBQ/bgQOvaG11kNqHrEq4seg/Oc4FEfp1RyPNAtR72j8tNLKYXt/ZYEmsacWkmrUcEDCOpiA4IyWrXxQO+VXG/Wlsd3pmb/w9XPBqHdvulKdR1d+1LXjVITLSjQOEkAr5H3b2c85cXzBMCqwwSHam+fKH9FFXaND38VbZVu2kiVFC7Q8Ftmxun05VJgz2TLJaQYcRdRDKQPIV+6J5rQQCtCgdqcmQyNtLCKKqpgZxpGrtJT8ZxowEMb0pzrKxt4AYFhXhdroCLRZaWQDFOH3qR/+N+VRjxRr/qrwTYhh8ds6BVwinvIevY9BJAynrMGdTHPdXLCvFLWVi8OXwtkTq25g6l3EKttNOAnt52ysXFhQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kHjF+cKDC2qhjTuK3lGqvnrqfqZUfRDWMeCZLvPbxTrLvPRvbRWMTWoo1QXq5DVBLhx7tgpXwgGVjQ+sP/7TDCqXqBVWMWcPXYiV1nYE/1aJPrPQQEIz77V2jLYmBy97Yi3+TZYIEOE8RfBz9LE02al7zgy8mF6LUB3o+pudTEdr4O6QVWEg0vpFscp3sw+4qy0j2l59dd91BIljEHMvFBS/IXDWkDVfmJxGnHgtUWNb+MwHxjlqa9XI2+JQuw1Tha/OmlGlKMu46iync2DWq3K7qjlUbZTkU4QjNpq6nS5Q3mUVuCpQ+DStntMKpHW3TNkrF1KwPRnO7skeKOmZBjXKxVZ+H9GOm+qZdX0iRY/9AB4T4u103OIXyflR8ESdSn2TtJlCMxBQGQ0YJvJpiS7zmuqtdawbSfrnKflJpZTnn6Yh4EyWIJzpYe2VAUCD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 09:52:38.9980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e648401a-e776-40e6-5a69-08dea69e3708
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9633

The MC interrupt mask registers lose their state across SC7. Without
re-applying them on resume, MC interrupts that were enabled at probe
remain masked after wake, so any post-resume MC error goes unreported.

Factor the existing intmask programming out of tegra_mc_probe() into
tegra_mc_setup_intmask() and reuse it from the system resume callback
so the mask state is restored on wake.

Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 drivers/memory/tegra/mc.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 64e41338cdf2..cfcfc7291106 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -911,6 +911,19 @@ static void tegra_mc_num_channel_enabled(struct tegra_mc *mc)
 	}
 }
 
+static void tegra_mc_setup_intmask(struct tegra_mc *mc)
+{
+	unsigned int i;
+
+	for (i = 0; i < mc->soc->num_intmasks; i++) {
+		if (mc->soc->num_channels)
+			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmasks[i].mask,
+				     mc->soc->intmasks[i].reg);
+		else
+			mc_writel(mc, mc->soc->intmasks[i].mask, mc->soc->intmasks[i].reg);
+	}
+}
+
 static int tegra_mc_probe(struct platform_device *pdev)
 {
 	struct tegra_mc *mc;
@@ -971,13 +984,7 @@ static int tegra_mc_probe(struct platform_device *pdev)
 			}
 		}
 
-		for (i = 0; i < mc->soc->num_intmasks; i++) {
-			if (mc->soc->num_channels)
-				mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmasks[i].mask,
-					     mc->soc->intmasks[i].reg);
-			else
-				mc_writel(mc, mc->soc->intmasks[i].mask, mc->soc->intmasks[i].reg);
-		}
+		tegra_mc_setup_intmask(mc);
 	}
 
 	if (mc->soc->reset_ops) {
@@ -1018,6 +1025,8 @@ static int tegra_mc_resume(struct device *dev)
 	if (mc->soc->ops && mc->soc->ops->resume)
 		mc->soc->ops->resume(mc);
 
+	tegra_mc_setup_intmask(mc);
+
 	return 0;
 }
 
-- 
2.50.1

