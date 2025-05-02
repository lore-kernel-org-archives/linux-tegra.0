Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474A01A23B8;
	Fri,  2 May 2025 04:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746160686; cv=fail; b=fgHveI1icjvpsEKNjvY9wPfRPssss1kzHH4Ci0hFTAvCNyC1jqIWS/Kl34p3riVUTQ40+la9MsTvVHlgvt/TChV3RvNZqRL2dSS7yCfKB/6AKitSmMKOWhYATu0KE6H2u4rMVCfuJpMmEPtVksB8oBA0nKmGnH/VB9WqR4lrACg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746160686; c=relaxed/simple;
	bh=IN/lZkxe+nXO2zFto0LLPC2LJvBLugQZ3mBm8cvxMMA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sgE6VzBA6xpnPgX5qMdEraehlAU/A/P84U0GSgIOSYEgzF69au2mafkiwWplQeWfJZ60h9ba22rmDXhQmwNNydLp++uVKqjvXyESaOsfFfNCu9pY3t+YP8d9WrcrT9yuGLScd0pQ01FiEUZwq8XQ2VPQB2Pwts8dlWrWygQH+oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rUwuoUOO; arc=fail smtp.client-ip=40.107.93.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rUwuoUOO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSxt17bFmdYuSRGkECqf2yoldP9gOnC4tRS+I8oB+M3b3ZCVQfgbrFti4a/R32la1/+g3KGaBfmQ3nSnwxAexjg5TMFxO8i4q29d3e9OxO8nvipZCsbBq2J4dztvVlkF/txokmeJIBD0+sck+fN5Z3pyIEOTKHrOfDjU07vFLXuy6arbmqWTvCd3bu6E0Zl7JCt+m2b0q5Mcn/12kb/eWgCDbxttVni/H/MuSMVMnA+Fhv51bu3xnRKOktHNzrmMDqGHsL1I1S/ehaaBinhS/HOCcS23wSecFFXBN/K101Hcpq/v80d/Rfu2Hiece78IF71jlFonUrIzf3Uh7q0gpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIPlQ05ammruoY+aQUXDWSIKqLs9gANs57avhO9KoK4=;
 b=fKduzmL0tzpCgzDnFBRDmnMkcYXXy4d/mO+RbBnCEdDLFBQ6MbQnFb0o/q+v3dxsjYsG0SlPuqfEl+50yxCEIU4m/CyXoUKABDDYx1kdBc9V5zMWqPdMiBssvCN2zfyMW9+axwYACaYh9zGEfHwt1Sn70YzjSUEfl5Q78hWk3zT4MHZglz6EM8otDnimm2acXHvcEvmcO/OQswpDhjNIvGSPGVwEQqb/b/hiKCkAa9Y1vHasvANVHfp+HyHJ9VcF3gv7zMtHla6hKF4uSt7Hu6jrTXRvuJMoakXwjE7EifuXFf6AiB7hXw9U/y1Uvp8QuW7P4kxVsv8CuTzio78J2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIPlQ05ammruoY+aQUXDWSIKqLs9gANs57avhO9KoK4=;
 b=rUwuoUOOeovsuO40jMti2rxGCuPnxbRsG8KOCRNpbJF7xnKrkHe+98WSAS+A6c1wllmwLI83am81uw6y+3yaYNV63hQz5oqR/Ir+Ul+K3x9VlvQqeg+C2kAtdCEDe/tU+uVF/53L6rNhS0+V2/eKrAwSNjpU1qRxofhHUXbrjNRFChabuKjJbuPIk8ocBdAJ26E53curIi4DeXIqylzrJYkSoGtVxWrZl/q+xB98ZbTx2nmdnxr9EgDCSTKRSdpyV34/xLhN0Shl2uKhzOMEqylhi4wbwhEzy01KwNnJZau/NlbLvon9dNMOypQyxlRqFzaKUDarWRML2h/ene0SUg==
Received: from CH3P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::20)
 by CH3PR12MB9314.namprd12.prod.outlook.com (2603:10b6:610:1c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Fri, 2 May
 2025 04:38:01 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::50) by CH3P220CA0010.outlook.office365.com
 (2603:10b6:610:1e8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Fri,
 2 May 2025 04:38:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 04:38:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 1 May 2025
 21:37:54 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 21:37:52 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, robelin <robelin@nvidia.com>
Subject: [PATCH v7 3/3] clocksource/drivers/timer-tegra186: Remove unused bits
Date: Fri, 2 May 2025 12:37:27 +0800
Message-ID: <20250502043727.396896-4-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502043727.396896-1-robelin@nvidia.com>
References: <20250502043727.396896-1-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|CH3PR12MB9314:EE_
X-MS-Office365-Filtering-Correlation-Id: e856e9c2-0099-4a94-89cd-08dd89331f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0o/5/ey83MAzumRcuOkEKJm0LwXDR3qx+b3mV8zHNeqqiFdDwPgBdnggtr1L?=
 =?us-ascii?Q?GzKdiPCAX/veDzpxKnQ1MxBeNkCZsfVN2Ldqaa4DrxyEgl5IZEM5hFmtF0zw?=
 =?us-ascii?Q?hZMS6LYLQjAYPK5l5TQY1B1blCn5/DRSntyM3iwj3/tiidyEdHNW1WFDQFxq?=
 =?us-ascii?Q?y/ulZle/54nlaSilrd8quf5RDZmC5JasFeT1jfs5+g9cP3ZHMTcWvOdlyJ9l?=
 =?us-ascii?Q?FCplCgsJybtHdZeCLDw77rXjVlMe34sl+EmeywcgyaLJ1B2OZ4pIG8bB1AiY?=
 =?us-ascii?Q?4LpmjO4Cy/5T9IIMeMx7DUk2m8el3FYsVgLOOYiA0h9PuXRmgQmj/+FToXtX?=
 =?us-ascii?Q?aQy6c+uYavxKT9JXSI2YWfUZeH6RxKSlc+wfWL5h+TajfR3J9DQlRmyXUcbq?=
 =?us-ascii?Q?qXm0C//edNm5BL8MtLn3xjG4mWk6xgon3sP5YsnIn4X3SiZAbVdvN58J+1Ov?=
 =?us-ascii?Q?hM75TPPoisxSNpEpTxuXE8vUxYXDdbe2YfODpe+rnKypctufytSVZGIF2TOj?=
 =?us-ascii?Q?SMddKMJumVmpJ+bVvmL1jbqJ6CDKvcuXjaI6xm4SCyybuYnyk0yZpunG6HhU?=
 =?us-ascii?Q?vbSchn0XNrnA0ItdkoCcpQcxF2mLXN+QZPs4iJcMwyDVvQUePlORCwDrlS3P?=
 =?us-ascii?Q?//eCGT1tIIS3jx0HScUsxzIzmHGajDUW5ZKyuhj51RvQTZaOLFrB8eDOsxGH?=
 =?us-ascii?Q?bB+BfH1qmLvkBGhP1Avs20h1SaUdm/sJKdJ+3EUTVb/BEZWVrmWPtVDfns/V?=
 =?us-ascii?Q?6KYEjArlLpU0Fpe3wg8MWt59jKwzbeZfoPIPx+SPQQ45lCpzLq6p4AF9McUZ?=
 =?us-ascii?Q?QE3wFgzvhuEBlBo8HpWeA9vVDGNo/BKsjEDGA25vHtqkC5FqCzRf/6seVQjt?=
 =?us-ascii?Q?pv6HAER/dPNNB/QudK21dkE/8+BeYEk/SZs5LW7I2wGLzJw16S2qQr8ZT8z6?=
 =?us-ascii?Q?OlS9re18zm/o+WnP8xwqrJFSweQ19aFtsxhw0a95mX5ftRwNIiFT+6x8NcY4?=
 =?us-ascii?Q?JSwf055JmajN+kohcb7GbRtFSfDyiP7M6eissps6XWdqMIE6VNNf2eYvAfxJ?=
 =?us-ascii?Q?Opqt4Jmx/GLfj8uxuIdQQJFbUZWv2+ZSRPIFKN4RLuXg4j6i4wQ15YdeKDw/?=
 =?us-ascii?Q?v51xeOB6r0VmfwmaCzlI2MGWZ4wLECMK9UGtfS/TsJzuAeflFiHihYOh8o1U?=
 =?us-ascii?Q?90DnMbCIMFciyECi8pFVy3CYyIEatkXU+r/bxWe7twdQefSDP/QgkGefNJKs?=
 =?us-ascii?Q?EWw8aVdjPcLMhI2suGwF9+hZ7xvCHvA9rsqdxHttEkTcV7VcAOKbLxFr42f4?=
 =?us-ascii?Q?UA35NFhqV1vq0uT9IeFh/tc29Dz/FH5fhQMCTWMz1zMdudi5B80ooQPyOg0b?=
 =?us-ascii?Q?zplgaNFS1AkebhPjhUjG9484orH7uoYr/r07aVb59UnZDH+hjgjNyw1/qbRn?=
 =?us-ascii?Q?iuUM3I88qPby9zxZCmGSdYEqDF8BQQ/qxAdrAHWtz/E3vjhPitIab8zEHfoa?=
 =?us-ascii?Q?vcm9TBQ1LgcZE8AFbcMakFxedaBc7IRG0hk+?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 04:38:01.5119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e856e9c2-0099-4a94-89cd-08dd89331f3a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9314

From: robelin <robelin@nvidia.com>

The intention to keep the unsed if(0) block is gone now. Remove
them for clean codes.

Signed-off-by: robelin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index 8c8d83ceb1dd..afbf180c1baf 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -175,15 +175,6 @@ static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
 		value &= ~WDTCR_PERIOD_MASK;
 		value |= WDTCR_PERIOD(1);
 
-		/* enable local FIQ and remote interrupt for debug dump */
-		if (0)
-			value |= WDTCR_REMOTE_INT_ENABLE |
-				 WDTCR_LOCAL_FIQ_ENABLE;
-
-		/* enable system debug reset (doesn't properly reboot) */
-		if (0)
-			value |= WDTCR_SYSTEM_DEBUG_RESET_ENABLE;
-
 		/* enable system POR reset */
 		value |= WDTCR_SYSTEM_POR_RESET_ENABLE;
 
-- 
2.34.1

