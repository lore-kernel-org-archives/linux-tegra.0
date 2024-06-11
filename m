Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9387916F8E7
	for <linux-tegra@vger.kernel.org>; Tue, 11 Jun 2024 07:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718092479; cv=fail; b=ky3ic6xO7RL5KGDeW0Sm6jZ0zYA3sSObIo072eHFSj2YTucPpW7Nn19nF45xcTqybdySuPsEv5JVc+hDYl5/yP4VRVfXAV9bdz1UoeNDGDMwsa0nXxUgYRoqadh1Er2fTRt7oZ3wwDYqNWezvz6v73vTJsh/Y8HHlDeFLZjFhjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718092479; c=relaxed/simple;
	bh=kgA7fAhsf/VANp0YvSrfxTX7gqAtdZuYQyRebz23PF8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DMirCaqjLOI9mBrO84FYQFPH10qBFbEGoylpnU8Ruu3NMou13Y4US9PvROUZAbgHva8XnamF4UkBotrVk657SyEHd4fNLKnYXN0QshRJC++UpKWqgDB9iKp6W1KnD2/1FAmRVnnSw4eF3hIMkPlwgi1NduQi98/GTT6qpLyvrXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U7Lx8oMf; arc=fail smtp.client-ip=40.107.237.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U7Lx8oMf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N81/JOGujWJctDnRRwmQFx1WOjJe5U8gQJyvStH3oF4oZYdq1DPMF2lfjAsrn6eb1H1EqGZPHvvZvcWQe91+X9Vo/boe49PqS3j1VyQymD4l7oWsbN7CgN7AKYpkgYwyuzYbblHGfMyNFF37YIS10ErqTlhCHU1JWx4fIaBTcRPTK9IEBLDVaK6fvgcQK0s4VR4hbRq7Ja0bcnYARB6khKhecOfOc3BQGrUjM501y5CUIvY4vvJAsmJnR1m1m3/gGkJCrDaud0OsQ+6zfrMBqzkPz98MXiw20rURj/1HmtwON1aYdHpSOdDgl+i3XX820Q+0uG2tWrp3NuFZfdJsnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5qmfTo1zSUQA06yYdkQE4167WloruGzUAWV8TP5rsc=;
 b=BFaqQKP0nD7crPUOk0oQLKEnUoDmxLNOOIt8yrg5nu5aQII8cDfvjSU9GlDQZ6QVFwLPb6WEHtzUVxjl/vSg9p1v8Fb4qJLeKC1M4z1a+ToOX7iOwp1zGC8lKFH+R+VjeeNCH/KzaoDF4+Tl9d/+8LmAZ6HXPqDPoHxS7XZsyUjrq3Az88KOZLDSs+TYL44h3PeaPzv4jKokJ8F/Es5Q7dg9X2gZiAWeyNQUSnoMZB7vzxglSTc0b+CoFPPzWy3fXuHEBaA4Ue3LKD5HdWykJ0lRvUNwk2JS9qhlG/TFjtEiYiEKiVL7bjnbTRu5U4zuk0xodm4x6scJBnJ1IL6Fmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5qmfTo1zSUQA06yYdkQE4167WloruGzUAWV8TP5rsc=;
 b=U7Lx8oMft0QEKvKUdamduBAw4tk2dISr1dftCwSCJ3MiDOhYJHSwPdRNjRF3PxY9KZZ4a6Q8MESo6dJ8nerp0Dwh+H6Mm0hpV9EKzUd9++yucQ00CY1qCBPZ4MGUBRVsCfuwi6BZA4dUsNwMPe+rz3SCzkamqDrvdh37UhqaRkNb/Up5snZhtQZDRPcf+b2/k9tJRSFPaNeCZTy6Ckg7K2JqeUgwB2plxTPzvYqXzsdVv39ssiwIoqnKibTY0tsSuDhSbBhfCe7567p71VS3VVLxV2MMSqrIdx3QUuDfV2eqFlfbhKG661G4vDAYABEdGZ9SmDMLhezpbh85JXgwpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW4PR12MB7117.namprd12.prod.outlook.com (2603:10b6:303:221::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 11 Jun
 2024 07:54:34 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%5]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 07:54:34 +0000
Message-ID: <41af8e0f-75af-4930-b896-7edf3b7a1f50@nvidia.com>
Date: Tue, 11 Jun 2024 08:54:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc/tegra: pmc: Fix and simplify resource lookup
To: Thierry Reding <thierry.reding@gmail.com>,
 Petlozu Pravareshwar <petlozup@nvidia.com>
Cc: linux-tegra@vger.kernel.org
References: <20240517142617.18685-1-jonathanh@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20240517142617.18685-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0271.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::7) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MW4PR12MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 563c2f32-f46e-4459-25cd-08dc89ebbbb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1lYWFhxWENWVW16SUJhSW5UR2tNc05HSmFVNlQ3VWRBRUtnYzFwRjZiLzJN?=
 =?utf-8?B?dG9MZ010b0p4bURzSXVWdnNJbzRXS21rdkNQeUVGTDVMdm54ckpHZ2ttQ0F3?=
 =?utf-8?B?QmhmTk9SRlpraUtUb1N5aHJWblBXQXZXRGxXNk00dEQycW9nM043aUMzNEZr?=
 =?utf-8?B?QXo2THQ5dDhQbDVUS0hEVGxHODgvYkJFSEtnV3RubENkdUljanVBQU5xZjlp?=
 =?utf-8?B?MGViZTFEbnE1OWZrWGlpTkVjZHRIWndPOWwxcGM2WERUckcxVnBEMUlmczZX?=
 =?utf-8?B?U1lEWVU5elVrQldKdmpmSkpqZXZXaTdpZCtPMmpjWVhRcElQY3plQmFCbzN0?=
 =?utf-8?B?UmJ4RUNRN21yRWtlTjd1MkxDdEVoeXFacExmaHNxb1JEblNlQUtld0VJdWtI?=
 =?utf-8?B?amVkRmE2RFdKTzJUUVlJNHE5TmYzSUNRS282bDc3ZU4zMzcxZ0x0bzhVNHpq?=
 =?utf-8?B?aWcyQlBSZFd1a1NJMkkyTmZmMlZDNU5LRFZnR2dqQlJUY1VWQ2NrSURDdXZn?=
 =?utf-8?B?eVJTQ2lvSExDM3FWbG14Qi9xcGVBVC91THNycFVTendrT1VQbSs1ZWQ1Q3R4?=
 =?utf-8?B?bmtGU3dneDRJUHFZUHpCMUMvUmVBUnRrcUpuckUzNWJwa3R5M3NFN3FEdlJY?=
 =?utf-8?B?azNhTlNTRVhkeUdIWHJRczV4MVpFUmNIbmZIS1ByYkNkQnFleElNc0w5ekh2?=
 =?utf-8?B?UWlsYnRPOU1GbzRQVHNUS1F5MFlxaGhpTnhIUmY5endJbVV0Qnh3TnlnVkkr?=
 =?utf-8?B?d2hMcEJINVA5cm5VSHRMMWxqeVdBNVNubnNIc293QlU1U0ZLdmgyQ3MrRldL?=
 =?utf-8?B?TjQvSDZuem1RT0l1bHl1UW9MTEVxeUJpbCtSZGYvZ2RnSDB5VFExSEtGSys2?=
 =?utf-8?B?QTVoWlA0a0NxeGhMWUI5K1lUdXNLZHdtb25yZ3N2dWpuTzRUejhwSzE5YXlO?=
 =?utf-8?B?MkFOSFBvMVVHNlkxMVpMbFQwdzBkNzBlQ3dDVXZSeDFuMHRQNFl6VXN4cmhM?=
 =?utf-8?B?MnNkN2UvM1EzRThYQThYV1h3dTFMbzBwQVM2bXp1ekZ3b2RWUjVyZlErbC80?=
 =?utf-8?B?SnVhTkZzNTFWbkpXSGdqNzR1dGUwMWk2NXRwVFhJeGJsellRMnk2cnJqSUFM?=
 =?utf-8?B?K1hRRGFGK0pEQjZvTHdVWjVGNlRQQmJrUERLS3crTEQybHd0bU1mNjZPMEVl?=
 =?utf-8?B?QnJEd3ZjaUlvNmVKMlhPNEs3MGJicmhiYm1jWmg3cjVuZjFKUG1kRklReFhw?=
 =?utf-8?B?VC9oNTFVWEhYdlIyQU9mbWQxRFNWT0I0eDVCb0hYcWFuTS9jWisyMFoxeXh4?=
 =?utf-8?B?SGlpc1JPNHZhMG1qdW5YdW1yRkRpMHdVTEEza2RIVk55UnczTS9raDd2N3d5?=
 =?utf-8?B?MTJhU2tyQzZHbXFRTkREYlQ3eXYxL1dVWS9SOXB3dmNELzRaNTFWTkRwMFhY?=
 =?utf-8?B?SElUNFBQQjRVWFE5T3hIQVZkVllDREEvN1F4bkZPZ2RjMXlML3VUUlBaWjNS?=
 =?utf-8?B?SXYwSlMyY21PRmh6Y2gwQTFOWm53WXdBYTNHQjZVZzM5dnowZ2hMU0FrOTdX?=
 =?utf-8?B?aEg5TURmTjNxK293Y1kwaGtjMlNSTDRXWmVZN2tQY2RIZ1NFMU1rWDdEdEJ1?=
 =?utf-8?B?dUowRE9QNGZCNU1qb2w2cjFDaDNwUGVQNkU1cmVRNEh4Wk91elV5M3ZBdmNv?=
 =?utf-8?B?alMxdUk1cGpEZzdIUW81Yk9kbHdYekRNWlRYcDhsQURkVm56emRXYXpjQlFv?=
 =?utf-8?Q?OKwnM56gLkVRWdtdB+o1h9QWDCoHMiECpoIDhAF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTNTV0xGUGFTLzYybnhtU2pteVkwZTNrbTdPdEhEcDRDY3pZU2l4RFJMdUti?=
 =?utf-8?B?Zm1wblE0Z1pQNXB5Sm1McEVsaEo5SFYyem9Yam54WTlxRHA0YzFTa1FkYjIy?=
 =?utf-8?B?d1FiMkZFUFNML0FITVdsQ2ZtUkdMWFRHSmpYMEN2RmpWM243cWFpUTVCM3NO?=
 =?utf-8?B?NzF4eHowYitWNDlXdHJyY3pZWklqdWNVQmovTEJ0ZUVzR0VkSGhwWWZEWWJ3?=
 =?utf-8?B?Q0pST3RhbTdleE0rTkVQcFpZN1pzM0gyaDZpRHdmSUpVMFFvNy9jL3VjeDQ1?=
 =?utf-8?B?c29UQnBLQVJRelFwZTI1YVk4ekRTQkljbjA3d2lmOWVQODFRTCtZVzlteSty?=
 =?utf-8?B?TXRWcHJQRTYyMG5XT1lleVdkSndNTHJoNllQVTk0eWM3MDJIdGpQOExXN1Bq?=
 =?utf-8?B?U3c5Z1ZqelRnZkt0RXdGZVM4ZUhBSC8wejlWOG5NQUEvbWMzS0pIK21oWmhy?=
 =?utf-8?B?ZFg2NFROc2JKbmU4REhCTis5M1BCY1I1MFhQa3VCUXM1QXRrZjZuVVJwWW0w?=
 =?utf-8?B?UVY3VzRsTE9JQ1RQRWZXU05uWGhhVVpmaUlDRFc5Ym5MNXRHZjhYVThnRzJN?=
 =?utf-8?B?ajMyWldwSUtrc09kbHkzeFQzLzkxM0JWenhWWi9NcFBGNVJGaVNRSkRVVThl?=
 =?utf-8?B?VWFoSnhRYWphdEV3V0V0MWY1ekJrVzdNWWd0TWlWRllSTWp2WjB5QmtVVEE1?=
 =?utf-8?B?UlJHS2tla0JmREdSRzNwNEpZM3hXNHdIamFPSWVDM0h6VjVSQzRJakRCV3dG?=
 =?utf-8?B?TTAwY1BBcEY1cUhxYUk4dURuSmx2VkNvRUFNbUJsRGoyTHF6UEltbXBMTSsw?=
 =?utf-8?B?czdNQkszZTBRZUdsWHVmOEhGQStPNDVwL0FockVjZllFZ2RhRGtHOVFHczJn?=
 =?utf-8?B?Q0lkbnZEOHRkbVV1RllCQTZvWlliWVFqcGdZT0JaVHhPaWhzMGY5cURLQmUr?=
 =?utf-8?B?WlloVUc0NG1BUnQ5czZCN0VLenJXdDNFTnVMU3FqN0FMTU1mQTMvNmo3S0Fp?=
 =?utf-8?B?NVpRalZhK0oxOTdSUGg2WHZkbXhnS0VlK2tHZGYzZlB3a1JMSDlZMDhPOFE3?=
 =?utf-8?B?bHBpVDd6YlZHc01pLzY3YWVVYW5BNHE4NjBkd1FIb1g4QVUvNUFmYmliYzRt?=
 =?utf-8?B?dy9QMXllWlBsQkwrbGErTUFIUlhBVUc1QzRGSDZnNm0xUW03TGtQRVR3WnVR?=
 =?utf-8?B?OHhyZm5NK3g1L1pwZnpZYUFUTjAxanlJeXVEclJWRExYU0tnMHorT3EzbGJJ?=
 =?utf-8?B?RENMcmxWSU5WbmowSlIxMXBWQ25Nb3U1ODZmU0R5UGlxWHhTRUtMdm51aWQ5?=
 =?utf-8?B?NVRlUjBuTVRkZXgrL2F0Vmd3d2x1ZzgxWnBzcHVaMnhWZjJTOTh5a3llY21S?=
 =?utf-8?B?cFVYTkVrQ3lWbWxlNXAxeWhVdjVaVnR2Wm9OeWV1emp2TVB3ODlhUitXK056?=
 =?utf-8?B?VndlUk0yMzVNNXgvTDYzY0U2c052aDl6TklqRTNUOFkyUXh1RzFGZXlnQ21G?=
 =?utf-8?B?REdlMXRiQWpwZEJjcnh6R3BaMjN5dmsvUUFONDVCNERyOStsczB6cmVhNDA2?=
 =?utf-8?B?TW5jTEt1NUJmK3hsR1dISVpXTWE4bjJKS3BlZG5aUWR1QWs4V05DVmNWNHhV?=
 =?utf-8?B?Rko2ZldXSVZSNGUwejZ6ZlJKcmVaV0pzdTJWdFFtYVVzbWxHMHVYUjdkU3Qz?=
 =?utf-8?B?UXl4U3NtTVVoWi9iZWF4dWc5WSsvV3lCaStBS2Q4U2dzRnMwc0xYNnFFOFdx?=
 =?utf-8?B?bnRHSkRiTUtqYnJHSVNmT05jOUgwNVZwSkNwN3FMRDFORXF6bDhReXhLRGVX?=
 =?utf-8?B?cEVRVHkzNVRKRWlkZ0NRUFkrWXBNd3oxcng0OHZGRDQrNHNMSU5BcHp1ZmEv?=
 =?utf-8?B?Z3l0R081YnNaOEpMNzQ4b3N5ai8zV0dCSkRoQ0UxRXMweG12SVpsaFNTcEIy?=
 =?utf-8?B?bWJTaWJJYnB5NlcrYXRNUkJrY1U1SC9oVkhieksxSHBFckFITER2ZlJ1enhM?=
 =?utf-8?B?MXRaSXZWNEhQM0FzeWZ4eDZJcEJMZXNSSXQ1MXhNSThBWjJzdEpOZzJzYmRa?=
 =?utf-8?B?Q1c2emtYNk9razFocm9sYWU2enFMRUFkTkNXZFMzVXpCcFh1YmorZDZ1YzEy?=
 =?utf-8?B?YkxHcXNQY05Pcm5kWHJqbFk4dTl2L2dHbnVRVWIzOHcxQW56c1RhVTZBcmlQ?=
 =?utf-8?Q?P4MwRkUCrpkbLAVwBwgKjngg0XRWsvEyJY/GFtqqDfBu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 563c2f32-f46e-4459-25cd-08dc89ebbbb1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 07:54:34.1668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJSpkcMzqz0Kq8hAsQ3iR/e1HmsjhcZiaJBZ5s5tc91NnyTiZH1E6BBmAGiK2VgnUiGntn1TYZ2gk1m5gYY/Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7117


On 17/05/2024 15:26, Jon Hunter wrote:
> Commit 6f4429e21a7f ("soc/tegra: pmc: Update address mapping sequence
> for PMC apertures") updated the resource lookup code in the PMC driver
> and after this change, the return value from the function
> platform_get_resource_byname() for 'wake' and 'aotag' regions is no
> longer checked. Fix this by replacing the calls to
> platform_get_resource_byname() and devm_ioremap_resource() with
> devm_platform_ioremap_resource_byname().
> 
> Fixes: 6f4429e21a7f ("soc/tegra: pmc: Update address mapping sequence for PMC apertures")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>   drivers/soc/tegra/pmc.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 91d0ad6ddefc..6c37d6eb8b49 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -2891,15 +2891,11 @@ static int tegra_pmc_probe(struct platform_device *pdev)
>   		pmc->aotag = base;
>   		pmc->scratch = base;
>   	} else {
> -		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -						"wake");
> -		pmc->wake = devm_ioremap_resource(&pdev->dev, res);
> +		pmc->wake = devm_platform_ioremap_resource_byname(pdev, "wake");
>   		if (IS_ERR(pmc->wake))
>   			return PTR_ERR(pmc->wake);
>   
> -		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -						"aotag");
> -		pmc->aotag = devm_ioremap_resource(&pdev->dev, res);
> +		pmc->aotag = devm_platform_ioremap_resource_byname(pdev, "aotag");
>   		if (IS_ERR(pmc->aotag))
>   			return PTR_ERR(pmc->aotag);
>   

I guess this is no quite accurate, because on further inspection the 
above code behaves the same as devm_platform_ioremap_resource_byname(). 
However, we can simplify this code by just using 
devm_platform_ioremap_resource_byname(). I will resend this and update 
the commit message.

Jon

-- 
nvpublic
