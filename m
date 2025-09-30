Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010006.outbound.protection.outlook.com [52.101.56.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAE43043B8;
	Tue, 30 Sep 2025 15:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759245207; cv=fail; b=TUYYa7GmtWOauNKDG9O9LrKuqpkGXJUwO6V6vb9VkhGzkvDGnx9TWFFXV1CWd0VvydBh6gqD8mfB02mXEr/+DE9j09K2JQdnLGjopMumnrCy+A+Gyvx0RDBWAOylblsfhWnwO2o3xTv3v95+lA/4zhMpuGXmKvuqQAWbzirjRMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759245207; c=relaxed/simple;
	bh=Las3IO+3hwDqv7SH84fzP7rJG0F66kyDrfa5GCA2RpU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pO5sVX0L5so+cjNWTP4Yml5M10qoMJon624Jnf4ZJmrAWXzMEW0D7Yamo5pJYFMabddwQObYLVC3kQ8ilHCDSyKQPFvK5mZt/xfGxE9tiBRP9heG7NPf7pkY1XRGSoHonjJoyTXXk90QzA45Hc/scFkLviQZu49poM2cFUfnLTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z39ZZb5H; arc=fail smtp.client-ip=52.101.56.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z39ZZb5H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Okcvar9ZhMdbb2iCEXrwA+9TsK3ZR41A1pdYQZ+fnYZyWLmqmF+4P2YXKLgLP3sZNzGlDTMnicOVXbblN1Al1MDYLEdkVuD/hs+s66dtXcUMlhc183JSXLhiwHphtrXDOYtVQ76t2tlbuywLaXpxcdrIPxMirRCwc/6WdAdQ2zULPgsKXQ7EH1KByVWYphVP3bxSPyPdarsWzUS4hYCrswWy9gzDEhD+cH95JaIn2AbLtlxfKuZ6zYcKceW7icITNUjAz3i1wosgHMRE/ma8mtW5EErlenKe3RUuyBumdl01wSa+JNrgLwrzQjfHOE4Nn7tWy6G+YIyjUcjdA/fwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FywxxbH4fkQCFFNMZz9SLc77GpqcukMToQ1uA6VZAU=;
 b=Q6Y6P7Fsz85MXtsSpu1Z0b9xt+Wf/WZrEJi0PSrzYCvZA8TU+yJxsXQD+0btlHUcqP/U30U6YhspptaSDThnRByxVmZjHY4QWQjkSU7Yr4gaVm9htmoT/fPGgbONpzBMM4xdQMPFiTIhzcO7w/UwLbyzctCNi/vXwbA2ESYypkqzkjnLltM0JiEOeUUe79zmlnyX51x6ph6OhSR7g3POeDH8SG8E3tW3DwPEasfH63G7MbHEclmscq3AOnvX3WFMP+MCAuayhVqAKhmZI9D+xDvHriQ8SfCT3vlf7fYEieFx2g68SUbuAuEJFcQv2TPTIGLaKpLrN8LDC0qKdeNYNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FywxxbH4fkQCFFNMZz9SLc77GpqcukMToQ1uA6VZAU=;
 b=Z39ZZb5HYU/oC8wCbKdzEt+rr+PYy2iYF26SOSNxwhfQ+c+TNXCrQrJ7j7PPKeOEcFSsktQ52nl40ApGmnn+LIELHSsklFJWt2Rn239T9SQLrv+iiwnIr5dTZy8P/JplstpfSQ5hPh6IgoofJ5Lwd0ECXqTH1XwWhC9Lj3G6Z/SA1YN3o42FgAlo0ZliVVFY8Xbar3vHngZuFiSXfM5NzcEyE6noEU+g493EXQ4NbetdaAyVqmwaZK0CfQel1/T12p3UYkjZ0ljlKjOOQhlUCUSPBjPwCE2Ry8ZL/jGwbB8RCzcGZ4pZ7OobuyGT9FcDzvUvFpweYudrov+TyHChWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH3PR12MB7572.namprd12.prod.outlook.com (2603:10b6:610:144::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Tue, 30 Sep
 2025 15:13:21 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 15:13:20 +0000
Message-ID: <9a4e45df-785b-4620-b86b-92f9121d9dbd@nvidia.com>
Date: Tue, 30 Sep 2025 16:13:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: tegra: Add pinctrl definition for PCIe C4 EP
To: Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Vidya Sagar <vidyas@nvidia.com>,
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Gautham Srinivasan <gauthams@nvidia.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20250919120920.158497-2-cassel@kernel.org>
 <aNVlhjAcCnGI0ziT@ryzen>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <aNVlhjAcCnGI0ziT@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::6) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH3PR12MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ad4ed5-515f-4961-fd0a-08de0033e42e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTZycU55bW9WSUZ1enJ3Lzg4Q043RjZxM2M3aGlvZVREQ1Y2L2ROZzhYbXI1?=
 =?utf-8?B?OTJ3KzNuOXZTRjZwMVlNYnZ0aXJhY0VFcml4OStySDBwWDNtL2NlbEJxeURM?=
 =?utf-8?B?VkNXT2hEaGRYUmpmT0FiWW5XbmFETXpIcjRzYnJxNFBsV0p2WjFUUWw1Z0tG?=
 =?utf-8?B?Q05QQ1JEWTE0NXFVTGZoSWZKeXFTb1IxUmdPZkNlQnBKc3Y3clEwSzE0UXJ0?=
 =?utf-8?B?MDc0QUp1NVFDNXg2WDVKQWlYZFhrOExldkMvNjhaNFJhTkdvN2RqL0REOEFG?=
 =?utf-8?B?aktBQmViM1VVUU90T3VKQ1B4UHB6cUFZUVVLNi93bGMvT3Rnc20rUEptc1pt?=
 =?utf-8?B?UzM4T0ptWHhnRC9POEc4N0VHUkdnRVpWWmM0SWhmU293VHRzbE1Ja3ZNOTEr?=
 =?utf-8?B?U2hkUnU4ODY5dDVHT1F5ekdWSlljeTRYYkRNSWNyclBSaTNWN0pUSkpMYW9G?=
 =?utf-8?B?Yll2MDFWQ3JWQUdvM0kreDRhdkdGa2IrYyt3MldEalVPYnk5YVR2R3NPdy96?=
 =?utf-8?B?M1J2b3R1bCtON2wxWTVsaW5FNDZDWk9XREZIN2JhcXJCcXpic09PR08weS9P?=
 =?utf-8?B?Vkx5UStodytpY2xmcmxScWVINCtJYXp5ZFFSZGRkaDR2QnVqc3dnWVQrWnpQ?=
 =?utf-8?B?bkQvaG5oaEtmMnlKTVZIRExwcDZmMXFYRVkrNUkxMFpheU1IamtpRWdwZFFK?=
 =?utf-8?B?WWE3aEJZcWFWRUZVKzlSUS8vdWpGYlFsZEd3NHh5MUx0MW9UeHl3am5LSHhw?=
 =?utf-8?B?WXIrUkZFaVZOeitnSGRRdkxRd3luSzhZZHFBbjlXODczT29HMHBlandwRUxE?=
 =?utf-8?B?OVBlaWcvemEyZklCTUVaTWJhVnhZTk9SNi9oNzRmekpQRi9tVkJpbStiUFRK?=
 =?utf-8?B?K0s2cUJyV3JYNHZpYzVnaFEzSkxFWWJEak9lOUJNYXlXV3dvSTBBU00yazI0?=
 =?utf-8?B?RmFxS1Z3NVdNTWpBdGg4R3lNczhPZUkzZWtQQi9SRWRobG1yTjFhYjd3VUQz?=
 =?utf-8?B?aHlHZDFJMUUya08vUGxoQ0tyQUlMTVRmcEo4VEJHVTJadEFSbGZBUm44YXNP?=
 =?utf-8?B?S3lsNU8xcTFkdTc1Snl4d2F4ZWFVWlJSREZOMWo5dWZqN0pZbmp1bHBuRFpM?=
 =?utf-8?B?aUc1TVpwSWsvcGsxbTRDRkMrS05YT0hZU25BMGh2Uk9xVXZrajhUelpvaFdP?=
 =?utf-8?B?SUpjc0ZmeEtSTFdqMm5HbHFxL3pYTDJOYXIrbitqVTB3N1NIRUt2Yit3UlZz?=
 =?utf-8?B?TkZxM1ZnRkxLRUQyMVdJaHQreW9Ea3BkS0V6d1pNenJ4NVBxOWY3MGIxZWQ3?=
 =?utf-8?B?cUwwYWlOSzVwMXN1NWdPODhaSFB2R0Y1akprQ2NTdmVRQkdGZEJHc3NvNnNB?=
 =?utf-8?B?MTdyb3F1bTQvMy8zU1RtVFZYVWp5NGRMRDlCMUdRWTRLejQ4OHBycTlYY3cz?=
 =?utf-8?B?OVhlaEIzZnhtLzlHbFFFTEJvMGdqcEd6TUg1SlQ5WnJHb0xaTlRJWWxLdk5O?=
 =?utf-8?B?bVZUYXVRQTBQUkduS0FHVVV6eHgrOFQ0bUErcWU1Nzg1RHljU29NTjFkRlRF?=
 =?utf-8?B?QWpHNENBMkN1djRrY3lQUkdqaG1mZnZtTFlKTlA1bTVZZ04vbzN4eFlRY0RS?=
 =?utf-8?B?YnhhTFRjZzM3c0szNkUvSkJvbFo2WW1aWDRQdlJvTlplOTd5VmpRNDRkL1JG?=
 =?utf-8?B?MHBJRHpjb0hwZDlpczZMVmEwTWpyWXZOUTRkeDhxU3RORFlSbWFVV0pGcDA5?=
 =?utf-8?B?T3FIV2NLQzVLZUR1b2JYQUxHMGZHMDd1Wncvcmpaay9VcGZ4WXFNT2dndU1D?=
 =?utf-8?B?UEh5ajQzZFVGelkwVDcvVmx4OElEZWZYVW42dk5DZWxhU0lCelFwaUNETmJT?=
 =?utf-8?B?M1IzYmFaRVZuVnpsejEvRnBQVWxCTVlLRzFNZGdxd3ZNWjJiQk51d2FDS3Bx?=
 =?utf-8?B?SFFHbmgvVHUralhFSXFYRklnTDdQYWZxS2dZblV0UzVKWUpKRCtBUm4welJL?=
 =?utf-8?B?eW9BMzJiYWJ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzJRSUVnNU5WZFoyMC9DcmpwQ1A4czlkL0MydllxZmh2eGpXdXZXMG5pcDJG?=
 =?utf-8?B?aHBPcTA5SUprN2Z2VGtZRFpTSVViOTVFZWwyWWZMaW54MXpEZWU1eG1tUEFC?=
 =?utf-8?B?c3c3SW9UblIxNnZUZzFuRXp6RDJ4OUUzY3g1eW1xanZVZnZlMERVdUMyeUk5?=
 =?utf-8?B?SGdxOVpMVVB1bllPWS9OcmJvYklMVUY5ZTFIMlViZjlWWlhBMUM3M0xiaHBj?=
 =?utf-8?B?cHRQNG5iUjVSbHFHWnNiSGtzcjllTEdXWEdWdk9jVmM3SVY2Snh4eDdXZVBG?=
 =?utf-8?B?YndWUWE1YWtRaWRuMjRBRVBwbGZjR1A1cHlSN2NmZkNPdi9qTGpCd1I2aDlD?=
 =?utf-8?B?RjM4TDJnY0xtZm9SWi9EcVJmSXlKR2h4TlpZQkpFeU1Ka0x6cUEvcEs0aFZt?=
 =?utf-8?B?RnRhLzRjejN5UWtxUU9FUXpFc3pvVFlCdnVrMk9yRDIra2VuRGhOU3JUbWd1?=
 =?utf-8?B?cmVlMjR5YWphMlNQRXRyVTVFdjRFZHZWZWNaNHE5K2tLZG8zRVlHUlVTbHNP?=
 =?utf-8?B?QVk0UFI2Z0RKR3FDT0g2b0RzWSsxSEs2RG1lVnhvZUc4MDExaDErbkpFMFp6?=
 =?utf-8?B?SjgxdnhOMUtMZXVTdzBzRzYvQy9hcFBiVTR0TURVczNwd1JSS2hVbzRpMENq?=
 =?utf-8?B?dlNWMmhJVlhXaEx3b0YyZ210Skw2OE9YYk9Pa1g3emRNNG1VZTY0TlRtUFEv?=
 =?utf-8?B?WXB1bFBCNVA0bUtXZUFVb0lSMkk3aWpyVnlzSUN3SXVtZHd6MFFqQk8wM05l?=
 =?utf-8?B?OWdpdkovNnlPWjAxVlMwVDRoYlJXSTRVOGpoeUk3K1UxZHZobkZHZmhrRVF4?=
 =?utf-8?B?UDNQMFNYZ3IxeTlMZUNlc2xFcE5ZdStUVEk3aGFMNFNQSEc2TXJzVWJFYlEr?=
 =?utf-8?B?QjE0alNhRmhraFlZS2JjRGhULzJIb3hFa0R0MEZHSmZvUVJCbjljLzhCWGRV?=
 =?utf-8?B?T0tUY1NsZitlV3lGVWJqU3dESHNudFNrTUV5VDJWcm5TeUxGUnRPSFkwVUVh?=
 =?utf-8?B?b0xNdUs3ditqWUM0ejNkbTBIKzZxUTdXWklyUHBLbnhLMm9PajVOYm40NVdR?=
 =?utf-8?B?SlIyekwvUE9uOVdpS3VYbTRaUHNIdjFIbCt6bS9KcXRTR1VhMzBYUE9kN0hn?=
 =?utf-8?B?QStIYnc1YXUzQ2ZzejZsenZjUWJEZmhhVUV4ODZkd2RuV05iYllzaE9rTGF3?=
 =?utf-8?B?RVg1NHdjUDN4czhnYjEwWkVSb1NGSkdNNkhESld0YlJEbVBDWWc4T0E1RmE2?=
 =?utf-8?B?Mi9iWVZXTjRJWUpoakpKTDBMY2hOYmFKTHRtdTU0Z21LQ0lsTFd0M3AvK24w?=
 =?utf-8?B?cEFNUUc4RDdLSUpUZ0RtNHZQTzdsZmpDQWNwa0JKazlqZmdhQmF0emY0S1Ax?=
 =?utf-8?B?ZVpoSUo1TjBOSlNJd1Ntd0xPWUdIbmdSeGRSMGUxV0o5WlhvTE5peDgyK2l1?=
 =?utf-8?B?Nmw3Wld5T01RcHNyQllLNnpTU0tFNlJGaEIxNEtmUFkzcEtNREUvaGJscmJo?=
 =?utf-8?B?RHdnNkNEQmdDSUp1Wm1pWWlBellyMmJZVUp6TEp3MmJCZXdMUElFYTg2bFRs?=
 =?utf-8?B?cmIzQmMzYnBwcktVaThGS0pXZjYwdld2cUtWd0YyMjhycXRxNE9MeU5KK1hV?=
 =?utf-8?B?V3BNZGRlUFgrcHlZOUI2TFA1T0hRZ0t4SXRZVHdodThBVStOQlJzQVNBVis5?=
 =?utf-8?B?WW9GK2lpS29Oc0FOeTcxNlMrODNDR0M3emxhVExoek43OUxvNnJZd2sya3RV?=
 =?utf-8?B?K0lGakRkRzh6c054QXB6UVJ6Vit0RzlsOUN6NkNQNFVIeW0xVmZodVVha0NR?=
 =?utf-8?B?dzYvRExPTE1iSFh6S1ZRTkdERVgwQm9EQTV3R1lma2NuUVoyalR2aDZUS3RV?=
 =?utf-8?B?RXYrbDh5QVZXU2JEVDY5Q2tJaHBjVzNFVnUvdU10OEV5Vmw5K0w1Ky9GeWo1?=
 =?utf-8?B?cWt1UUhSbWYwOEd6elY3S0djY1c1d0Z6WWlVV2ZxNWhGR1VwYUY5MVFRdC9X?=
 =?utf-8?B?SXBUNGNTTkM0NFRMeFZIUUpuNWFOczdCSVNTdCtxdTJqdGFETEhjSWNrOXh3?=
 =?utf-8?B?dllSaENNRTFmaDV5cllhVS9HQkcwNUdoOWlRUXhCOTRYN3NnTHlPaU1qMGVi?=
 =?utf-8?Q?4XuSzffi93MJDfKQ3jredlvt9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ad4ed5-515f-4961-fd0a-08de0033e42e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 15:13:20.8322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mSM+8kAx0nz341vN7ir6XXv6x3VjTgW/cevamtOPB0yGVCh9ylvG3se9rkQ+XmZmawfKGE/W7jTpKUEjbm6Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7572


On 25/09/2025 16:53, Niklas Cassel wrote:
> On Fri, Sep 19, 2025 at 02:09:21PM +0200, Niklas Cassel wrote:
>> From: Gautham Srinivasan <gauthams@nvidia.com>
>>
>> Commit 0580286d0d22 ("arm64: tegra: Add Tegra234 PCIe C4 EP definition")
>> added the device tree entry "pcie-ep@14160000" for C4 endpoint. However,
>> it missed pinctrl definition. Without the pinctl definition, the C4
>> endpoint of Jetson Orin Nano does not work. Add the missing definition.
>>
>> Signed-off-by: Gautham Srinivasan <gauthams@nvidia.com>
>> [cassel: Add to the existing nodes instead of creating new ones.
>> Remove non-existing nvidia,lpdr property. Rename node to match dtschema.]
>> Signed-off-by: Niklas Cassel <cassel@kernel.org>
>> ---
>> Changes since v1:
>> -Remove non-existing nvidia,lpdr pinmux property.
>> -Rename pex_rst_c4_in to pinmux-pex-rst-c4-in to match dtschema requirement.
>>
>>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
> 
> Hello Tegra architecture maintainers,
> 
> any chance that this could get queued up for 6.18-rc1 ?
> 
> The device tree node it modifies pcie-ep@14160000 is marked as disabled
> by default, so there should be no risk of regressions.

Sorry looks like this missed v6.18-rc1. However, looking at this some 
more, I believe that this is applicable to all Tegra234 platforms. In 
fact, I see that we are also missing the pinmux for the other EP devices 
too [0]. It might make sense to add these all at once to the tegra234.dtsi.

Jon

[0] 
https://nv-tegra.nvidia.com/r/plugins/gitiles/device/hardware/nvidia/t23x-public-dts/+/refs/heads/rel-36/nv-soc/tegra234-soc-overlay.dtsi

-- 
nvpublic

