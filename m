Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010049.outbound.protection.outlook.com [40.93.198.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D594194AE6;
	Wed, 27 May 2026 14:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890519; cv=fail; b=iiuMUYVZg85f8SgR0yqx14t8B7sIr0jrYFvbl8l1mx/cNTrJOrYOjIApZXOhG0oGGcj0RUXz8FLIGtHQtyEcp87k2wx/8ahCBdWi3/ncu4hrAGiZ/q5yA4xTNKcqyc/H/4eKHyJqwi/3WGI+uHatgWY1KeJS2OtYuCyVGq0Kuho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890519; c=relaxed/simple;
	bh=GYmP9NuVQn6PqwzhagL1G+XtMOtDWA13WgKdJ4U2rzA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tRuSAiLklRlTGcmf4Wa48iqZs8cA2yp0yS+adCAQmzMvZTtyGbU12mHW0MvXCFUui+qqIIhq8Mhk+69O1/5picqeDFWqAdMD5UWb2cNSHPEmfwXfPiOZbFCS+vAnnmbFXrk1cfg8r9rj1C6VhptxaoJndmdIwsJ+66PXEYbnxxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H2XYgsn7; arc=fail smtp.client-ip=40.93.198.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H2XYgsn7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNmyzUbbn1bUUCi2RJgPjy5ZbOaO2Sae8d1iaS53Q1Qvert9Rb822chI/6QuBWTbsAnPMp/M0/RGzAef0oTQUjhynxAFdv1uOEqJO/7HDxruOjdu/ezEt/QwreaQsbjRX8DlJ1GjD95eNH7FkRX4ck+E139uFZflMsQyJp7s525jT6xWoYa52zelbaFK8nauhpVws+Tulxny7Ods+zC5Up8vxwZe4vQTIwTeZzfl4w4UCeXc8POc8PcDDk/hTwAOIA0FV8UfvDbkpNZzZWq/q5YoPKxtWLDhczYSW706GFF7VgoTYn2YqnubE0EpIj5uHfm8aLEW6g/Ev61gDcXi/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r64znMdlo9+Os2k3LzSKXQRT9KeyX6Q6ZnaceP/xLMU=;
 b=NFnZmiZ15ylcVl8n+QgEdWn0EqAq7zLQkxJSNsdts9cje3HA2kWlpOQI6jYV3u7nWZ85Y4LewKvHCCeVWkkbkrtpmA5uBfurel5+PUPDX/6IVCa0bc2BXNYqMlijDpKspZBlPTPTt03i/HAsRo2HEOkNQOW9iGaf7kAaxgRfL2ZkV7heAmYoxB+h8xUHPpmC8jHdxPz3QwZgaQ8yBS+ERWdKma0bUYL3Y7G3HI1YQrAT4DsTr0baLCleDo2rno1+CdPzqC/gCSerxiwkIhp/6P49tZ9/QGHKDXzH+caozD52oydxfAnb5++Fr+7pdpYsFXHVLrgp7VbNj4tdGpAKRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r64znMdlo9+Os2k3LzSKXQRT9KeyX6Q6ZnaceP/xLMU=;
 b=H2XYgsn7mwsEBsJM//CXjfhCACpyTBIaa/pH65ZXErQjlb/7tF1diyzB1/d0O76Krr3tD4Xn/qsTFbRhY65DW9jm6Z99arGTUISgyeH4u3PmDW1hfOQNVDUd+Kmqr7eyH8lBOAVoafJo6IsTVTUjU4HcOaH23YBp5Pm0Ndo0AaRR64MDAwRB/MFnaIKUi6+ZjdEdPE9JA71UaZVmXl2ei4Hac84jF5aTqQAXdCl7Y0np54S5/Devj4vZQLSCp+hwIFLPQ4Zmf472b7lv0AMGmZU+ebvT8bjmqGpnizgr03ztNo5kqejcT0+ALWDG5OSGZk3P3uTVjQ5+qvz6Ef6gXg==
Received: from BYAPR21CA0020.namprd21.prod.outlook.com (2603:10b6:a03:114::30)
 by PH0PR12MB8052.namprd12.prod.outlook.com (2603:10b6:510:28b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 14:01:53 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::48) by BYAPR21CA0020.outlook.office365.com
 (2603:10b6:a03:114::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.4 via Frontend Transport; Wed, 27
 May 2026 14:01:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 14:01:53 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 27 May
 2026 07:01:32 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 27 May 2026 07:01:31 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 27 May 2026 07:01:29 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <krzk@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH 0/3] memory: tegra: UBSAN fix and cleanups
Date: Wed, 27 May 2026 19:31:24 +0530
Message-ID: <20260527140127.49172-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|PH0PR12MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c808e02-2904-4e87-78cb-08debbf8816c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	Oa9ySZWN9Eevv4dJhRPr1dR8OKQ4fVL3BShgygy68PZ1nNOj+C1yf/bGHgzflKc3rgnZoJU1/DD/6GAhM/VNJoWSHVjHIa4siNGiEZYYUjrhkRLj8EJpfVAqLHhSfL+y2+c/ocJcNDPkKqnQGIE52m2IIgDB83M46//A/snE+tweo+3FJBS2rqFNnAIyhj69ETfQjyopxODmMpMA0UB4S3YozA8x8zu5aBCqGCbANfJC+yFMA86mOCMz6Q3ggXfx4Y+HWd364IWGCs7CnzWkFVXAEjs06OIqry+eaVZRrSkCMk1QqGHGgHr/8Cir/2LHVb3qn/p9wPfF+gKkDgRr2eKeYtHdnBXEWIYubpPAFLRomyrXoJDBfcOARiEkuiiF5ECngngYypjNS8qagi+3djgP6t6ujcOrJwgutbAeALb8OsMkSm8qW9M44mJEwdgGx7sKociLgT3EUxRDWQ+4yST2furgSVaGVI8dWXjTsLCFrdvia5Cf8jybYTuMpsaPQPMkYbOiuktTD8cgV3q78m46+wF1nABKR8d8oXO6U+vugwFNliUu4dgwM+kIVNbdQjcJq+iQhkju53egYyIHI9IhktgL+HeICz8oyZbYR/tyUDz16YmpNiuRGA4Bu5gdtbxdpWezN2zKKZ6nhp4kCwAFDJ9xTakKlGT3R4A+jjrOFzJswoWXkm2KvD2AoaoEzbnbBgAZ22Cf0c5Vv8jnMf6xAXIKf7cFUchduaLmR9k=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KPbjyw2xDc/+7WZm1R3kfJhQzaVIqgL32rcb9TE1q9ZgwMi3ABy/WFx3EqYcAEhn3hGEIfIpE3wT/bmS7KBxIl+j2+GYOV8jmULdM5lLP6bwTYb8QZAcjOIdqhgT+fi+WrposjOBDMI7Vq+6k0+xYr2t89B69XuHorqiiRo5B+hAeHaEhZwfKuWAOMrA3x/jKnQnH52r2L/U5Sw7gJT6R5wtsmonTzTmLfR/dR8Ii0Gg4Mbi63trnIxPvS0+BxnUNtXS9d025RrDUm8e1zutkDLGaDgi12hgZbh5f97Uh/CscGZUZhl8M2bjO0GYgyBPPY0Tn4xGHUeAyt+fLgK4amrvN108+Pe0ROUX8XA6+u/J7KcIXZ9iTsNcGBZLkefKc4dHuFzAXzdFh/CpQA066++PbXjIljxv5+4juMVRj8j1AbfOCej6s7gInvdIY3AV
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:01:53.0287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c808e02-2904-4e87-78cb-08debbf8816c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8052

This series fixes an UBSAN warning in the Tegra MC ICC aggregate
path and removes two pieces of related dead code.

- Patch 1: Sets the EMC provider's aggregate hook to
  icc_std_aggregate, instead of borrowing the MC's aggregate hook.
- Patch 2: Drops tegra264_mc_icc_aggregate() as its only check
  duplicates the one in tegra264_mc_icc_set().
- Patch 3: Drops a dead 'if (mc)' check inside the CPU-cluster
  branch of tegra234_mc_icc_aggregate().


Sumit Gupta (3):
  memory: tegra186-emc: stop borrowing MC aggregate hook for EMC
  memory: tegra264: drop redundant tegra264_mc_icc_aggregate()
  memory: tegra234: drop dead NULL check in tegra234_mc_icc_aggregate()

 drivers/memory/tegra/tegra186-emc.c |  4 +---
 drivers/memory/tegra/tegra234.c     |  6 ++----
 drivers/memory/tegra/tegra264.c     | 17 +----------------
 3 files changed, 4 insertions(+), 23 deletions(-)

-- 
2.34.1

