Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795687651;
	b=wIx/QpqurtywgQMWIdY6fbMzDPrF8XC4e83XgfumoJKkIQwO4WnylSzrLQXnCvd433n2
	 QRhPlotKo7/YwP8N6yEYKdb22zsNfeqF4qRe38FCFFacfhpTng3eGoc8ytwIfHI8YA5Vs
	 AxV+JGoL5CojMb7E453QaOnJbWGRyhK18E4OxSZIG7RuB2WTm1eg9cPfHRECFoDrs4y6I
	 V9AS9eoYPYG60vuxgcNd4mLKN49mAgM6VKLuvZnzdx3HRDlLBPTUL3b2AsWwiNZihiZfv
	 PalxtzfNTjOhzuhlU/o6oUfOooR/umcqft9S93dKSN9nkYGMCNGpqirupcEaNhvIDYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687651;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-NV-OnPremToCloud:X-EOPAttributedMessage:
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
	bh=wSZc2wdkdlNg3c25EYI7qJsc5FCBM5z64mTtNRVSgww=;
	b=J5N8aLO5XHZNKvviSgtWcBZ37oh1rSjmEGzStUZbfYN2XWT+ObRFgpvmWOEk0RfvlvTM
	 QTehag9HClDaJkw8lMf5cr8I6STf6kEpGLoWRO2Eg86EboJHzhwArRFx3RrRS7RRorS7Y
	 5u8Pi1u33X6Pqh1HZxJ9cDQwfXA0nTVpk38OUUlRxAdbocrpA5ujUpP+glAtmL3wHKS+J
	 /0ODcyAV/v24O9PwXv1xGkDTec9C1AP4ARr59dpQn0YhiBms8fEdq81bgayiaXtBq+2JA
	 2zIj8drHx8fv921+zL3sZZ6Z+RmCcYePhZtAPelbbtLI+IgMeeAJ8OE7vZf8OJXWPTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OzgMS691;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.8
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013008.outbound.protection.outlook.com [40.107.201.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EC2606A31C;
	Thu, 26 Nov 2026 10:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6EC2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OzgMS691
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsRp1TMmXmKL23pEbuH5qMPO0g7sktgr6NGZ1l39fF7dmNLUwCBdJePaKGwRbgMQQE/ptHu9CH73yxDlkHCRwwbgyLQiU87W+FuMasGoTyo/JBperzkDTa8C7mpyYjdtmxYbprmicbzpSySPwdn6CKXiZF6YBn9p3Vanr4ML2PuMNCIK02FSeUpDqB5++dDWvzEs0YM6Rbjc+4h+p3mr1DCP29b/ob+iOKaKNES8yHyNu/TF2szuL8w1jwEMGtJYThbk81RSoryJ2+NaIVyJz+gGlmzPKOep3lZt68qtrcp5PMT4RIJDFi8OYqSwkjqiO8iBeJqytWQezyqGBf5azA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSZc2wdkdlNg3c25EYI7qJsc5FCBM5z64mTtNRVSgww=;
 b=pfEt+JOeEmlwJkfsCNidpE2WsL3ty6d92V0V8NYkcM5HzG0oecb7pu3ij3cPQiHF0bCaQ6z6jq7OzYCvG/TleoyWhPk+C9jMk6S3dC5kouR9GchzP8SSijFbBcwl/xjWSb9XkWS5R612jb9EQ+iIBHEH6ZE/QwGM1Ff4Lmlal6EU00W1hvBjOPneOXkWWfO8bVlX+oh1WP7Jkjfj4LGgEI+iVI8L4ooYxjexnH3cGq4zmwrdUm5f+/97B6Mr0Na+pQwZXkxLW83ZFGVKXdGnZq0HmlNxyh2k2jnTKB66sVSFiyEHcOJLqJxKgLdkjCmw7XF9ToAMMlmwKH8oDoQPNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.alibaba.com
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSZc2wdkdlNg3c25EYI7qJsc5FCBM5z64mTtNRVSgww=;
 b=OzgMS691YR5oPbuVzktbcblGUM18+gCHNfCveIzFBgdTrIypea2y9nl/4kBRvRmf5KSHDlINcYGrKDHmFhlfkkoCI8sPvoFgUbrRBe6Hy/UdZ5OleWhgFe+s3jWxaLRAKqPH93DhCROGJfuv2R1CtGaYqvaXD6jWTtC6XSJbpP9Ijx8LXaHt0bd0mpZjvjVizZKAjnXnodavdxTprjhIiCQMcAy2SI4SjnH1hIwchit8BwJ6tKwvr0teM/frnMCp6HFMfId2zbT3MtUXKQLD6dujvo2uWChsP+B5ZyxXtHyPKkGvQoW7NUVaFE4bUFDVglllWDO/euA0GQPq1IlXSQ==
Received: from SJ0PR05CA0126.namprd05.prod.outlook.com (2603:10b6:a03:33d::11)
 by SJ0PR12MB6854.namprd12.prod.outlook.com (2603:10b6:a03:47c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 10:07:24 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::49) by SJ0PR05CA0126.outlook.office365.com
 (2603:10b6:a03:33d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Thu, 26
 Nov 2026 10:07:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 10:07:24 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 02:07:12 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 02:07:12 -0800
Received: from build-akhilrajeev-noble-20260927.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.57 via
 Frontend Transport; Thu, 26 Nov 2026 02:07:08 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <jiangtianfeng@linux.alibaba.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <digetx@gmail.com>,
	<jonathanh@nvidia.com>, <kkartik@nvidia.com>, <ldewangan@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<thierry.reding@kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH] i2c: tegra: Fix HS mode clock calculations
Date: Thu, 26 Nov 2026 10:07:07 +0000
Message-ID: <20261126100707.54364-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126063852.3251618-1-jiangtianfeng@linux.alibaba.com>
References: <20261126063852.3251618-1-jiangtianfeng@linux.alibaba.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|SJ0PR12MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: 4686ea69-bd14-402e-2ec6-08df4ba511a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|6133799003|261009223027099003|18002099003|22082099003|10067099003|261102123227099003|11063799006|56012099006|261026140227099003|261022075727099003|261022105027099003|261021121427099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	u0GQjS+TmX/i2YN4ZCpX0s5jotyoRZ0OI47XHG+Wikrog6sQ5gcMDtAizvZGNRrfI2b/UiiNHWXDz5X3/TlJqtCz4mXaa+KCL//PnO2Yachue/RsqClZFG2Mo/sqHeacddQbVqjfQ/f/Si6CnQ7msdBN802fY4+cBkRzhqAr6y1Wi/UFPvkFB/BIV76QaGWnWBAgk81nNOZ1nVppB8R9kT9bVGy/tvLeqvcYFvamCmkJUZiPqDMMNDJ24DEhBDIAx68J2HPk460628tcX00ZROulJ7U4ZjBsgiPbg0Zsy5Vnfl1tBHHD/cyWZFNIX2zonFP+dJxK/1KVjEvIL9tFkyWXP6XxYSuuXHhDzgZf4dybKLqdvwaxtoIVt8SKt3btr/wioOPeJhNo+xl++W5YJvFrHIaFSiz4pFkqIplT7id+6jJfjp5z4fqu6rjhabnGVUYv+rapUxJLlNnGV5OEu4o31Gax7wjqO4K5lbEW9i5ZHl5cbpAfOergwgAixdozs29PN1Deyzq/ecIeIzh7EVaJ3gY6SQ2Fjj25l5UL44f1CTp6c0IV4HIljA6MRNTSqAeTIRR4iAsTb+NHRxCA6qYO+1hD59+4neEQiQKyd7891G3SonkH0nhsG9Bl62A3O+fsmWiUAqcGZBesBa4hYb0xqs/tEGJCL+pyQ34djplqda4qVVbalqLuoyKvIUljQCt0oNU+eWXwHWt2tw1TOQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(6133799003)(261009223027099003)(18002099003)(22082099003)(10067099003)(261102123227099003)(11063799006)(56012099006)(261026140227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZhkwJGboLnnqro6kGnFk3ONLAwfvdJtxfyfM8lmWYUFjJsfWvZRojpKVO8zMCySzrQrAEA8xYvgAoGtEcEDdqNn01fmy+wrR9sCckUgDhfx+lWVck/ppDaF+IGkwKIt4ooCG3BLZ6+02cVS0APBVmRAdz5U1d2Dzed38pn9MIIawF6NpE36kXZjfM1EVF1QdrOYCbyN7rMsPw7qtqWO5QEhOcCJ6en2fsaBFX7sogRh7Lt40wP4JY6Ayn4Gbo4Mwz6KXQf4b8loBByerVWC+PSFZUDT+SiatD6CReFeKuhRq8QxG3+MXxd32uB/owauLi1MQP64MEnviDXP8u1H2BeFT8FtdTysehGHKm8197wrv2wYvGtjIkU2bxboaHa2uDrMlKGtc4JBrB+oYEGHu25tCiMU9HfrDkH0V9QyfcHng1N0czuLoPRdk69tMVG5G
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 10:07:24.7318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4686ea69-bd14-402e-2ec6-08df4ba511a4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6854

On Thu, 26 Nov 2026 14:38:52 +0800, Jiangtian Feng wrote:
> On Thu, 26 Nov 2026 06:21:25 +0000, Akhil R wrote:
>> Thanks for sharing the patch, but I had a different change which should fix
>> the issue.
> 
> Thank you for pointing me to your earlier patch. Moving clk_multiplier
> before the HS register setup fixes the non-HS timing overwrite.
> 
> Could you clarify two cases that appear not to be covered by that version?
> 
> For an HS request, the multiplier still uses non_hs_mode rather than
> clk_divisor_hs_mode. Is that intentional for the controller, or should HS
> use its own timing/divisor?
> 

Thanks for pointing this out. I overlooked how clk_multiplier is used for
HS mode.

> At 3.4MHz on Tegra256 and Tegra264, the default Fast divisors also produce
> master-code frequencies of about 457.7kHz and 412.1kHz. Is a separate fix
> needed to keep the master code at or below 400kHz?

The controller clock is derived from its source using discrete divider
settings, so its actual frequency may differ from the requested rate.
With the intended clock configuration, the master-code frequency remains
within the Fast Mode limit even when HS timings are used to calculate the
multiplier. Also the non-HS divisor should not be modified since those are
calibrated values to comply with the I2C specs.

> 
> Our patch attempts to cover both cases by selecting the HS timing/divisor
> for HS transfers and increasing the non-HS divisor only when necessary to
> cap the master-code rate. I would appreciate your feedback on whether this
> matches the controller behavior and how best to align with your patch.

I would prefer a smaller change like the one below. Let me know if you
would want to take it up or I can push this separately.

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 76d21bc51c618..adb6c6c0b887b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -976,8 +976,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
 		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->interface_timing_1);
 
+	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
+
 	/* Write HS mode registers. These will get used only for HS mode*/
-	if (i2c_dev->hw->enable_hs_mode_support) {
+	if (i2c_dev->hw->enable_hs_mode_support && t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) {
 		tlow = i2c_dev->hw->tlow_hs_mode;
 		thigh = i2c_dev->hw->thigh_hs_mode;
 		tsu_thd = i2c_dev->hw->setup_hold_time_hs_mode;
@@ -986,9 +988,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
 		i2c_writel(i2c_dev, val, i2c_dev->hw->regs->hs_interface_timing_0);
 		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->hs_interface_timing_1);
-	}
 
-	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
+		clk_multiplier = (tlow + thigh + 2) *
+				 (i2c_dev->hw->clk_divisor_hs_mode + 1);
+	}
 
 	err = clk_set_rate(i2c_dev->div_clk,
 			   t->bus_freq_hz * clk_multiplier);


Best Regards,
Akhil
