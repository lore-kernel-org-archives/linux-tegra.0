Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010047.outbound.protection.outlook.com [52.101.46.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF68E443E21;
	Fri, 28 Aug 2026 14:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787928056; cv=fail; b=Fpx03/Hb7ptBvniZF7ti7I+L3qbEVGcTb0un+mkhJwDVgBpiV6Hsz5kEvB1zT2gv0963/IYFlUVmd4NEDEIa2mK8QZgI7DqgaBifzFWzPG6kfMN/R/+tzai/T1APryBoGqSvfunqMWpJUZRt1S3Z9Ac/z3sSnAbbYm3eeLArSNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787928056; c=relaxed/simple;
	bh=AvqwKu3CBYMwQUCCRt1BDsrerMzgxiiLSLNzpG5gZw4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=GAaoh7um55usoW1JJ7j1mGihnpmk6DyordHow1CM0cgakiJKg65tBopk2UVLNZ7SJcMwkBscoS9WJdSxi3rwu0qjeer5QReRaCvPx9d38CRGxeVVZiT8QIenFJ+vlvDGf2TSp6QDxGiAs/CeNrAMA7qLn6PoB0lRw/cCoYWa/Is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ccPfQhjh; arc=fail smtp.client-ip=52.101.46.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ccPfQhjh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmtgSkQ5dgjLWED6ponMPGdve+iTa001bmElMER+4BfI0oT1JJWF+l2P7m1IDtFEaQEAoLdVbR8SVTLq5Uji7nGjvPLsY6OyRg7C4Arqg+Hb0TFkqpdxJWdtzsE+1rdHpZA0D8cefPmh2jY7kFO0WXdmuGOfFv2PcQ/Xmro88esegHK8KcTikGwvWjb5Y6TdauGg3H24CeIBoHk6fYj5GsyvYIZ7mUiK/6XntSTRJkwpSfD+FuteSIF7pCsnUHPZ08Yab7/EnqXvU2JrFZqBOpLXyY0/wBiNG9jyjCAWpvhcA6AHT1fc52eD5WFzRAp8UGyQcnpSSJyI2IUUol5lDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaF25tKc19JYh4GIs/v5dDQ7jFkkUx5ztX1hWN/aNo0=;
 b=FhUJ1bdjVxHDAzMABMVtUyszfkd5TsLWr9qPcV/hFbif5ZckovvvYPpsAyxmFhxrzTpZ27vge9igcAfAFCmlqstU2UlbcCuwGWe4OFw7CpxsduuEWHmo1PidW2R19qR2bVaxgw/pxO42yg1ZckQfbj+Puco0LfBSnlet3HQcXn7b1p395Cue59B/qiMMhZEIFxIEpQs7p2hoIyiZXL5dN5vmnFoLv1Kg0sddqTlsXUuKUrz7nW6Ap5kLYLtdbFrWKB+6HaSPLSk6xMJbg/Wk7vX/3AtU1qf/seR6+dYL4LrfNw4gJlFe6idKGyRCnwjCI113PqpYH9tWypeX1iCScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaF25tKc19JYh4GIs/v5dDQ7jFkkUx5ztX1hWN/aNo0=;
 b=ccPfQhjhhKpShayvx/YubqO7oWFrkvnJ2qgGDemwOjeiOwqFt0fVL4pxcq7xS8Ke1fgCjp9YfZIkoF94rT7gglMbMVJqQwrtBwPx28KpXJIelGxhMucCCnDjL5WssCuH0fjSEVK+nyjkrK/c8qh442VKIw2B6G6my1x1BKdQyOqquz6hVEihteuOxt9OotlD4ueByGvkVyyes8HSNDXQgnLWxNT/leH33bGZyr6qxgwZwtuQIlGlXJFwV/qp8YohDmOTu+yV47NOOgDAVhRjNUZtDpNo/zH8HuwRLVvuEiVVurviNPZ5F0a9H0q9RA46QaKCF/02KeZrClfUPAPbjw==
Received: from LV3P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::31)
 by EAYPR12MB999158.namprd12.prod.outlook.com (2603:10b6:303:2c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 14:40:49 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::55) by LV3P220CA0008.outlook.office365.com
 (2603:10b6:408:234::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 14:40:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 14:40:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 28 Aug
 2026 07:40:20 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 28 Aug
 2026 07:40:16 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 0/2] gpio: tegra186: Add support for Tegra268
Date: Fri, 28 Aug 2026 15:39:50 +0100
Message-ID: <20260828-tegra-tegra268-gpio-v1-0-317bd91295e2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALadkWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyML3ZLU9KJECGlkZqGbXpCZr5tqbp6clGZiamlmaaYE1FlQlJqWWQE
 2NTq2thYAvfrNEWUAAAA=
X-Change-ID: 20260828-tegra-tegra268-gpio-e77cbf459696
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>
CC: Thierry Reding <treding@nvidia.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, <linux-kernel@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|EAYPR12MB999158:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b84200-faf1-457b-ced1-08df051259e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|23010399003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	1LhT/KnnO83S2lotOPOUBl8pSayQI5RLO+juKpgbCy0iOF26zLozl4Ey8LKBvN/sn6kcDd8sgDGy74/uL9MMpKcseRfaB/ieQAZVIOuPdfEmBDP5lI7aIPC4DDKGpl+0WH37z54p706qb2xE68YdeI5P1fp2FMFDOYKIVoLT+Lh2L6NphUStcH3MBaUUEFprSEQfPpjliJwrpYtDXOizJ1pSXfaHgFH55/oTIPg7JY4eiCqxZ6g5LUbNEzS8QfKB3SBbr6K/PnwIJYzmpCicnhNbv+LOfcRqSs6guZgi2cUx3Rg6uWJ/pSnA0OIePdRmFSZa4tOlsgdkAabRPKeUK4JkVN8BH/NfjEWdYuy4MsVh114pInb/MXFGAmTGI0vW8Frb/hrs47B5AMyIW4L7Q7Adjsdnqz4yoEAj+uel8GVnO/HISx7UiEqVxWjq3uzZI66+7Jfob0bbFpJXBxVC52wrAVF8+II/ENsmyvm4T90JVO3zb0/LztBMJUOsFytR1IWlHtIIHLBePDPc/Wx/Bd1X8Sa2DZzUwY55aSO7XkAdPqpnJeJWU4kXwJdZMLvqupkjA/G7nprPn1XV1pApB5TF2AuWUQMpdrdUE3QgJxJ8XVzcl+dTLDOODa3CBG5aHk6MesjkEB9i3wnFWyZJRg/lAdh6pr9p8Uvf/ej4vzLbeK5zmklhPhKmiWeE020+fX+6IYKsdKZ505njWzJPbA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(23010399003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IU6+1LgZJCjrWx8Pu7l+HBwQuLZIlV5daLCszfBn+yPF+szBFpXXFmxGOzx5/+0Iv+IFxzoufRXZ9ZJtJSTQ0YHGrK0UhVYTDyt6FH4TQ/4len7YUVxoc89hX8VhCl7XCMEbg5AjbHuedAlJnD2NFtxnfrws9TSvMFbpeNim1jt4jwEKKE/6Nw3X4IY0hvCKBtjguPvCSyvbvz6qZTKwq+hMAmUP72Gr9moSWlBy9EHJQIKNavM0e6p2TRcZ9++YYdQrs1G5ZrHSZOzY0ctDVa+yIpPjF7qvRQSpCZqJ1fdr2JD9dM4uEEEOvAjfcB4CoYT6pCemU+CiOq74FhxTQof14oJhWyAC3Meu3CQMW8i2TEKL2Gu5hax0sj81mrW9l2autJ7NA4fTJujDCh4zxaSiOAJkHnJikM8ydkZzaVpYGq8RgcAaEgHzKEG9rGIr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:40:48.3304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b84200-faf1-457b-ced1-08df051259e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999158

Add support for the GPIO controllers on the Tegra268 device. At the
moment there is no device-tree platform/board supported in the mainline
kernel for Tegra268, but we will be working to add this. For now we are
starting to upstream some basic driver support to pave the way for
supporting Tegra268 based platforms.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Jon Hunter (2):
      dt-bindings: gpio: Add compatible string for Tegra268
      gpio: tegra186: Add support for Tegra268

 .../bindings/gpio/nvidia,tegra186-gpio.yaml        |  9 +++
 drivers/gpio/gpio-tegra186.c                       | 74 ++++++++++++++++++++++
 2 files changed, 83 insertions(+)
---
base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
change-id: 20260828-tegra-tegra268-gpio-e77cbf459696

Best regards,
--  
Jon Hunter <jonathanh@nvidia.com>

