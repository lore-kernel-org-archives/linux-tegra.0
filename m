Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010051.outbound.protection.outlook.com [52.101.46.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E617B30C37B;
	Fri, 23 Jan 2026 13:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769176673; cv=fail; b=GCw3QHH9tFDVUGbG7qUVBz3k3YntPASnnBM5vAergh9wPYvKT3/ka4RriL0KIm5wRLPzxZrnUn3zy4BGZnQsQ1TZ4+r8Z9Jx1lLzZ+jtHg1skWp/3WnW7sivRHVUx9dxaK+XZI72yWFcz8kyzN9UiDEh8kQPXdG+FNTKpIorjzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769176673; c=relaxed/simple;
	bh=grxhDYxklkYoothaP8/XXrwNu1IN6dm7uYGJA4R52EM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F23pB6Tn1mcaOSIwfwifFucE3Iw8b4WblgcGd/fw5ozie1E0nK0OlVIWgmuIYQXYafLojOyvKxPcSwKNVUpVeidk73x3G0QYl3enQ8ryB9EbbioNZUVRFJSWQxuZJ3nmel9r4FceK1/xu8IqO0ECsZ1k8ItD1XMOqU83BtPggvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y2NcJKXW; arc=fail smtp.client-ip=52.101.46.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y2NcJKXW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ET9t9ZXPxj6X0doUiVutd/phSFMVqT5m7Xg+DxQSfPvGhohZkXL4C3KnAP7npKaDxFSbMja7cfi2CKnWmrfqAtAZ8FNIwPT+w7eNkXOuroebkOsJ11DZNDAHDlaRcV2srmx3+WK07F0uqR1PqbY8GHTnLPHkIBdpSSdDOidffifPeO7BS1EGpGGjFVGJifNjRXXbIAmvm9/f4j68/CZSakyKCJFv4FqkDtewX9BJ7aaRK4KZaMW+MEtHiCKZuJ4NsDJWsCeWCoYAP2LMkp8lpl2u4TGLykMbAJOWZvnPvT8LmJpee8IHqRnCheNp6KOziKBweTRtvDMhr5+92I2QNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LLkv1fMf8tWMhK2FjC+9B5cHZdi3HOyF34LlHIYRU4=;
 b=YU2JVl//zRkpH2qsxoUZZmRKuzgARxPZq5NrSF8rvEeKTfgr2wLhUUzW2A+S+ldFjrMIhJ8wi+G+3tOA6u4ly/UxqzeHwTmhpQD5sIdVzRYdr3DvJjz51aF7TF8LwxXYPANZfVm3iBqx0mTN8cdVNXITatnJKddw3a8mnrx3K4qjPOe+5xL+CA8d7M3tKx7fQpSXkxbrobRhgbUV8sqHVSWS/6+hrCS1TKpwmX7G5p+jfaqBpY0r92YiAeAlB6vZJh+xBcqFNIL+uV8XZMOC/62q/5vzTqvxHwqAyTIiPXFDW4BH0OobRILwbgAdt6bh72n1usT7RQMyhS1i4u9pYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LLkv1fMf8tWMhK2FjC+9B5cHZdi3HOyF34LlHIYRU4=;
 b=Y2NcJKXW+Yye0mckkECOdkNUMkUxGNWSVlhspyCVkOREfwWQcd1DCcyrw+ENarhHt5dokp1V+dPVlDk9YJ7mYpSk4OaO/5zaVihJRJBtPxDTopQbzg4wEqNdGEReB5pRiY+adX7uetNBqOTPXfl3l68QgXiGXuZJxl5MVqAF25XyTv4skC8MXHvIkBls4srjXX9lfOEhu5CcGvoURqzfkun77nlGZDdNp9sHeM9NIqcQU7tW42GbKNootWouU4ZOFIovSXm87rUNBg81i30/sqPU4catnaCG57UC1AtCTzhg+WzLDhkopWNn4XBa9VsA3uE+fYOAubYzU0llf1PCRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ0PR12MB6783.namprd12.prod.outlook.com (2603:10b6:a03:44e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Fri, 23 Jan
 2026 13:57:39 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 13:57:39 +0000
Message-ID: <2b7109c2-2275-4a38-a52f-f4f901a6d182@nvidia.com>
Date: Fri, 23 Jan 2026 13:57:34 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gui-Dong Han <hanguidong02@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown
 <broonie@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 Qiu-ji Chen <chenqiuji666@gmail.com>, Aishwarya.TCV@arm.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk>
 <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com>
 <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com>
 <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com>
 <DFULF717AOGG.GY8B9ET26KND@kernel.org>
 <f10007af-3629-4769-b89c-bbf4aa013bf3@nvidia.com>
 <CALbr=LaE=nS30uMmm_spywEHPYgC_w9qb9L1wFvwBe=PDae1Mw@mail.gmail.com>
 <DFVBKRQ35CC0.95P329BK5KZA@kernel.org>
 <956d5d23-6a62-4dba-9c98-83457526f9b6@nvidia.com>
 <DFVDC5NWTOT4.NA2H05V84CWD@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <DFVDC5NWTOT4.NA2H05V84CWD@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0082.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::15) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ0PR12MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: ee62cadb-d8e2-45b2-49e8-08de5a875ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1VNRmxEM05VMlE2SDNaMDM3cTY0OTByTW13T3k1RzliYkprdXcwaWsvaUVv?=
 =?utf-8?B?Y1U1N3RJUGViUm9meXVhQnVDajVLNTN6dGxTSWJKWTU3QVFJd0w1R0luRjhB?=
 =?utf-8?B?UmdvMkkvN3FxNWdyU0dHQkM0Y21TTUVBSWZRMGs1bjlhSnpzVnV1UXZjYXNV?=
 =?utf-8?B?MnpnaVMvZ3hSTHZETUsrM1RBck0vcWFNYlZSQkJ5VjNwOVFsMy9XcGJTODIx?=
 =?utf-8?B?SE9XUnkySXdBcmE0YXpxMkExOWlORnc2WjhieGpqZ05pR1Q4Q0Z6NTlZeGFn?=
 =?utf-8?B?VENkZjNFS3NCbEIrL2FHOG1QbjRoY21reFNhSjVxQWdDZFZsbVNTcEQ5RkJF?=
 =?utf-8?B?Tk85QVF2VzRsL3QwV3JaRmJtZk1Idk1nL2JPUlVndnNLV0Naay8rYWZ2Z0hU?=
 =?utf-8?B?M1VjbUNhdDVsY1k3ZDAxK1plVjBmWk54SUMyL3VnSm1HNVdTRU1jdEpLL2Jj?=
 =?utf-8?B?aGN6Y0I4UDVmV1F4TmJhRTdUTTRSWXhuNGl3SE5xOEZqcjZsbjJ5Mm92Rmhq?=
 =?utf-8?B?QTA2R0ZaL25LbVp1V3ZDM0RFUEY3ZVJQWW9kTTdMZi94TVdIM1A0aXpwKy83?=
 =?utf-8?B?UGVuQzY2RnA2d0JBUFRTbldva0hHdHNTdTZSdjEvMndkWXlDeGNPckhUcmtB?=
 =?utf-8?B?QWo0TC9TMHg0eFF4T3lwRzJnS0NYNzRub3NEb29BdnowVmxyVTZBeW01R0l6?=
 =?utf-8?B?YUdZNmhGTEgvTUcxUnJjcmFaWDRMbjhLaW1CZmhmY3dyc1Y1VXE5ZWZlRFJ3?=
 =?utf-8?B?M1ZJcC9XK0tJeDU1dE5IOHlkUFViUzJrMlliT2N2S25uSThxekdKVG9OWnBi?=
 =?utf-8?B?a2tvK01Dd004SDY3UWhsZzd0OWVzL2E1SGdkVjd1SS85cnRWOEs0eHdkTEFS?=
 =?utf-8?B?c3ZBaVFpckNTeTNyOVQzc3MxMEF0Sm1qaXhqOTA5bzRYWUpjV3RuWGkySEx5?=
 =?utf-8?B?NFoybXowcXBOS00yNkxMd3lLSFJiOUJKVjFMaTIzampPeUlLMzZlRUhOVTJ6?=
 =?utf-8?B?emhjalplR2J4M3RnZ1UyOE4zOVk4aE9uQUczelJ2Wm1wcU85WE1xWm01bmVk?=
 =?utf-8?B?c3JQcHZuQTVsQ1phMlVab2tlSzJCME8vQVJ6cGgzckk2a3FjbXljYXJ4Q3By?=
 =?utf-8?B?NXFaV2QzVUN0aXJ1cDNpdjdPcWZqeGNuVnFxRFRLNW1xZlUxSUtNOW1MTkZl?=
 =?utf-8?B?ZmpzWGQyb0dDdGc4QXArWDhYd0dBMExldjlDSUtJeHdkMHVaTjhQbEd5Ylor?=
 =?utf-8?B?N0ZydFFHU0lESWJvaHlzSXRJcDcwQ3BUUWxZdUdnR3k0OTY2K0NxWnk0MUU3?=
 =?utf-8?B?bytvUkUwaHpONkM4N2tlTFZsYXF1MVdXNXRrSTRneVBlQW1pN3JSd0U1Z2hZ?=
 =?utf-8?B?UzhLYWRZZ2l5OUdZVWRycG9ZbGU1WjhzQXg3NkNXcEtiMGRIWm9qejJxWlU5?=
 =?utf-8?B?SGRDbldWSjZEZW1HMWI2dXBuMWNvYTZTNS9COWhiaFY3OUhPWThiOGowSzBR?=
 =?utf-8?B?UWQrZUxQam5XaFI5U3R0bk9lbkI5Y2FaWEZ1Y1dOTEx0R01LMlFXYy81Vzdt?=
 =?utf-8?B?eUtwQkxYMTkrNVZsODlxRFZudWtiTnpxeXd2d0k3WkJiaVhLZyt5Qmh4VFox?=
 =?utf-8?B?RXJSZ25zTFZzT1dvNSswZHEzWUpJVTVhWk5iT0hHbXRqdEpTYWFhOGFrTmU2?=
 =?utf-8?B?QnI4bnlTdXpEbnJ3RitwemdTZUxFMGsxenFwWEF2NFFpQ1VlYVdmODlaK1dQ?=
 =?utf-8?B?SitOdThzYUNoMVpXWHkvSjJEbDdWRnE2WkNWZ3pMbXB0Qi9XOU9IQUJKTVdZ?=
 =?utf-8?B?bkhPell0ZVdCSSt4ejZEd0FIVmlpMDVjL1Y4a091Mm5qQkZuazdDcS9sdTV0?=
 =?utf-8?B?Y1JadHo5KzB0M0MveTY0cEhvc3JQTTlJYjJGbDlEWjJldndNdlJFaDN0RTZZ?=
 =?utf-8?B?K3BMWnY2bUFvN0RwOWEyQitFNmo5b2FKOHVhcGkrYS9GaFhJemVLeDZWVTdC?=
 =?utf-8?B?RmNmdWlxWDJyRWhYVDg0Rll6YWlPaCtTN3AyMThsVjFaemd4c0lXbEhCUU1v?=
 =?utf-8?B?TXY5UE12by9jZHEwbkNJUnRUY0czNWZBNG9BVStmRVBEbklrN212dWJWQjJ4?=
 =?utf-8?Q?ckshNCnzBUFB0f4n5J6VvBfPc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzNXMk1oMUg2U2k4SkFCRXBCNGltZlJGazAySU5uSkROZXdLOThFTUNZdDA2?=
 =?utf-8?B?ZWp0bi9qOHR4eTd2N3ZxZ3hYV1YrWEZ2MnhGRG5CMDlaY1hiOGkxM204QU84?=
 =?utf-8?B?bk9oTG1acElkaFFVOEUrVlRGc21FQWNRQXlJWW9ibk1MYXBVZE5DZmlSTmF1?=
 =?utf-8?B?T3lqUU5DNkhMRGk0bVBWS0lMNURkVkRySm1qVnFlNnNVMlYxZm5nNEREMUlo?=
 =?utf-8?B?N3luNE9YbG1HeFZFNUorVFd0KzF0RklGSEpaUTZOK1BaK0V1emFnejE1cFNk?=
 =?utf-8?B?OFcrRXhOcjl1cGlubmo0ZDAwcHFxUmxDRWEzVUVQdVBwRGE3UU5laGJiSm1J?=
 =?utf-8?B?U3FWRnNYSzRJcy81czNHNFpybS8xdVh1aFNmaFlmd0M1b2V2RWdDNE84Q0xl?=
 =?utf-8?B?aFZQUUkyN3JaYkN3YmdJeEFuU29hdmJwcEtxTWNqWkxMeFNGMTcwMU9JdkxV?=
 =?utf-8?B?aWxTOXl0WTRVZmMvSUpieldGUzFoQUNnUjdQNWdhT2xWNUF3S1RiQnMzNE1K?=
 =?utf-8?B?d3ZpbG9BSHppa1ZVZnJWQUx0UnF4OEU4aHJDS2ZKRzRHSXhIWVFxaGxuWHNy?=
 =?utf-8?B?WjJvN2QzdmppM2RUWGZWbVczeEpKdkx5c2Rja2lEMWNIaVhlcUxUTzlIMktJ?=
 =?utf-8?B?M0RSTTVpMVNnRkg0M3JFZFhFZmpXclNlc3F4NEo3WXE4bFowRHYzYjh2UC8v?=
 =?utf-8?B?dkZJekRDSXpSbTRBeDNuWVljSjFwZVRiakprNVZSQzg2M3lEbUVXbDJkb1p2?=
 =?utf-8?B?eVJHaUNuTm11RHAwcm5TNnczeXo0NkdPWHJsVVBDcDN4aEVwTDN2SE55VExP?=
 =?utf-8?B?R2pRcDYzTlZ3YjhabFp4NWVGcnBEUGZ2a1Z0Q3lSa3NEMjJ2YnFyVUhpeXZp?=
 =?utf-8?B?Slh3eTJvR0EzSlc2MDlzbHlrNkFFU2RWTU1oQzNtQzF4eTdhV2RTM1dPMkth?=
 =?utf-8?B?TCtKME1CcGlPRTByQUk1RUw5OUlubndEaGFrWEF2WStZMWQ1TExDYTdEQXEv?=
 =?utf-8?B?ajQxT1NVeGlsZ2R2M241MWgzNktiNUFFS0c3MFhXYTZCV1FveFREQ0FHN1ZX?=
 =?utf-8?B?STdtdVN5eHV6ZERlUUhkK05JNzJKMHJyR0k4UTlBWm1oelB0YkVVcFhXMTU5?=
 =?utf-8?B?NmhYTFVKOUF3NlUrRmwxU0VmcGMxU01IK09FcC9iNCs4V2NxYmNhek1aUklv?=
 =?utf-8?B?YkFRcEc3WTRyZ2lBTGFRTnFTYldBYXp6SzFaa0g4MWo2RW1MYjdlS01lYzNp?=
 =?utf-8?B?MHFxNlBqb0g2bTAreXJacG94a3lDRzRVWHVJM3hiakdUVjdMQmFqdm91Rkhq?=
 =?utf-8?B?WGNGY0lLTW5kemkwak9wV0ZXaWRFWTkrSmhjbnZwb1NCditDVWJrcXRFUHJU?=
 =?utf-8?B?NGZsUHZSTmRuU0NYOFgxaHVFa25kMmV6djhGaUZQemwyc0dFa3pjZ09EMDZJ?=
 =?utf-8?B?V2cwc3h6bFhlNGRybVEvYitsTVVJa2hCQ1J5YklHVmpFVTNmaXRZbTQybmpO?=
 =?utf-8?B?d3VMMkxrVXR3ZWhUbjArb3dqb2FTOFV6cU1QeWtDZnZlVW5xbU9teVVpZUE0?=
 =?utf-8?B?ZDltRU1OZDB1TUdkNU1ST3VpSUl5RFhYMTNSL3Mra0ZSa0M0L3M3SG5DYlQr?=
 =?utf-8?B?cnNnMVRmRDNZaC9IcEQrL1ladTdVZ3RFekNFWTJDblJWZW1pYUpnaWtyNGw3?=
 =?utf-8?B?MXJwVGEwY2F5UEgwUFF1MzRHR21TR3BsMFZSaUZPRlJBSm5NbmthUUZQRUtG?=
 =?utf-8?B?RnJxWGFsU2J5dEZFczFKdGdSK3djRFhDSEtEYXJ6RitmUERmMExnbXBXS2wx?=
 =?utf-8?B?bVcvRFBldDV1WE1qNDROYWluTFdzc05UNG9JYUdkVlk0TWdDVnBNMnp4b1h1?=
 =?utf-8?B?ZFhHYlJ4eFR6R1hNNGpMZjBualBWMEQ4YldpV1ZncjZsM2JCTmZTTmRPZytq?=
 =?utf-8?B?RU5HdStZSGZsRFQ2b3lyVnBVUVVOOWlQemV5OHpySnU2bkpsWHBlUGN4RHMy?=
 =?utf-8?B?SnpjQkZudWJaUzlhbHVvWDFrcDFvcFlHTjZFYWF4WlRTT2kveVAzSE44Q29t?=
 =?utf-8?B?a3J3NTNYRTFpcTk1RC9sSmJuQjBLSEN5ZHFDZ1FjVnJoSFJ3dWI0ZkNaM3pJ?=
 =?utf-8?B?WlRNRERFWDdGNE5rRERnYkhHa042b1dNRVJrRFZrRUQvd3ZtbHFoUUo5d3Fl?=
 =?utf-8?B?YXZZR0pPaWltRy9TWVhGVmkzNTJmeG0raFlqVEpIQWtwU3IrWVhBbEwwTjBB?=
 =?utf-8?B?UzFzQi90VHp1dnBnTVBJMnQrd1RUTXBjVk1SUWtaUzlOSEY2RnVuSnZEUllx?=
 =?utf-8?B?L2h4K2k5dWF5MlpOUmtWcXRmeGdzRTBQM1dmV2I1a0RXT0dpMlpCTHVhd1By?=
 =?utf-8?Q?77BCxeOn+v1lmU7j0c8NsiNEFTTAl0+TBsGgESMAs4aHQ?=
X-MS-Exchange-AntiSpam-MessageData-1: GoZEd8Wqb1XH5A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee62cadb-d8e2-45b2-49e8-08de5a875ed2
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 13:57:39.3118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Lr8sAJChhOAnAFGS6sb6gKy+2+MPPdPr3HqDJqaDiSGhjku/Bn0s7oS1JC0qsoMP9BdAY6RXN+XyI8cQc5EAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6783


On 22/01/2026 19:35, Danilo Krummrich wrote:
> On Thu Jan 22, 2026 at 7:58 PM CET, Jon Hunter wrote:
>> On 22/01/2026 18:12, Danilo Krummrich wrote:
>>> With this diff, if I intentionally create a deadlock condition on my machine, I
>>> do see a lockdep splat as expected.
>>>
>>> Anyways, another option would be to attach a hardware debugger (I assume you
>>> have TRACE32 or something available?) and then get a backtrace from the CPU
>>> affected of the deadlock.
>>
>> Unfortunately, these days I don't have such tools available so that's
>> not an option.
> 
> Hm..slowly running out of options. :)

No worries. There appears to be a couple issues going on with this 
board. With the patch reverted the board boots fine and tests pass. Even 
in the passing case with this patch reverted, during boot I see a NULL 
pointer deference crash log from the QSPI driver. So I disabled the QSPI 
device in device-tree and with this patch the board boots fine and tests 
pass.

There is a on-going thread for the QSPI driver to fix these NULL pointer 
deference crashes [0]. So the QSPI driver seems to be the root of the 
problem.

Cheers
Jon

[0] https://lore.kernel.org/linux-tegra/aXJWRUhAe8F67-zG@gmail.com/T/#t

-- 
nvpublic

