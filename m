Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2062.outbound.protection.outlook.com [40.107.212.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235611E2834;
	Tue, 29 Apr 2025 06:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909179; cv=fail; b=DKs7pJqRT57sihcBv7fXmI7JrAKOmm9JCNJytIJnJkpgQRXfooPE1kHS6jZnEN9pTB1rhw0LSgYZZAvSpebTna3Ohrq9rY8+IMlQsiBWiJ4nZ7b9qnp1CBLj7eB1Ln6Es8BpxwQJcvK3VG+/5kk+925pkE8m9Gmn8ly7kNfk0vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909179; c=relaxed/simple;
	bh=U73cnjkbaPcbgbrabqw4glYFW4O3UyGwpFq06Wr2cD0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dmMVwMHzqS7UquTcjqRjP1bVuEN/xyp6bg3Pbc/6XY+Dkpe5lt+UxKbVmD0yjnbjSSVAr2z65U86kG2Kk+UUawzzna60La/nXFzU4CrWQztHF+r97ccN9PksRV/ZMEyE5iigqkluUEZqsh2Or6hGPNhU+3U8RArhjlUlpN9Y8Hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hiSKT6TZ; arc=fail smtp.client-ip=40.107.212.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hiSKT6TZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZppC0Lt0Q1YHypTbXZ6AtsUhhG21XJF8xpXTVHD5IsyI9/0ESW4yrQ6JXi6+tqi9AeZ7ZLLSd46nWuumV1RgVfttZj37C0esUj/oazhkcGZoM6uLAwWBvdXh7N4HPRA5juCb8S84UGOPzBRH/r6dtWhIRYhAD3xDH/EkPOoa4JF9dTNWWEYzv+Jb3QtDlxH+Cxdwd1s5JrUk6SOhaGcy/Ao90Xh1nio/bLpgbD31w526fgCZhoTSFJdS9+50nRuyDGDgn6K3wDCb+hkJ2GlbiJp/Fit6tbMos2YQjM8VG7Aq6o6EpglDhmfx+rO5s2PAeKwU24LM5WiktXoJ6+efA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPUNiUWB70664ohNM4TTGoTIimLtCN1y2KUFoA2hzs0=;
 b=dJ4a26DbZD1wluTtVhIMxgxwfELc5SV9c3Io6n3GKeKZwMcghBhsUPlMtk/j26N6MSAoL8UCU1OAxQx2O2JXf8OPefIckah5GmxbsSy4fjuaRlZHl+Ob4i5y7iX47NiWRQCsVNb5t0wfXD69Be/wIBrAsMzSqnv3iOLkFBFtUHarU+jsjNVWQdDHGMMQ3g2vdp0F1qwg9JnzpvNXYXTlqJHl92eOZJObYhi17VPb9tskrk/gnumQtwmX1ghGYzRKxuVyWSVv6v9Nnu7mhuN2z9/Nonl+2wO0Y8OWY0jlvwHE/lf4vasRzKvMWESxXNvyvepG4XAmfGlGLB0ZBeyzsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPUNiUWB70664ohNM4TTGoTIimLtCN1y2KUFoA2hzs0=;
 b=hiSKT6TZaPJBhkJt0VtqogPoSvuQ1b3X00Zh/usmN0f+BD0C/X7BSMaFnPUgEOG6ZaJoftKIERaPZXXXOWcZtYSU+Fz4ilWiZGmw8H3E87LMYzvOmSlJGeowZ8/WQU9SYdN2p2I/KKJd6RK4YaNwFy+e9wl8tjOZGGj3Aj4ZL6WDfBhy4xlm2V+Bc98B5kpKG462ENQy/d4UqrubK5ipUy7bqF/X5Q/HaR293dskb+fHvU5OfNvMBMX4s2AdZ4/Iyd+pTW8CJI/AQD0eSqJmp72bI1+JPjn8UYWc0tp7raZ/ut5dyu4bw2HDGVCUY2npb/eOQDN/dPaGYY+Z3gd8Pg==
Received: from BY3PR10CA0013.namprd10.prod.outlook.com (2603:10b6:a03:255::18)
 by CY8PR12MB7146.namprd12.prod.outlook.com (2603:10b6:930:5e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Tue, 29 Apr
 2025 06:46:12 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::62) by BY3PR10CA0013.outlook.office365.com
 (2603:10b6:a03:255::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 29 Apr 2025 06:46:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 06:46:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 23:45:58 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 23:45:55 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, robelin <robelin@nvidia.com>
Subject: [PATCH v6 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
Date: Tue, 29 Apr 2025 14:45:37 +0800
Message-ID: <20250429064540.1642030-1-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|CY8PR12MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: b367debf-d132-4d6d-a63f-08dd86e987d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HQKdiMdjos9jFaAb68trTZS59pSleWMb6MvkVUJ8o0xyC5+THbGDid75YY7t?=
 =?us-ascii?Q?Jn4P2xvABezVyQpjODQNFWkvp7u7k5OEcyIa+K/uB44+MvUngJy2JWWu95Ev?=
 =?us-ascii?Q?SBzia3Y/I09eLChrc6yjRwdXcTUNKtC/fi1oUDX48yJZV6KmiCcU/FxN0OoY?=
 =?us-ascii?Q?4GuT5Vn4SH9aaBeQYhVrlCxpMyl6N7/y3wAWc2O/L6w/N+0RmqE8KTjX3YcR?=
 =?us-ascii?Q?01zUjeZPNfI5DYUf/j6piQmz5dkKN+lAfsxWAybe8H3mhfyjABFY036A6shL?=
 =?us-ascii?Q?nrGBpbW3/yuSiixdM1y5260DnDCLLuIq4pVunqX9q3E+Bq7fOzUKcc0J7ycJ?=
 =?us-ascii?Q?RLVhF9MUMlauukYN+lYd/uTrjiFfMvB33rXRKwo8KCKxKJzk/XeSAliTqVHT?=
 =?us-ascii?Q?UuTVUaacF1Qe7KEAtyek1GgOj72/kgCmqs9U7a9jKoibd3n0LCRqrwGdwoi1?=
 =?us-ascii?Q?OgdmTY2YkfAPmUSgism+r35hnAo66Kkxf3F2TzWPZm4Bj6qQv0dSJ7T2WP2w?=
 =?us-ascii?Q?XKVyuILFemrfMVghAO1idsRkbpMqmQdDWShC39rMSoOHIPWpA49GS7swQVlS?=
 =?us-ascii?Q?QkxnyGneCtLHMsIVoBSKI7syzthlxa0tXlya/bws94uhrfPE8l3G4t6sPFgN?=
 =?us-ascii?Q?Q6xgw5ha2A6dXatwlgz5F0NlQG5QvWN5YX7OsNqn67XtIB5mumGgMJyXSKz6?=
 =?us-ascii?Q?7j7GFATB7rd2CwYEGLpY3U/ECzYWaMO5e1p3wWVb5P56NcFmlcJhvn89TS5W?=
 =?us-ascii?Q?sn1CVkiaJ1s8DYJGrPAoZfmaEiEQz6jsbspbhkKY2upVqfcucXHQgFhmftGh?=
 =?us-ascii?Q?MO68Xc6NRdd8F9wRmtDe6WQLb6vy/Uu4ZE7fj3NU4ajx090XuSWsAj9AvzwM?=
 =?us-ascii?Q?2u4UKMJW3B3VHcODT0W1FkSuK72DWW5Ls2ZWUWC723umb6DwWKGdloplVCY8?=
 =?us-ascii?Q?pu4bXpT+/13J48n96oZ54TLk5HrN57bRkWkSBabDRXvBfVRR843UQGuB10+v?=
 =?us-ascii?Q?UzO/EnkkCHAYC5OF0cSw2C0P0Dp9XoQH1Y3j007OSbJv5DYzIMP+WBLFD3iE?=
 =?us-ascii?Q?+3mwZiVbC+Yubrxy0+6Ez02riWzvIe4QNpKbKdlFOBd+At23t8oIQGx7nvkZ?=
 =?us-ascii?Q?EpRa9MA+pCvh31ZhIBR3zxuHqL6G3mb+hxEyuouBf8zdmYtiNTrAjmZpAEzP?=
 =?us-ascii?Q?PqzNt4E7/J7J9aha9qNxl3v8fm4B8BQqRN4BF6H3+O/kBZrJqFmYfTfue4vN?=
 =?us-ascii?Q?iW3Pmtzhva04f7w1+4iffLAcjud1sxNoDoR3N2CcONFHOirY//Ba1e+j+Gp8?=
 =?us-ascii?Q?mgzS8qinCSsMFfFvgJ5IDNuNKYOKfu4Ol3zLkKQjVXNX3ks5QSGKHfVT0DD4?=
 =?us-ascii?Q?l/4OREptoOmEd6wYA2Oni6wBDXa0Fk0ylmU3GUtxUDiWPSUVvpBOjSLKrKWP?=
 =?us-ascii?Q?u4l53FvuD4QRsPGiIGkqFw1PqqUR5UaQ+srRPKKTf8n/s2IdgWlqwfsH2e29?=
 =?us-ascii?Q?0CX9mUsUsUFotp33U/XacVKD40TIfxNbmMph?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:46:11.9299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b367debf-d132-4d6d-a63f-08dd86e987d1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7146

From: robelin <robelin@nvidia.com>

This set of patches includes a fix for watchdog for it may not bark
due to self-pinging and adds WDIOC_GETTIMELEFT support.

--
V6:
- Fix timeleft value addition using unmatched time unit
- Use u64 type to maintain the microseconds value in case of overflow

V5:
- Print warning message if get unexpected value from the register

V4:
- Improve the precision of timeleft value
- Fix the unused variable warning

V3:
- Improve comment description
- Refactor to fit codeline within 80 columns
- Remove unused if(0) blocks


V2:
- Fix a compilation error, a warning and updates copyright
--

*** BLURB HERE ***

Pohsun Su (2):
  clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
  clocksource/drivers/timer-tegra186: fix watchdog self-pinging

robelin (1):
  clocksource/drivers/timer-tegra186: Remove unused bits

 drivers/clocksource/timer-tegra186.c | 96 +++++++++++++++++-----------
 1 file changed, 59 insertions(+), 37 deletions(-)

-- 
2.34.1

