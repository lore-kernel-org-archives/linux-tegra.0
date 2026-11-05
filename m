Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793876261;
	b=vE31YoShP8Q9Hqf5iudZlCq6wH6iU5l4wDOaU+QJ86t/wce6p9nnpbwyD3bLSdZ986Ip
	 7JMVvxQPxGJcbJb7TgtbDitVmz4Hf8uE55GCxTExL4Hwq4DCilH3Vb/2NDjNpkwprOLD/
	 C/BSblBxIRiouhm8Paip7ZMi/n/Bwkp5gDBDW4G6ODi3PYc7EPyzFeaGmnqfFH/PdEe/L
	 WSFn5WYGrl81tDU186eQ9TMyyW7a0JhDRyZZz0z0kB+YkxQ0VC6cSHmztyMIj1ozm9jjc
	 NyXJ2jt6ga398CY/KRBZvQ8uBbRPcOJwTEU86GrQtmkzGX4O2tiEkyaQgYpVmARjbdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876261;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=BGd1KLhExQ51PIUAoQfqRAivwisgWR7V8qGsgoRG5dI=;
	b=GPJ2AWS/rmGslaQ4nX/mwl6UD9YPkT73pYzCXcL1fA7hzgqOrdbZqP3fPxFh3ko+PwrL
	 zt+xkKxlCoSkLy3jS1FP0WAcFMmiybmhYvUMqk0xwyO5znIuZ6y5bhJxsPi4woHLh2hyc
	 N2d9UUxKKKafG6KXNH5T6sRTQBr8eDg+/6U935i13McMOibi+DDY8ZywhlGDgwdIFykvv
	 xO6CktgHwoJ1w1az7aiIvARr8Mqa/PXu1/jxolUChrJZLz6V0ikI2gc5jN0WiKWuxtXqx
	 HBpvKKepD6TgRhjIinTjG15+4lpDu49lCDk+Ee9vfRKX+NT6ZShmx+4QmgepynKAA4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g7aNhc8H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.9
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118C6606D802;
	Thu,  5 Nov 2026 10:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 118C6606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g7aNhc8H
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGZ9KLjRJd+f/SpqAOOIDj4J1rYPuWXMKR8gbgPKoGJHQjQCm0Q9FR/DCHuHdzLeSeMOTXFuzZHPFI231mvoG0ssA67xF/6ybcfy0M7OH2fiLqzWGYl/ChNBo5FPOAnAfBAC4hpAJthkh880JgkpfOL3/q7Yh3w3EJgnpMuf2opFOAcxzPWF+FT7ncl1XububIdW/vlmwNWh4NIf05rz+tBrMqBX1EUuQ1qNPtoSrrg8P4t6azgRkAW1U9YdHXFaUD5zP3xNRPWxTe2pTFpYqCpSs67QWHxU9UMEA2H18EqcaKK1lFl9wIm25pCZnI7MxqLyCWrHruW8Xy8OP4OyFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGd1KLhExQ51PIUAoQfqRAivwisgWR7V8qGsgoRG5dI=;
 b=qBvVVfc+7dE/Wt6m5Pq0NOHLrCZQq/sT/33KaFw4d3kDydr7e9QoGOnudrR9ebJRAfNzWu19rzue8fu2sUocZep/TxB3D7KYRTI6z6hahcKMRVJaRs1R+npAsxu/g3vw9FD3CwKAUrUaXXfeLPfEXB2AlhIWHMe+PwlEd9E6d5KCFX+iZMxfOkJQ0zxQtsutUkRS5lURGQwXS1TXlgwB3LtT2N6KpLVmNP6axVDjgG5q3pabl+Jit/V0MhkvhDLZ9lZaqSMoHTmdOZ/roXJxC8Iat+GbRy1sWJr3HijakD9G+v3yTfDYtjyKSpKVlo4rVMCHuTWj9JBWTVDan5/oSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGd1KLhExQ51PIUAoQfqRAivwisgWR7V8qGsgoRG5dI=;
 b=g7aNhc8HC1MBHJKfU5SDcZfKueKtQ4Ck/d9ce11056TB19jQ2j8/LQqF2bdUaQMQCAQQqDk9LLuxMKcZZYxgJmxEKGMs/cJk78sG31fSbYZowrF4SaegJmpnn0JctwaYccCx3ULhZMLBYyhnrc5STyCn7LplVHTin39YvznAUaQcB9YKnHyxyKxL4WVAImRYVnPLOga0NYC0E9HlToZXrLb5c3llFIk55rR7oFG0JGRz3GRdEgq1s/WeicvRWcQPEHB6Nj0a5D8pEskP1ta+L/LiMddn7dXLqTdPj0oWQYpH3Day8Q4Tm08+B/5d187XwPt2056tVju2iECTllFJog==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH4PR12MB720178.namprd12.prod.outlook.com
 (2603:10b6:610:50e::10) by SA9PR12MB666623.namprd12.prod.outlook.com
 (2603:10b6:806:a5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 10:57:38 +0000
Received: from CH4PR12MB720178.namprd12.prod.outlook.com
 ([fe80::2a60:de1e:e60d:7052]) by CH4PR12MB720178.namprd12.prod.outlook.com
 ([fe80::2a60:de1e:e60d:7052%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 10:57:38 +0000
Message-ID: <3ef1c4a1-c530-4abd-a14c-db112d32ca81@nvidia.com>
Date: Thu, 5 Nov 2026 16:27:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: tegra: Fix address translation on Tegra264
To: Thierry Reding <thierry.reding@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20261030141101.845044-1-thierry.reding@kernel.org>
Content-Language: en-US
From: Sumit Gupta <sumitg@nvidia.com>
In-Reply-To: <20261030141101.845044-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::12) To CH4PR12MB720178.namprd12.prod.outlook.com
 (2603:10b6:610:50e::10)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH4PR12MB720178:EE_|SA9PR12MB666623:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e9f594-9cc8-4896-b69f-08df3b2b9b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|22082099003|261102123227099003|56012099006|18002099003|261021121427099003|261022105027099003|11063799006|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	jP8iPyX1ppGB2wskHj/hvO77+r8OEjCM9SuNgYobCYCmCHfFjJy9Ld4o4i1kb4taQ2whYzORXz7hqRLWlW3s582qqAZvH9DZzkJWASkxeqwbHOyoLM+Q728MBIYrSvJPybDoP+lEEzNDRKC782REM1PYbwO/m7GiS2jx5j1Mir/gBXqZqsdiKKGhnQN/uiH4w4ZmMdwGnGuDhuY/KOkLCt3f+QNnXLbIa6/rOr9FKAX3mDNi6CNH8J/hiXXRZVTwBirmf3Bl6QR2BbOJ5zFzxMyWVbjvj5+BwAL487q26M+8rpa+09njaRpcccNy5FIEsysNczTpcaqQptyD9t+mPPs8zms++6ufWad9Kgfehm939dG5NQBksvGhRGaDMdv8zQtoSrITwpP1/py92xVO0JVu3C/WyFPmCWy4WQDakDWiosG5jnng1lwshWF1frw8f4kuoLRR8vN3amAJO7I2hqzk184Hoi6GUJJ9jVepUzWgFTmK4Z3wX+/V8l5q+348xvI0guSOSOIppdU5GR88Jwj9Z6Xf/zV4MoST3fBEqOE0Ul235DzMLC24cR1EGUM8PbvYZFXgnyikVTPhqMGwIEGK2CXs+UxuGMR2AMQ4spkjEdGJGiL+/2wabHXXcL4Sxrz4A8cg6oFxXJZ1ZqIeY+gicIfLJZ9vuB/nGURzdqk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH4PR12MB720178.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(22082099003)(261102123227099003)(56012099006)(18002099003)(261021121427099003)(261022105027099003)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGpncG1vbG1VNXA0c0VlR294em9ZY29IbG8wNW00aTFxVUkxN2FrNDlWZWFJ?=
 =?utf-8?B?M3UrNFYwbGtMYWgwckRSRjJDN0hvSkpPbjFPTlNPc1pEV0E0QUExdGQ3VVVo?=
 =?utf-8?B?aFo1bkhhdkxnN0pvZG02cmtpU2x4MFh1V1RYcUVIQVFZdG9hZStrM3dCSThP?=
 =?utf-8?B?eEkxcllTaS9tdlpmdE1zQmxWTGYxTG5WaVMvaSszaG9iM1lUR29waXVzWVNU?=
 =?utf-8?B?Rk5Na3ZuMXlBcU1NZHVzMy9HeTJBWXZqSko5SXdBWEY0UWxDUW9UYS9ZUHBR?=
 =?utf-8?B?V0M1UU42ZnVDWVlMS0FTcGY4ZkE4VnVxNWVRNWxoLzY1U2l5c3pjMFVaS2Jh?=
 =?utf-8?B?T0h1M3R5OThLaW5ZeC8yUTZKNEpJVDhLbEF3NTJ4M201eC9QM1Z3QU94WTVz?=
 =?utf-8?B?Q3drdTNXcXYwQXF6d1ZJdVJEVDZSWjQ1Smp1LzBFNzBwTmFHVlZKdGliZHp5?=
 =?utf-8?B?ZjE0a3I5VW1vOTBGU2ZCa1NWbDV1ODVNV3lzNlZwWXU0Wmw3WXZjVGk3VkYz?=
 =?utf-8?B?QVlxUDRLWkNnQzFEcWQ1NThiUVpjRWRiREJNR1FtM3ZURnM4S0U0Tlp0d1Jm?=
 =?utf-8?B?bG1KeWNYSzZLanlEbTBGcjZIWjVTUm45UUprVVZ5cFRUOFRWQTJtTXFWK3lz?=
 =?utf-8?B?dHNUSmRmdHd1M2srdm1WWncwNUhGWjN4czZHUXJ4MlBzaXdFczJNZU1XOG9n?=
 =?utf-8?B?MEhaQVNjbnB6SDNKV3JiTFpZZGUxRWJWbGhpQ0V2LzhoVTVLRjE2THMzM3VU?=
 =?utf-8?B?QWllSWYxZXhtSStqMG56SitIeFBSZFc2c2JMSE55RUpQbVBrK0FDR1FjWjNm?=
 =?utf-8?B?ajRMUHB6K1JtRElqNksyMU5WTU9PeDBPeEFQVHM3aitRMlhnejRVZVQwN2Q1?=
 =?utf-8?B?Z2N6ZDUzWWVnUTFsTDF2SzNySHZKRGV3MEdHNlpNMENDbzlySHV4YkI5V2NM?=
 =?utf-8?B?eHV0VkJ2ZyszaGtUbkNRendPbDgyK0l1VU9iaGlxbHJnN0owbFovRm80bi9Z?=
 =?utf-8?B?TnZ2ZEw2TUhXWTh5MEJUbmpkUytuNGNmT3RWak05dW5HUTh0eng2bnY3Z0FV?=
 =?utf-8?B?SHBLWUdiYVpvMS83MzFkYkFJOE8zNnFVMVM0bGE2SDhQMTZWZ0VkTndlK0Ix?=
 =?utf-8?B?aEJUUjh4dUMwcVdZM3lPaE1aUWxieHlhQ1NaV0VTbWtRY3RSSFMxRmhwMjJD?=
 =?utf-8?B?RDVpd1hmNHVkUjF6eHBta3BSbC9TYVZQNlhHaHFoeVg1RXdWMkF6VGRQdzlL?=
 =?utf-8?B?VEdyL0JMTjdzTzJqdFVjU2RZUGVxSFp0K1dhTFlxcytuWHdXWGxkVVNaZTFD?=
 =?utf-8?B?d1RSQ1RtMGVQZWZ0bXNrNjlMM3lOc1crdllkcEkwN2h5Q3FNZGJMcTZrVVBs?=
 =?utf-8?B?SEhMbEtQZ0hQS1FXL3BJTjdmeEVVUStaNDdFQUNQN0JDVlFML0IwTUxEc3hj?=
 =?utf-8?B?ZUYrdE5ybjRNUERLRkJQVXpIY3lBTStPbTlscXVYTEQwTjcwR1l5VWllbmNp?=
 =?utf-8?B?MFBFS3k2OTNJREZGa0dvZEhSZnZ0TnpOWFB2c0MzcDkxeEVUYWhLQTBVU25v?=
 =?utf-8?B?WExURmxmUzhJdHNJNnJsS1oyVnZja3lrWmJUVGg4cUE3QzEwcHNHMFBsNk5q?=
 =?utf-8?B?eWg0VEJ3cEt1NUVOYStCV2JBZ2liZ0tzYVVUUHdHYmx3N0RIUFd2T09pR21p?=
 =?utf-8?B?d0pwaStmdFZVVG9XZk5zWFRLRFpXYTU1bGdiT1JVaGwwQklrMlIrMnNtZjd3?=
 =?utf-8?B?WHAvdW1uaThPdFNtV2hrRUYva3pCU1VhRlozZmg1UkVvN1hzTDlEUnJxTDhE?=
 =?utf-8?B?R0hmY2pJeEVEVlZXYUtMUk1CL1MvS2F4WWdmNEQ5MGZicUZWSGRoTHlMQ3k2?=
 =?utf-8?B?a1NYdmxRT0Z3RUhBRkZqdTFnU0ZTYUhzaWlsOUtoS0RkanZralNJVHJ0eXNU?=
 =?utf-8?B?MEVtSExnenJjQ2tOYjJvaXF5UFdyT3FQNzFnbGh2cjlSL1FuS1pSWjRlZTJK?=
 =?utf-8?B?MlpLakhpZ1VpWkw0NE5BVjBoMHlRVElZTExQWWhSNHBNSmxsNGQvbXJtSVcz?=
 =?utf-8?B?K3ZDeThybjBCRGsyUVNvNGtTalRPV2R0Mkh3YmdhSHYra01zZzgyNm8yVGxj?=
 =?utf-8?B?UHNUbmJ2T0M0ZFBHSkNJMis2WitWSDI4cHRTZE80UkNxNzJsZkE3dU5uT2Mx?=
 =?utf-8?B?RXNweVN3dW1pMU1pZE1uUHh5NUozRm44bHNDam0xVWtpZTBKQmlTM3VDVnBN?=
 =?utf-8?B?c250anNsVDNGMFl3RXltdko5UzZJaGd2R2Y2bW43UVVzbzk2NTIxU2lRc2l6?=
 =?utf-8?Q?Wp9+7BZO31DevAUfZj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e9f594-9cc8-4896-b69f-08df3b2b9b56
X-MS-Exchange-CrossTenant-AuthSource: CH4PR12MB720178.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 10:57:38.8559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xa1iguzClFFm9t2VKFCCvLzaZ5hPLZE3LgPNGIcyj//NseOAVAVx/0XX+fOxXkf0+GQ1EA7cb5ZGwa4lF9gPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA9PR12MB666623



On 30/10/26 19:40, Thierry Reding wrote:
> External email: Use caution opening links or attachments
> 
> 
> From: Thierry Reding <treding@nvidia.com>
> 
> The TOP chiplet has a region of memory at the local offset 0x20000000.
> This region is currently unused, so remapping the non-prefetchable, 32
> bit PCI region through that region works fine. However, subsequent
> changes will need to make the actual hardware within this region
> available, which then causes an address translation conflict.
> 
> Fix this by moving the interim translation address (note that this is
> purely used for address translation in the operating system and never
> used by the driver code) to an unused region of the chiplet's address
> space.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Tested together with my series [1], whose patch 9 depends on this patch.
Without this, address translation for the ccplex@30000000 node does not
resolve to the CCPLEX registers.

For the series:

Tested-by: Sumit Gupta <sumitg@nvidia.com>

[1] https://lore.kernel.org/lkml/20261104181521.3003578-1-sumitg@nvidia.com/

Thanks,
Sumit

....

