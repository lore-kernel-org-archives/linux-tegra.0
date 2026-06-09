Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8717E2DC32C;
	Tue,  9 Jun 2026 14:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016718; cv=fail; b=ckcAPKofzKfHEOO+LaXqnB4LcIBrT1BK4XfhZ8XTljVeQ7ZH2+N0bGmor+pjCTr6CLZqTWfDcPQ1xVXtgi5s2y16ckr5YN/51Q6gHqiRTX17nEUc74vZQjSnaPaLGtPAVNgiCeHCi0qNCA3/EyZyW4LkgqCWe65bCdYHxn7N9lU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016718; c=relaxed/simple;
	bh=CrD/tiAWHnYN8MKO6FHkQfbqxOMjYzH9AzoH2Zx2FAc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BeRDKdXf2SiuCmvPvqkM/GM9cF0G+fbH70oSSNMiwU3Mz24qSN2Flb1OE62Rba0sZ6KUpzjOFBDxV4DkqNic+RZkkg7Kxk0V76RyNfnT2QPe+Rtk/qOiuPKgnjAhxucpO2jvWUJgeWEL0RKKzW4xc/zVAN+P6KIpfxfFBPRCWdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WbKmYRaU; arc=fail smtp.client-ip=52.101.48.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WbKmYRaU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHETJD0+vGGDjqTV3J2Nom8jy/hGhMHM2clo1kz7LZVTY/IoWPxRS1D0jy4wP3eBziNOMbES5Ga/Q3DW7W03Lm/cPV/Zr0RnyfrPERHujyL1SgXaRjHS+DUPQbwnMy+8Q4W5K/tTSDlRGvd9pozc+72dj/LdIjZlaJOa1pZ8CSl9n2GlZcmdcA+8qB+u0dv8k8SKFUYfQKGEhQAXFJF3VgXdARTBC5fnIVM9eqwZjw9q30zZf/CM1G4r2ecYNeRha9hj4RbO0aOZ+J2QMYtnVHIxdQRqKtFKrpC+uK346Mk99NVlO/bdfFXAS3vKqEFPfjWWsuNY4JFZ+eyQGFjjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdpUNHITgl7w26v7/e0SPpTZf5GTrp5doCGBUrAd0Uc=;
 b=Yjq0p3+pRH/rnKFgcO0csZ25RCLYat9pey4ren7c0yHvJH/gR65G0xJ/3RenottCSqpnAd1/HrYhtmI74ebSvzf5cX85/kCxSDvCI/qv04sqCwU7rrHSvEknYl2MtQXFYqch9pwsxq4sv+RY5HyjGnFgE/oF8rR2MdyN0ejXiCzcszgZNl+9dhL906dZvw6oowoeWqG9fnRcmBcsrSbJ6ZDANrPlPEQQsv95+lCd25enU/I/5MP/W3k7UmU7TNAzMDIGNmllfujuZy+1y2jubAp7t0BLfBR0r08p5ffAFsfuKc7ZAVrcIynFARPyFnbYGe6QJs+3FSZL9fg8ebh7Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdpUNHITgl7w26v7/e0SPpTZf5GTrp5doCGBUrAd0Uc=;
 b=WbKmYRaUCz6BW+dJRbCLYmaw/oR+W1BS/fRVmqyKhFJZbMF/wHPLs7fx/5C8Jcn/5UE2xpdLNELVreDi0NTarstnsSCE0MVv0Lr5kCFWG4WqkP8UrhfAX04Ora6yF8zpsEqo27WpEYZ1r712pVB2tLuO86/N3yrlLUJ8bLIDpEh7Ji5DByROCBmDZw5XsNQLASkPudiGpok/1JXaPebTysTRqkNmiuIa4HxI23ep2rQoytKP4pLmeAQL63OVr34pGoL2JD+w83fs2prvS995wt6y3FezN9ziFUfd/uv3UwLrD7AZp7uy88ChimjEtbXpwT5qq3+DaV1HuIGAyfxJHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SA3PR12MB9108.namprd12.prod.outlook.com (2603:10b6:806:37d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 14:51:54 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 14:51:54 +0000
Message-ID: <fae4cd9d-b529-4c8f-b748-2cb9847ec85e@nvidia.com>
Date: Tue, 9 Jun 2026 15:51:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] memory: tegra: UBSAN fix and cleanups
To: Sumit Gupta <sumitg@nvidia.com>, krzk@kernel.org, treding@nvidia.com,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: bbasu@nvidia.com
References: <20260527140127.49172-1-sumitg@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260527140127.49172-1-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SA3PR12MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: 424e41a5-bea2-4b0c-e31f-08dec636a58a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	NIH42+Egy4GkJWAF+c299hinEUn+Jo1vFqG10sMbL936eztJOQo9AjEN97EH6N7znbjcGjX+KgtZTOEnm7H8ckphgLOI0gr6BXXlT148EtoEVTKQTKmKNWtwERN/HwtkdL3WHYCjv0LS0g/jjduwKs/xJDSWWsU3O5jJf2qKyldPHd+CcrUBni/G1WFAHlyrec9QarNNBHA/AM97DYnJYXgVzeBXHUOWBJH2IXrYWCer8vms4OausqGhO+hXsc1k+dx9iTBsT8IR/WOhbsRuYD8qGkADjfdkat8xWWbmZTo+mWjhZ+0f9WNNSXq4mbfLL8+GCga0ICiu1/7QqzSCBLm9j/IfTpc4K7JhgfaceePZE73txVK6niYq/DLisKaMEX0aKWa7Z6AQ2+RdWQvkas96biU+l+itaBCDOYPTAWIFuxJNHL9kvM2LUw+cijSj6I4P3YxZz0fyebbauDcGSfSoz7QehaHJJb645NJ1r/k+qXqaByjfqhh11bzgAZzXqCXBEZZGZ3wYhSFacvT13N7kORR4bu7s8ek2zGcEp5Pr7NIMUrRH+80CvqNbmNPEJQM2GMUOjgf+RXVQ0oQ7W5X2slo+XITlNKz20dQwN0SHSif4i1Fdo7BRFxKky4r77DXgahYFip0D/VwDiQQGa4YfFDDb4FpMx8U0gDFtW/6GVhPL8+kNNhGmzFxG2u2o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STk0UFIvOW00eTYyaFVDdXRwaWVLSWl5Q0ZqR3publVBVkpqRkUrWkFvdEdl?=
 =?utf-8?B?WjBCZEhBVTVOV0N3RjFsOTJVaUVjd2pyUHUyZnNVU0FnSk5vZUl5bGkyRzJY?=
 =?utf-8?B?VEtkMVJTak9kazIvUDB2aHRLZ1M3YTluejkvWE1oSXlMUTgxL3d5NHN6alg0?=
 =?utf-8?B?bDE3RG4yQzZFN3Irc1RFOXcyaGdzY0pZOWVWVWVOWUd1eTR4MldwRnd6OGRx?=
 =?utf-8?B?OVg0NEl2SG1EcE5kUzJtVkV0aTRTZzhyS3Y2UUJLbUhaSm45RkRzMUxlSnhU?=
 =?utf-8?B?cE1mSDFadVdnMkxUUkZuTmxZbzA3V1puZm02VFB6T0pMMTlLSTJEMnNZWjhU?=
 =?utf-8?B?K3k3NnlhSHdxeGJ3aGJjSGpoR2puNkZLMFZ2aG5tOURXK3hGZmxYbDNuNkIw?=
 =?utf-8?B?M2VtMGZKc1MydUhUOW9QY21jZHZ4OGY0MzdpL21la1ZHSEFLTUliQTdHZXFx?=
 =?utf-8?B?bDJsbmNGcnFxRWpybEdDR2I3c1JzZ1RWZWYxUHhSdDJSNXRUSzN4a3NlZHZE?=
 =?utf-8?B?MENCeGRQdjh6MkVzQ3hxenllMnNvS3QvbWNwZk1GbDcwUTFja1pDbHZJekJq?=
 =?utf-8?B?RTJDOCtHS0JZM25wbnVmOGkzV3dxWEhTRVFNUEVWL3hPK3IwMUR0SG4ySGp3?=
 =?utf-8?B?UmxqcUc1K2dIM0pubWg5SHQzY0NRTk50RVUrdlk5R095d1BsaUxnQUdvQS82?=
 =?utf-8?B?ZkxleExUNkdVUW9YWmZCamNVbnFEcjloZ0VXSU1QTVRDYnVDcVpYZ1hja0Vx?=
 =?utf-8?B?c3AzYzdqTU5aVUxkUEdtRVdmQ2NrWDlrSFRSY1V4TnZCdU1ObTRsdktTa0FV?=
 =?utf-8?B?bWcxZEJUaFlDRnFUNjRobW1QVVVWdjhrcFU3RlpOSHBTRjNCWUlPTjRIVzNZ?=
 =?utf-8?B?WExiMUhmcnBzRUVvenpNTTM1WVhiTENEODFJbm53ZFNwVEhEUlVaN3VrOFNt?=
 =?utf-8?B?RFRxanhuWElCZUcrbEd3TldEWWE0QjUrNFJSZUdCbFFoUGpqdERwcGJnMXZU?=
 =?utf-8?B?Mzh5eXRWSFVFVmxIa3Z3NytMZE5WekhsenJXTitVTlVES3pXenRCSmdSL1JB?=
 =?utf-8?B?eGdzbVVqMU5NMk1ZSytFNkhUbTdTM1E0NEw0QWI1QW9JaVkyb2hxbDF1SGll?=
 =?utf-8?B?Y2RYQ2pVZWRhejl3QXg4K1Z2YlhMNXdxZ3AzTkhvMzhGd0hoaC82S0tlY2tQ?=
 =?utf-8?B?U0ljNzdlcVUzd1lJZVJVS1FsanhBRkRDQjFrVzdUSTJkK1lGdHA2R29QV2x1?=
 =?utf-8?B?cTFmSUlVRFlRYjM5c1B5cmt4bGhqWmlRM1A0RVYrMHFxcGVaUkVEb2FPaXpL?=
 =?utf-8?B?YWdFTURUZVJHY3pIaFdCMG5JK0hGUWRxOC9lbDRFOEdEMzhjMnNadEpMRHNt?=
 =?utf-8?B?ekxTRWtPVEFkNjhucENTYkVCK01qZXdSblU5ektQSEYyY0tZWEVXM2JUSW01?=
 =?utf-8?B?dExSVjFsWUN1NGxHT0NmT05HSk1GcXFyS0JLK1BPQlRtem94ZmJSR0ZzckV1?=
 =?utf-8?B?Zi8yN3dSNitaWHQ0OUtiRHdvT3dNMTZ3VGlkOWN6SEFKK1R0L1l5cFhjbStp?=
 =?utf-8?B?YWpXVW41aTA2ekhkT2JMV0R0clQ5U2Ftem5PbENweHhyVS9hOTRZTG9oVUVF?=
 =?utf-8?B?NVJyQ1NrV2NFRDRjVEhVOXdWakpjQ0tod1JOb2Fic0VrcE5qN1pDT0Q0VVFT?=
 =?utf-8?B?Y3pWaENJMjRFSkJDRDhGL3lMcDJqbXhBYU9KV0xHWTJqK2hiTzNjUHpYM3cx?=
 =?utf-8?B?YlZLV2d0ZytkaVVJeEVKWFN0WVpLZEVOeTNjdEE1VUEzRGdPMkc3cFNUOS91?=
 =?utf-8?B?UklrajJBN2NEQnF4Nkk2SXZOZGtadDZnV3QrbGpSWXZlNFdZUC9RM1poRFlq?=
 =?utf-8?B?ZjlJZ1IyRUpKTmljUUxGWFRGMkhUM2J5eE9IRWtzRlJOZkFldXMxNXJyK1Ev?=
 =?utf-8?B?WkhGQlVSVTVBVU1PcnhYbHVxd0V3Y3BZT0M2K3BOWHJjdmhJalhJTjFVQkEy?=
 =?utf-8?B?SXdzYmVxL0x2Njl3MHR5cjFZSUlTeGxMODdFbXJueEtTdEVVYkNzMTNVK2cr?=
 =?utf-8?B?VGd6RFhYQVl1eTZjczQvNmNUbkxXZkEwSnZFeFJqZ0lPaGR2dUlaNEl5MG9y?=
 =?utf-8?B?M1g0SnAwb1ovM0JMYWcxSEVqaWE2c3R3dWxxRlljcTFKSjBsM2x0WlZqVjUx?=
 =?utf-8?B?SElhcHZ6eDhwMWwxQ1ovdnQ5RE5CK0VoaDhFOTJRTmVGdGkyU0RzMWloWUR2?=
 =?utf-8?B?UFhLNGlCbDdPeVNIaHc5QWdteHZSaFdDTkxLZnBOWWxyOVBpQjQ5QVZXNGNL?=
 =?utf-8?B?L1ZjRFZJZklveExVZllNcFdwZ3dNUUdTajM2b0FqTlFSMVBTaVh3Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 424e41a5-bea2-4b0c-e31f-08dec636a58a
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:51:54.3259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7pP0n4k+13JntfYTp3gWCem/3UbvHYrEz/jjpJ2s8ufhMnlY7fQLOebk3ZTksY7mlfzVOFcnI4hyI5vauq4yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9108


On 27/05/2026 15:01, Sumit Gupta wrote:
> This series fixes an UBSAN warning in the Tegra MC ICC aggregate
> path and removes two pieces of related dead code.
> 
> - Patch 1: Sets the EMC provider's aggregate hook to
>    icc_std_aggregate, instead of borrowing the MC's aggregate hook.
> - Patch 2: Drops tegra264_mc_icc_aggregate() as its only check
>    duplicates the one in tegra264_mc_icc_set().
> - Patch 3: Drops a dead 'if (mc)' check inside the CPU-cluster
>    branch of tegra234_mc_icc_aggregate().
> 
> 
> Sumit Gupta (3):
>    memory: tegra186-emc: stop borrowing MC aggregate hook for EMC
>    memory: tegra264: drop redundant tegra264_mc_icc_aggregate()
>    memory: tegra234: drop dead NULL check in tegra234_mc_icc_aggregate()
> 
>   drivers/memory/tegra/tegra186-emc.c |  4 +---
>   drivers/memory/tegra/tegra234.c     |  6 ++----
>   drivers/memory/tegra/tegra264.c     | 17 +----------------
>   3 files changed, 4 insertions(+), 23 deletions(-)
> 

For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

