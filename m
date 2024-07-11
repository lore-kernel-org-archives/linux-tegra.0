Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE35716D9B6;
	Thu, 11 Jul 2024 17:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720717892; cv=fail; b=gvUeZ1BzxHfAWqnWBUSRyYmUN9wWrZAXTINYQFix935X71jE7ebcHg1J+vHRmJyDLNEtAwjHYXUUYiVGTdnExwCmjYFGkmor1W4WLJHddURTKzWFyiJ6mlQB38X67MaKbkuU1EFejmmNIJM0XwL0T3GEqUAIknGIzmAeP20hTcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720717892; c=relaxed/simple;
	bh=CoITmqim28TgxQJN5FnEc/0Na4R4IyZhbG8lKYr0l8w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FoO9YR8wYzAln+e9MG2MRpeRoolUGGvoVDeEDLwKFmvEB/LzzVUZvRObe3z6cyJSYmlADvHZWgzPTbkpbdZPtBy/wGf9yWMBBol+C+Xv2PO3zp7tWRzZpfUApEwrwpXlo0bd8qH+Ii/v9u39YzbjJtdUu45Q0yPvqFl7Yim7gHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I3FTk+tV; arc=fail smtp.client-ip=40.107.236.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I3FTk+tV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gq/ltoYm8q3u9Rwn8VbZxfK2ILT26m4vvJ0xCzNav2gS7OwGL/tP1DAGe3XnGwjqH3tWLxNUMvbw/V6ZJfPAOkJkuQvfiU9a/+iVHcYKs3yTmFsekC3fR86eEllMkparJad4qADMfff/9+UKGCI6gD/MFYVEd/92WKYmw0lgEqzmDipPm8jetpbRqZHYdxS1b5wV3cIozOXYuHfli0BxWrll68uBCPOJ/RSXV4WKx5DZJ4xAcyfi8OW/qi7OIdFs/v4nfse0/4SPNj0Q06mFOqsmeaIdgrEapN1n+oSYGbMAl1RRqlPENEXKn6pKSt/Mk4rjluU7tR2+khjPIl/VMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awOQmhxVXT8FreQmpPVu9xTbcLXxSjffxmFPFhrAR6Q=;
 b=FOzgS1o+6i86UXshNP0TfKv3WdU7cuBAhVO1kRshr7TM/GDOnjpF+1M3/8drPsyV/lbrgbaOirSPt/Qflb4VyGFoaFQPe3IDrOfFKsUdp1KbN+6vZN8Ab++VrgjoTCR/AZ9PWA+EKMh/ObMW3XJrc/OcF+DVOtm4dkOwjRxLs4d62FG6gH2XO+dZysqeAgy8XKaGIH8aBsdlC9/5rXHo9QSmw4GUzjiMtyR8PVqsSOzK1w+aDfDfYBI+zSpCWAdoHZlQOydXr+P3XC8ij9ji5OWKyLQFJ1SoOimJDS1MIvG8l9zvRjFJRfL/S9ttY791C0krNqftvBVbPsv36vMFxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awOQmhxVXT8FreQmpPVu9xTbcLXxSjffxmFPFhrAR6Q=;
 b=I3FTk+tVTqXAJnF/csW+yTVqNfIl3xQ8l1+fIHII1qIYgInldbgkk7RV3RTmIO433R5sAw8GlrftKqp2h/w/Dq7amSRF1c1lAtYjjxr54VyXk8vQIdUSESLy+Qt6yRilyU3ijL0rhWcSIUwj5IXRPA2w36M2to9msT5Y9v/Nyu2Ut7j9e/CVnx0O9XTqyCu8uUNpIJ4FOstL+0pyqX9139wh1v+4m8ajf6dKdtpVCBg7wwjZsdPE8oVFFjhZK4pynbJRlP0BZEQvxcWyHxUam9qYv0R+kMkdMxRL7OdQtNcmJf/DmPGtby0K6DdYOeslMgoj/EZGG0Aj76dRUlBiFA==
Received: from BYAPR21CA0026.namprd21.prod.outlook.com (2603:10b6:a03:114::36)
 by DS7PR12MB6239.namprd12.prod.outlook.com (2603:10b6:8:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 17:11:26 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::25) by BYAPR21CA0026.outlook.office365.com
 (2603:10b6:a03:114::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.9 via Frontend
 Transport; Thu, 11 Jul 2024 17:11:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 17:11:26 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 11 Jul
 2024 10:11:08 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 11 Jul
 2024 10:11:07 -0700
Received: from l4tsclab4-2000.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 11 Jul 2024 10:11:07 -0700
From: Vedant Deshpande <vedantd@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Brad
 Griffis" <bgriffis@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: Vedant Deshpande <vedantd@nvidia.com>
Subject: [PATCH v2 0/2] arm64: tegra: Tegra234 UART updates
Date: Thu, 11 Jul 2024 17:10:59 +0000
Message-ID: <20240711171101.2798971-1-vedantd@nvidia.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|DS7PR12MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: c575bac7-03cf-44e0-71de-08dca1cc7fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GnOL5GiRfyhP06mt3rXq+lmUbK4V6YO0DgcYIpuAiM4nOnl/hJOp+ief0ZV8?=
 =?us-ascii?Q?lxB+EwTbN6s0jK2tL2OaLRCzBv/f5MCmQhicj8LwNvs/dmOCBFHri8F08/fo?=
 =?us-ascii?Q?XjsRUZsw3w40HAlw264SGIRGSFCVvbYZ1i/Rs1mNKeftRbFji4p1c2Z5lzoO?=
 =?us-ascii?Q?DwWEZg8663w0fOdF74KEGEen7tPDx5yFaKhAqvTKZCj2av88Wl3TMzL1bTGQ?=
 =?us-ascii?Q?YkcbOPR3460QK279U5qIJpPmy5WcqWQdECMdoa8tg14PNXY7GF4kGS5ewDrS?=
 =?us-ascii?Q?uv9/4uUOobAyDTH5l6AUuYEYZyclvLuWAyYsJqKgndB6ZXR8iWshw7xE1FSv?=
 =?us-ascii?Q?4WFCQEJdQit+WOLZRIW6mWE/3RjRPm5ISAZvw62chRn49ZE8KYoOtg6ojWpj?=
 =?us-ascii?Q?4cYCZbgc5K29JBh7XxCatx8aindWWDWke9qOqXANYgj14rfRlTr9NYVpC8zd?=
 =?us-ascii?Q?/hcMl3v0Wub2D0yUmG5tazHVBmXRDflUsh/O5pIcz1G6HAWM9piUIIVmLISf?=
 =?us-ascii?Q?ZkOD0I9dl4kys1Rk6vpAoNprhip4qKAbMGuunmb+k/Fu7AuQB7K2XzSS4/Fh?=
 =?us-ascii?Q?lHtSF+grjhAG1fvYmZoGqLaqRxhHaOFljd9AbUVjfl6GOk5M1vSPS8+7KSXK?=
 =?us-ascii?Q?qO89n1yRQj0mo2wugyZ6gIYN2ZJSbuXoHPuVHZSTHK1ACzNhxzZYF2Ku2v69?=
 =?us-ascii?Q?fT/JkFZsvZDFvo1KkCKbWe3P96wTWwB7x87CUAu6bYSKV+TfrOPfBscaD7jE?=
 =?us-ascii?Q?A/DN5upvtcLkBOtrHot3lMTYJJio/u8kcNkVeZyRwOd1/uOtOVUtDeuoGLks?=
 =?us-ascii?Q?ke8wmRGrjPdsBp7nX5RfAj1L6GNn6XOBdekhRK27NoJY8CbIqw0A9MbRFjjA?=
 =?us-ascii?Q?0nNdMCX1iuBYm4wfZNAKIfE3z8mkiMFIVhyFgvtO9DGLYMd8obuSiSBFm8dZ?=
 =?us-ascii?Q?9OpI/5f587OxI3Ov6G3gmNWR+3c9EP4oUOKZ2si9tKopGgVJUvVpPyr8D2dX?=
 =?us-ascii?Q?ZxyThImivT15dGRGAKMqhcVMfad6F6Qage6nXOJXDd3PSm8gbxVJYwC1l7sN?=
 =?us-ascii?Q?H2pVMb7nURLpwPXSmhUKG9l0VpL/EHAn+uebUY2R0Z8mFOrnauD3b3W28Gl3?=
 =?us-ascii?Q?pUdCDQNVYRlm5Yrcyko4pS79xPaYbqBHPk1naIgvjvpuEMuL5DPwkGmDW4No?=
 =?us-ascii?Q?hgOjD2O8ZYRWf6Gg0HpopxVBBaJZLyR0LfFagyaD7Lrf7VYDeIrf4eBASmwi?=
 =?us-ascii?Q?oV8FShh8k3GJJCSnYC3d9kJWG5vOjWMO6J98RuCL/8BVRrQ7CScyHvs6yvEK?=
 =?us-ascii?Q?YcWck1b57tkHFD/Ob6DbIeJGYcP+H4mkv3SEfrvaCvv7uT2dVSmzHcsuz9pu?=
 =?us-ascii?Q?i/VJnJdaRkTDDNBRPF7yfEn00gXCjkKkbbLKZ3pm1hrvriYFUokVSwAGIRfD?=
 =?us-ascii?Q?lFmfobo5AvddIsYHcDwQu25E5KSzUJ2t?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 17:11:26.6394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c575bac7-03cf-44e0-71de-08dca1cc7fac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6239

Changes since V1
- Added patch "Add DMA properties for Tegra234 UARTA"

Vedant Deshpande (2):
  arm64: tegra: Add DMA properties for Tegra234 UARTA
  arm64: tegra: enable same UARTs for Orin NX/Nano

 .../nvidia/tegra234-p3768-0000+p3767-0000.dts   | 17 -----------------
 .../dts/nvidia/tegra234-p3768-0000+p3767.dtsi   | 14 ++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi        |  2 ++
 3 files changed, 16 insertions(+), 17 deletions(-)

-- 
2.25.1

