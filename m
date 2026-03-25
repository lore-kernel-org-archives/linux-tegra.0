Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012023.outbound.protection.outlook.com [52.101.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192D2350A33
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466808; cv=fail; b=n+GmaDevz0oE+Je9F2+6ogWAPcd6WyAuS1nvagu9trPKCIbJbWUjd+TPz9Nsc+79lU+Wh73JHaRrxiEwIITIhmSZio9ViiNBgfM7c0+Dltx2K8YYKsaJAExTPrp6q4BBs2XJ9QAFtRyzc3qW+vSmifpV2bhAQv8k23oLA8Jlghc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466808; c=relaxed/simple;
	bh=RtPM0Jeyq1QK75qI0P9KFfQ5hHhwV4/TnH1nX8Qbup4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fYPVpn53+dzGUbnJVwnvtcVqBWwXJq6p7DzJZ2/7u5VjDVw/9h/rF9l2fMhh0avkmsdAznujK8PHLl09xhGAfaudVJh1xZBHFxcyq4DoukbY8DOjMhCQyZiA0j9GU2nzzdwbe5GD/v+Pywcv0cYa28GUPakWIqWCUK4w/ef+POs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RzgK2hFJ; arc=fail smtp.client-ip=52.101.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RzgK2hFJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vkh9YRjgZYaLupLa5BgYHFs8upYTDokES5VMIVJEwT6MuDJnGw3t5n15lP6bmB8Q9ZgySBiiB3KL2V+ZqGd1Sp2ItvL39S0Az9/J8rllLbw5kPhZOhvtosn92LOvGewJtjbvZx/tyDsD5BfOAvczWrrABu1jUUv54KUS2WlI65i7B5ewb+/BHYOA9CiCSqznRaDG3dEKjtY+lU6eWtsFSKyB8aRc2MSc5xvnWfl7+tO/+vlC8n+G/+vedRRjCt/T+bAUZwJpRlXyXFFfQZEiCa8/8oVxRf/cFtoyyDKCWWttsHGEk26Laa4ILiVEc5RO9NYKbWP7dbUEquGIIwE3dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK+idk38JmAme0braYNnzMcfpm30rmALxdRfpdFc1MY=;
 b=LUsuxB9n0jRNeW1chMlXPw6boRkHEQKbcCl7VjJBgeljUh85eGVXAZIXdTh2rth6uQW9xK9lgiLxJA1MzEA3MGAyLjtw5iVP/FjMH0ZKtLjoy0WBwZ34dBYhhujGH5+cmYOLWeDD/c7MnMEIa9Hv68dv9LVR8z5lAtSoqpGdPQi527ArR9jyTDWqiWE1tVLmG/wJbuN6h6lJGeAp6xoxJp7nHbplT6RZsp6LB9JGr742YORuIxs39cnACuAiUpkW/LxY7RYn9FFfCIV6c2CI+Zx/xU2Payr2y5HrPUyKMSJ6hXimZYR65R4qa925AW+/V0SiRxSmoKQWD7orIBfdqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK+idk38JmAme0braYNnzMcfpm30rmALxdRfpdFc1MY=;
 b=RzgK2hFJWNIDQpA6xSOucmdJDUnNFJwO/v61SuJNnz8HLjy1x12cKNm+2Cjty3BUEizjP3YpsYqbtzYX3i42buBxAQaUOO0kz7jcL/06OzE/7Dxf/L6zrg+ijNwWusQaJRDsuFBftZOiSPyJn7ZKSYqkYtDOE2Gqbiu63vO+8OAj8llmTxfxHKlJDzRBE1AhVWbz98AKOEMFBoXz0v/N8ftQoTO3jKQzyTq737Uqz06pVvGIcAjW9K5RkTdT1P71zQzAN4slVnu3v29M9Cq5BcjOGlOyQyVEjEBHnEawpKpST9CCz2oYZQGEM3ipmNaxi/Jb8tmsB8qNWpJ8XLfD4Q==
Received: from SJ0PR13CA0057.namprd13.prod.outlook.com (2603:10b6:a03:2c2::32)
 by DS7PR12MB6238.namprd12.prod.outlook.com (2603:10b6:8:96::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 19:26:42 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::db) by SJ0PR13CA0057.outlook.office365.com
 (2603:10b6:a03:2c2::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Wed,
 25 Mar 2026 19:26:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 19:26:42 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 12:26:23 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 12:26:23 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 12:26:22 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 02/10] soc/tegra: pmc: Correct function names in kerneldoc
Date: Wed, 25 Mar 2026 19:25:52 +0000
Message-ID: <20260325192601.239554-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192601.239554-1-jonathanh@nvidia.com>
References: <20260325192601.239554-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|DS7PR12MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: abdf5034-198a-4452-e6f6-08de8aa471d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	It2dL5UqFrsS04687cn9GrM9I4IcUoLqRJsGchHOeh38+oca2de1ZH0cDXqaxDfyN3FKz1oUk13pYpibDMpER8OZNZnqXpprT00nJvBKhf/qnkrQChWW8+wJqbOxFqabeJOZEymxqWWgoUX2tRBbc/0iVmG0KVa8R4ERaVjdD9ND+BxCG0bSF9VNXsv+baNAATnTnexNJA8rJfHwCnAtePWkf7k3i1g5te3/uWujnEeqUijDB7o4KW29W2xNExssI8v4sQ1d9LUqf+Bb9sdTDQ+r68ByNoTguUealRk+7qh8Fz1w6CLjF7Bd6XicteoMJOfZ2updVhAIYbsJaKwAH0MZ5bbKuWTKofjuFkADAxZjKp0nVN44D9LMpMf+Qv+hsnGQ5CE565Hj5j/cJt2hjW2WASLIcR0oCPdeUPyEJBIsmT9uYBhJRmyf2gyPToudx0Qa5G6ctEuq+GWLyPumxG5ABoVD+uW/uFSqczdx/EgazCNIC1fqB/l2mUFeG5szOfI8SdIVWE72QJTI/zbZ34XBL916nJ1grMwBV7TmLjEUaJ0+awH16bKV8EMPhNJiY2q4sBOTGtL/MtnWPE2C4OPiTWA+4AiMqjbcEo5KT8khfGvlDtwlp64jiVXwMHn9Hx7h5qCrn11jZ73S3NhZ0UXCkq5dPmXKsQqsft7gMpcX8ZL8nlZw8y6oh9peVekiuR4qXMUeIc/4KHYWRZ6eY1Z0ahMRz9Io3KSuT88NXzChPVu5L3EoVRKbdpN3yMlih7J0sDywhLccF8dMxaDlgA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ctJTNPrXoRcvkuG7eyyX5mrE++Wh42qzILTuP0KJb9d9jo/8puKcN9sif2bbuC+/iFIviQMaG0E7ynH++a96AkUQUr/4zR64Ge6f3SDFFC5NX4UDfqhlSKwIWm2Y+gEwvvqJAw/DC88gxEDZ7htQWQKHaNLgX3Q1qx2OY8z9FDAxX5GZh+aouYiFGP4z+3dDqRR+o/IIeIJOXFjzscUCQ/6Ov0j46xyK1daTXZYBqNDcBI8flqwf06O8ZRTPiUPM/c4yk7Ur6hqdhaz12KKUhpsFERItn5dxEEsCMl1oqvyO0cJjVPX/73L5B6Tgpy+Se6jX7Ib977kQMnOx6v/i8nwHmdAwvj3WPtrBLm7mJ1dhXshxQjXNu3f5iGeFpxBqCOipENNJ4XHLzhNixzaXk63A2oUMabFOF3wzezwlbOy1xwftogiSPYK2JkOwhBHI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 19:26:42.2288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abdf5034-198a-4452-e6f6-08de8aa471d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6238

Commit 70f752ebb08c ("soc/tegra: pmc: Add PMC contextual functions")
added the functions devm_tegra_pmc_get() and
tegra_pmc_io_pad_power_enable(), but the names of the functions in the
associated kerneldoc is incorrect. Update the kerneldoc for these
functions to correct their names.

Fixes: 70f752ebb08c ("soc/tegra: pmc: Add PMC contextual functions")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 8268a41c471a..b889c44f8fdd 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1005,7 +1005,7 @@ static struct tegra_pmc *tegra_pmc_get(struct device *dev)
 }
 
 /**
- * tegra_pmc_get() - find the PMC for a given device
+ * devm_tegra_pmc_get() - find the PMC for a given device
  * @dev: device for which to find the PMC
  *
  * Returns a pointer to the PMC on success or an ERR_PTR()-encoded error code
@@ -1747,7 +1747,7 @@ static void tegra_io_pad_unprepare(struct tegra_pmc *pmc)
 }
 
 /**
- * tegra_io_pad_power_enable() - enable power to I/O pad
+ * tegra_pmc_io_pad_power_enable() - enable power to I/O pad
  * @pmc: power management controller
  * @id: Tegra I/O pad ID for which to enable power
  *
-- 
2.43.0

