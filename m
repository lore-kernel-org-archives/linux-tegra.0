Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E710230D1E;
	Fri,  2 May 2025 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184032; cv=fail; b=k4VMdoJRh2KhiJpmlf7YlRf4fuRq4OYVvWetwn4EA/NR10LmRVuANGHpIe1WnrK0zOMtGhUGAfkAZdgWMRUaogvCLC4uY+Nv8sGVsjOw6zO8aD/CnbGdBnwRf0Cp/lJXLcYQg0pEQ53KkvDhga2NUkhVRvbMZciuVBJL6iupQm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184032; c=relaxed/simple;
	bh=ucHpjUqo7LJAPk3mIltINGTGy0T+ZcWvVorek2lp/So=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UkzJSILdL/U/6vlAnPSgab27odUIv4VG7W17cuUTyJjgN5DvERKqcDtO1CLZBPZOgjCcsv/fHI7B7AJOqYfMc9Ejwf2M4kts3QIADRIju8/p+dWejxuV1EOIuLHjtT1TtbAh+B7ZY2MyQLm+4pAtDQ6izNYp1xtyvpgAni8efgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V+tFsC9t; arc=fail smtp.client-ip=40.107.237.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V+tFsC9t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5ELMah8uY+Pyz4sOYV3yB4WRKYaIreKhjJuaiz4eR4gc4kv26nZ/eeTW6di6i4ZOURkG63v5/988EujXyYY7ypilV5nAuoKTTXGzCVUo7+0DKO7BLoiNeGxLnT58dgeFYQxzdHGqBlV3EouNTnxACaMVKv8f0UYeVssYUQZ9MtnJRaTrZy2DZ+kER7VHly2roUKe+yRMDbmPjTMZt0RXEjD0eUe2ifgGy2ewIe4O4q8l7g1AFSlOwPUWpuWzSQd36FVu1/8KwO7ggUlP2yPFhAXRAHgDSfv2hQ8o6Ss/XTuyTDHXFIAcAPR//IQXFUbRoRDzle8P73Y6ze58vk51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TITmB9Wb3V9u/7FY2w3jkRrOR0gN15vx1hyEpr9ysds=;
 b=iUNEygwJ2tY8Mt36bT3E5X3ejv8KyqUJl3ha4lGd9i1u1KVZFPe30ABS2COjbRSngxUZKMqHd7QPV093s8OylVc++nR1MLF6Ues/J25hOjzZl0LQzapqJ2XWuIflENk76EhNjCeCSZvA8Tab1aVoN1tutrFgbcXmlGbwM3k9OL3in6zYYukHqMmJrUo+8KFiXnST05i766V9aHcCzzKZuwwT0wgMFNbAl1Q9odMHILDMRJkK+rbBHHdnikZpYuG6ve0gqHzTOXOCxTh/wVf15TurDGJsOZ7NufuUQFReyqTc0naUq9CnxoHerpiB2x/5JZdnK0L+OyM2wHLJJELgEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TITmB9Wb3V9u/7FY2w3jkRrOR0gN15vx1hyEpr9ysds=;
 b=V+tFsC9tbdtYGLfi0BTRIaV3j5dG8fX1Mo/Rl45BYQGNzPJUgd5OQNOA2MKwkODKCyZW4wb/fQKu++O8igpzl9GfVauyhBO4w2Xzhf8fj35Q1gCCY8lArZ7N3VXnLvFZ/tF7qMf0xvaJPeyuXmK16UFg425cvhWSvI5V13tTs/BuLBoq63S3rWzIMGw5wrQfOek8uUYczqSrSqh6vMCbUXg+9SnKd23JZvatUK0Y3djF2spKF1zetKEpn506yZYqe8hPSam9fgRr06ZFcvoHBhz0ZrshSK5l7l/og7yD2RgpNUSU45QGwVnjeWcErFRiieVs59JMa0c46npd+9teIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by BN3PR12MB9593.namprd12.prod.outlook.com (2603:10b6:408:2cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 2 May
 2025 11:07:06 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 11:07:05 +0000
Message-ID: <5824d505-0a42-40cc-84ec-814f0bbfb79f@nvidia.com>
Date: Fri, 2 May 2025 12:06:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Robert Lin <robelin@nvidia.com>, thierry.reding@gmail.com,
 tglx@linutronix.de, pohsuns@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, sumitg@nvidia.com
References: <20250502043727.396896-1-robelin@nvidia.com>
 <20250502043727.396896-2-robelin@nvidia.com>
 <aBSOJTlQUUnFIEVr@mai.linaro.org>
 <af0e0ab4-89d5-4f77-86c7-90d2bc3e13dd@nvidia.com>
 <aBSjyZJ0__ctBa-4@mai.linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <aBSjyZJ0__ctBa-4@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0325.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::6) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|BN3PR12MB9593:EE_
X-MS-Office365-Filtering-Correlation-Id: 0065bb45-ebf9-4e36-33a3-08dd8969794e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGJjcTFWRy9xMThlaXZvYlpPbzFyYUtqWDZqZDBhZ01YV2p1Ui80SW5QT2ZK?=
 =?utf-8?B?SmNhdk95dTVvOHpQMEVCalN1dUlibFc0THBFaHRQd09EOE1haVR0TENlN3hU?=
 =?utf-8?B?YUxrSUdBV2ZjWXp6dG1UTVBiTEFteklhVnYvYXNuZXBRVEVnVVpKUWRzMVln?=
 =?utf-8?B?K2Y2cTFVUEc5QWNCejlKUkhiekR3dHE3SVB1Q21Sb2xmWUg0cUxibi9vdVhs?=
 =?utf-8?B?SlN3VkhyZFZDNEU1RCtDdkdDQjduUmd1VlNTczNaQUtlZE1rMEpLYkZKM3Vm?=
 =?utf-8?B?L3ZLZ0JDTElodlQ1Z1d1ZzEwcGdjOEV5Z0FJOVlxNGcwaERsTlFpSVRzcDM3?=
 =?utf-8?B?RHdvc3h1aG5PS1RmQlpOTlJBYXh6Z1g3RlVJUG4wL3hXclhoMTZPUWpyVnp2?=
 =?utf-8?B?Q0g1WG50c2NUUmFKSFFnRzNsSmpSSnpTZnBYeEhzNFFjYnRRUFptb09vdkIv?=
 =?utf-8?B?OGNpN1ZEdnpvRUVoWlc2Yk5zczRQMUN1WlFYVWlYRXM0N1JkemZxcjZteHNv?=
 =?utf-8?B?K2tnb0RsNy9XVGhZSW9LajlGZXFJUFl5TFBWbENsMUVONG5vODQyWEVwUHZI?=
 =?utf-8?B?MkQyY2tWOW85WnN5bEo4cFluSjV5YXBLdnVpZnA3MWZNRGRYUnRJNXlrN0VI?=
 =?utf-8?B?ZmxKNlRIQldVVTR0L2RDdjJLamVUbk9DVStYL21zbzlsVjMyQnpVMW51U051?=
 =?utf-8?B?bmtTazFCNEhXWkYxMEhmaFFLbnZVM2h3cEFwRmdVdjNLd3h6VkpXdTArTWNV?=
 =?utf-8?B?cjI4b3Vtc1VWelQ1ckwzMWkzYUtiNFJqMjNDcVhhYndSTG04a1BVa1FZRVFR?=
 =?utf-8?B?MzA5bzBjYXVrNUp2Rm5HWlhwRnVDQUN0WU9DNzFJclF4WXdxc2hIWDhlV3BC?=
 =?utf-8?B?R0VDeG1wYU1JSHFLc1V3RElTNk5xeVM5QUJGWmlkN3ZEUmc4cjhLUkFWS1hn?=
 =?utf-8?B?Tm1kM0FnREM3V2M5NmsrL2tuZlFySk4wRFY0MzZxdTJ0em9wN2VTODdJaVYv?=
 =?utf-8?B?dVBBYzZSUmx4dmhaeVpONmZnQy9ZMmpvY1haSHVtQk1pK0lMZU1xWWNaeHhh?=
 =?utf-8?B?OTVQSmx1VFA2UzZtT1lJb0JtQnROZVoySzY5L3lzSWpSTkdIYU1GOEF4dHE3?=
 =?utf-8?B?U2IwMFVFWFZBZ1VLVDVOeS9QUk5LZXBxQUNra1NRNGxKUUFnTzlOTzFjUGxU?=
 =?utf-8?B?dWJXdGpKRVRuV1d1eGRiMHE5VGRidmZIUlF3elM3ajJvcjZhU3BVR1E0bGNP?=
 =?utf-8?B?OVRVVjZyOHZHbnYzcDBwaHV3a3lkVG1QaFJ0RzRWMkdSTDg3NjVNK2c1M0lM?=
 =?utf-8?B?RW10cEFYdmUwWlFJQnNPRHQ3bXFneERpdS84QzBGV2lkTmtCMGNGK3NndXBK?=
 =?utf-8?B?OVk0cWQyR0w1QlBGcWNJNTMxZDZLZ3ZLSDNyOG1LVUFEelB6bFFORWlHMVVn?=
 =?utf-8?B?UWtuRGIrWE5EVmVvZFR3dFR0ZHRYSXo0SjBWRVJCMDB2MGQzdWdlcGtxTXFI?=
 =?utf-8?B?azV6aVp1RGlQSWk0M25Na2ZzMXZuWE9kTm1DMWFsb3h3Q3FKNTdqTi9mdU1J?=
 =?utf-8?B?UjZyOGFadExUUjFHSjk5Q0Y5L1VXWHdMR0RTeXNtOS9QNXVKQy80eWhoUTVI?=
 =?utf-8?B?SGtqYVc1UnIyZjN0LzBTeUk4cmtsYkdiTW11Q25qSjdRQ1laUmJzRlNVUlZq?=
 =?utf-8?B?cEY4QzRJaTdZWWNiZTluR1d5QXB5bnB1R3RKN1JyVUFmcXJSQmNYNC9nM2hX?=
 =?utf-8?B?VmtudUFkQWx4ZGhheEJoQkN6RHF0MlBpUnlTZHQrNlpLQzNhdVhxVEM5azhQ?=
 =?utf-8?B?SVVvd2ZzTDNuTHgvVTZqSE5BMmRHYkNvMGNwT3Z0aUVnaFMrTmQ2NHFZT1hs?=
 =?utf-8?B?MmF3eXJJM1c0U1lWVU9NdmUzUTF4djdXeEJZRkRjMVBiMERTNmt0Sm4wYXNr?=
 =?utf-8?Q?3duxU/ak2Rw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXBpSkpadVdZSHVPZXRUNXFMZEcyOXhEWjZUSFRPS091Z1JDb0MrMUNqR2NB?=
 =?utf-8?B?eDVuS0lZbjM1MUllSjR2d3g1TWw5dk14akNjS3Q5Q0FYV1ZVSEduNERzbHFy?=
 =?utf-8?B?OUE2eVZoZ2tOdWFDZWxidTFQT29BTlE1RDJLK1RHcy95VWhvSzJraHJFcVV2?=
 =?utf-8?B?K1AwYlJUVWp0OUJRQUdhelBCdi9jdmdGVWtTNEdTeDVob3ZtTFpKZ1ZsM0hU?=
 =?utf-8?B?TGdsbzcvUGVMNGh6VXVXU2ZqS21hOWdJYXFITWFhNUNEZ0R6bDFEMkdMRmFS?=
 =?utf-8?B?d3RyMThXTDdtWlVFNDJCSks2cklxQzNhR01nYys3bGZQaCtiZnZxaGlSYXNh?=
 =?utf-8?B?OE9wOGYwQ3VmTVNLYTNUUHMvRDd6ZDhCaEN6M2lkaG1YTElacGN5ZURXZHVr?=
 =?utf-8?B?aTVIbEc0S0ZRNFBGY3I1LzVoMWR0dFM2WHZzcThNRkRqamZPMUl3Y2JYa2RT?=
 =?utf-8?B?UktsSDdYdTVKUnNJemF0U1dGYzJVVVpCN2wwbEZuNnlEb3JLT2FSQWVlLzhh?=
 =?utf-8?B?ZHdTN05jYmU1RlhYRzBmT0lDTklFVk9qbjN0K1BMVHFPLzBlZjRDT0lMMUtp?=
 =?utf-8?B?OHRqdjJDTUtBUFFzRzlMSXEzQjcwMTRUV1grL3dKYVJ1c2c0Qm9VQUtrck9F?=
 =?utf-8?B?MGNzUStqaG9xSyt6SmRrRHJ1VWNyc1hGYW5YOEZnN2hJS3d0MTZIMUFsWUU3?=
 =?utf-8?B?RWU2MUtGancxdjAydVVUUi90WlNzQ1F3WEIyWWtHTFNseksrMGNBbFo2NkFz?=
 =?utf-8?B?eEo4c05CR2tEckQrNWh1d3dEczN3NUVyd291MEFIYUl2OVVFUmwzMTVSRTcw?=
 =?utf-8?B?NnRsdmJLTkdHV1FGWWx4ZWsyZ1FzeThQeEp3b2Z0THZ3ajFoMUlzaHhKU2t1?=
 =?utf-8?B?QXVWbkRkbU1UTGkxUlpTcjg4T3hEZ045OU5wVFJGZXg0QXBERlVnQno4QjJj?=
 =?utf-8?B?clRsV2ZmVVJkK21HTml0Rm80SEdTTE9qM1ZiZWV0dDNlZzhCY1Jrb1V1R09X?=
 =?utf-8?B?b24wcWNCazhWMlFJblptVEFiYWp1WTIwdEt6WGNzV2pCMXQ3TllHRUFhZkk2?=
 =?utf-8?B?WXp5RXpPaEFxY1RmUEg2d04zcEh2dkNLSmhSK3ovR0p5cGsxLzlRUmRLOXZR?=
 =?utf-8?B?YWZCM2oyamlhTUowV3ZxYnA5RTR4SmM3UTdmMXl5UDF2RU1aQ09mSlliY3U2?=
 =?utf-8?B?QmREZi9WVFMwNHA3cFdvQWp1eG5abHc4MnhEaTM1K3dRdmpyQnEzSFRxMER4?=
 =?utf-8?B?S3dWNU1vUXUxWkJPcWh6ZE9CMkdDZTR3OVRpSGtNMWxiSk12MjZtc1B2ZnBr?=
 =?utf-8?B?Z3JQejhUQUszbmo3SmI5OGRqc0M5R2t0OTJBN1NLWkdiZnhaY0R5cGUwSVpM?=
 =?utf-8?B?dm9uaGFUNXAva1FnVFo5cWJDOVF4M1JwSkt3aDB4ODBrRFpacXBtLzdwNFdU?=
 =?utf-8?B?anZQa2t6NmVFTTdKRThzSEJCOXVVVHhDeHQ3TlRGTzlTMnBycFJGWE54MVlp?=
 =?utf-8?B?WkgyVll3Y2hZcko0YU1DM0NNSW94Y2FhTDFnOTFVZUM4aDgwcHo2d2ozUCtz?=
 =?utf-8?B?WkVOdTZPZk9pZW9mdzVVcVdET044U09pRDBCbzFraW1OYlgwcTh0TUU0TCtU?=
 =?utf-8?B?OHVtYzg4VTd5RHlXMFltR0x2dUxOZHdadFhZMTJhcmRKdnREK2ZHdDBCN3lG?=
 =?utf-8?B?NnQxcnRmM01xdHc2VHRCbEh2TVJWNTU2ZUZ4amJWM2kvdllsVDV6SysyUE1K?=
 =?utf-8?B?V09NdXdtU04zSkNWZFR5WitwZUNYZitHa2M5TUFEMDFxMmdPZEVtdW1mZ1Ro?=
 =?utf-8?B?Z3Bac1VkYVo4R2dKblF4U2FMQ3F4SjgzQzJMVDFIK1gwcURDazNFbEZPU04w?=
 =?utf-8?B?VVp2YmdZZEpLY09VSzZlYUY0NnZCRkoxckJaMUNEVEREY1JGdXVCMXlxTEpl?=
 =?utf-8?B?M1dxdEhHNDAxUnkrT0V5OE9wUkNXQWo1S3ZJSEM2U2JNdzF4eHpxZHJSMTBB?=
 =?utf-8?B?MFdWbFNDNXhmd2tEQTJSZEZvUkl4SVNLa2I4RmRFeTRQaWFBTFRZZ29UN0Rw?=
 =?utf-8?B?UW12MEpXMW1PMnU5THplbjRuSWNseVl3c2JudWJ0T1NjcHpMRTNqbFkzL2N1?=
 =?utf-8?Q?GessGbYZeSNS34NXMzMbPXQPE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0065bb45-ebf9-4e36-33a3-08dd8969794e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 11:07:05.9124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0C9Gz+Z06J8xJyU95rKjnVb6EEAdwZOAU/jD0Wi6bdsqeA5CaQsLXhgAfpqCunVV2evVPSmyHIZSGp/Nnfmlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9593



On 02/05/2025 11:51, Daniel Lezcano wrote:
> On Fri, May 02, 2025 at 11:16:17AM +0100, Jon Hunter wrote:
>>
>>
>> On 02/05/2025 10:19, Daniel Lezcano wrote:
>>> On Fri, May 02, 2025 at 12:37:25PM +0800, Robert Lin wrote:
>>>> From: Pohsun Su <pohsuns@nvidia.com>
>>>>
>>>> This change adds support for WDIOC_GETTIMELEFT so userspace
>>>> programs can get the number of seconds before system reset by
>>>> the watchdog timer via ioctl.
>>>>
>>>> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
>>>> Signed-off-by: Robert Lin <robelin@nvidia.com>
>>>> ---
>>>>    drivers/clocksource/timer-tegra186.c | 64 +++++++++++++++++++++++++++-
>>>>    1 file changed, 63 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
>>>> index ea742889ee06..8d5698770cbd 100644
>>>> --- a/drivers/clocksource/timer-tegra186.c
>>>> +++ b/drivers/clocksource/timer-tegra186.c
>>>> @@ -1,8 +1,9 @@
>>>>    // SPDX-License-Identifier: GPL-2.0-only
>>>>    /*
>>>> - * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
>>>> + * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
>>>>     */
>>>> +#include <linux/bitfield.h>
>>>>    #include <linux/clocksource.h>
>>>>    #include <linux/module.h>
>>>>    #include <linux/interrupt.h>
>>>> @@ -30,6 +31,7 @@
>>>>    #define TMRSR 0x004
>>>>    #define  TMRSR_INTR_CLR BIT(30)
>>>> +#define  TMRSR_PCV GENMASK(28, 0)
>>>>    #define TMRCSSR 0x008
>>>>    #define  TMRCSSR_SRC_USEC (0 << 0)
>>>> @@ -46,6 +48,9 @@
>>>>    #define  WDTCR_TIMER_SOURCE_MASK 0xf
>>>>    #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
>>>> +#define WDTSR 0x004
>>>> +#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
>>>> +
>>>>    #define WDTCMDR 0x008
>>>>    #define  WDTCMDR_DISABLE_COUNTER BIT(1)
>>>>    #define  WDTCMDR_START_COUNTER BIT(0)
>>>> @@ -235,12 +240,69 @@ static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
>>>>    	return 0;
>>>>    }
>>>> +static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
>>>> +{
>>>> +	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
>>>> +	u32 expiration, val;
>>>> +	u64 timeleft;
>>>> +
>>>> +	if (!watchdog_active(&wdt->base)) {
>>>> +		/* return zero if the watchdog timer is not activated. */
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * Reset occurs on the fifth expiration of the
>>>> +	 * watchdog timer and so when the watchdog timer is configured,
>>>> +	 * the actual value programmed into the counter is 1/5 of the
>>>> +	 * timeout value. Once the counter reaches 0, expiration count
>>>> +	 * will be increased by 1 and the down counter restarts.
>>>> +	 * Hence to get the time left before system reset we must
>>>> +	 * combine 2 parts:
>>>> +	 * 1. value of the current down counter
>>>> +	 * 2. (number of counter expirations remaining) * (timeout/5)
>>>> +	 */
>>>> +
>>>> +	/* Get the current number of counter expirations. Should be a
>>>> +	 * value between 0 and 4
>>>> +	 */
>>>> +	val = readl_relaxed(wdt->regs + WDTSR);
>>>> +	expiration = FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
>>>> +	if (WARN_ON(expiration > 4))
>>>> +		return 0;
>>>
>>> Each call will generate a big warning in the message. May be simpler
>>> to add a pr_err() with an explicit message.
>>
>> I prefer the WARN. This should never happen. If we do change this, then
>> dev_WARN() might be more appropriate, but I think that this is fine too.
> 
> The function tegra186_wdt_get_timeleft() is triggered from userspace
> via an ioctl or sysfs. The documentation process/coding-style.rst says:
> 
> """
> Do not WARN lightly
> *******************
> 
> WARN*() is intended for unexpected, this-should-never-happen situations.
> WARN*() macros are not to be used for anything that is expected to happen
> during normal operation. These are not pre- or post-condition asserts, for
> example. Again: WARN*() must not be used for a condition that is expected
> to trigger easily, for example, by user space actions. pr_warn_once() is a
> possible alternative, if you need to notify the user of a problem.
> """
> 
> I understand it is important to check the return value in order to
> have a consistent result when computing the remaining time but that
> should not trigger a warning each time.

Yes so WARN sounds appropriate. It should never happen. I don't see the 
issue.

>>>> +	/*
>>>> +	 * Convert the current counter value to seconds,
>>>> +	 * rounding up to the nearest second. Cast u64 to
>>>> +	 * u32 under the assumption that no overflow happens
>>>> +	 * when coverting to seconds.
>>>> +	 */
>>>> +	timeleft = (timeleft + USEC_PER_SEC / 2) / USEC_PER_SEC;
>>>
>>> Did you check there is a macro fitting the need in math.h ?
>>
>> I had a quick look, but looking again, I see we can use
>> DIV_ROUND_CLOSEST_ULL() here.
> 
> What about 'roundup()' ?

'roundup' does not look the same as what is being done above. However, 
DIV_ROUND_CLOSEST_ULL() does.

-- 
nvpublic

