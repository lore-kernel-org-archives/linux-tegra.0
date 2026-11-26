Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795674112;
	b=AvNYXMlxwScMuMulA0exlfqC9ykZTjDUSv04T0aqmH/rDTDE8nNVQ2FSmFRnSjvT3i7W
	 TVbCO4Iu6zD1oFZe9E08IibQ/CVQ+bW7spH6kjmb0J6vUCCOhvuEbOGceCSrQcGQAmEFH
	 +g+zgu0qqsNw+1ceWErjETtk2/Th1bCKYiMUbYVSL/BTk8F38AV9UqRQoLD8B1XuvDr/2
	 5xTGyBkWEwzod7d14H8xXbCsQWXbAo4jgvLhSF5uDgPhekExIdcfjsW1Pi7I4M/Hd/qQn
	 u7w1J5KfRir8xdVPnzt5EfVou3TiQjIyJV6sxfGopXwln3fYdd+Kb1o25uqSNWKFK2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674112;
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
	bh=2mJslRzjBilNkDW6aK5CXBEADe+fFq691tx24B5f6Og=;
	b=hs+v6p1STTyI2A+/xSLyUBLqu6fh/uGYtDNznRY8ov1ZQ7quHgN+1ozQAuNzSGU7yva6
	 G/CpEC+yWnMv3cJ0Kl7uSRlajN7BBb5H4fKENYDJGwov652NxFHf3avkyMWzlStU3gwGY
	 O/bCEmgneh+USJg/HWyCvnlR5yZKTMLhxp0Zu1SRPqWzOrJ3KBDq5ZreOqJfbrh6oYGfS
	 7qsLOpVWibRAmDEz+IAGkIhuSIiYS8ORYFwm5LnbReShYP4ppogidnGyHlm6VuQUuabHE
	 Sy9Y1uKSBazCQTn5+PFdKoeWeEisNHm45u5650JFfRK/uZCSq0uN+F4Wt3K2ZsFEn/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qhH8UeVQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.38
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011038.outbound.protection.outlook.com [40.93.194.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20136606A31C;
	Thu, 26 Nov 2026 06:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20136606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qhH8UeVQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nH9uKZu5fk3Hud5GeD7K8GmI9x5C+GeMbEKbJ+GCOArUQO8q/OydWxl/0UiicUQhl/QRFU4ByR8A8HpXM98I1cZ5HzkeZWz/lTC9NGhdlFRsfKqgkCw46lFyggQjtpiUm7k8MNfl+a04DzKNlI2AaDU+Qmyx5M4NGG38y3A/t+JNIhUuQLP04hEIq0WRaL84nNG75MzyP4tZ8jTuXPeMdYjF7pWWRzT7gs2juT6UcCalB34Zy5yMOGFgjkSjTMYzj5lX2pXuRCJ5DEyA8m9LCnSWmuOgaZh/MUc6G9oajRNqb84ZqW84pgbDrLjrdu/+MGDlgxA8jcxklVKN7/fVHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mJslRzjBilNkDW6aK5CXBEADe+fFq691tx24B5f6Og=;
 b=FK/ep8eBgMWWYRn39AOqrJr8aYddPI0WLA0xNdziSrkrnhp3ceY6SIe7VqFevLU9EzNtzRarQgAVYZW/cLsXGQF1SBcsA17/icDlPpLMgdC06p7dAnrcpXfk6iq0mgSmBMKDj80DJx9WXMxWRU3z5EphOJ6iSbtLlEUCX7Vtc25mCUlYO6QHVuwUb4t7MBvQVoCeChVoI04FnctFMkWgs3+Uvh8EP/RRIsNwyd5fKWetA0z/hZUN/WEwN5GiVIf6UNaz0RYJru1ad+W99OXCvb00QIbjAKo4SwKfYtzcE7UQzIscUxAPFBNrFgoyvvI1nRfPuwP4alpOhXwNF8pwKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.alibaba.com
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mJslRzjBilNkDW6aK5CXBEADe+fFq691tx24B5f6Og=;
 b=qhH8UeVQOmrxC6IUWt4I0Idu7tVOluiaTi2qeY72RiJGhN111nj2BqD91cEPIQ6MMhuQ+GBYfxDRelcMUDAAlVidGZkM0GRD9kk0/67viUY5BAEIyDlmyJqhSoN1AQStRlKUdpULTKCnUpbxrE5nY/1Y4b2SEzg6M53PoJoPDTPCQa0BZCAwDggfDKdAq0o/1gmiD5AmLYRNHn9gk1VbxIIBMzbWPNBm8yZrLPiS+MuSXe3wiXqtWsmGnboInb5aPKF74X4rws0qI3bBKi7pfWEILBGN2cLK4s0gAsGusWUOGZXlkiIxSLJbd4vBykVigEmfPkJHzq0A84KQAxDDoA==
Received: from PH0P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::22)
 by PH7PR12MB7185.namprd12.prod.outlook.com (2603:10b6:510:201::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 06:21:47 +0000
Received: from CY8PEPF0000005B.namprd21.prod.outlook.com
 (2603:10b6:510:d3:cafe::a8) by PH0P220CA0004.outlook.office365.com
 (2603:10b6:510:d3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 06:21:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY8PEPF0000005B.mail.protection.outlook.com (10.167.247.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.0 via Frontend Transport; Thu, 26 Nov 2026 06:21:47 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 22:21:30 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 22:21:29 -0800
Received: from build-akhilrajeev-noble-20260927.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.57 via
 Frontend Transport; Wed, 25 Nov 2026 22:21:26 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <jiangtianfeng@linux.alibaba.com>, <andi.shyti@kernel.org>
CC: <akhilrajeev@nvidia.com>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<kkartik@nvidia.com>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <thierry.reding@kernel.org>
Subject: [PATCH] i2c: tegra: Fix HS mode clock calculations
Date: Thu, 26 Nov 2026 06:21:25 +0000
Message-ID: <20261126062125.45424-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126051207.3099199-1-jiangtianfeng@linux.alibaba.com>
References: <20261126051207.3099199-1-jiangtianfeng@linux.alibaba.com>
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
X-MS-TrafficTypeDiagnostic: CY8PEPF0000005B:EE_|PH7PR12MB7185:EE_
X-MS-Office365-Filtering-Correlation-Id: adee7f81-6f9d-4527-7ae9-08df4b858cad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|30052699003|376014|82310400026|1800799024|5023799004|10067099003|11063799006|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|56012099006|261022075727099003|261102123227099003|261009223027099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	6NCQVWbNI7VbeKPE2euMfFU7VY1BUtooQMMNwO2nzyCb0qazdbJ/fDhfNua4remWu34ZmwU4y8octnkG5SbCe/Kmlo3fE8LyGVAAJf7iJTcLYpB7eeCkdF9aydF/15bkzH1+V0ne0CAymnGEsIEW32ywavB0cc3SqmCmAr2WVkCE0nCmG6gzyvbw2Uwxq/XIWMy3cb5zpJbfvOlbyk5jkbk/y0C0nKQw0hfWCOG03cl41LuA95yidz/+xNiDJX/ES5Ecb2paPQFwu2OufDps4YsX/rBkCfN1wxUWxIz+YqED0JD/xNWHPNpUJbLxahbA1rxDVXCWX+3qA3v32AcSu1xBUBuZ++GiN7Cybwf3ZIEP3SOZe89TdqsS1PSx6yiYD8STE2p3jSlWTAi36LOGcxnVaqu+J/cjgVZBLMOpYpNflqdtxqGLSEp+mfZP4OISbHGE0B+4cVfjKfbO6cO4Oud+nct9FbQj4iTTva8rc7x6MpmcHjLE8TCQFwWtcSsLVcDyHWtRRKBzZDKyzzDx8NCIamKqKDD+O4pBMYcYXcRZe6Udx0OupN00RBOrKGjj3DEsmMPW31Z9sQmsMKN32qvstFgh6v1IXxL4Hwg/5cDpiw06XOoWzJVSzuFWNDF1S2FLJufcm8KS0t7cXTcZqmuHqfHx0uI6oj633QwpWJTf7vl8kAWFOsQdbE/FXwCy29DRszLGlIYrfgGP8h/hqQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(30052699003)(376014)(82310400026)(1800799024)(5023799004)(10067099003)(11063799006)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(56012099006)(261022075727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HLVjWyRjtDfoS41HoUirpgkzbqI6R4djuDAo1+pjjJtzahQxo9PB/PU5ljxvsY5Cbid0NrXacNSyqoNh/x3MxYv1E0UfxdGhhBHcu7qId49Q2dgKW6+Ip9QfLlYB5fhHQulP0yKGxe8SP0q1A6T77y3KYcFxSYWsSHZIj4uaBIdOxI4jqnEfdP8pE8nYNOI6ACz46qWevqC5z46KasFJQ0wqh+X3Bo2dZy9lYto8gTOMoJgJBTboEEb35dPg8tiRwUE7RCdJgVKT1TL7+tiudgF6shato3yz6PhqVHY3nOyyeSbosKUyehNQDogRypFt4aFZ1CCH2Dckt+45Lo3nsLI9E1ZdfeEb2uUwx14SyM09ghKYvS8sEmMk9//LcIIn9DJzXUKsRCqwLTm2LCTiCCrLsA43ePSwTnmwuaT68svbkvNFYuP9kRy7h9lF0FCL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 06:21:47.1753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adee7f81-6f9d-4527-7ae9-08df4b858cad
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF0000005B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7185

Hi Jiangtian Feng,

On Thu, 26 Nov 2026 13:12:07 +0800, Jiangtian Feng wrote:
> The HS mode support overwrites the selected non-HS tlow/thigh values with
> HS timing before calculating clk_multiplier. This makes Standard, Fast and
> Fast+ modes use HS timing with a non-HS divisor, while HS mode still uses
> the non-HS divisor. The resulting div-clk is incorrect and can produce an
> out-of-spec SCL frequency or make clk_set_rate() fail.
> 
> Keep the non-HS timing values unchanged when programming the HS registers,
> and calculate the clock multiplier for the active mode. HS mode uses its
> own timing and clk_divisor_hs_mode; other modes retain their original
> timing and divisors.
> 
> The higher HS div-clk also affects the master code, which is sent using
> Fast-mode timing. At 3.4MHz, the default Fast divisors on Tegra256 and
> Tegra264 would result in master-code frequencies of about 457.7kHz and
> 412.1kHz respectively. Increase the non-HS divisor when necessary to keep
> the master code at or below 400kHz without changing the HS data rate.
> 
> Qoder, an AI coding assistant, helped analyze the issue, develop the fix
> and arithmetic model, and draft this description.
> 
> Fixes: 978b3ccbbac3 ("i2c: tegra: Add HS mode support")
> Signed-off-by: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
> ---

Thanks for sharing the patch, but I had a different change which should fix
the issue - 
https://lore.kernel.org/linux-tegra/a3616176-ba50-45d2-a0d4-46fd5f6379c2@nvidia.com/T/#t

Hi Andi,
Did you get a chance to check the above fix which I posted a couple of weeks
back? Please let me know if you see any concerns with that.

Regards,
Akhil
