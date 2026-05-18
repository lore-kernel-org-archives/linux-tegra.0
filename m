Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010052.outbound.protection.outlook.com [40.93.198.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D7737649E;
	Mon, 18 May 2026 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104467; cv=fail; b=eo/1AmIWfHFNnxTLfdbzcM5vZXSlAu0sga7n31o5MuC0lxzgfH1RjNSQECSub3heK1ZDKhLJKoDfyjlz6irnVKykJviUWS3RQkjYjs6tup1ZTyMeKuU0RmDdYB3EfZFv5V6v4e13LS1g+chyGN9wZVM0BppHKRdU0yHhmCZIFng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104467; c=relaxed/simple;
	bh=v8wBT4ny7BC3IV8zZMgz9eg1JrV7Dg5+Ba8U2Nx7C2w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hSBj/PslK5qKHWM06D8ELZKWz7t1w9JNKI4VsHEpDCz6Ui77eNIhixn4b6S8mtd1wuVPDxkpnZxcNjADA2PCN+IoFopJ1fwXskzYQw5NnmungCfWCQ12VBonXGTh/sbrqQVIGPgaAIn91WCvWLk3UAO0aYujjdYhB3z16v96TwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FFPpU8SM; arc=fail smtp.client-ip=40.93.198.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FFPpU8SM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/nRR4E7GL0FBuMkEIfTMJELqw+WbU4UVeG4t9eAlXs70XQIq2kzEZ1Wc7BqotIYbyh6OVZaLIxgu/Ud0KfAf5jCDahQnVMEjYHEP6AeoNJjUag41xMEsIVoX0eaHA0OZa+kx8A4a755hdqT4J0cSHPVwhcVVlAkMoVL4J2IIt17ioLgd8coNjGQ+Ot6zvXw6FpFmA6AwMSymZ8K0KRmDnVYNohwwTGu390Hp2Wq9BpFlH5ImDi28CW249NH0wlu6u7PHf+5sj6satVHBxky0mFW94pDvXR7t0msi1YjJL0w/7IC2bBG4xnA4bH3mTAYwEDxvkhrx/SFWQC4wjrOeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2SRCVCu1TGmJEoclyV6rk8C5YaiooeSnVcai4ufYtw=;
 b=meUV/wAPNxy2ZdsRVvgklWn/CUUS31y1zjrLf+O57M1Bbd++R/H0Om/swWV2Tok7JHC4fl8WEPq7dri7K+dsxvj4p/JR950kNNZjwTQNY34/ygH0tfD2K2gWx6a4qjiUsIFLkjQBXOln7CfexDZ7bSgJzhON2Np8AOWfZ2Oaxf4Xp8vsbzUdXtCiFZtXLWEPkWEIn6+1wBGCt2QE9ZJ0QUj2IVh3KftfFuCk94w6kpfPZP1CixKaP6jvdsWb3BusiouYHp1zm/IpLJMGnoiKbz9YZlac6EtUB5WxKjIWG8JB97AEj9I9OK0GlabaS6Q+GJwZ+EQQWuEhrEV8QHszrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2SRCVCu1TGmJEoclyV6rk8C5YaiooeSnVcai4ufYtw=;
 b=FFPpU8SMV/d8Ln1mJgoDAOdfpwbXGVFSdv6RX1R7pz0WjGDxtOB1V/vFK80YWoqoegOWpu5ykP1BNh0salRB3qNDwONKPk0SO1NtjYEL0bapL/72Vr2Op33v2M74HMa37r4r4N2xH0JvEgt+FMLDi9iLfS3EobH/lfDbMqEXBYmgKIkOTkh6w6rj/y2YYgqFMpiz107OxL/c9Hw3rEGthw1nCNu7dM4HLKMj64/rC329Brna0uDGG0FMj4aIU0KniAoR9KOgjJRO99xrCXxGsoZiZCKDqr1jxKgrnnKnTzUnn8XkHQbqRaiKWt8z2rvFXqHuQKIPHLcG+BM5J4uoGA==
Received: from SA9PR13CA0128.namprd13.prod.outlook.com (2603:10b6:806:27::13)
 by CY3PR12MB9555.namprd12.prod.outlook.com (2603:10b6:930:10a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 11:40:53 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:806:27:cafe::7f) by SA9PR13CA0128.outlook.office365.com
 (2603:10b6:806:27::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.13 via Frontend Transport; Mon, 18
 May 2026 11:40:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 11:40:53 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 04:40:39 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 18 May 2026 04:40:38 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 04:40:35 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko
	<digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Kartik
 Rajput" <kkartik@nvidia.com>, Wolfram Sang <wsa@kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2 3/4] i2c: tegra: Update Tegra410 I2C timing parameters
Date: Mon, 18 May 2026 17:10:12 +0530
Message-ID: <20260518114013.62065-4-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260518114013.62065-1-akhilrajeev@nvidia.com>
References: <20260518114013.62065-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|CY3PR12MB9555:EE_
X-MS-Office365-Filtering-Correlation-Id: ac97a691-fb21-4a69-6c03-08deb4d2516e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|921020|22082099003|18002099003|56012099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	GwYY9+W0lwYIsgjtexNakRhJG5ZXcxxKWfIdDWgwGvufokH+LldAGQwX6CKzYCvy2fvkTcde9vdzL4gaVxg+PKy9gCQhKsfzn+Pu0u6iJkM0C+i9iwq7kd4kxOZJbGV2oqhzaknknTdYlwl8P4Cdt9ns/NQjecG+rCSJRIuHdfB/uIlHBtixCUL41FAr2m4BrHcJL3k3rCIotYzc0PFWHfxXR1NB/HXoIuLgQ70xuGalSM1SX36vbqrnGF5dFRzXdL1HxSzqNRMeINNAqJQQElyU8a3lYA6YEpVD6GyOi3Ir0XK0A9jWEmpYm0sJNbegT9kN8byB6kVSfej4sBXP812YkAIz23loxH/gOt9be67OrC5DmyJ5bF2fPZrbigJJat3w3HbdslBdBdGBTZnB4W7OiMOXiS692B6RNCM6FN/OmeG6N7cjBji7RIktgdO8aDgEARnmlT9ghGoXH29gXf5IPMgl4WbZY6LcKfuVPWNnt/lLhaZrNBofdwXCnFv1L9OKiAXO1ngUTB6b66lTwAG2ZL0NXrKtgSAbOZWPBzsTirXeK3MZg7+4Vz3bNXLuyWp6E4UgJCtaZRKS5R+YUoImdwzaZut5MQQ3w9/bTp3ymwy7zY3QN0dF7hYqlQ4/9gI/GYi5dMXzy4XHGugRFbf9IyWapRjtAAiLvGVz/pNIaANk5hJwN65WePv8Q/aYs2cgSvNNQWFGt1dp5YYuDspDKfOJBGkQtFxhXaxg0M7y/MgKIztVSh3/mW4TqgcLbiyuNL8lFsB//+VaPv1N5Q==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(921020)(22082099003)(18002099003)(56012099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r4oxjw43fjtyD7JQzvNN5bNyPE82pyWOQKHWZPgVpdENb8ZuTPvhsfCH30cfZuaC30rOeALR9MHzOg42Qkq0K5eiAmMP8RwYC9VK96xPg3HmUgdGNtPv4PSY0ENc/ZALn64nOKfvTGNEpLUfEcwCD0rl1ZAiO/P3yY+MBhOXbltTPlt+Z3bPp7T1mu9Zqrn8zPcYebymrOX4tD4SY1dBai8dJNZsad6n/Eyiz2j5khiYNKjH49PGPQvSeWeGLeg8umZ9WEO4H4En2ZrxeZ0YwPt8XlL0R8AOrT2JgJwQj11U9wvxgUXpxjvqCRaj2vuAf1PSu0jyDZMi+1gCXD3mfKKLas/r2qJGERmXef1tbNqmEhcpeX0c2AS0IQ4wKauCaEPAabJNVy0gR/mj+ATxhGfm354OGbPY1MHA2k+S+J4fzgZF8v+kEhjx9Z6LbDIG
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:40:53.4257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac97a691-fb21-4a69-6c03-08deb4d2516e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9555

Update Tegra410 I2C timing parameters based on hardware characterization
results. This adjusts the fast mode and HS mode settings to be compliant
with the I2C specification.

Fixes: 59717f260183 ("i2c: tegra: Add support for Tegra410")
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index f96a118249b3..93677bd2d3b1 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -2138,9 +2138,9 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 static const struct tegra_i2c_hw_feature tegra410_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
-	.clk_divisor_hs_mode = 1,
+	.clk_divisor_hs_mode = 2,
 	.clk_divisor_std_mode = 0x3f,
-	.clk_divisor_fast_mode = 0x2c,
+	.clk_divisor_fast_mode = 0x2f,
 	.clk_divisor_fast_plus_mode = 0x11,
 	.has_config_load_reg = true,
 	.has_multi_master_mode = true,
@@ -2156,8 +2156,8 @@ static const struct tegra_i2c_hw_feature tegra410_i2c_hw = {
 	.thigh_fast_mode = 0x2,
 	.tlow_fastplus_mode = 0x2,
 	.thigh_fastplus_mode = 0x2,
-	.tlow_hs_mode = 0x8,
-	.thigh_hs_mode = 0x6,
+	.tlow_hs_mode = 0x5,
+	.thigh_hs_mode = 0x2,
 	.setup_hold_time_std_mode = 0x08080808,
 	.setup_hold_time_fast_mode = 0x02020202,
 	.setup_hold_time_fastplus_mode = 0x02020202,
-- 
2.50.1

