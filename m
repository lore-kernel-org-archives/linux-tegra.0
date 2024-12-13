Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9521AE005;
	Fri, 13 Dec 2024 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734083499; cv=fail; b=etZPT3chziyuBlYSs2x0pLkoBD+yckCH9s0RPu1obkL0YarrY7PHOGq4oMAMdrYb/fTE8a9CK79MUWBPDkGmg4gOY/j3TTtEdASwix65fkAadPsOO1FqSOc0LdgkBiw9e0YEhpzOQPwWLpCw7jdAt5Ekt9n4iEYsAxhwyiFLljg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734083499; c=relaxed/simple;
	bh=4ToYO/j21T+e0nymIqQk5qtr+kMqDorYLL0k0OWGTc0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KS+qMjJ8VqFTg33zF+FaFT/fKr+sbpzhGo8UKL7fntg6GDiZoe1wBGARO7QGkhkkl0hwSmYaX5f7KyOpTwn/g3hLL7oSANoCL4P3L5r3K8mcKngGwagomCfoe3LdU157HIlq3epkAZjhVhSsndNKkw9Z15pmu4vJ3sEGqXwkUcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VwZCUXv8; arc=fail smtp.client-ip=40.107.93.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VwZCUXv8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8En2AeDkOB9SKN3hxhLoPzEakxEkR8sDzdfR1z3QHcHlzzB3oXAvZKiPyq4ffFcBTgR0mSUXzWTtzEpGoiG8Ehioxe9cKeualiGqGrNyVnD7SZEYYRPSgtHoCF3Tvrqhu8UQQX5/YsQZOK2LvGZD29ok9R4yO8M0YQ1HE/k8GhF7HdnCpbyBPsGiyvyFcm3EX+oWI+T+q5u58+nZqipLnWZLDgwdHHOTc/2fThJ0i2JFdeRWz175obWxWtSMbrTnDfFLFG1PWnseSreADiUr2rEtJLPkNfJkC+AU2v1u3fa4taFQmuLiAhkHRgsfrcUyiAd+MTGCO2QXzdt+jsHAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHlnVjXVzp+e3+U2wR+3KquU0JT8kuzvUx3yfHfxEeI=;
 b=eWa6H6PQoa6tR+uNYjRrJNoE/SS/2P9UDfASxOLvsfJxMlIvWjUehIoGhVQo4DYwFzNlejjnNGKvRWQaU/i6pA0fR4PqXVI8SNIYshXb34iBc0fiKS9TEQ/V4d/bNVVZjNBqXSMCiAvK3nvbY5mJi3y1+WH+pnwamWE2MlRCZgn0b8Rd1GSpQA15y+sbG3ZALH2JqKQ/zm9sATGRLlkFPzlM1faXytAB/8MDS27iskV2Ix5t0E6KpAkHq5PiwnLcD87cTTh1w7+9mWiDdG0ZtSP+35ZH9yMWi7txpItGnSyUDMJUOxjMYrDrof0U96phUwDMqIXqD2AWjoyWIf+L6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHlnVjXVzp+e3+U2wR+3KquU0JT8kuzvUx3yfHfxEeI=;
 b=VwZCUXv8rRsEtmsJ3cZ4hz2SI9CWGCm1BHJfI1+G3j0Cuj4Uj5t7YHn3DY4VjnqYTInwO0lJbwWSlePS+1X2ojD3a9RmAv6KUKY9bEKheGqs+LxsGGuPLklR+qafuQovCEZKegRoQKduqIJPYIQmbPChuwIvKKPkEmXNGjoZZHfko9SdJvZOLGjDZO3HkBhqu2Tl1iZ9h9l5k7XQ8FO+WTo986x8heEAjsiLDicCieuIuMK6WxED2sTrjW6EYgfE0rsxvaAWCzLr22urEq3pLuykwgix1EsB+clgKif42jXIyTBFXgoEd9NlTJpvRJVW6ROaLLhLuxqPwOUkyPPkgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH7PR12MB5686.namprd12.prod.outlook.com (2603:10b6:510:13d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 09:51:35 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%2]) with mapi id 15.20.8230.016; Fri, 13 Dec 2024
 09:51:35 +0000
Message-ID: <e3a566cb-fe72-478b-b0a0-b866be7d4e93@nvidia.com>
Date: Fri, 13 Dec 2024 09:51:30 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Fix Tegra234 PCIe interrupt-map
To: Brad Griffis <bgriffis@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20241212211114.330245-1-bgriffis@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20241212211114.330245-1-bgriffis@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0665.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::16) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH7PR12MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f09cae0-81db-4a0b-be88-08dd1b5bbaf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlN1YXVRNGtsbUNqa1BkUFcvVHNBT01GY1RRMnMwT1UzMzBSRElQaDlHTEVN?=
 =?utf-8?B?SDRrcXM0NHQyMWROUC8wbDVDVnYwZzdkbXgwcGpLYVVORjkwWGN0QjU2a0o3?=
 =?utf-8?B?b3p4cUZmQjVQVWNYZ0U4b1ViVFRwUXFBUkMyTGdDVTZwYkdyekU4NXc1NkZ3?=
 =?utf-8?B?R2t1OTZTQlNhZklrT3ZGTEpGN2tsTHgxaHliQ2tNUHk0dFQwdjVEVndpdHBC?=
 =?utf-8?B?NjdoSkZyQWlja3RqdmFCYmxGUWphd1JnRDhuSTBuYlh0aTBiaWtOVzhnaUMy?=
 =?utf-8?B?N2Z5VnRqUmFZSjNCMFZLN3hQVk8wbHNmdkxpRTR6RzBkYjYva2JySEE5THlW?=
 =?utf-8?B?eTBWV1l2SzhaakQxL1k1L252NXVuNGNQZks1QmhVdDVmMVAySk9BcEpBVHAz?=
 =?utf-8?B?UkRlYkxlSXFES1gyNFNKeUFkNTYyVmVqZkkzV1JDekJVakxOKzArQ0laQlBK?=
 =?utf-8?B?QkdkcFZ0b0pPZkwzQUVpdnZ1cW9sQUM4M3JjMDlpS1YvZ0VoNS9mYngvc1hY?=
 =?utf-8?B?TEFTc2xLT1B0amRnZmRyc1JQek1nc0htUkhMQnNUR0NEM21mSllLcGpjRmRj?=
 =?utf-8?B?Rk9lbDZGL0YvTzFOSnpvRGRMR0gyNWtCKyt3U01QTjFmL0UybFNJekVEOXpi?=
 =?utf-8?B?ZnRoWEFrNnpWSFYyeVMySTVMK0hQL0dmV2MyRDc2WFp6Q0VxWEJEWVpXOURF?=
 =?utf-8?B?N21pSmpJaHlTZHNERGZOSmdSbFZ1eExTLy9FQU1NclN5RnUxc3RKckJPQ20r?=
 =?utf-8?B?dGJGVXBRbWd4YjBlSEdWd0VTU29HSzQvQVFCMmxneFRNL0JvUDR0Y1RQS1Ra?=
 =?utf-8?B?Ung1U29pWDRCYkRLOU8rNEVkN0UyVmpqZDVIc0QzY2JYR3B0Qyt2UlVmcjRK?=
 =?utf-8?B?K3pZVXpPMS9iejdadzJXVmJVT0VUL1RrSkljMkdOZDZzeHZKNGhLbEoydnU0?=
 =?utf-8?B?NlZpYUk3MGxzMWNmOHdwMyszbUxjVmhLZWhldFNTRjU0NXpJby9BNG13Nlg1?=
 =?utf-8?B?Z0M5aVNaMVB3WHYxM3lCZGhRQ2E3Y3pvS2gzVGFycTU4Z25OaEUvdDk0UFFG?=
 =?utf-8?B?bDh3SEtqNnpVVzZETTVzc1pFYk5QdXN2dC9zY2Rna25ENmR4TlQzaElJUlI3?=
 =?utf-8?B?UENGRFY1UkpSZTZJcERPNGw4aFlZK1pkSDc1bXlJbmNLODNNMmdRV2UxSnhG?=
 =?utf-8?B?N3JLdjd5cjhibDRCd1M0WklrcFUzU3pISVJHN1hkYldJMEo5WHRiSUdOYlpl?=
 =?utf-8?B?MmZaWDI2Tk1iSm9PR2NWQU84bUc4KzdrRW4xQmR2eUduaG54U0orVDFCVmh3?=
 =?utf-8?B?cVYycy9adWFnRWZYTVd1WUdvWFRXcXl1c1NrQ3lmaitUZEdXVC9icHdZQ2ow?=
 =?utf-8?B?aEoybzgrWXo2T01LYWY4ZWZ3YTdZQ3N1ZDZ5Z1pQWGdObjg1eHlnSWpqQnM5?=
 =?utf-8?B?akZ1QUI0SThhU2N2M2NWU1BIaFR3aCtxUEdqUmFVUW5BQ0wyVU5SY2RBcTh2?=
 =?utf-8?B?S0JFTW94UEl6NWlnRXFkY2ZLY05kbjVBTHZrNFBjRjh6WVArT1RqMENTMkhW?=
 =?utf-8?B?Y280dy91N21FOTI5d0cyaUVQTmdidGtWR1MrNVBodnhuaGxPVFFLeWxMQVhs?=
 =?utf-8?B?Tzgwajh6NGF6SEtCZ002ODBaR203bkRFQ29RcDJOU0daSkpvUndpU1hDdWYw?=
 =?utf-8?B?UFVNdElCSkNvN2JkSUFwcE1tcExnUzlnSXRHYmo2d2liTGRlVk90ekRSL2tj?=
 =?utf-8?B?SU4xWXF2WTlNNTlCQmtnUDQ0clhZUHhwQzlvb1A2QzB5V3FuRlBjcndPcUlG?=
 =?utf-8?B?UUtudnU3MjVjWXZETmVrcTg1K0srMUMzR3JOd1NReXBobzBsUlQxaVVrdGRu?=
 =?utf-8?Q?vCLjt4TGRgsCI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2RkbTMrWTRMbUZ0cTFqNW14UllQam5SY2NYRjF1bDVSKzA4NHdWQ2Qya2o3?=
 =?utf-8?B?S2I0dzd5TktzV2MvbXlkdEVUb1NDZklVZzNLQnk4UnQvV0dHcHFTYXRyMXcx?=
 =?utf-8?B?SW5OMUtoMGVtaEg2YWNvN1hTaWQyN0g5R1dJVVVKV1JWb25QTnpLWnhCdUhM?=
 =?utf-8?B?YzAxVGpFZmM5YisyUGpnV0VUZ2szbW9oeWhBUFhiRHBhVHROMGloQnhSNDN4?=
 =?utf-8?B?OWdIZUtkbEFJb0J6ZGkrUUY5Y1g0OFJBNWtEV1F3bmpWdGVDalFmbDhoYzRS?=
 =?utf-8?B?R2J4MVMwK0UyR2I1MS8rclBmUDhqWHFmNnMvS3gwc2pGV0JFWm9aQ3lxSUZN?=
 =?utf-8?B?S21IRk9CdlNaMURtQVg2TUFWL1gwaEdUeWpuWkU3a2FKdktpVmtpS1hGOVEz?=
 =?utf-8?B?djhZN212aFRJc2x2czVUMmgvZ0lXbEhDK2pHQ0JiRDA3QXlpOUVGZDdEaGRH?=
 =?utf-8?B?VWluQ2QveGMrZGdMb1lGSk1OQ2hPSXIzTk5ZYzJoUUpPQmlHclI5K05kRGNE?=
 =?utf-8?B?bmpXVFFYVVhTRGxJOVIwK1VReENwWUFQMlFtKzRiOVZPWFhoTitMTUtEcHZp?=
 =?utf-8?B?ekhhMmMzSFBRSHJOK0VVTEJKSTlUeFhwUXc5OTJySFpoMmxmbVhYTFIyWnBh?=
 =?utf-8?B?U2tIYURESExvVHlVN1Q1aVFVeS9hb3IyWEhCYThuQlpLeG91cVdpcUdudm1h?=
 =?utf-8?B?emNrM1N2TzJwaGJObU1WZENEbHFEbXBHOSsvaVQzTzZPbzNnNlJJU1Bwb2R5?=
 =?utf-8?B?ZXZXS2R3TjFsd2VGMTdkeTQ2WXNNUTRXbENwYi92Y2tTbnJPNUpwaWMxalVS?=
 =?utf-8?B?cDRxRDk3OGsrSVA4SHVYMFkzeVp5b3BVaWZNQjFBMmRBYzFpNnJiUW9VbGw4?=
 =?utf-8?B?aDVDYjVYV0lrSzFCSGdRcXlKV3UzYVdHL2Z1aXY4ODB5dm9IT2FibWFhejFH?=
 =?utf-8?B?RXZNQ3NtN1ZjTXZCUzF3SWVvditpNlU0V2d0WHdaZmZrZFNkSTBHdzhSWmxj?=
 =?utf-8?B?cS9jdkJmOW5wSzBHYXBja2FtZFliTTlyZnA2N3R4b0tNaE81cFQ1OFFSdzhs?=
 =?utf-8?B?WjhHR2ZhWkFPWldYbWczRmlTaWZUY0tDVkpKckVRb2lVN2F6NXN1STNtZ3NW?=
 =?utf-8?B?VEV0WWoyV1JwZ3dSWnl6enpUYTdyNjlnUmp0Zkt3S0dzMDY4Sno5R2Y4UFBV?=
 =?utf-8?B?aFBNNSsremlqUG4xTEJFTkZnNlZUdEVzVmJvdTl5V2RhSkRPTHVtakY1S2R6?=
 =?utf-8?B?dFZ6RkxTMEJObTJyWDU5ZDA0SDY0aXhqK3NQdys4T1ByYzdHSy9oSlptN3V6?=
 =?utf-8?B?bExDUEdNTWtISFNVbjIzRGZ6YXNDRGpUOC96dDRTNk5aT1N2Tms5M29IeXp6?=
 =?utf-8?B?V0RjS2FEYzNLTzZLd3JGSzZGQk16Wm9jQ1dZWTFObUk2aFFkcmlpYWNmay9E?=
 =?utf-8?B?OUxUYU13dU93OXdJeG1PaVJWRURRaFNBMFJMQlU1QnBwcXl1dVVYRWNMb3Ja?=
 =?utf-8?B?MnFaR20vYWFRU2wycU93VDkvNGFpSkZlVmpqZHc2bkZyT0IzSGh4d2RCdFF5?=
 =?utf-8?B?bXJ3byttS2tXTDBXU3F0Q0E0VzEwNGg2MkZJMVdBNmRTdVkyeHJHeG81UTlM?=
 =?utf-8?B?MEVUUUY5cGowU2Vud2dFODNNQWhIQ1BPTEQwVXg2YWQ2RXEyTm83Y0tpWThX?=
 =?utf-8?B?SWtMaUxJWnY2RVA2M1RyZ3gxQUtTRTZGeU90SDFmNjFvdXQ1MjVMQUFSRFd4?=
 =?utf-8?B?dnJJR1BNWkoydUo5Y29zZ3BkZTV3WFA1NHdvZk5BcXZ3Y0lXRE1sakI4aWZl?=
 =?utf-8?B?MjhJMFVKbXpIeHVPbXVBbjg3aXgzU2hrZFBvaXdyMFAyVVRvYzdYUjNGZXZy?=
 =?utf-8?B?UzRpQkcvY01CMExPN1pMWnVrdXV2cmVvSjlaNVliNWZxUkFEakFvKzJ3cTZ5?=
 =?utf-8?B?bjc5VkRVSHUwSEhxMGNVV3VnR3JXVklFSFVNWHpvYjlXZVBBWFJDV1I2UzFH?=
 =?utf-8?B?RDREZEc3UVhjT2p2ZlQ4UXIrZXVWNnlKM2hZSTU1aU9uakhjQ05QVC90YmtS?=
 =?utf-8?B?a0YySnc1dGRabGg2OVJpNllxMU8xR2c3YXhldlVSeDM0YU5QTWxqc0dZWHQy?=
 =?utf-8?B?SWZVbzFOTGlneGpKTzlpejFPV091R2dFeGJRRHpEeDNUV1p6REFQblQrVWUw?=
 =?utf-8?Q?se90IAdLD7O1goU00ceiQJgzMva4az3ZjdFHm/6P+9MM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f09cae0-81db-4a0b-be88-08dd1b5bbaf3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 09:51:35.1216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gH5dWwQhMBxSyvm4hoiqpYrYGHHuNnm3W+nYnuINKlI8sM6pEzVV//a0ESV93IBzF0z4TzLj2+Trkv5WYry0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5686


On 12/12/2024 21:11, Brad Griffis wrote:
> For interrupt-map entries, the DTS specification requires
> that #address-cells is defined for both the child node and the
> interrupt parent.  For the PCIe interrupt-map entries, the parent
> node ("gic") has not specified #address-cells. The existing layout
> of the PCIe interrupt-map entries indicates that it assumes
> that #address-cells is zero for this node.
> 
> Explicitly set #address-cells to zero for "gic" so that it complies
> with the device tree specification.
> 
> Signed-off-by: Brad Griffis <bgriffis@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index 984c85eab41a..e1c07c99e9bd 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -4010,6 +4010,7 @@ ccplex@e000000 {
>   
>   		gic: interrupt-controller@f400000 {
>   			compatible = "arm,gic-v3";
> +			#address-cells = <0>;
>   			reg = <0x0 0x0f400000 0x0 0x010000>, /* GICD */
>   			      <0x0 0x0f440000 0x0 0x200000>; /* GICR */
>   			interrupt-parent = <&gic>;


Can you add the fixes tag for this?

BTW, I had a quick look and this appears to be a common problem across 
all Tegra devices, Tegra210, Tegra186 and Tegra194. Should we fix up all 
while we are at it?

Thanks
Jon

-- 
nvpublic

