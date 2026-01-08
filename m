Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012038.outbound.protection.outlook.com [52.101.43.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94203D6F14;
	Thu,  8 Jan 2026 14:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767882751; cv=fail; b=nHJvzdNtkfCoBwOZJTVRLeHWpA103ecchlOvP3rBUsWdQL37OroDWwvutkyeSl3fNqmbFAgO91bFCuMDXtk6JNFCM+D3Wc6PjF9y5MrJfyXSCJook4jXB6ArSBnOeRXKPpvgbRmiPRD9MJHUEJhuTEYGEMYGKaHx0MxiN3vaYLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767882751; c=relaxed/simple;
	bh=4kFaD9S3zxwXCyyK0fEkq4WulhnyKXp10yg5SGejNj4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mdQR4aEwvZVpyRq610NFQtVVJem+UnsnugODhqu+xGYGxFP4d0MVznHvB33zNED3dFW/9sLDXKeLZe7U2PLO5ta91IU7qDCAuj/EccODPeuYwpqRlCbTJX+JvJf+fIKWdFxH9VcZQhl4xvITpf9Czi3A1JrBvIonI/eqJ3XPW64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oj0X6ZGL; arc=fail smtp.client-ip=52.101.43.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oj0X6ZGL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ED1dhCYTc9d6NkFo7WA11/k8bpnfLruPN+Rex/leFOCQohfmr2eoRWSeID8iaHoqwAT77xXtL7dt1ysBfzTNk6I4x3rMz/3zplCdvPwpRjfkBsaB+97wcLI67vozJlL1W46K6tfmstmBeguZLSnlk+JoLf18o8wK0Alg4ncj1G7t21Id4LvfqbAATWsqj46OoxnqNBcry8RLYFFFSAwGho+lyZ6ZzDCAZc/fTpSG6VSSLmYJi/mz8F7rX7pufCQ61zNNGvNJeL9niKoWQKji11LVPVaRtyw3osi8O2ttz1GoXOgQZ7C1WLOXMSjfueGHcz6iAC4PTvkf1cUmMpWroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgE2h8zp94sY/gHIplmk5+qXL2iduEBXjL4SKHrmkjA=;
 b=vgOajKioo5bkygP+ruHQJmWUx60Foe+4FGSSQMxWgBOHWWtXOPbpeL0p1TH0q/1k0gWolo2LpVzhjtZb5zTtrfMcTgwF8Da0jEFxnnB3JfYyBEZwAF3aRU7RoEmkfewLpEhnqmeqQ1Qxn7JrBnc1Dubfje4tOhGVi1gwSP/YAPi0mWWMIh8/uyRqLuHF2bIFU62wc4GR7iTvZ1OLzJklXdECvpg1i4DKV1HfFah7dLqw17/2CERop03nuRZdpJM1CtiV/cW/hbktdv9b3wFwGTS3SW9jNsvnXQSKmjj0BoJCsUO66drIMnZACiCqXVKqvqTcPrHMPDhj3RQ+7FA1uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgE2h8zp94sY/gHIplmk5+qXL2iduEBXjL4SKHrmkjA=;
 b=oj0X6ZGLhOmVxde2yITVAqv+/7aWTP5foZWt7FHJxkqbNUH+oSspEHnuxEZmTzOm6lmpuW86qqfqSpcayV2LmxvcAa+8QJSwYDpXVs7a+nm+3OSp2UvsYmN6rPE7yqwD5/K25e5GBfcUe7uM+P7TzklXQPbiMBlpdPcXuOaaCTAoWdXlaEFG7g83EWRb6JuBPJVRd+gAv3X37JHdp3bCCdqwylZb3b1LOfroi2mUix9C1TPDwExiuwrO7giUBN865RQwiXtmp/OYDbUS33pSFVFknt6bUKO2j0rr6zAecqTGE5ncwB8rmAdrCAORgohk4L7rawBWLAlmYc6tAobs4w==
Received: from BL1PR13CA0127.namprd13.prod.outlook.com (2603:10b6:208:2bb::12)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 14:32:25 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:2bb:cafe::65) by BL1PR13CA0127.outlook.office365.com
 (2603:10b6:208:2bb::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Thu, 8
 Jan 2026 14:32:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 14:32:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 06:32:08 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 06:32:08 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 8 Jan 2026 06:32:05 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/3] ASoC: dt-bindings: realtek,rt5640: Document mclk
Date: Thu, 8 Jan 2026 14:31:56 +0000
Message-ID: <20260108143158.351223-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108143158.351223-1-jonathanh@nvidia.com>
References: <20260108143158.351223-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|MN2PR12MB4125:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b5b68aa-d31d-4eec-6cb2-08de4ec2be43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ktF9Y67MFj4QcLoff3e+wvQIzd9L93rR/Sif81u9ibpodCYka10IzeoZRzqy?=
 =?us-ascii?Q?4/hbqLXGqjvCKutgCL3fzRaI5LeoUFxQsYIZW3uFN75QScve28g6QN3Q2Jsu?=
 =?us-ascii?Q?6j4ErMbqWmdu7ve8RZr3d9R/5vDPOEqQHx0Rwx8K64OCY3XeuVtCj9cVY9jX?=
 =?us-ascii?Q?3wOYbaDK1Dzk/GvfeIv5Rp+BXIlXFwEWSk9Jdb8F2CKBYlykE9+e9+/iZcq2?=
 =?us-ascii?Q?bJOWKrPnZ2vEhryUFkC5R6f8PSuW13Mk4V6MoiMTdRm/vvObGE7dPUzip6F3?=
 =?us-ascii?Q?G2mA93RsbRBaDN/no+LdOyeD/WAadbtkxgSGu8Gz5y4aQ8aJCNkdQntDIMPm?=
 =?us-ascii?Q?s1JG7OmwXrH1Ofrr5PRAnMkHyQgQESabI82gIPjFPVXM4NAcStCrnoAfMiU6?=
 =?us-ascii?Q?7LA612uqRnlP06LYX+GZ0DsDFseEY1Rxj6n6WqCU1lwVvHjim8wqU6GIvspp?=
 =?us-ascii?Q?bn8rQ95yYYQUI/ypc9vGiPo77AoqrvE0XlpHz/Tsx9TkAK14+L7jSL1rONDa?=
 =?us-ascii?Q?JBGsR0o8qUR+zuJsdn5akCerLBpvTic8phIc7c/gKJ02HZW4liABZXh8NGg9?=
 =?us-ascii?Q?+dRBTIqBI2wMKQO9eaUDxvYXVfGcGBPma8aPdqSD4Gb6GbhazuCL9Gjc2xiP?=
 =?us-ascii?Q?y0b8O1WDeSekBN1MXRfZdZhBXoMZkFjAqtqiwHTGrU7f9O37cAF3iTJkebUW?=
 =?us-ascii?Q?oHreWJdHPPo9nWZMhqy4oW8/vUq0IMtBYzNvN5m/BvCRNd24qnNiit6Is4nG?=
 =?us-ascii?Q?2bitDVwWiU8209AjGdqbx+qo0gQYrUf0P1vsylYsOk41QPNJtj4jy3Phq3dg?=
 =?us-ascii?Q?xgDmD8abzcDTjg6ap84QqZHyYE/huVIA9k0pt1JcyO/+5fg/Xpoezbgq+nOq?=
 =?us-ascii?Q?Ufb2C21NKmm3mU9Il+1HtR8u93pEkYnXCCnIFPD35eq2Boa0oIfyas4gHYzl?=
 =?us-ascii?Q?RlK6qRL0WL9kWzvYnMkenkw9TRh7Ac1orhTV5BOYx8HQAWdK3r3OkbC7zwPR?=
 =?us-ascii?Q?iLfKq6tAmVREZSDPDyofDUv2Zm2ROgFEIhefuE209BEtGQ8rxVUrnoNLZVgW?=
 =?us-ascii?Q?cTuWnpuJMHa+NKUAEXzoK82/Z5iirLjH/F4T4ky2+kbPVAd4DgX5Z3bJUXz3?=
 =?us-ascii?Q?bP1jrli77WcQmdDPs/bKo22KXuag7/v6BXW3Du7E1e99BFkPIxX1pltoawss?=
 =?us-ascii?Q?TbifwCtgcR5UJFPXIef0DYTvZN2yzSdub0i0RbzIvD4jDfURvP6kLRPKU2LV?=
 =?us-ascii?Q?NW0SNM4Nk5N+EMAuysYR/AtpYsnYdtguLwSERUwyZgij8FFI41OJ4Vjm7W2i?=
 =?us-ascii?Q?ZQN3fbRO9/YoSvIFvTKFnnJxuvSa/+NSv+3nb97AxyVnP1N/ae/CQFeKJMMH?=
 =?us-ascii?Q?xbrjF4cRyBKj1ibM84WTx+WesglSI3Qkp1OH5rdwC9vKJPQ6T4KVIY8XKK6D?=
 =?us-ascii?Q?OKLl6daeSMA2ya0GPifAnGZo2Bh5tagBxy89pyx6LnKjfOENyT+XozoUGrGd?=
 =?us-ascii?Q?xcgQ62fr/zJ19SkorHhu8AJB1qhZ//a46BAntSdQR03lOcZUyVAVQ+XKC9Ls?=
 =?us-ascii?Q?US9/IJHG/0SBhz9ybyg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:32:25.4021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b5b68aa-d31d-4eec-6cb2-08de4ec2be43
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125

Commit eba5a0bac211 ("ASoC: dt-bindings: realtek,rt5640: Convert to
dtschema") converted the rt5640 dt-binding to yaml format but in the
process dropped 'clock' and 'clock-names' properties that are used to
specify the codec 'mclk'. This is causing DTB build warnings for boards
that use this codec and define an 'mclk' in device-tree. Update the
rt5640 binding document to add the optional mclk.

Fixes: eba5a0bac211 ("ASoC: dt-bindings: realtek,rt5640: Convert to dtschema")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../devicetree/bindings/sound/realtek,rt5640.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
index 3f4f59287c1c..6bb6e12bdf8b 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
@@ -44,6 +44,14 @@ properties:
       - realtek,rt5640
       - realtek,rt5639
 
+  clocks:
+    items:
+      - description: phandle and clock specifier for codec MCLK.
+
+  clock-names:
+    items:
+      - const: mclk
+
   reg:
     maxItems: 1
 
-- 
2.43.0

