Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011027.outbound.protection.outlook.com [40.93.194.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CABF371D0F;
	Thu, 23 Apr 2026 09:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934882; cv=fail; b=TKH1sd/Le0SM03W3+Wbs+lW8MZJrQ2PXsefA561AJwgXLA3bjN5mc5GHJLUs7XKUvABpPCd0OEWD4/o/Aw+MOlZCXLsZxS/0Dnmyly04bj2/PLmqy5wzsa6MsuYPVMH2o+TzFQDcNnb6LckNyQuakIM0QXO7EH8OqM4S63vIp90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934882; c=relaxed/simple;
	bh=TNwcUhP5qfO3ev3RJPzdqYRA0vKXibsOfjiHbzcWnvs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t0uSmVrgOScKRIE2HZt/q/I+bMOuHHc3jzxXspYXc8PK8kLzZc/qkGAM++oGNqD+GBOQiA6L1GkdmSKynMXSeDYwc7c7fPXsHoreUYL8XcapYctk9rovvzbFF/P6jjDdg48iYlokj9u25thUu/VCq+UKNMbft1xeFn5TqhzBgEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O2hEvt7d; arc=fail smtp.client-ip=40.93.194.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O2hEvt7d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Skb/yu8IonPv+/3Qt0g2I3N424yvQnlWAaRtO/P92LUlx08rrr1WSRmHI5lByjvxDJPCDCHzsMaBTxb6Bz/H4y3JPvlDfuAMNI3AjEsio2y2ezYenvNibMzgW8qYRpiX2qcTFY/LuhfTUTvPRRN6sJpmF1Jq+ajmw2lo8h0FyJTY7RsayJjqUNStDxgongS+K0a4fFxMHt74U/1dIzk0rg7hBD7we6fg8joJ993pYfZKq7EP7zm5DmKo8wVOgSwAjyHxXmtTqOrhf7PWb24kNSObC3YTC3MgBX4su2Iq03hccfsiCoPbKksoTSDUauky7ZuIBzEa1wLwfZI6i7az+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGI3ilpEE38BNuKfVvcWfDpQJUuQuHhyd1Msbs63SHY=;
 b=Ty+WOAh1E4+YG+mgtdHi/ZKYGjugEeKzwM4Vszr12YGcJt77bURvgvPciUvybKSD3LSBoGokxyUkMH/yZETUh1GJtbTIi+ETE4JrLP+bOrv63GjBaq/xWBmOMb95ZQXhDh3GZ5xoWW7DmApyJQUBJTbwwlEfV1FG4fUhBNrpS7NNJjYl3obAD6fArruD1zzYhm3A+JbFd/aFeoAeQ1WODw2tBlxETv0YRshpL3WIEadDDz+m1/yx+psdFItcHGc5RsYxOfJWgoo9d8Ujybc8yUEIfrRJwZtcPyFwUSR9wgoCd6llDn6V1p4CcSujGOlzaIYo0Dr3h6L1w7B/wMeEpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGI3ilpEE38BNuKfVvcWfDpQJUuQuHhyd1Msbs63SHY=;
 b=O2hEvt7dLfFMQtfIv729+PdI2Cdnuns3PVSC5hLncGzHFXYd9J4ckpLhKq9Hsyl1fJ6NAEYJ2zfMoB2m8aotSTvItzhHLoGmAQDMRbd7PgFU0Sf2ndzPU56sQU5396U2aqRzkjrfpzshuBnTEXMmEPj+puR2XLKjgAYVI3PTyjPo94wa94Fswcho5OjGd7x6qKKrvzQNYKGvHbnc4eBixQAKKYC/sO8aZHEdlUjRW5Ka46Le04cfnPP7DE9MANZ7pKB/i//XhIIdztakhrGS8A03nKbfxOgebwA4QMO0WhBDcCoZgaGJD6AJZjiUMn0STa5wCUz7AU+Q9uay2BpSYA==
Received: from MW4PR03CA0299.namprd03.prod.outlook.com (2603:10b6:303:b5::34)
 by DM6PR12MB4235.namprd12.prod.outlook.com (2603:10b6:5:220::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 09:01:09 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:303:b5:cafe::81) by MW4PR03CA0299.outlook.office365.com
 (2603:10b6:303:b5::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 09:01:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 09:01:08 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 02:00:45 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 02:00:44 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 02:00:35 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, "Eric
 Biggers" <ebiggers@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Jon Hunter <jonathanh@nvidia.com>, "Thierry
 Reding" <treding@nvidia.com>, <linux-tegra@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<acpica-devel@lists.linux.dev>, <linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v3 13/13] arm64: defconfig: Enable I3C and SPD5118 hwmon
Date: Thu, 23 Apr 2026 14:27:12 +0530
Message-ID: <20260423085718.70762-14-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260423085718.70762-1-akhilrajeev@nvidia.com>
References: <20260423085718.70762-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|DM6PR12MB4235:EE_
X-MS-Office365-Filtering-Correlation-Id: 255f800a-d019-49e1-07ae-08dea116dc46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700016|82310400026|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rakJXFK2iMe5HG6fSEi/qCPeze9O21j9WaxxRv3RFHxqEqnA3MbGud4vozr5+et4bb1QL3+woD3MbirA8GC3PL8F4eR+cgCtoQfEwsAUxklgRHEs3UYjB6NbehBwMx41WnnmiBEiYFXZqs6Q0kqGXkiNpbxjBZ3uvmuF8lkB8OAWIYeoY+QAekBw+pCwKuQ6ca5WaWlOO/kL0QMa8+n1aX/TA2fglzwepim/x8OS/MZErxvRrhQQkpW6fULFfgY8C2CCGoRhdN16zBLhRuDP85rqiwo2jgzZnVhLav2sgNXKB+edRmCo4vhzo6PKzhTbstyfEzsM590Cjm7Vx+ANtQBxmpx+X8JsGuE7bGJGwCmXXqcgU66sGbTerSGj8U9NUpdF9DkqmSmnpbHSd0edBYooj7yI/ojc6COR3Q3YZKkbm9nHVSxlIIgPj0fkKEe0etoewYa9SzshzmltRjght47xoqpNYaJWoBLxQ3PqGBD0iua5ZVU/tnkprOpvMOObD1hUHmr3dLpt28uT3l8Ogj7Y3Uga5L7Ph4te0BiFmiAfRwMIq4Vge8w8TjbLmYeIdWNjN6agVNxr96STkWeu4wd0T8LqDRnI2sqrIwGsVlvPaxxaDivLyPGkb5X3mZXZoRlJoBaxuc+o2y4VdnCMxfN49wjhzZl4G/c1Vno6Vs8+CLVPzsTACXFvzzYp6XYUe1zPEWY4DZagle2BALI4TdPvgsKLAoYjkr8TuT2lJFHfZZumLmc7Mix+x7EtO7IhuccSmj9YpZhcKmmTISHVL/GNyJ4R/ISrDWi7kQRD3d3JmqqcVS5UE5lfZ12R6A+j
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(82310400026)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pbo9HAVIvEZe48ACblu5zVWU7xWOX7aIQwokqfCZmThpCS94oD73FLjO3lsEKRr+okrr8CFoQfudcZdC/vKRSW9Ycl2KyDN6+KAFRKX4MnvA0taW2Jna9xAruwphCHW5/uWS7AfAdGhsCdRZLGcJLp2ZpIpgKXOwlGoxjbgV4Cn0OWu8uUgPhxP/ouIm6PiZJJnHKy4vHVd86C67iCrKRR0X5WtrHYWklnAF/fe9wOeeIMLnxaKAmjEOvraAOv3zIorHPucXliJR9/OM9Jg9pi0Fnw92LLvXYVu/hlBIy70d9FIB9JCVGDP7uVG3ADngTqMLOtIs66vk+p3aB4BirOVyfHfMdoGbLHaDkv1Xpu8/sehhdYUBIzNI6/2ik5B+GApBE8EWS6BUKYR1UikKdKwboqxQqJ30por/V/N6pDFho3rCTQzZ0sTclNtPr1D+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 09:01:08.8713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 255f800a-d019-49e1-07ae-08dea116dc46
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4235

Enable I3C subsystem (I3C), Synopsys DesignWare I3C master controller
(DW_I3C_MASTER), and SPD5118 hwmon temperature sensor (SENSORS_SPD5118)
as modules.

The NVIDIA Vera CPU uses SOCAMM LPDDR5X memory module, which contain
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
index dd1ac01ee29b..cc573c481c65 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -588,6 +588,8 @@ CONFIG_I2C_UNIPHIER_F=y
 CONFIG_I2C_XILINX=m
 CONFIG_I2C_RCAR=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
+CONFIG_I3C=m
+CONFIG_DW_I3C_MASTER=m
 CONFIG_SPI=y
 CONFIG_SPI_APPLE=m
 CONFIG_SPI_ARMADA_3700=y
@@ -772,6 +774,7 @@ CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_AMC6821=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_SENSORS_SPD5118=m
 CONFIG_SENSORS_TMP102=m
 CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
-- 
2.50.1

