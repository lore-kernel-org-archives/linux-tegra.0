Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2055.outbound.protection.outlook.com [40.107.96.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F144182C6C
	for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 12:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708086686; cv=fail; b=s6wIqzjAqgfk2oLh4epKpFe283qFlOPgcFWLrd2CPxRBfNPvkKJfz6GrK4obLsVk9X8TZfI5/NVFfqq5/86aSy1QwNbrAwY50c8sFFPwSOTcheDaYW+YVJSGE2xtgBnby7g6Gls9mLnirgBQPK9nh2UCkb5Cg3Elqnz3Xd7x4Gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708086686; c=relaxed/simple;
	bh=oMjgf86tI21YKvGglnvARqewbexfwZ8sPZYrOklnmUc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3JpAmjOBw3VexpHZWTz/a4z44wr9MbaRxg4S+98qDX2ZcrhGYn2ZaKg03kmGJkaLx5dYi/uNSVZgRjkfMSxS6D5wpJics+BAj/pq2nR3BvcxgcvIJ11pG2wn2hHA9V3M/865zaItw8yW2B15gj5O4qmLN9atwQ+laUO9Sg82BE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eoJ0gFuK; arc=fail smtp.client-ip=40.107.96.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eoJ0gFuK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2Yx8efdTq7zsHJ2Z4POOAPY62gt14MGyyyHnUSCyfUH3peB5tzN4fSWvK97MIykK/tH0b3OeA57mxxNwBgP+KURnb0WznXYIFD+4QfARD//7u8G5MmDJkInD4R33PRLtePufui4CiXRy10bXv8tpQXzHOU8j83JpRwBmd40nVW37wPqk00YypNetsL737KhnC9cZ/VxqcvJibVjBGNWXmSOMa6/4Lv57ma1ghs9jZEUCH2dAd1vHh4IBnav72uxLmmUbSR1ABWDfGuEl7V2PlDHWGisY7jUIr4T3KtNMNJAxvPgq3nxLIrmCz2CqJ7wjVAMwwqgAAyBMc/vXw3+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYj0P8P5KX2gvkqv4q9x2n8t6iMROC8NMtPwq2y0tes=;
 b=MIuRs9+rVxxtJpYzQ8/oOi5nEa8R4JKX7oN4KqNk8Ayf+cLMxlvjS6xNKeB3iNQeSdwtq4rT+QqsDGoBDOM2M5GvGvQnXb9uHm5XCnHK2txadcwn9muoA1X3/v8n6A/7UeDj4vHskTBw78iz/QfKE5yzP5uwzvsZWRXinoXFZTLaeoplwrqUZBEKpmq6h/pdV5oyle2mZW+XxZ60mTwT0XfnZCbtJ8xXvyetTwsLXad6vq3qCBVpGNzQd9VCorQqnVky8beBGSAs4K0cZmKmnIGrj8BkLPJn4fxOiN4+89qoZS9uYygJWiaM1YLnWn6J/KJct66eG3jYFG2+SjZ7ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYj0P8P5KX2gvkqv4q9x2n8t6iMROC8NMtPwq2y0tes=;
 b=eoJ0gFuK3tD6VNdPgRDbA+s5W071kB0MYG5xDX8aW6LM+bEfgg0bquVOSUuRNHB4Wk2IUxeXCPD3oNg5AUvB/jj+Y8hTl+oNXvYQq6EKdUhRwGw34bqW9D1GglZbl0yQl2x4K72zdq01cR/5CgNpX4p9HawKjB6Mv48i1mODXdFjWGIcB2QAbheGIhkfR7SE74P0WdB2x8gLx2N6KU0DUGF2gM5IT4qsLdnzXOdX7Y89UH6z5Iqu/WZbehAxIpqA8ybSQbkvajbZsTQZH+Xxs9UeK5MaKipFJlRAtz+RXq9EdaN2pz4evbBojWJF5eW8tvFbCHMs7dzCFaXqsj9QvA==
Received: from CH0PR04CA0037.namprd04.prod.outlook.com (2603:10b6:610:77::12)
 by CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15; Fri, 16 Feb
 2024 12:31:18 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::36) by CH0PR04CA0037.outlook.office365.com
 (2603:10b6:610:77::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Fri, 16 Feb 2024 12:31:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 12:31:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 16 Feb
 2024 04:31:05 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 16 Feb
 2024 04:31:04 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 16 Feb 2024 04:31:03 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Thierry Reding
	<thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/3] memory: tegra: Correct DLA client names
Date: Fri, 16 Feb 2024 12:30:56 +0000
Message-ID: <20240216123057.33018-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216123057.33018-1-jonathanh@nvidia.com>
References: <20240216123057.33018-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a92b2b-d618-4840-fb1d-08dc2eeb2d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KTZXaJyc5qXmiBrpX9x+cloas+s5G5QIZ81fx1T+Keiu8ughRs88B/MNsVk6W3rHHpMbE40zOBmEdTfXx60bx0kAMpBP+G7xE5K3epVVxg59MvMrsH5+o5XJDASnsGSKYOGqBXMsGESZqrW2YBjhcC5wG15KC0wFAULeNP3+CTdm55rTtwFKqFUBXNglbuQNiNPi0/Mklgaa5aOoJ46X1zXbPMliMeMfoHja04R+MfmrW/X6j5IzGSrlhd59URHa4o5T/ew8Aon0Ye+/2p+TcuafM3RBQGeNS3hh9cuK4pLdbYewKH0V4hu0Rg+ugrCMvQJ173uquoCh6+XWkCJge+7OE+BzIDEp+1i/qkxEFk1B6BYWmUR5VwS17fhJuz2rH7fIovescunwrpIo9IDD7/vsWG3BFQmX+1SvSkKD+W5fO7ktWywzopbznfq9kw7arXMx2xpucL64IHSlJ14I2KOiAOLDUPUxizkwE10E3dK0nUwoSvRa5w6UHvqDn7OcslNMZAdfvqnrMpbP2Aa6PPTfK6H9LtJgdLQ6D5g72rCxrO2DmfA54j5vuOc2s3tfIJwudH086mpVg6X8mSM0lE8OoWFQcPUe5FLLQJW69Jm9ChiX1qUPjyjkaHvYyUdPXMEMohp9+NXRu00OE2W3bb81BOOd7VAUTL1+u52R+es=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(376002)(346002)(230922051799003)(1800799012)(36860700004)(82310400011)(451199024)(64100799003)(186009)(46966006)(40470700004)(2906002)(5660300002)(426003)(336012)(26005)(41300700001)(107886003)(1076003)(8936002)(70206006)(316002)(4326008)(70586007)(2616005)(83380400001)(8676002)(6666004)(7696005)(478600001)(110136005)(54906003)(7636003)(86362001)(36756003)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 12:31:18.7427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a92b2b-d618-4840-fb1d-08dc2eeb2d1c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5252

Correct the DLA memory client names for Tegra234 to align with the
memory client IDs.

Fixes: 6d0c4aa51628 ("memory: tegra: sort tegra234_mc_clients table as per register offsets")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/memory/tegra/tegra234.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index e6476b6ad923..27383eb08b45 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -121,7 +121,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		},
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1RDB,
-		.name = "dla0rdb",
+		.name = "dla1rdb",
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -407,7 +407,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		},
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1RDB1,
-		.name = "dla0rdb1",
+		.name = "dla1rdb1",
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -417,7 +417,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		},
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1WRB,
-		.name = "dla0wrb",
+		.name = "dla1wrb",
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -699,7 +699,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		},
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1RDA,
-		.name = "dla0rda",
+		.name = "dla1rda",
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -709,7 +709,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		},
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1FALRDB,
-		.name = "dla0falrdb",
+		.name = "dla1falrdb",
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -719,7 +719,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		},
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1WRA,
-		.name = "dla0wra",
+		.name = "dla1wra",
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -729,7 +729,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		},
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1FALWRB,
-		.name = "dla0falwrb",
+		.name = "dla1falwrb",
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -917,7 +917,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		},
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1RDA1,
-		.name = "dla0rda1",
+		.name = "dla1rda1",
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
-- 
2.34.1

