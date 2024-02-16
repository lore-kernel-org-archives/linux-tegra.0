Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65F481AD9
	for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708086682; cv=fail; b=nIJVU6khI1MZJMjvnQtfpsKYvv2HA6RAX2GZkAoZK1AmKiNoB6kg7K78PuNIjF5iKN1+fkHBjgS66f0pFWToZarcCfE7x7L54LfWcWi3UoydaqhskI0rKDfZTfsqBKmo2OZOpZ18EeWtZLf7ekedDEglt1OdN/gLo4aUVKyBn4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708086682; c=relaxed/simple;
	bh=VlGH5PDDv4ykTyM+jYTKFsuudHlkHG2IvO2XeOY/Utw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H6wVaw9xCUZKAlHEvNgo8AMT+AQPouan2MO3owyhlfYaPK9q7l5YFR4WYD9w4pOc2CnORPXQf+5FAXkeURZRg1svKVxMywqFBuh/6KOUDUDZEztMHcoKz0MicvaG4toMod/iN5M3jWlLwgrD5yR4iQXgQXrFkk8Fa1Xw2MRLVVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bJbVKhie; arc=fail smtp.client-ip=40.107.92.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bJbVKhie"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMB8kn5PjfgG/PUHDgufPUk2ppHc//S9ht3nUTfKbple6ntllmk2t0ylanz5Yy1jGzTK5qWXIwX/8JPz61Mbky2IeEbCr7hFaaZyIyvlTMFZzM2lGvb/uei0hm5P1lcbhDfw+doHHNB6Wyw2dhfV2PrvZiMAlMZc4Ha8oe+UzWeqLG1S3o9Q5ruxFlC5MdhzM1MuYmVz1r6eARhBxTJqnWPbOtJ2BXpHQIPO5imYS5xuxDRDwqq00TL0rIlo8Fzc9wnlVd0oY32Zj7o4ZolcYpGZaIC0JQ2uRdE9aqem46cTfnBdHT/wsIC8XHXHLayrI9vHc/siHJQzc0N07vaHAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRd487NYzCZob5NuQYV6T1c9gCHHVHC7MTJzk3d4vSU=;
 b=FQWiPB04DyQyHnJ17qPnBif2lZSUgSpoUyb5mEt33VctitsvF5RqVivLEcfEgs5jpcngytHdGOG6nyicU9OVluGXXvf8PR15QGNjzCkMrD7zp7Eg7dkm+sizckaIJPwwMeFYbs1UEnNClzfRnLfii6nu4Kp4uv7GS5x+jdqKiYOIJQ9fuPUu0xS6m3N68L7BiEShvOQOwIG3FHYz/n+Ifl7jFxFxAdFYoM/SEQ8V0VUx7lQQTyLX/7CICDql9oXhZVwS205MtWcRkX7HpExQSaEH9cKg7oIHSfCDIHZM6tAV35iNTNtkcx9nY54hZRXHRPNo5PospcLdeSGzvPxz/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRd487NYzCZob5NuQYV6T1c9gCHHVHC7MTJzk3d4vSU=;
 b=bJbVKhieqODI3pgv30/0i0te3dG21tHB/SLsRkgVAsx6VsXFupBlPenygbhTkMYBHieOnO+FOBfgWnX0nTyfuSoghapS/Ctq67ZoFdl1hAlQNZe+2B5ECwLKTmrD5pXMG+izpR4udElqjKbIdzb0W+D/fedKUN6pdgouNYiRVuqW6dyVaaYOMiufU3kyyouGTMs6+or85rxBTKspSRtH0hI3GfqeaVrYpjMmtxIWOtxAkylhK88pI4NhSJ5S39sf4UnnteT3SYZxklSK9iNd1mZqlE4wTAtqs0g9yxmW/V4VaV0dMPjlWZ29/ERKdvBKAZFr9M3l7SF/BP2AZws9HA==
Received: from DM6PR04CA0017.namprd04.prod.outlook.com (2603:10b6:5:334::22)
 by BN9PR12MB5194.namprd12.prod.outlook.com (2603:10b6:408:11b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.12; Fri, 16 Feb
 2024 12:31:17 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::96) by DM6PR04CA0017.outlook.office365.com
 (2603:10b6:5:334::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Fri, 16 Feb 2024 12:31:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 12:31:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 16 Feb
 2024 04:31:03 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 16 Feb
 2024 04:31:03 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 16 Feb 2024 04:31:02 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Thierry Reding
	<thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/3] memory: tegra: Fix indentation
Date: Fri, 16 Feb 2024 12:30:55 +0000
Message-ID: <20240216123057.33018-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|BN9PR12MB5194:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9e5365-3179-40e6-03f1-08dc2eeb2bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IgPmGM30h03aQSt8Bf1s6kAxsiWcnYHdP36WZVCYLre+pKZNDRDkhp8umEKk6C43z3qIGGmMQRBP8mBVhnACj+1DAjSuB8HOq+8V9P6zImobYV44WDUhfAaPeLrF9cV6I32h+XAVa8vtupVo2ISPCwzLnR02qiAtC+GeChxrmS53StFHDRxYpIRXYNF/yv/s0IJpq/Qibl5Y6h+Q0zW4s5lgV6sC4W6XBPefQbQ166sZGZymDsaE/kaYrsnOWVXqpnsXvbeFBxpETUHGOqy7k6dTNlCNGlBU3Y6aJxm65Mv7HRKP0JCdH6/3+rlxvPIY8tzHemNq/CSTUB+aAqR5/Zec7PAXXt4FQK89XvcOI6Af3X4pnrsfr8LR9vuWeMffzqQkjhiKpehLaDfOqc3SnXqsLOymdvmfokrbMFZqXc/Ij+rv7RlxSqJkGh4o0ayZ5PPrwTM8neoyCMy80TG+qydxocMpk8/Wj8IrtKbeH+qVY+BYzqgk+lD22/K17S5Q60kKtNgrLg5ThrhCzX+mcwt3rlmMiI6ya1fNZx3Oqy9+LsvU/B7N9B4BiyZWAVHI/c+KIBXLGiJdiN2T9ARjRfTVf92tQt2BrQHMVKAAZ6y5DvZLWsY2uqwng3CkHgFO0MHkEQtLnlBzTr7FHWgcsMw0fnh8c3EvGBGGnI6N4LE=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(82310400011)(186009)(451199024)(64100799003)(36860700004)(1800799012)(46966006)(40470700004)(478600001)(110136005)(7696005)(1076003)(107886003)(426003)(2616005)(6666004)(26005)(336012)(41300700001)(4326008)(4744005)(5660300002)(36756003)(8936002)(8676002)(70206006)(70586007)(86362001)(316002)(2906002)(82740400003)(83380400001)(7636003)(356005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 12:31:16.7834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9e5365-3179-40e6-03f1-08dc2eeb2bf2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5194

Fix the indentation of the '.regs' member for the Tegra234 NVJPG memory
client.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/memory/tegra/tegra234.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index abff87f917cb..e6476b6ad923 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -539,7 +539,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		.bpmp_id = TEGRA_ICC_BPMP_NVJPG_0,
 		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVJPG,
-			.regs = {
+		.regs = {
 			.sid = {
 				.override = 0x3f8,
 				.security = 0x3fc,
-- 
2.34.1

