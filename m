Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794820764;
	b=f5ZPKkcFBjzg0BvOXonzaTQfgXIUbw/CtePuPdDachwOR5GbBNkVRf5VKib0tCj+KK8C
	 pB3UHOAtXrm3IE8kkuHgA55TMzDOeYEbNbabesIbnaHlRd9PY11qXRUI7Y7awhCnsmN/6
	 l6C3Z6uPRiGEQ3zG2O0p2SOVuVekWG9tdVCW432jR6A8e9JYrgOo7JLdc1MQPgHYB/8d4
	 M4djobwOlHEUE0NQ/QdVrDZPKU1jSknp3I/vHWoxt58rFSSi7/L1BpOOch+BZN/sU8Ukf
	 U9kqqq77F1LhEBWcZWU0rNFlTg56JhD4izEReNulG4ReIEBf99+jBKpc1nm8kkv4Dfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820764;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:X-B4-Tracking:X-Change-ID:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=S3hNlROStsJmJuevM+Zpcq7bPfvs5gy/rAwHIb/Zzlk=;
	b=KeoDr2QlsRv6pOO2FiWDBS/uMMcUX7jTsujOWcXjbVR9E75e6bEmcPt9M4Hsf37uAk5H
	 7hnnMcwsdXL4ovWG3fZ9DJJW8pwtiF95PJdguMS5wrI2kIjQ9P9oUKlsZ6dNXqIciJI+S
	 yVEefNAiYPptn6Y7amzpgyeBEPhq2/XGkDx+AQSP/sLHklSxaVmTWKZ4Co5qAxz419Yiz
	 5FCMLpaPHEMI6TASw/hauda2pVH4IDfI0rbfQSH0JPPwHqXZcxbFG3GDJw2rMWTVx8/5N
	 vMieaZ1ZgJ7sYGZvvEQjk85ee3JfBbr933piPCEsKSu9RsC78Ao0qj7qoChEXzJXdqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eMtuZPfe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.69
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010069.outbound.protection.outlook.com [52.101.193.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E492E606A31C;
	Mon, 16 Nov 2026 09:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E492E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eMtuZPfe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mi8jvUUW4nB4lkmC9HvArjHBLCM90t+ZEz2HRFzUs6ji0JzGuuOqmghZv6b2sjNtLG3j+Uq+4cTmsq9NKp7wwfHTLyQH2GZsGHuKE1p43yl9diCoPQmrIqXYMxP8y9ylTYLUIpkIlqQzQCAby5WpOLjhrE/Sbs753Qsm3d3ulwPC1C7aHqPI3GAKKIkunjil/gYJ6bVtOsOTq40K8zsTpvqXq8hHQU+xm8IbrT4Z9+XmN8seN+dKeZDdTlitxzHStnlq6Jk1hfIF+4wJvkiXSldEfILYtVtKrdV8keCnY/AZxcBfo7D7jyBavxced9E4hBWOjXbWlpN9NE7qIO/khQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3hNlROStsJmJuevM+Zpcq7bPfvs5gy/rAwHIb/Zzlk=;
 b=Y2MmH7pVi+PzW41AtegLZvWzCQQyQDlBEwyeVuv/+ezuYgQj8BMzrEEad/p9CyRgdEbMFgmmDnqzgkyrV70GuNzV9NpwX0BEeDAckbowXE5boRsBsUYOvJCHATNF5c7FLe3ummliL24d6K3E+gMKzkRGRSh7UWeTTkVbxpBayrCHSrtwT4Ij/2CWDEK9fy1SyG7YNWfueEHx9BfX7iOj+TMh4KSpWE+DuKo22GYU55CxFrj7i2hEjxLE3/Z2Y5XrMIVFAW7pgK0y9HDsxx0eLtoEyGALCqtirYC0AotTyuagFUeZvIj6T/vWeu0SyxbLoSgQYZjp6LF7JNw23acxZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3hNlROStsJmJuevM+Zpcq7bPfvs5gy/rAwHIb/Zzlk=;
 b=eMtuZPfeFqIVd6N1PIpIwNiLBd3utaQX4DRPHBWN6EPAjPOZJD9H1Niubt2qqXozwIcZvHsD+166oa9COEo+2dyr1qf/CWeMYXMusYypy8I8W/gRG1N598JTBn+ddgzx08HEMsPkqelTFZRUt5JCb0I13/DycN0dk05GOxWmoow1RNOY1tLjcxCKCermKOF12Nqle204PHKVv52oKsPoIV7F8f12y2nNGfYQC1AyENFrBAUBb+JYgewigMLIvf4Q2wkYk3i98uI5mcv4wL+jCngJea5+bs2SViVKPbQ8prjNPMBIOW8G4zx+syihNRpGsj3clqPkOKWxU7cWE2wQnQ==
Received: from BN0PR08CA0025.namprd08.prod.outlook.com (2603:10b6:408:142::10)
 by AT6PR12MB026552.namprd12.prod.outlook.com (2603:10b6:170:116::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Mon, 16 Nov
 2026 09:19:20 +0000
Received: from LV8PEPF0000005D.namprd02.prod.outlook.com
 (2603:10b6:408:142:cafe::9f) by BN0PR08CA0025.outlook.office365.com
 (2603:10b6:408:142::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Mon,
 16 Nov 2026 09:19:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 LV8PEPF0000005D.mail.protection.outlook.com (10.167.245.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 09:19:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 01:19:02 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 01:19:00 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 16 Nov 2026 09:18:56 +0000
Subject: [PATCH] clocksource/drivers/timer-tegra186: Use NOIRQ
 suspend/resume
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-tegra-clocksource-v1-1-e7988fc2a7d3@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAH/K+moC/yXMQQqDQAxA0atI1g4YW6bSqxQXY5qxqcUpiRZBv
 LujXb7F/ysYq7DBvVhB+ScmaczAsgB6hbFnJ89sqKvaI6J3E/caHH0SDZZmJXbNrQrXGLqLjwi
 5+ypHWc7no/3b5u7NNB0j2LYdhsvNiXUAAAA=
X-Change-ID: 20261116-tegra-clocksource-870a4fab36f1
To: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Thierry Reding <thierry.reding@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Pohsun Su
	<pohsuns@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005D:EE_|AT6PR12MB026552:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e3c6502-1cc6-47c6-9f06-08df43c2b250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|261026121527099003|261102123227099003|261022075727099003|261021121427099003|56012099006|11063799006|261021123027099003|10067099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YotLwtsR+l8rdgVmgCgiPiFLv9gUtWqvMKhd6tuj+YFMJl3HekDBio1ySa8yoDmvXjDhamd46tQuVrnMITkf1hlsRPtBuN0TlJe3Pc18cH52b4fUOalY+TGle49ZnLMskQt5fIgRtE10BxnewfqwcaYnENZfnyX5wwErjeLwpxFz5qizks9aonPSLPpJUg5UEyDWDhxfzH9cljQEFaph4Xo8cLO+tYtrYLzdF7IegHDMoEATGJGrjWM7U1Zp4w28hv5OfIT7C63QM2XhFMneqtu1ygZDCbldXm5NbPBrziODYE/fANWFrWCSKOu2InfEseBvA8/nB+lUiB/ulr6aF23iLedKhAxKHxx/iU0HO/NvsTGPX6wkCqEakt/o2CvxvCw6tgPTYhM6pTyXaqpl6Ho7OWqAJvL/pHFNUB8hDBt3HV50+YVWzGVAWBqTRECQDsLnm5c70rkTiHI5brxyozFlRnjrOdox/ydbYX2Hk1ImFyf/ilNNEuXmcxmPFy9nKMH6vj29z1tgna/ZcPe4qhVuklaEeU5zMVIybT82+DAQ9cMc37aOd0LudwoR3jNTBURczY4zp3f5fa/cmBH5VKNM1Oj5u8YoZ1hYNSq1gCHBWYSXTav5Q5Yf6bcvY4WPYeBpYGTMb1LNTHfIfJxFJqXb8PclJ3lROTz/XqdgV4kJbQp5xjjZ7Q86QTD6w345XaGCAMtf7YZpGu3i0GkbjQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(261026121527099003)(261102123227099003)(261022075727099003)(261021121427099003)(56012099006)(11063799006)(261021123027099003)(10067099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uU+A6iShszSCgAAvBKTCxhQ3BKytYjRIGH4mnwUUJZqqsRg9HZJzEAS4jPL0thtGuCK9EhemMPAzvFuOzXosKfWqo1/VxWxUiojJBK6eItvwCy/w4KaGMippMZxA1PpTY+3INbNBndDVXc+8DKO0LrjRCayA1QkyWNzEn6lwzcl70V0ptlXuWreg1p73pRrsb2NwcZTgAGc3OWllF4pMH6Aq7ORFk7P1nTgs7j4l7FLzc+71jzf7d7OoNSxdCF0G0+8R5e+9bbV7Uo9WJdZqT2eb9aqy2rho/rz2SX+vL+eStx4mCDkvOE79X5uzNLdzoIlLO8kY+LanaFKIByyAKCA46vuX6Wxit9luRA4rxk+zj7BivqesBEnuRxKnIdwePsxN43ouWgDhXyoPzwxyZj3BZGCkP9ZPbSLetJZe34wCuC8fII2bZ70Q/li6yXTo
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:19:20.2525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3c6502-1cc6-47c6-9f06-08df43c2b250
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT6PR12MB026552

From: Pohsun Su <pohsuns@nvidia.com>

Update the Tegra186 Timer driver to use NOIRQ suspend/resume so that the
watchdog is kept active during normal and late suspend/resume phases.
This allows the watchdog to reset the device if any issues occurs during
these suspend/resume phases.

Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index 7938fc4eb1a8..5ac724b83159 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -589,8 +589,9 @@ static int __maybe_unused tegra186_timer_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(tegra186_timer_pm_ops, tegra186_timer_suspend,
-			 tegra186_timer_resume);
+static const struct dev_pm_ops tegra186_timer_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra186_timer_suspend, tegra186_timer_resume)
+};
 
 static const struct tegra186_timer_soc tegra186_timer = {
 	.num_timers = 10,

---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261116-tegra-clocksource-870a4fab36f1

Best regards,
--  
Jon Hunter <jonathanh@nvidia.com>

