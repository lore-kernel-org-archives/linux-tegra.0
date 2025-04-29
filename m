Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE642BCF47;
	Tue, 29 Apr 2025 09:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918878; cv=fail; b=ZDI4dV6Dlxu5HUgX36PuH2kvOWACgWoT8xSkVYgSCraVr86PByAgm9AqWFqPgK7k6Pb8RxwMMToEpEHPOGYuj2W6IUOiG+Dw4A8zdr3mwoQpmajRbLN+3u/1TgKXLXsv5eaHRnRRyD44PlGKz36x2eKAt0raAOZgMhhQxUkQygQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918878; c=relaxed/simple;
	bh=krqE+8/IxvtJ4gMIWTjQyrBbE1bwmCANoRhOUOx2d90=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pMGglkFF+PxTO9qN53G9asRmV9YZwga7tpz65RnvLS71kH9Y2jb69jhYrVMCMG0CQO6VOsBuKsRb6NOraKV3hl6gatCA+/l2Zy3x6IVmCrFu3if7jzXde0Tbj/SlIu0mh6C+zqPCwwlvYNAeCgJfrR8Pn0X7001w/b91wf4gZ0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F3++x9jC; arc=fail smtp.client-ip=40.107.236.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F3++x9jC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mp0ulIzlnEfEqndnwS5qgZEMNF4CFMAIV0lA99SeirRaHtzzRRTwVxT2TsRXT81T198wdepQZDu1HB545GpqsfWXYnGzT5d5PyOstwe+b6n6awC9zBrrYNAI7E/0Vlh41GETZ4Az+zAQbet2xPytxQxOTuKqriMHOkV0+8nR1GMG8F6ND9KcsxXJ5rnEixiNhTyl2J/+QyMB9DSEvb+aRNnYy2dwnKHV78qC6kkwlmkG9KwOzzc9/uhej85EiQZKvHJHqgBJJZoZ1gVqX6pkrtUidR+Uaf0DLtgrXq6RzK3MDsXcuN6NYyitkyS3VomsWtQrZLk/ziCvA3DW+Ac/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAc2kgMBB0voFxMnep34pBFAcqtbamp2YsRoP6FBcWY=;
 b=EZcXmaEEPZilRAa04I5NUTdW+q40f0fZaDfPabI2wlJ8nsfeC7WSTp5MO6rvkcWzTbCdGNvDdAbgmAudOqJh9VvTOptgDxrhBhh8NvXrDMou+rGX/bvrwO0ktJaj+Q6UIpKeIGH7vpTauAWHZerlYkmYas5yTNNqprOymj3eXqqrYG1NNdUvImAr3NNFXZtRb/MiTnwgeXnITWo8484oEiT6vzndmAaiZ6DX32SsMynPjk1OW89HDijFJab5JlcMkWvMpuO4pLKh1HaBTBDcSdAKwP4jy1NWUdEXInahnNv70Odab3wpRhU8Qc8ZuB+COyB8sbFrVoq7NadMq5IAvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAc2kgMBB0voFxMnep34pBFAcqtbamp2YsRoP6FBcWY=;
 b=F3++x9jCt2KgxWj7i6jxSz/pG7+n0D6bM23irv3g4vKpZnjzPog8+5J/SrDfhxE8F6FsUzUVxx3R6geOqVN/EfgMDHtiENbAleTc6LPuvAtI5AwGO8WJFlUMMFh8pcypSj8pcNkq2sxWsfpRXYKpZNaTsYepA0+Wa6aQUyXLmXv2/TTD0qoHxKU7IfMOhMC7VINhCs8XsLp4Mybxakb4oJtL+6gw9R6u2M5Q5VxS2RMhwIp/NVc7frlC8+x+vKHc/FUaFyPZAy7vaYom8/5e5flpnMF+L0pCysC4PZXNaL0qlJUO25lVPQd69Mp3NDheSyK820aRvty9EZ4LUA208Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA1PR12MB8540.namprd12.prod.outlook.com (2603:10b6:208:454::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 09:27:53 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 09:27:53 +0000
Message-ID: <15a3c451-1928-4455-8bc9-4039ea341f09@nvidia.com>
Date: Tue, 29 Apr 2025 10:27:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
To: Robert Lin <robelin@nvidia.com>, thierry.reding@gmail.com,
 daniel.lezcano@linaro.org, tglx@linutronix.de, pohsuns@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 sumitg@nvidia.com
References: <20250429064540.1642030-1-robelin@nvidia.com>
 <20250429064540.1642030-2-robelin@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250429064540.1642030-2-robelin@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0251.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::22) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA1PR12MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ab387c-ef81-4f70-2dd4-08dd87001e04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0RROUloTmlNTzdkRmlicGx4TGluak5GcnlZcVZVYUpBSFlvNDltc3l4ZE16?=
 =?utf-8?B?VU9oc2s5Zm1hY2RHbjFxSGZ3Um5USGpkY0prWlBOdTlqbUU5VDNJcHBsRDJk?=
 =?utf-8?B?bll4bHdEYU4yQ0Zuai9jTUFmUjRDQzJlSk5qcWpUOEpXc1RhbXZOcE0rNmhm?=
 =?utf-8?B?ZkR2c01FWWo0WGhteHZVNm00cWRLTFlIK01HYWRpUWZuZE5kWDd5SkUvNHFa?=
 =?utf-8?B?cm81Rlg3SEcyalJWT1YwczZmb0lZYlBhWXZCL2F4TExUdUo0RUlac2VDTkxT?=
 =?utf-8?B?UVlkWW1OeGN1a1dzRU9zTnliQmkwOFdlK0J3L0x6NmRRU2t5ejhCZGF5QzNR?=
 =?utf-8?B?bDlQYXRqcmtYUnpzUk9VYWJXVXYvVFFSSm41OTZJT0oyS2JTaklXY3JQaWdj?=
 =?utf-8?B?cGNPRGlaakMvMStRUjNOOVhqU04xYnpzZnhScjExZ1VVN3RLVHdqZW1BMnpN?=
 =?utf-8?B?anZoTmpnYTlCcExxbnl6WmVrR2VvRkxRTVVsaHlZQm11TDJJQWhEcERHUTIz?=
 =?utf-8?B?U2hmdUZiRnNhVGt2Slpic3A3cDNXV1BBNi9FenFCaC9tanpzNU5FTVNRT0hk?=
 =?utf-8?B?d2p0WFFieHBxaXpmbWQ3a1hxeU5TeFNaMEdEazFYZnpJNDBVS0h6ZFlQdk5X?=
 =?utf-8?B?by9YWlN5V09sSW5oMHBCeVdURnUxVUJ0N2RWZGhmbldzN1RQcFo0NFdoOVNa?=
 =?utf-8?B?M2xNNSt3bmQrdFNOS1lTK2xPamZpcnhSbmhNTFV3YlJDcXdzUGJ1bW8yV0JS?=
 =?utf-8?B?R3d6YTl6N0ZFaUkzc0ZMRU85akE0Qm16UEl5V3RWWVFJbFN1QjF4MTJDb2du?=
 =?utf-8?B?czlIaUJ2dDBqbFYvdGJGY3VkUXdSTlZ0NGxld0N5ZXJXbHdSZVVjSWJFdm5n?=
 =?utf-8?B?TzNWSXJjL0o1YkhNb0JvSHJjcUY2NE84MVVUT25VeUlGTGQ3Nm5QU0lVRm14?=
 =?utf-8?B?bVg5NW9scFhOWm51blV2blBZMGRWZzVRRFNNOUVXYVdHTXVPL0xrZG5GK0lW?=
 =?utf-8?B?bHlERlVwbnVnbTR5UmFtZERwT09jVldVbzhGVkxkeG1uY2RBRTAyMTVQR0VR?=
 =?utf-8?B?eVB4ZHdMOFEyV0QxNXpZb0xQMFZua0dUbFFuU1IzeFBWT3Yydkg4TDZMMUtQ?=
 =?utf-8?B?SzNUZXJIdjZmS2ZJTDhvYlczTUxSZ0VjakU3WGlrSlZEYUFxb2owMDYyMWZB?=
 =?utf-8?B?YzlnQ3pFemR6dU91YUg4YVoyKzRVdk1lMGxlSDNtT2U3WXFKYVQrV0ZlYnB5?=
 =?utf-8?B?YkhXZkhVL2FBeStaNWFVa3krTzZIRlVydUJwQ2hWOE5WeHV4NUtTQlJLd3U0?=
 =?utf-8?B?QU40TWhnUkVxOTR5RndNbCtMN0dzOEU1K1dsS1Q0c0xoREJPTWVVRng1K1dY?=
 =?utf-8?B?cWxWS1kxelM2NVhSYSt2eWVIcWNvWkt3UkVGaENBUTF6RTM5UzZmWHUycGhs?=
 =?utf-8?B?UGVWWlFZZzk5S3M5WTRTbUpxVEdGWURYZmROcFQyUVkyeU1QQWdXLzJYaUVF?=
 =?utf-8?B?NHR6enVvU0FyUGYydW56Mmx2Q3hKS3dmMXJ6ZGVkTGJ3ZlNQdFkxQVRoSEVX?=
 =?utf-8?B?WEdPQyt6RXVJWFNMMnhteTc2MWpJTllYcWxRY0JFNG15MERBNnp5RkRVUzBo?=
 =?utf-8?B?UHdjeVljZEgrNjYzemxyS0pVQk8wMWZVVG9ZaVBqbE1KZkZTZTVNa2E0MGNH?=
 =?utf-8?B?dVlURjlGcFo1MW5ySWVPTFhPcW1BWEpSV1hRc2lYbUp0LzlnbXZpdWlYTGRj?=
 =?utf-8?B?czhTUTgwR3ZXQVhnVURZRkhXY3YwamhFSkluOG1jT1dwcVVVVXpwTlNNOW15?=
 =?utf-8?B?b0J1bFpwZFVvUURFcWpWWVlMYk9uekJGYnBaYlJiWUV3cEZIMlMvWGRxdGZh?=
 =?utf-8?B?dEhudy9qdkRwMXloUTUrQ0Q4UE9RdGVSNVpRbVpOR3ExbDBVWlp1dFpoVmpz?=
 =?utf-8?Q?zw68LaVlaEI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTUwTTZOWDZNOEhNMngvWm1aUEZaL0I4a09JOEZJTmpSam9yT0txTlpoVnJB?=
 =?utf-8?B?ZEJIRHJER3hYL0w1aXJ0S1RkMFFtaFo0ajdVOENQeUNXY2daa3pWcFJTem9x?=
 =?utf-8?B?UUVWV2VwamdyVGVmM1ppTDBaUHpSYUlUUlVmOENteHdqUjlHK2ZqR2xobGM4?=
 =?utf-8?B?RnpEQXp2cm1TY0pNVTI0aVdKRjBhcWd5Q0FkVWdVYVc3dXBYbTgzRUJ3QmdN?=
 =?utf-8?B?VEgybmdxNXNseUR0TGV1S3RpMDVQdGNXeFdZTHdyVnFvbEtlcHFNTlFZVWNW?=
 =?utf-8?B?MVpONHdpUEdaSVNoMzN4emNXajd4Yll1NTU4eFpYeVljNGxiTjZmVlZ0Yk8z?=
 =?utf-8?B?K1hreHExUktsaUxlK0FyaHBFY2RtTEJrYXNGRmRBRDhMbVBtdEZhN00xUFdP?=
 =?utf-8?B?YzBuWVBmRjFucHEvb0NVdG9XK1hlL3YwcTgwQUl6M3pyS2pLTHlIb042SWZr?=
 =?utf-8?B?OEtSMHVOVEVvVEdnd1BVRHl3UEZ3M2Roa283NFZLNnZSL1plOUhINVN5a2ZY?=
 =?utf-8?B?L2dMdHpJTFg1N29MSWg5aVJSVnVUZXlGYUc2QWlsNWMyUWtUSlZlMDZsUHdx?=
 =?utf-8?B?TWUzTE9OLzRLbG5TNjA4TlJsVVUzL2JEc215a0JObFJOcVZaS3RxaDR0dGg5?=
 =?utf-8?B?M2EzblRQRGNSNnlOenJRUGF4eGF2STREWnlKTmdmRXNieTAyY0QwRVpwVWVM?=
 =?utf-8?B?S2pBcFRUR0E2dEdSTUp0ZEVmRU5DbFNaMkJISnorRHViZjh3N2x0a0RUQ2Y4?=
 =?utf-8?B?ZjZwOENDMnd5dEhKYmxhNFhlZERvcFlPVDNsZWJ2a3pKRExyYjZ1NlVMWlNj?=
 =?utf-8?B?SW8xaVltWGdob2ZPN25VL3pNWnRlbVB3bldIS0RHbU1tNVRUZWpSMmp2N0Fl?=
 =?utf-8?B?SG0yeWZJNUFpUjBlU0tmcWhYbEUrSzVCVkp1THJMRlBIVmFwWU9nNEZxREw1?=
 =?utf-8?B?a24zUENyV0p4ZzRGZWxGNGljMHNZWVRiam96cjg5a0t6cVI2WlVSRFlrTXdD?=
 =?utf-8?B?R3V0VHNKSTBwcjM2RG14Wk9FU3pNK0xqVi9pS25yVFBSaDh1L2t1ZkRDSWQz?=
 =?utf-8?B?cTRGWVhHcHVNYXArcUxlK3F6bHpQUUhPQ3pMQzM4THVvY3ZWTHBuU3ltNlY5?=
 =?utf-8?B?djNKa0RBSzhVd3VVZW5EVThkV3dBeFVBSXExejlRaXMzcy8xTzZNLzd5T3Ft?=
 =?utf-8?B?N2FibWpxN0M1bTFYYXM3anp6ZnZqWjBQUThaejQ0SFpoSGpic2RlZFB1VS90?=
 =?utf-8?B?L2pXemJSY2plVTF0NFFpVjFKTW5NWG0rTVFnZDQrZzlyRTZobmY1RkxaSEZ3?=
 =?utf-8?B?dFhJWVpycFBWc250WWlKZ2JydllrSUNiaEdmRklOdk9qL0NuaEx4N0RLTXUw?=
 =?utf-8?B?N2N2b05mYkdEdU4wQ2VJTXYxcnA5TnQycG9jZ25YbGN3SjNWekJGY2QrN2RV?=
 =?utf-8?B?alU2Q3dMNndkWmZicGJiU00rQ3hWS2VockZkQXE0NEx2S2Z6bDg1a3NwSmQ2?=
 =?utf-8?B?VThHQ0oyUmZCVXlNZ1dBNmx1UXphMS84V3BhMVVvdW4yNFBUcVozMUJ6cmQ0?=
 =?utf-8?B?SS9jNitzMWowK2FsNG5ETzc1VEVteXQ0NXhIamFCVlZNWGJjTUM1aHcwT0RV?=
 =?utf-8?B?ZDN3SFIxWS8zWXgzNEd2bGlSbmpVcGNtT3VXRFZHam0wYTNpRHFaa1NKZTh5?=
 =?utf-8?B?T3hZdmxNQUVzSStscWJ2eS93MU5oL2hLMEtyTUIwOFhqODU1NWFNbXBrbm5t?=
 =?utf-8?B?ODBOU3ZjdTNZQ29PaWQyUCs2MEFBb0RiRWx5Q01vd2p2MnFuWVNneStmeGtL?=
 =?utf-8?B?VExZL0hPeGdMWkxZSE9VMi9udUx4b3hhL0tPZ2xpWGZrUEtCeC9iQXFFNkN4?=
 =?utf-8?B?Szc2dTVVTzBRZVhJRzkxaE1aclQ2SCt3TndjanBvbSttTVMwL1N5aU44b3BM?=
 =?utf-8?B?WHZ5VTlLVDR2Q3lpN3p4Q1A4WGlDc0UrcXpTWEJyUHFRWS8yaXNONzYycm1k?=
 =?utf-8?B?andGeEN5Q0ZIMkUwcGVxZ2xUR0VYZ21BSTBSd0VvRkFLUG1wVG9lZEJlQXlE?=
 =?utf-8?B?VjBRY0RWVmtkV1pOUUNSRXJPT1Q4ak5QUUVPZHg5bTRjRm1RSFZvbTBKTCtw?=
 =?utf-8?B?NndtVzh6REcvZzVqMmFuTkdmWXlXY1hZWGI4L2hNTUxIMEtKSGlvSE00QXBs?=
 =?utf-8?B?OS9WUWVDelE0dGpiS2pNdUdQdzM5QXNNUjBadU9vckd2OWNwUHhESjk4RnhZ?=
 =?utf-8?B?RThPWUNDb01PV3d4eHpnZTJZZWh3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ab387c-ef81-4f70-2dd4-08dd87001e04
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 09:27:53.2823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNvHQ5lxdsG93AZE0j8oB7OgH+/7DkNCVTvCUZdLk8A81fm/AZmtwW+kJbCiDaaYe8iA1aaG9kq+lyXEEsyN/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8540



On 29/04/2025 07:45, Robert Lin wrote:
> From: Pohsun Su <pohsuns@nvidia.com>
> 
> This change adds support for WDIOC_GETTIMELEFT so userspace
> programs can get the number of seconds before system reset by
> the watchdog timer via ioctl.
> 
> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
> Signed-off-by: Robert Lin <robelin@nvidia.com>
> ---
>   drivers/clocksource/timer-tegra186.c | 60 +++++++++++++++++++++++++++-
>   1 file changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index ea742889ee06..800f6650ebd4 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -1,8 +1,9 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
> + * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
>    */
>   
> +#include <linux/bitfield.h>
>   #include <linux/clocksource.h>
>   #include <linux/module.h>
>   #include <linux/interrupt.h>
> @@ -30,6 +31,7 @@
>   
>   #define TMRSR 0x004
>   #define  TMRSR_INTR_CLR BIT(30)
> +#define  TMRSR_PCV GENMASK(28, 0)
>   
>   #define TMRCSSR 0x008
>   #define  TMRCSSR_SRC_USEC (0 << 0)
> @@ -46,6 +48,9 @@
>   #define  WDTCR_TIMER_SOURCE_MASK 0xf
>   #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
>   
> +#define WDTSR 0x004
> +#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
> +
>   #define WDTCMDR 0x008
>   #define  WDTCMDR_DISABLE_COUNTER BIT(1)
>   #define  WDTCMDR_START_COUNTER BIT(0)
> @@ -235,12 +240,65 @@ static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
>   	return 0;
>   }
>   
> +static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
> +	u32 timeleft, expiration, val;
> +	u64 timeleft_us;
> +
> +	if (!watchdog_active(&wdt->base)) {
> +		/* return zero if the watchdog timer is not activated. */
> +		return 0;
> +	}
> +
> +	/*
> +	 * Reset occurs on the fifth expiration of the
> +	 * watchdog timer and so when the watchdog timer is configured,
> +	 * the actual value programmed into the counter is 1/5 of the
> +	 * timeout value. Once the counter reaches 0, expiration count
> +	 * will be increased by 1 and the down counter restarts.
> +	 * Hence to get the time left before system reset we must
> +	 * combine 2 parts:
> +	 * 1. value of the current down counter
> +	 * 2. (number of counter expirations remaining) * (timeout/5)
> +	 */
> +
> +	/* Get the current number of counter expirations. Should be a
> +	 * value between 0 and 4
> +	 */
> +	val = readl_relaxed(wdt->regs + WDTSR);
> +	expiration = FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
> +	if (WARN_ON(expiration > 4))
> +             return 0;

There is a problem with the indent here ...

WARNING: suspect code indent for conditional statements (8, 13)
#83: FILE: drivers/clocksource/timer-tegra186.c:270:
+	if (WARN_ON(expiration > 4))
+             return 0;

ERROR: code indent should use tabs where possible
#84: FILE: drivers/clocksource/timer-tegra186.c:271:
+             return 0;$

WARNING: please, no spaces at the start of a line
#84: FILE: drivers/clocksource/timer-tegra186.c:271:
+             return 0;$

> +
> +	/* Get the current counter value in microsecond.
> +	 */

No newline needed here, the comment can fit on a single line ...

        /* Get the current counter value in microsecond. */

> +	val = readl_relaxed(wdt->tmr->regs + TMRSR);
> +	timeleft_us = FIELD_GET(TMRSR_PCV, val);
> +
> +	/*
> +	 * Calculate the time remaining by adding the time for the
> +	 * counter value to the time of the counter expirations that
> +	 * remain.
> +	 */
> +	timeleft_us += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);

There should be a newline here.


> +	/*
> +	 * Convert the current counter value to seconds,
> +	 * rounding up to the nearest second. Cast u64 to
> +	 * u32 under the assumption that no overflow happens
> +	 * when coverting to seconds.
> +	 */
> +	timeleft = (timeleft_us + USEC_PER_SEC / 2) / USEC_PER_SEC;

I am always a bit concerned about possible overflows that can be 
silently missed. So probably best to make 'timeleft' a u64 too and then ...

  timeleft = (timeleft_us + USEC_PER_SEC / 2) / USEC_PER_SEC;

  if (WARN_ON(timeleft > U32_MAX))
          return U32_MAX;

  return lower_32_bits(timeleft);

> +	return timeleft;
> +}
> +
>   static const struct watchdog_ops tegra186_wdt_ops = {
>   	.owner = THIS_MODULE,
>   	.start = tegra186_wdt_start,
>   	.stop = tegra186_wdt_stop,
>   	.ping = tegra186_wdt_ping,
>   	.set_timeout = tegra186_wdt_set_timeout,
> +	.get_timeleft = tegra186_wdt_get_timeleft,
>   };
>   
>   static struct tegra186_wdt *tegra186_wdt_create(struct tegra186_timer *tegra,

-- 
nvpublic

