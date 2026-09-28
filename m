Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013008.outbound.protection.outlook.com [40.107.201.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08974BE439;
	Mon, 28 Sep 2026 13:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603676; cv=fail; b=pr2ZP5ED3jWtLwTDWi4h1QeRb2/B3SX1UtJkWcOY7zg/glpmH0IEJzco6C87yTMvVG4Q9PTS1hH+6UnSzudlwFKCT6SwrTqM+YBKdqRiOh/+yLPV3MnnuTkf5sMtPCH+eSChg7CTAqzCOg/uJyMoSf96C97x1i/EZ2HdR6VbUpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603676; c=relaxed/simple;
	bh=4DWwPTJ679S8YKpbPh8hv0k55/OxG5vLA15a3ftYhlg=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gn5gK44hZoUwyRmDsYvnJzXqnGjrZB41HO28B0AZXmbl3UFyvgSHCu6FaaE4m/XxFxfCw2JhDi9YItd+Z+tPCCeUl3AfmLLekL1Xr4I2Q/ipvBzKS17koZ/XXRSnxa5XnBZb/PjhM6Bm9JMFvqwEsxfhoRsBWCEMYtP8M9gNPUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E1ZE4WEQ; arc=fail smtp.client-ip=40.107.201.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E1ZE4WEQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrR5OuPWxsDyY+Qc2SJoEgJ2hHYR0OBjoTUs2918zXpI7bzkixSFQqZAT1cmbih65Evb5zrqTcXUdvhMty5YdJlFU0atgmv9E/YeRpEm0lgEkf32Gfk0LAxp99c/Br6DAth0z3xkN/2mbw6XPK6Klp6oXRt3f3jzlURNq/p7eqjLtaYxXbxoRMh9iicKluHv6VvHV9IWc81ALwEA5NtxwzZFOoEGcxL+53d4+r2x+YW8TT9o8ZPpgvRKoMmImMosRdZNCYm3EJWFfRwfcNx/KIyoWIN0oFaQdMeFYtRVT+XbQVHrSl+bYJW9qLnfVqGbzKW1yec0LcOXvtVjSNVQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLLlHRpBFcTniz75UO5eQOxCoRomt6YvK9ymO6olTGE=;
 b=K+TMXXzZOAmcFUKsfjenM5BbTM/FWDLeBLa5xeIuPPVgdv38BMRDpty6hTICTNFHbIBpeNx2prUOASowwd6p1ypvTCQZupFWK++qYP0AVhLQtDGaAc/CYvtXLBBh0NA0KIZpHbIlqFjc06staXjB7ik8ReAgyFnQXawoJk39roYRSnLZcE43mCGaX4iSVIRFlID6zcKTRaOV+TLo7VjH69jHfJBXgCnrsi1a/hgOqzQHjZDP6HlRd7YGf79OOXTEir2zKeJUYWPIhuG5tCb4197EwIOMTm1sqJRRghnIVS+qfldDujobiAKXxvVDRhcc0eJc/Q3bDFv9BoWAqrT7pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLLlHRpBFcTniz75UO5eQOxCoRomt6YvK9ymO6olTGE=;
 b=E1ZE4WEQrInsnyv7I9KnI9vmiVHdKLolHczguKVGjN4SFlJytVHi5/3OGapZMkOXmBAnklyEjUInQZ6YVSDA08bl+F6lySVomOJqsnQJ8FKhCC7LsQPbJftDHYVwby/io6S7LQAnHQFTX+VL2k2YfQxN3XqTYboo67uctNCzmBj3vi32sYwJ0Gq9s5sCB5CjGVcFBYuRC9RtJmCduo6y70hGYSc7vrjKhnzgvfGeCpmglPCfBDgv2SpM+VkFEVpo1F0+SWGCzJohMcdwV+U+ToxM/wLFqhXKob63HKiKOIuf3itEKZj7PjahEZGRZJhsZv64pj0tSatasnzswz0OYQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by PH0PR12MB7485.namprd12.prod.outlook.com (2603:10b6:510:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 13:54:30 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0451.014; Mon, 28 Sep 2026
 13:54:30 +0000
Message-ID: <94a4f30b-d17f-4d85-b1cf-fd195da24aac@nvidia.com>
Date: Mon, 28 Sep 2026 14:54:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/3] usb: host: xhci-tegra: Add Tegra264 XHCI support
From: Jon Hunter <jonathanh@nvidia.com>
To: Wayne Chang <waynec@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Thierry Reding <thierry.reding@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903074539.613220-1-waynec@nvidia.com>
 <a3ae0812-5e45-4351-aa40-5eba9f97e85b@nvidia.com>
Content-Language: en-US
In-Reply-To: <a3ae0812-5e45-4351-aa40-5eba9f97e85b@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::17) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|PH0PR12MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 051e7600-eb10-4437-3469-08df1d6804b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|7416014|1800799024|366016|10067099003|56012099006|11063799006|6133799003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	41hFIOf4EsUuJ/BhZdkQ8Q+Qtj2TmTzggDDyTDde2q7F8FUm8p27HVoaE85WDd5EwZ7pW6OrkJv/rVT+nMAzPrD+8hy8uczPmQROagYeEmPYX2ENUobWR0noJ7BQtoQfth8K5EICGU3qXRaqUSgh6KS1ERbPmK2eK8ceiqznnBkNTyblLdb+nDoYWeVYfA6pHKuE976Vo7cK9zBdCGF5jsWFq2kHF+l+CyyVuRVtligV5SNvBC/DvuUMbiNyMZuesN1gwacbyaCNyFPP+SeL8lavfHdfJwp5NY2UjV4OU7uy0GYQW8evWG9DkbF5O+nkyfoIma4tFOqpRdrmfj1qXSwA98sJTSAl+shRxkoRSUe6SrnCQ88YgxksFbhSqFkhonFGl5oeUgWqMM4KYBdQFAN1T3EdXmuQbMtN6eibsLs7UxBQLUJp3jr8J0dpn9RRV73XyCbjIYVG05hDdJvz5traWrXNLF/b51xvhIj1bVRMc+4c6ezd/IRzpaMHxK/oIs5K2k/bZdXDoKEv4p/FZPhG4XMsScXzMr8lZiRoWGQKR1lIKQ2gPRRQwaS5vD4qcJ1najmoHxdKDbChI5DQKv9i43TKr2HCXIWOxAiTcOIKBluGO6ra207vkqfgreBp+dEUYdLxoQ0PPVbfk/e16L9pnjJNuncrdmjfSYB+cU0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(7416014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U09SN0Vpc0VhcGRzL2wwTmVjbDZDM0VPY0lZZDUva2IvaW9jVzNpUU5lQ0hW?=
 =?utf-8?B?VUtZQzN1YmxmRGpoSG5LUzNFZmZGR1BIa1k2Q1lZNE9pZko1aXJSTEJwTVA1?=
 =?utf-8?B?ZTJkbDcvWGsyNTVrTVhPVjNRVGc2RVN3WlZpMTRCdnlCcXJ1b0drYWRnbFZ1?=
 =?utf-8?B?aFMvTlJxekRCeHE1M2V0Sk96SEluQ2EvdXNrejh3Z2ZWNEdHS1hrNlM5WW56?=
 =?utf-8?B?eHhRaXFwaFJVdlVyS0gzaG9JYVpZckJ6NkExeFQ2azk0ODZBajVGRWtMNlFp?=
 =?utf-8?B?WHJCL0Z2SWVTQXlwQTA5U1hSMlVVOFc1b2VpT0RKN0VyZUErZWcwcFUxR1hR?=
 =?utf-8?B?RUZLdWhrR0ZCSFlINXVxcVNsMFJJQ3dTV2FFZUFseVpoYVI5WUZoN3Bja0R1?=
 =?utf-8?B?NkFqdzdHNE5NbkhFVGs2c2xyWFdMaWJwUkZnYVNKeTl4RjZaRW9icEJmMGdV?=
 =?utf-8?B?aTZlOENHdW5FOCtFMlFtdXNXbnB0aUpJQ09RQ2h5enlEdFluUEtnRDdsakZN?=
 =?utf-8?B?THVka2V5S080dGp3QzVXZkswY3N2OCthQkdJQ1FwM3d6TFZEUHNJVUpXbnZr?=
 =?utf-8?B?Vk5CR0JiRS9aWnZJUzJXSjM4S0l3eHVwWU5pc2JGZ2lKYitKQW1Vd1JEZUxJ?=
 =?utf-8?B?b04wRVlxM3psNitVYVpEbDJsTVZ3Q2JnemxlUkJJV0VmUHZjd0hENjNCbHE1?=
 =?utf-8?B?M21WN2s2MnZpQnR5VDhrbmFscnhacTcwc2hGMUpKSVpLdmUrT0JwTzBOZWsz?=
 =?utf-8?B?b1ZBQnBpSGN6dlhZYzZmUWZUa3JTc1NKTExYa1VhOFFNNUphRTVwR2FYc0Nm?=
 =?utf-8?B?SmErTDFJMUY3MHB5MFpTNUJobE4vMTVZRG5GMDNqL1IvVUY1bTkrMmtrME1h?=
 =?utf-8?B?TWNHVUQyd0RKQmNkQm51b2hncnowcGxyRzZab2tVVHlLUmtkT0NnbDd6Vm1w?=
 =?utf-8?B?Y0dqWjVVNmhTa3hYY2hKRDRhYzRjQVN3blZsazZ3Yjd2V282cDM0UE9meDc4?=
 =?utf-8?B?cFRxdE1UeTBLSDFINFdkWldhV0ZjeEp4aWVma2E4cjRiVGU3YWVMOWZLQmsz?=
 =?utf-8?B?M3g3SnpTMllRbWlzeFoxMlVFMHZwN0FDajFhZnRCbkMyc3gxQzZ1NHZTUFpO?=
 =?utf-8?B?YTJXYXJUaHVKVXY0QWtldk5jQzlQenVJem5xSUFZbnphVGFWWE0rVjcxVTJJ?=
 =?utf-8?B?N0NMV00yY0RQRmZGS2x0dmUwZDBMM1BzT3Y1MElGSGtwT25hdFcyYXBvUUF5?=
 =?utf-8?B?NHRmTmlkbFBheVBQQm5qbHJEZkg3RjF3N2RETWoycllqdUJHV3JoR3NGUmVh?=
 =?utf-8?B?WUR1Mncyb1Q2VGUzTkxoVUMrUjgwQnNGT1dYL3dwY3RhdVYrY0pMOHllZTdi?=
 =?utf-8?B?Ui9oeVRmYWE5THo3ZlFrYWowTU1oNEw4NmNKZmRpRTFmZDdmSjhUN1lIcVhZ?=
 =?utf-8?B?aUpwbDB6MUxhZnI1ak0xdnhhdnpOOG5UQklVMFlGSjMyTm8rMldPMW1jbEk0?=
 =?utf-8?B?N2o0NEpkT2lBSHFWanZ2dzcxL1JQSWFoWHpyQnlKdWVVaitMc3A2dkcyUFJo?=
 =?utf-8?B?R2tDZWNJVlZxazJVN2piTmJlQjUreUE1amhKYk9nbFBHTnFkempJN05qRHF2?=
 =?utf-8?B?KzNESFF2dFczcDg2KzhKOWpMa3BEUU1zd3BXY2FGMURvSXVHYjh5d29LdXBt?=
 =?utf-8?B?MDBjVXZrNDhvR0o4d2s1QmR1b1M0ZU0veFlvMnkyQ05ISjdST0xXUjNvL3dr?=
 =?utf-8?B?bzA1MnJHWm5Fdno4WkVORFdPeUdyUGNyZWlybGRNRFRGZUVNQkRkZ1UvUXg1?=
 =?utf-8?B?TzBBYk1lUkNPN0dBN0o0T3gxNmZUbU5HSlBHWHM2MlFpT2tFWXVhaFlWd0xn?=
 =?utf-8?B?QTJXZTZ5YjJod2twRU5NaWdLTmwwTE9WdWxBSEhlbDBkWGR6RGRyS05jRlBh?=
 =?utf-8?B?SzVTNGptMVU5WXF1VmRqT2FRRHVQN0pSUituMXp6R3Y4VTVHSVNwbHBHQ0Vh?=
 =?utf-8?B?ejlUdWVzUDVJVkR4YUVNVzlIQWc4RTM0ZVl2amprQzRDbFBuTlJLYVZBTHk5?=
 =?utf-8?B?QVlodnp6Qk5KZno0MnNTNG9QNlVRNGlBM2wrM2V0RmMrOHI4ZEdqOHcvOVFl?=
 =?utf-8?B?RHlTWHE5Um5NajB5K1AzZGZNSk1NckdjOFNBUzkrRitwN0ZidUNMY1R6amFT?=
 =?utf-8?B?Z05zSE1mTDM4ZFVCYmxzcXBvZmIvUnpkdVQvSy9tTlZjTkp2OTJPZEFDSGNP?=
 =?utf-8?B?NEtLNndiaFBIbVV3N0VpT05hRkxQRDBQUkhxVmVGVnBIY01CVXAxLzU5bWV2?=
 =?utf-8?B?ckNpK0FBNkxuMVJlWlk2QnRhelg2SWZMR0pjak9GL09QWnU5ZzhlYkU3K2lJ?=
 =?utf-8?Q?BGX4dlEgsIoO3zXRccXcsVCsFXwvSYt2LSGPqhfPQ1U5X?=
X-MS-Exchange-AntiSpam-MessageData-1: nRkmpK5t8W4fjw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 051e7600-eb10-4437-3469-08df1d6804b2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 13:54:30.4415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5RtRmBoA1prgQuwTJng6z4lMwTKLxJZX4CXBVL9Obc2lTsDGN1IZoYsYIJfy3uEATP5dJlfltSRJVK9755LOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7485

Hi Greg, Mathias,

On 08/09/2026 18:01, Jon Hunter wrote:
> 
> On 03/09/2026 08:45, Wayne Chang wrote:
>> Add Tegra264 support to the Tegra XUSB host (xhci-tegra) driver and
>> its binding, as part of enabling USB host functions on the Tegra264
>> Jetson AGX Thor platform.
>>
>> This series was previously posted as part of a single 8-patch series
>> covering phy, USB host and arm64 DTS changes together [1]. Per review
>> feedback, it has been split by subsystem so each maintainer can pick
>> up only what belongs to their tree:
>>
>> - usb: host: xhci-tegra + its dt-bindings/usb: this series
>> - phy: tegra: xusb + its dt-bindings/phy: separate series [2], sent
>>    ahead of this one
>> - arm64: tegra DTS enablement: separate series, to be sent once the
>>    binding patches from this series and [2] have landed, since it
>>    depends on both
>>
>> Patch 1/3 (dt-bindings: usb) also addresses Krzysztof's V2 review
>> comments: the iommus entries are now listed individually, and Tegra264
>> gets its own allOf conditional pinning interrupts to 10 and iommus to 5,
>> instead of inheriting Tegra234's wider top-level bounds unconstrained.
>>
>> [1] https://lore.kernel.org/linux-tegra/20260831185835.3732707-1-waynec@nvidia.com/
>> [2] https://lore.kernel.org/linux-tegra/20260903071937.533646-1-waynec@nvidia.com/
>>
>> Wayne Chang (3):
>>    dt-bindings: usb: Add Tegra264 XUSB host support
>>    usb: host: xhci-tegra: Skip MBOX MSG_ENABLED on Tegra264
>>    usb: host: xhci-tegra: Add Tegra264 XHCI support
>>
>>   .../bindings/usb/nvidia,tegra234-xusb.yaml    | 52 ++++++++++++++++++++---
>>   drivers/usb/host/xhci-tegra.c                 | 37 ++++++++++++++++
>>   2 files changed, 84 insertions(+), 5 deletions(-)
> 
> For the series ...
> 
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
Let me know if you are OK with these changes or if you have any comments.

Thanks
Jon

-- 
nvpublic

