Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2087.outbound.protection.outlook.com [40.107.212.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EF58F40;
	Mon, 12 May 2025 06:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747032203; cv=fail; b=ZHOwENbNWyNJoT6tbyp3si0xiaY3wdaZaEs+Q/9mqPEKX1Z6FWFq9xPhynUd+kQfkFRjDFCve8TuctJ11Cz/wB9LEiJV3w1Cp9sqQBBss5VEzM9SGzcQwIOszqG443snUBh1KP3RkTkAp80BJNChlbdW3aaHQrN2xAlSpNHdkTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747032203; c=relaxed/simple;
	bh=Fgw3G9tTWH5S2wQC9rocmmuIOJBTSDdsZxLioL8KiYQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E++kGhRfH+EmfQM0qsy9d1fIi5w59vaTIGYQ8Ane+bcTG5CRMYkSgS/qykrEVGlKkILDe6AhosmAOG4R9gO7o+3Bna6yaVD2WoXKjPkTAPo6IkAEW6/kNB2SFBnI39GB67v/fAQ8Pr0JvurKoJrXlsqnzrc6DUXyV0bmh3l9DgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=slusKMi0; arc=fail smtp.client-ip=40.107.212.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="slusKMi0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDJKObuNqYlIg8SO8BpOYEdWUXHIXqHAegK2WS69pjaT/9FDlvooOFG4qxTKU4RXgMEhEOuFFYLB9UIDITPaiWY/wU0LU7NRIFH6x4x5yngtDB+sLj5XO8IxNl3tHbBJZDDFrLBybPsIzKzAGMxBgla9H4C+ofgUVlnYyEWBPTSKPNTlMP4JDWIvphd9aHzkoS3SQ76fNd4S+/kP5rgK9EWjLv5seKg5ZqXmlk7+r941iFsy27GGpJetXdJxDpyE+3wgoq3yprERKtk4yULLe1+oJZ49qIWwwUmuaFHa/DYCyb2prKFmZVdgeDnIkSJGdKExMs2BIsJWA0H/tTx83g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOvrP9+lRq1LYq1L1MlnZbEAo/TRhvTHmOC2LEdg9HY=;
 b=RfdpNMiUvSpwbixAQIPYpSsOYZq1hQS8vySOU4i9g3E8LgQ/2zMAYu2G2IBnufD/ZYTQvA/GtgO8+5X5VuZrHQ865TrsQWAYjxxXbScNTu/hi6E6Y+REt3nBfvSOuayez0YRSxUeVZ2KB+twQqH8VIQOqLfhrsODkuj2o9EjETy7589icydHq0s0Z6hlrvDA6cPVgGT/rWgsJupl09W/ZyRmkdYM28N/pDtP+I25IdOsMKFCnqaCS1zyLYH58ji8ILGV46xKw4b9rBqR16RB5Pd0EqPB9oHlvNpXCtSbNM3wPhYqZHzfCIp6UHM2SpHzTfM+rfSgaz8N0EsAfN/lKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOvrP9+lRq1LYq1L1MlnZbEAo/TRhvTHmOC2LEdg9HY=;
 b=slusKMi06ZeO5Sc1WC2W3iekRqP9iz/6Q0mYHTVP7k1LEUhFw81rQOrE4hfEJe/tTGiCC9fk6Hqj1Z9lcpo0+OzdVoS26a2+JyvHinSApUKzxq5Do2I1ftzcOxnx3Ax9sBfvN20nrXy1/k4qNnjS6BBkOpz4BCJFd2w/T2mwy0YoHzyFFmi5KQKhRhQulw1tt7c+SfgsU5eUNsLfaIgRoTCxVOqjgDBuo0GYBjQ+KbG0KBMAktpbOdVIYD3CS1cOHZ7FpkncPW6rrUezHewEJvtidaxVECreS+MQfMTE/VEafQudEL/eJgeqPYknIvJM9dSUbJDiwf5jPdh82nDarA==
Received: from CY5PR14CA0001.namprd14.prod.outlook.com (2603:10b6:930:2::13)
 by DM6PR12MB4219.namprd12.prod.outlook.com (2603:10b6:5:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 06:43:17 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:2:cafe::9) by CY5PR14CA0001.outlook.office365.com
 (2603:10b6:930:2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Mon,
 12 May 2025 06:43:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 06:43:17 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 23:43:03 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 23:43:03 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Sun, 11 May 2025 23:43:03 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <perex@perex.cz>,
	<tiwai@suse.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 0/2] HDA: Add Tegra264 support
Date: Mon, 12 May 2025 06:42:55 +0000
Message-ID: <20250512064258.1028331-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|DM6PR12MB4219:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b03f9c9-cb93-4c2a-08eb-08dd912046f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+sA+ohk8zESSbTdIGI9W0pgS5JqctFa73ERwl0NIqsHQDC8uY1O7tFvLecQK?=
 =?us-ascii?Q?LQb5aTOIdXBGlCHU8ulYqHYZBHyvqatX+DzlW9Ar2K2dGvtszGnd6eVbKvdZ?=
 =?us-ascii?Q?HyI3jj0Aoqx1A9lqTwa1h0yrqdw1mjGQb1XPA/YONmZlF8e3j6I7Ey45mDux?=
 =?us-ascii?Q?eSZ9TZVW7iT7dSEC+wLNzX8HkVlcvmr8O5coEfisfK+LfBFJLkxCyPUMgkiQ?=
 =?us-ascii?Q?iPy6XKZB2PcCqKBZjLdQXUzE5D+fSGFI6HTO1ytmpN2iriDWpkDjmizoB7fS?=
 =?us-ascii?Q?6Hn9BpzZ3t6mUbQaNgQ3mav4s73Sl5bJ6eboFGLomFXj5L+hKOSol608GtJ7?=
 =?us-ascii?Q?VXjtS1MKvl+3scWKbrOh0xN/k5dfcjkmnyW0xLC9xQwo0txEZ+7LskzSKxZY?=
 =?us-ascii?Q?CbmCADEJJVoOz9NoRa5aCzzuwwVLTHXEjd7tTCtiyh2JFeZ7Cnw0oe9c2De2?=
 =?us-ascii?Q?EkjVXBvswWYsJP3PhI8YSvEC/QrC6crAhR2qakO/XcqakAW2eMcwpaNjoDKq?=
 =?us-ascii?Q?VuJcfk6slwdhM7KRD9QyUPMd3bJZZoHChawzd0OgzW0dqqX6KwzHabJNw/zs?=
 =?us-ascii?Q?F6cokW+RHz6dtSZ1GGRHzOmh7NPiTUNds+hwArXz3nVShGK01k6nNyCbv774?=
 =?us-ascii?Q?ZaaOY+fGm758U0TpD+Utm8eDr/STc/25y+wt0qkAoY6AvN1lffj9mpQtfflI?=
 =?us-ascii?Q?dl53s8KQL+T9blUwye32dd57YoDd5Xf66JELDYoHui1kFGR9cUa01UeoOE+K?=
 =?us-ascii?Q?0xXLSW1yO3ftMeRcy8dyQPpIX8aIMoRym4Mw52qYEvM4vISwvVCit266++kk?=
 =?us-ascii?Q?bChG0T8fZmIDKTgvKLBNUQFpMWa+wea/7bTHbcpiIhPF1biSHVGANeU6NSUW?=
 =?us-ascii?Q?OARF0f/ShhLOVV4TUlA+IMz9QEbqXCANKB8ejL8SJHTbEicFeSsOKyknqZGK?=
 =?us-ascii?Q?npKZ5gjV1jcujEzwJLuhc6Z67nbIulodIZpEd7laJgJ5jJBMcSfqtL4urxt6?=
 =?us-ascii?Q?oE2g7LSxiHtmmwo6PIBdZ9zuwdZf/zPDwGMLmib+diSBexVHIblz0MDadBTo?=
 =?us-ascii?Q?RRK72x8NMHEWZnrXCGoKSjfYxkhmdbOk33O2j7FmaHIi7AXwHXSraVXtvfIM?=
 =?us-ascii?Q?xOK4EzxmN6LgsGOfWLAmyJUIDsH13UVn33OaUdFYmujiPzl2E7yXvdpw1cIe?=
 =?us-ascii?Q?9dfdx7lPhaKzwOKYtSA3oz3T5axvq++yhGBbjeW6RDBo953EOCKVB73LhXiV?=
 =?us-ascii?Q?ajAbVvEmb6Zp2ajortWG9CZIzeImjQaZoagYwPrqF6IVUWiV0+4mUDM31wAn?=
 =?us-ascii?Q?alo9t66TYe56auIYnuRBbsudaInsjPL38A2Dl+AtbWhg+uQ1uuhPCdBw5hiC?=
 =?us-ascii?Q?q3uZ4PFo2b9nX19FHi02qBcAOVseAM1BSMZuSGlR6/9c40ySZGF83Q2xpuZM?=
 =?us-ascii?Q?6nAysl9pvDW9f6k1ZAA161LJCjZ04L45FkaOxNGdFP5eSSkTocbGW3OL39Me?=
 =?us-ascii?Q?JDiSxtS6MVAwi7vXTMi1M+iS8MSD4BIyWhof?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 06:43:17.1014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b03f9c9-cb93-4c2a-08eb-08dd912046f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4219

From: Sheetal <sheetal@nvidia.com>

The patch series is to add support for Tegra264 in HDA driver.

Mohan Kumar D (1):
  ALSA: hda/tegra: Add Tegra264 support

Sheetal (2):
  dt-bindings: hda: Update Tegra compatible requirements
  dt-bindings: Document Tegra264 HDA Support

 .../bindings/sound/nvidia,tegra30-hda.yaml    | 108 +++++++++++++++---
 sound/pci/hda/hda_tegra.c                     |  51 ++++++++-
 sound/pci/hda/patch_hdmi.c                    |   1 +
 3 files changed, 141 insertions(+), 19 deletions(-)

-- 
2.17.1

