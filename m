Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9098C3DBD60;
	Mon,  5 Oct 2026 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791190502; cv=fail; b=fj/D44ogZBof88l59Zl5ZC6YTFn9oIDWdxzDu44DYVq4YnaEEELoWZ0JM6zZYShpErjTfMR/RfY5XQeC73x8Av+roML6yRSzaz/wwhr+uz0/+K7Ruu/lFt9pxFJRHTIa+EXZhBxqIQobhIOIZ7sUITkVsEL8kOJ+mnLivrStUfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791190502; c=relaxed/simple;
	bh=CDaS1VBxWAMoskkWvWJskn3z+E0lq1so+5SC1FrBwpc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k+JFIU6fwijaW0XNAaX0HhEHE0quQX8Q3WanjiNKUEzmMFLfCiTRRyssrGNuRZGdls6k1rAV7pQ5O5EGtVhT+cHOiN8LGDGaJ/9gozQMbcUMNOfVw7xgCKvJmXeetbeg0pKMVVcBfmzUhsyQs0JWM5ZDtfUww81xMOrpcLVoalA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Lx3t6wzN; arc=fail smtp.client-ip=52.101.201.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Lx3t6wzN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mins1XGjzS1MFj1FiK77l5v9o+Yvrk1j/GqGxKhi0D+3csjagZndle9SNSMcKqckXMWzAIMbd81dwgZ4WwTcydI98O7lBXqbLGg6eMZ0BcCbyCv6xXl5UV+BSCTqwtfh4aUZZAkfepb29AIobh7iWEULpJJymjKubX+gfRuRfkuIqxHnXhcF0DJAhdGbKIEnPBeGZTL0f6gn71vNezgodWm2wmfkhYda6CWd2aIuBK7xPiR1jGUik9h3GcFihktkkCaB4Pj/f+e76hrSSp4uBHHxQXeBrouLbWeC/tzPSbYMm+VROPgmq5NaH0iQwAex5j/fxmR6y62re4902t7p4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qhx2BPMDhXQdk48qj/Va3Eq+skm+LqbzZ7WkvUy+qQ=;
 b=jC2LhDUw+8inYt1ksbL+a+8BMCcaHXRJ/7CJ3S6050lgN0HAEGRuhJhI/VGRRHmGzhKLbV/WRCOy3rZJXd9lLBE5TqsrtDYbROx3gGBB4YDLOpvlvV58rhvS/AITQtuWHzIuhBIxE8gvUmXxq7G3zfYRhFuD6G6Zt/ZoVaaAIlKWLX9NCJqZ6Tmylj3Cwflnhy0bLb0g9dpKLgm8Z+vI2J7EHd9Uy8SdBkXPEexcp3dgzQMqz6T+x3zcm8KzgpuDyY8Z2aLAPnePw9ktUghR+kGopJab8HujmI9JVCWlP45IxlBFxMxT7XnOONReP5WmMSdo8PFjM3LQsFCyptQQOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qhx2BPMDhXQdk48qj/Va3Eq+skm+LqbzZ7WkvUy+qQ=;
 b=Lx3t6wzNvDqaNG5FDus/tQJyVmzE0LbbRdbtI0P8WJCs6NWsHs178p3gf3CZ2ZSNa6S4Ei6cMqyiSPkcIoBWMUEPvmK2Ivv6Hpj8Dac/A8TR1qkutI9ycC+lby/WfeQFs+SM+uvIl04leD/J+48zZY40oLOhzCgIAnBPXhkEK6+lcyEje28MeJ+sGEP3ElkFoMjnssUpubxygPXXoBiafhyGVyZhiZqO0Ou+iUNM2uaeaTJyDaJc9Qe7QavWpq7QcZCxOE0AzG2j4p6t771jRGlGHFQgr9tC/tfebGC57UMzOzouc3W74q+7usiCeU1aLfVdtSRSuJ82yHLV9dMRMA==
Received: from BN9PR03CA0294.namprd03.prod.outlook.com (2603:10b6:408:f5::29)
 by SJ5PPFCB5E1B8F5.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 08:54:56 +0000
Received: from MN1PEPF00079401.namprd05.prod.outlook.com
 (2603:10b6:408:f5:cafe::90) by BN9PR03CA0294.outlook.office365.com
 (2603:10b6:408:f5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 08:54:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF00079401.mail.protection.outlook.com (10.167.249.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 08:54:56 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 01:54:35 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 01:54:34 -0700
Received: from build-sheetal-noble-20260902.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.49 via
 Frontend Transport; Mon, 5 Oct 2026 01:54:34 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Mohan Kumar <mkumard@nvidia.com>,
	<linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sheetal <sheetal@nvidia.com>
Subject: [RFC PATCH v2 0/2] ASoC: tegra: ASRC ratio control updates
Date: Mon, 5 Oct 2026 08:52:25 +0000
Message-ID: <20261005085227.2133834-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: MN1PEPF00079401:EE_|SJ5PPFCB5E1B8F5:EE_
X-MS-Office365-Filtering-Correlation-Id: 133db476-6a1b-4ea5-0e34-08df22be5460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|6133799003|18002099003|11063799006|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	RTZKdxbQE4tK3Tszpyqp6kCqzAFbcgs0whOrF64kgwB6dR1pN0OEwTpLN66nKCSwXkv/sMZzH5RszG5RlNl1e3ON+I0xZh4cFmXTswHLRwkCAX/ZY+BkGo02J6qKipgsISKLK4o8mQlWTzjwc6Q9d5v8FDPxcMQL4+DKQVEKdTrb+MjAEH39cJIG4n+Pz2ckHqPFljJaIQQQxIhkOoWKm4LXRZwP8s3hdvX+GlnG4i4MAF1Kd31yJ3qY8mjhCJL2aLvQQsLb1gPV9kkJ9u2AFihBJ7/ejFWcr6LPNHYtQtIL8+fjprl8eYjQmyVwUkEGMsg0qy3AICTW8dGIV4r5H5MXBTXI65qnZ8nY+FksYRXUVXW3dyKsNbItQ7NQz2fJwxrpezARmRH4JXoj02D4Tyai4RJ5to2Dj0GtiDjciD1G6T++mD+RsX/Ml9SVcN8nNpbF6AZ071ecc5mfMj+YGdH6onsvz1qM4T3Li9Z1Q4v056AD8cyKwnI6euWsWLY/HXqYLqJ7yqFGil2hEVc1qK6fU0OM3JWFj6zQ8d/gvfVAXOP9Ty0/nEgqZ5K6nmAO1F7DpoYOWRI25AT+f+JEp4ZoObUpE2NZXue9rBRjgbJkWVPjHFQqsqzRR2M1fUIzrpmpuamENA20o2PfOxFxXwiddPw2ks9QvCWYrxERM+/OBMnTxkUyOkWsTghyFXMqw1KUxgszLQZBNUdkoV+LOw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(6133799003)(18002099003)(11063799006)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HDfzImCxAAwDfF4ThMOhme7uOPDoNO7A7VJGvMt54a9xX/j4clW98YHF7ctE25tPGRLI+N8ESC61UINPHYvITWm0JM1lvLYWkLQhXNykiLm9GR+tpaHP2SOiiYll2jJ4mSboTI98fneF3W7B4YWwXwF5sLITeR9q925MaDcU6Md9Csa9Y6YsUXQIkteo5sPNbsugDCdGOw7HOJ+86za/h/2udjPw3zadKCqhlguRAkXIbKNoH+bm0DmXnO65jDfx7OCee0mVb7RYERQekFSehJI62RJP/FYaqYBXiMf4dVLKxhAeKBpK4lJoD/GvzTd1PckuNlm3WqpBHwqF1Cquu2f+INeHpprN0S6gh5iS1gwMfx3gjgNwkRO9zkd/txCNv8UAiih89cod+6agpeI0j3Drx+S8uylh3O/nViUAjFngZaG6BGpmRz5Efrv02Iwc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 08:54:56.1994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 133db476-6a1b-4ea5-0e34-08df22be5460
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF00079401.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFCB5E1B8F5

This RFC updates the Tegra ASRC software ratio controls so userspace
programs the integer and fractional ratio parts through one paired ALSA
mixer control.

This is a userspace-visible ALSA mixer control ABI change. Existing
userspace that programs the ratio with separate controls must switch from
the legacy commands:

  amixer -c APE cset name="ASRC1 Ratio<N> Integer Part" \
    <integer part>
  amixer -c APE cset name="ASRC1 Ratio<N> Fractional Part" \
    <fractional part>

to the paired control:

  amixer -c APE cset name="ASRC1 Ratio<N>" \
    "<integer part>,<fractional part>"

For example:

  amixer -c APE cset name="ASRC1 Ratio1" "0,715827882"

The ABI change is needed because the previous separate controls can expose
hardware to a transient mixed ratio when one part has been updated but the
other still contains the old value. The paired control lets the driver
validate and program the full ratio together.

For active streams, the driver only unlocks and re-locks the stream when
the new software ratio differs from the cached ratio by more than 20%.
Hardware allows direct updates for smaller ratio changes, while larger
jumps require the stream lock to be refreshed.

Changes in v2:
- Split the Stream6 input threshold fix out as a separate non-RFC patch,
  since that fix is independent of this ABI discussion.
- Expanded the ABI-change description with legacy userspace commands and
  the new paired control command.
- Clarified why the driver keeps conditional unlock/relock handling for
  active stream ratio updates.

Sheetal (2):
  ASoC: tegra: Update ASRC ratio controls
  ASoC: tegra: Cache ASRC ratios until streams are active

 sound/soc/tegra/tegra186_asrc.c | 511 +++++++++++++++++++++-----------
 sound/soc/tegra/tegra186_asrc.h |   5 +
 2 files changed, 346 insertions(+), 170 deletions(-)

-- 
2.43.0
