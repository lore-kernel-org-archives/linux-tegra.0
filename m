Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010034.outbound.protection.outlook.com [52.101.85.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E76339B49D;
	Thu, 30 Apr 2026 09:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542753; cv=fail; b=jL3/apkA2UWp8ahbs7rOidVqZI/hJCK+50kc7VtJGPX0K6+ucSadgK3bCsWaoVnT4LW2K7gJSs2jsPp69DkhFyAtsxXH+FJw5EB83YSUbNiZMZFHf4wW6+HAsj7PYdyXZ+wO6BJ1R4+dxEoZH6RkdP+a28cM1GqcZ+8ip19BjIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542753; c=relaxed/simple;
	bh=jnTQdfTFLp2JmWn10ZJ78Ute+eShkAa8ihBDKw7zKv4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eyxPnNAN2/2ifZfK5OE43oYSkYrKaxF2MODGC4+VHh77b9damn5uKZQvt2OQgvor6NuixEdjJVCzV3w9BvkbtGQ2M0SBVpnvz09JGSsR0ot1VekUePOInKwFo8ny32SaRiHTAzAZ/blpbh9YlnN3Yp6rzL7kW52/079J2cJqB28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ksh04nt5; arc=fail smtp.client-ip=52.101.85.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ksh04nt5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slCmzWXI6x0B/oKNhZwHE81obtWmzKp3HBAHGUyk0r4jyN5x7ZzChW3MeNudikdeeYZ56hECn4uh/eWaE2FWUaxVkcMnGxP/9CCKo4J6ddZ4FKX6ZuoJfgxHi+kkF/hpiScRtkqjyfAe++k8sS0Zc5anApBnFolVBaNuFrR/ii+fZnyhvc6olkTxsEuEmCLFFF8TECd6JF4Fyh/khm2IaOQZsQBKKMs34ZEJ8UlD0eHssCkE3eA29Zmv9+zmSk9lIusPPUuyUUgLjfXhHcKGhUDwrooL6Ty/zwp4M/R/NVf/9Gg5DA7Q7YVXXdtZlGXTxKAciQh3A6N+yC2ozdyxGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0oDnElCUWEvCuXVfmocWj+g4HkevS3k9gC8jpU9Txk=;
 b=IqpNDILn5Sn//CUbuS0IYeykRpjmU9E1lf6mgo12ThjsoN+WskNCJyxmhVGiDdPF8dvp7kiYFUMY3q01P9bwKitZWvXv61vGoYqVvntzqhs+kQPYFU0Tvg1iR+wUx6Z6+vfIRywId/WDTLdRbs3dPAB+ITPoqscj++QoaoiDLoFBD4PdYmCmtKs8S7orr2HbBr1+nyHBGuwjlqFML0pd3xB1zJMrzre5SXL9kfWEz4fEvYv2xAlcmfvewtgWUzjiZuzbfgDh6gPr1InxUUpaaCAbn7gpixmZaMimwTycJh6HSk87kUP2ZLC15stOW1Oor/o6ogFiaKem0Vm34ad6uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0oDnElCUWEvCuXVfmocWj+g4HkevS3k9gC8jpU9Txk=;
 b=ksh04nt5bUh/K6Ln6xO8o4mppGewaCTjKRE1Vb+Zf2YvGAmial1x+LcCirFjo8aBhhLXVjmXjsegMjz7Vt5E0A1JRsj5+f3G5I1S+qXs3oanl6hU7gLTZQJ6Fz7wBFzNGapE2TqFT8VoYfUi0FvY54qJzrKNyKeqEaHjji8RkD8M+GwKGEtnWrQDp2lyhv/IeTBPE2P81qZrfch+ZkVM3lHpkllKFYbHYSaYnsDPKN5sA8blAlB3ScOz9hRAd65dXha5e+iHObckYLTKqDgXZGgzliVN8/Jw7H7u/6nvK7dkP4IEgF4Bu2wNoMi9YeZZmbON4GNV14RTFiWgtMQ1sw==
Received: from SA1P222CA0150.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::20)
 by MW4PR12MB7286.namprd12.prod.outlook.com (2603:10b6:303:22f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 09:52:27 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:3c2:cafe::8f) by SA1P222CA0150.outlook.office365.com
 (2603:10b6:806:3c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 09:52:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 09:52:26 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 02:52:16 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 02:52:15 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 30 Apr 2026 02:52:15 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <ketanp@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH V3 1/3] memory: tegra: Make ->resume() callback return void
Date: Thu, 30 Apr 2026 09:52:00 +0000
Message-ID: <20260430095202.1167651-2-amhetre@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|MW4PR12MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: faf42476-c216-4657-0d12-08dea69e2fd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wfYa9oFtpd/wWTH7FUXw4LVqWy2pHjS5JNgwXiikvtScnAqanGTqnNr/f1rvbnWGPv/bq7UYRbz9kEZUmVWNcvODkwbeP28sPp6awXdZ2syJ/XlYRwJ2gy1hFzs0qFpVX+6W1B+GlCa+1nlibmIiLplck1Q0OLlVyi03PoDwyzbevruRAN4fIZhjihNtr9rL65cWJBuCNNBGuGffhmUK1ICw//Vy6R2AKjEjAe4ttkIXL7RbDwWDtQ6QZYYOkgkzaJ6dXOXWO2YBnFfUP2H11GMR8fRqtHyPTnoSDuraB6cfsvjT2qc91mH5jK8U9hfudWCe2sZOMY65u4Q8SfdHvWHFqhCD2T+eeJq9H11ge85Wy87XQdDq2GdvnaKLjqP5eLEIxQ7eTNXr3OxIcXlIHfS7tgrxXTK3w7GFm+POS6aRyH0dWvCtVLnUreKfQeSOcvzOrfhMw8fheLnONjhnkeSq75mVFFmCjUpH4yqs417QbLwcvsjZsGU6OG0XG7vfnYwzMsmfo1z3Nuzdsi0WP8dT1e3qWS/E/isEX9mERvRodGlPGQ7HaKD5/bHRKiP1+PPPAc7No/+IFyajuUmrthAYhDIfKfuQjfUvmPUuL+T3f7zrcvpk1TxN416ju77Z5HEbIVREV4DzdOpovtZlnczfPTy3dOowKIa6/D8pOoPVpRDobnyDVtmq/qEzwYmJQJMfezHV32HhS5+RTVtJHk2aiU3HuRmajHL5uxg7GAJKTLYwo6KjQ6ljAYyYjNf1EF3gdZfOt7kBLMicao4SBQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vUmXbW7VRb2o+6lRabPaJpDL0fzD6tic/mJSqfMnTAsyEQ/e3eq1kYkqQ85yjU5qxowbnbLtJgSeX609ggkZbIBeSUPklF2KZQ3iRd+bpoiZa5KcUrgIoSTktgjWY77YGror6f5D9g+O0csEHVVq5FbTlkLdQaHHhQC30KIAy6bb4fiJCfCc7WgB3op9SSNByGj66YjXl5bYqzjNj9NQ3l/100hzWYZJ1l6RB9flmUsarDC9WWiK1YMUgIcDp0qkupsgU8/k7mEw3l3bjuOf4bYDGJQgPIcwnDSWRda9wTf8VxP+pYLhhbqOxgFtTu0e3Nh4s411WsmKNS7ja4mj76nO3lE3FkAu3V8erhEy56WQXycccMgULLjn4ij7LPcZ0xGYVKCVU05B8Jxv20BP0ULJdogF8P9tZK+oFPGrjDzFOpR9xuPMgKcvec0pNYYm
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 09:52:26.9895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faf42476-c216-4657-0d12-08dea69e2fd7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7286

tegra186_mc_resume() is the only implementation of the SoC ->resume()
op in struct tegra_mc_ops, and it can never fail as the SID override
loop has no error path. The int return value is therefore not used.

Change the prototype to return void so callers do not need to deal
with a value that is always 0. If a future SoC needs to report
failure from resume, an int return type can be reintroduced then.

Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 drivers/memory/tegra/tegra186.c | 4 +---
 include/soc/tegra/mc.h          | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 91d56165605f..579d058da220 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -154,7 +154,7 @@ static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
 	return 0;
 }
 
-static int tegra186_mc_resume(struct tegra_mc *mc)
+static void tegra186_mc_resume(struct tegra_mc *mc)
 {
 #if IS_ENABLED(CONFIG_IOMMU_API)
 	unsigned int i;
@@ -165,8 +165,6 @@ static int tegra186_mc_resume(struct tegra_mc *mc)
 		tegra186_mc_client_sid_override(mc, client, client->sid);
 	}
 #endif
-
-	return 0;
 }
 
 const struct tegra_mc_ops tegra186_mc_ops = {
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index e6da035d1306..25d465d70493 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -164,7 +164,7 @@ struct tegra_mc_ops {
 	 */
 	int (*probe)(struct tegra_mc *mc);
 	void (*remove)(struct tegra_mc *mc);
-	int (*resume)(struct tegra_mc *mc);
+	void (*resume)(struct tegra_mc *mc);
 	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
 };
 
-- 
2.50.1

