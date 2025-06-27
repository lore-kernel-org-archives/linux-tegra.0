Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2054.outbound.protection.outlook.com [40.107.212.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844BB1DE2AD;
	Fri, 27 Jun 2025 11:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022179; cv=fail; b=HmRo/KxbfKsT4OblSzno0+MjEkILKm17XRpkuSJohivYKxLNDB9bDCmLL19hWHZw5yUAnGwo62HFhJ7UuxxNpRsAyTwMe1+WaTpCXVEMnYxTAh4TFl5npjfao0J8YI5NjemnbQXubYmFf963V6OqDzPchm58VdA+vTNrxCseaCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022179; c=relaxed/simple;
	bh=V5DxcfjFpRk8SM7L94t/yXvlxoQqmgOi6VCSOH1caiI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IEW+KcbknrM3hDsmzcUsObitIC9EGx5XlMacYsM9R03wQIPcpOQC0b5pyLjcZx7vMz8DB4yXUOjX3MeV/kum1niuB/hTs3E3Vqn5kydIvm5aU06fiAzFiuJc6bt+oprCc306qF2EUeqygcx/GqPI51kzTnQLIRvZPeWIiNf1FVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T2Byz3cU; arc=fail smtp.client-ip=40.107.212.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T2Byz3cU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THMB+Eomvs03NNsPjQo+8jsnUMsk/W8RLxsrgeYsbtq+qO6kAftW+Erp/KEqdu6e5/uHSjvh6OL4OWUMM4VBa/vHCXW73iPXJHgehl8agUnRhfKO+MDIbfcCT7+ErtkLGcRLobJs8u+NmuvjWT97HQFOiQ7nDAY2RwnuPzV1NDUFgkrn495aQNC5I+wB1QIBY/VEw9tjjxADvgBMyQJZngeJQZ4O7OOM5BH3wutj9tdgjP4YxbYTFfFN+q9IZF6fiElsrweFtG4AQW7h4bWKP+PIjKE+QhzDRygF1Dq2j/OnoZxKdq8+djhCDiHnxXEmueWntAWghoHYl+5MQiy01Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANsgFne6UlJuXbXePXJt43xIIOcNYx4bL/8b713r8tI=;
 b=CNq4QSVgGZNfqdTkXvudo7Xcr/Y45tyIpymcZE0WSMft4Q8FnXR5BI+kupulMcraS3ihGrLW5t9Ei0hqwJ2lOCF1TXBE5HX43Pgblz4x2HKPpVNxF2h6BJmtJI5pDbBMzkN+ftInLPZ7zolHdWveLy0oPxumhnZJYJwS1gGUngoMXFTCDLJ2Yg08MdHVJDAR2RBx1QP0BXU3Da3ww0lJ1GTBz+DVzXjMqzrP7vh4/HVBIlcd3J6aPbJm4crNWZ0I7+IH1a5aU15MtvedJIr1N+jVgZojc0oZEuSZ9ZOdFS7y/IDuXX6BJ/N2Vypp77EbfMdUW4Src9dj+gvQMXOOGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANsgFne6UlJuXbXePXJt43xIIOcNYx4bL/8b713r8tI=;
 b=T2Byz3cUwpZ5WRsN8t1/b651DGeWeKVeCc0VHamqYmmXSc83za6emrY8viTdbGlNH/gF7CuKbNj5va45HV/NMWWW6ZEr7xOkihqwSxychtZ+hSi16xvJKj6OlKG+/yKnDrJrM/WvCtZWV2ZbZlRp4EkOavbMA5QUGOGovxyTzZxkLL4uQNbvki7wT3/1h+1AFsQJzUS7Y5Hxg/X4+EsrUmipAIoT55qxh3jX/Z/ek8tr7co2XsrZQwiZcqS3SsxVayjxhGjil/ZgvJpRzMwxnirqXxHPTXHDlvcxSioZSDLWDkaOVRrRIMmXaLUitAJpK15ZcKW8ILPN/6ktaXUnyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8773.namprd12.prod.outlook.com (2603:10b6:510:28d::18)
 by SA0PR12MB4365.namprd12.prod.outlook.com (2603:10b6:806:96::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Fri, 27 Jun
 2025 11:02:54 +0000
Received: from PH0PR12MB8773.namprd12.prod.outlook.com
 ([fe80::47a4:8efb:3dca:c296]) by PH0PR12MB8773.namprd12.prod.outlook.com
 ([fe80::47a4:8efb:3dca:c296%2]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 11:02:54 +0000
Message-ID: <6eb19bee-c553-4a28-9342-b2b218deabe7@nvidia.com>
Date: Fri, 27 Jun 2025 12:02:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: register_syctl_init error in linux-next-20250612
To: Joel Granados <joel.granados@kernel.org>,
 Bert Karwatzki <spasswolf@web.de>
Cc: linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20250612175515.3251-1-spasswolf@web.de>
 <vvorpevngfle6budlgqhmj3f25lb77czzyvd5aa6jil7zkaqgp@weanygri324r>
 <11898dd756020687c2016a37af3c948b350bdbbc.camel@web.de>
 <szadjbcldmcirdtgiv6wowqumlk4cbthb37f3e42lzcbt4tnla@ilp4m6quqk4b>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <szadjbcldmcirdtgiv6wowqumlk4cbthb37f3e42lzcbt4tnla@ilp4m6quqk4b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0343.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::6) To PH0PR12MB8773.namprd12.prod.outlook.com
 (2603:10b6:510:28d::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8773:EE_|SA0PR12MB4365:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f0b67c0-927a-4103-22e5-08ddb56a2a8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlZ1V3B6U1dNcFd0aXVyRFJBMmJPcUJYYTVTaXVra2RLT3FiczliTDFKL2NE?=
 =?utf-8?B?bFlhWFQ2SE9lR0xzUSt4RU50a1hiem93RXk1dzlIWXJyaDkxaW1GaWRqM3JF?=
 =?utf-8?B?VTBBSHgxN0o4SHpybkV4RVFVVzRyQnNMYklTaWxRQ25SUHlUMXVuaTYvanBi?=
 =?utf-8?B?YVZXWE5wajhNbUJzQjhxTFBjRy9WYUtyS0pGd3hsRk1weTZ4WmZHc2xDTjhG?=
 =?utf-8?B?MmRqQVM1TjFoRkJ2bUYyaXF0T3c0SGVNYlVsTE5EcnVSTC9Kbm1ocHo2QU53?=
 =?utf-8?B?alc3ZzBpN1V3QU5vSnZBQWc2aERKNnUvcFJQcVJ1RDhXT1ZUT1hBcStoRXVO?=
 =?utf-8?B?Q2hhMVhBQ0dZb0xzQWV0UWtFQUJRZlBmQVJDaTVmUml0WDZhS3VBRW9rS0pM?=
 =?utf-8?B?bElzamFPVzZCRmtsdlBXSXYzYk9qZHZsZ2cxYnY0WlBnbUpxNVBmNStEb3ZQ?=
 =?utf-8?B?OHBxTzBCK3VJdTNiakQ0ZVZzR2FZWkRuMVhHM2Y1WWJScmI3VXF5a1ZoSzEv?=
 =?utf-8?B?VUZHY3RyaGRjdnQxVnFrUC9BS1Y0YUlwa0M4emF6ZU05V1dXZUF2YnovZDhE?=
 =?utf-8?B?MUVmYlA2dTFvZ1RDT290eGlvSWVwdTI0d092UXFVN2FlTTkwUU1qNm9LZHhq?=
 =?utf-8?B?TkpFTzhjejF4VFZDM24wdUlINzZUV2JCZkErYzEvcllsRWVsWDJkeWhUNE96?=
 =?utf-8?B?QnRqa0V1QjZuaVpXdjRaVWlHdlF5Z2ZBVHU2Ukhrci9SbWVvYS9KTVNzR2s2?=
 =?utf-8?B?ZU5JTk95bmZ2TzBYMi9uTG8yM3lJU3FLY2NvdmlzYUhjNmFYRHY5V090aW1O?=
 =?utf-8?B?U2VUaXNBT0FueWxSdm9qWUQrcFFsYkp1VG9iTFBuQ09udW1jUHR4VVNNSjJ2?=
 =?utf-8?B?QTBIaVBmY0EybnBKMlRQVm5XZ21zS2FCS3ZBRXJhUDAxMDRncUVCMDZtVDBa?=
 =?utf-8?B?Y1FHVEJ6N3JpZGtSaGhRVnIvbCtqZEVYTVhlTkFsckJTVml1SWdycGx2UnpX?=
 =?utf-8?B?S3d4TWpDS1psTlVnekN0US95cnZ2WTNWNG1rSHAwOW85cWpjZ1lVZktFQ0xy?=
 =?utf-8?B?WnU3aUpsUGRZMW5qK3huWTYrQ3VxY0R4bTRHVGp6eTRyNXhtZUVISVNwVUs1?=
 =?utf-8?B?UUtNRUJSR3hmdVNxM1BrN3dTMnl3d2RQY0ZUV3JROHRiVEpFSjQ5ZUlnaW1t?=
 =?utf-8?B?R1BrbHR0U1dEQm1oVi9pcVJJV1JDMEtlZk95WGJvYzBuUGhGa05sek5qaHhr?=
 =?utf-8?B?MlNqZGprbEpTUENNenRLSnRBS3BZeTI2Mk1POFdXbWFLV3IxM2JCSWVpMzhi?=
 =?utf-8?B?Zmp2ZStFYXBoNUtRMHBQZ2UrR2lENGcvcUppWnA3L3JaUW52RlFmQWVIcUNV?=
 =?utf-8?B?T0ZjbU1QbGNPRGcyaE84TTNkWjJaMkF3UjV2b0tCVExnREhYZUY3ZmNCUU5r?=
 =?utf-8?B?aU8zV0N4eXVxL0owRnQ4NHMvYXNkM0RPWUFlZEVIWmx3RXR0UkNqOVBJdGp4?=
 =?utf-8?B?NnhYek1pWVNRVXNaOVpmZFpVeEdjRk1CMUpwdHN3NkJ4SEJ5YndnRCtBTUkv?=
 =?utf-8?B?OVBJT2xpK2h3ak5RVjdkWTRHNVR2VFVzZ243S0FnaUQ5Zmw3aUJhNkVIdTJQ?=
 =?utf-8?B?UVdEWnFNckpHcGxZVUZjTWx1MGRoMzRkVUl3TVE0SGM4YU5oYUtWUkQwT0RO?=
 =?utf-8?B?SzArNUgwTlA1LzhPWGRKYmJwNWYvSmh3UEYvQmdwSXE5bmdCMUVWMU1ZNDdJ?=
 =?utf-8?B?MDNhSGtRbFZGb1BjOS84YWxkNCs5dUxPdmpWREUxR3NSSEV6OE1YRGljTGxu?=
 =?utf-8?B?MzZwR010cXNqb1V6Vjhhd2FjRjZhdGU2ZExVOXQvK2s0SVFKcDhOYW5hWWhu?=
 =?utf-8?B?ZG51Vi81RWZNOTNLbnVhUUZDaDl4WnpoNE45UzB6blA5cW0rRXFTb2ZkMDdW?=
 =?utf-8?Q?X3OFbZ6HQbI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8773.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGkzSTNXM0hRVjNUM0k0d1F5YjJQdC92aWhGNE1GbmdnaE1IbzZIUS9aV2Jn?=
 =?utf-8?B?WFJKWUc1T3dPOXhUNTIvS0NHbGNVU0FqZElObklhaDhXZTJrYTZXYlV5QXdh?=
 =?utf-8?B?amNqYkJRK1NGVm8xWUE3d2RrYVBWelJ6QXFnMzZONEdMVEEzZE1OczFOYkpN?=
 =?utf-8?B?Q1RCeU5ZQ0xURG5mRy9ES3VUMy9BQVRWUFcxZ1o2SzVjRFpFYVV0ZGNqSlJD?=
 =?utf-8?B?NDhqN1BoY2toK1FObUR0TGVLckN1R09ibzJKUXRPOWU5WlFFQ3dJOTBSTC9J?=
 =?utf-8?B?V0NVdmQvWDZiRzUrbS9rRys0cnM2UGEza3oxbGFxRWdqWFRUWjVHTFVIYW95?=
 =?utf-8?B?MlVGQmhKSCs4WjdmSkVzT21WYTVNU1IvZ2I0bWdhN2ZpLzJIQUdwZ3BOV3FJ?=
 =?utf-8?B?WEp5aE1vQ2RpdkM4YmFKeWhsd2dsN1pYLzBQYllTTU1STllPeTljTUhOMFB5?=
 =?utf-8?B?VFI0MldTaWt3OGF6b1F0WGE4Tm1yWVkyZG82VzZQaGo0UkRaSnBXamlkYjBt?=
 =?utf-8?B?bjQ1OERBenMvdkFsM05Va3hsa29IZzRrbTNjYTFRU3JqTzhhQUU0cjhEN1gy?=
 =?utf-8?B?WHEzb3o4Nmo5eW9LTi9pUWlqWkNrWXZKTzFmNWJaRm5OWmFjdW5LU3hxU0xQ?=
 =?utf-8?B?SmE4ZXNhN2E0b3QyTWplL3VpeTh4aEgxSzBvRldFb1VoTjg1Z284WjUrcHdW?=
 =?utf-8?B?WllYM0xkNG5hSFhYWmd6SC9NVkdOUjNocEVXSmYvQS8wbERGSmtUNFVnK3hj?=
 =?utf-8?B?SXgwYkJpbFhkcFc4VFREN1JzMXd5M0k2aUc2WmZUeWljWUgyL1FLaVhDckdz?=
 =?utf-8?B?cTZORlZsZG5PQ0h6RC9DMW81TGR6U1NnbXhpQkNVbDJqd1h6dHh6QkF5MWVt?=
 =?utf-8?B?TnFreVl1ZFlUYXA1QUl2YkVUZ3N2ZXA3K1RRTEhVVVVNVm9GcWtDdVZBWGV6?=
 =?utf-8?B?R2JoQUlYS3RLZzEzTG0vWTVkQ1A2clV6NmgwTzhRSDEwOUZDNEc5anZScTJo?=
 =?utf-8?B?blJsVVMxa1JZOTNOanphOTI0VGp1UnZsbW8zUER4c0hURUMxdUhwNkMzSEJJ?=
 =?utf-8?B?SDNxVUFYRTY3azlPZ1NLNGhqaDlYQ1dxZkxoVnV6emE3VE4zRUo5cmxNL1Zj?=
 =?utf-8?B?dEJNN2xQbW9ZeW12aDlleDUwN3lXWVVHaGZGN2gydTRibHhJT0J1M05Ia1Bs?=
 =?utf-8?B?U25TMXNzeFE3bDMxT0EvUlBocTBMRWwzMkQ2cDRvb0pqcC9uL2gvdlc2dmRy?=
 =?utf-8?B?ZkY4Z0dEWGRnTEJ1K0lkK1NLRFZScUlQM0daWmx5NDd4Tm41bDJRdEh2NEtr?=
 =?utf-8?B?cldjaGo2L1dTU3dzVFcxdXl2UHNpU3l2VnA2SXRNVi9lZ3Y2bTlHMzJSTEk5?=
 =?utf-8?B?eTJhQUZaUFB2TjFBSGRnMGtnNVVjOHZSVk92NU1jZHl2cDNwcTMxVjZJNWZ6?=
 =?utf-8?B?bEkvRHVBMXRKek95ZXpYUXN3SHRYcEljWXRtNDlXNmttV0tBa0JJdUJJS3ho?=
 =?utf-8?B?dmxNcnROMXVSMXlKbXFKdFR5dlZBYUQ0cmtJdjV6SGVnR3QyOVczN2EvaEZo?=
 =?utf-8?B?Z042aHdqMHlYdkt2cG1RVSsrWG9uRGtTSjNDS1owa3hRTFhvZnp5d2JvbUc4?=
 =?utf-8?B?Z0Q2U3A0UEtxZ2NlWVJuZUxubEp3Y1Z3VitEL3FHYmlYTlljZVpDZ25hNjhI?=
 =?utf-8?B?ZjM2THIrb1dMbmhubVMycHFQNllLaWZWMU9Kd2tiVlZ6M1ArMnhTOTF3WU1n?=
 =?utf-8?B?M1h4ZDVISGNtQ09uNFo2UjhFVnR1R3lmNExlUjhTbDQzS3NHZEI5bXZLWjhr?=
 =?utf-8?B?TkJILzVjb25EZ0ozSDFHOFBaamJCWERjUFVaaERja0RVU1JMSGE5MUNmSVRY?=
 =?utf-8?B?SlJTdmNQNjR5bU1NNTRLcEpQamEyN1M2bEJ1ajhYZ0kvTXN1ZHh4Slc1ZVhV?=
 =?utf-8?B?SnNYbThpZ0VCaWU5SWNQVFo5Zm1ZZ2c0cjY0NGV5bk9pWlIyMXZnS3JDMzFJ?=
 =?utf-8?B?aXNFamM3YXkzbk5CMVAwRkVMV3N4dHJUTFk1dGJmbmp0bS9BYzlqTWJ5OGN1?=
 =?utf-8?B?TFdxZGdjbUp3SEZmRENSUWp5cGNRVFJmWnQzV3BjdVlHb2Z4M01oQ2pycitF?=
 =?utf-8?B?ZG9teVdwdUVnalJKdVFscTM0NjdIZXJrdFhBdmtMckVseEpGQlAyZGhsMHJZ?=
 =?utf-8?Q?2t3t2BK4FT7wDr2l4jRLRw7HOvxgOK3uuvQDupnXaxk9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0b67c0-927a-4103-22e5-08ddb56a2a8f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8773.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 11:02:54.4569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFkx1BGCMAF+ulBNGaKFXu3cXJKZTW0Apg75fhzFQSjLpttBqyK2Ys8lrafsYGAxFbyCMhq/MYQ8fONVfN3THg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4365

Hi Joel,

On 20/06/2025 10:42, Joel Granados wrote:
> On Thu, Jun 19, 2025 at 04:09:04PM +0200, Bert Karwatzki wrote:
>> Am Donnerstag, dem 19.06.2025 um 13:50 +0200 schrieb Joel Granados:
>>> Hey Bert
>>>
>>> Thx for the report.
>>>
>>> I just tested on my https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git/log/?h=sysctl-next
>>> and can't see the issue. Maybe its something that I'm missing in the
>>> configuration. Do you happen to have your the .config that you used?
> ...
>>>> +#endif
>>>>   };
>>>>   
>>>>   int __init sysctl_init_bases(void)
>>>>
>>>>
>>>> Bert Karwatzki
>>
>> I'm running next-20250617 (but I'll also try your sysctl-next branch) with PREEMPT_RT=y, my current theory is that
>> the init_rtmutex_sysctl() is corrupting the rbtree (if I remove init_rtmutex_sysctl() everything works
>> (with the same .config)), and in the process removes the overflow{uid,gid} files.
> 
> I think that the error occurs when the register gets called several
> times for the same path, returns an error resulting in a undefined
> state. I see that rtmutex.c is included from 4 files, I also see that the
> registration happens 4 times.
> 
> I just did not understand what was being done in my initial patch. The
> fix is to put the sysctl registration in some "main" file (rtmutx_api?)
> and to keep the max_lock_depth variable there as well (like it was
> originally)
> 
> 
> This is my proposal, Does it solve your issue?
> 
> 
> diff --git i/include/linux/rtmutex.h w/include/linux/rtmutex.h
> index dc9a51cda97c..fa9f1021541e 100644
> --- i/include/linux/rtmutex.h
> +++ w/include/linux/rtmutex.h
> @@ -18,6 +18,8 @@
>   #include <linux/rbtree_types.h>
>   #include <linux/spinlock_types_raw.h>
>   
> +extern int max_lock_depth;
> +
>   struct rt_mutex_base {
>   	raw_spinlock_t		wait_lock;
>   	struct rb_root_cached   waiters;
> diff --git i/kernel/locking/rtmutex.c w/kernel/locking/rtmutex.c
> index 705a0e0fd72a..c80902eacd79 100644
> --- i/kernel/locking/rtmutex.c
> +++ w/kernel/locking/rtmutex.c
> @@ -29,29 +29,6 @@
>   #include "rtmutex_common.h"
>   #include "lock_events.h"
>   
> -/*
> - * Max number of times we'll walk the boosting chain:
> - */
> -static int max_lock_depth = 1024;
> -
> -static const struct ctl_table rtmutex_sysctl_table[] = {
> -	{
> -		.procname	= "max_lock_depth",
> -		.data		= &max_lock_depth,
> -		.maxlen		= sizeof(int),
> -		.mode		= 0644,
> -		.proc_handler	= proc_dointvec,
> -	},
> -};
> -
> -static int __init init_rtmutex_sysctl(void)
> -{
> -	register_sysctl_init("kernel", rtmutex_sysctl_table);
> -	return 0;
> -}
> -
> -subsys_initcall(init_rtmutex_sysctl);
> -
>   #ifndef WW_RT
>   # define build_ww_mutex()	(false)
>   # define ww_container_of(rtm)	NULL
> diff --git i/kernel/locking/rtmutex_api.c w/kernel/locking/rtmutex_api.c
> index 9e00ea0e5cfa..4fa1acceaebb 100644
> --- i/kernel/locking/rtmutex_api.c
> +++ w/kernel/locking/rtmutex_api.c
> @@ -8,6 +8,30 @@
>   #define RT_MUTEX_BUILD_MUTEX
>   #include "rtmutex.c"
>   
> +/*
> + * Max number of times we'll walk the boosting chain:
> + */
> +int max_lock_depth = 1024;
> +
> +static const struct ctl_table rtmutex_sysctl_table[] = {
> +	{
> +		.procname	= "max_lock_depth",
> +		.data		= &max_lock_depth,
> +		.maxlen		= sizeof(int),
> +		.mode		= 0644,
> +		.proc_handler	= proc_dointvec,
> +	},
> +};
> +
> +static int __init init_rtmutex_sysctl(void)
> +{
> +	printk("registering rtmutex");
> +	register_sysctl_init("kernel", rtmutex_sysctl_table);
> +	return 0;
> +}


With recent -next trees I am seeing the following kernel warning when 
booting -next on our Tegra boards ...

  boot: logs: [       0.231226] WARNING KERN registering rtmutex

This warning triggers a test failure for us because this is a 
new/unexpected warning. Looking at the above it seems that making this a 
pr_debug() or pr_info() would be more appropriate. Let me know if it is 
OK to update this.

Thanks!
Jon

-- 
nvpublic

