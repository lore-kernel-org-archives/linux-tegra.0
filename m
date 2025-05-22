Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F3A298986;
	Thu, 22 May 2025 16:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747929971; cv=fail; b=j193SaxZ5WYm1W/JoL5x31s4JJK29jznbv1qmd5aiFpD+78dR3FS2KN2/bydDqEjunliEvpCYEATl89Cs4FNR+o2tdwzMNrROjE2fobeJNMQj1q8avVVVxeAflXRuFOwtAdpOkOJo6z284epfCPCvT0SsAArV92opbdFOM3QT80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747929971; c=relaxed/simple;
	bh=HJxOQ44T8Bcb91kibh0vz22o0BNjAB5UzaFC1kqIHMQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EEhDdiBRgbk01u8bRL4JAsILruNRJb+XayuxQmhMzWSEldF12DpX1Zi+xeeqNlsYNdDf5OBWYnHXTe9FQKUVmOiKc1EyLXOML2ihAbX37Kaa79WRbdW9aemLCiWd/f/BR9BpBIq0/ARJyoLojz+bvtvorvX9dndQXInTa1rkhxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=thyo5Y2H; arc=fail smtp.client-ip=40.107.243.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="thyo5Y2H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcTHdJJeHuWbiUdSbMTUFRt8ZCCvYT2N7dS3Ism1hG2pDg1kdSfos5kMPaGyyGPrTb2uEbaR6Xl/3RA6DUJNMb7XCuelO6prrbn7OMR3758k8CUKnuXQNCZHKm1rwUKSBjCg6NXn07GXA/DUXl0vusVz6v8+IT9DQxodasWJtHjCiq0Aa6WnpZFbWIxUHHxiB/bLnS6xPYdZETzqpRqpvcGZeGpVqraSVK53aUZVb8ArIWtL8U+hhVkxqCAhijL2ck+73run37YhpMPvi4VUavJpBd0ZnEhJ8U+tesbtdKjWit+nDOkozzn4weu6Tnw1cLSKVaaooX7ftEGj9UYWow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MltjJEBCNvT+AFE0gYo1hdQLlmpq6N3p2rx8zgQMmTs=;
 b=E8/yf1oh9yRpfJOzueKGxX2rmGJPTCh4+rocvUQYnJmnoCB3NlcDxpgqwJG8+5IdVV/B5aaI0Rt8JoGiliBRu9XZvw0XvrxlQXYJKKQDDryaIyLPKlPeSQEvny7x6daDEDH0dG3UL2d9iWeanc6HCh2uoaTdFTFSPd3W/4fNkvUo73dxz3gKBhmk03tubDR9c/G2tl1ItJtErlw+MvDOCTe9VJ/dOmumdRO5D7yCRXrb/f759yKkQe+niUyV5JWIrqJc7k5oB2ZJZujIsbSg4VSgXcAnyQGzQhJmznGYKupp9Mr/x8R0BDT8M9VTU7vdjTA/ZU9FXoU7/zsF+OLDnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MltjJEBCNvT+AFE0gYo1hdQLlmpq6N3p2rx8zgQMmTs=;
 b=thyo5Y2H5/4snYwg9i4YcW1XbuQCEy+nz9b6YUcLRPkJf+Qo/+Vb3mE2WoG4mLHx1ISosE4T0nvTtld388Ov54WwO/0m+QwH1tK5IVvclbazFqMMEvaQKYl1VQs2Es4sqE19ex5X/Bkqxk3jFAfjtVsSY8aDdEBhCCkk4KXq8iHEQfWrxCRZz3ZXzwOKAUqaDolZUksYT2UVvpYpBy1QGiGGGmp+1o6JO8Af9FCiDViLmDQ6cGSGYOR1pEdc2Jc9mVRj+q6DreWHgaXuQyHfDpErfE4F9jFeQBmR+N/srMZ444j3OBi5f4z3PjhBRRgHYblPqfsjqeENnzmut2KGyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16)
 by BL3PR12MB6379.namprd12.prod.outlook.com (2603:10b6:208:3b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 16:06:06 +0000
Received: from BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::25e1:5ee7:117:8923]) by BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::25e1:5ee7:117:8923%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 16:06:06 +0000
Message-ID: <6f3c4afa-e8e3-44c7-9323-eac02bd558d2@nvidia.com>
Date: Thu, 22 May 2025 21:35:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] dt-bindings: ASoC: admaif: Add missing
 properties
To: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 spujar@nvidia.com, mkumard@nvidia.com
References: <20250512051747.1026770-1-sheetal@nvidia.com>
 <20250512051747.1026770-2-sheetal@nvidia.com>
 <54078715-84f9-4d6d-8c9c-2517f5972225@kernel.org>
Content-Language: en-US
From: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <54078715-84f9-4d6d-8c9c-2517f5972225@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::15) To BL3PR12MB6473.namprd12.prod.outlook.com
 (2603:10b6:208:3b9::16)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6473:EE_|BL3PR12MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: fa4783f7-2755-4f90-6d15-08dd994a8f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzBscTcxRFJPVExoa3FacUh6TnVpdWNtUTFLdHRxUEVEWS9FZ2JlVGtRYnVt?=
 =?utf-8?B?TlJidlFXNWEwNEZHSnNVMXpSbW9jSndZMEZrMHdFR3RjU2ZTZGNaNXNna213?=
 =?utf-8?B?YTlneW45dGNESVRzc3h6bDZTSGhaN1JXS29tMEVpMWwwcGw0Z1Z4VEJvcXll?=
 =?utf-8?B?UWJqRGJxS1I5VEdDQjdGK0hMbDRROTNjQUtDYVdjOXlaS3R0Z3hybk9HaTNR?=
 =?utf-8?B?MkNFdWxiMlNNdmhKRGNISEQ4WmR0bmRJa1luQXliMmttQk1mOG1hanJYM3RC?=
 =?utf-8?B?U2dtV0ozcENDU1BFdVVvdnhIUEVBQ1lxalNlbmVFMitrS1VQR1BuUHF6dDZy?=
 =?utf-8?B?RHJrUW1YRFFmQXdBeFk1WmxlQUl5cjJvQXJDZithNVI2aEZjSlpFVmlCUDNQ?=
 =?utf-8?B?Rk5JcVBzS3dCU01XZWpYbWRJa2tnN0JjYmRITFNHdlJDOFhhcTBabXQ3eXhw?=
 =?utf-8?B?VlJOWkdCYXJSbHE2eTdvSVA4NUhqZ2xXLzRXaUNTQm9Wd3RzYkVmTjhDamdF?=
 =?utf-8?B?TnJBYXF4eVhhUkVZODZGYWlEN3pQc3JLdS9kZkN2Y1JrY1JRS2xYN2YydUEx?=
 =?utf-8?B?bnJ2ZDVkckV2VlJXYStIdlI0c29Rb2ZRYWdNanpqN3JUblVmVzg0YWxEcm14?=
 =?utf-8?B?aUczNW1JU1NlZnUrM25ZbmJHRVo3aFdLNUVjWE5vajlDOXhSME9YZTdGU1Ux?=
 =?utf-8?B?b0E1RTVtWm05QXhENmszRnF0SEt4QkpJOGJDaGhYWThQQWxXTHNUUjFpRS9T?=
 =?utf-8?B?WUwxUFMvR1ozcW00RXNZVXlqYTQ1MHA5T3oyNHRpUVYraGlnUG83bEpsMEJF?=
 =?utf-8?B?a3VUNWlLMDlEYmh5NVFlS3lWNncvUnZ6b3NWQ3RHZHhJWEJ0WXJYcGpSQjdY?=
 =?utf-8?B?bFVDSWg2WXMvV2V0ZFIvMVRRWld5cWwwcTNPL25sWmlJdjhzZnZkVjQ0M2ZQ?=
 =?utf-8?B?cmxuL2g1UWFsSWJzZ1I4Smk5b0lDNHFtdldiZTZRWFE4M2ZiNjFmNFE2Z2c0?=
 =?utf-8?B?N2lPOE5lSkVweVlHaEFVbGpXWTJXTTMrT1padTNJNkx1Uyt4eGE0V2VWRzNo?=
 =?utf-8?B?WkNrWi9KejdDRkE0U3RhVXh4NjA4Vkx1aGFEUGVyMWR6Y1pESzFDK0dGUnVE?=
 =?utf-8?B?dHZzZXNaMlMwZTM0Y1ZwcHZqeGpGMjVFSHF0OXJ5VE1JK2EyKzBZNjVmWUt5?=
 =?utf-8?B?NXZ3ZHI2U2tJZlZZMUVzRGVNVS93elRWdUdEYkN2QTd6SFVpNTJzREUwMmVr?=
 =?utf-8?B?ZVk1TEtLZ2w3YWlqY21JY01kdC84eXN4VmFTenFzM1BrRk5xZDdwT0tMVE81?=
 =?utf-8?B?eURCdDFGTTF3MklMUkQyMWExZ3pYSzlQRmxWL0tOek90emw0WDI0UTV0WkM1?=
 =?utf-8?B?V25SSU5PWnRBZnkvLzE1TW1TSTZna0FJMmJTaHBRMmpPakhxcG04SEwyRXFG?=
 =?utf-8?B?Q3NBVHhvQlRTNFkxSUtzdTJJMXhGYjlibmhlRWg2REpIK2pTb0NBY0lDKzNU?=
 =?utf-8?B?Q05vNGlFdS90anhVVlZOMXBhNVNJL0MxbENINE1EcGJ1Zmk1VDJLbkU1Y2FX?=
 =?utf-8?B?ODZQK3F4T09PVEtHd21xK3JvWlB0NUJhWjlIRnZGaXdyMFlZK3UvSHhsbCs4?=
 =?utf-8?B?SHg4eGV0emJOYkRCRzhnVk5UTmYvWmt0WlpzUjU0djNOQzd3T212L1dxOWI3?=
 =?utf-8?B?SXJWS2RnWjJ2dnViUkl4YW5RVklUMFFsUmNqS3BXcmJSZUYyZEdCeXlNYTVT?=
 =?utf-8?B?T0ZFQlZnN05zMkNHZE0rQmQvMEJNTjdubHc2Qll0anpoeHZhQUpHL0l0Z1Rw?=
 =?utf-8?B?YjUvak5WcGhlUTlCYnJ5Uk1yQnQ1Q0l6bFRvNU9qaW5ROG1paWs5RmE1eHVi?=
 =?utf-8?B?Sk5pa3g5dlAvalkrSTczSlNsQ0pOK0YxVFNLd2tEWmx4ZkhLV0g1WVdlcmZj?=
 =?utf-8?Q?+JFTBtfpTzs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZW9OUlFNbjljMlhUakhGVE5yL0d2NkpRVzR4RGNVZkgvenVBM1N6NEJUVnJU?=
 =?utf-8?B?MkE5RUNzYks2bkpjd0xIeDJnRzllVzZNVDJzR08vR3dnenpxVnljWjNMYStF?=
 =?utf-8?B?OWhXZ2p0Y2plSU4vdXVCaWhndEZDeWZyR2dncE9HS091MUVVUDRyVXUvMWg1?=
 =?utf-8?B?dnVkTStKVDRkV3FFanYrVGU2WThrNnA4TmhQa09sSG12cExPcU1hb2lVQVRm?=
 =?utf-8?B?M1JNczI4bUtlL1Y3Q05XZ3NtTWNjK2hxZkhLK011MFRvOXdsb3FBRUQxQXZ6?=
 =?utf-8?B?K2ZQajh3dUI0ZFpzVDdhVFB5Z0ZDNVBrTGZ0RkZFMGUraGxVc3h3TXorMEVN?=
 =?utf-8?B?ak4xdU9FTVFFZ1M5SkgxakFnd1hHNlZQSHJ0QnFkWWFPOEt3MnVWb2lrV2I0?=
 =?utf-8?B?TFIycWZCYW04NDZocS91WTlZUWxaWFdEcXVaVG12SlRwdkRNSTVnZm1sMW8w?=
 =?utf-8?B?Z01GYWpFaEJUVGp3OC9xcHhWcjNmT2poakgvN0sxWVoyNWhXbXlQNGxTbGJm?=
 =?utf-8?B?Q0JmSWcvZEk1MUJiUHM0SEMzaWRySjFIR0ZJbS9qUkZTdFp0WFB4dEV5S3kw?=
 =?utf-8?B?TDhhR0J4d3hBNFNhUEtMVUx0WW1LUjBqVDBTUVRheVBaMWFZZm9tZUdQak9i?=
 =?utf-8?B?ckZHS0lCUmh1ajduNCtFODVuZlhQUGJXVkZWQ2ZsejNOQjhMNldKOUs2eGgz?=
 =?utf-8?B?ZjdOZ2lqZUJSVmJvL2U0bDBkbmlhNXdPRWN4d0g1M0JRNHlNSSs0ZUp4ZFNn?=
 =?utf-8?B?NUp4SEZVZlk3NXdwdTd6ZkNYU1BuM1NJYS9qK0EyOXdrQTREOUt2UGxQY2hR?=
 =?utf-8?B?dTNSa0xGV01mYXpUdWtRdmx6Tk9KenZwMHN3YnhuR1BIYTBrOXp4L2UxOC91?=
 =?utf-8?B?MHNZd2RNcng5bHB6cGVHMGk0bzRHTTB6T084VVZWbkxNOXlTOVZ5MzR2Tm9h?=
 =?utf-8?B?VmtiUnFuWkw2M3cyZy94YzRkV0dlVDVMd1hlaHBVN2J6THdsdFNJZERoazM4?=
 =?utf-8?B?QWRVaHk0NFN0OXNjY1JIb0UvZCtYczRzTThMN2RBeE15dTM2Rkl6MnhuLytK?=
 =?utf-8?B?VFA2c1hucWpwNlk5NjBNUW53ZnNZUVN4ZXpYbHgwRjJoV3RFZkE0VlYvaVJU?=
 =?utf-8?B?UzdKeStYRWdtK093c2pCdElqUjJGTWhuOFVrR0k5UnpRek1yUXM0VzVVNFBK?=
 =?utf-8?B?WnV0Rkh0azdITW5CZ2xHL3F0ZjVZQnJvL0FCaWhxNDVSWVQwOVozZ0llamlM?=
 =?utf-8?B?UVptcXhFNFVSRVYrSTUyc0tOdHFBYzFGSEtrZnJ4bzVwRDRqZlBRelBCK2t4?=
 =?utf-8?B?WFVwbVdmL2pqVTJGbHZkc3R0R21RMlhTMWFPZW1aa3BTVTFlNUswZ051aXZn?=
 =?utf-8?B?N3NXNG00L3hacjQ3bnZWQXViRzZHZitvZmtTZkIvNWN1bTBFNC9uUEZ0ZVls?=
 =?utf-8?B?czdld2IyQ3ZxNFNLSE5CQm5qYUlSa0Q3c3VsMS8rbXB4QmJFZVBqaVhLN3Q5?=
 =?utf-8?B?V2MzL3I5aGdTeURTZ3FkTTJxMmJBV3VXSWswbUdXdFlUbmxaU2pLV2lLeXly?=
 =?utf-8?B?OTNPNGNzSkU1b0YyYS9kcDZLY2wycmpzVnhPVzB1VmJKVXIyQm9UZE9RakJz?=
 =?utf-8?B?S1FTZlllTUhncHdyQldhVG9JVUdnWFI1cVNNZEMycy9PTnlVR2FrZC9ZZks4?=
 =?utf-8?B?N3orZHpDMGh2cVEwTWdkWkdBT2Z2MnlxQ3FZR2JQYzlhYWtONjJYQzh3OEhw?=
 =?utf-8?B?YmxhUUNITU80L3RIYmVYYjg0Q2NCc2ZwS2RJUnd6TXV3ZXlBSGl1Y2hvaEM1?=
 =?utf-8?B?VDErNFNjVWszMTNZTm5KckJDRmhwNHZZM0p0TVFENDBIMVorTDliZkZINWVm?=
 =?utf-8?B?Nk5GSnFRYVBSaW5SaC9hc3BsY29Xd0E2emVac0hxTjFVcVN0cU92UC9UdStH?=
 =?utf-8?B?TjMrSlBZaU9YWXJEbTh0V2w0WWJMczkxTzVwSlNFTFZTSG42ZjBrclZxNkp3?=
 =?utf-8?B?QVF1eVFDSWtJeVFCcTk0WldwZFVxa003bXppWVN6cjhyV3pHODI1M3c4b1BH?=
 =?utf-8?B?UWNpOEk5ZVl2MU1GclMycHd4dnBpNGFvSGR0cUJzNWF0N2FMR0JLd3hCbThz?=
 =?utf-8?Q?UjiZARttH7CW9Pt12muMneQfM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa4783f7-2755-4f90-6d15-08dd994a8f0d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 16:06:06.6913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNbHw0855d32PI1DuQp78NjYlz8hcsDRkB7w6cixJTQk7lcaTotqtTAET9UdG08q12CjcJbI7qyrFkvQ2AcjnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6379



On 22-05-2025 19:55, Krzysztof Kozlowski wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 12/05/2025 07:17, Sheetal . wrote:
>> From: Sheetal <sheetal@nvidia.com>
>>
>> Add optional interconnect and iommu properties to admaif yaml. These
>> properties are supported from Tegra186 SoC onwards.
>>
>> This fixes below dtbs_check error for Tegra194 and Tegra234:
>>   'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> 
> You never responded - I reported it is not possible to reproduce it.
> Instead of sending the same, please address the feedback.
> 
> How this can be reproduced?

Apologies for misinterpreting the comment. I have updated the patch with 
properties based on compatibles and add info from which SoC onwards 
these properties can be used.

Below command throws the errors for all the Tegra194 and Tegra234 dtbs,
"make dtbs_check DT_SCHEMA_FILES=nvidia,tegra210-admaif.yaml"


> 
> Best regards,
> Krzysztof

