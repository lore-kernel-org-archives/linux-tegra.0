Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012052.outbound.protection.outlook.com [52.101.48.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0362646D09B;
	Wed, 30 Sep 2026 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766427; cv=fail; b=EQmc71/3KsIqi6FPuXPN/XoAPJezgioaJ6dvnb3DdCYBx9Mjz3meWiJm25cZ9gpESpZhf8R2PqVOpxigYAo+llv9aA1+EkhfDfR3qIhLUo75Gw7qaMxNcOs89dA3OSLpnqV3aqfRRibziW/jZOAB4nB+brNFDJfPQs+asszAfbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766427; c=relaxed/simple;
	bh=82ML+GIFHKRq7bOewstVgPXYcXIHxHOmakbXw48u2Q4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=orSeNtWYv90w7n7gmeuVw+XJLIBUm/T2zKacO9BVm/DyZU/aKsRxw64SslwBy2h+dpoKMAmV48a6ifYyOoU9+mOYcPAbvbDKtdZyYQ4QYWNRI3BRz/1MufoyW/dg0AzzKSAUuiczW69J3TrxExiO4vHHf0O/w44sMNACxXu6BxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NlwuXi3W; arc=fail smtp.client-ip=52.101.48.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NlwuXi3W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZoFwnWuuFfXXB3NQtBRWUbCH5Dr4RgW98dGX+Jo9P7wIvtICyTtPXx2pYQiE1/luZR8fZylVeEDZWY7r6Nk6zoNZoj1RCsKeYHzuttG12GCqoN7FspNA2p3aYDKQDZWXM/MNAeMzd97tBL49PfgY++SwC+2u03UmsM2JwChPqDLX6VydIdHaBs1Cs5m7KUXhd7BHl05lMDHQIByXn23e6Gyuh7Aju9w6jSAACTW7o2Vdyi9xLdRji6pazEpueh3i2i3+oxrKU3IHxr49hMNmm9aARJr2KlzytsBETAn9vAUojnQVvoS5kRIAct1hy4tIb+fKNf3QgBD2gV37ERw8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddWAe7wiJRNvCIo/Sq8XinrStqH3W0H7BnTICMDckVM=;
 b=IVoYoFjYCMLB+Yn6XiiQ9ARfucqmkyTMcrq9VoDicLByqfIxg8ZGnFxqjwL+AveMccKMmabOhPNr+LXupZJbw25IyJ7YW8RKnF83/8/2lFOK0t7EUlg90svjowHKiTAwlhk/3AwXE5ujUBjMG7nyyzBktWdeXv5apgnvaRIW/soAyrOt931PQ04qBcC5OgnKl1IZoNv5FD9Tt9qzRlDkQjjTvPs8JQgQoD4HjsAt26D5bHiUkXq8JN1zsP8caJXQ9aZ21BErRix9E3wsCk0yhJqdlAzFxePsx1kVoOVSxQZ/A2e4bgoV2OQ9x+IMC6dZ3BEYAKwak64SVP5KEsQvjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddWAe7wiJRNvCIo/Sq8XinrStqH3W0H7BnTICMDckVM=;
 b=NlwuXi3WkgZu22BGbIEuZuv9+NzPSVK1uXkKhJvEvWZODSKdHU/leQX9TzP09PWi31VMabOQHJqL5HLQTUcqo6351/yFPfeUe/aBTZJEpNy/y7EyDYLsB/m6roCuwAwJH2seTH5VyB7pkWV3TTBy0HBbd1Mm284sGBeu8p6xrTVvGX4fCjSGQaP5RNRd77+M/cCq60WkfzoGGKepF8ZMbzDxNUMHWi3F6mHEArT3h407rIQliOvj+BSEJPBSRFgnhZ6K543FyFqb32NWx8OBzCATxvpUPwUuOxhtPmW92kSmZgIpf1MPXMmWWdxn+zzfR8rfPJbwRR4Djy7x6POg5A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by SJ2PR12MB8740.namprd12.prod.outlook.com (2603:10b6:a03:53f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 11:06:53 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0451.014; Wed, 30 Sep 2026
 11:06:53 +0000
Message-ID: <a357d768-c687-42f8-931e-e9fc9faeba10@nvidia.com>
Date: Wed, 30 Sep 2026 12:06:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] clk: tegra: bmp: remove kcalloc
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Thierry Reding <thierry.reding@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be|_ptr)?b"
 <linux-hardening@vger.kernel.org>
References: <20260929192437.27775-1-rosenp@gmail.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260929192437.27775-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0028.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::8)
 To PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|SJ2PR12MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e2f56a7-aab9-4653-dc1f-08df1ee2eefb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|10070799003|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ksn8NnDvdOvgxHc2f7uErU+sh4hy33XFXOc7NV82rWJ/JZrrPLJ8X314KlE+9Vr/415hkGOMdUUD+s6vnfC6dlHUEAMuaMxsV9lV36io3Zdh34/jsjUp+wzhZ00B5Ez3DuPuMDYmtr+VNUfJPsuZGt4ovDQ+HzUlPxSsdBuL8v0tW/xXBRx1qup96yw3iN4QmoHWx/v2AR/5TzXULcJvterWCMZ0PZls0KahJkpkFdNzpdwglHt+X9lsno6NvTTf+VVl4QuE6ZvyyGsgzQHpIPuWKF638eO6syBVv9ztPzZudQertUmzy/+3qex83gV1CHVa/XXdZeZ5CNOcRGQ0m4/G29vriGiNYQxj8rRW3+afyqTJ6NNbMxuhLZm3dDwqNhqYzgm+ZrZvTZi/ECBQBXiyvRwjdJH1rCemzmhbL7brlIhCD5e4mvKewSuuF6L/AxDIx34LWP3mcfv0M2QImFRnUKW97tTm3kkklmjOSK3+9QtHVgWkeZq166Fk5EwIhjAbXsE4V5/YFjb/xDRQijv/nSVoGGjPcKo95FefN5ohZS8CjypXKnBNH93wkGcdTKkVU/AUZOkNhcethlyVOLU84h9T1dShpjjzIgKWuy2bSvVhDMaQk1QCJ1I2jtfJRtvehiCZ/2wE1/3hE6ZnN0TLmO/UqyE3H9KcvpjD+BA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(10070799003)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU1TSXovM1U2ZkRmQXZaM2xxSm8yTzZyMFFZYWJSMEFpa3htNSt6M3pqNlc0?=
 =?utf-8?B?cFZSYlI2YVkvTFN0Q01kd29NL2V5OW1wZ1UwVHlaN3lzZlFjUDNNczd1RElP?=
 =?utf-8?B?d2hRRFp2WWVJTWxNSWNzTG1BNFdqTDZJYUI3R1E5dmhnN2ZRQUZzVXV1aEZF?=
 =?utf-8?B?UnNpenV5TXZYbHphblFvblFURHA1VnhBa1J5czlCNElOdzByeUNjR2IwclBH?=
 =?utf-8?B?TlB3THVvZnhONVVzM2o1M3MrNDJFRFE2WFRhWDVSSnAxMzVPaWdwbkxYRjdE?=
 =?utf-8?B?ai9seXczUThIZkswM2w4REVGTjE1TlBCV0d2dFRqK1ZEYTdoVTZpei9Nc29s?=
 =?utf-8?B?SDNLbmJtTmxzVlBUeTNwWVI5RzNoT0dBOGdaZ2gxdm00MDUrWWF2Q3dua3F4?=
 =?utf-8?B?eFdJMHNuNWhFRjZETG9jL08zVUN5RU8yZXdLQlpLcGJ5S2QzZHhwbzNaMTdG?=
 =?utf-8?B?NEtrWlhIV0d0RUhPdTdSd2xHeUJ3K1JZT3RkYjNtdlc2RDhDc21HZThrbTgy?=
 =?utf-8?B?b0puc0pyVjVJT0oyZWR0REZXSWN4YzFMUnBzZUZjSFJja2FaZkFPcXdiUmJr?=
 =?utf-8?B?Uy9BdDliL1A0a3JmTXk4cHJBVy9kNDVjWWhFN3M4WWY3OFRvbUptUlY0OCtR?=
 =?utf-8?B?b1FKQnYzVHdIdjN4VkFXWjdiTENtUFdZeU03akRIaEhPNjE3dk9FNFZTSnl5?=
 =?utf-8?B?bHVZbFBlUUdzTzVydFJkMTVsbHJ3aFF5NWxxTWlHVi9HVVBNbmhMZnRCdXdH?=
 =?utf-8?B?QkNSQWhiZHJ0M0lMeVJ6cUc3TnFGN0VPbUlXd2tDLy9MQmhhbXA0anRoSFVZ?=
 =?utf-8?B?MW1rRnB0L09adExOU25oNTVoN0twc1lJUUkvMSsvM0ZSWnA5Z3JYWlBqWVR6?=
 =?utf-8?B?d0FaUDlYV2hKNUNyVWovTDh0QlNFMkFuUU5SNG1kcDVWY0lBSW1mSHppakRP?=
 =?utf-8?B?TGFmdk45eklwVzJtTlpvMXkyZ243VWVNVnJ5dTNMV2tyQ01UeDh5SVpncTRl?=
 =?utf-8?B?eGRPN2laelJUK05tb3phUzU3bWhNMllOZktaQXhXME0vWWowMlNZNUxQUjFH?=
 =?utf-8?B?MDQwMm5UYzJwWEkxYlNiZTFSb0F2Wmt5dnRhYVVCS2FwUFdFWFgzK1k1MUhB?=
 =?utf-8?B?UURCWCt0V2ZQU2RwRHZFLzQydk5TSFVJZHVQc3ZiQkFRbTl0ODVzTHU3Y1B5?=
 =?utf-8?B?RWhySU1OdkJSSE1TN2E1eHFMeXpLV0tLdlRrWTBPL0J4bjI2OWFSdnJYeTFa?=
 =?utf-8?B?N3FnUTRkdlZjdDlKMHB4YkZwOG5FRVJnb2ZPMVhRaC9EMm5nZ1p1azQxN09s?=
 =?utf-8?B?d0czWSs5Z1lPMUFmTW5USFU2TFFYaUt5SjF2UWtiT2hlQ0pVZHNJd2xJQXc3?=
 =?utf-8?B?cWhwTG5FUTYyL1o0RjBQak1TcThHRUh3Uk8yakRZZ3Y0bFQ5cFFJYWxpd29L?=
 =?utf-8?B?NkUvcUVQQWsrVCtmdzVtcUtjYkplbnE3WExkMnI2N3hxY1A1T1ExWFl6Zy9U?=
 =?utf-8?B?dlMrTHgzMFZPUDYzREsxdTZqaWVxMFB4dE9WTDQ2K1d3ZHpnNlo3K1NDWEdO?=
 =?utf-8?B?d1Jva2xxRW1jYjFTUlZWZnFUbGd2eHVKbFF5TFVSaUFManJNS3ZDaWlsM0hP?=
 =?utf-8?B?WUNwTEFuZzlkTjFBV3RJT1VOb3JkMVlsOUdHZDFGNktiMHlWajVwME9IRmRS?=
 =?utf-8?B?REtKdVNrbk5mZUZ0RVB2LzJRR2RNekU4WG54QU14Y2dQemk2Y1JkdkFxMjlP?=
 =?utf-8?B?Sm1uMTBKMkYyaHRJOEhSaURRWjZRYUJicmlyemRnY1FLSEJVdkFCQVo5YnFH?=
 =?utf-8?B?NkhHVjVXa1BqQm1hMTBvbjJkVklEa09sM3FTNE1DWjAvQlpmSTFJRkJHSmo0?=
 =?utf-8?B?Vk5nOVBDK2ptR01ZVWRud09OZzRnRFBxaVFjc3NaOVcyR0lLQlpYVUxsMEhW?=
 =?utf-8?B?elR5SkdBNnJkby9HVjJvYzdCcHBtM3JVUGVRZXpzNkQyRXk2UUFzb2dXTUdn?=
 =?utf-8?B?dTVYTlJhclRIcElmNnV0OFFHdjhxaDNpMytzY3k2eDhudjlobUxidEpURzFV?=
 =?utf-8?B?Tm1MdkJCUmREczZTNmp3NTIwVkhHd1JHMzlmS2w3bDgwUFJQT2kxekZrZ0Ev?=
 =?utf-8?B?ZXZKb0E4Wm93cmZVQTA3T2NrUDJMSVRpRDJhamhwMXVOcU1uUXJkcEVaazBr?=
 =?utf-8?B?a2F1V3hIYWVPVGdyMVlYWUR0TDcyaGpHYXN1UkdLN1VuSG41Vk1sVGplRjVW?=
 =?utf-8?B?RjdoOGljSWU2S3RCL3hkTHkrc3drU2dKVWt5YWRNVHVEUGZxNEg1UmF5QytF?=
 =?utf-8?B?bWdVR1Nxby9jUFRnMDgvU0h4OHMwRlNLMVRaT1prWUlnQnBXd2ZwenVGUytR?=
 =?utf-8?Q?6sFHshmDYCAIl9o+MnCcASKsgv4Ez9U162LBkpx/GKQW0?=
X-MS-Exchange-AntiSpam-MessageData-1: W+JQsveoPXKCag==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2f56a7-aab9-4653-dc1f-08df1ee2eefb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 11:06:53.6458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enBYmFOszSk4zA7sC9LzvQIMWH/7QmBZT8Sd11OFMMVN5RMTUYeSMusOmw2hduHXRVAdeRXBXQsH6VmSDuekmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8740



On 29/09/2026 20:24, Rosen Penev wrote:
> Use a flexible array member to avoid allocating separately.
> 
> Use __counted_by for extra runtime analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Please fix the subject prefix, it should be 'clk: tegra: bpmp:'

Jon

-- 
nvpublic

