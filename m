Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2074.outbound.protection.outlook.com [40.107.95.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742B01DF258;
	Fri, 13 Dec 2024 11:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089854; cv=fail; b=VHJGQ9Kg/Qabnhpk+6rBbSdMTEtTnx8XfsET1b1x/LVFcXcv9uMuJb/jsR8do5OaMrQGwRcAJo+dIOwb1FG1mSWciVqUAHarQi0K4BdIdhuo/c4z+8cXkskEZSbQnQONGCw9ASMf1c0buwAImh4iO0KuLzGXf9mShGIYQH3AnQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089854; c=relaxed/simple;
	bh=x4bkBSGX6oXXXDqHmTTzvRtvAjFnSDaoUuvYfvMxvPE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JpiazN5r72O9tq18X3BqitBDuPKyQUl1+xbRADxQI9Yb+zyAs6EWU+iajuvWSPgzbyW5RTba5UiDMnoJ139NLk3+mUmmmLB5nHCtADrNb9tFv7mTe9dLvC25pH8EbUw8kb2Mcj2w4do42sWAESS3x9JEjaNGhHwf7TJrFfdbAXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fuXXXZQi; arc=fail smtp.client-ip=40.107.95.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fuXXXZQi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLAqMFZrTYjCBWZ1NBuU0Q0+BM5qJxrXGa4/jwYzK8GE9fF+ukmeZ/nwhqSqnuLh4B86cxWOiyP+wkS2nKN25Z5ISv3hfqXoO+fLMx3BVEg9Gj41wS68Jrk8nen+9YY8MeD3n0ccysJa+8KiYpUUplGuzh4J0wYvqksWhUKcTuidPipn7MuX7WJfAT67cpwgTeUjTzXvit01AOU3pHwsNAtmy8GazRaCognKzzzSYsqAo4cHuWCilp2tTDV/KayMkUBPaA4QmOqCA667ngRjn3KX8fesr7C1XSA24NPfynZr6eDzF352hsxxPNZgHPTvsmLAAQNw9NOt2lwkv18fmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxlnWRjOs4O+Rn6pP6O0ZUcZz7kwDoe1oDXwNC85bIw=;
 b=eTFF5K3RJht0vc7UZ7bdnZkD2X0Z7EDNck9QfWI1bXHyd2MKy32ZIXC0KJ7hstJUBQvGl3vV5WuP6Xtu+t0khS3XfPQJCEZIAzdt7aL7yvdgZXgVFe+SRlYwm4ikDysXkjOI35mjhdjQDGBPNBrMYlxjRIDLWDR1Sn+oVtyp2fq4SsR61rFaNgYf4wfUp3YaHiSYUJqGEc9oYXBuH/fjHRgraxYIUXTyXCrDrtismCHv5AoyBMnBFmXuU/LDSn9TQPJmtg8MOJwKNS1X+Pkv7wX5R1vxaOTmAcaw7bOOvV1/WOwKUxPno7aOJCO7AXxXDDgZavOUzgSg9J/XwWDE6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxlnWRjOs4O+Rn6pP6O0ZUcZz7kwDoe1oDXwNC85bIw=;
 b=fuXXXZQijeEJsDM59uZ/2mgldsY6PBgvhbwk9EU8adPhqWmIZrOxmKLp4uvY0Y91D9/XIZLZQTK7BBciDqTwgSsKkINOqE/H8wP+cL767iMI/IWk4uN5P8Ycd6wpXgVAVqjIFaDkfP6EZqEYUc+QBb1Cj1/DWl2p3OnQ7YVFY5AtD+Dmzvm5uKny7h4lQtYpx8MMuri5T44CTPdhi72qRDnPoWR1/W62QmbSUa6LXbBtonrYIyy8Vx8elGy1NKfyxdF/CpaacRbqFavsvjFoDNJcTRWxrk7OLkOmMQEBYZdVHNSqphGA38EXScBTRnTFFudfdKl3wyEkeDb+5dEJdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH8PR12MB6892.namprd12.prod.outlook.com (2603:10b6:510:1bc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 11:37:29 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%2]) with mapi id 15.20.8230.016; Fri, 13 Dec 2024
 11:37:29 +0000
Message-ID: <7ab2cc1a-a461-495f-824d-9dd62973cf48@nvidia.com>
Date: Fri, 13 Dec 2024 11:37:25 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Fix Tegra234 PCIe interrupt-map
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Brad Griffis <bgriffis@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20241212211114.330245-1-bgriffis@nvidia.com>
 <942ae75e-51d1-4265-adec-e1446fe0ff48@linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <942ae75e-51d1-4265-adec-e1446fe0ff48@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0060.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::24) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH8PR12MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae5ffcf-28f9-414c-f245-08dd1b6a866a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czZhUTJ0Mnd1VWlUUjI4OHN0YWdDb2ppaHhIMXlvSTFNVHVPOEVTK05NODJL?=
 =?utf-8?B?T0x1cDIxWEdkWU9iMTFBZm56SlRxSXRZL2VrSDhTU1llK0VyZUlOYkJ4WFFw?=
 =?utf-8?B?SnhEcGwyeURRS2h1cUJ2OXJxTitGcG9UUXNOQTVSajFkOUYzU2pvbkx2OWEr?=
 =?utf-8?B?ZER1Rnh0VTIxc2l4Vm9OSFFwS1hBZ1ptd0VSczBjcTlkV3JiNWZtM3hjbU0v?=
 =?utf-8?B?U1VaU2U3WXN1TExhcEY1WHdTSkZlekc2NGhpT0p1Wi9kV3FFWHg1SisrV2tp?=
 =?utf-8?B?ZHU5eFJUTE93aW5DQVduQWR6bE93SStJWWFrTUNid0cvRFR1bDFKdk1jNWZC?=
 =?utf-8?B?MnhhWVJITDczdGd6R1ZyazJPRUE5THAzYW80Q0FVUC9xUEJHVC9TQTd4TnR5?=
 =?utf-8?B?TlVOSVlMRXk1QmFxaExacWJWS0UvdFBlY3NHYUhpQzBtUUplZmZ4TTNTcTcw?=
 =?utf-8?B?VXFiKzlnRUtCNkRvSW0wSnQ2UmNQRTZKY1crVGV4djNPOFplNUVYcWxnd3N5?=
 =?utf-8?B?WittYkJNbFZLdnJPd2R3WHhSa2dJZ0NNS2llQlpzaCtHRzZKQ0ZUcUJoSW1X?=
 =?utf-8?B?VFNrTS8veUZNSm50K1dObUQvY0Q3MUxXbmJVSUF1Z0N1dzF3Qm5QSXpuK2xB?=
 =?utf-8?B?MUFHWWs2c1NSKzhTK3pXZ09kaW5NY0tXQllqbm9ESHNublUrVndrT0FLbE1B?=
 =?utf-8?B?czFCQkRVdnRZaU8zTGVMSytBalpWRUFaVjJVWi9qaFV1dUl5bnRMQ1hxSU1i?=
 =?utf-8?B?bTgzYnErZ1BOQ0RPMFFtNnl6VXIzdC9UVGZaYlJXemw5T1JmbE5QZVFDR2tr?=
 =?utf-8?B?WCtsOHpiL1ZsRFZ5R1NsbWVoTjRwbm5yR0hHUmNyR254L28wc1BldHFNZXZ4?=
 =?utf-8?B?UEhHZGZDVnJTTEdCblpENmdrb1A3NzBNMW9iNU9jdkhPMVFBQmVoRlpYM1F5?=
 =?utf-8?B?dGhBL2taWVd6TDQ2OG44YW9QaEFUYzNEQUNPRUNEelhSais3YWtZWjlmeWlj?=
 =?utf-8?B?ZndVbzB4SVJTdUtjL3hlOG02a2ZtSDNYektQN0lFQysydUZIYjJUR0xxZ2dP?=
 =?utf-8?B?UG1kVzlValhLbUd6UlgxWWdqQjFZTGNEcEJUZ1d3T1E3RGIzZTZGU3ZLaFNl?=
 =?utf-8?B?NWYyREpLWjU2VklqQmEyTUp4YXl6R0UwWmRRSWlzWjgxNFUwMVlhSTZZaWhE?=
 =?utf-8?B?R1JEY2pnZ0Foa29ac1ptTEFyRm84K1NMTjhiTUlUS1FzSEprenpob0FpblJC?=
 =?utf-8?B?dzZrVUM3N1kvenYya3UzWkR5OExZS1RvdFBCV3MrTGNuRkVRakNtaGRzcUpK?=
 =?utf-8?B?ckFSMzZXVE01WVZvQlZaQlJNZFFZWHdoUm9xWjN3ZzJsYk8wV0h3OER3YjVZ?=
 =?utf-8?B?clJkOTl0RXBxZWdOVDFXVXdPQkxyNzkzL2d0emdxVkdNYjhKZnpZS29vSStO?=
 =?utf-8?B?Vmdqek9HbnZZeVY5QzR0UFQvRzkybDViRGppUUQ1VHRmUExOOUlJbVFUanlq?=
 =?utf-8?B?cms5dlUza0R0Q3ovUzJvVkwxUzRPSzkyVEpjbEpNSFRKMEx0eXAvRVFURjBP?=
 =?utf-8?B?T0tsVHFvWmdhZ0ExN1JLeWNtbEtoaEZQS2o1ekpqM2U0QklYN3lPQUF3a2FM?=
 =?utf-8?B?OEdaN0d3Y2JaQXRRdFdqdkEvdi9jSmxURHB2ZitSVG4zc0xSMzVuNHNKT2Q3?=
 =?utf-8?B?Mk1PcEVIWDdwRUljSFZhdFk2dFRLbXVJOUZDU0hITWg4UnNUL0lieG8wekI0?=
 =?utf-8?B?NDE4c0pXZUhKcXR5cVVTQkJrL1lEZnVJcXF4RnlEN0l6YU1tQkN6alo0eEUx?=
 =?utf-8?B?dkJaU21hSzk2RFlyVmsrZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3lsaWdZeGIrajA4S1VIUCtCaFIvc3FUTkRNZ21kaE1nTm82YjM4UEdacUUy?=
 =?utf-8?B?dXJDMXdSMFFhQWhQTlFTRmhaeWRRL293MVFycVNZTUlucnBnWk80WHVNM3dh?=
 =?utf-8?B?dWJselczaVdhZ1FlTWk4dGVMOGxUWk9NaTJZQUZ4eG9qczhvanBTS3ByNkQx?=
 =?utf-8?B?Mnh6U1VXNWpRSkc4QmkyMHRTVjJFa3VDdW1reGtWM1lkc240TnArUG1uOFo3?=
 =?utf-8?B?ZGlmSHdJQ3pOMThPcTRNSlliREJVYklIdUdieEM1NW5lNFJ3WGpPblYzeGVK?=
 =?utf-8?B?cU0rODhVZjkvTlpUckZCdGRhajVFM0VoTTJqQmlSZlM5R2IwSUFxTnFNcm5p?=
 =?utf-8?B?dnpkZHM0TlJUVktKUDZsRnNKTkhKakNLZzhSa2pITCtaU1liMlozODhIT1hU?=
 =?utf-8?B?VHBYUzJwUlJDejBsU29ZQUdTYXoySTU5Vi94YWFNVlRVTHNYSEhnY1VSNEI3?=
 =?utf-8?B?R1BuK0NmNjRzTXlEaGdWZUpEK0tmWjlneUptcEs1anNKc21FUEVQUkpXcHM3?=
 =?utf-8?B?OUViaG5HWWh1RmJRbnJ5ejQvN0thVE42WlRsUGI1REtPVWFyWngwVFRhS1hj?=
 =?utf-8?B?STdvZzBwcmNvNWVMNUI5WEIrZ2grR3pnRi9RZ3k1TmdNQzg1bTFacCtoVmY3?=
 =?utf-8?B?L2xFOXF2RVBIcnAvMG9NL1U5dEFubkxQMUdhaDRXU1VxZ2U2K3dsWXlpYlpQ?=
 =?utf-8?B?Q2tjVmZCcHVDYUVoMUZQSExwaGwybzhhb3MzRzIzcnF0RitsY1VoRThTSWxx?=
 =?utf-8?B?SDZqOEtmYXlIZVVvMGlGREpqQUhsUUU2U0pTdC93MkRFMHVaNk93ZHJqZ1JI?=
 =?utf-8?B?TWxtNUp6QW1qVkpUUFlseTB2eEp3cUFEWTdTRnRBb003amhBR01WYVZjSkFk?=
 =?utf-8?B?bjg4OWxSeDFDd0dHRmdQWFl6eXpGT0YrZGtQbzZxNVZWTEF5MkhLb3NsWHgx?=
 =?utf-8?B?NUxHeGg1aWhDaURaZk03OFA4dkR3b2l5TTdhRTFweWRXYnhsdTYvenI0ZWwx?=
 =?utf-8?B?QmI2UVRkUkNxMk80c0hUUjBzUzA2eU4vQlZvSFdTd21KNnptTGRBWkI1SjJq?=
 =?utf-8?B?VittNWZWRFE2UlVTdnJ5SjNRN1B4M3AzRklCTXova0Z3bHlXbUxUMnBRZ0tx?=
 =?utf-8?B?SmVGRE5YZlp1UEZuSjlUMG1oUDNVajR2MlFhWlRuZDBoMzcvNnRhRE5TenZs?=
 =?utf-8?B?T1J4K0c1L3RlTXI0TXBoTEdNUkZISEJJSVNqcjhmOXV3SW1UWnB5bGVUMjBB?=
 =?utf-8?B?S0MzbGFFUTY5TlI3RW5VckU1ZkdiQmhXek5Ca0xyUTdGRzY0OFhVREU4ZjMz?=
 =?utf-8?B?YU82cUdqMlNVbUxZR0lobkJiYnhHUTZCNm52MWVjU2tYb3pSRmJ5dVlYMmtX?=
 =?utf-8?B?WGswNjVhS2hsYkdNRlpxTHBwcmYwVzh4TDFnVEJJV1EzUHdHNHlZSDJzdG1v?=
 =?utf-8?B?YU5zbU1iNkZDMkY2aVRyTmxCb2dUWWRiMUtGOFhKOSt1Z0dNMnBsOHIxcWF3?=
 =?utf-8?B?SVM3Z2hFT2NWVnBOam1DalF4VUYwN081R0syQVpLMllva1BUZVhEQzlVdDVR?=
 =?utf-8?B?c2RPNm9qYnB5ZEtzZkdwcTJZM2JDOGJIek5PTXoyT0Yvc3JjVzNQZCt1KzBX?=
 =?utf-8?B?d29obzJpOTZDb3RRUXRCbzk5RHN1dk1CcUtYTHAwMUx2b0lDVkRUdUNKSmd0?=
 =?utf-8?B?Y1FRQTdQTmNaMkQrb1diT0RRUW05Rng4V1dKREZkUGxUWU1SR3pMZEtsQ1VL?=
 =?utf-8?B?Y0dWRXBtSlZLMm90bEpnSU4zS3l6M0p3bDVMbmNFTkdpUytsSE5KanZaMXdv?=
 =?utf-8?B?bXozK21FUmRSWUFLejdnbStmMGJUWVpVS3VSM3E2ZWtyQ09WLzdLQzV3Y2VY?=
 =?utf-8?B?a3FoQ0ZZWXIvRjZwWDVlUTI1Q25scS9VWThqS3VmL1d6aS9NdGtpSjdJZUpV?=
 =?utf-8?B?dlBjSnd3Nkp1d1pVVkZaejFKNXZhSjVLSzNwQ1UyMGVUOWxiYzY0Uk0zOUYx?=
 =?utf-8?B?L2JCeDdyK3R5ajhVMW9lUmJ5OEdFSzg1Zm14SW1BK3VCbCt1c0tUZkRSN3Fy?=
 =?utf-8?B?OVVJb09IMFMxOUVNQWxHeVhLclk2blVNOVRRY0RIc1FVczVDYWxOQk5ZMWQ1?=
 =?utf-8?B?eFo4NWpyaUZSZHBZaTk3T2JOMkNZZENHV1h6REFNcGNKM0NuL3ZMNGlEcWFC?=
 =?utf-8?Q?/At2NTkuegTmXDmEJtC4gCe3+BI5BMkQrpes2BbUgneQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae5ffcf-28f9-414c-f245-08dd1b6a866a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 11:37:29.4919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hL7BlP58Btc3lE2eXwxTz/FkB1LWhxtSyaiqVEd/NcZ2D8rv8GqgIgP6BbMxXgpHqe1s2wipjqhuDqS3L/Tmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6892

Hi Krzysztof!

On 13/12/2024 11:11, Krzysztof Kozlowski wrote:
> On 12/12/2024 22:11, Brad Griffis wrote:
>> For interrupt-map entries, the DTS specification requires
>> that #address-cells is defined for both the child node and the
>> interrupt parent.  For the PCIe interrupt-map entries, the parent
>> node ("gic") has not specified #address-cells. The existing layout
>> of the PCIe interrupt-map entries indicates that it assumes
>> that #address-cells is zero for this node.
>>
>> Explicitly set #address-cells to zero for "gic" so that it complies
>> with the device tree specification.
>>
>> Signed-off-by: Brad Griffis <bgriffis@nvidia.com>
>> ---
> 
> So entire nvidia works on old kernel and sends patches rebased on old
> kernel? Please start working on mainline.


You know that is not the case! Yes there may be a few cases of people 
using your old email, but not all of us :-)

> I give the same feedback multiple times and still nvidia repeats the
> same mistakes.
> 
> You CC-ed an address, which suggests you do not work on mainline kernel
> or you do not use get_maintainers.pl/b4/patman. Please rebase and always
> work on mainline or start using mentioned tools, so correct addresses
> will be used.

This applies on top of today's -next and so I don't see any need to resend.

FYI, Brad has been working improve our testing for mainline and -next 
and so I know he is working on mainline.

So are we perfect? No. But we are working on getting better!

Cheers
Jon

-- 
nvpublic

