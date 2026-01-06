Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013004.outbound.protection.outlook.com [40.93.196.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2A524728F;
	Tue,  6 Jan 2026 14:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767708538; cv=fail; b=upZqRsARaxpWJcVkClkVreNqXYp/1UXdutyWwGsgrYDVDM4e4KQLa25EvixbR9uHtvvv3cVhlm9Ht8r4L1jxCXsaKDGCrIsAnnn9JmhBWkUzLOwBA9LAPIPNlCr5HBHlQxVMP8phS7PmjvUtAXxj+jWnTVMzG4g7KrIqAchwrRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767708538; c=relaxed/simple;
	bh=28tflxb1KwtodadsR+G5fsjyLEjl12g5JGkdZhsPnqw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UftDl+ewGdp5hvEg3X+pQMZ7I8vRxZwVO80W1HT8NxbK9YRyGFqpHLuN/oAlRY5guncU018yoFrMDhEvniaADJ5EYJFVoM49gGwRzQnSpjcydDjMfkI+01stzzGCzTeZHH4zxiE/xlcIfpvSuMaJIUB92Wh9Zfb3aLild/AaWEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OS2AFH9U; arc=fail smtp.client-ip=40.93.196.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OS2AFH9U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHfE2B6FjVpHNVKvXlCMk+Lc2kCEE79NlQSY8gxhFQyF128GNSy2AaSVDKmBnCf3+dSBtla4raCyecU72guF8PiO3spX5RhGHd8Y/SRhnFS0NGICftkXBV3+RQKfgM6aspy+WyZXVN2XxEF7qRIfs+xDA8Y9L2WZJyURxXl6tIKyTlBWwFki1hJXmGU96GRtGvHR4Ks/kNoHHisgyRnZ/qemOHc9z6EoD9vc+6C8hMLgCqSFFRGIT2C+SeE9+LW2dE/uBcxYaGAfF7Mm2wJ54lUF3zz/vw7+0sXVVaVgsGuv6t4Kt6kdbLZHJiYsgnQl0Q8qXPuYXg82fG7CWjSRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZejQW/t4iK6RQUwHqaie0iHuA5iXocsNaPmWHGUmf8=;
 b=EAt6h6QMkJmH3F6CESyDwOqbIuzuxBWjCAL6IsYheCRojYNO3JFtseihwPe60RdJDxAUXkcImKHUhAgirryJMwQ8IRglsa9VRwP98lRadD0mUmEMc1KqG1Vq1VD9wweVWtyl5Alt2+KuswreeXOJpi8e3VEtLKO9p3hqZyYAJ/C6C32ET6xv+gt1e2mHXRjWy21YfoLOLtKvPgbW6WyQ+i8Ev1JoWG2JOnUMNAnVEIIYiRyP86lCNKIBN/n5U9MJdm63sumIHGiGtqtvcdGyTGhXYKbv0mBGJZcEX3Hqi7G2sBeDM808s8qsLfTcad8wEOnmU8IBiShy4OA7yajgqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZejQW/t4iK6RQUwHqaie0iHuA5iXocsNaPmWHGUmf8=;
 b=OS2AFH9UBqtvFf0KfkQ8sNElkGJDvTz3OT0dWBhUmS/Uy4OzO/SXQvKFsCoQqlE9k6CKRTjiLMbUu060H/V8Eo3S8ZCEfzULipRN/kybgehqJ4YPw1m3OfDo6jpJ1n+9C8+3D491sdubmejbnf19W4IT6z8QB3t+1DPGu9eEM1ysqmhnv8Ey2WHCk4+qH7hsJop8tc0+Yn7B9j9ntA1giotmsaQHXN30LNvDFfZpRU0JtpYxiAh8kSjubm5sqDLLfzXfbvNKulb2jw/CUVy31L20FVCylZaEBJ+pSlRZkEqGtjCgzI924B8Wg6wU98ZbmD+ygJmij4bTX/Yy5ChOBw==
Received: from SA1P222CA0142.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::24)
 by SA3PR12MB8047.namprd12.prod.outlook.com (2603:10b6:806:31b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 14:08:51 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:3c2:cafe::1b) by SA1P222CA0142.outlook.office365.com
 (2603:10b6:806:3c2::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.5 via Frontend Transport; Tue, 6
 Jan 2026 14:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 14:08:51 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 06:08:35 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 06:08:34 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 06:08:31 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: Mark Brown <broonie@kernel.org>
CC: Sander Vanheule <sander@svanheule.net>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Sheetal <sheetal@nvidia.com>
Subject: [RFC PATCH 0/2] regmap: Add cache_default_is_zero flag for flat cache
Date: Tue, 6 Jan 2026 19:38:25 +0530
Message-ID: <20260106140827.3771375-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|SA3PR12MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e743ea-a298-4b76-3e24-08de4d2d1e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S4VVwf0gDomGznLY5s0xbpTzg9o5O+0DXVRHvYm8lk1SfPNmDLI6l5FFeAnG?=
 =?us-ascii?Q?uEzt6KI8ZjXl0Yu8Rir3CENZ1L6cWKWdJT6bn4TCqC6NW4be3cSZ4wvweXXN?=
 =?us-ascii?Q?qtWlKr1W2X+qTN4mcAIRqNhu2G97pLnSQvYfZuZHfyVrGnYHA8Pl2bf5IEpf?=
 =?us-ascii?Q?bB2n8Te5RhPc7hksNNoevHrJvcAvvtsuBEn0CYGOOP1R0B43L0qfsqA9riJ5?=
 =?us-ascii?Q?rskGYVyFQ1C6Qb7ZH6Ia/j6gtrya7tUUt5QHvaTMnBsVS4WgD/5oeW8RJ0Z5?=
 =?us-ascii?Q?fqGphmNvxTfnBYNvMXtvOQ+ACAPsZV0xdScrjwqDGp0BN+QgRV0vfhTxGZCM?=
 =?us-ascii?Q?+//nImUhwubVvy6I+BvtJqZE1YTUX68xstpjfgaIcNh32S4gMs2X0ruekqW8?=
 =?us-ascii?Q?m7V87vVJaVuxbgwrnzy22jPObXgDqa0TjUHs0gCZZJaxEsdb6OBKwfWpCc8y?=
 =?us-ascii?Q?zxCieq2d7L34+zQx3CgN2EVnqu0FIc1VtAMdMrlyP3r4HCX5vfHZgzSIP52A?=
 =?us-ascii?Q?ZOh5sHJQf83YQSIlJzC5Fe/q2CpkmcNG9SHtp5qGbjQB5nLCqnVp94z4btpo?=
 =?us-ascii?Q?pY06++/Ei7BBhjQTldZ9lRowXGo3h6YteIMTTOu2xwEO0WUbThwklY6GpQZd?=
 =?us-ascii?Q?kuoGfHcKrgMOfmA4opAn9AkQceLuIuG1zM0hLOoisD4bmKIwjrzT1cvDAZIW?=
 =?us-ascii?Q?A4IX7fXcjU9Cmq4zIO60Y57KWa4dGjX7B9QuBfxMYGXRfBC/S0WF5WEBpiHa?=
 =?us-ascii?Q?S38FclnNTDxhNktzSUsYTvf4NGgviRV7oWMELeWflJIjkuokY8JfuXmbcUJ4?=
 =?us-ascii?Q?yfoTOKCGijr2LShmJwpnBfIvDWTAnKV7ST0h5Bjj3SQvpBvvVnJOjCPhaKGf?=
 =?us-ascii?Q?JqgpF6QBM2rRNy6lmSB+254oz1l31cGEH6cJikkZKDTmvgHp3uitYwrQiPg6?=
 =?us-ascii?Q?WoRX0hqCMRw+Ja+0NroBdPNX1fyETsNJkDnFTkwksVkCP8arg4G/B/qgjsf7?=
 =?us-ascii?Q?MCOJotCMpBKGrchWySrlitfe6YYG+pRhdXHOOjpAuQiSrejbfVehubzlUWQ9?=
 =?us-ascii?Q?bWE+Q/Sj1UUfGfHyWEubCTWcGxu00jAfOD4XeCWO8SBs1/WPlv48YMNXPyIE?=
 =?us-ascii?Q?yHAuV4iALaXhftocE4egt5doOxUyWLiTzMI7qAnbKPAMzz1jaiiUoWD3B7ug?=
 =?us-ascii?Q?kozMEhUj9RLf9q9AR8WkIpkzIO1WGtlQQJuVOS516tBOilTzeGHAKyFXhzw5?=
 =?us-ascii?Q?BT/ra3qIIJCYys7E1x4AWG8308y6/Dt96gJPq1I1EIqJZO7E+Jjv4oAAVqWp?=
 =?us-ascii?Q?H7AaAiXt0Ody75zfXWo/gcQISOT2CyfL58ALfI30CNx4J7RKb6wIQYR1jYy8?=
 =?us-ascii?Q?4lcmYnCkjSa4zPdKbA0XL0tfdJggzYRf9AjOpwBETxpQLHCn3tNMrEoahQPX?=
 =?us-ascii?Q?p100hMqAgyQsgGeHStKepjNgYbabmT5S7MRQdHZ83rYm6wdp4bTc0XUs5pZ5?=
 =?us-ascii?Q?pwQhgoBP8cIt9i65hZyrHgfOF+u8wUzHHfbYBkmS4VC3NNbWJHukWzZ1VQ5Z?=
 =?us-ascii?Q?IJwZLy1HfxK3E4bYnwc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 14:08:51.0255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e743ea-a298-4b76-3e24-08de4d2d1e72
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8047

From: Sheetal <sheetal@nvidia.com>

This patch series adds a cache_default_is_zero flag for REGCACHE_FLAT that
marks cache entries as valid on first read.

For hardware with zero power-on-reset registers, this avoids the need
to add all such registers to reg_defaults (maintenance burden, code
bloat, no functional benefit) just to set the validity bits.

Sheetal (2):
  regmap: Add cache_default_is_zero flag for flat cache
  ASoC: tegra: Enable cache_default_is_zero for audio drivers

 drivers/base/regmap/internal.h      |  2 ++
 drivers/base/regmap/regcache-flat.c | 11 +++++++----
 drivers/base/regmap/regcache.c      |  1 +
 include/linux/regmap.h              |  3 +++
 sound/soc/tegra/tegra186_asrc.c     |  1 +
 sound/soc/tegra/tegra186_dspk.c     |  1 +
 sound/soc/tegra/tegra210_admaif.c   |  3 +++
 sound/soc/tegra/tegra210_adx.c      |  2 ++
 sound/soc/tegra/tegra210_ahub.c     |  3 +++
 sound/soc/tegra/tegra210_amx.c      |  3 +++
 sound/soc/tegra/tegra210_dmic.c     |  1 +
 sound/soc/tegra/tegra210_i2s.c      |  2 ++
 sound/soc/tegra/tegra210_mbdrc.c    |  1 +
 sound/soc/tegra/tegra210_mixer.c    |  1 +
 sound/soc/tegra/tegra210_mvc.c      |  1 +
 sound/soc/tegra/tegra210_ope.c      |  1 +
 sound/soc/tegra/tegra210_peq.c      |  1 +
 sound/soc/tegra/tegra210_sfc.c      |  1 +
 18 files changed, 35 insertions(+), 4 deletions(-)

-- 
2.17.1

