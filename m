Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010050.outbound.protection.outlook.com [52.101.56.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9557279DC0;
	Tue,  6 Jan 2026 14:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767708555; cv=fail; b=DwIsXQAFCLTVdih34YcyE41b5JeyBwjf6upj+3PSTJHUJ3tN1mLil1Va7ZtTAmNiR5lJt+d7Pj3vBCXdvvKxTw0sEswdksMS004//WPQi0EyrHnfCL0LFjt0it7jAeczytVLiv9det3Zdb/PVFOjvYY590z9TZ+OOAW6fFw09+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767708555; c=relaxed/simple;
	bh=tHa031Fsh0b7PkqiC+tVB+6DBV9R/hkpgC+GFv83HE0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R3GlmwY+QBZ6gO+vqZyML/I4voSwRjfXwdHrykEGJxF3LsBCVBH+bfByQZjymiWVI2wVs0iIYVMCn4MNlT18rOZejKOVJ3/Qsluh08loFgOoos2Fimf9tnG96TGnW2NnXS0Tkb+4/fhgdDNxtCUxOwBNKX+Rcozt049eqnrLbm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fbReYd8S; arc=fail smtp.client-ip=52.101.56.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fbReYd8S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJ9ltAERC3ZdKt4j2dd6kx6RmNHSVkSxqgStnyDJNPGWhi/NFkNNCRaeK3wwKznVVkBVL3tlARbJSrikDG523N3hPoD39GLga4YqPerYCbC+RqA6sCL6jzi2xlry7PEFmzxXd7vkPuO9tmg7WJU9QYfl/uyrZCHoWb6GndIQ9Z9aiwN9Do03Vvn5irnHg2GvWrYxv8l3Cemt/UIiCe4vfrvIpP7sJe66+j/GnUE4nLxFBoLPCvQgMumsS2zlmC35i+STqzuC1i6lumf1vJJxUGyf4b5AWkMCYgsuBWR59wB5vFLKLXxwxqmIGjmgoAMLDrjvCsikz52v7dKAoO+q0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXmpNK4yhqeDcsVVXjk4H10Y0I0vf7B8vZ7A7nAoncE=;
 b=mejphmx2l4pOgb5vIzPEpk7RA4NWZWW6SZa/yuuIo68QM1D+hv9Ewd7qCZ5sSWuCiigjUmrtKw2ZYfOjwQUfui3ZK8reJzjYTNczZ+NXC7T3l7YH0IX5TgaNkZWYXXS0FATXFCrmtTEA34ObKYBiWPaJEVr9ilcaBeTEkhfTsAWACuypsxYVRHVGLaRGP4Toewd9ZmfzTJEUWDF3NaAYdbNhY9Dinp4pb9DITO8G2z+ZHGVrvtUIkkvOgtdIR1GOxY19g0GywCC5f1G1WhQb75AId1IPwJO4DRWZF92f1Dt0ezacOBX78sHVDGddNAszMCKTpWuNNJ7RQQtgzcrYEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXmpNK4yhqeDcsVVXjk4H10Y0I0vf7B8vZ7A7nAoncE=;
 b=fbReYd8SUTvoOsggcUiYNRfFo3yUeAQUkymqzPe5gOO0qPi3NWfB0Cor1WBZumA4NIkoUwpyTWFfsk5M14WCHD7HdxluwKoB2SLXJUAVKCeIgdPAhchpjpcM77NIfXMzK49d4MBnjKOxu0olHY+vZEm60RUqNU0vakrq225lfDYQcN/Nq4FAENOEqCRRaxY6S42U2rcOr+Mj/GPY4OTkT59iDtoKmqPmMjkChF4NdBezhl2LasQ1lSe6vsTnQbM01PJslKgLvW7GVHN+kbIqTXCqvFfECSg6Biw6xmPAYs8wxP2+2KctjOKJTEbIH4YT7p4/HsbkP201E6pvNtdmrQ==
Received: from DM6PR07CA0120.namprd07.prod.outlook.com (2603:10b6:5:330::10)
 by DS7PR12MB9527.namprd12.prod.outlook.com (2603:10b6:8:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 14:09:07 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:5:330:cafe::64) by DM6PR07CA0120.outlook.office365.com
 (2603:10b6:5:330::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue, 6
 Jan 2026 14:09:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 14:09:06 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 06:08:49 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 06:08:48 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 06:08:44 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: Mark Brown <broonie@kernel.org>
CC: Sander Vanheule <sander@svanheule.net>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Sheetal <sheetal@nvidia.com>
Subject: [RFC PATCH 1/2] regmap: Add cache_default_is_zero flag for flat cache
Date: Tue, 6 Jan 2026 19:38:26 +0530
Message-ID: <20260106140827.3771375-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106140827.3771375-1-sheetal@nvidia.com>
References: <20260106140827.3771375-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|DS7PR12MB9527:EE_
X-MS-Office365-Filtering-Correlation-Id: 3588f566-ad44-4cf7-3ae7-08de4d2d27e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UwhPVRYXh4OdibV9LVZw3GMphKgGRjh//sg4cc8+1eqXQn3mO+QgkLvd6Vmr?=
 =?us-ascii?Q?q+EBFXE//1iq4ZIkS6k0hm16bVNyk3+N2Grpivsj43RrEEE7O0668qYwnhax?=
 =?us-ascii?Q?Rb23K6EcEMGpA8892onA+UQgNjZ/7MggGhFd1fYJOiZ+ICe9Nkn3DWHqLmDx?=
 =?us-ascii?Q?7T8sjsrMN3Zxz/5BRpiIAqjZX+SlkxAmiK+b5BB6QJXLAJpumbvcFsQW854O?=
 =?us-ascii?Q?DYWsdoXblvMHhq90i1vaDI5lJiv28W4vUcVgeuahHRC1EVTGrfvWIX3kJ/bq?=
 =?us-ascii?Q?t9mpXaz50RjXyad8Gx7cQq3M4AsbxlIOjSW4+Cs5OGfgrDlTZP3HJ0TcOx+6?=
 =?us-ascii?Q?jRKDlE0seqHv3mBGbcDCKUpqoqn8h2qEldYVDF50n2WgEbHniELn2enLRTGA?=
 =?us-ascii?Q?sxpNxAZorSfDK4cAcGhFJX0oBOl+xDaGtz7igh0spkyNjeSqBwDrqYR3SAQC?=
 =?us-ascii?Q?6/BJIo/oKGqEUtsTdlZXaN2bPcuHsp/DETn0VptHTjzA0qXKASY8QH2VWcbA?=
 =?us-ascii?Q?rAKqSVHnjp8SNVQeGriAgImfhqiBe+GjZBu7jFbMQwT6zXrryn29vNzn/dKj?=
 =?us-ascii?Q?GAV0f3zB6rG5KwIcwsMfKqVe5bLaO8uqTAmadrpFthR7Yf2Eu3AVS6AZe6T9?=
 =?us-ascii?Q?ltqen2MWzT20XcKjZd2M2WvUEs6SrmxaDTslO4EEaJFz60+aLP0JqRM26CV8?=
 =?us-ascii?Q?HMk5SgQhYOufrY1GIBWRiKoa7L4wSimGLoaPPoMX6clCMT+f5utMTRVFWVQM?=
 =?us-ascii?Q?g9KKRRWe7rkzDzVmPCXcykx67ozLOhzgDPLaE63Q8yNGqaMV58TwGUmbnADB?=
 =?us-ascii?Q?P2oJo040BEI5RHrVtbs7OMezfgzjsW5aeTeIjigMvT1+qAkNtv28i00f2XRH?=
 =?us-ascii?Q?Pqp6m8qu+yXFeOLaoa8I5TLYWtiplAwe7Kyl1KDROap1OZXgYurbMI9PrI7N?=
 =?us-ascii?Q?jkvUk4dGsfjc5oxpWn+dJA1vVQrhDfekwh6QkZ1chjbhIndBx6QVcPh9MWAR?=
 =?us-ascii?Q?ozqnQYb4eef2Tze5Ii0Y7Z/JrIbiNl6vlfhifyLzYysEJGmFg+sKZS4OKGZA?=
 =?us-ascii?Q?93sazNV6OzalJhoDCREkN9+5eK9HqiMzQ7B2ml2ouJLkkzBqh1X1HmD+1K8u?=
 =?us-ascii?Q?WEF75BTDYAx9+1A2cgigVS1uEipEeEVQZr5qy7aaAqhew08PLFtfP9vl2aAP?=
 =?us-ascii?Q?Be8EYI6mq1J8iQTU1a45vjNgLJ3kTsRRb35CMxYWamNz8qEow4+zh572D414?=
 =?us-ascii?Q?Tydu8UJHS2bIO74k3s58kqpkbg0ljDgqiE+D+0Ubvco6KacTwyMLkEKJ44q4?=
 =?us-ascii?Q?8Qm2o66/MRPYgEyEqeJTfcF6skGzWLXReH0RtSbLckRcwDhf79hJMyVeoy+S?=
 =?us-ascii?Q?waQeuNG04+9wfJM5WOAVSCt0KrkQV7VHh0N/hMjrEdTeRRZwzf4pbunzjDir?=
 =?us-ascii?Q?kuuTpBOtXibyX1Yw+pMmeszTCNb3Fz6H0Dd0voC43qBLAu7zei9nVYtrUUOh?=
 =?us-ascii?Q?hheuqvgHk2Ak6mzRwmxwIlGQbWFR0ja9N8KKpdBFUWiombyPO9ggrxD+sRu7?=
 =?us-ascii?Q?Mvo2KpQeetWOFcDdvMs=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 14:09:06.9892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3588f566-ad44-4cf7-3ae7-08de4d2d27e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9527

From: Sheetal <sheetal@nvidia.com>

Commit e062bdfdd6ad ("regmap: warn users about uninitialized flat
cache") added a warning for drivers using REGCACHE_FLAT when reading
registers not present in reg_defaults.

For hardware where registers have a power-on-reset value of zero
or drivers that wish to treat zero as a valid cache default, adding
all such registers to reg_defaults has drawbacks:

1. Maintenance burden: Drivers must list every readable register
   regardless of its reset value.

2. No functional benefit: Entries like { REG, 0x0 } only set the
   validity bit; the cache value is already zero.

3. Code bloat: Large reg_defaults arrays increase driver size.

Add a cache_default_is_zero flag to struct regmap_config. When set,
the flat cache marks registers as valid on first read instead of
warning. This ensures only accessed registers are marked valid,
keeping sync scope minimal and avoiding writes to unused registers
or holes.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 drivers/base/regmap/internal.h      |  2 ++
 drivers/base/regmap/regcache-flat.c | 12 ++++++++----
 drivers/base/regmap/regcache.c      |  1 +
 include/linux/regmap.h              |  1 +
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.h
index 1477329410ec..8e805046526a 100644
--- a/drivers/base/regmap/internal.h
+++ b/drivers/base/regmap/internal.h
@@ -157,6 +157,8 @@ struct regmap {
 	bool cache_dirty;
 	/* if set, the HW registers are known to match map->reg_defaults */
 	bool no_sync_defaults;
+	/* if set, zero is a valid default for registers not in reg_defaults */
+	bool cache_default_is_zero;
 
 	struct reg_sequence *patch;
 	int patch_regs;
diff --git a/drivers/base/regmap/regcache-flat.c b/drivers/base/regmap/regcache-flat.c
index 53cc59c84e2f..ea12e13e1365 100644
--- a/drivers/base/regmap/regcache-flat.c
+++ b/drivers/base/regmap/regcache-flat.c
@@ -88,10 +88,14 @@ static int regcache_flat_read(struct regmap *map,
 	struct regcache_flat_data *cache = map->cache;
 	unsigned int index = regcache_flat_get_index(map, reg);
 
-	/* legacy behavior: ignore validity, but warn the user */
-	if (unlikely(!test_bit(index, cache->valid)))
-		dev_warn_once(map->dev,
-			"using zero-initialized flat cache, this may cause unexpected behavior");
+	/* legacy behavior: ignore validity, but warn the user if zero is not a valid default */
+	if (unlikely(!test_bit(index, cache->valid))) {
+		if (map->cache_default_is_zero)
+			set_bit(index, cache->valid);
+		else
+			dev_warn_once(map->dev,
+				      "using zero-initialized flat cache, this may cause unexpected behavior");
+	}
 
 	*value = cache->data[index];
 
diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 319c342bf5a0..2d0e5c9ba51c 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -177,6 +177,7 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 	map->reg_defaults_raw = config->reg_defaults_raw;
 	map->cache_word_size = BITS_TO_BYTES(config->val_bits);
 	map->cache_size_raw = map->cache_word_size * config->num_reg_defaults_raw;
+	map->cache_default_is_zero = config->cache_default_is_zero;
 
 	map->cache = NULL;
 	map->cache_ops = cache_types[i];
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index b0b9be750d93..bf918f88bfd3 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -452,6 +452,7 @@ struct regmap_config {
 	enum regcache_type cache_type;
 	const void *reg_defaults_raw;
 	unsigned int num_reg_defaults_raw;
+	bool cache_default_is_zero;
 
 	unsigned long read_flag_mask;
 	unsigned long write_flag_mask;
-- 
2.34.1

