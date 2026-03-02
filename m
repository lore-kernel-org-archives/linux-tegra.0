Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013041.outbound.protection.outlook.com [40.93.196.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87651E1DE5;
	Mon,  2 Mar 2026 08:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441658; cv=fail; b=DQ00KNeEwqZ/aaQZ9NJAGMCWG0B/mFD97OHnCWBUHpymOapp0BxZ41aozpWZI28+MSHfwiZGvkqqbXAbyii0x5cXy6xa0CxEyOFH/CmtHucxtnNVhZkS8lOou/KIMNlK6wjYFtcjO/RJUeWZdBTlc7PaNH6YW3WhtXQo/Yiul9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441658; c=relaxed/simple;
	bh=go8DjOkZySUMRfQJnr7WNWhou5ZHBChbt9s8qAebo08=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dhBlOee6NLdusHTEa74/7fZPrrp+CitJ+sfwZlLbOV8fDkgt2G4bM+ZNa4BDDXK/OPpdV6XZnQLH8tar9leercT6+ryvkogxUmWPpqOcGeEzI+nqWsh27G8rtnfc1UG4lPv/uEbTdyth197IHuwuLhS2WtzijDNP3myKBepQuaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P6br38RF; arc=fail smtp.client-ip=40.93.196.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P6br38RF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRCStMesMfQhCBcz5mch2GcCj6T2RGLSoMt5ZCsBIST05DAgB1vZ9p5gs4Y4R42sd9SvPHjFd4nrl0Vurs63iKxxzmSN/vmsKbwatwxCYIGspjjBkYGDVHp2vusIuTHIS1SILpYWrzsnoqN1oG6wTXySUFFFg0o2tRTbAJESgqD+U8/Bi1iF6Y0+uGF0odrdfLJwtRI2Ah0VAQz/lW76GVbKGJR/k7a/qKDdBRgUWEWu7yOOGU27a+5ZcmWFRRJdwA9C3mYIRqsmzVZLAptRe2m/LM/IUo/DVMl554CHu63FTDTs348kYjcPyLVPTKMyov0uXTiswHAU594HBH91Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SPqq2J9bR4dd2WRAzW7b6VJBpLR1EP2XxT1fv5kCyE=;
 b=rSqPK7C5bdcpORqv/qIBy5KRmKXmmKPsO+Qai70L/8x7Fv2E1ZpEO3GTqWpCyHaI+pzZNSrkHrwmuccJv8O/sxq7RK2kApwAoN9KdNnKCUdvMr3JeI7cjL4CKa4No4KavW2W/imXfIOS5ir1/4A2bdEDNoiKVVAGQ03io9dV3gyryJuniwq+zcQQosHhVqhxd71/B+mLbot4X29qbYIWJtq/8PIxIhmS8jYj9CAnDrP04lxPR+BnSLO0P2nooSg3PtKB7wllqMr7QR7JcftxHoM6c/Q0cT2Lkk2DBAaxy4QLUHpZZViX8ZqvpGrvTLjBNmt7PKRmDWm+NRA+HhrW4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SPqq2J9bR4dd2WRAzW7b6VJBpLR1EP2XxT1fv5kCyE=;
 b=P6br38RFWlt00Lz6VX6Zi0HRjPWVkCmTGeX4VWxQ3PgMXmgPPFK15PWeBNnj+Lu6FF3wtWVID6wbDpnwAbVdBrFsp16ONHon/VWYbqjI5ttm77+awKexTqSXslFYEa/7NZRwsvYPpGHBPUpHbMFcOZIkoFgzI1Q5GAFq5xe+O1lMJgI9WQ+5j7rxQE9uAv8YfuSDOsWd5j8LvBLC+Lw0JeqkV7oNQac+dzYHN1IJDyrQhpE5PZewDcE5SaZqgP3Rn0G6UkC9vhmo5bqD50f9TgQbdKJThv+C7CWny+jwDQLLZlNYDeEjv4vnz+vyVvI7xN1zTlNNLMkI1J8vxFHKLg==
Received: from CH0PR04CA0040.namprd04.prod.outlook.com (2603:10b6:610:77::15)
 by DM6PR12MB4186.namprd12.prod.outlook.com (2603:10b6:5:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 08:54:11 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::ea) by CH0PR04CA0040.outlook.office365.com
 (2603:10b6:610:77::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 08:54:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 08:54:11 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 00:53:56 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 00:53:56 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 00:53:52 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>
CC: Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Sameer Pujar <spujar@nvidia.com>, Mohan kumar
	<mkumard@nvidia.com>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, sheetal <sheetal@nvidia.com>
Subject: [PATCH 0/2] ASoC: tegra: Add Tegra238 sound card support
Date: Mon, 2 Mar 2026 14:23:21 +0530
Message-ID: <20260302085323.3139571-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|DM6PR12MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: fc8b0f0f-b3b0-45cc-86a5-08de783945f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	dlIvr+Umg3M9fxo4PrQlXebqiip+Ak59ff15i8Qeb8T7jnHgTs14j2AHAIJyjtDL+5I8G1iLYt7p779f5c7mLQdkfyYRtocbTYIzjC5ZmYNBel/LBAQVJKTqi5ftGSBlZ3ey1zfwIx46ec+3z3d9cN4VeOf17PXCLE0KP1Nlzi5xdeaiAsqVwZ7oruC/2sK6rPIWCrkpO568kQwFmA0ZK855ezj39dS2E9FRY8lZCNVqr3GBGtjMnhOHu7eMWpjKnYxAOlSg4d8+rgtRVbnrO4XVS0TOaNBAdvamNwydi6Rx9yQPTLDigSfbbzCv1+GUUBW/HildFc+1A5Z9NGvLLc10/9SgTf5bzcc3bGD0OM9IFURQthkwa2lZ3CMyzTTC7BmxeMjfBEJ6kadLJmnMncILjMYeEz6wNWRgVUdrSTKDHFVnZw3v7k4xJl2uVUXnbtKU0tsUK6pTTI2T3tRXzqKXi24LyQuZL9yUQFdJ7iLXU8a9NHbYxlTlNxV9KTlAzbHGBNBqEKBr2Lfj26yLbf+CGUlK2e1rF1RsCUotV2WezG53cnUocWqCXt7aaHyKqw5IN5vRCfKgCLZ0745BgU/k83KmMxr+jcCzbyji75WswcziewSif5szSJnYUj1MShVpcVPG5IpSAIosWRe0G66TzzRMnsFfumi0lipLv3yhT+AQbwNA6oGsqyF52Xcl70tFOIFUVjCDqylOcJ/+dBVyKCUIUJ+R+OZi8Yuk70isGyC75ddT2QIVe6QklzVrpBzCVsFXEuAKA47SsnUfv3XdbICzNrZqi8LlvAGo/QEqKwiYa8Mn8k878y57Ya2iw8L0aY2zO3jvcJNKYjQhIw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NM5mGi4p96WcnRWmEqQm8b379X6Dht6UwvM2M03iTXgvH9iLcF7/C8xYikuMlhcV1nfTbNdBtK+yUfNboiZnOeYm9vShsKtXQYrlgILPnuO34zeLl1WZSDLJjET31CJrZeGV404ezAZSbf9/lyc8oKFHUNUMRx28KmM7ekYLHKoOhMTmhHeayZqPeAQybd1KKIcupnhp9/h5/pS/FZkbb7RjNijoF8V7wcwaTJXF3kKlYb5+Wc5aZUB96FGT7qUy1weQ89DEWm84cj1rMWtHDZ+/deoCFYARxK7kKk6zkK2Rl59VbzkfrZz+Pdg5r0CI9L+V6Q7ZiMGLeGN0tbUPbIC5RartX2vBye+H4L3b6CVXx6QSlv27SjUp9q4+JdhU3SIb3IO2Ddo0bYc7zpB/flTwIekGj8gzxF5V8XzkK98QumH2fLe2GU4/nOmEqLv1
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:54:11.3699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8b0f0f-b3b0-45cc-86a5-08de783945f1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186

From: sheetal <sheetal@nvidia.com>

Add Tegra238 sound card support in the Tegra audio graph card driver,
as Tegra238 requires different PLLA and PLLA_OUT0 clock rates compared
to other Tegra platforms.

Sheetal (2):
  ASoC: dt-bindings: tegra: Add compatible for Tegra238 sound card
  ASoC: tegra: Add support for Tegra238 soundcard

 .../sound/nvidia,tegra-audio-graph-card.yaml        |  1 +
 sound/soc/tegra/tegra_audio_graph_card.c            | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.34.1

