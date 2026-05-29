Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011032.outbound.protection.outlook.com [52.101.62.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FF1359A66
	for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 15:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780069810; cv=fail; b=q7CVbl8DFIX6eU4rWZNEM70E7JyYX8FL1+mIRi0kfEAHP4EnfxDuwJiCnJJRZqhgvSul9JRRSiR4t+S1Mxsdj2+sRamGZuKcuBJ3qiduZNOc/TZFtX5P+TVjldJr+4jFXemjzXZHc2w2JomBcyhJxRl3YgZw4UNui0d6KNLFnAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780069810; c=relaxed/simple;
	bh=zZG+4C+5dMrmM6aw9tjr5zRG/L7f9JpUK2YQYsO7Wf4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PLf3NwcfUSmzy9TW8kXKDm0OYBf6ouwpqeisU0vxlFyn/okwUZZhWcBKxQk2jUVmHFVexUFRfSK0L/p0kC6uj83sTXg6RMgTKLDtvhjuy8uph4d2U8V5iEYemL6tKKVjooPLikP+gslMabGYWkDaZ3UfzlwVlhfpwyNKrLX+qEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sxe6jYuU; arc=fail smtp.client-ip=52.101.62.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sxe6jYuU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMx51RU/3nGXkpkuS5/8fCqoaufglOtggznJa+RPIR9g/zYgxdr1EHyfQ9D7M2G8hOwsBodlx5SPnzisiurmn2Kup2rBwficiOQmvihyYpzJVEY/+3W2KJtgSFUpoqDR6KSVgoYfwfoSKz2rxmICBk/tCqXNdbaxYYnyIYSMJfmdxpCwJsOGN0bHE2zfnq4j8ptb0kL8upxL42le36ZGXAxms33eSi9JTOorqC6Bw5kB/ea7y5emEDDRqQ3j0d0Pt3hXr8JxC1/SJAdA08Np5wIx0lFQEPBUBEvzk9skMaNVTthopKvjStq8d2UKb1C5LPNjXBysNvsI3E12m3KRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOINhXeBI41cv1U8Bzy5wur4yLvJULMsiQxJwgRsCso=;
 b=lwWgGgJNc3dp5eStvZ8xzlVWKx9GRmi7glVIzz8UwCxIb7rKa0Lay3J44QnVu09MloVszZsbAVhnndLbPQAWLr6H4JgSvMF948qWoDlJxeABMit6C09xh88Nb1Lkl5mxRDTWEBehniuIZDV5M8AiO1/oL9QGRSn67A/R+ej1ulwRoSuAwhuLjEAZkZIWK39j9do9EYIydfk8c0HM6B0Jk5dBvo0KL8UNPzPTPVSaGJeVvb0tvY2N8gMlPj6kK+hKkFN+h6PeLslUV3zzFEgV2HwKDwaLzWEADXp8Cq/cBB3dXofadyzOMiI8hgtLsJKOvSVprIZ09XGCl6Fatomf8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOINhXeBI41cv1U8Bzy5wur4yLvJULMsiQxJwgRsCso=;
 b=sxe6jYuU8bR9Z8fFs/FYsJtRkcXfwLwEKLvHk8qxL5CDd0syC1HeBHowqIi8a9/3WhU3K49H4o/fKZ00vB2Thu/i2Qf8Tgc5F9aot17TZ6W6I0WINDrIZXA6B4tIW/je/Qti4Z75UPWi/BSoeZ42cY0rhYcEV5AfvTxhWk2zeVzDSyle+TiO1wcbch7DLHYMbaDx6nG5rJT1ifLjqIscYzCQ+jGEz5n/Y5idpsd96VLFgvoU9GF4q6Gr05awhOOCtm8AC9z3YKzfP7B+ShQnkKpKLqh09im4JlPe65pYO/gonyy8hWvc44uTkgCYgedHrYz1NxDJnx7B7wdkpuIvRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CH2PR12MB4326.namprd12.prod.outlook.com (2603:10b6:610:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Fri, 29 May
 2026 15:50:03 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 15:50:03 +0000
Message-ID: <71688c5c-af71-449f-a115-1de6c820e1a5@nvidia.com>
Date: Fri, 29 May 2026 16:50:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] firmware: tegra: bpmp: Add support for
 multi-socket platforms
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org
References: <20260529150847.70545-1-jonathanh@nvidia.com>
 <20260529150847.70545-2-jonathanh@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260529150847.70545-2-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::6) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CH2PR12MB4326:EE_
X-MS-Office365-Filtering-Correlation-Id: f59135e1-81de-4ffa-d57d-08debd99f2b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kftIEuXTznR10x0huWhEje23gSF23NP1olJ79oao73VAZW8lb91ENfVIsc1vYS6iqXQDKyndvwpYcUsGxVxqh4icu5gwiE4gB0T05XHKaAOHOrKmfKap1Ic2L1aIRsAlIBJTZAQNdAIinfWGQmyHPNaZaNA3WWduqLXwxGrnm2MOVk9mbqjQ/LMRbNbYMO9F6/V3ucU1Y297Aq3QHXOBll76fTSmtV38r408NUyvXV2djmS2LrmQDTn4lAtxEPn9NISBBL9K98iaZppIYk7l9FknlBpMQjkvYslr7mnMUanAEZxk7iNB28XY8fYxPDCJDaWcwjs+6Lb/uuZhFQZwl3E63ByhJE+z3tP4F/GNekwzuOFHz0Xiz8g9Nirgvb5eCJaQEX/Yxh33rgRmT4BAZjP+Bql7RCnSYJYXa3+DNziYfGiCgy2D+/PAI3YDIF9+vNwmqDK4u7CL+KLeDhr5aNqnJsR6bB6Z7ryw26W9KDrG0slhfXsFxnMl84oqGwGGgF6sLhaw3KEmp6bz79mPaNIwJ3Ul7aoRFykHHSoPxu+hZ9ZDfBCWrtaNf1yx5gRevncPcb+TIrhMTZoDOyDCrYFpld9Xgx6ygPV+cLRWEeEiocpghGLmpqHpZMAd9PIR+z6Kt4GAIoBT9HHRjqaV+HrSlcJgceuLegnvF+5uECJwYiNnV2kEeD4Tr1sHp1n9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3gwLzMremFWWktkOE9XWTdkdWdyODllalhXZW9aZDFpYU5kZWRQUU9pck5X?=
 =?utf-8?B?QzdGbVZteEI1TEVxNVBIeUppMVdZUE5qVDBIWVpCLzhSUkEzZWtwM0hqYTdq?=
 =?utf-8?B?STZZb01YUnppVkZVOCtMcFU4Ym01clVkSjR0b3QyYjBXWjZ3T2s2bVBXMmpV?=
 =?utf-8?B?RElISW5xRmlRZU1yMTJ2SWpWL1VhaFNGZUs1YjJaQTczc2ZwMWZ1cDRGNzV3?=
 =?utf-8?B?TVFFMFpFNFpiK2JZajFCamFwYVlyYnZpeTJ3RWtLR0xSRUEwZVlnVTFkcGtV?=
 =?utf-8?B?TnFTWUU4OXpTSVd5ZVJmRytoNFFzZ3U5MkNLdzNXWVh3a3N4a3dPZnNSdGd3?=
 =?utf-8?B?R0EyV1FUbE5XM2tRYUpWbFV1MjJpMldHb2R5WVh5bXRHTUhCa2hTcXNFOVFm?=
 =?utf-8?B?bGo2c05WanExNG41dUVENjhhaDFFK2gxSTNvYk1UdksxZkFhMFIvY2JyTzNX?=
 =?utf-8?B?Q0l5dzVielp6NE1FNjgvNEFNRWF1bGxrTnJPYUYxZ3JoZ1ZKMit6bFJwNElU?=
 =?utf-8?B?dXFSM3JUTDhMcG5RNU10NE9HeG9tZjFqb1BSZGgwQUxlUnFBL3JuYm9JOFhR?=
 =?utf-8?B?VHRhcXpmeG95c3hlYTUxa2d0MzNDVEpYTS8wbjJXdS9XclhzemJ6VG5hcS9V?=
 =?utf-8?B?ZGlQVzZ3T2g4NW13UmZXTVhuTnQreTAvVVNSMU1oVDVubklTRlpTUkxpanNk?=
 =?utf-8?B?OHdTalRDRTk4RjdlWjNuYTBETEFGYXFJc2RJMXBqMk9xdlhCZnd6UEhudk1u?=
 =?utf-8?B?TldaZ2hGcmMzeVF1VjF2REJXL2RmK1NNMjVNbGlDN0paVWwraTlBWFJ6aUpX?=
 =?utf-8?B?Q0V1QkRpTSs4U0NNU1NQUWxvWU5RTlI1TUFKVFlqZThqM3BLY2xuOVdvKzVk?=
 =?utf-8?B?RjJzbk5zTUU3OW0vVmtqaGRVeXZ1ak1sLzVua1g2TFdvRXd3NWZsOHdSK2p5?=
 =?utf-8?B?d3hZSEVoUTVTYVh4cnZaTUxPeXhyMVBmTnp4NCtoTWNvN3pkMWtnSStkelAr?=
 =?utf-8?B?SFdyMk9oL25VVTZPNUpINGw0SXNFTzFxcVZGaHNrZ0VNYUtwSFoycG1nR1Ix?=
 =?utf-8?B?c3RVdUhiS1FhU1lWcjFpa2lYN0k5TFZtNGkzN0hWcC9GT0N6STNyck5CL3FM?=
 =?utf-8?B?MnJaZGpKV2lrY2NUVVhJbFFZVyt2TzF0VkFJVGYydHVORzVMZk00NVVBejMw?=
 =?utf-8?B?YWNFUWF4cm9DTTFSaTQ0WThReEd1ODZaVFNqK3o1REhoQTdmZWNramJoNmFH?=
 =?utf-8?B?MUp4WExnSC9NT1lXbExVbTBub3VQMW5aMTRqWGYvcnMxeUF4SHpXZkwyV09w?=
 =?utf-8?B?bjNqZ25MSjIrMFFrVHRscitIRXlUUkZXcXZHUkdFQVN4SWhqQWtCc2VFVkg3?=
 =?utf-8?B?TzRpRm5rYVprUFhpRjlEWkJKaVZOVVZCVnhWd2JuV2RYcmZnaXl3eGJHS1py?=
 =?utf-8?B?eEhqcE4veXRlRHFvRnJrSktSb2hLV1JZTFJpS1VucWQvU3J4RUR3WllmNXNo?=
 =?utf-8?B?R2xaa2xTemFvNmZnTzRRYUdtSkdoOGNUMnBBbGhBeVRsWkY4OVI5WjB4VE1M?=
 =?utf-8?B?c0RkT0tVbjBQTUM2OU50aExweDFHdVlZRnh1Y2kzMG5FWWRmRlNlTTNOeEE5?=
 =?utf-8?B?ODJzR3V3aVkxOXNEVlhFWStaY21UVHlOWGwyWDdWTCtuaXZ2cHdreHl4RXRN?=
 =?utf-8?B?TVJtKzNOS1pQOG13NTN4YURXYURyNGJnUzEyL1c1ZWUxQWJ5SGN5S3ZTeE1a?=
 =?utf-8?B?aDlzUDE5MWF3ZEQ3K01IdHNWQXNFNlFMd29sUkxHZjdDcmFveWdJemJEenlR?=
 =?utf-8?B?dzRTSWd5WlhlajI4Snp1bW5aMFJncFdWcTBrOG14UkE4aUJadFk5RGpNalRI?=
 =?utf-8?B?SGpEbElzNU1ER05qWDZYSnBJQUprSzJnWDgzSGpyZUU4WEs3YW1kVk1sSHo0?=
 =?utf-8?B?dVluWktqMFgxU0hjeWt5ck1ZMjZ2MjJGNGhBeUNyNGVZaW1Eb05TMkJsVytT?=
 =?utf-8?B?QTlDME1xMDQ1REVWdzJnZ3Nka2FuaHhLNTJyTHk2cnFWTThrTHJFN2o2Uko0?=
 =?utf-8?B?VzhrY1B3dExRZHVzTTludmFrVHpRZmJ1UFdzODd1NTdYK2lUN3ZKTmRDbUtq?=
 =?utf-8?B?M0pwRm1kTlczSTB6Z3U1aVNwQ0pRcVhqNjFtam9vaitnSmxIa2dFWTRkQm5I?=
 =?utf-8?B?d1NCc0lDUnhoeGd3clZHNFpuVHNPYmQxTlU4S25sRjkzcnQweGRMOENzYVdp?=
 =?utf-8?B?WjdSUldWVVJ5SG1WNU9wcVlmVEFnVlN2cnhKcm4rY0QyMGNVbWQ2cE4yWkdp?=
 =?utf-8?B?Tk5vTmU5NE9nb0Z5YngwOGdXZ3JnWkpSVWMzWC9rUXk5T1RFY1YwL3dxRXph?=
 =?utf-8?Q?LTl1M2kNacuIa8jQVo3y7vKjXkq7jaGeWjeVXPL9TkIeT?=
X-MS-Exchange-AntiSpam-MessageData-1: X0ch3+1QYoJ3Sw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59135e1-81de-4ffa-d57d-08debd99f2b7
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:50:03.4087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbEpDfozeZ9dwUf0lp3gRC/gKwFRkzCpaOwV7mZGSjeLGzzEdmjXJk+U+bgEFP26qUmOJimaCsbYeUEK1vvxOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4326


On 29/05/2026 16:08, Jon Hunter wrote:
> On multi-socket platforms each socket has its own BPMP that is
> registered with the kernel, so the existing single fixed "bpmp"
> debugfs directory name cannot accommodate more than one instance.
> 
> Group the per-socket BPMP debugfs entries under a shared top-level
> /sys/kernel/debug/bpmp/ directory, with each socket's BPMP device
> under a "bpmp.<numa-node-id>" subdirectory:
> 
>    /sys/kernel/debug/bpmp/bpmp.0/...
>    /sys/kernel/debug/bpmp/bpmp.1/...


Thierry commented on a similar patch [0] that his preference is to 
prefix the NUMA ID rather than append because this is more hierarchical. 
We agreed that we should be consistent in our approach and do the same 
here. I will send a V2 with this change.

Jon

[0] https://lore.kernel.org/linux-tegra/ahmsDANt8D7RSYdK@orome/T/#t

-- 
nvpublic

