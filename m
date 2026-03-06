Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010016.outbound.protection.outlook.com [52.101.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59592264AB;
	Fri,  6 Mar 2026 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792909; cv=fail; b=BfCtqh7L+ptel8deQj43dnzW+DyQ9ZD36uE5xa9HgErK9kBeeo6kFPaSddUwF8XV3SjJfxA0PJZC4eA2p7dXTJfQ5enauL9djRFjhTMPiNjplMVe60qXZGlVQHXTukRPvUVYImPokF4FMhKtHrcU+UQyHpc9x+QRPrvhn6gJxf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792909; c=relaxed/simple;
	bh=rcZb3NzZ7TQE4Qf80WNmlkZg4sV747TZiprAkQNm55o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jEWmtRQW5oJVzyTQc9A+tjWp9h9xE9alVhXqY9QEqLQMwCSSg1HHGAwOtvu54QfjbC/uWuDYSlotkKEIdHYYABfrWUfXdhoEL+o7QRmnN+3Zm18A2KLW3mw3ZpoQOaaDBfmxp8P4X3BkdDL0pzzhTk6vEMWjUZ0U+UJ88N59vXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s3T2toce; arc=fail smtp.client-ip=52.101.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s3T2toce"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kL74G0QaxbDlDuuhNhVHHsljLZeLCtABd2pWd0w3LlukE+IyIWNbJS192687s0HKdhxdGJf7z/fhKbkCvcbVGpzDamBgXkrrceVPIrHVMDdoDHRv4zTsycd/pCcDbE85YEyS+/x42hztakhfdl73Lv9wCSeANy/RyvmCKv7HQPM1aG1TbJ6RcZaccBPDlAVcrBT7JKxJAvBRvaCfHyLIJ06fhm2Epdw2BavGti9PYEY0sGH7uHe6/uj/oAu8xEj0WQOqwQQF8G5QVj9NKp8PLhwskyH8qQHsF4OKl2IF3US0QDGMEHsgAz/p6oo5NA1sVqdc8baXHMub4kAQXj4Qyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKZrkh80OHS3KdfguwGZptLTOKwwXo5OTDV5WkJ3KaM=;
 b=xmhGTvCwLv6APsgjyZvpRoalBYSMJ4y2prJ+rRhWTiXHxmbEf0SjictXYLWdhDNOAajItilwVNQqSORFmpRQyQbWa+o6Mb7ZH5TnyOwsrCMvO/hLq8LzEEiSoxI+oH+Wg+9Gk8yctpxQawxSyfWB8lpaxhEbMl0s2g1XWNs5OIBRFOmTALEZhUYndPvk3qVnEl4q+ZH0Ekx05AEe4mM1ZllUgI9KS5aIQK2gFfb1A6AIUTVHCVqAhTI3Yd5qGicjBJLkCVL3Nh7yTm499xXFrzqsRc1AJ5w1wCXyCaW0v0NmjdEvo5pS7wFKyFA01GWxhGO+fZbmuyx8b1lWIjRGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKZrkh80OHS3KdfguwGZptLTOKwwXo5OTDV5WkJ3KaM=;
 b=s3T2toceUWx9jrDsUYwSoGwQ/y9swRDLP/zEvnaZskzw+7kyunFBmPVYgWbV3txlhbuJhyXYse621o0oRvQuUrmplFKzJ0wqpWdzftQ1wXm20im9kc0+oAg4o0omQdqTYQgjiDfEQoAAvQOQz+qB1yaCREfvDzr7WJI5COvtfJJjwhsR18lJdrborXl2L2wWOdbbmskRkGIjdHSgRMyUTOJ8gEnJi8UFI1RcaENS4UVQjIT6S3HFN2NK5el03kxR58/C5c91YCtKkLhCY2aniMFNpTyHAkWpAf3aihBneuPJIH4xyy3tECg3k/c+kVCqyqQyuVJeGYP+HyMCe9+QUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SN7PR12MB8817.namprd12.prod.outlook.com (2603:10b6:806:347::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 10:28:25 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 10:28:25 +0000
Message-ID: <13c618e4-14d9-4976-8f2c-a563281cce1b@nvidia.com>
Date: Fri, 6 Mar 2026 10:28:21 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] Add I2C support for Tegra410
To: Kartik Rajput <kkartik@nvidia.com>, andi.shyti@kernel.org,
 linux-i2c@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: ldewangan@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260129103043.148490-1-kkartik@nvidia.com>
 <9d6f1013-03e4-490d-b2b1-1b1d44b34d77@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <9d6f1013-03e4-490d-b2b1-1b1d44b34d77@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::18) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SN7PR12MB8817:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca5da2b-077f-49d3-5fe4-08de7b6b198c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	hCu5/yLlYoulLp93nVo4jJFc0Z0b9N7th14Pl35XQTyZiQBkJ2kOzttYslVfFIgNv2O6ueBPydCxG3V2q5aiVbm/fY+C3UNPsVyAgVjiuRFiViffgq7ydUMU6JXzLpq4Aa4Z6NsGpf/bsGHQV0leP+D9EtWm/WU5pKpVmL6tU6/5rRkXPuGsGUhEcE9AAqJI7ZCCYr82jEX/uiB142tv+sOXaV1yO+DSCErXvX/fTSE/ivXvyqVAJ1nVxi2NK6QE/p/hZQRsdG3OhlabFn7gvyRzrJn3w41T1/oSvi/rzPG74qo8a7uI+2X+lMDj6XKXekGqZC+kKsUZbN5c8WXTcf55pVzZllmTPk0CNV1ckcvu0Pyip0Unj+ksAM2h/BcQrb+k0qK14M5Bqlx0iNukkLDT2S+oj4sjfH/ONe5scvXWeDT52/xgxDogeTECY2WMHR6WainMJ83XItNbw4i94NwE5ruyTDHtGGyJtfcvg7CnG4NtYNT8fKO59HolY+jCDsyqFT5WC7CSrUi6cANEgblwOvW9j4FlzU+QbZEs0309HxIq0AQWJt05fsHOddEv3qP6UDxoOZWOBFNtGVLWrnMtzwFNOabM8a1pOB1mVCh0RYYlGVsPiV6eOfFLdUbg5ATqOVJMVaa2gvDv78+9teb4l1BpGolRp2XvxdhQvPBxe+cqL3/+2jl8TPaxGe3U/4QIzNoQLlje7m3cECPzfRZzx46nS7Wbnwe2kvxHYPk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGVKOTdMTTFzdndpMUtCSng2WkI2YlFobkxQZGI0cXBtamxVR3BvNjNDQmNL?=
 =?utf-8?B?SGhKTGJucUFkaDhPdnhrVm1FU21pS0V4TmJiZVZJZU1zaEgvS1lTWkZUOHNG?=
 =?utf-8?B?aHpxbnNsNmJBQ3lyWE0zWUxreXJWNXZ3QytWd2cxMmRXd2lvYlg1SmVkTnAx?=
 =?utf-8?B?K3J4aHdUbkVDVHdOTzQ5RUJ3YkNQUnU3cTFBSTRKYzc2WnBycHlnaGlNN0ZM?=
 =?utf-8?B?NWV4TDhpVHpKSFVqaTBIMEtNc2RZK1VMUmZ1VFV4QmdqdDRLN1NTOWl6RTRY?=
 =?utf-8?B?Y0VGSkhyY0ZZb2Z6aTJBQzBEL0pwVTB6SDRQYjcyVW5lS3FNaG1XdGF6bllX?=
 =?utf-8?B?a0hSS01vUFNMeHNweWZRMGIxdnUvR3ZxZFJDcjVVWFVLSm5YUUtNK0NJTkVH?=
 =?utf-8?B?Wk05ZXllanJIRXF3QkhkL1oyMDNJN1h4aHRYNW1nc3BncGx4aXVZdUlKMzkx?=
 =?utf-8?B?WXh0dGdZdzNKR3dtQ040L0xlZXdybCt1L2pBaXY2UUw3eUFtVkhPQ2RoNTFP?=
 =?utf-8?B?Qno1ZDJCRmk1b0xKVVg2MnBNVnhsdUh5dHVLdVlmR0R0bmhWcTZ4YTkvZXZB?=
 =?utf-8?B?UVlFWE1LSkVtSU5lRkU0Z1BodUQ3ekJoemhoQXRJaTRvN2ZUMnZOeVF0eUhZ?=
 =?utf-8?B?ZTIvNUhXQnhzUGtwL05yWXRyTmlyczlaTnM1RGhNcTBVMWNkOXFnWTVjN1Y2?=
 =?utf-8?B?S0UyQThRT2s1WUxFcTVCc0w0bDdYeVJCNUJhTmp5QUJiTEgxVGxkYTlXSlBK?=
 =?utf-8?B?U0hzZTdzUFIrSUlOaHpSK09CZFNkSnBVRWIxZWhUOWhYa1RsRVNWMCtaYlA0?=
 =?utf-8?B?bStsZEJyWU16YjN4ZDdTbm13UHZZMFdONFNIT2JOeWV3RjRpSEMyNWNhQlcw?=
 =?utf-8?B?RTIwMWZPdmdQQnNUT0lGOHVTa1BKaVdVekFMQ3p2cXB2ejdreFZram5ndlBR?=
 =?utf-8?B?Z3AvdTQ5d1hnc1pZWEtwaDJPOVpDajhrWGI2Wlg3ZXZoTmpaMzFUaGlZZTV1?=
 =?utf-8?B?ajRGakdMVk8vM2NxZVRYMWNpcVZqK3o0MC9ib1B5ZTUrSnBsSVdadW5XTVVE?=
 =?utf-8?B?b1JWK05RUmF2NDY4OFM3cUM0bVFORkJoYmpST2d4aUswd1c5amtna1RBSjBa?=
 =?utf-8?B?c0VRTHhNRm4zdURhREp6S2RmZnJSWWE5WmtJKzRTQzVSSnRoODRVR0c5MDB4?=
 =?utf-8?B?V2dqSEgwWXlSQ2MzTWt1YTRDVnhtc1lpc2tkL0Nnd1BIMVNJWkN2QjRoaHN5?=
 =?utf-8?B?bmNuU2lOdUJsME5sVDNmMHh6SW9wR29kTFhmUmpMcDBNSVZYTytIeGs0MDNH?=
 =?utf-8?B?alhKSG1yRkhjenBXTWZFdy9UT2RzblBybTdRZi9SU3FCQ00zRnZ6YzhOa2tk?=
 =?utf-8?B?bXByOXArejAzMEFvM21KcGc1TUJJSVhhOVpxZHFRd2dieWVpaVBMRnZnbFIx?=
 =?utf-8?B?QXltOVdWQVZOdSsyTjVyQk8rMFZVbk5HNlhrTklJRFlLblVIOGs5UjVPeldx?=
 =?utf-8?B?YlU4T2FDM1Vwd0pPc00wS2RWOHFVamFqR1FlQklsWnExOVZNeFpJajhTQWln?=
 =?utf-8?B?MlBtVmRCWkFGd0M5M0k1b05YMGJuM3F4V0RhYTFxMDQ3NDNaV0ZkYkxqVWd3?=
 =?utf-8?B?aWNPSTRSdWlsem96ZWhiQzByNTBNMS9SeXcwNE5FeHNXdldQMCtPSWczbWox?=
 =?utf-8?B?dzJqQlcxV0xRQStWRmh5U25ReEJLUnlYa093REpqaEY1Rkw4cUJqL0JlZHJW?=
 =?utf-8?B?UnUwRlFsUUo4VkpRSUpNa21SMkt3aDNvVFpNYUpUSmI1NTdpQnFwck5ZUUtm?=
 =?utf-8?B?Sm1idEVJajBlNk9BTDFVa0p0REM1VEY0OTdLeTMzVDBwYnNoTFcybW0vczB2?=
 =?utf-8?B?ejBFSnlxbXlkNnRuTUdQYTMwMjg5b3ZDUmZsVUZjWUlGbkxFMzBOc25oYUhE?=
 =?utf-8?B?NzhhbU9jZldPOFY4VVE5SExGYXM5cG16QUFlN2tQN0prQUxqT2JIMFdycGlJ?=
 =?utf-8?B?TWw1Q3c2d1E2RFE5MS9yMWE4VnJFalZWOFlzLzQ0ZFMwcE10NUo1bEx5YkVn?=
 =?utf-8?B?VEdzWnRXTWw1aVFicmJjYXcvdFBtWGdsekkreHlsZGdiWnVzWks5Mlp3UnAx?=
 =?utf-8?B?TFB4UUxxTkhCQWxoYVF0OEVQQllTNE4zLzBNWTU5cE1sdnROeTRIbjBSYU1J?=
 =?utf-8?B?SWE2aTZmUFQ0bHRWVHJDL05XTVBjbWJSaHVKU0NjMVZEZnk1M00vS215TkFH?=
 =?utf-8?B?Qm8yVHQ4QUZ5NnNmZ2dsV3IzakxlZkJWWHFPTy9ENnp1ZzRaSWZFN1JPMzhU?=
 =?utf-8?B?WVRMdjFkNFlUV00veUllek4wemVOSVdnVVZVOUZ5dGNCWXdhRm50THFnblRz?=
 =?utf-8?Q?0l0RU785yZAVcRn45aqeuoChnJqjL4KtKjhoyY2oYhV9c?=
X-MS-Exchange-AntiSpam-MessageData-1: Xvfgn0ULvJiTag==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca5da2b-077f-49d3-5fe4-08de7b6b198c
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:28:25.4686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JLQwYb9QjeeYRxTk4/BKMudqGsMZeD5nUNJ35wfrdm7DoYdQVSCP7vu7ShS7Hs+XHewi6JBDFW/CeUQg5H+yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8817

Hi Andi, Wolfram,

On 16/02/2026 05:17, Kartik Rajput wrote:
> Hi Andi,
> 
> On 29/01/26 16:00, Kartik Rajput wrote:
>> Add support for the Tegra410 SoC, which has 4 I2C controllers. The
>> controllers are feature-equivalent to Tegra264; only the register
>> offsets differ.
>>
>> Kartik Rajput (3):
>>    i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
>>    i2c: tegra: Add logic to support different register offsets
>>    i2c: tegra: Add support for Tegra410
>>
>>   drivers/i2c/busses/i2c-tegra.c | 534 ++++++++++++++++++++++++---------
>>   1 file changed, 395 insertions(+), 139 deletions(-)
>>
> 
> Just a gentle reminder regarding the latest revision.
> Whenever you get a chance, could you please take a look?

I verified that this applies fine on top of -next. If you are OK with 
this version, we would like to get this into -next. I have already 
posted my ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

But adding it here for reference.

Thanks!
Jon

-- 
nvpublic

