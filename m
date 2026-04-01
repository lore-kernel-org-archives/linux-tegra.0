Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012037.outbound.protection.outlook.com [40.93.195.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11371369985;
	Wed,  1 Apr 2026 21:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775079570; cv=fail; b=crCWteFtWDtLP9KTTcNu9SDdBrjmUm6R1xz5gqZ9shsVwiDk3tJs7FyFjLzVmv4/dyLdhzhCuPrrehKNCEb4hext9qfBWpcuPI8bii3oaWNzrqtRvLFegYG7Rp78frdW8M8EKJBCYkeNiiX3ABLJjbb/KaBqZ3VZ6bLnrKoCOCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775079570; c=relaxed/simple;
	bh=EwjbnVK1XdfqEN4VGgcEtMUjsHgytjgCYgwsnl1Q9ok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f5+fpV/I9EVkiBJXrFyjF6auTAYWBC/00F2DvxH7id8UuYrPROqz5pSr6XPXK4ijG4Ao9bTkq+cLINqkxxZ42kxcjbdTbLazGlRtrjdGRwCLqFMaFD61bDtc1itUvRLWTLEfwgsT2cUw2xPB0Co2vBKruuUTSMZYlIqztL5oS74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mTAIdOZf; arc=fail smtp.client-ip=40.93.195.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mTAIdOZf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeNT9uEDXyf2E8prk7vkBpHQbFAXxxBxbIpHTH7v7h0hYGWa3UMjOPadUiHAJ5k2IiT2hgKvDvNN/P0IWI00SI0rpI+EmwWPOHZSno92Tt/SQ/ihyyziAI57JN51uWdX3m2BLSTDnOeURoALNkEVwXExfPbD/oShLBWg5M5H53NaUdGw1BJPYhJGTm10u1EfNnoHyZfT78ccl1mEFfIJZhDmqYrFZ7gJ5JibBcY9JRwhYhdWnDcNBb0WezKmHeb0vgcrd7TvPVoSCJFCpDE28AWSvHU3wGRDYUlvSgkJeIEmi3Z08JBI4ohPpHvCsRrVulb9L5BLl3qAnoebsI8prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Grs0t0w7oRj4r4Qymz2jKjFtRMdJPjYct3vUWJvpqLs=;
 b=oJgl0ElTCRwA7n8N8uKbUYIdnKq30btFdBP8CDfuBMX0C6ErGH/PtHzJbIiKrpGH8sCiF+dwqI45GwYKeVAEKKrRuNrz3U4elWwao3QdEp2i7NwPRMCDneE6cdxMjAixy6lEahZek1tYTVWiE53W/fGsH9YyYO5BQ7s2GCvtm8lx6RcxOYUYOYY751yAkgm75O2I53l5HcglB/8bjhB8fksSRPTOeT3U6CQMnpwDgkRm15HIme/HRHtzFz06bTDy8BrMP3GTgnI3bcOrfOlndwq9m7ZIsxzsBqHI0ypRDjKecT37hykepWkdgBDlOw0l3l7JvaxUcIy4a2FWpUnMDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Grs0t0w7oRj4r4Qymz2jKjFtRMdJPjYct3vUWJvpqLs=;
 b=mTAIdOZfH+L1taGtUAe4V6bLpNmREXdrloQAIRaPOzIUZvo8i9cJKGb+0UaSow4yu5jLDjs6MJACHBvMLXPA8tDNzLuYscjPWT/DT2HBvieBmvgdA7RW79l8gQbToes3vBN4i6VBX9wmaYzDRGjXbkk0yk8d3xD0g7ZIl5YvXBdyfUxkotlxT9R/cRElesfw8N9WJLzFUHRxoH+KO4ID+9Ri35zdETG6KEvIjypqo2ntMjlXDkLsn035TVhjVG12JPbMG7EhgD9r7JFXZ37mU1KLH4KrV0XOPjjpbcgcwD7GETz3iOD3caYo7yqlvCxJtOjyGzm7QJKpyIlbQqbJRQ==
Received: from BY5PR20CA0024.namprd20.prod.outlook.com (2603:10b6:a03:1f4::37)
 by SN7PR12MB7787.namprd12.prod.outlook.com (2603:10b6:806:347::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 21:39:21 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::be) by BY5PR20CA0024.outlook.office365.com
 (2603:10b6:a03:1f4::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.31 via Frontend Transport; Wed,
 1 Apr 2026 21:39:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 21:39:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 14:39:04 -0700
Received: from build-suneelg-jammy-20260204.internal (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 1 Apr 2026 14:39:02 -0700
From: Suneel Garapati <suneelg@nvidia.com>
To: <dipenp@nvidia.com>, <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <amhetre@nvidia.com>,
	<sheetal@nvidia.com>, <kkartik@nvidia.com>, <robh@kernel.org>,
	<pshete@nvidia.com>, <timestamp@list.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Suneel Garapati <suneelg@nvidia.com>
Subject: [PATCH 3/3] arm64: tegra: Add GTE nodes for Tegra264
Date: Wed, 1 Apr 2026 21:38:31 +0000
Message-ID: <20260401213831.187569-4-suneelg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260401213831.187569-1-suneelg@nvidia.com>
References: <20260401213831.187569-1-suneelg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|SN7PR12MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: ec806936-81d4-45b2-5fd8-08de9037227d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	PUNIbJiBqMaco1UzYPaIZjlzpQ9pg856KJ2uGkdWdcKPzcdNClryG2eHcjO53WefkokDfKyBthU1CIpXFUoFLoSTEiy8aJPj937+Egf8IXxx7+Pq2QzYhsJ4a0HRGhcW3H8blAg8JrcPsZpE/ypVvhxRpcxoy/QgLKwSN/ZuDulRDOeZ7GYiaxZZnvNiAJ7hgNpChHqfYE95rvHIgsZuAAzuTe6mkGI/8X8EKIjtjHlAi5Gito2flA6k/3vqVRecHRuZpZ1MAf662hREbHXUO01SZ56aSOsCyWufiWiUwkUAiWT64YiEEJjkssXuMaypLsGTwqaCPLXlcvIFTpP8luqTxbtNxC5mEDyiBHxA+nEcMYjZP/1nXK9Xh/7fKUN+MWfAqIlLWl0Mf9KaiyEcZ8y4ZHvtFR/uQ6skoxcsQ5b2afLwlLdb0qbDQeQu4Q8Ab3uwuDCNd43DmVA7dc4noWZMzp3+7OtQaqdPq4H3aoUQ1kswq4YiN3J8h1jpdRNezdYeN4nok6s1B5uSO7iGuVCbhs4RwmDsj3ZTXSICNn5UtAIFh4t7CMmgIUNCc+VsrJowNwiLwTe3N1/ZGC46RDuULUZVVkEsxqbl8piZuExSS6hhj5ZBzay7k5NykpZ2yLbmV6Tl4bRUFM7QWWV7dTtNf3el6+x/bA+QjeOfKgDwbgT1T6NQf6E6d6WbCCL1bXIrjhcpJWoMceAypE3zKar7ZxntzymoIvYHHS1dRZuk2smMXfXa0CWX4mZOov+SCiII+L+pOAcEE841xR0XanhB0jcDu1xIr9Gp1iF9V7jETFE417aHIc2ogrFafmU8
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6Q7Xz/WAw5ra7aKjO57wxzybXH6vM+FYIfUFlIXt7vVGwhZglTtNecd37LD+xIsr/o7LpsP4O6UbizV6qGtEk3t2Ru9TL5tCvyF9KyEcu8aeI8+2/J/VrJNdCMp217glTpsGrZbuEPIhNYcf031FO4n6ChKjnub2QIEr2B8EA8AOHNKPc0S0FmYwH9T+5e5L6iX6pNW3+xkcfodh0BnmLndGvm/ZTdIBn/NPgGe2w8Zf6nkRoTJH5vghm2mzThL04cP5fLqOH0pvgjB27g979EXal6hSC1RtLg8O6AQVwD0TD2C9s9RKO5BEfcoF3OA66680MhVgZO+p6a0zFP1iJn5GwQ+m3uYbiIv/lCMtpL+/SDtExN1ePnadGYfn4o3xLRZk2/eQ1S4818rOBkCHd9Hs3Bq2LhyNhmFsL4PAVcwYjWuVVA1LISI3Zu5+YBAs
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 21:39:20.7870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec806936-81d4-45b2-5fd8-08de9037227d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7787

Add AON GPIO and system LIC GTE instances for Tegra264.

Signed-off-by: Suneel Garapati <suneelg@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 06d8357bdf52..c6630733d5e3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3207,6 +3207,15 @@ agic_page5: interrupt-controller@99b0000 {
 			};
 		};
 
+		hte_lic: hardware-timestamp@8380000 {
+			compatible = "nvidia,tegra264-gte-lic";
+			reg = <0x0 0x08380000 0x0 0x10000>;
+			interrupts = <GIC_SPI 0x00000268 IRQ_TYPE_LEVEL_HIGH>;
+			nvidia,int-threshold = <1>;
+			#timestamp-cells = <1>;
+			status = "disabled";
+		};
+
 		gpcdma: dma-controller@8400000 {
 			compatible = "nvidia,tegra264-gpcdma", "nvidia,tegra186-gpcdma";
 			reg = <0x0 0x08400000 0x0 0x210000>;
@@ -3267,6 +3276,16 @@ hsp_top: hsp@8800000 {
 			#mbox-cells = <2>;
 		};
 
+		hte_aon: hardware-timestamp@c2b0000 {
+			compatible = "nvidia,tegra264-gte-aon";
+			reg = <0x0 0x0c2b0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 0x00000226 IRQ_TYPE_LEVEL_HIGH>;
+			nvidia,int-threshold = <1>;
+			#timestamp-cells = <1>;
+			nvidia,gpio-controller = <&gpio_aon>;
+			status = "disabled";
+		};
+
 		rtc: rtc@c2c0000 {
 			compatible = "nvidia,tegra264-rtc", "nvidia,tegra20-rtc";
 			reg = <0x0 0x0c2c0000 0x0 0x10000>;
-- 
2.34.1

