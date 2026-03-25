Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010017.outbound.protection.outlook.com [52.101.61.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72D83D5646;
	Wed, 25 Mar 2026 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443545; cv=fail; b=JVYiNtG1IwPtFebRBsj0g34B/ZhjmtaBZ8+zEVy/ZyYPmAdgOoMf7Jtjc5e2Nep/fSPPRsZpDfyXczhBgQBpZsMuFb/slYJjUxwE7Xgz3YWQSncKln4p72alV/lRgyMyCZBKJF0W7zNXd6AjbyZ5TfdV3G6bGuHoQMkGfEGY1pM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443545; c=relaxed/simple;
	bh=bGow8OG2M1s2CXOxaPajovTaYs5WrhbB09AWVkPLv04=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CvCEHKygJnKgE818acTyQI5sr9FLTkpc/KpIjjhMYSOmoRsNhteZNzsGw2gpzt38GrLobwWtu2WolyfngjA73WrJIFVoaIsnCTHKGqRsHGTOBBTrUqQmC+LqOs5jEP/XxIXQqgb/IQ3DOQxX1A63d909WyYRZbuw4ZBMDyIPLKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TzrjpC6o; arc=fail smtp.client-ip=52.101.61.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TzrjpC6o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STBlD2szd+r7/ANS7wKqgfPyBPtW8Xh8fb7TYUDNX3zfSfFA/K+5NwZEoOeVXmvUqTNjYHKaqo62yRAPNeWAHYx4Npc2uY8TQtSODk7A7NBpz6o2d7jXDQ3Dffb1SYhEnkREGTpBrzodqD68gEW+w+mR4E6eTOLvi0HpFO0y739HWUEQTpOOon90CBcrvcVEikkIVz8P40OL/tI9IqgycfNsKJ30tmB0bGZYOubbdM5kKGjnmStQjGdBEuteKa735IBAVsgyRPPSB4uOxSscd0MOxlbf1Hr6VZpnH3shjee4NhpJQQuDFRkB4i1wTS/SiZZo2Vgw2yS+2P/DZOEbLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJqxBUlbJfiCCOCagn33i+DWqY3KSILUfDn2I6ZE8Ns=;
 b=k1Xy/Rzo6DybXJUCir+1pReCj2VaoA+YZAts31zdrFn7nTs7L+7MavcPwejmJpfmPJGW8BtTveDbh5tHFvwqECvgAZXo3kHoAKiSFk+W5z6XRjcsnBjS7Ao1Sfx+PcZBSKIWkYNAJ2WbHyNmwWHuErrbj3bjfsd0AOvSHrURyTGvOTWtMIiGhFHMDNlPHZZdACArJaOtk04QAfD5pt0mTUaYuwxpkr0bQGVBvR/kT55h2DCZ3And3p78JKOVxbgvvlqjVvQ40a4eaPBm5E1CIQ9El+Uh74dOXHRmzdTvWDpEMaaleOXHKguxPUCRlOXChCwLKBrYTFu2icUc+wesJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJqxBUlbJfiCCOCagn33i+DWqY3KSILUfDn2I6ZE8Ns=;
 b=TzrjpC6oOGpaOWVTbJ2GBq2bRd6nxzlOnB92QCU7nstJMUNMv+qDnNTKcSuo2aT/VIRWPGduInOqNPLeORYPZgzmTp02VQFNLhi09SfnC1P23m1T8BvtEkT1fH856b27O7KY2GrZLBevH26nrBsIymf1drgmQpKsEIv+br+x73O1gtJq4a5kwEDfYWGFRRJyJuQ3RwG6THcCz/z3jNX7V9L0Lp5HsrwskfVJBWh8RMS8vqwoxdjzC0Czad6gD7Gw+okk22bcL8i1LPPvAr7xGM+2giuI6B7eZ1IR2ooDW83nmIU3TT/f/ZBVhwjzGkXK9E6965YUnr+wkW+fnGLN9g==
Received: from BLAPR03CA0151.namprd03.prod.outlook.com (2603:10b6:208:32f::15)
 by DS2PR12MB9799.namprd12.prod.outlook.com (2603:10b6:8:270::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Wed, 25 Mar
 2026 12:57:46 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:32f:cafe::e7) by BLAPR03CA0151.outlook.office365.com
 (2603:10b6:208:32f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 12:57:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 12:57:46 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 05:57:32 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 05:57:31 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 05:57:28 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v2 0/2] soc/tegra: cbb: Add Tegra238 support
Date: Wed, 25 Mar 2026 18:27:24 +0530
Message-ID: <20260325125726.2694144-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|DS2PR12MB9799:EE_
X-MS-Office365-Filtering-Correlation-Id: ab2e7eb9-6111-4468-de39-08de8a6e1c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	GiAkrXPZTvD2aE9T1p3RkmWwcyiun/VQChYwAFpq6sjcy9IFLZlLewe3D/LngX0jZoSS2WkWTHGGdt41EgDNqwFhEivKrcN2zO/8VCUV9IrMyOsHL6/Jtsbig0d/fkEPSFatZf7rnpkqrqB57skEwGG2z8Om7BU9wqb4wMoHpHdTIqAll99Tyu14rpcNKYh+KPXKJ0FvU1brUl52MHxeKVINzZsryG9A5Fb9VCN5CWxpBFQ2goPUYzYOJu9cPXEs88nVziIsRR2/oyIkX6nDG5VIJVenc9G8sdNYePRZxoBJ/yCUrT7pvuj95thsUJ5/DpzxbtnIS7Eq1k4Sfi5SVFyM16LOqdO1KP0lhuw9vujY/jOZjxBkN6m3VKyXMYJLBO8BvKasvrLeOH//IC2bqSUbC2vsalK8EGiGeqBIe6/ghr2ZbBBWHh2fhTe0YDP+E4deFHKGkXepzMdys3yhj0lDYRZsBhy76RROOQj9TMQqG12Q3yQtQDg/dUxlTyPwfPpf1j1xlZxTlQgSwZYFWBNO/3a86yUsjxRWZocHBRHim5HFHXQDBtXaGAxoMGRWJjBpbFOGVui2lIYte/2B8RqTurRTTkMHsWBQz2rqj4TZ0RUTl/sUwOv08toTNZVR3HXnSty4hRQ2l9lZPQGciVqGjblCUbAbqVXURIDZSFRqH1djPVoamNYIZMU140YkbuAbwdOqpBbS/cBzOx8rxaDSUtm0ydkCL6Vji4TyiyjRiZT3wP0FeIQ1n6o70f/meHIwCvavNFugOlS7E/OLZA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uXYir8uAGApI2NKodvreNiLeuP/+0RIbyFwnw4iuiDhll9NppkUfizioU6NklzgI1J98qiEP+2fbawhYREy++XQ+yw+ZLvUQOWwLFFAP5SxrGAp7LBYXB47Xtx0bBMvkSSzvc2Wgb069t1rkaGzMVo56TGHx6U2MCR5aRK8D/nvglnZIUdM6c6m8YdIlzLbYhii1Y3LnRSRytxszlABzYbt8cFrWXSao2ZqjWA82akWllsh1ikqjLgaYzGoO+E/nUbjwZjXyZyXQy9Ox3Px4178TMYhWzDnDjOyP19rWPwFG7s+yQ05cyzGz6e0RM0aMXgu8O18jvF4EB/Ue5HW72sopp0c4B+Coc/HeDteG+miKQcCwa0QGzLMmDMokv/+LET2JRJh45xioMfmAoSRWlC0WitobdCC2yICqXBxTX2Tx1ihwAvWtMCYcTMLGUviV
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 12:57:46.2219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2e7eb9-6111-4468-de39-08de8a6e1c9a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9799

Add support for Control Backbone (CBB) 2.0 based fabrics in Tegra238 SoC.

The series includes:
- DT binding updates for Tegra238 CBB compatible strings
- Driver support for Tegra238 AON, APE, BPMP, and CBB fabrics

v1[1] -> v2:
- Add DT maintainers for review. Forgot to add earlier.

Sumit Gupta (2):
  dt-bindings: arm: tegra: Add Tegra238 CBB compatible strings
  soc/tegra: cbb: Add support for CBB fabrics in Tegra238

 .../arm/tegra/nvidia,tegra234-cbb.yaml        |   4 +
 drivers/soc/tegra/cbb/tegra234-cbb.c          | 134 ++++++++++++++++++
 2 files changed, 138 insertions(+)

[1] https://lore.kernel.org/lkml/20260303155927.1885297-1-sumitg@nvidia.com/

-- 
2.34.1

