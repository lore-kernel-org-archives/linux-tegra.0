Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B630D3E639C;
	Tue,  9 Jun 2026 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.4
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996211; cv=fail; b=j3JDGYu39P/7vIsrpj1QvKrNCWUGCt8PfeVafRnLeloNzizVqrlBtiqeXjnnoPBtOFthoKBoEn3+MiSAzqA5cGHGxGiGllvAPQJdF0g1VoaQ7p/KrVS3fS/GGlAcP8qqR3pzrzvCDU4RqO5XRwysGc63uXKFnO2WH0awr9TTbJQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996211; c=relaxed/simple;
	bh=kb8YRLd54sOfLicbKwxSf4Rl5Y1pgT/9ZhSp6E+HBgc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FNswa5Z6ENH9wPLKPERb7kSh4xb3+q1L2XUJmgZJf49rikWArCcl4sJ2bFVPubTKnFAdZdS3X6slDyQlvEiYHYXJIg7tCvAu18GFIf4dl3kNdIbDTdjvh1DzvvLSpfAuwt1gsbtp763cxkd4m9ZMey2PCBlsKxiLkJzQ813nURk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QMFgz1Vc; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QMFgz1Vc; arc=fail smtp.client-ip=52.101.72.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QMFgz1Vc";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QMFgz1Vc"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UnGp55S45lb2hXkPRzMda8GBNdslisjLJJd8BzvNRokRnljEbYP0onRD08rdb6UWQBxzc1+Al3QQU93ouCiim1D+79u5t6AeuYoyTM0qIG4jWLJgvRkA59wWioCAPsfKMLdX4x6vPcClzXZgPj2IjmfhOT5251i4s2pacg5V3fSYnBKtIfDQr68NpH3VO1cfDTrBsBK1lN8OgPjC8fMKAOrgK6HFrEFaaXFNVvLYGOxwsdODc/rmY1ykOKUdPzPZgTgd2l2CLvp+Ui9WHOypnTUiUqCbJLcgV9jr9IQr3LRuNb/uXTcBHmz7c4G9hP9XlM2ShW/zZ2mK125ePIpiSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpcN+X9FRwlCTkU9T6mGQC+qpDTLBKT0WN/mGcnthM4=;
 b=a5lZKYdOe61zIDsp81efyW3Zvl0ZJ7Yr0jOkP5snxfH5PzF0O0tyzR2HrmjezE8Jl31pRLro6XxbzMqUVR5y6tqey0yITgw7hnG7sfQhjwhIX5HZZbLHNVQky+oK6rLoOxGiQcKzlzjRMHE2V5C5bbYYSHDwUlechtIdBZ44mh5c4gHbY05VBXYhl/Fd6TdrpUOnFSBJs4376GNO9oQH5u4zJBYvs2cXrfXpTfKHzoEeSghftNhydTpsJ4CNDVvb2osLm+MmlB10R9s8Odi+xJXoTcyIk607yNaVoY46Js+3fbSsPikycA7YjfdT4NeiC7p9xtCHppNly8UBDufdww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpcN+X9FRwlCTkU9T6mGQC+qpDTLBKT0WN/mGcnthM4=;
 b=QMFgz1VcKRW7z/2cWpQOZhXG44fpriaLEcCgaEssOJrf4bspSBYTFG/WZ8tXh2MPPF5zvtI5SMTm0u9hTePA3IrSo4y6LPsdHuVzQ0vWHu5HnOW02T8MnH1QEpwYQVm56uQkSGprxhgVnCVc1evRv8vRoy9fHWaURb5CyoI1txI=
Received: from AM9P193CA0027.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::32)
 by AM9PR08MB5921.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 09:10:04 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::10) by AM9P193CA0027.outlook.office365.com
 (2603:10a6:20b:21e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.14 via Frontend Transport; Tue, 9
 Jun 2026 09:10:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Tue, 9 Jun 2026 09:10:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVOxfrS5edainQ6ypXEuISsF1RjJdBoZ3RG3ZzesKeXST0rVViVYZzw0n5vC7psFrwgYE6+CIv9xL6+SPdi1TB7Y4t1C4M7Ye4NWmrAZGKBgkjukq1c4Gxcy1iIWaXCk7itN+jwyB7QC1MhhGICIIxnmkY0J9HcScmFTNNmA7dqql0synYPmoNf54/+NMDPceCMI1QP8z3NZFZ0IKqTLn7I6n7EAXuyo7za8O3tW4pHsiGcmevyyIcYP3f0G1O4513sZ8blYeQGYc5INGTvwr5fAhEAOjpArixq+WS/GJJw9PfvhVE6dNBC/ReBh/FGfjvqjp9XLpqLzjc6CTxAcAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpcN+X9FRwlCTkU9T6mGQC+qpDTLBKT0WN/mGcnthM4=;
 b=CezvDj2FDjJ4HmhScPbUwVsqp5HSFnAFpGg9ROHUqw/2R1jQwqEKBQyF8DG/ZFr33A0K98UR0mxyhL32/13NF7YZG7VasrKyaH6NHisuTpcqgLG5EiBsM93u13laLs68f+2MFfLBR6ESx5BMIa87IHdeA8or+zqqxdu5IqnEXH5LMsIkuivOqRPAHKcqpO3/lyoyUIzFS4At5IJ9D5mJEKH4ccZu3VmZ4kX97lgnmuOKcI+sbC03gglFTuETdNtErAI2et6nVWscmmFhBqJZa9jVH5EjSJJHEiVTDr+jyN8eNHdnfaO+37BEQX+I2JDa/UoTvR8Lkh+0KutjGgR9+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpcN+X9FRwlCTkU9T6mGQC+qpDTLBKT0WN/mGcnthM4=;
 b=QMFgz1VcKRW7z/2cWpQOZhXG44fpriaLEcCgaEssOJrf4bspSBYTFG/WZ8tXh2MPPF5zvtI5SMTm0u9hTePA3IrSo4y6LPsdHuVzQ0vWHu5HnOW02T8MnH1QEpwYQVm56uQkSGprxhgVnCVc1evRv8vRoy9fHWaURb5CyoI1txI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com (2603:10a6:102:46e::7)
 by DBBPR08MB5881.eurprd08.prod.outlook.com (2603:10a6:10:208::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 09:09:00 +0000
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15]) by PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15%7]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 09:09:00 +0000
Message-ID: <1c8e441a-6b33-465a-88f9-9552f346ae18@arm.com>
Date: Tue, 9 Jun 2026 10:08:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] Enable sysfs module symlink for more built-in
 drivers
To: Danilo Krummrich <dakr@kernel.org>,
 Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>, Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rahul Bukte <rahul.bukte@sony.com>,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>,
 linux-modules@vger.kernel.org, linux-tegra@vger.kernel.org,
 Sumit Gupta <sumitg@nvidia.com>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
 <20260608222448.1353773-1-dakr@kernel.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260608222448.1353773-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0095.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::10) To PAWPR08MB10975.eurprd08.prod.outlook.com
 (2603:10a6:102:46e::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAWPR08MB10975:EE_|DBBPR08MB5881:EE_|AM3PEPF00009B9B:EE_|AM9PR08MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 307d978b-6eab-43e0-dba4-08dec606e4b7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 HFwBYJSrzNvr0MhvEpdBZvmxz8wgo6G5xDncvsL+EvwJfTBPL8LxFN8HrDGqY9YLomh84RvXd3BcatZnRDDOYRoxiGaTCq1WzhZYP5H1vRxmqZ+oeBzgpIJEUcMWq/AQj2iTwjQdcSjls4TMQvgwjQSGrCuVutmQ3JwoFqGcXm6TjcPL7UUGiT0gn/2C8GREfzOovbgCJxGpFQakQ+LyJzAJ6AmcgjZXdNqY0PICWqWKKpAA9Udsc6uGA3zzVgwNBYRs5Jlf2Ggx+Hwq5Gi0URymn/Nvnh8hSxY42gqcymj5MoHvTrbUxy8apwU42fhxlikBiJhdgH5qRPe/zlsv7C1g0mdhfr1kSGHbBTeb6XAYZt9CqRoxv1dYBSMwe+xMqFvEvYvZL3/034x5pR5RcB/IdSjfPvucbQDnWhEJFktosk7eVLcuc+uLliJ2EprOnZkokH+cn5SWLhrwHGr7sM9q8ssNUqCGAF0fjWB3CxwEZzoYh75DJ9omhO6i+DOFSftlODSBCQFP68Xo+Kb6+pZSFmUWw5Suqlar+pgSnDi7CGKYakkxtWn+5pkTqagh98VJU6WkznnmbBMs37PjZDZNRHkPDBc89/Av69xOnWQwKiazOE6VYoarYCuOIidfahkHHu5cOjD/NO2Gj3Q2Cev0aWRqz4ZMYU3jSQeT+79wTA7fEZlhyb9pEEIGAhwa
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB10975.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 K0tM1RLvEKiFz/YwqmXmkN/9aeLzVymqpScS+roVM0aGoxkPowX9UskNywYMTG/NxvFfM+8lGsV7O48XISu6C2pzPJV95ytq4rkQhyrlOqN6IUXbb79F3SHCkWB1LJ5HVlDfN5C9cMn1+wcV9KOhsm+9p22QZLOu5e6hnBKINaEiTwcRNjLvEmMcS+WOAxPb0k9FL5y7SVNJ0d080QoghFjJ4M9j9YTdF/cDmz4a/aCZjCjDrKwelIq4heFvc1saam4JngRkoMPJQwewG1m9ax7U8DjMI0qFdbz2JvRZmzC3KGvIzQRmq9/edPDMpIiEurOq7Wi65QlD6ulfExUi9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5881
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fbac4638-ec42-4e34-eeee-08dec606bea9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|7416014|376014|1800799024|35042699022|36860700016|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZZHNqv+Y8fwlxEpk7coOM800AY3c8ZecKf0tcrhxWN8hceUf8M1YAcktsxy137SS5Ai7/fPy/k8EO1+/L/z//37UfAFlIU5nLM06IndjKWmqMzgH/KJv8ztRAZge+FQwlYVOo0Q6xD8EAvg46i0xY4I+WpWewm9RbxeN04+o5EiQGutfug9YT9/BFm5elbSdHlGNcsOYHJXhRko+3gdiWy8HpNL0cL+SLZqbOhC+E0jEIUbwf6YZYm/6LyOi8pOTpZDVFZXxP3itGRpyxnbV38QwsZ2rE7aWrsLxuc6TTdi+dEjkkwfhM/CHCcDbeR9sszWVPF5xueNXa/eJQ4jKxrZLRFiFq3aCPty7w7ahACUf1BArBMrdMNt5PsQsKRV+pZQt49M1iuaCN6altQcIO1CdNuu0o1jLuYB//qRUgugqy6J5mzv5Ekjt5c7jN56MqKNGan+Up5ClZfsxh8B8GCrbKEsFMCiTGm1gCddjp9IrlhfJPWvsc88/+im+FmEuqJCPyd353TN0H+NNsQQe3og0YJ5WweV47kiaIGPKxsXWx8ljQeKOzxdMpIi/DeAuaakpwODT9/quuZTdIVh84Yb032xvfWPsCHK4IyA5cfJtRuwmdRmu/oGF3lUhK82pEX5/U7dadhpszwgF8dNo2vDNtUFKfU60LXlq3YKWEp3BNt8iQphV14caNlUeN/KXyEqWJMTDiusVe1WbV4r7LI8nbSouIccjcVRmQ2BTNps=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(7416014)(376014)(1800799024)(35042699022)(36860700016)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cG+EaQbzTVVnxBB0Cg+dOZ4ZW6lLwlx2HYztnn45DaWBl14QdpgC0iHf0QCWg6lpMp+ZTVaH/tVlHH5AP5jG2hNPptTrdqbrV8ZoaxLDVpIRvNKOLAgnkzW5E/LuheFukk1WYu1pdvpevtFfrlK/6KFm1fK/YSkgk5ioBsqY3dQCb8aJpKa0o9y0bgxLYsBC0CsL9y+Jd4E6ziVMLkCeK6J9f28lQJrJtRbcc0rVCYAgk7hUdeSVf+zuLt58RrbnB5/7hy5olrwwDU+iBYRWPKLzfVAcGaRLlT7AE8X+EcpDRwxYIUkrd/tMQlBNq6Df3NPb7XAJWFdpDp6fzOQJ4dwUv5x03dGQhGtwOWa873ifZVzHqJDHP95xMgjeIxn53Lq9e6Y73D5487u6DibuWPfSM9K4aisRKSbg3tvvJj+l73nE9VEvYSMByWrfsn2k
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 09:10:04.1905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 307d978b-6eab-43e0-dba4-08dec606e4b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5921

On 08/06/2026 23:24, Danilo Krummrich wrote:
> On Mon, 18 May 2026 19:19:56 +0900, Shashank Balaji wrote:
>> [PATCH v5 0/4] Enable sysfs module symlink for more built-in drivers
> 
> Applied, thanks!
> 
>    Branch: driver-core-testing
>    Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
> 
> [1/4] soc/tegra: cbb: Move driver registration from pure_initcall to core_initcall
>        commit: cd6e95e7ab29
> [2/4] kernel: param: initialize module_kset in a pure_initcall
>        commit: c82dfce47833
> [3/4] coresight: pass THIS_MODULE implicitly through a macro
>        commit: efc22b3f89a3
> [4/4] driver core: platform: set mod_name in driver registration
>        commit: a7a7dc5c46a0
> 
> The patches will appear in the next linux-next integration (typically within 24
> hours on weekdays).
> 
> The patches are in the driver-core-testing branch and will be promoted to
> driver-core-next after validation.

Apologies, I missed your emails. I am fine with those, happy to fixup 
anything if the linux-next screams.

Cheers
Suzuki
