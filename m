Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010068.outbound.protection.outlook.com [52.101.85.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6319A37F73B;
	Fri, 23 Jan 2026 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162097; cv=fail; b=N2b+5Yi8Wa7V143tDKwgUmq593oB05JVYp0YwBiBAJdFVdXMhx7yR+lNxm7rZfeECpGcLV0UdsWwi5EHaKB5u8zA9Ayj+G1I4L+FZjjHrbWW1VHXyOMVkA3YG80Vn92RbWLGmSNduuPp/MfytF/O34ihM2FvDcu73YW6Fs9Txn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162097; c=relaxed/simple;
	bh=s5z2aW3tVcsOkzAgk6TVczjCwi4nYrFqT83+am2nqUg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MU//sFFcE5iyOKrJ4qhEkSy8ryht7tJgOeAHFPuXamG+qBl+/ECT6wO59XHSsjfTVvv/FcLf1tmfsi4/ZOQt8dpNud+g7Cuj+2SpyWk5S26lKZt2RHts5FeiWRQ/1k2oXXnq3VpgSYH8jcE4A8fFz+n/Nv34fMWJ2MsNNE5EGt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zs+p0Izx; arc=fail smtp.client-ip=52.101.85.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zs+p0Izx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tp0OqWDVay5c0s8f9sMlmUj1KdVcmOJwJJBfU+E9RiwdxmMkkFDXU5j5eFjK1leut83uew0R7UPrt3nyp2Y4GG77y6yresyR7ATr68I4JOQAPndeFfD04lF2VeH3nmX4JPWBeYIMb4adVJocGooW5cLyhpMR6HOwthX/lbxyxcAvTZhA7BTCv+5SO0yppkv6/9IKcK7hAl+hfW2tPBc/goy2MKXMQ23TMT6L9K0G4st3n5EIA+8nBZlECbhpU0tmsTXZsUAqD9n9E2YDqv5aermHn0BU9Y8P2ihLQTNVAHoyStBx5NHwJMMZBjnGGUl1VDrxThtnbsDBqbL+jWufjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cb3uM0WEmRsOpvLH2xkAJCyEEq4aZCrl5qS9A6y3zMA=;
 b=kFZVb3JLAzM3sX0LuPPkwcID6tNNsEb9B/0FstMi2afqFMtk+EeJJ3dJAy2CeJEcwygodNj4yXPyx5XxFUsbdzcvDy4XyM0FsL3VUSPJ9gNJtk5V9EcWMjOdXPCb7a7cu/Tj0OAOS2it2NUfgl05QA+ZW2VddPotmPBX017qfcqqoRw5Ed6kWEKUvHTFNgpKcYiZfXwsvt8qvL24f0YpWR2pvsYfh0PaUNx+cEMhXVuHftI4vjWqqMunt0tiQfuGNz089KXD0YXJYFozo4mVJ8PI4G4P3R9zdzCI8C0/jl+16/BTv6BO/jnxTGb/skWyqhHl8QrFB46M3D8nOF3CKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cb3uM0WEmRsOpvLH2xkAJCyEEq4aZCrl5qS9A6y3zMA=;
 b=Zs+p0IzxcQbXYHp/fqYixk2maudS6gdylq3EefCULWFxKEg1VRVbVf9UJzsuLGRV9ZMNSJ+IN3biv5Fg75JrV1/UosClv+Je+0KwhTnIKv413YOEuxE4h3tJ2sZM5o1yCIq7Fi9iUffej5fUo8/lV6LYbg3FjKWgeqHbMBtf+7/8nz5MVjP4XDSHLaGBF9GyqSRz9KAW1Y0A7Vz8Yk0N3lfxcalL/NyodBQf2r8WMa5m5y/3f3lr0iUTyJ9mjA7HoedLiw8qbl5blXEv3z8Z+u8UwqMjVa0/i4OddS1T4JPQIJcHKweWL2KptqklQdB7HfrSc0bAoLki8fyiwpVTcQ==
Received: from BN0PR02CA0003.namprd02.prod.outlook.com (2603:10b6:408:e4::8)
 by LV2PR12MB6013.namprd12.prod.outlook.com (2603:10b6:408:171::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 09:54:43 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:e4:cafe::de) by BN0PR02CA0003.outlook.office365.com
 (2603:10b6:408:e4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 09:54:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 09:54:42 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:54:31 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:54:30 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 01:54:26 -0800
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
Subject: [RFC PATCH v3 4/4] regmap: add KUnit coverage for reg_default_cb callback
Date: Fri, 23 Jan 2026 15:23:46 +0530
Message-ID: <20260123095346.1258556-5-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123095346.1258556-1-sheetal@nvidia.com>
References: <20260123095346.1258556-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|LV2PR12MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: d78a0c9e-b2e1-47d9-34e2-08de5a656ee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2IgZMlvHaQPDRGjeQvXvIoSdaj/O8viCMkeBE0xKS1DLEieIgU844peTpGJo?=
 =?us-ascii?Q?i7VkBvXGYpZNx8D806sRxa4PJBKt6pfPQmvg0DcAufk7QzZ9T94wn4UvDgQ2?=
 =?us-ascii?Q?oFkBmlNI05PRi0mXBW3lfYmbmt253xSJuUqk/+0r8ZaTaL92XvOj/XRYJ51k?=
 =?us-ascii?Q?sKuCm6YaAJHoFBrgN2G/NrT1laKKYbeoNDPG9oJlKGnSYpXOJwGIIREY7AJw?=
 =?us-ascii?Q?SKX+jkyLusewLnARagYmvyVgM787jK5eFT2HA8FcYsz6t7dFhiEqOqerXMUv?=
 =?us-ascii?Q?7g+kL6t8hjH/k5p6JwQUxncZRa4iFoTqe2a0MdRckiVB2s/4ZF3UDaKZ3+bc?=
 =?us-ascii?Q?0WVhoC3zxeLppXsTW8XX5rY2/hsHpQwSZjTWuPFG3/o2kLJXgGbSGct+e+uy?=
 =?us-ascii?Q?J9Uzqsut/cBanT3saKSUU/ronFBJO3zlfsqziId+VTn5G9svwXYYgsUQvBCo?=
 =?us-ascii?Q?l9l0/GQFA+w2yc2/MuwZZGFM7mfEOcGZwl3a+HyBH4hgDZqVV1vCpKlWHpyf?=
 =?us-ascii?Q?A4qinu+le9Y3Y2NCFyFriX/FL8B4wi15H09TCSZeTqfWOC0LChVkNBtvwQVX?=
 =?us-ascii?Q?6yFp/7Old72hCUzYfjlR2xT3vfCN7ZNWQ9XzKANx9Mvpr9sVB85X8K/G5zC/?=
 =?us-ascii?Q?35RJvtX50lYd7xMkrTuElRaaEUACqijjRk00IQzqK18Eja1zOFmWFl7Dxp/+?=
 =?us-ascii?Q?1lb6RjoAxgRCtaZoeSX7Uf9Z1BC115Mfb4uck+Q2jZqihwtxQMSTBkx36fX9?=
 =?us-ascii?Q?jP9Pqw5HhyoI8ZtAWMf8yKCeb9dR1NrxQqoNaNOhx8g54iJ/3vYPs0yAzGKR?=
 =?us-ascii?Q?yev2rkcfCXzrYn9T5PsDlrcJE3oyIC/EZ+s2ntIkblqQanW85pTvmOqt94QG?=
 =?us-ascii?Q?ciVEYvWdR5QouXQl3QvNmfxZAVdYivy+aZRzWYqbxw9ZUvNFAgU7DfiMpiL7?=
 =?us-ascii?Q?GhjAw159rvpSTrShin+vbDUjlHg2jL9E0ruA5deosjD0fFP5SMU+/tz19PPf?=
 =?us-ascii?Q?/sMVs5Ep+DLyRoJYEIZ6WOiOAlCClDL6VZoj/4fw2XuU1yG+/SVSkyjGtcV0?=
 =?us-ascii?Q?7odK40aN+Q4E+XSgPdRHWNfWxBiDm4A9ZRllN4iWjIqOVpXUANeS5uBDolBx?=
 =?us-ascii?Q?osM4py60eJEAueOKvH/9k+VNQOY2XIScTSZzpN3MmN8KCYMUzG6IZOMnwRhJ?=
 =?us-ascii?Q?yHKqYMLIfwY1pL/evlN4pJXycbJ3ILnundV2yvErBX47ejjpcEK4Tn5P3YaN?=
 =?us-ascii?Q?5viZpKuMnH/0INhOc8OHjaPiH1TRNSgLeJXQ9NxtUP/kB7WQCJRo876NHdFa?=
 =?us-ascii?Q?lD9vxPiaGXg8RltfzV2z5NBH94D0aolsgnMyC4BJ6LtsQ5vHZhm2jQ9kPHRk?=
 =?us-ascii?Q?KCUJGYOQU4PKTL/Gwx9zRUB/r2Wa7i574rU+R9TOsYSDbGzLeYaa/ASrfcgs?=
 =?us-ascii?Q?ArFoTRGsJVj11Gh03TVQfGKC6BwcNbDW15tQM9rXThhpSjQAMh/HzDE/F/8V?=
 =?us-ascii?Q?7jHnFij15ujKNWjuIOhbSYGzElLgU5QEtMrWwQPItKwGEGDEaVDplHKCSRAq?=
 =?us-ascii?Q?Xw8MyLZZD+ScxTn9R2SPsk2DMyVl8OsgMXQr5Z/RszTI8qqBL4eU9gygrXoK?=
 =?us-ascii?Q?c4n1jQeIx84Sbs300RBZ4vWZEp0y2MXQAj1VTWMtY0y51R7SqzDpd4C5l5rL?=
 =?us-ascii?Q?Y2ihcw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:54:42.9964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d78a0c9e-b2e1-47d9-34e2-08de5a656ee7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6013

From: Sheetal <sheetal@nvidia.com>

Add a flat-cache KUnit test that verifies reg_defaults are honored while
missing entries are populated via the reg_default_cb callback without
hardware reads. This exercises the new callback path added for
REGCACHE_FLAT defaults.

Test: ./tools/testing/kunit/kunit.py run regmap
Result:
======== reg_default_callback_populates_flat_cache  ========
[PASSED] flat-default @0x0
[PASSED] flat-default fast I/O @0x0
[PASSED] flat-default @0x2001
==== [PASSED] reg_default_callback_populates_flat_cache ====

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 drivers/base/regmap/regmap-kunit.c | 91 ++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/base/regmap/regmap-kunit.c b/drivers/base/regmap/regmap-kunit.c
index f6fc5ed016da..38c20a09670c 100644
--- a/drivers/base/regmap/regmap-kunit.c
+++ b/drivers/base/regmap/regmap-kunit.c
@@ -15,6 +15,8 @@ KUNIT_DEFINE_ACTION_WRAPPER(regmap_exit_action, regmap_exit, struct regmap *);
 
 struct regmap_test_priv {
 	struct device *dev;
+	bool *reg_default_called;
+	unsigned int reg_default_max;
 };
 
 struct regmap_test_param {
@@ -118,6 +120,14 @@ static const struct regmap_test_param real_cache_types_only_list[] = {
 
 KUNIT_ARRAY_PARAM(real_cache_types_only, real_cache_types_only_list, param_to_desc);
 
+static const struct regmap_test_param flat_cache_types_list[] = {
+	{ .cache = REGCACHE_FLAT, .from_reg = 0 },
+	{ .cache = REGCACHE_FLAT, .from_reg = 0, .fast_io = true },
+	{ .cache = REGCACHE_FLAT, .from_reg = 0x2001 },
+};
+
+KUNIT_ARRAY_PARAM(flat_cache_types, flat_cache_types_list, param_to_desc);
+
 static const struct regmap_test_param real_cache_types_list[] = {
 	{ .cache = REGCACHE_FLAT,   .from_reg = 0 },
 	{ .cache = REGCACHE_FLAT,   .from_reg = 0, .fast_io = true },
@@ -248,6 +258,37 @@ static bool reg_5_false(struct device *dev, unsigned int reg)
 	return reg != (param->from_reg + 5);
 }
 
+static unsigned int reg_default_expected(unsigned int reg)
+{
+	return 0x5a5a0000 | (reg & 0xffff);
+}
+
+static int reg_default_test_cb(struct device *dev, unsigned int reg,
+			       unsigned int *def)
+{
+	struct kunit *test = dev_get_drvdata(dev);
+	struct regmap_test_priv *priv = test->priv;
+
+	if (priv && priv->reg_default_called && reg <= priv->reg_default_max)
+		priv->reg_default_called[reg] = true;
+
+	*def = reg_default_expected(reg);
+	return 0;
+}
+
+static void expect_reg_default_value(struct kunit *test, struct regmap *map,
+				     struct regmap_ram_data *data,
+				     struct regmap_test_priv *priv,
+				     unsigned int reg)
+{
+	unsigned int val;
+
+	KUNIT_EXPECT_TRUE(test, priv->reg_default_called[reg]);
+	KUNIT_EXPECT_EQ(test, 0, regmap_read(map, reg, &val));
+	KUNIT_EXPECT_EQ(test, reg_default_expected(reg), val);
+	KUNIT_EXPECT_FALSE(test, data->read[reg]);
+}
+
 static void basic_read_write(struct kunit *test)
 {
 	struct regmap *map;
@@ -628,6 +669,54 @@ static void reg_defaults(struct kunit *test)
 		KUNIT_EXPECT_EQ(test, config.cache_type == REGCACHE_NONE, data->read[i]);
 }
 
+static void reg_default_callback_populates_flat_cache(struct kunit *test)
+{
+	const struct regmap_test_param *param = test->param_value;
+	struct regmap_test_priv *priv = test->priv;
+	struct regmap *map;
+	struct regmap_config config;
+	struct regmap_ram_data *data;
+	unsigned int reg, val;
+	unsigned int defaults_end;
+
+	config = test_regmap_config;
+	config.num_reg_defaults = 3;
+	config.max_register = param->from_reg + BLOCK_TEST_SIZE - 1;
+	config.reg_default_cb = reg_default_test_cb;
+
+	priv->reg_default_max = config.max_register;
+	priv->reg_default_called = kunit_kcalloc(test, config.max_register + 1,
+						 sizeof(*priv->reg_default_called),
+						 GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, priv->reg_default_called);
+
+	map = gen_regmap(test, &config, &data);
+	KUNIT_ASSERT_FALSE(test, IS_ERR(map));
+	if (IS_ERR(map))
+		return;
+
+	for (reg = 0; reg <= config.max_register; reg++)
+		data->read[reg] = false;
+
+	defaults_end = param->from_reg + config.num_reg_defaults - 1;
+
+	for (reg = param->from_reg; reg <= defaults_end; reg++) {
+		KUNIT_EXPECT_FALSE(test, priv->reg_default_called[reg]);
+		KUNIT_EXPECT_EQ(test, 0, regmap_read(map, reg, &val));
+		KUNIT_EXPECT_EQ(test, data->vals[reg], val);
+		KUNIT_EXPECT_FALSE(test, data->read[reg]);
+	}
+
+	if (param->from_reg > 0)
+		expect_reg_default_value(test, map, data, priv, 0);
+
+	if (defaults_end + 1 <= config.max_register)
+		expect_reg_default_value(test, map, data, priv, defaults_end + 1);
+
+	if (config.max_register > defaults_end + 1)
+		expect_reg_default_value(test, map, data, priv, config.max_register);
+}
+
 static void reg_defaults_read_dev(struct kunit *test)
 {
 	struct regmap *map;
@@ -2058,6 +2147,8 @@ static struct kunit_case regmap_test_cases[] = {
 	KUNIT_CASE_PARAM(write_readonly, regcache_types_gen_params),
 	KUNIT_CASE_PARAM(read_writeonly, regcache_types_gen_params),
 	KUNIT_CASE_PARAM(reg_defaults, regcache_types_gen_params),
+	KUNIT_CASE_PARAM(reg_default_callback_populates_flat_cache,
+			 flat_cache_types_gen_params),
 	KUNIT_CASE_PARAM(reg_defaults_read_dev, regcache_types_gen_params),
 	KUNIT_CASE_PARAM(register_patch, regcache_types_gen_params),
 	KUNIT_CASE_PARAM(stride, regcache_types_gen_params),
-- 
2.34.1

