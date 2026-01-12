Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6999730E0C8;
	Mon, 12 Jan 2026 04:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768192267; cv=fail; b=eyNRKVi+bc24nWETfJACheiTzGF4K2NeZTw9HIh0G1fGT3FJN8d1QQSg5PHqIByXjtJVQVM6cpKO/3twWKugSnD2K3HZ4zO0E77pFGG7QXAFHckLseF6XGSU15ObyUcaYJrOVJnmCxx/hq8ayxLBrMYD7u5hoE4i8vCvi6Ikgf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768192267; c=relaxed/simple;
	bh=UrwTilfCoYM3dB+iwH4V+ytfmvXwHnsP82Cs5rZQ+fQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=InjPXRt5dASV2uHrAIbBim+DOQADaq9PEhqrKCd4G1Wip6+de8XWj7V3CF3V5HlRLM6+uI73hEpS0sxRq1p/RF00yuQErI7zT/+b8slZanuIZchoy8GECFJvW3Rgo87ucixGtq2MUnqs1NKQo2UVFWSVRDyGM9ltN/mDOSNRUvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uDhX2mVg; arc=fail smtp.client-ip=40.107.209.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uDhX2mVg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfEYWjbVhDz209uBdU8m+kh+Wl2N6icd4wri9emjzLF1Cpveh/5c78Dyol1MOZqmnx56462V284LGV3du9PGJEXXY63jfThUcDoMIqyzbi2zLFrzFUzq1O8abXuMjE92Zk7tR69Ku5FY9KGy6387Ssh3UcjLkpbOKPC2mnOsNwFE81RZ1dvuyvBXvVpdJOSyJDTJ49rgJxRkZPlMOAtLzi6uWCkrXbmXeJvBjsWd55VUj4iWwh4haZeSWf7PGdevOxTV13RpiUXkExVkP+zZUYdvCthQFFiitvKzb9j4np1oV0rYG5E9FOPk+Bh+W/Mkyz6x+mA6FxMlG/S5O+922Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhiJHs9XQvyqOSgJdHtnKq+aFupnrMit9CkchPQ1MA8=;
 b=uxubbnEwEHmCISebA2pflCgZdS2wwy4hSjcQDlvNm0VPEO3zsi8XJncRPvIBnKW8hP0v2NV9NlMAdX9gKk+wS0tnlnmMqv9C6nNcvGo6aXOsDY+R8BeUtBoK100IAeZwaqw1BQ4FEvuA6pSKfdReqCuE0ZepysAoCmTfWvQrMa7aMRwchsmwpfVZKAFT1t07PfgJJDAVnWt982HZ2VRriQtLYBmZUOZioozfdIpgZAFwOzUPSVXpBeEEpeilEscG2R8T0X0QEAoRHdoX7BqPE9vwjcirNnN2U8R5uC9BK0Z9S/TwTEUQVTs5TSB/3UZPmXki9firXZ6XfWQ+7Z4QdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhiJHs9XQvyqOSgJdHtnKq+aFupnrMit9CkchPQ1MA8=;
 b=uDhX2mVgwAPw75HYRvqwUV9/obf0B1byaVIitIywz9W1IK5NoJrS53yupXTlgLoT6z2azl8UQeVRJZa5khrwQdWfJn/DV3zXLAbGpV6+pdzlM4qDZcWZvafie6uUC6tZgv9VJq8uoZwaXffssjhGFO6mxZeZxV0BPJAlxr4iOVGwOtPsaG1NfcU8Gaue+8K4by11ksJRAPNaejiCfPX2ZKVs1/oEpqhAUctotloyNN2hWyHuCOhl64Rj7WI7qdhTMoqIVTTjvny0QExLVqRTkBhvUyx/9Uqd2YYTU87Zp7GecPzXPngnkrdRsFa5heX7pX5My29wBvXRudkoJ9nqsA==
Received: from PH0PR07CA0015.namprd07.prod.outlook.com (2603:10b6:510:5::20)
 by LV8PR12MB9690.namprd12.prod.outlook.com (2603:10b6:408:296::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 04:30:51 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::28) by PH0PR07CA0015.outlook.office365.com
 (2603:10b6:510:5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 04:30:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 04:30:51 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 11 Jan
 2026 20:30:31 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 11 Jan
 2026 20:30:31 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 11 Jan 2026 20:30:27 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: Mark Brown <broonie@kernel.org>
CC: Sander Vanheule <sander@svanheule.net>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan kumar <mkumard@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [RFC PATCH v2 1/3] regmap: Add flat_cache_default_is_zero flag for flat cache
Date: Mon, 12 Jan 2026 09:58:39 +0530
Message-ID: <20260112042841.51799-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112042841.51799-1-sheetal@nvidia.com>
References: <20260112042841.51799-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|LV8PR12MB9690:EE_
X-MS-Office365-Filtering-Correlation-Id: 798fc17c-1409-4b6e-f5f5-08de51935e1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5k4Ue3ftiubZxGU6u8/BfpM47d7lMcl1i66wWUchVfZhkmtWGkPEHTGDCNbk?=
 =?us-ascii?Q?3gtVj0US2ZmhpAaefuywrq7R68TSCX3lVWRGm1MNDMN4B+Og9ZQPpojGu6EF?=
 =?us-ascii?Q?W6xUh4nBmzliTEXKcsxXCHvfccKZbmSRqqqg639bZ+kzptiBJcTUcjHtuJb7?=
 =?us-ascii?Q?u7cOEmuVBM5rdw3T/X2bUTw3O0N31nQehl9DAVDlUUC6pD8EaGzpFLSTSIL8?=
 =?us-ascii?Q?Yn/s/gzZO8Vytep55vHU5dtgxyUyW/+0kxWOy80owVK7oV65tbxFaDyUCvF4?=
 =?us-ascii?Q?PFFZNfQu/aCkrMjLnUn6PN8X1EXxi0YCLdC+RK8pNZANTH/OKVhAIhhxWAp/?=
 =?us-ascii?Q?EYgWnL9yyiaqG1X8C1lhB/pXwb60ij0ytkjeZEvlt+jAZZKJGml3AjlS07ZC?=
 =?us-ascii?Q?Zz7ScwVFlm/OBZjLDMypINhCgaE63F/V1APjUpafsyFiOJPd3/ZZwzaQ4hSG?=
 =?us-ascii?Q?S7+3/tAIx7XNBtS8B9Xx3wB/W2vL7KdZ0YDWfZlXl9HBhltdrsBgzKBsD12q?=
 =?us-ascii?Q?aAtnKgVZqfGqUCj0Sy1aiXSBNpXjKfEdJT8Amc8n27CJ7/PzlClnYwVLxQyr?=
 =?us-ascii?Q?q2K0+1cvw1BpHqogeqR0wM0RztATyCxaVMMqOyVKKPMHirteutZ0EO3JCfgw?=
 =?us-ascii?Q?aRBVxkeFs/ghBfxodZTOd8V79MYqx7SG4LANuasA+kJ88RK5sWhykmb+oB+4?=
 =?us-ascii?Q?oD0KUP7YL7911XT6B4NYd4Na83Aw1A+MvZyOKSz58PTAi7dPxINNDXAcO8cO?=
 =?us-ascii?Q?U4d5CkwQW2JhmiV3Zg9C289BzBuB+sGtU07dyZ2nobBfXYx/a/z/9Ix3JmEf?=
 =?us-ascii?Q?cS96nbivETBKx6xquKWjYycL+QTWBG7p4+uSQmyPHUm002aRcITnblVkF/kM?=
 =?us-ascii?Q?tLE3/ommvrngCx0gGl3SDqMsyiJhJSybZTZEzyXlVQ3jXCvDMU/eMYqSM7J3?=
 =?us-ascii?Q?2WCq8s7hJ1v71mze4PJQgy7Q6m2Di7TsRw8CxTwy1g8KP8Jp4cpOLyBly+G2?=
 =?us-ascii?Q?/xQXaoVktazEkkzx7hGIYP2HegVPsqsxBxboPx7dlOWTQK7r/Nv+zZfBVNBE?=
 =?us-ascii?Q?oSXajH/M5wJ1unj6FHVtST/q5JrqUZCEOrn7NGs0VTP75pN+Zx8DdJ2xDwwk?=
 =?us-ascii?Q?0B0amD7PjmaJdeNMJSnHDqfa1d4PXwTfzmJr41ostGwiYC06985bA40RrnMQ?=
 =?us-ascii?Q?JKJq4NLG6T/96X+XRjKoLsCEKU4wiZI/yxYR+rNHTNhYIBNSndjgMwZHog6r?=
 =?us-ascii?Q?ApLl886KSpWSgVCtrt2d3Fa2LarZCxfdSlFdOeyKBGlGsjLqHI+jrxBHor3/?=
 =?us-ascii?Q?McjivHZPT8jTXYmhy4zqQkpGNWxzMxkkpRaT8RYTU/DNoNb6+vZCdqnCc4je?=
 =?us-ascii?Q?PUuZxS7rZ7ReAI2nz+C85cHo9+TaK41Nzt9YaxiQERdwjlZ0jPWw+cSq3325?=
 =?us-ascii?Q?FsRRJZRYsVyGLUQmw9ShXxKSNfgg78uaf5Jkoa9ep1VC+/AuVhKcSSeaq8xP?=
 =?us-ascii?Q?DBL2y3QgX7ImIvykGoYPUv3Gsq9GDeVc5rqjkOAUoynauS+f/B6llWixbt28?=
 =?us-ascii?Q?Lzd5eaYvZbOMnf00h9Y=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 04:30:51.2906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 798fc17c-1409-4b6e-f5f5-08de51935e1e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9690

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
   validity bit; the flat cache value is already zero.

3. Code bloat: Large reg_defaults arrays increase driver size.

Add a flat_cache_default_is_zero flag to struct regmap_config. When
set, the flat cache marks registers as valid on first read instead
of warning.

The valid bit is set on first read rather than marking all registers
valid at init time for the following reasons:
- Avoids writes to register holes or unused addresses during sync.
- Safer for drivers that don't have writeable_reg callback defined.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 drivers/base/regmap/internal.h      |  2 ++
 drivers/base/regmap/regcache-flat.c | 12 ++++++++----
 drivers/base/regmap/regcache.c      |  1 +
 include/linux/regmap.h              |  1 +
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.h
index 1477329410ec..xxxxxxxxxxxx 100644
--- a/drivers/base/regmap/internal.h
+++ b/drivers/base/regmap/internal.h
@@ -157,6 +157,8 @@ struct regmap {
 	bool cache_dirty;
 	/* if set, the HW registers are known to match map->reg_defaults */
 	bool no_sync_defaults;
+	/* if set, zero is a valid default for REGCACHE_FLAT cache type registers not in reg_defaults */
+	bool flat_cache_default_is_zero;
 
 	struct reg_sequence *patch;
 	int patch_regs;
diff --git a/drivers/base/regmap/regcache-flat.c b/drivers/base/regmap/regcache-flat.c
index 53cc59c84e2f..xxxxxxxxxxxx 100644
--- a/drivers/base/regmap/regcache-flat.c
+++ b/drivers/base/regmap/regcache-flat.c
@@ -88,10 +88,14 @@ static int regcache_flat_read(struct regmap *map,
 	struct regcache_flat_data *cache = map->cache;
 	unsigned int index = regcache_flat_get_index(map, reg);
 
-	/* legacy behavior: ignore validity, but warn the user */
-	if (unlikely(!test_bit(index, cache->valid)))
-		dev_warn_once(map->dev,
-			"using zero-initialized flat cache, this may cause unexpected behavior");
+	/* legacy behavior: ignore validity, but warn if zero is not a valid default */
+	if (unlikely(!test_bit(index, cache->valid))) {
+		if (map->flat_cache_default_is_zero)
+			set_bit(index, cache->valid);
+		else
+			dev_warn_once(map->dev,
+				      "using zero-initialized flat cache, this may cause unexpected behavior");
+	}
 
 	*value = cache->data[index];
 
diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 319c342bf5a0..xxxxxxxxxxxx 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -177,6 +177,7 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 	map->reg_defaults_raw = config->reg_defaults_raw;
 	map->cache_word_size = BITS_TO_BYTES(config->val_bits);
 	map->cache_size_raw = map->cache_word_size * config->num_reg_defaults_raw;
+	map->flat_cache_default_is_zero = config->flat_cache_default_is_zero;
 
 	map->cache = NULL;
 	map->cache_ops = cache_types[i];
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index b0b9be750d93..xxxxxxxxxxxx 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -452,6 +452,7 @@ struct regmap_config {
 	enum regcache_type cache_type;
 	const void *reg_defaults_raw;
 	unsigned int num_reg_defaults_raw;
+	bool flat_cache_default_is_zero;
 
 	unsigned long read_flag_mask;
 	unsigned long write_flag_mask;
-- 
2.34.1


