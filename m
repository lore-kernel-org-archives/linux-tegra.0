Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011021.outbound.protection.outlook.com [40.107.208.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852F53264C8;
	Tue, 21 Jul 2026 04:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607016; cv=fail; b=ENjvR9/2SizTNb7wyR/zQXPZplxiisceNjjL2noSeV5I619Cj4z0qUHyn+YXcnA+bPIyj+rCkgkmk6Sccypt3U5idAyDebAGU5VAqwfNcz80X5wdsS0CA2jMV8DB1gCdPRZc2y6O84Oox3hXstU41GmgOTHWurQBt18/ZQ0YyOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607016; c=relaxed/simple;
	bh=cnBxZfKlFcPWDDScr3bRU6n4zC7SxOLBJhii9RPj3Vk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s8MJCWtVtlVelLjhhmbWGnkzzhs0q14raK24c6Ci7qkt+9bSHLklDl0h9g4TKIgjS9H8OP/dSSATyGRsbL+qquvwTMqRhcfg5wlSAep90ffZUBwKx9AW/ZW+oRErcwG4iA0Cm9shv8fzf2/VTC7M+kjIp1ih6Q0WsWpEBRc9MAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KJgufUkR; arc=fail smtp.client-ip=40.107.208.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KJgufUkR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJ3So4n+DpXhBm+P5ambA9ZZToMe6/x+uL/ZA2zkzll+buGfKbVWbTlGgTOHWiRfx/mPL4PbXKKfB5Ku2OCHdr9H9w4HhT5Ll1ELGlPWIqsVkEBs5lNVPEzqORprYfpPkySJ9YXYBF6Vwhww73NCvhhGZp8gOwmSoqdfD3hXvZWpuPTqQIX7MR5IPhZtEBosiU9xE9mT0HuOytZ4Bfdb6ExMr4ODKRoy59OaRBC5u7caWxs7UAjsCvcvCT/sADHyzgLy+yeMkmKaYnugZ6rMaLRViKcoUOIzdWu4a/EF+iRGnGRi0zPLqu9oTKxkqM5kAKDwtDiv4EA+J4xql5Prmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unGLf+Uxex8MrwG2kOJpiBdUwqjgd3Iqf3Br6rTj0JI=;
 b=vwFnJ/G0pAV0yHYz1w2j8hlOkmkZubw9x6oN6gfeM6aBacRemz2PMdm2RhxsArCxDwE1jLMv2k8YUKQ66o9vYG6EEUbZMKYouyc8z5GWcqIC9fnOvP6FeFzRQWf9H74D+vLOVeNImfEPvyuallt6LuDTTsq06/UdUfxcTlZoLQWjAJrNzYSpiUMRUzTq4bBM22Dlx/wCzaDHCH7s/nnLp007O4wVoPTx7She1ROVHfw6z78F4MQSPJBx58CXrxrWnPCmpNJD70HrRJmMawrHdFGADRVVNbRHN4Qzdl6pgM+0BhHTMra2jNf3hLRBs8sy0aRFOs+tQjNcxZPbH6k98w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unGLf+Uxex8MrwG2kOJpiBdUwqjgd3Iqf3Br6rTj0JI=;
 b=KJgufUkRmOrGoilcEDkELcT1VBmgUVPaHmSMPDilYyQEJqDopOHesdyeaY+o8bLA4wlGKDb8/NiEcI/UcvyMD8e5Pu4Lp9Ohtb+7rfOLiZB+KDLDEcm/zJMYCq/XMQ8z+UrU5XOQJT+/AHC+iuqsyiFp/nuQH8/BvigYpftxKRSWPOj2VK3oQLp+8W8XQ/zpTE/svafBILFFssmzSptnt0m/y2rpab/sVLK02nvd9oxF5OL2Eco2I4nRArJSXIWUSGSeDHbZaIEQNCdk0ih6v1NFVJpW8YiWSmlieG3cVKmi3N+N57ZMX3SLfox23SmkRueH+bj8d9kz/izUwDyhrw==
Received: from MN2PR08CA0008.namprd08.prod.outlook.com (2603:10b6:208:239::13)
 by PH7PR12MB6882.namprd12.prod.outlook.com (2603:10b6:510:1b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:10:04 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:239:cafe::1f) by MN2PR08CA0008.outlook.office365.com
 (2603:10b6:208:239::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Tue,
 21 Jul 2026 04:10:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:10:03 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:09:50 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:09:49 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Jul 2026 21:09:45 -0700
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
Subject: [PATCH v6 07/12] i3c: dw-i3c-master: Add SETAASA as supported CCC
Date: Tue, 21 Jul 2026 04:07:55 +0000
Message-ID: <20260721040805.1696503-8-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|PH7PR12MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: ab9c6609-372a-47d2-2ee2-08dee6ddf10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|82310400026|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Xi1WjEM+G3zdYnVDyvpfV5glWfQDjvgtwd3MhWCS1PKg5zF8/nxjrMuyCPGLerWdCK68xRa+R25yCYQgtmcLN1moi79dFYt0vziQJPSbQ5+FhR5SIgV60kRdX8FT3eFzChvq0TzpDk5ik/GMVUz37p7itIuxmEz7gUGvFRyL77x0Xq7u+DZqp65nteCXUwa2nd78eGzSaTGcoRuQY6VkbLHWU/6oHUdEZGRm6QFaboCzm4DiP0jvheVsuLl4IVb+TX9mTYdc5AkXlUXb2IpXqtGDyys14ImLmRZH6KqDEUyGoufjYayay+mTJd8Ke1L/V2lrEGyoTSOK/O0DAJfKYxjEpi/8USPjhV8G4kOBXX0mdDv8H20mg8PPhDUGRWTMSrdRCGzXOORyDFxcsuq4/eYt2i3pt8xsE1fTlUX+WasorCl96aUUzQiecXh2Tg/TFl07wrXN+TMRhoP6aYOcQgjZAndMwXZLPvKDV/vcFrsvgAONvAvgk0Zejcp6Z9Qe/luxZnrODvoZDYtEF0jvD9syUT+wHeoqsTCBXzF+0rP5R9gYJYA/RuJXvbYBU6HbSD/Sk0BACi+2GEQ5kqyN4K3TqiBfDzmhXo5JKOqKKVeurZ5pa3AJCGKL5zYGx54Sm/ZpTgPGlFDZTaaizqnpLaPDoWGqiQausuJjL4CxsxMvdQmAnttZuIWC3CntSwMIbHLD5hDoZjNDPQvlaX5cBA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T78rbpwLC9OMj4LM3lD5e4Q9s/Z8QHE8hchFkL+lgwIvzur3UlwOrKaOTCr3KlezY3gvoOuZIzmmukPqoCozhJxOUiQQch4yYiPAoVbYwBWNb20jzU64W2qy3F8yfNwAwwMHBMJpIlohBqhAYh3U8tj58XwyZLRjjVZEbjS5H0vW7UYWqr6eBjlga6cOBlN0Li+SrjiqPd3+/U2vQ6JeQ1wcnwpyjXW9ri7N6qKkXciH8Fj9xpYY+nVErhgAScFwILgTN6z32gZzXJ+sMg4PAlzHCjIbuBeHGaep+8uDiOOgoYP82YpK/NqHcpu7xgmyw78iGUPKS6qGpv4xCZ6AB7HWsrXJ6wMRU+Ng3ON8dbVyGKfiyHkm1s1b5Alg7esdq5uZVrohKN/E5TeYENf3JyqTvfFpuuCO3ytAyCO1jUtvZr6h5+WMD4WEI4XICnMp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:10:03.7774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9c6609-372a-47d2-2ee2-08dee6ddf10e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6882

Add SETAASA and SETHID to the supported list of CCC commands for
DesignWare I3C host controller.

SETAASA is a broadcast command that assigns predefined static addresses
to all I3C devices on the bus.

SETHID is to stop HID bit flipping by the SPD Hub to which the SPD devices
are connected. It is a prerequisite command to be sent before SETAASA as
recommended by JESD300-5 and JESD403 sideband bus specifications.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 2f8c0c4683e0..29030fd9594a 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -309,6 +309,8 @@ static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 	case I3C_CCC_GETSTATUS:
 	case I3C_CCC_GETMXDS:
 	case I3C_CCC_GETHDRCAP:
+	case I3C_CCC_SETAASA:
+	case I3C_CCC_VENDOR(0, true): /* SETHID */
 		return true;
 	default:
 		return false;
-- 
2.43.0

