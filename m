Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010057.outbound.protection.outlook.com [52.101.193.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1C71E5201;
	Thu,  8 Jan 2026 14:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767882751; cv=fail; b=AuN3mKvlZ0R7bpb4FjsbejWp2nm/+LZMphx7xupzOBV1Z/rL4vi5wkyjYl6y7rErRfFhLMaXsoMcQ4//13HM5aqYmHscrcqhR0/Nt0OqR3x16aHy3k1kbfBgDff2Y10MpWA+E49WXAF+SyrzaHeWsaHZuZkPLr8Oz1qSrhUb/xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767882751; c=relaxed/simple;
	bh=k4rTHcaXEzgakrdOEcW59TyHWuaDwY6ZXuscb21ZWbg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QY1o8VcH87coHHnHrG5yANO2pAL812j+E+VxsTQ/whthH01vd2GKYpw3jjLrYEllkF5v1D3sXLbve0xLB0Un8rQJJP3mtsTOePA+sg1V9oF0QzZrRXiJEh2iYX7eWa4+8O4A0hEPyGPTmMWgUSLnMTIChp4aaUM6MmNUsEupQ10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DAROGi1+; arc=fail smtp.client-ip=52.101.193.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DAROGi1+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ee2cmxsmzs0Z7DioYJbPmoozq9CDXbNPmkb5OQXjZXBw48n7eDIr/IQgNjy5YFAedxeqRkdnl0jirhrkZvyEBRDfEpDmpel34auaf9g85o220Os+ecQl9Ep1oBH0jGysO50zUBPyEVOF5Tp6f+uHZFIhQd8D/NHXit2DYBqwksJEkeGqUlU+xu6ddY9NLzmMtcJ3XfEcDdafqCkUh/0nCS7nYIKaSMRI4RRLJZdvZInWaupV9CHX3oyUocuprfyu8b+Iv4rW264o1eSw3yUKifRJR7Pp1U5flRApgR7/M871gLZs9h02hUPi7veIWMCEEmpI99ZxV5LnuxW6yrW6mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v054sxjIXgZ0/gIjuq11U55Ka43U8rwCIMajNMc+5w4=;
 b=NQ465w48kmkyuxwMWsWq4Dhj+eHXs4RCsBGpLCFekMw+lA3gd4WVYZfrPsLuiG19U4TXOFNCybT5WdYw3yhAoTg8ltZYtiFpZfIURzH+A5LBIcOIU/nwYyiLeyu95gtenaovIWY2doKHQjfQZyHiPODnFd+ZrB7u+zJUfgkXDX4VuOznNULk0a+uIkQ47YQzFewbTRX0ay1o1fPS7vsWbH/8y3tHYralhCd5nU9BQ2IUUapw0f+83f3x4LLt3c3gKL+cMZ1EMxxlO/e0kjo8VpDNZdo1VHL9JQdamqkymgkdYF/mJ5gl6Evtya6Gsw26/QkkH/YBvl6YpMgr1qEHRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v054sxjIXgZ0/gIjuq11U55Ka43U8rwCIMajNMc+5w4=;
 b=DAROGi1+TprAVWVbk0p9/CR+/bpm4e+GymcMZUwFnJ4qhL+3O9Lbs1AIoUWzApugM4rA7ImYq2ykyZ+dS8PLfOtX/vX4cMuV+9mRxBuwHoGAjD6GpQr7EdWLLnbt31M3cI8NYQQldfWlrX7fO7sFLK9ZXktspvX6SvTHP57Ll8poqlegG3Z+GRgRIeJS/VJBd7BVrCd9uULDKUPUDUXbA7b32jVwym7Jty9SB0MrgsbK9yXfw3GEI3DxHoJVWi/Al8EDQ3yO4zPfyOztgcaV7TCrMZL+jS/GumrAsd6aG5k0zQ7lyMDIZOzczEfdJbky6pgk/wyqVA6k4HDALvFJgw==
Received: from SJ0PR03CA0231.namprd03.prod.outlook.com (2603:10b6:a03:39f::26)
 by SA1PR12MB7200.namprd12.prod.outlook.com (2603:10b6:806:2bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 14:32:25 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::c) by SJ0PR03CA0231.outlook.office365.com
 (2603:10b6:a03:39f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Thu, 8
 Jan 2026 14:32:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 14:32:24 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 06:32:05 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 06:32:05 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 8 Jan 2026 06:32:03 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 0/3] ASoC: dt-bindings: realtek,rt5640: Various fixes
Date: Thu, 8 Jan 2026 14:31:55 +0000
Message-ID: <20260108143158.351223-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|SA1PR12MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: b6268015-b96e-463b-b9ce-08de4ec2bde0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E+lPLvEgzRwpJqCDslfrFhAC2Yi5d30oXNAht8lBD8Nxk6Yu1dFzbOHuj9NW?=
 =?us-ascii?Q?c/re6X9qY0poogp1vQGOWj/W2lEU85a4/tgMxVNWUYKWWVzmYXNKiNoZwyxI?=
 =?us-ascii?Q?cjiehrB21D3GtOv6vnhOnmiSSrL7m84zNF8A/YMaeg8a/1LB0x8MXDT9us+c?=
 =?us-ascii?Q?dFJ2r0No58GZGDZKyOw7D1ldQKqHJG13Fwt6EBG73duXo8UByUhYqxhHJg+n?=
 =?us-ascii?Q?jawbcSr9vvZQteQSl8t1P6Ek2rp6Ha/Ee3aZyi5ml5P01+cZV+WSQ0WZKAqS?=
 =?us-ascii?Q?VKWem17mxu/er7iq/SNMh0FZbPqw0ksL+T8TXKXO32gPYwpl5DU4wxy1YYi5?=
 =?us-ascii?Q?RxBBnF/Q5GOFgOm87ZYf7FOOqzqJc+MET7/1povw561mxwRGeTMw7kO7gPQV?=
 =?us-ascii?Q?hKdnISMM5bWA82pyRwypMMRgopvrf5IXmqCZ+HtVYiJlvtm9WKGpYucFUJ9X?=
 =?us-ascii?Q?HeD3QbNo8vFUX+wXRPge6lqsd87Lh6yUhQ4mHS6PorP/8oyPwe2wV9evdaz6?=
 =?us-ascii?Q?MSEcNxpc9CMcgghvwhB5ubm4x7FyX7Zgc0GcAD/v3sMrVDjT1I7Ii39eyTLP?=
 =?us-ascii?Q?q6lMuRTQAeWNzxkMQJ7p0DTc86US4iuW/mICJIdLLHaDchPLkvO58jo6miOM?=
 =?us-ascii?Q?P317hgYk/nKmSAYudVwJ57aHJhes+fDkC36eI8pzQkaZUbFOyVyZdWQ6HACe?=
 =?us-ascii?Q?brrqQA/IbQIoMPLaGBCJ9M+XJWoCkMtoXMFmLA5Dw4Zhe02r9VsfYi43ISmU?=
 =?us-ascii?Q?sNWK9o6apmaRCYMThbdkxGVi+xEqMzKp/kBDFnOnMQqFhqGAHuAXy0gFosHO?=
 =?us-ascii?Q?JHAzOofStta/lW4z/JNjYYx52nFUmwlnXKp7Uqc2r/osxWBdwQ5fnDTpRtMp?=
 =?us-ascii?Q?HNHtFMIVgvOE6BWUR1SGcdSlq/L+KDxjtfI9B9MMwWGoeqM0noIL364bHBAw?=
 =?us-ascii?Q?nL7dNwLpPEZpKq2xJKYw4Ye/ezA0ySqTBRXMJDeThAYLEbFGYyGfVJtkSB16?=
 =?us-ascii?Q?owvLGZhA5bYnUO6ok1i6JdQQEIuFgJ/HAAq550zZkKeflBfh41gD5WyrMVlq?=
 =?us-ascii?Q?97P001+jSZfeNeZe02W4WcDMeDdokQrFM6IOEk4Sk8XCEVSugGuCRqko3gKD?=
 =?us-ascii?Q?3m98Rt8TZFGOJfW4SkK3ChIZ2gpOLvm4RKVUUUTbbQjZjb7CYU/oInH8SRvZ?=
 =?us-ascii?Q?NFU+k3Sp+xZ+ocjJG+7lcYPseZ09iEwLg3YEIPEgVYmVxv8BCsTyXJgkw4/C?=
 =?us-ascii?Q?S3DMDutPTpRK3oH/RTMcV8xLCdyVu0Dkdsbi5tof/5BSiQ1BLdsGIC2Ku4sw?=
 =?us-ascii?Q?ll2OMJtAajljvwsIlc7V8XLwmnZoZxksZyyHcglDIl7o3+Ky8PoRYm1X32df?=
 =?us-ascii?Q?4FSuexbPKcARGUjAy/3e0Gm66xnr4Kid1pcsLkoH6asiGBFfLb4PE3kswaoi?=
 =?us-ascii?Q?0MZd8m7vYZfuE8kXFADUBqpTgCUGvb7xpVfZtsPh+qFfUkj4GvfPKGvI99Jz?=
 =?us-ascii?Q?jtf5yeR2HcYN9OP9tvpVFPXBnIAfPtYpX/zjNJMqda2pRhns64Fw+5CzTOT9?=
 =?us-ascii?Q?DdA/D8339R5v7nYUZvA=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:32:24.8063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6268015-b96e-463b-b9ce-08de4ec2bde0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7200

This series includes fixes for the realtek,rt5640 dt-binding to address
a few warnings that are observed when running the CHECK_DTBS=y for some
DTBs that use this codec.

Jon Hunter (3):
  ASoC: dt-bindings: realtek,rt5640: Document mclk
  ASoC: dt-bindings: realtek,rt5640: Update jack-detect
  ASoC: dt-bindings: realtek,rt5640: Document port node

 .../devicetree/bindings/sound/realtek,rt5640.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.43.0

