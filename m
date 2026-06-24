Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012033.outbound.protection.outlook.com [40.107.209.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ADA248F72;
	Wed, 24 Jun 2026 10:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296705; cv=fail; b=DH67U5q1yEeKFJEbwuuRbinXKfP4LmQ1cIYtCfqUx5Kb5V13UngjSPJxaxxnd4ve+oZCnW7yI+vNUnt+lrX6Y+TydC/pIr2FXSZtYUvo9b6QM+C3JbmyUxg1NaEVOYAh+OAKr+hFXd01Urzo60lzPo+50KuPOhH4uNwjpBXLn/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296705; c=relaxed/simple;
	bh=H5JkWApYKDnXldT4KwVhsSi5iKUHPCqxJGC8X2ny9S8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qEMNV9znFi7RTb27ye1QswLouvrTt6IZH8xGQpEPfJoXpw7f9myBKPoNLG2k6fkjNqakej5pYiXNagYCs4sIuM4hRjwmo3HLtI2SYr7+KQtnd0rKPgCOiyYyz0zx8p3/wIS9llRYXoUmiQ7G/u4vtmVpMfT2q+hcLAd/omj22/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W4a2K8tt; arc=fail smtp.client-ip=40.107.209.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W4a2K8tt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMfrtcI2z9RGkiMfbj1M5qy2KMKVNvSimZadGWLuWyAudW5vOMD2YdE0pleCMvbYhIICleB591REWxIqxrA51nTxCsMA2VmMaWJko5ltEuhYLUv6eKXq/u+aK47RJZXyVJcZm7RgXSbLALKPTwVZkn6gEhJK1wICBqNhJzR6B5jlYGRz+d4BBAm45L3KsdkZ26p3iJHCMaj28KTxpTsr5ySIvagHr/Ll6eKP5yE+adzfegs7szSZCiBXlWC6iwog5MAJCZ++t1YO+S28rBaljtKVIBtJqEyYbGqBMpUkNlG+d+HbPmIQt/kItQWgdSVoBletWF2243xxs04BUeZVag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeSRTK/Poczz+CYtJpBOFiHy1EowJp3dR3tgxJDLunM=;
 b=SSqYiccU+Gq7QoG2yXK3Z1JsAKIBtQomsDjTi1cMfAKv1xDPQMZNfCZH3FA4KQCDrha0c9zI3gc7uBHrfdXXlgxkkgp2DFVAOtJUTFZgkZksBicwiBkmlM+ucxcXoAAfJZ9UYQAK5P2s0ms3g6KU/Q3Sct3LNGkz89oAyGlvjXYLVM0EKlg1+VGeUHS8pMHJsdBz87yYPtuuWXagzAR7grsvUy6ChEH1S7IUHdTn7kcnWr32UpEDGRAO10QPGKfSt4HX0Vr43PsOxZChkvQpl+Ms2i7ztWJ3SaoU0bnr4SDt2CGXHzrZIzw3ClK9GnrOh0L4wpBegkUvFBhNHAyzmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeSRTK/Poczz+CYtJpBOFiHy1EowJp3dR3tgxJDLunM=;
 b=W4a2K8tt1+7UoirOyAfAuogqktCnQI+ZL5Jw13D5rdy2FzUiRD99HcyJ4/FmopFIH8p0mOFO7VKOoCyotIXkyTVHcc4tOwHQZaSVMI0IZtWmSAOWkdZY9jI8ouHBU3v7PEcFsw18Jau/jnxVYKZrP+yAxuLxSrKICbqEuoEcszTakLn9wYZ2xYtQZ1gPn+DQdp/cgfnkDZZ/sbeCnNH4/v8TgZ+IAcqpkQzXBpG5OwnVn9Jj9ZWoqz/HFLsSFO+AFvt5wzbTrkbzW8W+gSx8PVx9o8JMDVKjTnPec8IneDLtDB9NjKWUu5QQCUrp2xGRqyNJudzpVKsLApk0WHSY4A==
Received: from SA0PR11CA0141.namprd11.prod.outlook.com (2603:10b6:806:131::26)
 by DS7PR12MB6007.namprd12.prod.outlook.com (2603:10b6:8:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 10:24:57 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:806:131:cafe::63) by SA0PR11CA0141.outlook.office365.com
 (2603:10b6:806:131::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 10:24:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 10:24:56 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:24:42 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:24:41 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 24 Jun 2026 03:24:36 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v5 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Date: Wed, 24 Jun 2026 10:21:06 +0000
Message-ID: <20260624102153.1770072-13-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|DS7PR12MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b41724b-d6a0-4131-79ab-08ded1dad6ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|7416014|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8HtfSAqyG/xHYICvxl4Ioz62XuILLnu5GAs73cNrmYjKzMqrKd6VzFY9C9JbupmJl/Bosmlm6jJXCpekYt9rdGh08Cp5sn/JESfvlIQAbBD/sy2Qo7YKN/2QOUWClN85QKrbFgFwU2GV55l8PFiFE2qtyWR84dwvkS1fWtAN1ZgnBV0eDJzP8vARvxL7akp6BuxLnrMXXLVTnVWYPBXsN+0V/o7TaXkZICp9P0wy/lYPa+JVzgUDkJTkB+b1ZjIFqzd5H9ed5tHJtQ/K41jeuylzKNlJJET7MVUeLR5KWQICcqr0re9eueVGD+6Iw01xEB8rpuuUoxqNgDgIGgwazMMWfm7kweVFBiNVKbIdQrBa+kOWmaPkTLg8oAzA3FdeixgoewNeqElR++OZMaEE6r39cuhnQOGzWOxr/GyExJPlcKIe0+ua3Pk6Hk/aWszmGMziZz2Ami2m4u8ajinybJfxASYWFUJkpr5iqd7b9RsENZfL1i6OtNTDKpqsuYLHyytMy27N1s7n0ZDe5DJRDwAZZvmJ+ZaTTgYcuFmHBRVBHlFV8SP6GnO3fCCkKGfAkAnPXt/nH4EyszgDGJlXsXsRn/yBVMpSjwqzkC5Ej5ajRE9wEDLY2ZwvCzi9/3Sut4XSFmfSFsMsj4AWpQWQc/0otWlUQpFric+UD4SgFDrH3jpcRmrTEJoakDkfQMcguWkxJcXMLvvEQ9iMHEjGgA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(7416014)(376014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HBf6LLa0I4JzNxbXYeKnTmCUXEYxHIza+b6Zk5La+2bIZtwHbhE/JMGVesD2+3CFNSiVK+S/0nGRgDqj8re2wSTCE2JEITkzLtNyCnV3FWlYxdFZZ+RJK1/YGulmqoHf7r/2M+jbAIwBTIPk7YSOqsi57uLdBSivPHG4OAnnk+K+xL/hvN4fvjNPXSYsGxIsEsOtNtd0GhleLyofSFS8epi2JTwXEzOWMpo28Tj1Z6MNx8evD+8P9ZisZFiwgS+5rcfeCMElxH9vt2C49a+PoZT0xVWQfcE4BncsNoY5kBIh9PV7CAIpBeLJ647U1wY4oYB/yzidbwKdUM0Ol7Kug2+inMheJkJzPBFyMzyIw9PZO2Gl24J1MdPdrHN8ByXJJZ9IlDT94EzImQfrFlhsTSqlDiDyfiu4JhLLjk303MyW1pTOf73Sqf6Q1dIMK+Pr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:24:56.7342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b41724b-d6a0-4131-79ab-08ded1dad6ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6007

Enable I3C subsystem (I3C), Synopsys DesignWare I3C master controller
(DW_I3C_MASTER), and SPD5118 hwmon temperature sensor (SENSORS_SPD5118)
as modules.

The NVIDIA Vera CPU uses SOCAMM LPDDR5X memory module, which contains
SPD5118 (JEDEC JESD300) compliant temperature sensor. This sensor is
accessible over the I3C bus through the DesignWare I3C controller present
on the SoC. Enabling these configs allows monitoring memory module
temperatures on platforms such as Vera Rubin. Vera is an ACPI-based
platform and does not use device tree.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e6ae93e533..65d9eb56e978 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -640,6 +640,8 @@ CONFIG_I2C_UNIPHIER_F=y
 CONFIG_I2C_XILINX=m
 CONFIG_I2C_RCAR=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
+CONFIG_I3C=m
+CONFIG_DW_I3C_MASTER=m
 CONFIG_SPI=y
 CONFIG_SPI_APPLE=m
 CONFIG_SPI_ARMADA_3700=y
@@ -769,6 +771,7 @@ CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_AMC6821=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_SENSORS_SPD5118=m
 CONFIG_SENSORS_TMP102=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
-- 
2.43.0

