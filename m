Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792622769;
	b=mRlH/2WzT6EcY4azAuDSmkPCSwKS6F7dp+GEBp9EzFKtiA/3AlAMZTBBy8BcbAHAv9nS
	 lK30vDZZ/Tsrou85YZnYIg/rc4gjNfCvBGCX+IHl7pZzLV9WJ4Ldc/ofycEnA7MayqPaN
	 LTCvhxqZpMyCCNQ51kJJyigpERtDIygezUFq2AHlSQTXgQEpEu56Zvf4fKyZgFB8MBnYJ
	 5HJQ9NXepysxT2aUghbXHkoDj+heAOz1jhUvz+b9pJbg9/6Q6MX6uZhKObiPT5tXN8lOn
	 2PWp9HFxjmyhzld9FPdXTPVpJV6qIJxrSO3yfjDfGO2OWt18XK+FZYGFJDRpENnOOMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622769;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=uCxFE7mQh1Mj4RjmJI6/oYXWFGUw7CaPwGoSr/xMvWA=;
	b=3UidvsafViVkF8Osl13XZjk6x1CTcl2k7u1XJ8Xi7uAl4r8S718ECU34UAIaXl1lNiFX
	 OUxtn9KoLglzGH5njKUVdn2AbDX16FSxCVEXUXJtyocStgD6EA0J5QkIFMIglusyhqd3X
	 gup89s02oHV6m3ZhunmkDO6sK84CFqVIQT0B+qXd5ux/fCJE/7vm+rBUMkrgeRCegK43N
	 Vs07EI/6B42pkKuthkU7yyEGTGseF+TsOzHxDNWkB0eSatyz0qWGEg0CUUHzd6UrzDMaI
	 bT73IWpTYhGLgpWD1BHKXOEuZUpJgrwc2qJ/nH43v9bXFV60rlRgyHrEeMFx7+UFCWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GBuNgaXv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.60
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012060.outbound.protection.outlook.com [52.101.43.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F49606A31E;
	Wed, 21 Oct 2026 22:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30F49606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GBuNgaXv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3ZeAp6LpezUeIF5Dh6YzPT7vRqcdQqy8QKOCEg54cGsUj9rW4EDYtSCYZpjPW+b6MKi2Dy//QzEqeZSDeG1KvIHw///nKU09JhMqzPMT5zUmjPXerZHjUmdItroeLzuO8nDsmdDCW0bGD58w+MYDOjDG631xcLp3o8kY8KXgpPKMi7bwOsNsMVZ57DOLhA9btGP+4F6qFWSbq9Q/CXRr4wuwRRLKNXh4AsDvltghgi/gDNqyDMpjJ5WfFN6TWQQqqcQj+wcA4lcS/RekOljcCnEkpakEb71ut78YDqs8NHNltXk5HjwQyf1PZyZuFPOphGS2h71Dnu3+gXue88IPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCxFE7mQh1Mj4RjmJI6/oYXWFGUw7CaPwGoSr/xMvWA=;
 b=GHD9dJ5DuTKwEoL9wUDFdvX+8IxCUmREQoqkMKdyL7fVsgLlyApqaGLXRv3DDaYZ4U/15dDiPbluIvm6RYJtWownECjfubv3RdTnM/9cC6r31J8Exidya3tMdX8shr5XiczdikEOrco1QFFeBZmQ6lTnXH8byz/XrKHWgpTJOX0pcA4+5fFx6y5oIxTfxj2jkM9K0qsIziRGhWteDR1ENGqsBWhJRfWSacANDKXt/m9Q0OWNp7tjOT1DpNCTnrkE011J2aZ96tjVYGrxKCjdrI7kSJCuMl52RoeAjmSUJB4dy0gU8Dxz/3bTe3DolB35NzZokPd7DA2F8gy9oHR1jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCxFE7mQh1Mj4RjmJI6/oYXWFGUw7CaPwGoSr/xMvWA=;
 b=GBuNgaXva2NxOPCVisC3ddhzbA6Oc9WOBgxyV/T1Gw6qbWfv+loEX2EA21GeDVEfxc0DlW04t5EE/65rggXOTHR+Er93u3mfw+I2IrFykpUarsLKGSZKkYWMx5y877xbsK+U/r33xoQ1sk5bquBVeNkl09rrZ9OSZGT0QcF+yCEn7eyD2GQ1q28K4itWW2BA2d6dgoIKwr7JhbPLM/yBFww4nZjHSZJAbwgHe444IvgZtckR/ZY65V3ur4TgJ54pXA0DmiWm/q0/yeq4OXQ1YDo6BvtS/DW8l+F5i2zscHZqEZ7hsa55Veweq+ReS5EVysBncZUrf1h9vpOS03s42Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LY0PR12MB727857.namprd12.prod.outlook.com
 (2603:10b6:408:3ba::5) by BN7PPF39B20C1D8.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 22:46:06 +0000
Received: from LY0PR12MB727857.namprd12.prod.outlook.com
 ([fe80::843e:82cd:41ca:f522]) by LY0PR12MB727857.namprd12.prod.outlook.com
 ([fe80::843e:82cd:41ca:f522%5]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 22:46:06 +0000
From: Srirangan Madhavan <smadhavan@nvidia.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	conor@kernel.org,
	jic23@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	andre.przywara@arm.com,
	aneesh.kumar@kernel.org,
	Souvik.Chakravarty@arm.com,
	treding@nvidia.com,
	jonathanh@nvidia.com,
	bence.csokas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Srirangan Madhavan <smadhavan@nvidia.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v5 2/2] cache: add SMCCC-backed cache invalidate provider
Date: Wed, 21 Oct 2026 22:45:57 +0000
Message-ID: <20261021224557.1827361-3-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021224557.1827361-1-smadhavan@nvidia.com>
References: <20261021224557.1827361-1-smadhavan@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::13) To LY0PR12MB727857.namprd12.prod.outlook.com
 (2603:10b6:408:3ba::5)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR12MB727857:EE_|BN7PPF39B20C1D8:EE_
X-MS-Office365-Filtering-Correlation-Id: 70bfbad0-50d2-4f6e-1717-08df2fc51802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|261021121427099003|56012099006|5023799004|261009223027099003|11063799006|18002099003|261021123027099003|6133799003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	JrfT7vfz9tdRtoozdHHcABQPBiagWjBO2ONOW5iIwSmJt1vqWCNGG6/HHTlglOmwHy5xxQc2GY3++MTsQPUYpfEOKMYFo1mNHjqzPeGJTm/fpsyb6g9UhTMek7XrJ4J7OLnGzJTmvuY93wCxdjvwL67EV6wdCZUEcMSHYWBKT/6zRd5Lmh4GTTRdMJTBnt24rBysR3SEybA79+JKV7ZBhyHmT/+kpunrmUqlCH9WuUtJZieIT/J/U5LFlX5t5OQP/bElQ/VPOy/Bq3Hq09Vyq8zy7TlOmZ9mIkTWIZ+4oNhxJkCdivj48OZamupe4MQZeYQMCrlf8D6EVcitG/IRx3rbOJjIW0/7h5Kw3B44lSaFxMIzcT8iOl9gyznzoBYXqfmI2kAkE+8R/wS748wQ2sXlWUxffg927kDv7XPIdcFjmOqJmdauaj3Dvxj86ERyIdq0YzC84iQopHh4KjPJ7SjKbzFBPfNngNMpUTZoutJriZcMmtM1kYnwsmQ+fKXA93+yi7JuHQtRh9ZKX19ySOpmbxa7lz2K2s/FO3CkEqDUc7IbQEHMSCsl5Oe1eYcI6d2UARjXojfJNXHGXFatwphpSZfH2rsGWj2j7jeAaGb3d72QC0oOQTP69QmTUhOCOh5rExlKgjkl27uerI7+XSXpeeuoVIxxU/Qns2DzSpQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LY0PR12MB727857.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(261021121427099003)(56012099006)(5023799004)(261009223027099003)(11063799006)(18002099003)(261021123027099003)(6133799003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?03jbOzNG18WGKTL5OBwkmv6QeUw6MoiFnFjcljmZYoQWRuxmHSsdZ0x682no?=
 =?us-ascii?Q?rRedinpSSzwTkMN5Zrqxy0sg9bSwa8QHDm8WrQKhtAWoEd696oHuZnx5TXW/?=
 =?us-ascii?Q?0TOwGDFUMuoHSiXvu5YV4eu3wUFx4Oe4rUnTG3ZcYmBySb16aCbT+vvX03dw?=
 =?us-ascii?Q?HUpa7S44lwZHdfQO5u4PkIP9PDZihz2CYwrml/aycRTuIuDQL2rBNfdSdN4s?=
 =?us-ascii?Q?/P69e2TYIa3fzip4fFeitnhJPus3jTyEwmjmhi0Z3JzZQ49hkyzMmYWHJzyS?=
 =?us-ascii?Q?9LRxy1rj1vnLO3FxtVcL9qvw6kp2v5/YuCvFzpwcN7P3HjoDybjiXMIiy8gS?=
 =?us-ascii?Q?YlGWNh3dbOD8ItJRSyxjiVUMM9md+1nTLor7Ho1Hhmj3Apb/67Srak5NLug7?=
 =?us-ascii?Q?X4Gwop/rufn1/SC/ZlxBYcUh+mtq29AlPLhdVplptkVRd6UEWrgBrcuVJD3g?=
 =?us-ascii?Q?B+MnKJ2GdL5u5yOxk6kpbYTz68RrR8Cq6dxe+yoU8KlcUTDNLifAXQjwQjfU?=
 =?us-ascii?Q?P9y5zGFOGbZyB0eQCde0F92FS2wi6gt4q8RChVnp8JciIHCYSuXepsXcdVZf?=
 =?us-ascii?Q?EO48Y5wuUjP7s7VD6JZ8nMLIj9c5x429xb3BDd74ypvbc27FEJg21CocutZi?=
 =?us-ascii?Q?YKl8sG5QY2WFUgD53KIcyslqxL+lfKI0t+eR8NuP7sA5S6kjzmgKINsNhCaF?=
 =?us-ascii?Q?xzqNU/5EW6zv40hhVrmj12r6lX3VXRNH17Lpnztn6xQ2LRu9x/uAgSe+PnRu?=
 =?us-ascii?Q?yuRzXMjnO8rjMDNrORY+6vWKfX5EtFx/etHhg2ZxhPBeFAHJlU3/wx6FTGEX?=
 =?us-ascii?Q?TRx7VNQwwhMNr7oPiZM/BXTw9pk+I7xG5c9qKhlFJtx6BK/DNiCsPmcJnDhA?=
 =?us-ascii?Q?1e4ECf9Y+RyDRdGkarOdMDf3UZRgH4qQv1RkXaMBHV+355hfutdCAkZJ8ZtQ?=
 =?us-ascii?Q?K73Yn3VguWxnb5xByWZmEIUTfvZDDpBUs5PZ9eSDOfXTe4HcJ4CmXkC5CCbW?=
 =?us-ascii?Q?LOFBazNfYO9aKRn3UemF/kKGE9Qlat3TEvEy/4B+mHTadZDj7t+4dFxuB0b/?=
 =?us-ascii?Q?VlbsInypD/G7nCy0SN9ZKtD2+04vHWBJ8Cc8V3sQ3wTtpMzCe4hYHoRqOyps?=
 =?us-ascii?Q?hoyQuficrwuqfbzfjEGVzcgnwMKh3pw8Jd4oeVMwt46FSmyHKmr6o6BZKVpx?=
 =?us-ascii?Q?5bRcWnj7vS57FB0MJO2s+DbWlC4uQKXHUvOOWtHn4r6XcG+mJ6Z5s4MyGRTO?=
 =?us-ascii?Q?U+y5d5PSoAvyoEhGbRHW1Zu6Y1fRY4RU2z7ZkpQV87nrqEP+SuIRUQODxJ8p?=
 =?us-ascii?Q?xHp4size3fgsM+kgf797Z3R5++ufp1Rf8XN2piUsqWYE+MyqvKYnx40dori0?=
 =?us-ascii?Q?jxSD8ljM4xbf3vOpdKQemehMaVr6fXq09tCfdh1zZZsWS+7joId9wKfc+yuk?=
 =?us-ascii?Q?iWSzkOx55sUKjmzY8/AwqftUL3UH/VgBYujDY4JzKHJgg6pu47aGRiQ1aT5H?=
 =?us-ascii?Q?hJHVfAX9Hs1OCHism2iWM+/SQ0hCJP6qmY8JaZWlupCB1Rr48dns2Zw/TA7p?=
 =?us-ascii?Q?GAPXZ/q1z1BQqvRcJw85DL28CYOxxrBWdoumcohsx5PE0Ws/rUl1KHrsC2Km?=
 =?us-ascii?Q?U37pGHd4h5XTpsgkZrWUe2/ffvvUpIz633XI5b5Fwjkf7Q0dbifIxBSPAzds?=
 =?us-ascii?Q?9UlHX6LLmfQxe/edIcvFjx7wvSh91FpZgn9pALfOe5Hyc1De+ufyd7DEBKmq?=
 =?us-ascii?Q?VGBHpMKKHQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70bfbad0-50d2-4f6e-1717-08df2fc51802
X-MS-Exchange-CrossTenant-AuthSource: LY0PR12MB727857.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 22:46:06.8472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCPY01BiAlG+urmlu/+H3t2gV/XOt0j6immB+rIIPjGq253WFxKDS+Od2VW4UcnIK580kWgSJv3Zqr7YVZF4Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF39B20C1D8

Add a cache maintenance provider for the cache clean+invalidate interface
defined by Arm DEN0028 v1.7.

Register the interface attributes function as an SMCCC device and bind the
provider through the SMCCC bus. The provider reads the firmware attributes
during probe and serializes cache maintenance calls. It handles transient
BUSY and RATE_LIMITED responses with bounded retries. It also registers
with the generic cache coherency framework used by memregion callers.

Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/cache/Kconfig           |  11 +++
 drivers/cache/Makefile          |   2 +
 drivers/cache/arm_smccc_cache.c | 156 ++++++++++++++++++++++++++++++++
 drivers/firmware/smccc/smccc.c  |   5 +
 4 files changed, 174 insertions(+)
 create mode 100644 drivers/cache/arm_smccc_cache.c

diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index 1518449d47b5..57fd1823dec5 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -42,6 +42,17 @@ menuconfig CACHEMAINT_FOR_HOTPLUG
 
 if CACHEMAINT_FOR_HOTPLUG
 
+config ARM_SMCCC_CACHE
+	bool "Arm SMCCC cache maintenance provider"
+	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
+	help
+	  Enable support for the Arm SMCCC cache clean+invalidate
+	  interface as a provider for memory hotplug-like cache
+	  maintenance operations.
+	  The provider registers only when firmware advertises the
+	  SMCCC calls and attributes, so systems without firmware support
+	  continue without this registered provider.
+
 config HISI_SOC_HHA
 	tristate "HiSilicon Hydra Home Agent (HHA) device driver"
 	depends on (ARM64 && ACPI) || COMPILE_TEST
diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
index b3362b15d6c1..55736a032d6f 100644
--- a/drivers/cache/Makefile
+++ b/drivers/cache/Makefile
@@ -4,4 +4,6 @@ obj-$(CONFIG_AX45MP_L2_CACHE)		+= ax45mp_cache.o
 obj-$(CONFIG_SIFIVE_CCACHE)		+= sifive_ccache.o
 obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+= starfive_starlink_cache.o
 
+# Providers below depend on CACHEMAINT_FOR_HOTPLUG.
+obj-$(CONFIG_ARM_SMCCC_CACHE)		+= arm_smccc_cache.o
 obj-$(CONFIG_HISI_SOC_HHA)		+= hisi_soc_hha.o
diff --git a/drivers/cache/arm_smccc_cache.c b/drivers/cache/arm_smccc_cache.c
new file mode 100644
index 000000000000..abe6881f3de3
--- /dev/null
+++ b/drivers/cache/arm_smccc_cache.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 NVIDIA Corporation
+ *
+ * Arm SMCCC cache maintenance provider using the cache clean+invalidate
+ * interface defined by Arm DEN0028 v1.7.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/arm-smccc-bus.h>
+#include <linux/cache_coherency.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/math.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nmi.h>
+#include <linux/time64.h>
+#include <linux/types.h>
+
+#define SMCCC_CACHE_MAX_RETRIES		5
+#define SMCCC_CACHE_DEFAULT_DELAY_US	1000UL
+#define SMCCC_CACHE_MAX_DELAY_US	20000UL
+
+struct smccc_cache {
+	/* Must be first member */
+	struct cache_coherency_ops_inst cci;
+	struct mutex lock; /* Serializes SMCCC cache maintenance calls. */
+	u64 rate_limit;
+};
+
+static int smccc_cache_status_to_errno(s32 status)
+{
+	switch (status) {
+	case SMCCC_RET_SUCCESS:
+		return 0;
+	case SMCCC_RET_NOT_SUPPORTED:
+		return -EOPNOTSUPP;
+	case SMCCC_RET_INVALID_PARAMETER:
+		return -EINVAL;
+	case SMCCC_RET_RATE_LIMITED:
+		return -EAGAIN;
+	case SMCCC_RET_BUSY:
+		return -EBUSY;
+	default:
+		return -EIO;
+	}
+}
+
+static unsigned long smccc_cache_delay_us(const struct smccc_cache *cache)
+{
+	unsigned long delay_us = 0;
+
+	if (cache->rate_limit)
+		delay_us = DIV_ROUND_UP_ULL(USEC_PER_SEC, cache->rate_limit);
+
+	/*
+	 * Firmware may not advertise a rate limit; use a small bounded backoff
+	 * instead of retrying in a tight loop.
+	 */
+	if (!delay_us)
+		delay_us = SMCCC_CACHE_DEFAULT_DELAY_US;
+
+	return min(delay_us, SMCCC_CACHE_MAX_DELAY_US);
+}
+
+static int smccc_cache_wbinv(struct cache_coherency_ops_inst *cci,
+			     struct cc_inval_params *invp)
+{
+	struct smccc_cache *cache = container_of(cci, struct smccc_cache, cci);
+	unsigned long delay_us = smccc_cache_delay_us(cache);
+	struct arm_smccc_res res = {};
+	int ret;
+
+	if (!invp->size)
+		return -EINVAL;
+
+	/*
+	 * Serialize the full retry sequence. With the default bounds, a caller
+	 * may hold the mutex across up to five 20ms backoff sleeps.
+	 */
+	guard(mutex)(&cache->lock);
+
+	for (unsigned int i = 0; i < SMCCC_CACHE_MAX_RETRIES; i++) {
+		/* Long firmware operations can trigger watchdog checks. */
+		touch_nmi_watchdog();
+
+		arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION,
+				     invp->addr, invp->size, 0UL, &res);
+
+		ret = smccc_cache_status_to_errno((s32)res.a0);
+		if (!ret)
+			return 0;
+
+		if (ret != -EBUSY && ret != -EAGAIN)
+			return ret;
+
+		fsleep(delay_us);
+	}
+
+	return ret;
+}
+
+static const struct cache_coherency_ops smccc_cache_ops = {
+	.wbinv = smccc_cache_wbinv,
+};
+
+static int smccc_cache_probe(struct arm_smccc_device *sdev)
+{
+	struct arm_smccc_res res = {};
+	struct smccc_cache *cache;
+	int ret;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES,
+			     &res);
+	if ((s32)res.a0)
+		return -ENODEV;
+
+	cache = cache_coherency_ops_instance_alloc(&smccc_cache_ops,
+						   struct smccc_cache, cci);
+	if (!cache)
+		return -ENOMEM;
+
+	mutex_init(&cache->lock);
+	cache->rate_limit = res.a3;
+
+	ret = cache_coherency_ops_instance_register(&cache->cci);
+	if (ret) {
+		mutex_destroy(&cache->lock);
+		cache_coherency_ops_instance_put(&cache->cci);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct arm_smccc_device_id smccc_cache_id_table[] = {
+	{ .func_id = ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES },
+	{}
+};
+MODULE_DEVICE_TABLE(arm_smccc, smccc_cache_id_table);
+
+static struct arm_smccc_driver smccc_cache_driver = {
+	.name = KBUILD_MODNAME,
+	.probe = smccc_cache_probe,
+	.id_table = smccc_cache_id_table,
+};
+module_arm_smccc_driver(smccc_cache_driver);
+
+MODULE_IMPORT_NS("CACHE_COHERENCY");
+MODULE_AUTHOR("Srirangan Madhavan");
+MODULE_DESCRIPTION("Arm SMCCC cache maintenance provider");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index 5dc768ac4143..5a5d50d17410 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -100,6 +100,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
 		.requires_smc   = true,
 		.device_name    = "arm-rsi",
 	},
+	{
+		.func_id        = ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES,
+		.requires_smc   = false,
+		.device_name    = "arm-smccc-cache",
+	},
 };
 
 static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
-- 
2.43.0

