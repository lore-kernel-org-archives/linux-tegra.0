Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08CE69950
	for <linux-tegra@vger.kernel.org>; Tue, 20 Feb 2024 12:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708433096; cv=fail; b=rt3n+OeKT1xmmTh6U18xOvBx92HCTT4eub3qadQOHAgcmz+dHytntbZwHPCO6zljFzysMhPrEoz2X+Y7OMCXZPoLMnPTH+hb+7sZ6qUyW7dcdwLMqbznCdAtc463u0YARvqgLbOAPAw3Pn80poXjhZLosmHY32sSXSSdVOkHLuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708433096; c=relaxed/simple;
	bh=6Xk4wUbZ7rs59mcBV8wBm+tx14CmKyBLE1l+gue8iVk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BcadUDN/cb5HlMd56DoK8l/jlTnUNiCSOpFeeV2QTxX5xunaJfRDBq3z1pm7nrszBwMlUsbuPX7+NORnKFGa3IeNAnUsCTzMB0WPq2KMDAPGBY+HLhgZEsypvYSwXptwPyIDY04FgdQ/WKdbzXjeM0ezkmWNuyOwXV1rO5FHGZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oDQGirTG; arc=fail smtp.client-ip=40.107.93.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oDQGirTG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjwND4/VFuqPYwsBDe1dCSF82HmClRKX7cl/iIbnUQN3JFjAULp18c9Uxcm2KusiwM5WvE2BBZFbowRAP5RJ+lXxn0SIl3tQJ+guQB7kbkKptl6lk5RNXjMubiZjWRHu077aGspLvy+ypgUnzwr87yPpBN2X29dTj6IeLRG7HT2qD8j7SoLB03JLESn7yfUdp8WL5j21xwAhdTT+qEK560jcadWqImLfITc1etfDteHEERMZ577APHIU2Ko+mpGcPaMTj5AdvQ1N9oomf9rMQhKPfNTQ/5GFrj269+RDtczJzrQOkle6Sd2r+pL2v3/VRRjGeF23y4WWuUGWMyKJiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxKN61Z2IIScyOrjLep8VpFg2guc0bK2Pq3nMC3StTg=;
 b=M88eGsQc85oQLeJUaWWpgGfV7RTkKXLvtkYP1H4mHUkmJnoKW30MNIlk1prwjV1UB3mZ5KdE09+7ysuGAQC1Hg4vVtMe8sVOs7NPqFxRzfH+iTCTWiahQRoUphx+n+TyqHgYLEP946iJ1n4icYcKgcG/CHo4QVG4d9OUbS/TK0wwQ7lbBUltD2OFW0j6AZyAyKvURl0LQGaZEzl2VomcSXv4+Fkgq70As6sx35QHOi1YdYI3eD0XF0/xvI7HvcN/uK6AmWE/ALs/YQuQZPJyZwCM7EAw0HLLAMmhiFvWHQPIa1Bwpw8PqAOVD6GFigkQ6VGwEr7nY1CwFL1yJmR6WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxKN61Z2IIScyOrjLep8VpFg2guc0bK2Pq3nMC3StTg=;
 b=oDQGirTGqyfA0xxAuemROAVuqkLw6Rs15wEqZPfsdHyF6mYNws227qJCUFWcrRqpEoMlzJyzubCEDF3rfi9MHy2TkzdoxOh0kyug9DuvWi1r0Yxxbcj/3N86ADisWcpodPcRG+wAavozR3+C+KxDoHeA8uFlb0cwJe48Wvr3/VpHOIZxcZhircaoOpZIjWcy0Mi0jJkjxqHkuWyOGP+e31PZFWOej2DyUz4P2Gb5LwnCnPAukzIY2QguUxSkLzXCD8+PxQPaFKI2hojH/Ox0qNt2xzGKZF6IDob7zbcxtdGNKuRa28Ijv9SLqqsZ5r3DZEgb+PdJYaXeKwOkOQCzYQ==
Received: from CYXPR02CA0057.namprd02.prod.outlook.com (2603:10b6:930:cd::15)
 by SJ0PR12MB6942.namprd12.prod.outlook.com (2603:10b6:a03:449::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Tue, 20 Feb
 2024 12:44:50 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:930:cd:cafe::6c) by CYXPR02CA0057.outlook.office365.com
 (2603:10b6:930:cd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.40 via Frontend
 Transport; Tue, 20 Feb 2024 12:44:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 12:44:50 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 20 Feb
 2024 04:44:37 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 20 Feb
 2024 04:44:35 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 20 Feb 2024 04:44:34 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Thierry Reding
	<thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 3/3] memory: tegra: Fix indentation
Date: Tue, 20 Feb 2024 12:44:30 +0000
Message-ID: <20240220124430.19072-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220124430.19072-1-jonathanh@nvidia.com>
References: <20240220124430.19072-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|SJ0PR12MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: 30793732-28ed-4eb1-1812-08dc3211baa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xke3gvNe+0mcJfziTgCLHGwa/aB0tJBQvzCnbkuy0XHPw17wbVXrEp2VBKwl1qGnUVSxu84bAOzHLhzGQSiS9wiD1BpDRp+CmkTzC5kG4pjDyvP+w6Rs30si7cgV4IpFq36DDHCnZ0XAkDkuecmj62U383fwBxu4RB4Jmsszm9n7mbDYeKEe9ZhjFkyVJSeZ2GQnaSTv5kebB94ie5dcanYmosebjUss3gpMDVb5fZ6yuG9WDHlK6hpF8oK2TTE/g30DtcvjXx8192SEEmK/1MBZ5dUSEJD0E+jp2UWfYXvddlEM8m6xsJxF7zlBniF4RPJENbpy8wWdvctBr6vrRJWgVDyrIh4K9AF6jbWtPtL111ImqI5nASkYUrZ1dUqU2QnYzodjp5xmqFtXFLd73W6l+CeWcf2ufpnQ4c99g9nZc5lQ7lrXb+HWqH4UDxCMs1cFLRae+3eTdy9cMVDezUJVGvW74T5f5h7IU17SivXd4FQc7mFdBYseotgnTSb2adCy9S2VcVuXYioQBog8p6piQEpmYSz+XVSeofHHJxWm/5JC9ER52EXC4X9WIwGvGRPiskZklK8mcbsM9NqUkKwDsmZE5aeicUCX/piflVlt7awlVUpJ8URLpt6+XZlOKAX9SzT4XJfDhqjNkQRle7GIjQQWLn5YcHMqBhoMpQ4=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 12:44:50.5248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30793732-28ed-4eb1-1812-08dc3211baa0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6942

Fix the indentation of the '.regs' member for the Tegra234 NVJPG memory
client.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V1:
- No changes. Re-ordered in series.

 drivers/memory/tegra/tegra234.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index d9cfd2eb0d7f..5f57cea48b62 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -551,7 +551,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		.bpmp_id = TEGRA_ICC_BPMP_NVJPG_0,
 		.type = TEGRA_ICC_NISO,
 		.sid = TEGRA234_SID_NVJPG,
-			.regs = {
+		.regs = {
 			.sid = {
 				.override = 0x3f8,
 				.security = 0x3fc,
-- 
2.34.1

