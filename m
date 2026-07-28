Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013048.outbound.protection.outlook.com [40.93.201.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BD93C3429;
	Tue, 28 Jul 2026 07:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222193; cv=fail; b=MciAQ+IGdo0K1N6EbjkmKxgJulrInRh+giunoNZwipFO3fkoEOlRhvHJ0FcOCMQl7THRe5MOL/rM/+7qggR6wT34myD0YiuJJ8/CVqxP1HUqKcWuaUGNGcV+3kQFSKc4fkurmFyj8lcx8xS+s8fsYEwJm9R7PhJF3wR5RDGHJzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222193; c=relaxed/simple;
	bh=HTYSPKh/YJxO/T3i6O6HVNW2UdVAKRchrzYqqhRPUZk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T8lc0uKuChPXrPXKOxg0GK3RFhL/1iThqX5GZW5Q6KKjNO3KFoEHlWDmzJtyQdY0YcA+Csp7o0kDOXvyQkQdbQoOt2cFPZQNv1nQXQ+aht7lUnII8+ZRvUzo8Hq8PADeNnYYdqPt5CWD2ju8IaXj6q4B4quyngVHwollXI6AxdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JLAD596x; arc=fail smtp.client-ip=40.93.201.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JLAD596x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIhmPjx0VSDLm4TpJApvCOkmRzxsWZtGlnL2vNHwQturAvm6Vu+6k8pERPaHdkrSFzYRyCPUM8H1hfI/wEyg/UwcxmLMKJcH/4w+bTIhoW+SrT669RTnYx8Pxm+NeTccWYCQc+P9vF8+xV6mGMmbcm5ViAsW9k0Yv4/XL4Kl+mVPWltLa+tN3LJ6UAkF4Z0Ipwv9qQij3CPaiTm79DYs2VPB+NQ8PnU7UgAWjwiP12lyrp0xB5NNx7OoK31qgfVudiBmFwIbTfu+pwG3mS2vj0H1uU+NlfmcU3iLpHDM/IcSKUjPTRUF1FR7LCK5uRZnzD4X2vCzMG9rJZBgjhyNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqPh08Oisk3mf8bmTDDy5gMxs1iAY/8KvvgWhFxFrRw=;
 b=jC9QhynVXLYJJ4O3QkMYkGrSFkamgTZvknYt/WvU2ZAFDMuo3tDs+jen18D8AoGLOsCZGJGu/6ZCQiDQekouS2J8GRc77wB3Dxop+WKX5hNT6R0CPCwrq06O4oU/HiHEgFFFlXpN/R3DVrAx97TEMceESFlA/jopKC8S6kqBVvZSVuNUW0ZbzwQ+CSqjgcObZG4PfN1hsvCIxDTJQ5PiF3W29iuuDX21AwRkxud9k8YZKNm7rcBQvmnoubGE5NzRLjIjtzuCYi4z1rGLhEZPWlY0TFjDeOGgwrwXkQg9p86JG7eZ1V9eTUsAiWAioyK4uclSaoP7d8n5B+G83CJrxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqPh08Oisk3mf8bmTDDy5gMxs1iAY/8KvvgWhFxFrRw=;
 b=JLAD596xRdgfeDL7KZQHEB17G2hFLzebYuOgOcHh8UOc1vrSmZ6tJLTeSvjPEy6aKrhHOCIvP3dOwvki9Ee8FngTFMisnlCZPn647AsZwj0MNMdnQ+o25doiMWDLU5DxHDiweTQeChWcskDmgtq5PLKUIy354fFFEjbBcSjAAYPIfA8ps63A+iZnGnrUn9RdTWPkAhzL5PPetgUNLpWUQhmu7eorCcTthtRR7Vm7+2b9PnXLBwbMlRE4ycuVUokQ49tNCr6MSetXD3aiI3zr2oaHMKq1+eACHqlk5zhNKKvP43xqMi76xCAMcEwD/+W/VdjjWyTIDvdKkIU1T7qfxw==
Received: from MN0P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::23)
 by SA1PR12MB6995.namprd12.prod.outlook.com (2603:10b6:806:24e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:03:07 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::63) by MN0P220CA0011.outlook.office365.com
 (2603:10b6:208:52e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 07:03:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 07:03:05 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:02:49 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:02:48 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 28 Jul 2026 00:02:43 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Frank Li <frank.li@oss.nxp.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, "Jon Hunter" <jonathanh@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v7 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Date: Tue, 28 Jul 2026 06:59:54 +0000
Message-ID: <20260728065955.809445-13-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728065955.809445-1-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|SA1PR12MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c8d78d3-02c0-4707-534f-08deec7645c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|7416014|376014|36860700016|18002099003|10067099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	LLw0de5xMJFJuDUGwV3ZYqSYz9ZMy/eFA2l1Hnt7qsWAbSz3FPZxP0e3Igdutb/X+9YqlJC0bVeXHMjKkm8szgKQ5q09Frvh3qL2F1IHqQZgygWuPu0SYq/zUzlw8ew8ctnUAb859sh0a29ukS2TkoWx7RNhNR4AKzsN0TeHKji94MOtmJwJEz3KjuRHIic9kuoruqD/T1MsWkBdMoKkov+fNStg6UEvKuil7Ixbue2P4Y5+JD0dcHq+xOyAiUU20ulMqpH7xV7aMAt/b3NB8NsD2dz1aOus7JmueIPpljPfM56qp3tWBQ0cxy8GvMTDp68iEXr82gVDlNyZOKcobFdW4Co8BqqIUotCXuOsGI8Aagmw5y/Q2CbeXAp/OHm0KPv9q1Nw5VEHNgO+cuQz4a6SL9cyw1vkGs3+7tSuthdoGJAGDJfFKITo7h60HKBE1rTsSJUzUMqWZQO8te7QkhTuWheia2EJoRaNG+UKpzz06p0gwvL/7c+9TUI4tZkEohOxQnoh9bADc7v5ijhVxeBzv713uxdxDcBWcjv4R7tRMcOptVDvb9hu6cogrtKsjLtbPmLM8xvEq3BRP/qvV44kIrDza0mB2DCWjDxj/OOpf++kT8/olbMyEq9gOuozjbJl/ER3IwkUWPrpU5G/2SdUoNyCyaJWSd96DK8vHM19lr5w0Bd+3AGC1G4Q1FWCHM4p7YAsZd511Mf6ItSumA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(7416014)(376014)(36860700016)(18002099003)(10067099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GqQa0WLPf7PpW2tFti7JXyzwccDJNwSZdd7/HcfLpYA9E336/gyijgbUphZOF9gyrNROjxZsES6EZR8BUiMLw+REA7vp1i+KlXxgk2wyO+qoY6IjPRDrPMwRFGMpqz1SfIzRPrGtSqSsajtQZU6hvtOGWTkKA6wtKzr3L9dOFay7jKOZc7XOiwnX1Vf4icRsncyeiQRI1S8oUugOdR5CbRELtR9IFbWzoy5B7Ty+1+lLsSgoBlYjh4hBuwf11VgQ+He79D1RYR/4/y9BJImBwBXxctsAh6pprIbgNx8FAdFBoVEgjwyp5r6uruKPPuSgldUMj2jhROjm1NUPQFMHqvL61McH+8FZSrIydVldfwcdL5E+idJk9+mC3Z7K9VZ4s55AAitXmBpTVbztMFDTX/wR0PanH4SNbDqVeTFxzV+AGwcSMnEQi2T4hxWFlfs+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:03:05.2380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8d78d3-02c0-4707-534f-08deec7645c6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6995

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
index c267f0906460..36a7cafef3a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -639,6 +639,8 @@ CONFIG_I2C_UNIPHIER_F=y
 CONFIG_I2C_XILINX=m
 CONFIG_I2C_RCAR=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
+CONFIG_I3C=m
+CONFIG_DW_I3C_MASTER=m
 CONFIG_SPI=y
 CONFIG_SPI_APPLE=m
 CONFIG_SPI_ARMADA_3700=y
@@ -768,6 +770,7 @@ CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_AMC6821=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_SENSORS_SPD5118=m
 CONFIG_SENSORS_TMP102=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
-- 
2.43.0

