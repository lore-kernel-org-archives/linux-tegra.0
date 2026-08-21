Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010023.outbound.protection.outlook.com [52.101.46.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ED317A314;
	Fri, 21 Aug 2026 15:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326708; cv=fail; b=ascPrZ2RKDZYxap96IQ9QXVlRMaTHoeKbIuWYRgfJD5N7t6QsUFBn1nFanDLDzdWUua5OOsJuL8TPTM8CmUFQa9eEzwQXM0ktqBO7xqs1EdaPn8Dk2NdVKfOR4Ri2+GRC74XNnjhth3u4adjMKNkfP9cRqxUHhEPFyKbBvyys7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326708; c=relaxed/simple;
	bh=EYjQ1PhVdv2dVCuaVzwLZugFtANHB033kVtQctwxSIk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jc7fwiy5qixXXIjKVKnDqaNr/s4OBPV7P7d+soyVUpALcjw1MtnWOo+nQ4vLw4LkGUFuLHxVN9pe1gcgreEsn4oowXGud5BwdNkFU2M9Tzv4LEQC4Zae0xUe6yBBzaK3NG+26ES85lhNYswK2vZBK0f1l8HCFy6ZTSQnXZ5q/9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cvYKXkgY; arc=fail smtp.client-ip=52.101.46.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cvYKXkgY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T80pA8sKayle58OzLgj6voSjWdm61guGo5NjlCL6s05EuBphHJrTo+yZk+4xYuumxDAscWRI/Y6l/CXDh0lX4Lff+bKR/h+BNGgxhH3rvwRqyIh14x7E/MH9PnsZfzOi/otYD6qu1lzo/5xwT2bRNdQD0WYC8ThYQlzA/N6qxIb0mqN/AjjzFRm26ItP8+QFwrmBdKM2itx4V7YF13fg6jZ8uHEF2Byi1C7JDHwEXT/p1LU0YFgHGYzfPXtLt8yd3Q4uT78azNVYzxEN8BQJ1F1WDjl0G8vW4lLLQIKV5nfzbYphoPh72cMxEv8KpgHGwtx8TcSullqBSctIYcYZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMvl/G/EMiY2lk+Ua70XdtYtIE4D2OVNPleUqXt38OI=;
 b=Rd6kxWPVi4h7RzQ9OETUiO7Hgy+rWuDLiFyeVL+TvLL9fV19/NWXl50nAbXSpJWk3IgSLP69qaPl7BykjYfM+v/YsY5VNQ6jBVjR2pRc0PL3rNGvMKMwX6HciF6QF83p+gg1H6vftuFN8kKah7kvQKfb+kvzzctvpb3wo0caPya0VKRxh1+xorQHlcaOXG5m6LWCbrAAP9LkoP4c+YwOgR3byE6zNW65MvfxWAtgLYSbq3YVmftTFLGY/O3JJh51axrexxvitqf4f+b/0GSKSFKWM2CH5PkIWM1Ja9YPqhZQk/5zKohIZ2XLRAFR0v27I/1mbmGEmLxp6cziikwYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMvl/G/EMiY2lk+Ua70XdtYtIE4D2OVNPleUqXt38OI=;
 b=cvYKXkgYuV+3CgoG0B+yY/Czdd7oSUPQCvfXZZfYycz390WqN86Eb0YI7Zl4urrSuBDjqpdThiI3KvTQzX0fUFTejXchOkEgnD+atj1ksyolWRQ10vGpPnwFRYT/ZusFZTlrY0ftHp7NRhzgaklmBnJGNLrh7PXTzV0ood+QwCgVDe8TnDEZW0BkaYvnOdXQE1IQMWPNQ7QsCAV6/0rxCFv6OfeFwBZeoFiLb5/MES0oaniuy8AytbuThisBLplmRQUHGawQsSNNq0FlkJxbOwTeTS0/dyF6QPFL/OVUwBTgBat58nqWck+Bli2L6RO0KffU+FUW0gyaYfgHq6YOAQ==
Received: from CH0PR03CA0329.namprd03.prod.outlook.com (2603:10b6:610:118::19)
 by MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 15:38:22 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:610:118:cafe::f) by CH0PR03CA0329.outlook.office365.com
 (2603:10b6:610:118::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 15:38:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Fri, 21 Aug 2026 15:38:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 21 Aug
 2026 08:37:55 -0700
Received: from moonraker.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Aug
 2026 08:37:52 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Sheetal <sheetal@nvidia.com>,
	<peter.ujfalusi@linux.intel.com>
CC: <linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH 0/4] ASoC: tegra: Fixes for issues exposed in Linux v7.2
Date: Fri, 21 Aug 2026 16:37:30 +0100
Message-ID: <20260821153734.158426-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|MN2PR12MB4319:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a779d11-2091-448d-05ad-08deff9a3b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|6133799003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	SqzH8VnJSXMthQmgsN0hKT2C6lWrp8C4g+Lg+usdL1J+hyJazdbdLf1DGW4rYbSMQvJiBonkhp2CTRAOw/aj3mA9/bfJmg4VNbwd1NH0G81WWyG1TN9rdE3ZGwQOl0AAQQRpJtjpFh8CLaKb8ERPDQKTiDMYDyW8PXo4OnKjFfwc7XyGRsviDg2AyhANGzt6ccjnTZyLz5z5o54+FLx+gupex/ZfZZjJ/xY4BQZRRZwAl5Uh9+IMDbGg2XhpSAEhS5mOOqYdtEyvHIEhy87wON8Nbo8nZznjN0vb+akK8dHfPJhsYqMpxQk4e+8muNufzSsEBjtZyHalcXpnnWb0giVm39vYgJjPVb+4sr3LlbDrqY1C9jZWWQjzCsFtjsOXP0uYiUO65HkhDDz6lb9rTHf5UBXO2wV5KfQM6btI8LHYY9m/fx3nN+nh2gHTmCwWwR2Cnip+Xgtwg2Y3ZH/pKSWW+tMV7mnNOrL3PSKYlxtzXTAemf8FKxhBjk4thNfeECp1az52Dfi5QCjhKlrLJ/mzS96B6v/3dP5Csl/1pI847qq8GT5bK9UHR4JD0SZpMGSU+xqm923auaqdpUwoJv/eQjIRu1vfp1p98fj0axDA++h7bvyel3lKgKa37WGvkxdozeUX7YRCnGrOfTqLWj6Y2ejhpHEYmlfLgZah4VwC6STTpudtDhhkbGSOD5PhH5upYSSW3rPB1Ba8XRYlKg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(6133799003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oJmmJ5BXdV+y86KBRmE+jp1HIoUG2vwzL705G1UFk9W+An0ps9MlzPFsTWhyHyGUt0kNZXaCESC4KlpnwU1jYFwzg77Mc4m47mA6lKKSlIL/Xh/Z3IrBWw6W2Wzne345LVeJoxtstr+ox/ngZSpYDBnPjGzqqVuRRV3wjSF6wjq8eQtEEfsIiNxagF5EgtAVxR90KfBMopuExbf6gLYaeIgZKJGK/SF/Y+OOFIh4jz5kgi9zH05ARJOXxPD+RLVnv4+0PxAXflSGlK8ZaDM26cc/6yNl0+oiRcX12tpx4zWHFBVL4bXlWi/GJUjwYvzg2HoXNe8xR1ynXmFvAn+F8LRsfw6WpPtMQ0zwLRm7TPXaHZGBgvQPPUpxAnGjWaDLZt5sh089iS62nokeN0nKPiu9UU27KMMrLSM07jHCBeWzjgHqdzfeOE/tYe42gzNr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:38:21.5778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a779d11-2091-448d-05ad-08deff9a3b49
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319

Commit 4b05ccb17f92 ("regcache: Sort the local copy of an unsorted
reg_defaults array") exposed an issue in the Tegra I2S and MIXER drivers
and after this commit was added, this underlying issue now causes audio
tests that exercise the I2S and MIXER drivers to fail. This series fixes
the issue in the I2S and MIXER drivers and also fixes warning observed
with the ADMAIF and MBDRC drivers that have unsorted reg_defaults.

Jon Hunter (4):
  ASoC: tegra: Fix the I2S enable default value
  ASoC: tegra: Fix the MIXER enable default value
  ASoC: tegra: Sort ADMAIF register defaults
  ASoC: tegra: Sort MBDRC register defaults

 sound/soc/tegra/tegra210_admaif.c | 208 ++++++++++++++++++++----------
 sound/soc/tegra/tegra210_i2s.c    |  20 ++-
 sound/soc/tegra/tegra210_i2s.h    |   1 +
 sound/soc/tegra/tegra210_mbdrc.c  |  42 +++---
 sound/soc/tegra/tegra210_mixer.c  |  10 +-
 5 files changed, 184 insertions(+), 97 deletions(-)

-- 
2.43.0

