Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E81187332;
	Fri, 23 Aug 2024 14:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724424261; cv=fail; b=DbYyRrg44FIsjEuOvUIel8wUMf7k34TQEqstUjnzIi19KDqQ3SQrJ0rDZhYmq1indeeB3nSs3Gf6xWOQMrtcd92lskYC6hJCM9FXSxepDyTijY8xjlQLDZeXSaNHZ+N6wVrOcmH1ye3+rfyj9e4Td4LbZ7mQb/JH7KXIrZU4M/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724424261; c=relaxed/simple;
	bh=EI4yRra5FGrZ7cXxvCVsrzRv9XB8AMh75uc4hMAgUGA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PtW1mFFW0l2JJwqW7GHGw21Xd97nkyzxdgP4tzV5r9VNoHw0c1RGmrYKa+NE7mCHUoODHtgsTawuB2LlSHDwVKFNwG5X1zN6/56GzqoC53ZBrJOJBJ4WD0xZk2rb9r5aTT70uwTD0qebplvy5quzpBeAmpyAP0vrzpYDAjtM7Jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tyUu1zkx; arc=fail smtp.client-ip=40.107.243.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tyUu1zkx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rr0/YK5/Di9XGe9Rl14I5DIB4oGCw1o0FLXItcX1D4foiuoyetBhO/58C5GiauKde4RczJwEssXAsNnilDnWfHKTU4NkYJ6hmQcTI4X6rapfczGJg6BspheBZH5bLoHJcwIgTcE2mtEeoVCApk1xA0KvYjH1hBbtgkaoYHFKyPD2udtOndgrT2V1//KQ6k5h1UUtTYB+M3PgxY3YwDYqmqCWC2wlZxs5IFo8ZuO/NPOxhbXRkGu6SWzWkM5K6lBOH9JQDrarZ7pM41ZvoclU/iEkWryZVX3rkGDQXlQ3ef5vmZM52V9IxCt9D+JSLKhdifl527H99A70mn3lqh23JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LotaMwQfDfiKQXsiD0EC9aTNwQ/vab2ewg9aL034GQ=;
 b=SG5cwliIXG/ekNHFqmQmKZAnQ9YkeYm8eiAx5Y9WnsHlv7PcRvNDHHnxuCuRWOZq6+FOzkS0CtnD2G5K1jRSvF08GwbPzssw8ZVlAf5VoYK+RrUms6a2Xq8l5fCsP+rLcLosIEoFYsDGAjCrK+wAyCVlaj4gv3UP85wklflXTEDS3FXfsKpCi0pHc9zXxMMYMynlIH6KaB0R6KguIJ1ohomQSRhj05Mf+F7ciz3Vu+GehI78rq2r+z0LpHQ1xFe/vXXkeB9QMf7faN24bOMOWRDX/Vhe36rCBUSfj5l0ZUT3ehqD0jgAq/o21KVKvuh1E3hf17PXuwEK2s+6fWT6Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LotaMwQfDfiKQXsiD0EC9aTNwQ/vab2ewg9aL034GQ=;
 b=tyUu1zkx/WsHBLytC92xkqkD/J6Ghhg/WUncwIITIZI8veWu/dbPo11WPMVtpmB5TvY91c2ceix5ZfTMrg062AB14PVynxKfbPlsrvj9eg6j9LyT6hCO0LNyTA8Tcn63dYJ/WX9tbe/X76km8f8OBr8AWKEBcNWoFgdx5WBWDsO6I0cwuw1vfPKFhFtYY/sgieAVbsIT9JMLqUlzHRrm6IFipIRwyt/ccRYjlWegdJUrUlVEAO0c+vr7EAy7pucK9VB9xhvCasCbANNASrz7sexy2EAoQ9nuOoShFCvmc1klJnnvs8YKAKOkDJWVPRGXptNwvLfiE2WO0PjSSmvniA==
Received: from SJ0PR05CA0008.namprd05.prod.outlook.com (2603:10b6:a03:33b::13)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Fri, 23 Aug
 2024 14:44:14 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::c0) by SJ0PR05CA0008.outlook.office365.com
 (2603:10b6:a03:33b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 14:44:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 14:44:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 07:44:04 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 07:44:04 -0700
Received: from build-spujar-20240626T115404323.nvidia.com (10.127.8.9) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Fri, 23 Aug 2024 07:44:03 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, <rituc@nvidia.com>, <jbrunet@baylibre.com>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<robelin@nvidia.com>
Subject: [PATCH 1/2] ASoC: dapm: Fix UAF for snd_soc_pcm_runtime object
Date: Fri, 23 Aug 2024 14:43:41 +0000
Message-ID: <20240823144342.4123814-2-spujar@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240823144342.4123814-1-spujar@nvidia.com>
References: <20240823144342.4123814-1-spujar@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|MN2PR12MB4408:EE_
X-MS-Office365-Filtering-Correlation-Id: 6494828d-3351-43fe-bc2c-08dcc3820efa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LCiku2CmEQEbm8hWCiRfl0iL+X+GnW+AwKcXcUp1c0PgzArWyhtLufQPyKyb?=
 =?us-ascii?Q?Biv8x0Tg2AOCODhmep7pRl3rSsduAbXkRIBurxu9GzcTBfa3tKsTCctiCbDT?=
 =?us-ascii?Q?kUYLm68h1byZVgHVSDI6nGb/xr3yX4AqKFxD1qVpFjL2k9QndlJv17afA7ef?=
 =?us-ascii?Q?NzCzwQEDb2tU1DnkcgutYkF/nmpJ5TlVf0U+LyAf1aQ/ton/bzrQYO5FS47V?=
 =?us-ascii?Q?rwSoN3Q90DouhKs6FEGnKCNr1gW07MRztt6IpHBk5QCdgx9VlTPWn4XS1Elh?=
 =?us-ascii?Q?LPTwqGTb39Xa6kn5yeqrpNcOCNHf8HlYkHD9Oj17J7fT2sRZdNMTJHS/fybq?=
 =?us-ascii?Q?2Cu3zJlXnzgCu4T0hhXQY28aqcNssc6EyE4Z9SnAbL+i1wt72aMtuPfdgeaP?=
 =?us-ascii?Q?xqLEoU6fEYt71gwu3gc0e1u035Bmr8B+nEg25DPduLCcGK2wWG3dBxscAYYd?=
 =?us-ascii?Q?ZH61P4qlEsrdnhqfV/890vOKaCBV1pb4RHmycgH/NKG9exie93uLd7c75LlR?=
 =?us-ascii?Q?VIwiXK2HX44ehtWlJl/d5NDUe+VO2G8ecVEY6Ov5g6o0KjXtzz5MNvUQR4OH?=
 =?us-ascii?Q?8yOn+Vy63A0VT0SePdw2lCMZKnpAwrxFJpfTUTWsAirT9Xq797Wic+3JEOeJ?=
 =?us-ascii?Q?IEZYzHt5f78Vlxa+pVYeM9Ikokfwo5vzWly6HGsWkRcXqmqcBk/SFfRQPl6Z?=
 =?us-ascii?Q?+0hx7NzQIyGMtW6ry2Iwn4ZOhaDe7WVJtX0ikEF7BFMWc8/I0gAFBTY+VR5P?=
 =?us-ascii?Q?DReMmgWx/BimPQ2C9GB7bEkqdpyLAbY+NlvrVivCcHHNUqIe80kKytQ3sD/6?=
 =?us-ascii?Q?mrXnJ0Wl9uAfaZDuQTcclKHKAz8fJi66gnviRI/qn4tTpOJ25jLShkv+9Vaa?=
 =?us-ascii?Q?vs2Jh1A16K1bsATq68Ml4BlIzuoE9Lo3NHbajv8zwGKI68Ri/6MMtPTVnB9I?=
 =?us-ascii?Q?CFPAsNTnN3obkrTEZ7KRvMWDX0KB0uZowihhj9+gri12fYayai1fsu6xTur1?=
 =?us-ascii?Q?Wo4haDDGHbauuloPy6/rzEG69cVvLAjIoCnkUYW5/oeGXTTdgMvrzSa9oWqc?=
 =?us-ascii?Q?P5fpnBLZAQdwaHhXe03c1LsB80Gpp1iB83feDSX2t/HdCodbaBJt4Qrm+4R8?=
 =?us-ascii?Q?1UAGCtTFzFWCnslnpRi9kgv1TiWZtG9wOg2PAvzAvEUdvUS8c2KwOZyszuPU?=
 =?us-ascii?Q?2DYlpKBx3QhX8CCw7YaiJiWnkfGW27PhY32qByx4OkgMiSLYIPSY/TMV9l1R?=
 =?us-ascii?Q?CpWpkcYqx6Fejrxv1udk869DMVYyN9XeYVPZBHCMjJqh8AoxPUdl9KgRgNFI?=
 =?us-ascii?Q?sN0Vodc6iBzfcPGz3uCN0sbrLNIUPIU04hCiSMuQDYctoEITIyS7Q6MY08ed?=
 =?us-ascii?Q?iy8S4/pnY12nF/HVLh/jFK4Znq6pMI87l0drv+5ldkReVCc/vqv4bxJhHczC?=
 =?us-ascii?Q?sUghXxA+HHbcRdgKYc9/Hy0NSxUXnXea?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 14:44:14.3933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6494828d-3351-43fe-bc2c-08dcc3820efa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408

From: robelin <robelin@nvidia.com>

When using kernel with the following extra config,

  - CONFIG_KASAN=y
  - CONFIG_KASAN_GENERIC=y
  - CONFIG_KASAN_INLINE=y
  - CONFIG_KASAN_VMALLOC=y
  - CONFIG_FRAME_WARN=4096

kernel detects that snd_pcm_suspend_all() access a freed
'snd_soc_pcm_runtime' object when the system is suspended, which
leads to a use-after-free bug:

[   52.047746] BUG: KASAN: use-after-free in snd_pcm_suspend_all+0x1a8/0x270
[   52.047765] Read of size 1 at addr ffff0000b9434d50 by task systemd-sleep/2330
[   52.047771]
[   52.047776] CPU: 7 PID: 2330 Comm: systemd-sleep Tainted: G           O      5.15.148-tegra #9
[   52.047781] Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS 36.4.0-gcid-36705213 07/01/2024
[   52.047785] Call trace:
[   52.047787]  dump_backtrace+0x0/0x3c0
[   52.047794]  show_stack+0x34/0x50
[   52.047797]  dump_stack_lvl+0x68/0x8c
[   52.047802]  print_address_description.constprop.0+0x74/0x2c0
[   52.047809]  kasan_report+0x210/0x230
[   52.047815]  __asan_report_load1_noabort+0x3c/0x50
[   52.047820]  snd_pcm_suspend_all+0x1a8/0x270
[   52.047824]  snd_soc_suspend+0x19c/0x4e0
[   52.047831]  dpm_prepare+0x1c0/0xb90
[   52.047838]  dpm_suspend_start+0x30/0xe0
[   52.047842]  suspend_devices_and_enter+0x220/0xfd0
[   52.047849]  pm_suspend+0x464/0x560
[   52.047853]  state_store+0xac/0x180
[   52.047856]  kobj_attr_store+0x3c/0x90
[   52.047861]  sysfs_kf_write+0x10c/0x180
[   52.047868]  kernfs_fop_write_iter+0x280/0x3e0
[   52.047873]  new_sync_write+0x2cc/0x4c0
[   52.047877]  vfs_write+0x514/0x760
[   52.047880]  ksys_write+0x100/0x1f0
[   52.047883]  __arm64_sys_write+0x78/0xc0
[   52.047887]  invoke_syscall+0x7c/0x280
[   52.047892]  el0_svc_common.constprop.0+0xcc/0x270
[   52.047897]  do_el0_svc+0xb0/0x100
[   52.047901]  el0_svc+0x3c/0x90
[   52.047905]  el0t_64_sync_handler+0xac/0x130
[   52.047908]  el0t_64_sync+0x1a4/0x1a8

The snd_pcm_sync_stop() has a NULL check on 'substream->runtime' before
making any access. So we need to always set 'substream->runtime' to NULL
everytime we kfree() it.

Fixes: a72706ed8208 ("ASoC: codec2codec: remove ephemeral variables")
Signed-off-by: robelin <robelin@nvidia.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/soc-dapm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d7d6dbb9d9ea..e5900cb65cf6 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4056,6 +4056,7 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 
 	case SND_SOC_DAPM_POST_PMD:
 		kfree(substream->runtime);
+		substream->runtime = NULL;
 		break;
 
 	default:
-- 
2.17.1

