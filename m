Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8867D29C330;
	Thu,  3 Jul 2025 07:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529315; cv=fail; b=dfO6G/PelM1ITzSUBSMgkuklCjL2hOP+qzpSm4/ObXTgp64Y5aMn8ODbMrH5lWBQEIuC/l49RP1zT9G0n1W9lRbiJdVNoPF6xS4Cd2JGSO9Q6mGTkut496dfcK8aTmozsNnu7bqw9mTi3sH7Gwpb4b/K1QsVvcKBjTTC6jYBitc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529315; c=relaxed/simple;
	bh=k/SD9Rxmn0URNKjYkoEEldaAoIS8suGsshxwPw2Xt3o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IIW7u8ChR8ge03VIdl9yeJgcTUtqZKQ+B+fcp1OiEXifl9XsSHEkeasrHwOy9odlpUmK8lg1Ibwb90XqVSR+sTVvKPjgk5YwxS3E/W25Qr9+MC4FvjmV7XQCKF4F0VsgSVn1PZAB7rwWPh3P3PWNlvzGtw3pr/sa3UKcHrIYlro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YDOyh9sx; arc=fail smtp.client-ip=40.107.92.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YDOyh9sx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybWWGmqLs6Prgd1hySxxXfZeBERRB2/5TREEkWHSUTz7Bh4/OsfL02XpGbo2zfZGyudY6Bq6K4lALvRqapcgfjrxF9CVNabroX8cvmhERH8vgBRGfs0DBb6GNYqPnaPVwytlA2V4rgMiBJwXH5dOxy4clDXOM0gta1Oz6YK6zQleCSYnjsIQssWfl8q9MdCpqIjywiv4dh3qhwPT8JGZhfgJw7jCsEtLwmaZWSdW/PNkTfrlV76Ys+b48zyXMFmYL1rfLszjQdwfbbWNcQDex9uDXbAdUpBjgoRqT5RNBPj8hTqhn8PmHzcl7AlNWDXUp1YVFuB/yeJxz1QVilixdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljm4W1GQxrrStPoTGOu7jQczy3wLGPqKxLMblFrhsMY=;
 b=uixMj12eSjedl19PHuyUdhBSsa3njqfDc2Xa4PtMY78ucAW86mjZpcA+WlA4itSQE4n/EvAzz6cj76JntNpHGbL2yfQUbogMKYjWdFscDjS1VN6cp7soUr4/Urrb15aZRoE5FrqL/RFNDuKrq+taOtIRjfN0pnqKBiK+LPtAI4PA7xpKNNHOh19yREs4+RMzJFYLf91BzPReN+d3WJSiUGqkWkUG2o6dfwiy2gEttm4wUBhGy0RGDr5+V7LHE4twsJcJWIz3QuThveophrzFX5l4DCAEEuT5s6Nc3qOLS3pwIWbQTHeDu85lUxaIU5y7w077QpNJv0ZByQ7EzhSmuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljm4W1GQxrrStPoTGOu7jQczy3wLGPqKxLMblFrhsMY=;
 b=YDOyh9sx+GVzsjFvEJn+yNPXVa6nA16DXLMAmgAYVRPnznJg7Q96qvkaBLRNHlsBadfMjiOyeCFp97ITdqliFwIN4Y+vteP43H44MNFrVV8NEUzWFL4H9X3h5w1joRx6tijPBBOvNVk1BITBSfMUVe0X5fNwfWt2i107Kt5zA4IWkPf6e9JBkMXmN+42m2MdtMWzO17urkIFreyG7gE/KGpwFciMS+Gh5nWWEkIpGuI7EH9o6X9A03dAafMb5Z/S/Uuk1ydu4QWUfsrI2AwACdjANgxdxY/h01SUkderYIgkHYmhXV4phkHac8WU21jMk71imrpsfVtAQ4bgOUgAYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM4PR12MB6590.namprd12.prod.outlook.com (2603:10b6:8:8f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 07:55:09 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 07:55:08 +0000
Message-ID: <a0d7a8c6-af60-4f70-9d60-a87e0701bc91@nvidia.com>
Date: Thu, 3 Jul 2025 08:55:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
To: Thierry Reding <thierry.reding@gmail.com>,
 Kartik Rajput <kkartik@nvidia.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250630110135.201930-1-kkartik@nvidia.com>
 <3wesm6syeqmjdzyyj2mjp4sjfwl7ebeahqxwcvub6gwvoifuh4@43tunmtjsq4h>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <3wesm6syeqmjdzyyj2mjp4sjfwl7ebeahqxwcvub6gwvoifuh4@43tunmtjsq4h>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0430.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::21) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM4PR12MB6590:EE_
X-MS-Office365-Filtering-Correlation-Id: fdf7e692-59a3-465a-fcaf-08ddba06ee00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2pzLzJaMUg0N3JGWXErdlpvRU5zY013Zjhwek8ybmlGZWhOSlFPL3ViSGlK?=
 =?utf-8?B?MmcybWJKRFdQZ1ZIMS9nUzBxVysxMHhFNUk4dHhURjcvM01HTlJuSW80YzN2?=
 =?utf-8?B?NGJnamtHQW4wN1RlcGw5bFRzSndHY1FPSHNGcWFpeE91c0N5UlhVNnJNeWFj?=
 =?utf-8?B?eTJNZ1NUU1RJOWhrN3F1R2pGV25raUIvREs1b0poV2xqWlJudnhRYTVHcGtQ?=
 =?utf-8?B?UDhIYUFkS0RxeUhsQisrK0JLbXA3N1NaTU1ZQ2twRFFlNkhqSHdDZk9saXBh?=
 =?utf-8?B?UjlpNGRDN1R0ZjluRWloNkJGbE9zZ0tTN0oyRTA0bGZtNGhMNktsRTZGa2lk?=
 =?utf-8?B?N2FMVWZwL09HOHVKN1o2QTBIbkhWcUpSWmdTMHhoYi9FQUF3R2pJREh1aGpo?=
 =?utf-8?B?MWJyM0RYbVB1YVdST2VEZG1yQjBYT3YrM1g0UGQwTVpYc21SVUo3YlZUdURY?=
 =?utf-8?B?RDE1OTNQcG5qaG9GSk5aOHpOWm1Fa0kzMGpGME1ZOHVKVEVraGdDVHlxWlhx?=
 =?utf-8?B?bWVDVHl2dXVQVXdxWHBxYTdNSVlxODFFUGpiVmZHWkExMFhtSDN0UndobmRF?=
 =?utf-8?B?UlhKdmxKekJXd1Z0WXQwSzV5NkpPNDFTRXhRTHdaa3d6dXV2NXBwdUhUVWIr?=
 =?utf-8?B?L1NXejMxYm0vdndLRXhDcGZNS0d5ZUxiTThONmtuYUdiTnFkUnROQVRQZXBj?=
 =?utf-8?B?b2FzWTlUVUxPajlLenRUclFpR1JTeW0zdjRybzRPQWNEbURSQ1VNb0pjQzAr?=
 =?utf-8?B?OXphVnpwNDh4Y1FPWEcyTE9oR3cwSU1LVmdOUEZkQ3BIOEZlSmNsSHI2MzhY?=
 =?utf-8?B?ZmVYcWoxRGEwZTZQRndxL2ppSXNIOGViWTlScDF6QlJIbW40OGRyYkdDZTdU?=
 =?utf-8?B?ekkrNndBOTNYbVFieTBmN203d1pBRCs2Y253K2U2NTk3MDJkZ3NuUEJ0S0Jk?=
 =?utf-8?B?MTZVcGwwS2R6T2lBZ1R0c2lBbitoZk84YS9id28ybmZMak9XVU4zNEsvOEJD?=
 =?utf-8?B?aklYem1oSE5COVBrQ0pQam82eEs1eDVqcHphTE4xL015dklUVE9JTDVBZnZa?=
 =?utf-8?B?YnpaUG1ELzQ5TjdkT01xYnplbTZ4UXl3SGsvbnJYdXB5Z0hnVXpQWDM4YWFV?=
 =?utf-8?B?Y0pPVEZ6NXdqUXZkK3BpSDI1WE1SMWJTd1kzSUljNkJoMGwwV1pwM2VKaUN3?=
 =?utf-8?B?a1cwMmlWRjdHZ283TjJrZExWRDMvdGtJcm54dlRmN09zcFgrdTkxRzkwVUht?=
 =?utf-8?B?OXNuVHpKOUZtYjJYTU5zVnpWUzZTOGZOTHlMV2VtM2dqNnNUUlgzRk0xQnpa?=
 =?utf-8?B?amJTbEVuWnFUVDRYY0lKeUVnRHpGeGI1b3RlcVBpOEJiSTVKWUpGN0F4d0Rz?=
 =?utf-8?B?L3BTSXZYYzBIdmZtL0syYVJVWE1GUDlxaXM0b3NkbEljRnlHNERyVWIyWUhN?=
 =?utf-8?B?TEhqTVRncDhKTFpwckJ5dGZ5V2UvMW5OR0VqbVRZTEFoZG4rbEZTWWFvQW5O?=
 =?utf-8?B?OTNUUjlIeDU5VGpGU1Z1VU5EeENmRDUvcm9kRE0wZUdDZWRZWUZ0cE5JcGhO?=
 =?utf-8?B?U3FyN3R6RkxWWnNEeGtmdzZ1YndKV3dFeUhRMklmTnNMY0N2YzEycWt5WXRR?=
 =?utf-8?B?TGFoRzdyeEJEMExaTmJGa1hRVlFyOTBlZGRPTnNyUTZ2L1A0N2ZEVEVWVWhG?=
 =?utf-8?B?a3Flb3RlMkFTUmliZ1VtTWJiQmZlU0ZlR3M0NFduS05vSmxvZXNRc2xONGFj?=
 =?utf-8?B?M0VTbzc5TUViSkVWVUJIOUoxbEdkUWRvUVdlZFQvSVlPMmxDZ1RMVmpValh3?=
 =?utf-8?B?RDRDSG5tdW9tTWNla3JmQ05sbnVXMDdhd2NUTGEySFI1MGl4NTJwT1ErRjRQ?=
 =?utf-8?B?ekZJcDAwTXJ0TkhSMTg3eDZVM0VFTmhtMHE3bW03Nm5qNkw4cTBsbU9rSWNt?=
 =?utf-8?Q?bqYZ/EZvc+s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGNsLzdwQmhPM2tWSjNzNUtydDhQQmc4OE55MlV1eHRlRFFHN3d5N0V2NGN6?=
 =?utf-8?B?RVAycmZ5YlpmNWloTmhSOE16STE3dHJjLzU4THJCTVlwdERSMW5aOHBiOFdQ?=
 =?utf-8?B?OFVqMUllakJJdGpWNkJsQzhzUFhFMEZ4ZFQ1ZWNINDJoQTRDTWFydUJ0MWJw?=
 =?utf-8?B?Nkw1bFYvWUxwR3VzbFlQYzEydDM2Q0JJZGNuejcwNFpoSTBLdHB3M2wrTkVv?=
 =?utf-8?B?ZXNXbjgxakhIc1hpaThrb2pqby9ZeXpQbUNVRnAvSEhJT2VJNzlncFVYcW96?=
 =?utf-8?B?UVg3R2ljSHNBZnQzQTFLNlhwWFE2ejYzRHhGQmhEdVlqN0lYUkRzQUxvTjY2?=
 =?utf-8?B?a2tEU2tUK216N1RBK3dxcXZ0UEg5ZFJVQnlQYW9abzlIZ2VqOEYxcWYxY3gx?=
 =?utf-8?B?Z2ptTlZQbHlGOUE2M3Y0MkxReG5aSkNwUHRQODNIM1BDNDNROGVuRlFtUkN5?=
 =?utf-8?B?TnFDdzJCRFcxUEZiVFF1Y2g1ZXE4SXdpUUcydU5XZk1Yd21hdUdZRmNnZ1NF?=
 =?utf-8?B?ZXhsbHYwOGNQRDlLNk11eEJsOVQveXBNNzBHVXJ6Z3p5aVlOYm1Wa09Gc1Q2?=
 =?utf-8?B?Q3J6cm5WaEFvU3hxVWVjOGg1NWdQS01xR1RMZnNsTEFUMk9IOTY2SWEzWHdi?=
 =?utf-8?B?SVA4Z0hpNUsySU5FdWZrRThiWjI2OFFYVzF6Y3c0ZUxqdjNTRTFqQTdRZURP?=
 =?utf-8?B?cEgyckw2VitGRXB6Z3RqbWJvYnAyYkJJQWlGNC9mZzB5MlNYQWVucGZoVktC?=
 =?utf-8?B?c21UZXpSSkRCQTMvOUpiWk9DcFhzYThIZitVcFlRdXBCM0c5VWIyZkJtMHFk?=
 =?utf-8?B?SmNENzBsUVpjcElkY2g1L1F6OThFTTM2OE1aRkJzaUFrWm5vYkhXa3dsdDdh?=
 =?utf-8?B?UlVNWVJUT1llZlpyK3B4ODFmL2lEdWltZllqaHBDdS9KMkFyUVh0bVNHQ0h6?=
 =?utf-8?B?SXdVUU82ZXFNUERVMnhEV0lkb3BmYjNwNEJud2FSTEg2ZFpUMGJmcVd6cDJt?=
 =?utf-8?B?elY4RGlVSXQvOVZnUElscnNmUmZkQ29QNmtHYTV1aFlQeDg5NXY0UkxwQ3Z6?=
 =?utf-8?B?REtXOVBEU1l1WHlBdzBkd1FXVG1DcmdkZ0JaTElGOGpYN0wzdFFQQ1k2ZVJr?=
 =?utf-8?B?YnUyUjFvWDJVODBxd3RXOXJtcnlwQnB2aG9pM2FRRi9uQitWcWFwSHZqYnpJ?=
 =?utf-8?B?YnFFRFJ0NSs2RjY3emtQNnBkVmhYaThjaW5BcUxuK0gvVnZNOXNBSDB2ek4y?=
 =?utf-8?B?OHFSKzdzZFJueVlyQjJXc3hFRDR1bXVLbzRJQmhuMFh0eS8rQkRSQ1EvL0N3?=
 =?utf-8?B?dU9VVlR4TWpZTTA5OWRYMXdiU1hNdURtWUxHL3RaNzZrUUhlcGxIckYrT1JB?=
 =?utf-8?B?WEpnc3ZWZmdLMUlvdTY3Tm9EUGl2U1JSSnU5ek0vQjZ1dnQvemY2bXhEQkNk?=
 =?utf-8?B?OVFobCtWamRteVNoZmtRa2FsUGRMTWxwTTZ0TWJPengwZHFtbjQvd1NKaE5I?=
 =?utf-8?B?Z3VnWFd1MkU1emc0WTNmb3ZwNWdLVWt3b2xUOGVvRWpOSVoxZlZWbE43bkcw?=
 =?utf-8?B?NUxaczl5SXlqendSVExQVlFuNGRKbWN5NE5jQUNqSE1zc3pFWVYveXhHQlpj?=
 =?utf-8?B?NUs4OHlHMEk4YTZRVHd2UzRGY0tUVUEzbWZUcUFNL0YxcE0xUjJ4V1BYejdT?=
 =?utf-8?B?WWdxdU84NzdMenBOUjQ3QXJFNXhFd21kMWNvaGhkQ2wzNEwwcERsS0ozYzZw?=
 =?utf-8?B?ai9ObG5obkNTdFVacHpHTHV2WTRhM0NoWlRoQ3kzRWphQ1FQejd6UE45azRJ?=
 =?utf-8?B?SzY2MWNHL0VNcE1WRjl5VmplODFtTE1VejZ4RXVEUDFaN2FGdEg4OExpaXI0?=
 =?utf-8?B?RUFWMWExL0wrQjB6WlRwcGxwaEZ2SEFzbmNhZHk3WVNxbE1mdzFNN3dnb0w4?=
 =?utf-8?B?aENBenc0ODJaUU5BYThja3Ztd2R1SGIwbk1xMkdvbDJmMk1OWFBMTE1Ob1hB?=
 =?utf-8?B?VGVGMFg3bFBWV2VtcTgxek15aWFZTHEycGx1OFBMc1dzbHdpLzE0aE4xZFZ0?=
 =?utf-8?B?MWdTa3R4bk9aR2pwK09CM3RRcXdKY1p2UzlVMU1OdHBVYlY4ZVpYcGU3ZUpZ?=
 =?utf-8?Q?VD7dOOkrm4KOSyCph90j7zRmI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf7e692-59a3-465a-fcaf-08ddba06ee00
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 07:55:08.5494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TirfeaqqbZdvekBrawRrFs/voijpjKJLcx3BNTI1tO9UR2BicqvhAn3mHyDpRztyBc330bjnNl/7MmdfGZcaYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6590



On 03/07/2025 07:55, Thierry Reding wrote:
> On Mon, Jun 30, 2025 at 04:31:35PM +0530, Kartik Rajput wrote:
>> Currently, if the system crashes or hangs during kernel boot before
>> userspace initializes and configures the watchdog timer, then the
>> watchdog won’t be able to recover the system as it’s not running. This
>> becomes crucial during an over-the-air update, where if the newly
>> updated kernel crashes on boot, the watchdog is needed to reset the
>> device and boot into an alternative system partition. If the watchdog
>> is disabled in such scenarios, it can lead to the system getting
>> bricked.
>>
>> Enable the WDT during driver probe to allow recovery from any crash/hang
>> seen during early kernel boot. Also, disable interrupts once userspace
>> starts pinging the watchdog.
>>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>> ---
>>   drivers/clocksource/timer-tegra186.c | 42 ++++++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
> 
> This seems dangerous to me. It means that if the operating system
> doesn't start some sort of watchdog service in userspace that pings the
> watchdog, the system will reboot 120 seconds after the watchdog probe.


I don't believe that will happen with this change. The kernel will 
continue to pet the watchdog until userspace takes over with this 
change. At least that is my understanding.

Jon

-- 
nvpublic

