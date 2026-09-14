Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013024.outbound.protection.outlook.com [52.101.72.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6FC3EFFD4;
	Mon, 14 Sep 2026 07:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.24
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372476; cv=fail; b=ScJNLMosaRAGpNH+4qt1Bx5jU4+Q2dfDyg6KdRcpDaRgCXAXPULmrshkdLv6vkpRwf4vGBK9fS4qj2s7v7Dc7WEnHyTBLO1PNjaQMcF7IuGYghbt4NpdMuL6z8D7B+1Bt/pxLhTKUEOt3OJp5bDb5FhOq/mnpdVPc6aVANYltZo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372476; c=relaxed/simple;
	bh=TFiAEyzicqs00OwaYpnOM8Kk9ZJa6l3UkbNOdhqbF50=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Rae11oOhnVbmwZhU/yY4VIDnwdC2x/NXZl4yo64vx1C7MB6SjxPuQXlLozrUz8IIfS/rQvsBwZB+ZUvZEFtrhK8xR/BddHmhJY/kc8uezMJziupYvw47GTX9S3Pf1ZXiNEHmMS7x6fxk8Mew47LBifsdCOXhSvtf9P+/nc54Irs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EQF0bHkR; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EQF0bHkR; arc=fail smtp.client-ip=52.101.72.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EQF0bHkR";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EQF0bHkR"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=no9Y4mYUXgNW+vcHcgDDhbs79rMC3B5uoe7askQ8QqQgOtRxyP2cBoR8LMYXw6ASXz2CFNSZ9guIF05Qr39+E7ZSUWQwTBVxovFTLnZVJDnNVNtF3l4B4s1Oz/xskRFtHFzw1LmA4Y7DsRWZNjb33MpUPElW4d6SwC7LAnYfJllGPyG5iMw4R/F1YyRsJAkK+fzi3GoOs8+Uv0Ivhqbg4iUYSKYqe0ePdXjR/9lQG/WvbgSQ686KbjnXpChczNAJ6J37KOHG+SXyoSXGaxpZRwq2/iJE9uaUR7JS4iXyF+OLWLZ2Gr7EL138L1Xd28WHeG3lCkyIXN8yQ7OKPpQI/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMPfUrVyPf1pRktvVlNlNgY37bXHD54kvZbB1N3M2XM=;
 b=hjjZTs6CNzjgSnxz77J88JYPiyLWlUoSHb8TtD5QuWFIIExlcBd2DcNzBTo7G+bgVK449TU7uV2UFNCk7mFeu01sbPobsCQaQu7FMy+GdVvDlJ663BNq4284wXncWlq6SfKzelJG8R6bgfNGwBTwwz/8FSJDisaEwmym8ea703Ztc+89G8AEt7iLLreedbgUs+iFHEjcjahGeNqxOGjqvVftyqrWD5jAZ8nHGr0y9+PLSjsdJRRgHDm+XYO0BuAJP+dqO90xt1Nrsuqmn5lSFdu6m7naTN0mLs8HwY1qVusH46vefUUirlF0a+VjZTCq/XuKTIflDAMwDJ8nk6MZdQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMPfUrVyPf1pRktvVlNlNgY37bXHD54kvZbB1N3M2XM=;
 b=EQF0bHkRY9ioMpgBKEmlVhBuH0WTTUTVxk0XDSlCKZS78espDJPf5/Jn1sJg5q2US2DCC/giREYLLqZUDM8KwM1dXDvL8EYFEiG04hPgnrd77sgXzZM1ZJ6ofj7XUE5T+O4kcTdG9IjtBl7YnmHt1QodzfUfICzmDHCGWg4eF0o=
Received: from DU2P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::8) by
 DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Mon, 14 Sep 2026 07:54:24 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::2f) by DU2P251CA0012.outlook.office365.com
 (2603:10a6:10:230::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:54:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 07:54:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+NGoJOysk1BXBNlkSlgBjE9u+A5o5iQpQ26bNKfNiAbwDU391EbMzNYRvpCtBqyntEAAE9Q53sbXdNtznGy9EmkIimJx1gMjodFubqO6oAoC45kWTmLqFRVnvSNfrgx5+n1nNhIqt2y1Z1opy6bsfV7e+Br3C0NpwJIB9vMEBC6/XCTdIw+tdvI3XJbwlL5TQabHI2i6Shj7nK78yBHPsGrXrvhn0zEFExdZnPAuZVCQLmqn9UOk/Bt1hmemmY1g/Zs7a56Lfnod2KEAz9i3F1Hiwm3wVTRA/irJhSgx+ktMZIDkdBz9FHmsnh5ffH3qMUxlml0c979rHTT/u5Xew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMPfUrVyPf1pRktvVlNlNgY37bXHD54kvZbB1N3M2XM=;
 b=BCQPFwkX6cTn0rvi1e2QxaelTkCiIKAzNKvEu1ualq2Q8S6OQPo1WEuBiVRSE+m/uCn4xfBZOZTa0f680sdel3jPIijaL5eunVMDwNWI69tjc7me+zrA6uNn96fSzve6DEZPpaHCPifafj7z4Hc2ke6IdVzYwYlBCT7/1r1PamVsYSSKlhCmPzX9y3tGZiXxCqM+emKpPmP5O7Bqw/7/8zjnYRVl02TSnz/MnD3E7bjAqjcG5vQ0ynAukmC819stdbmtcY2r6zYKklNmmCVnA/8u1dFP1B/+XJNu8vEZ11KwKaKuPUiSNff47XNbb6cLtAcODSWwX01MAAXL+n+9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMPfUrVyPf1pRktvVlNlNgY37bXHD54kvZbB1N3M2XM=;
 b=EQF0bHkRY9ioMpgBKEmlVhBuH0WTTUTVxk0XDSlCKZS78espDJPf5/Jn1sJg5q2US2DCC/giREYLLqZUDM8KwM1dXDvL8EYFEiG04hPgnrd77sgXzZM1ZJ6ofj7XUE5T+O4kcTdG9IjtBl7YnmHt1QodzfUfICzmDHCGWg4eF0o=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10) by AMDPR08MB11484.eurprd08.prod.outlook.com
 (2603:10a6:20b:71a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Mon, 14 Sep
 2026 07:53:48 +0000
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04]) by GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04%4]) with mapi id 15.21.0428.004; Mon, 14 Sep 2026
 07:53:45 +0000
Message-ID: <32b15e37-4938-4af2-a880-273a3eee5164@arm.com>
Date: Mon, 14 Sep 2026 09:53:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add SMCCC cache clean/invalidate provider
To: Srirangan Madhavan <smadhavan@nvidia.com>, mark.rutland@arm.com,
 lpieralisi@kernel.org, sudeep.holla@kernel.org, conor@kernel.org,
 jic23@kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, treding@nvidia.com,
 jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260910082142.1522865-1-smadhavan@nvidia.com>
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence.csokas@arm.com>
In-Reply-To: <20260910082142.1522865-1-smadhavan@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0064.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35a::13) To GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10455:EE_|AMDPR08MB11484:EE_|DB5PEPF00014B9B:EE_|DU0PR08MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: cd7a0501-87ae-479d-8432-08df12356496
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|10070799003|23010399003|366016|1800799024|6133799003|10067099003|5023799004|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 Ny3k+uJmeQP634ySS9EHz9dU7esV9NHt8egoOdO4g6OEKeIrbU6mcTDxSLTSKmNSWTWT36CocxNxis9Qn+f9H6HTzf4gTk5PvPK4OFf2QNq4Sl9dZ7ddpo3pdU762uFZRsVLtQ9ja55OnLmw0k9m5Ktu03pLXvT/zdibu8W+SvCnh9vbzTwISPNUyHNPh9s2LqxHh/w3LyDKCybCsiX/Nv93+YdEX1hr8osDlwUOug6khs43uO+zsbXOUWOntHJsPtz+ys/M0froiJ0jcUTgM49nO2k3sfiIotoRDPZVWmuMgz5bUCBtrbeKIJOxUxyQzatBATZpNAn7pnjbvdP1YxnecuErS7ce7hFd6BYXrGBORm/P3NiBxMZG2akFVTH4KoPTET6y7c9Yu02d3QxNK75z3h1KWRJ+Tn8qlclpwqE9uFpVwrNNemvdtkW+3/9MdNOlgtbXSGhUARlTNoFkTPLvTAnJBPuOvF2+ADRkTkYyRpUbpbtvqkZWcCOouObh3KnWJ4od+RvRhMol/laAF4s1lPxooqawEVlMb+A9f5EiFnN6ExI44qDx0IDXA+M5gMIVq+sxpApbGrQ3ODdzZF8uTfpBd/XIXGH5vDsLw+EKx0skAXRP5+AqwXiKX/SsAPhqbmy1eszN/dQcvQk9g+ylThu9q0qzvCP2K/RyK+Y=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10455.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(5023799004)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 aD6hRivUhlKuVvUnJaQFoFdO9hFHrqHUwALF1bxwCFI4CLGc+CvW7uZZJ1zj4GI2425CH0EODfCDipx97RtdTqxpS5Z60W46rMUI2j+h6P4rUCUG/92wHPcsLCumzD8OcJp2xvujRP2FXY67bBNy2hEgRcWNLkToytyH2xjDhGgoUKLs8XM8obY3gqsfKvSy15lY44weJI9/F06krPb4QJCs2Bgo6ro1O+QmAGHrd6ikdeV7eSItZjiAP5vhjO52tgFrzgEq2W2TsU3kozKplWvXTOV1BIQtrxdMe0izfEoTefyAuy73kWgC++iLqPe0Mg3pLjsgH3u+3aVTj9h81w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11484
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	123e22ca-1e97-4f33-1ccb-08df12354d32
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|7416014|14060799003|36860700016|82310400026|1800799024|23010399003|376014|10067099003|56012099006|5023799004|11063799006|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	lOzf/E08DMT8O00liAKHRQDyCllO8hijxVVn4yhYrnUH8kA1rx1rtN+gjEHTDiD06GWRlkwPJRbhdk0M9Jdly50v9tVczArjhyGDzFObp2GtFdGkxFkSFoZ6mxOYrZM/6So9Ja5ZmgpEWk9Hw6IqOO+RmOPIslApiKQaFyWaeYEQnEGiEDzU7R+/jJLgOEimfk0ddbI1d41euCkil+kmX9dTkoR1tSxYvNP/XYOBDt6wlpQtSwtw8pLqtN8/Z9jWS1yABdwbCJSksjQKcfRS++zAEjS5D3ptmoQUdIg6ti5DG8OCApHT+LlNVohkJvahBkmgyfDW/Sp0QiB2hYOs6by73mUZy+/y/iWCrdLbk1Zo9cO+fVAK3jpkyMz38bpzplsOPeRtF6XdFUOswtsqTWd0Q/mJW6UPplephOFNe2K5BH9ZD/MgYcl+rV4twkF9fsbd5Ixmwj++80fAssuNpApItTxksrvdVtCOcnGvFcPlvPm7n1LF+3jaimIkunv440FzAaFEirjYOVy3YrZ8exzEA/B9XLho4YAWt6HIMy93tMzlu4UJnX7Y3CvXoahzQc2QoAjiYP497vRqldSQRTwQZo7NaAzKOvkOrH67Qiw3wOlwwa/ZveDl7Vd+J+apPvdiJKDPxChIF94bk8en4qFRJpM5U7gfMY7xlPZCCZNBjcLoMBdHDb88/MoVR83zUgm9qE5hoaZ/Ww7rXdL9dA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(7416014)(14060799003)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	czjPVp9lEeA6Xg2mH+L2MdKKhBsGEWgtdTyiz9/rm5zUUeGRy8gI/nGqHDQ6/598B1JYj2ieK+4h7vlzUKKt1xF46BEc/0hl0kdn27a3WbJlX8nAiVDCXEviOz/hw2Fte65rXJaBIM9yrUn+3yziVyDVIyOuv7rrnG6s5hL/2e90k0Z/5cXByLomFAjXLRn6nnU7JTusvFvs/gROZh6+HwtxMDMZQw5xqz9ZYzLU2Y44Sy4MRHA/dAJU8yOrD2mB0q6wPvPlrBv9TIm+KjVBv06AvpwaEiuFXY6+5s6iQ8gFt4d2jy4c28CqoNOhv4VVRD2acVbQ3095ixhHQORtrCMTOb64EHSu3naXH+T8lE0w+31WOn9VSH3j3PW27Uk7w2T6k54e2n7WKFG1NdIkeCi//YeRn+Cus2YpS+gUvC679m+4nlTx+qBpux+DWwpI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:54:23.9030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7a0501-87ae-479d-8432-08df12356496
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396

Hi,

On 2026. 09. 10. 10:21, Srirangan Madhavan wrote:
> Apologies for the delay in posting v3. We waited until the corresponding
> firmware support was available in TF-A. This allowed the provider to be
> tested end to end with the CXL Reset series [2].
> 
> This series adds an arm64 backend for memregion cache invalidation users
> based on the Arm SMCCC cache clean+invalidate interface.
> 
> Per DEN0028, this interface targets systems where a Normal Cacheable
> memory region can be modified in ways that are not handled by usual PE
> coherency mechanisms, and where VA-based CMOs may be too slow or
> insufficient for large ranges and/or system-cache implementations.
> 
> Representative use cases include device-backed memory state transitions
> where stale CPU/system cache lines must be invalidated reliably (for
> example secure erase, reset/offline flows, and dynamic memory
> reconfiguration).
> 
> Patch 1 introduces the Arm SMCCC cache clean/invalidate function IDs and
> transient return codes needed by callers [1].
> 
> Patch 2 adds a cache maintenance provider that:
> - discovers SMCCC support and attributes at init time
> - registers with the generic cache coherency framework used by
>    cpu_cache_invalidate_memregion()
> - handles transient BUSY/RATE_LIMITED responses with bounded retries
> 
> This patch set does not add a software fallback path; when firmware does
> not implement the SMCCC cache maintenance interface, the provider is not
> registered and existing behavior is preserved.
> 
> References:
> [1] https://developer.arm.com/documentation/den0028/h
> [2] https://lore.kernel.org/linux-cxl/20260902072804.665639-1-smadhavan@nvidia.com/
> 
> DEN0028 v1.7 has since been confirmed as stable.
> 
> Testing:
> - With corresponding TF-A support enabled, exercised the provider through
>    the CXL Reset path and verified that it invokes the SMCCC call and
>    completes the cache flush successfully.
> - ARM64 defconfig with CONFIG_CACHEMAINT_FOR_HOTPLUG=y and
>    CONFIG_ARM_SMCCC_CACHE=y
> - W=1 build of drivers/cache/arm_smccc_cache.o
> - W=1 build of the ARM64 Image
> 
> Changes since v2:
> - Rebased onto Linux v7.3-rc1.
> - Preserved the final BUSY or RATE_LIMITED error after retry exhaustion.
> - Dropped the redundant feature query for the mandatory ATTRIBUTES call.
> - Preserved the full 64-bit maximum-call-rate value returned in X3.
> - Reordered local declarations in reverse-fir-tree order.
> - Removed the routine provider registration message.

Reviewed-by: Bence Csókás <bence.csokas@arm.com>

I have yet to try it out on actual hardware, but from looking at the 
code, it now seems to match the spec.

> Changes since v1:
> - Added Jonathan Cameron's Reviewed-by tags.
> - Clarified the ARM_SMCCC_CACHE Kconfig help text.
> - Added a Makefile comment identifying the providers that depend on
>    CACHEMAINT_FOR_HOTPLUG.
> - Dropped the final-backoff-sleep skip in the retry loop.
> 
> Changes since RFC:
> - Dropped the RFC tag.
> - Moved the provider from arch/arm64/mm to drivers/cache.
> - Added a dedicated CONFIG_ARM_SMCCC_CACHE option under the existing
>    CACHEMAINT_FOR_HOTPLUG menu.
> - Dropped the global-operation coalescing optimization.
> - Dropped provider handling for SMCCC_RET_NOT_REQUIRED.
> - Removed the unnecessary global provider pointer.
> - Removed arm64_ prefixes from static provider-local names.
> - Documented why these SMCCC Arch cache maintenance calls use SMC64.
> - Anchored the SMCCC return-code comment to DEN0028 v1.7.
> - Used fsleep() for retry backoff.
> - Used unsigned long for retry delay values passed to fsleep().
> - Skipped the final backoff sleep when no retry remains.
> - Documented the bounded mutex hold time across the serialized retry
>    sequence.
> - Added mutex_destroy() on the registration failure path.
> 
> Srirangan Madhavan (2):
>    arm64: smccc: add cache clean/invalidate IDs and return codes
>    cache: add SMCCC-backed cache invalidate provider
> 
>   drivers/cache/Kconfig           |  11 +++
>   drivers/cache/Makefile          |   2 +
>   drivers/cache/arm_smccc_cache.c | 149 ++++++++++++++++++++++++++++++++
>   include/linux/arm-smccc.h       |  21 ++++-
>   tools/include/linux/arm-smccc.h |  21 ++++-
>   5 files changed, 200 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/cache/arm_smccc_cache.c
> 
> 
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935

Bence
