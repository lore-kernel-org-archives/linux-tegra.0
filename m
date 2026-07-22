Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012008.outbound.protection.outlook.com [52.101.53.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BC24BC030;
	Wed, 22 Jul 2026 11:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718402; cv=fail; b=V22NyeRH9kkpJNIq3CCvkwOw/lJtQIF7j/I8CCQ/kRDeFzg0fseTLJjaN/FzYhIPCUw+QYiHcJznMbW+BnIxRqtUFxhUfvnhIT2EZ6XpT1hzqZ+O2Rz08fnbRmEN652FCpAEy1kk1F8ppDNravRt3dVNA9UisZMgd0hKkQgZHpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718402; c=relaxed/simple;
	bh=znMMLaR4wxKSW6R3QJhp2AANcXKnDExsUafTbeoAYGM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jd3qJY5y0fwsNMup3AKHqDNO7uAvawZm5Yc4DcU85cskngCBaYe4KHsIem/tIW5MrKsITSeAZV39FiVRzs7yQh/9MSCc87kqwoVB/98o1I5Ogy8P6c4DyIORRemC88AsbmvCu52xsxPf4UVLeaDl4H093kDcEV3YKkYxHIKX/O8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X/kITQ5q; arc=fail smtp.client-ip=52.101.53.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X/kITQ5q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHZr+R8nf9tysPI3lkb6cekGp0m+TENrfHh+T1E0ELyE9C85yIVlnqHygJ7tqzDlYGZnlRx8McG62beECY5gY8gPSVoMB/Xo1ryaeK3MzFu1TGj3W6TCBSFjtrnE6xklb3hprBkhy4T/oLryJkXrYvwhCivwcsIsf1BQZ1FDWNASEbSr+nxf4pDS8Hdw3+yaRZVoe4kbzHPO1+2I8VwnbNxqrz0KidiwdQjKolSrJ/e6Ozl0Zk5HbzT5BVBxO5gsOKCD1MOkyAM7V+h+GUw+hJ6xWriSy9yE6p9SrBxRt8NKsheeJKuXntRMexU3ihYyW+sZed4c49nO4/AhWMz3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdbe2gkV8XUIX0Xx1JHaxZF2+XfX1oywXfqKnOogvzs=;
 b=FPsBA3xD3BTy1kk6oSTNsZjTN/xP7DmK1tH3GouswdMCoHCMPwQ2ykE4aLT/HYOad2Rqoyczev8A7VSsCZCb7U74lflFPSnwjQ/7AZHSzswYkWS96sbfGsdWrqwXjQiYv+uwlzKCS6dUuaA6JJaVpGeu5OOhFKBJR+JzXIxmBbdTEd0gJ8flvOvZKju8wxYWvtUkL8nuM4NlZsQrUSu2Iogl35zwe2L6yYRbl+aza62TDaIsRKaNnhJ9fgpZqzBXNz8f2ne3bcoDrOq0pgaSwt0dGpBz35txNFSlPkVm2O567LJ7/ewhm+rQC/VIzarwt/4lJ/FMsm0jUU+pJ9Q18w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdbe2gkV8XUIX0Xx1JHaxZF2+XfX1oywXfqKnOogvzs=;
 b=X/kITQ5qJONmhGzUdeiH1CceaJoIKg2CESrUARGFRxizhaZkbEym8yAgC1+4nC7J0zsJj2aVpGO9F2x2Uqhc19WE6o1IYOyM4wfPpGElU9++PWPMup53tDA0xjXGoBDe31Shk8kxn1S/7uYJAYszov5Puq824yCEltgD6B72stOzNnOVaJmkTVKXzziuBYZ6clxtZhxABxy1OJ8p5hz+i/2Gj/41qAZHl18j1zHwhaxp0jVJZ2lFBRJAZucQ4L1w+i/2LAG92/z6gnbdus6OIzcs7YGw8CxxxNTBkhAE5bYeQ7IGAC+l9eHRVW9fnBNXHGMlyLYERjwjdFOvRBWG3w==
Received: from SJ0PR05CA0197.namprd05.prod.outlook.com (2603:10b6:a03:330::22)
 by DS0PR12MB999288.namprd12.prod.outlook.com (2603:10b6:8:424::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 11:06:38 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::a9) by SJ0PR05CA0197.outlook.office365.com
 (2603:10b6:a03:330::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5 via Frontend Transport; Wed, 22
 Jul 2026 11:06:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 11:06:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 22 Jul
 2026 04:06:19 -0700
Received: from build-anrao-noble-20260527.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 22 Jul 2026 04:06:18 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v2 0/5] firmware: tegra: bpmp: Add ACPI and MBWT support
Date: Wed, 22 Jul 2026 11:05:39 +0000
Message-ID: <20260722110544.193551-1-anrao@nvidia.com>
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
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|DS0PR12MB999288:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c58367b-ec61-4de5-bf3a-08dee7e14d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|18002099003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	5A7D5cYYIiCWSdybLwHFXIAM9BppyuDjMg5iYPLOX9+P0qtFJcJqOGN/fALKS/4Y5i5o0F74yxbLg0UyPcuPiS610O51uYX+lFXde6ydTkEdBTh4mThCHG0ksNlJT0/cFoyD/Nw8zVfSgtkubzeJ7iUaelmm7Sd/itqqkD6nbWNrBnDYlumPCc6YZJU6nmtB+it/McavUdVD/ABPWmCafInpvnJj23AsCDIuW2vABfhn3AUCT0Ixgi++SZ66vp+g4wPyhMAW/g2HaLehk+CNg07STaCxx7TwWsoDQ5oW+MbmCRpEM/ER/uG8En7HMGHiG7mDVXZxhMkoa4tDwaMIBI7WCcO+2J8a36Ac4nn9sx81zJbszBsKc30P9T74uBNTkCXCbzoNiLBWwh8noCxpw6hdVy6OXBWyuizsDU4BNHP5OM72o/c1/ZjVtXQ2x9zAX9rmO2BT/mFAlkJzb7PfOUW4/vYx0kw2/cZCMB/AmdJ7+TYsGofZOEZF9ncU09MW+NYu4XftHAt0uRx0pIg1eFnEG0TShJ3gDyu67WP7gfgsOgNVYIp0lFDGUOVgk1XyaZeP1tVwJ8hynXvHBmB167sl/wTeJtKE2uuixlkwxHq/8sT3MTAHRCXiFlhXtWXriUQDDB+XxZe1f5D0Lqo2UUOXXPkewBnA7huQqc5YsTqqEamca0xnM4bf+tSnCn4fO+WjPRMiuLsskTZYI1jOMA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t7tU8CBb2MVSMApxGpHyts4QRT05Tubu8K4NFxKFDmTA8iFuEWv3sJpsW3b98MZKz1x9wDN0+EAd5bH3+DNyoeb6X5cpPZ/WezQbYpLyAabjen03AJkPbNMCYWSo6fPCNZlcWobD2s1FOH1rlWqm1vVT57Qj8yhJWvTJJOeTVYXLh4eBKkRz9Xrqd3ysi1DQWD3+QDjZctBn5hPojVez8ecn9mykqdB8yJklFdJmBUsQ1gIG0VuJNN/jQgGCFUgNyk3OB5Y1i7VxqX/9PIi8deZk42GWw9C/dlQiaPKd4jHvDKIAgZhSGRdf3SvNwibzd+AvfJkEJ9U2pvf7ir1fo9MNy9XG0pC180/anV+PqhwBoAhCeQPrCIHO6VAKqifpnRTiM7cRx7ekx8LFgc+idZ639tr4aEk+m5qcvJs2YXnTiYfYOnOoRzC8eO+MMH7T
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 11:06:37.7614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c58367b-ec61-4de5-bf3a-08dee7e14d05
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999288

This series adds ACPI support to the Tegra BPMP driver and support for
Memory Bandwidth Throttler (MBWT) controls exposed by BPMP firmware of
some Tegra platforms.

The current BPMP driver depends on device tree bindings. This series
keeps the existing DT path unchanged while adding an ACPI transport path
for BPMP firmware requests.

MBWT controls are accessed through BPMP firmware requests. This series
defines the MBWT BPMP ABI, adds MBWT helper functions, and exposes a
narrow sysfs interface when firmware reports support for the required
MBWT requests.

Aniruddha Rao (5):
  firmware: tegra: bpmp: Move channel initialization to helper
  firmware: tegra: bpmp: Add ACPI support
  firmware: tegra: bpmp: Add the Memory Bandwidth Throttler ABI
    definitions
  firmware: tegra: bpmp: Add MBWT BPMP helpers
  firmware: tegra: bpmp: Add MBWT sysfs interface

---
Changes since v1:
- Dropped the SoC Kconfig patch.
- Kept the existing DT path unchanged while adding ACPI support.
- Reworked ACPI matching to avoid a dummy ops table.
- Added explicit error handling for short ACPI BMRQ responses.
- Folded MBWT helpers into bpmp.c.
- Reworked MBWT sysfs into per-traffic bandwidth attributes.
- Removed software bandwidth range checks.
- Use NVCLINK consistently in commit messages and documentation.
- Avoid platform-specific or transport-specific MBWT wording.

 .../ABI/testing/sysfs-platform-tegra-bpmp     |  48 +++
 drivers/firmware/tegra/Makefile               |   1 +
 drivers/firmware/tegra/bpmp-private.h         |  16 +
 drivers/firmware/tegra/bpmp-tegra-sysfs.c     | 205 ++++++++++
 drivers/firmware/tegra/bpmp.c                 | 357 +++++++++++++++---
 include/soc/tegra/bpmp-abi.h                  | 161 +++++++-
 6 files changed, 736 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-tegra-bpmp
 create mode 100644 drivers/firmware/tegra/bpmp-tegra-sysfs.c

-- 
2.43.0
