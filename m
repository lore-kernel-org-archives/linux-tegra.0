Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792624354;
	b=H7eXWg1d5NoEBmIjnNRVx8BNEV89B7aZeAKlbZCqgZFJ2V/w5MjSe12VU6VbwP+X182i
	 KxGlBwLt7Z0hBiBZ227GOPzbon+zr5rTMYKT7z/Su7CXq7XpG5djisARnmprqgT5Dj9Vz
	 1184wsApORiArerthMFOaqpU+DZBwohxCxmSl1+BRHZ79aEjiG4ulhQWvxvuklJf5WL/r
	 mJajT4b+ublgknCt7Jph5PtwKFp3G8BOgQZX+iC9o+LqhlRrguYiUK5CqolTZ/k9iprmZ
	 z5RkocdzVFni+PnCDF/IvjUj7q4FPDJq0g/V0+3oN321mBZXzwu7oGVwrzSlX2zJRTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792624354;
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
	bh=uoKIs8OqK0EhmGp11J6t3AZ2ykNz+EQNvXODdZ9eaVA=;
	b=ZCRNRfHU0xPNRwDuX7AC55YojpHqZwVndQbKHX9T4dbT8X2pe524QGfDQ8qZUOzFV8ko
	 nZWl/eHIKglIG2S9Yhh4LWY89M7ua/NbvXpqt6Ewps1zsPNVJqMe+y1idNc6Ert4Xg98y
	 5iUmU8QPbK0AD8NIFI5rWMfMYY3TPIgkLUN7ZYNvHK1S3H8TlWcKjDjhARL0MrO+2Cq6Q
	 IZ31UJKWmpHNK4sTKOv+alWjx7IS/fF8XGzd7sJgJTMCQVRyPU3/EgGPLCRjJLcwz4tSm
	 /XIJ2alBDnTLkJF7ywGReMxBYorAPPWyUC3eGW4QbaCDBJ47El29mS57v7gAJzst8Fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WlEeGJkb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.22
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012022.outbound.protection.outlook.com [40.93.195.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28680606A319;
	Wed, 21 Oct 2026 23:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28680606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WlEeGJkb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prYfr5d4XQPltZPJ8jvCFj47uS+5Ly9iy6yQgJG8Z89PHu6az3oSobkUIw+3YGKOIRkvM/++MhYnA7sqXv0KrLtwgsk5ddprO5IGpZM0qKI9JvTflN3UwgG7Dgiw5O/NmTxRd+Iv0seMaeIMp2M9GJxjC+lSt88icwURdmDFamDWj/CN+Z7ZmoE/3zKYJTAlCTGY49awwDEjXqPAVnsm0Uz2UxhAvxM7ps4P8cRtjEFzVWPNzNtJlvbS21TLHdU1pt+GIs6iovS0CyEvbMntbQ5k/Fp5L+bNuUragGnWlC+Z8VayEDcnZBaHIj+iGtqbQqNEMkQAwVKkjcgexGwzHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoKIs8OqK0EhmGp11J6t3AZ2ykNz+EQNvXODdZ9eaVA=;
 b=QpUCUr+YxGhoULlkWLiZfcW4Ti4N0L+MlLAxUO0sctG9kvS+HzkOtSCbzYwyLJ2zf1mmDhnBZhqZkmFFuMN0mo+lJZnacrswlknS+VBNl1yUkPRe5/iK2KhZfSGZBllherkkjUlUCYT8wOPhFYIMxtChTgNd6uU/0C2jwvWSzWkCdT4o9lb3qo1Rz5dptSZYxTHOwqQ6ZedhJYCMDMHJpyj3LppJUxTBdvkN74+5tsLo2gG3oDH+rYSa4NWj8L/5vetEfFqzvGJTxlR5KoZcL2jom88oh56wzbYN6nERxhdvi0Hkix8DEVp3FiFv1iSamdBUhdfXJvjaKqHRmq6HTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoKIs8OqK0EhmGp11J6t3AZ2ykNz+EQNvXODdZ9eaVA=;
 b=WlEeGJkbPwCdg4pKb1aIKmbGDDP3tH1UgRZ7j1ab/SSYyacTfNKDbZoHH4AZ7qLz6RQY4w2wUK83P6vvY4EbLlKodE8ejw0PaLemAajfb/hObVxXJQBQ7YvfERyQgOGNtRRK+ZgJ7A5DGJ/02cUaz9k5N327p+SgW9Grg5tis+a9EJym5/I28+8gtc1Zo0oop+ToRES/aqcS3ZNiP5Nl3+zy1vn2QNr/9/x4f84VlwjBacF7Aj/KgkOZXZ65G9LWormHiN3BTNyo4Vd5BbT0rdJPNUVi2fuDRpG3asYtCL98knq2Mt04YIQxglP34E2M2y+QWv80oE6EyMfhdWdegg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LY0PR12MB727857.namprd12.prod.outlook.com
 (2603:10b6:408:3ba::5) by SJ1PR12MB6339.namprd12.prod.outlook.com
 (2603:10b6:a03:454::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 23:12:30 +0000
Received: from LY0PR12MB727857.namprd12.prod.outlook.com
 ([fe80::843e:82cd:41ca:f522]) by LY0PR12MB727857.namprd12.prod.outlook.com
 ([fe80::843e:82cd:41ca:f522%5]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 23:12:30 +0000
Message-ID: <9ad9e480-955d-4164-af45-4c07f04ed028@nvidia.com>
Date: Wed, 21 Oct 2026 16:12:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] cache: add SMCCC-backed cache invalidate provider
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org, sudeep.holla@kernel.org,
 conor@kernel.org, jic23@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, andre.przywara@arm.com, aneesh.kumar@kernel.org,
 Souvik.Chakravarty@arm.com, treding@nvidia.com, jonathanh@nvidia.com,
 bence.csokas@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20261013070205.3566865-1-smadhavan@nvidia.com>
 <20261013070205.3566865-3-smadhavan@nvidia.com>
 <20261015113019.000050e3@oss.qualcomm.com>
Content-Language: en-US
From: Srirangan Madhavan <smadhavan@nvidia.com>
In-Reply-To: <20261015113019.000050e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::12) To LY0PR12MB727857.namprd12.prod.outlook.com
 (2603:10b6:408:3ba::5)
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
X-MS-TrafficTypeDiagnostic: LY0PR12MB727857:EE_|SJ1PR12MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 72163fc5-658d-4127-af14-08df2fc8c803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	8VFOUQlTSo5lvYu2qnvG/NTLPLZ4BNk1wrEiydlv1DmEbOpYptsoDgr2tFfciHAtBohL6+RMEg8VXLocshJY4+q8KGOqcINUNjK0ZtA8KHHr703x7/eonRTGA/qkvUJe8XeMMg3wZGfyTGY4PG1uJcilovpguRum3sJyTSWIJzE0pJwtbJpGA4Yvb4XYLrD+9FuVzE+BpYIaeH9ozTe1JFNUTVEZ1X7ELThAcdC74zYfaAqX7IJ1Cr573hJ9XOYzuVR0Wv37O4LARYXAb/V5frcMFar/ZTWkesI4Kmkcd5gVLW3wCippBhTIdYUOPzfZpJrWcngVpDcqB8Uv7vfUHYWFb3AA+t9NEHGv0ndXnIM9Bw3XPEWiGPL8mDusLocsKvh1wkYNKsudEqDdi2z0aBmF+lyTK6FHKNC2bCyFdHt5F00ss+ozy83F65dR8jmraDfWkOvzc9vCFy2t+SgBZi9E+0FifOELckVwX4TpfYFjPfzeMCAlkoNB6Om3oHWgqT718TK9BPgOyPgj13pb1COI5UgbV5jkY1PZgPDkiaFrvU7XrF4xvVa8vEuFwX4pkaWgAXE5n1CemCRLL4DV4iskDpfS8f3enJ9KLZm75Ctpz6fU9o4jnfCKLEI+YAw+mO28uVh7IzQtHLM7GoMIyln8ri0nP+SVnMJmTiv1bVI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LY0PR12MB727857.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmZMN3hHNk5uSGhyTDhUY25neEhib3BuNVQ2N3orS2hiZGN2RkZYQmJVMEVw?=
 =?utf-8?B?OW5ka1R5OTZkcnRKNk9PM3krcm1tTjd6S1NWRldHdDBCdWdlcjlBNEZaQi8w?=
 =?utf-8?B?Z3RWR2ZlM05jR2Q1b20yQkRHZzJFb05uNU85UGllNHJPWVBzRWQyMVZzVWU5?=
 =?utf-8?B?R0dCTjBBeWY4UFVhMlhaZmR1cFVkWitDMzF2MUhIWVFZWmFRaEUyZzNDeUZw?=
 =?utf-8?B?SVc5OVNMQjNFYjI5eVdDcDlNU0ZlR0tGVGxuaEdtSjlVVXF6Zkc3QTdoVnRK?=
 =?utf-8?B?eHdnb2pxNTFiQjJwYW1zOXlyY2VtMHA1eFRXSkZjcDlWa0czYnQzeTVONllI?=
 =?utf-8?B?K1gwZUo1WjNFc2E2ekc5Z2IvMXU4TlZwYkZuUVZYMTdRY21SVHEyU0pTZndG?=
 =?utf-8?B?TVFtdXhtcktqYmFKN2dNUXkzKzR1NGdZamlTRHNyMTZHVkVKWW1DOWV5ZFU0?=
 =?utf-8?B?Ri8vTW54YUNZNEFITGx4OW83OGNZUGdWS0VWTDJOMGV0amNhTSsxRkxwOC96?=
 =?utf-8?B?SEZ2R1NQSnJLbVkwamFhSkEySFBNUUJnajRKbVJ6UXdhNUxmdjBmTTNLZ1RV?=
 =?utf-8?B?U3pTbUs0dFFueHRMRDhaYzZXbCs5aTRGNFpyRW1hMlJEVnMvci8vSXJoTWRZ?=
 =?utf-8?B?NGV1WFBJcWM4R095Szg5YWpTcmZFZUdtcWtEbVMvV3liUkNSblNldHJwSGlU?=
 =?utf-8?B?TVNtbnFEM25jeStjNldMbUkzZkFIbXVteEY3NTcySTVCeXFzeklxb2NVekdW?=
 =?utf-8?B?VWhIM0VSaXo0VkF4S3JEMHZFRFRHTXdQSStwcGg1ZW5FSTQ5Q1l1bHhzK0lE?=
 =?utf-8?B?NWdxTFVqb1F5NzRkU0YzTmdiZ0FZbEYvOFhuanJrUWNTTEEybXpiaWVZSWM3?=
 =?utf-8?B?K1d1MWJPUi9FcG5vTHNtczMxNjRTcGxuTHRXSXMwSGdFTFh1emY0MXBqYk10?=
 =?utf-8?B?VmFSd3JkNFE4Mk56aTlpNkpBVkJFaE56NUZVLzlWQzVqSURUNVlLa3pncXlq?=
 =?utf-8?B?ZUlOcG5VbmJOWVBMYldkVjlydm9NUlo4YnNhNjF5QUdIWkV0cEhOd3VRVG5k?=
 =?utf-8?B?UTkyMEk0RFcwNFIxdVFhem5FNDRWaWdpb1pxTEVDejR6TUcrM2hoMVBBUnRW?=
 =?utf-8?B?d1lycml1dWprQlpyR3hLaFdFRW90VzVpZG8wZWljOWg3OTJJU3NCckVIK1pR?=
 =?utf-8?B?eXJzeW84N21vckZnTjZoeXFvdGRIMTlhUjhHNS9rczU2V2F5ZmwvTlNydldv?=
 =?utf-8?B?UGNyMkNiQk9BWSttczM0WTd5MUFMM2MrMFNZVlMzdDRENmZCMlpDSzJVUjI4?=
 =?utf-8?B?OVZvbUNLRFA3VW1vekhBdjJ4WTZrS25nNXVLbmlXdXppdHIwRERqUFQ2MWRs?=
 =?utf-8?B?aTdEV0JFSXZrODNoNHFYN29vNDlpWnE4WE04QU1lM0JQQSswMmFHV3N5UDFn?=
 =?utf-8?B?ZCtwRmlZV1N5Zy8wcXhWT1g5MUt2Q0lHWWNqcDZKMlljRUtCdmxudE1taDNZ?=
 =?utf-8?B?SENIR3ZMTVM3d0lEc0NoMmxZOWJJLy8vdGZ2SUR2NUd3RkI0VmVSUHVYa0Zs?=
 =?utf-8?B?T0Z4cnI0QzA5ZkphQ3BlWHBxYStyK3ZlWm1ybUdKTkowSTJ4UE1CeGtuNXhT?=
 =?utf-8?B?YlhTaW8vVHVsMUdadnM5VUk4TWJCN0ljcEovSWh6Vi85U1M0YS9ZT2NScWww?=
 =?utf-8?B?MWRRRHVRamttMDJtK0dBR3JiT3lkU3hIemRKcWZxN2NPaTFHSzlkUFc3TXNs?=
 =?utf-8?B?d1hmRlZ1MGY5dHIxVTdNT1QwUWUvYXZFdDN6WlBUWVVLQ1JKUXFEeVlpdm5N?=
 =?utf-8?B?cEF5WnNtSlZwOFNkY0VvdEp2dDRoa2hCeFFxYXc3Y3lML1V4ZkVVVUJITFZM?=
 =?utf-8?B?SGdqMUwxRGZkeVlUS0JNa2tFL3JSa3Q1SmpwR2lvVmc4d3pYZ3RXLzZJeFp5?=
 =?utf-8?B?aWlCbERVSEdkeURLdThvLy9oU2M3OEM3NTBTU2ZoSDNkZWJwcjRNZDAyVEl3?=
 =?utf-8?B?ZFIxd1BPR1JLaEpqQmIwOWc3N2RQbGhxcnBob2tMNjBVdEZJSE5paUw0UTNQ?=
 =?utf-8?B?a0JsMG5jQUl3eERRMkFFZXloZVR6Y0huUXduejdzMkV1eThRbjIvR05IYUQw?=
 =?utf-8?B?QU1wZEJvanhEeEx5dnJTSnhjWlZsb01JeDdTR3ZlZU1lRSs5NjNNNzhTcEVE?=
 =?utf-8?B?Y21ZaUs3ZmI0eWI3Qi8vYU1PS3ZRMXU2MGlGdEIvMm9FTFhWZU1zQ3JNeFR6?=
 =?utf-8?B?MmFsa2JlTHI0bHE5UDJnRm9xN2hpbXQ4ZGFxUjVwb0JtdlFSditFUFE4bi92?=
 =?utf-8?B?bTdVejVTSTBWNERvek5uOFE3NFJQY1RiMXJKSHVoQnJqMHZCSUYwUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72163fc5-658d-4127-af14-08df2fc8c803
X-MS-Exchange-CrossTenant-AuthSource: LY0PR12MB727857.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 23:12:30.7176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjaPe0ncNZ1MvxcgL5PM7w8R4SOcMTH3PsU/UdaQLMxnac26dWqHLKzGx52uR6KeHf30WEazbHeZ6YmbemaGsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6339

On 10/15/26 11:30 AM, Jonathan Cameron wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Tue, 13 Oct 2026 07:02:05 +0000
> Srirangan Madhavan <smadhavan@nvidia.com> wrote:
> 
>> Add a cache maintenance provider for the cache clean+invalidate interface
>> defined by Arm DEN0028 v1.7.
>>
>> Register the interface attributes function as an SMCCC device and bind the
>> provider through the SMCCC bus. The provider reads the firmware attributes
>> during probe and serializes cache maintenance calls. It handles transient
>> BUSY and RATE_LIMITED responses with bounded retries. It also registers
>> with the generic cache coherency framework used by memregion callers.
>>
>> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
> 
> I'm fine with the changes to put it on the bus and Andre's suggestion to drop
> the latency value handling. So with that done
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 
> I'd probably not have bothered with the mutex_destroy() given limited
> utility vs code added (I mind that less if devm is appropriate, but doing
> that here would be messy).  If we ever see a use of that after the destroy
> then something exceedingly weird is going on!
> 
> Anyhow, doesn't really matter either way.
> 
> Jonathan

Thanks, Jonathan.
The latency handling has been removed in v5 and I have added your 
Reviewed-by tag.
I left mutex_destroy() in place as it is a harmless cleanup.

-- 
Regards,
Srirangan
