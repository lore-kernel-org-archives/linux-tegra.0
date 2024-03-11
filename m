Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51010482CF
	for <linux-tegra@vger.kernel.org>; Mon, 11 Mar 2024 17:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710177205; cv=fail; b=nNGh//QaD0MebShYTy/FmWRU3ZTdv8Li4kGWM1heKg1lRkXM7x9ybTxM3Ms6bRQSbwKIeUM6qV6zmRM9WUJQThvvGzV6ygWeokg8m7ZLF8pb2po8e3XMBrskAH/4sfCS0/YqgO0HJjfUiPIBsVloeSkY+s0d+04jaqA+9SNU4k8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710177205; c=relaxed/simple;
	bh=RndXgmz8VBf3FMbd2z1jWUQxDF2lza8TlQIWCbOOglg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mbn8sOGEsBzLEnmd8Z9NBV59Bcy1e8eRLpGh0exlrPy8LIAW6EWjDKvNWgFHpCpWmL1QDUy0ent9Idt/qCvndsUMCqE+8iHxgKGYNn/TJYAwkf/Q90fPzCQpeqGLuP5hrTe1CAzULlUXG4zkeoMCLLV5KmIdMgCVxV+4vK4vV9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gyH+vUax; arc=fail smtp.client-ip=40.107.237.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gyH+vUax"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W56Azuvv0Rk25eO3009EE+4ZsJ5XC0wTQN9d1AFycnfJ5M9cx1ZeFV/h6C6Dvj9fW96uVG2yqlxcfBGpIgAXy8o8Rpe41CFj1Kias4IsUzLOKXBh9LwQ6nPUIKqG0B7WJVNqv2hR0XlHY/4+z+96yRSPvrXxISrKYa8VyEv61FKDoLluO7dJM1EoENL3+InP6kByGBYooo2mZSAEH5mcCfBqy33c8Vi6YByWfrTHrOoBxKIuuhXxe/IFqZp63jymNL8eLE3TFss7DqII3plWGHktvQxCyIz8eqU6p089I49x4yZHI9z3CWI7RfVDTRnvSbF81oAUQ4QhQoSKgLyWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCIB5LeuuZt4hpO6huNm78YaBqIByrdqcsbDpFdf4Yw=;
 b=jPqqvJmsNwyDV6NUde1u75u1+P7+IgN/shzmA15JMoepwE2R3Dd0+Yjb05Cw+ZPY5D49+xJsCq5dvBl6Jxd7RjQyNLHAhSHxYt38cTYA6Xt6rxB/51JNK11htmjd2cXiO4xr/3fqyLdjfOjUxXj25dAc3H4RJgS1lHABLm7bKXA1blxg3Ome93aU+Iwsyr+wmHvKJ2bQ08UVNu5uy/DkgdCD8WqsLxxvuSzxtIrx0F7tfS1Ieo46eMT5w+qLtgEK1q4Obl2q66aXN2JVNsL8Im9xhBWcCadsdj1EmYQNMs9LIZqkBmrnS/RaIlb15v45K2rY08EmJajaGWJtG5MNxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCIB5LeuuZt4hpO6huNm78YaBqIByrdqcsbDpFdf4Yw=;
 b=gyH+vUaxpbGQ961N1qmQFCWPD1gvVwTxyCL0EWcVCk7AFJ5aHsH9ToZnWiTaJ7UaABXYVmjIfSGNH8lpnYffi2eLoDfictPqxZG9LmFrHLACvXVelqJyhRejFwVhembnUPlJu9QsbhgjyJXpHjOynGBH7idrFXNGmS8VWC6v7y9xzF2zZeYEWbxmpVVwKP+6Foc8FrUaO2GjPhMAwfUZN4jHtfky+W8deBFJQOqG5HgLJQcbatpVvr+ZZAkf0Qv/21jSgGCGygkI4Lh4xnf1ejQYH84g1EXRdjZz9s+eF5/ZnsjrcYurNCgnACzR1Ev5pYYiFwXCebFGyDedVdO88g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 by PH8PR12MB6746.namprd12.prod.outlook.com (2603:10b6:510:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.34; Mon, 11 Mar
 2024 17:13:19 +0000
Received: from IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::9f48:9a75:e1c5:b9c0]) by IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::9f48:9a75:e1c5:b9c0%7]) with mapi id 15.20.7362.035; Mon, 11 Mar 2024
 17:13:19 +0000
Message-ID: <a698710b-083a-4873-b054-b1426c1237f4@nvidia.com>
Date: Mon, 11 Mar 2024 10:13:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hte: tegra-194: Convert to platform remove callback
 returning void
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, timestamp@lists.linux.dev,
 linux-tegra@vger.kernel.org, kernel@pengutronix.de
References: <0b0a5d3816973ee88d4be9fe9f2349065a42cbff.1709886922.git.u.kleine-koenig@pengutronix.de>
 <CZR1QZ6F6QA4.2YFL58PNYHE0P@gmail.com>
Content-Language: en-US
X-Nvconfidentiality: public
From: Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <CZR1QZ6F6QA4.2YFL58PNYHE0P@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::26) To IA1PR12MB6604.namprd12.prod.outlook.com
 (2603:10b6:208:3a0::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6604:EE_|PH8PR12MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: dff6c35c-11b0-4307-5be9-08dc41ee8c10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j8jTArs0rgC+U9cb6h+4Gc9wsrYdYacM1FCgjSvs1HAXwKs51NSBjZ1p1ii2xucCrq9qsNxl6IWidMv+cijoizRptsGxObb9TI0lQUQq3djSg/YxOc3IO4+2E7Q/YNorEw1MaxTorMPC7UVc+09bBlBKDHKPkP8Gwy6FR2zYA7MfeSsdTEWAtN3nbG8Yl/j9TiiGJ00Ucpms9DPcIeHaBWvJ/1pl5sq5mgCK7PBslznfKLjEBGEny4JJ6xG+MHdPT/XXlupINLBG5f14TIRNoyLZy4tqBcv0UsiDZaO2CRjCiLIyiv5bW7+LbrTWzggIPd79kDyY1WWFuE9fXI6fSekCI0oAwfeUQ9zfDbyqY6Qa7SUjzInaGmJ6HnP2gLNAi7utNFqn7C1cjHRWqj+HKNwZA4KAWILTOD9/OiX7OLlcKEclv+YJ+L+f2HaiAe0FCSA2c6CYxNC0D3AyPFA8tnzCudynbQSFjz617JOykaqawrRX5+8PptuEc9h78k/sRDcdiq47CdJrVDUVmNL6/HdE+UDkn1akjQux5FNn8efPV4kZmeoWOsmcITHn4HeYgKsXj0xI7Kug+kVfqzur7fOleXaafwNfrkvez911fWS/XjAQvTWnVy/aim8KduhiSqHLmfFrb2t4GZbR9XBhpC9J99x5TBSqAqnAjFdqDeQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6604.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3hWc2NmVStlOHBMR2ZwMzRFQVRIUmFCM0tXRG15MHBWc29CV2x5VWRJYnNw?=
 =?utf-8?B?YStOZWZHdjRHNU9HS0x3dE9xOXQyM3NGOHRxOHNwUm1ub3VOZHdQZnZTbDFm?=
 =?utf-8?B?N0ZvcmlyTW5EQjBQNXZqVkJMZFVXWUxGb0xaQnpQUGw1ekxjWDZFMHlRR29N?=
 =?utf-8?B?ek5qd000cm9uUWxIRi9JZVdacjQ2dFNpZVhwRFBub2pFODZ1WVNWRncwSWd5?=
 =?utf-8?B?RW41dDRUVnkzUVhER3JzdDVVcUtwRWhBTk1xWmFKcjFPUEJGR2FBODJhNDhz?=
 =?utf-8?B?Y0htdjhxblhWZkwxb1JORXkvR2pjcktSWTVkWE9iZVVGdURIa3RKU1FBbytS?=
 =?utf-8?B?VWt3Rm9vaitEdExCQ1pTV3h5VWl0ZGNlM2VTRU5hZUhsZHUrZFJ0WTVuZ3VZ?=
 =?utf-8?B?bjJweHJLaUF0L3lrcS9sTmYrZ1huLzR2bWZkODFqY3Eyb2c0U1gzTFh6cFdn?=
 =?utf-8?B?aks5bEN1VEM3d1ZNRFMrNm03L2lUSDhodE1lb0V6eXNneEx3MW8vU0UrWVZo?=
 =?utf-8?B?aFhYNVVSMk5TSkE3UGl4WSt0LzhHWjFCaURJcElTWTB5WGJvSjd5TUNjbWxq?=
 =?utf-8?B?Y0VWUHJxeDZxbVRkM0VXUGtqRWJEOUljSlA3UXNla1hEWlJXanNHcmh5RlRI?=
 =?utf-8?B?eDZvOW4wRXJvOFBQMDJRT3JxVDVRSEdsbFVXdTBIRG1wWnJ0YUtNY2dYVFdq?=
 =?utf-8?B?M2NIK01zemRFV2hZWTdGbVdSQkhjdHlBZEZrQ2NBN204OTcyS052LzBMbjBs?=
 =?utf-8?B?WlFXWWozZWFEaENvbDl4SXRaSk03QjIwcVR6Qm9WQVJVeW9QakovSEpycU83?=
 =?utf-8?B?QXk2QXlhQURKUmx3YkdwZFpWVFhzYlYyb0szNWtIcHNWYlplaW9TM3VVejZh?=
 =?utf-8?B?c3VtdjZMR1dpWWZzMjV2VmxYQW9qTE5ZRlN0L3QwdXhpMFNoWlVLS0xHM3li?=
 =?utf-8?B?UUxOTTJEOWFjWTlUMmNwbnJCbVRPcXdNVVJ0WVUyS3RCTVZJRk5XeXFpa1I0?=
 =?utf-8?B?S3BDSGYrRXFQek5zVWdCL3lRVGpMM1BGYTk3a3dXUTFwZC9RTHU1ajBBU2Nx?=
 =?utf-8?B?VzdGZVZsaVpraHhqNExoZUlxcWd4OVlIR3N3NjliT2NZRmFzRzM3amdKb3N2?=
 =?utf-8?B?emNTME1iUlhuL3Y0eU8ycHE3NVNBRU5ubElYYStRajlqdjVMb1ZpSjhEbE14?=
 =?utf-8?B?MHIyR1lSL0EzQnRjc3hUZlNQZXg4QVAzRGUwV1ZxV0RRZ0NndTdCN3IzT3Np?=
 =?utf-8?B?bllOM1Fxa3did1RyT3VxMjE2UVRHZVExeUc0UDdaUnJiVVpBWnEwWVA0bXpU?=
 =?utf-8?B?ZFEwQ0FKQTNwU2cxL2JoZkVKejQ4OHVYQ0x3ZG94anBzaWFpYW9lWVptTDZL?=
 =?utf-8?B?a3pINHNNMlFKcGJDbG5IbVkrSjFXSWVrdkVjYmM2TUZCU0ZLZndwZDcxL0lj?=
 =?utf-8?B?ZGc3alhaSmdTNS9ueFQ3Z1g4TFBNbUhqU09MT3hJWGt4OWR3UEY2TWE1SXpM?=
 =?utf-8?B?RSs0UmxzbFlGODBqVnRrM1ZIUFNZakVxZDEveGFEQnpGbEROT1dSV2t5cm0w?=
 =?utf-8?B?bnV0bUVoMzRENkc1NEpwcTg1SEowS2ZOQ1RORGZhQVBYZHFmMlpCRmJEUHAy?=
 =?utf-8?B?ZXI3TVJPL0tVcU5vZEJxaWNDV1BrbjhTYUJaRjVvYklvN0JLNFdqWDY1aE5U?=
 =?utf-8?B?Rmd4bUFRdWF1VHlaUzdyZ3pBWUYvTkxMZmJqeUZxbVh0d29lcWc2QzVZUjkr?=
 =?utf-8?B?R3l1Y3NJVFpYdHVFQmJ4V2QyRHhtM0NqTVd2TThhVCtLdW9DZ2Z6VW1laW92?=
 =?utf-8?B?U1JMU2p0Sm02L2R5K2xYSTlsNnl5VEtvdGdDLzBXczlCLzVvQTc0UUpSVlo0?=
 =?utf-8?B?YmJ0M2VsR0dzbFFNbm9waVoyUlVxWmdUZFBkeEU3MWp3WHNqTHhmbG4yUnhP?=
 =?utf-8?B?N0J0ZWpGVER4cDlVL0hsVHk1OW1qdlNITWlLNUd5NWNrRmNyWnNrU2FrUVNQ?=
 =?utf-8?B?aFFraHI5cTdRY3JvdEVIc3diZUdBQ1MrZS8yM0gyOVorN1paNE5zTzUvZ3FR?=
 =?utf-8?B?RTdyRmxIeGZRVytvWlFDYitHZUIvaTMySXkyeEdTU3BNYVo1M0JhT2lnL0JU?=
 =?utf-8?Q?VkOA6pomirLIQZdmcD1l0ErGv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff6c35c-11b0-4307-5be9-08dc41ee8c10
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6604.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 17:13:18.9493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 134KtX5iSu6LO3STks35L7HjyuUc5vpu6cTBAW4oVxghO2J0NfZgd4dly2S5hK/kFdNQ+53vCm4KorR54NAOhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6746

On 3/11/24 9:04 AM, Thierry Reding wrote:
> On Fri Mar 8, 2024 at 9:51 AM CET, Uwe Kleine-König wrote:
>> The .remove() callback for a platform driver returns an int which makes
>> many driver authors wrongly assume it's possible to do error handling by
>> returning an error code. However the value returned is ignored (apart
>> from emitting a warning) and this typically results in resource leaks.
>>
>> To improve here there is a quest to make the remove callback return
>> void. In the first step of this quest all drivers are converted to
>> .remove_new(), which already returns void. Eventually after all drivers
>> are converted, .remove_new() will be renamed to .remove().
>>
>> Trivially convert this driver from always returning zero in the remove
>> callback to the void returning variant.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
>>  drivers/hte/hte-tegra194-test.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
Do you want me to take this patch or want to add in your patch series
for the drivers with similar changes?

Acked-by: Dipen Patel <dipenp@nvidia.com>
