Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BC01411FD
	for <linux-tegra@vger.kernel.org>; Wed,  3 Apr 2024 11:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712144552; cv=fail; b=XF8FcKzhe2VrX2wqFSQvvx3qq1xEcP6+936Up0f2/8XSBl+URUrP2gTaEEwHd6aK7pWHIjTOc8Lk9o0I4sweMWFnhvCcgiw5EmOS6WB9287fRhon9bbu/KufAoAdqFyjXke1y3/JIp1nPXEE1bmlVC1AhzyNfJTl8W7z0ADb/pI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712144552; c=relaxed/simple;
	bh=cvgBJlk61pxrrBu3/ir9ZmfwsJiRJ+WOmAEN6HjgvhQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V3HJF98NTVbJMQzf1l5BZUg1vtdBkAeQtC+V2i2bNfxMWOgj9GeXBHozjDnFMTITh8PS2tsmlyiEdYSDB8ib+XHwGhpOvA5In7wpeGSy630nzqWz3c8pCyOZrrHeATJIj6sJorELdlntR8EY3NJBKcPllmRvc9IEhZfA9ueq+Mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tU0La9wA; arc=fail smtp.client-ip=40.107.244.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tU0La9wA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieCpxtSHaiShf0ewNH6cfi38Ij1u9U85712Ec4DyS1PpOiKqY9FuBvnLHX4H2ZYA3hASemwuhHoUUkBaSCnGaghlptGIdtq7NMqb5e40AXkQOOTZPUQwiB1MJHhu+5qzKMxIbXj6LvgjBjSukFd+/H3zzm21cmcsbrHpse74I2AitHF0fwI1yW8eGXr3a1iRHt9fAga0WqGeG7a0u9ossJydYyAXS74nF6gDcQPGP9liklK3g5yf0hEYyi16tRa4GB9UtkBlxXyGUEw72jKi8PagfdzCpl9IIEFy149fXbu174jZpZaiStDkhdn8iF4ycsbsN5Yi6oYDhz+E3qi/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvDBsjI3lT/JUgQ/mgTm1l+tCb3IBf9lu9D9vyhYZXU=;
 b=jDBU0mBXv+YrhAyhOaAsH/KS/2lJDJoEfNYGUHxtLkMzBpIny7S1VM8aU1Pev2N2vUk88ZQ0ebfZuixhhLSOq2zhvPPgq0C1MZtngyma9J1v4S1krj9YaTv+5duYw4qMaF+zYWWuXrOjPX1p7+jmekJacYZVH8zUk3Ua3GhCtOGinMs4BjABBPneaJJ5F4m7efa261EnffUDbaNq/KzMQyRtigPXgpZnSezGJ4FwTBMZ4l+6F9DtKk2aiapACPN6vsZA2AQkgkwDXgwibuM91PxD6aMOnfIOHYiimzeI5vfqKv+d3MJlrmkGtCrqWZtaFAuujTExgbaVgbhf7VWSZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvDBsjI3lT/JUgQ/mgTm1l+tCb3IBf9lu9D9vyhYZXU=;
 b=tU0La9wAdHdZghOUI4jRLbWyw35Wwi1V2yYsPmPsaZjaT7HGxCYSF62QXZaA+fWzQFs8ZynkpgCq9yN0hmmT4Vzncc0ROtjjfhx5t4pzpuPToOx15Wag9anG9MpPyPBMMs/UxC4pN36VCcBpNYb4ZrWcodp7WPR0J3djgGW50ujNwQFrGBGiGNsXDQgv9ggetzF3zzrn59XKhChjA4VBD+8HHfMAh76gTlMjN1OcpAOYPNW3usNchjBP7JR3fpjz7xKEsVa2ecC3sWhkqZ+eW5Wv2p0SUB5EtumRloeO6mngkfglSZjykp1gAz9hcrhj8wBFyBxHM5HgziANP33gDw==
Received: from SA0PR13CA0003.namprd13.prod.outlook.com (2603:10b6:806:130::8)
 by MN0PR12MB5740.namprd12.prod.outlook.com (2603:10b6:208:373::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 11:42:27 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::be) by SA0PR13CA0003.outlook.office365.com
 (2603:10b6:806:130::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Wed, 3 Apr 2024 11:42:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 11:42:27 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 3 Apr 2024
 04:42:13 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 3 Apr
 2024 04:42:13 -0700
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 3 Apr 2024 04:42:12 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] soc/tegra: pmc: Add EQOS wake event for Tegra194 and Tegra234
Date: Wed, 3 Apr 2024 12:42:08 +0100
Message-ID: <20240403114208.35147-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|MN0PR12MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d65be12-b785-47da-63e2-08dc53d32330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GvdTPwenvmMCyPHecH1Pu8Gj2jw78ygb1Fgu3U9Eh/J+URhPS14B2qzv5GCtV1InMO5P+orOV29CvqxHwfJHlbHK5FHpWG1KgO/k8yfyK8AUfMf3lhzKvcBAXsrfAvqc6BRB4CO7e3sho1VLaJwJ6EyXLWkAwvKQbwagQMX1P65lOU6Pf7tkanDtmvkJolq860hfHu25r3XIkxC6zyrm4+a5iLCoFPOc/XWUUaTFEeQoIsfKKSX9aOzEuN2pUIhnU8MnYjDD62490ofjTrNm401PbNXNZySY2xwW1oVhdCtpEq7KT7DpbVKSN99+L7R09bMfTxYXdLaDDSNM4WdnCKw4zWDQofOzkY2/l6TNmW05UbkPDZlteUm0VnEyiNjf7Uah+zIyy+662wCU+RstqVG2PnaY0PrVXUag/s3Gv4rajEOiRati9rZ33a3up09F3b2kHpc6La+mEAM+fo0oyBVe4ZOmUO2LUDauO2Dv6X5byUP2sZvPpg7caD/UkLaIpFxSd4SI9kxiLwE/UdB26WzV7nt2r0zCQ92sPLcQFVj4qS6EwQ8g02FCGWMKru2n2FkuKRj2v5miQb1IE9jEeCtRtHZCTje9kBl2cutPAKcPvCfMuHcYOx+C3wH05a3/oUGGWTKWCBlihjpcdKQZ5+iNB8svUeVjdpb2Uq9O5x8y5ofbp+t65+13T0uMTtxW8Xgbt8BqW+G87+UFhNe7tufZXUsbOgV3XWacqFVc0KIA5YYiUmtV9OabTPp2mXeg
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 11:42:27.1940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d65be12-b785-47da-63e2-08dc53d32330
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5740

Add the wake event for the EQOS ethernet controller on Tegra194 and
Tegra234 devices, so that system can be woken up by an event from this
ethernet controller.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index d6bfcea5ee65..91d0ad6ddefc 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -4074,6 +4074,7 @@ static const char * const tegra194_reset_sources[] = {
 };
 
 static const struct tegra_wake_event tegra194_wake_events[] = {
+	TEGRA_WAKE_GPIO("eqos", 20, 0, TEGRA194_MAIN_GPIO(G, 4)),
 	TEGRA_WAKE_IRQ("pmu", 24, 209),
 	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA194_AON_GPIO(EE, 4)),
 	TEGRA_WAKE_IRQ("rtc", 73, 10),
@@ -4210,6 +4211,7 @@ static const char * const tegra234_reset_sources[] = {
 
 static const struct tegra_wake_event tegra234_wake_events[] = {
 	TEGRA_WAKE_GPIO("sd-wake", 8, 0, TEGRA234_MAIN_GPIO(G, 7)),
+	TEGRA_WAKE_GPIO("eqos", 20, 0, TEGRA234_MAIN_GPIO(G, 4)),
 	TEGRA_WAKE_IRQ("pmu", 24, 209),
 	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA234_AON_GPIO(EE, 4)),
 	TEGRA_WAKE_GPIO("mgbe", 56, 0, TEGRA234_MAIN_GPIO(Y, 3)),
-- 
2.34.1

