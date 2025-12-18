Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A3C34AB00;
	Thu, 18 Dec 2025 16:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766076719; cv=fail; b=F9TaXopdviRfANMkkKYDdWUYUqil9epUKZqKbGLHEc9Ic2llqd7QKwOa1qiPNqMW0bnSK8wQPGK8bknY98wZE3uRGLklEyO7Ivi8tXVKt1GY9rkAahoUFcftmdEAl19ikU3w7IMSPdQpA0kXGdzpKHu/eeeG7kSaRQ7QuRpwhjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766076719; c=relaxed/simple;
	bh=hR8W4uYJHTVlWPU/ihjeCAwTDHk4U7O16GUk8dUi90A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g2ZcA7yL3YWNdZqbBdeO7lRkFzFXeCnsOHrLu4D2WDCpBapZ7E65A81ILhac1vMD/2ot8U7HQbQTyy3lyq+6G2G9BQnMths0BaBbnGKBFx4gPrZ4IH7vKtyLKGSkK74ISxX7aTGUrBkIvG7I0DgTRmjLZbcMYsCk4XsrHC2qQnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jZEyRJED; arc=fail smtp.client-ip=40.107.209.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jZEyRJED"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ch5npY8Ub6Wy86WNgrFEsAV43W6c52yIi8lLagO1N+uf3C0jbgtlLjnvl3gxVWFlpYEUUZmsZMybVPtgSRYET9QAWTTqFUYTl6VAWFIx4B//aXqHJPnsp36jYEQbzCWFD3iTGUg67CaUV3HIgCZPOkLrkvUQdYzU+aY5fgo6wf6jls9UpaDSyq6MvTsda8psK991/DIRV3ob0iW4lYX/vZDK1FBE+oGhUczgt+RoppvU99681Bq8VySY4JnCSi/tZmC3qEdMVzogvyZq3/LqiriP0swJrbPSlnDepdUAjZt0pRSnJVpoJ11v8jwU+glfc4JKSlo4RewQeAnKq8eJrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAdKUt/yCSW769S2Wqi2pWIK4q3+nNYcPwwuTfJ/Ag0=;
 b=rcQiHreoVl8W/m0JnpjcTq8aAZ1121QfNOCX/6xWr6V2/zcWa10F2mviDQrootjUGLv+EDphW9DVCZrospZLwduJN9b4x1+yDZoDrL0cp1+uu+fy+fzZQkvwaknh5UkmHQbmHkXgzELj2ZnBqGn68Q/OV6QOaHRLaaUEzPhBEyGB8mDTIj2uePh24snDh77bmZN54JIQZULka41+x29GmBn4jUvR3BnaRQxqlKPS9bauG/GZe7yKBGKc69fQMNcgD4TNQmKuMGVc+ZpyqXFMsEp2Qwzv/nu9Lp8Ogp6KO/jgJz/xmjw0kmELkEg4nkKgPwcifIuZP+RvY7Pm9JOWFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAdKUt/yCSW769S2Wqi2pWIK4q3+nNYcPwwuTfJ/Ag0=;
 b=jZEyRJED8/NDWuhOM1zar5C/MLDAbk6R/Ct1nKdUL7yBWCtQgRG7YLpGgV6LtbgiyE1uXdQZoAFcUp1mlAeqS/Ynvmwj3qDe1DxeTHyJE7CbWePCW2BtuFkyi8APNZlCRnz+BVaP55J8Ad1q4fMTYUDhpi6ZK7T5kpzDucqsE8FVc5dF8kXOYgkB2NlJUbiW3b917/+QAxJJpq34gsD4w05o8wfEjZKfNDhpcp9hQi+ImE4Sr0ySc0UHFu+wSsCpmSPyUU5zC4TGiF7xrUVkGGCQtlNP5cFfQpG2sGusdTGvAx+qD3kDgmdE0lMrR78K4CIAGx/xOJi9fOuFcZ119A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA0PR12MB7628.namprd12.prod.outlook.com (2603:10b6:208:436::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 16:51:53 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 16:51:50 +0000
Message-ID: <1244cf8e-d06c-473d-96a6-2b8e126a45de@nvidia.com>
Date: Thu, 18 Dec 2025 16:51:45 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] memory: tegra: Group mc-err related registers
To: Krzysztof Kozlowski <krzk@kernel.org>, Ketan Patil <ketanp@nvidia.com>,
 thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251124173510.2602663-1-ketanp@nvidia.com>
 <20251124173510.2602663-2-ketanp@nvidia.com>
 <c43abae8-c160-4798-9f24-d37af59351fa@kernel.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <c43abae8-c160-4798-9f24-d37af59351fa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0132.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::24) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA0PR12MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 741b92c4-be99-4ab4-1e99-08de3e55bd41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2dYUzZYSklqaE5xYXlvS0MzUVB1QkQzVlJaMngvSXlKVzByMU9iU0xuOW5X?=
 =?utf-8?B?SG5KbDMxMFNwV3RubzhiT2w4eldxK2FCSVNid2VDa1Zxam02STExaXpPVXNK?=
 =?utf-8?B?ZkxWVTRoMW1KZkZuSklHQThqRmN2eVJUajFDNS9HV2V5bEREekNnemF6OEJD?=
 =?utf-8?B?SkVsTVhBOC9qd1hyQzBzUkE4MFBiMzNMOEZGWGV0Z3FIUFN6c1htNlhLR05x?=
 =?utf-8?B?WjZra2lXdWNHWXVaKzFNeTJIMXdCQ1lpVkwrMGhvWFBUUTdEQlRDRWZJTXE3?=
 =?utf-8?B?RVVhMXIwNmZ2UGZkWHM4a0k4T1FRcUxiSElVTkJWSnl6dTFzZkVGNGVoSi9D?=
 =?utf-8?B?WE5WMHB0SGNaZ3R6ZkhjRkVrUGUvS1lqc0xoTTB6VUtBc2tzY2svM09NVG8x?=
 =?utf-8?B?dWZQbDR0QVRtWStsYUM2NDZLOElvV3pFRGhpTG9BYVk4aThmRlVCMDdXcVd5?=
 =?utf-8?B?eGVOazdFd2dMZ2hJbDdWUXhvVVBIYXY2VnkwZHZWWE5PR0lMeDJGRlhZNHpz?=
 =?utf-8?B?RUNUTGdJV1hielpwdnJ3dkFHYkdBUGxKZ3ZRNnF6VDc3eW9xSTNIQklaRFg3?=
 =?utf-8?B?UFMxNFMzT2xyVXdTM01mNGM3VEtRcm5CWkNjQUpGY1FTeWx1dkJwU2FwSkFt?=
 =?utf-8?B?eDZkUUYweFd1UUY0TEkzZnhHNFBsNnpNUFlWUEhvcEZ4bHNEQjlvWXR1SXNn?=
 =?utf-8?B?N1d2bW51SU9ucXgxa2JWamlpQ2I4dE1uVTZKWnFoU2x4QU1vTUI3MkVRQkx0?=
 =?utf-8?B?WlVkendVL3JVRG1HRjRnOVY0RDYzSit4NStwRVBXeFMyUFdaeUdRK3RXcXl2?=
 =?utf-8?B?TDU1OFNvWDNrcHRLRmo0RzJhWjJsS3NKdUh0b2F6bEJGcFMrL29SU3M3MnE3?=
 =?utf-8?B?ZWd5Y1J0NGZyRHdHcVNSb3VmNGlLZUlLd3h3a1N6TlZVdGNHbGEySHdwWXQ5?=
 =?utf-8?B?aUJMVFN5L2FrME1rMzBxNkgraXpoN0YyZVZ0d1l5RlY0eTdmaHppUDR4aUFn?=
 =?utf-8?B?ZFczS2JBekhVMDM1OHZ6azFLZElrNTVrRWRwbmROdW5WQ1JsS2IxZ2MzU09Y?=
 =?utf-8?B?d05qdUFqUm9OMzkyQjV4Z1FVWDNMdloweGZhT3puQ01UU1ZhbU9hSHcxdXJ5?=
 =?utf-8?B?SW1CeFhJVWZhR2RieVBmUGtWMDlKTUZvTmU3ejdQSldkeWQ1ZkRMZm0yYjZX?=
 =?utf-8?B?b2ZSdmJRbVNWV3g1c3B6WlIreDN4ZE0xSXpIb3NteHpYdVl4WUdjdzNSMUM2?=
 =?utf-8?B?dmlLbms2SDRJMVF1MmFQUnlIQ2FDdHV1eTlGU1dmTGppL2VFSW1pUjQvcEta?=
 =?utf-8?B?eU1XYnlOK0lVeHRKc3RkMzI3V3k4c25tSGcwd2ZuZ2xhQkFIZGh0eGNCa0hG?=
 =?utf-8?B?K2pjMmV1ekZDa09qRHdvMmd6SUVpUmxyelBOT2c4RmpNQ2laaWdBMzdyRVdP?=
 =?utf-8?B?aXY5azd4Q0lNdHZpVnBLZmlwZGlZdVhCL053VUxFOG5NZ283dnlITVI2WndP?=
 =?utf-8?B?UnZ2cHJOcDNnWjhNV2FVTll5c1VLZlZyUUJ3MmRMSFJGRlhFQ2owM2RUazc4?=
 =?utf-8?B?WXpoQWNnY3VxYis2ZVRNdFFZdFNyb0hrNnJhS2FCUGp1eG9SaWQ2Z1hadUlK?=
 =?utf-8?B?WU5ob2JzalV2MGJ6ZTdQYnhqbEYyRzRXT05WVnZmSW1QZFdEZGxlZ3Q3dC96?=
 =?utf-8?B?Qlk1aDcwZ01Id1dwMzlyenF2OC8yMG1McDRlbnV0K3QwMDlFL2Qxd0ZMWkVV?=
 =?utf-8?B?ak1ic2xONVphR2RYQ25nSmRIS3UyaUh0TS9JUmRkZExmTGxKWmhEcWlOejFX?=
 =?utf-8?B?c3ZNVWRCSmJuUm5UVDN4UER5Qm1SRDVLRmJNVnNjaUM2anQ0akZmWTI0UHh0?=
 =?utf-8?B?YXJ4bG4yQWtZM2Z0eVc1WldrbkkrOWZNei9SdXBkT2RSVEx3Y1M0OVYrclBR?=
 =?utf-8?Q?Cq43gj4ne7XgkO44Ctrkwpp0LYlAIFQJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlRQNmhRdC9BV0tKc3ZFRUZZUVpSTUllQmt2TnlPMnlGV2VTWDI4cTJLMUZG?=
 =?utf-8?B?Ynp4SEVVeVJ5czZ3WnBJQjZzSE5vY25Gak5ESHAwdnFqazZRcDdqYkJyaUJ5?=
 =?utf-8?B?K284SzZDUC9zcHBYOGVWVnV1ZkVzbk44UlBmOTRLVHJQS01QK1JTaW45NDNR?=
 =?utf-8?B?cHhnN0xZZ3JHbm5oUGh0MlIydHZDaEFucFlpaHlPT3A0dzhFTzEzNkMxZ3Bh?=
 =?utf-8?B?Z2RvNXVCRW9hdGVZN29jb2V2TVpWcDhTRWJodkoxWXV6cnA5QTlMSW1aaHRH?=
 =?utf-8?B?N09rUVI5ZnZ5T0JVNXFYOWxUMkxndngraFA1ZlQ4bHBOYWlPS0NmTlhQdTY4?=
 =?utf-8?B?dmh3VE92ZmppR290aHg1dE9aMEUrMC9jdkZySlc5SlZmRHF6K1Y2K2oyNzJ2?=
 =?utf-8?B?d2RrcStyOUlSdHRxWHB6TXVzdkRpbzNCY21nTWQ5L1h3Und4THEwc0RLV2o4?=
 =?utf-8?B?UUhOZW9jRkFLcEFFN09WbWZjN1I3czgzTVVnUWVsckhFSzl0SWpOZGhjT3RG?=
 =?utf-8?B?U3NKSnJ0eGR1R1dMeDdmMFNnRGsxRGR6cldKSTRFTlBQVnhTOXM4ZDErd1Z4?=
 =?utf-8?B?Vy9zY21jaXRjL0ZjRnhRNFRSd3ZkQnQ5WDNvMDVyZTRmcDJ5YlVNYWVIRFNp?=
 =?utf-8?B?ZWJpbXVMcVZXUGg4eUMzNkw0Tmh1RFRmQUNjaWttckF3WUVhUzVaU2FWeGhy?=
 =?utf-8?B?S0JOd2VpakRPeWk3WEJDeE12emQ3WlU1cWNlU2E3R21BTFQ2UlJ1aTBPT0xS?=
 =?utf-8?B?TUoyRzZXdU11TTU5aHBLOUlRME5BbDFhNFpVdzN3UzVHOU1qZndKbVNoeVdJ?=
 =?utf-8?B?UFBHOWhLYSsyNWFYaVA4dG9YRkFaNnNybDhrN3BHb085Tm40K0JaSjEva0JL?=
 =?utf-8?B?Q0N3MW5JNzF6K042SlJocHlzTnJ4UHlOMmx4L21GaVJ2UUNSTXpnYzlrR3pP?=
 =?utf-8?B?b21qTlMrQlpOS2dPNVVPQVY0Qzg0Z2RCMmR2Q2FieUdOd1Nid2NXUnEzbHY0?=
 =?utf-8?B?dVFTa1BDbVdRbm1xdWFwOTF3d2VaSTFqRVkvUVhkMVZ5ejhFM0psUDJZSCtJ?=
 =?utf-8?B?dzRNSXR5b3c3SDRvNVE4WURRN2cwdHg5L0orWlRWbHBmdytha21WMTdhRmdC?=
 =?utf-8?B?NXZ0WkpycUJFZmVUR2ExdkVlL0kvZ083Z0lTV3IxbEh5TUtBcDNJVlBpNFhy?=
 =?utf-8?B?NDZhR1pDV1E0Q2Fha1hoSnZ0TTMvVXNWeVRJUnZwaFBaUGE0K3dSb3RjU2k0?=
 =?utf-8?B?a3czYzVtbHdOTzN6VzhzUGNsOFJuajQ5NkZ4eVZPTWd6YVhYOG5Cekd4cmJT?=
 =?utf-8?B?UFluODlNeEh1WUU2a2VXeG9mUGhpSVNVZDhtRWhxd3RUWGJaT1F3SStITTZv?=
 =?utf-8?B?T0NHNXhxRUpZcFFTSFFpZk9kMytSOVQ0N0haNlFvVitTMVNGK1hNUC96d1ZW?=
 =?utf-8?B?WlN4R09oeWRzSWNKTDNjVkpYSFVybld5cFVUelA1VGVQbVc3a2dONkRpc0Uy?=
 =?utf-8?B?L3hlSzByMC9yUFRLZDlCRG5Ja2pyUFZXSGJLNlhuSElsQjBBbUtlU2N4ZHZt?=
 =?utf-8?B?TWdmTzRza3c5QlRHaTA0UVpEMHdlc0ZLRVhadkZ2Y2RIbnhZTE5GbmZRZ0VN?=
 =?utf-8?B?OUpxSnRsTnlTQ0JFT1krZHB4M0ZHMnRBQUx0QWkvUEI3S2FScnYwZzZteUVi?=
 =?utf-8?B?aHk1d0RPRVJRZlhLZjV3bVIrUm1wbVp6eE5NYVU2bklPdDE5UEVpeXdjSDNs?=
 =?utf-8?B?cU12ZzBCS05GRzhzQm8rZFhKR1RzZDU0RW9XcGdNN3BmditQVEgwQU5tYml3?=
 =?utf-8?B?eXNNVmFmRmpSbThNWHRKVmtwR24zaEkrNzFiOWMvODVodk5Wd28vMHJ6Yk9W?=
 =?utf-8?B?MFU4WTh1Q0dJMXA5a2JsdU9IYnNZVTZtK3BVcm83T29YN0NtNUFFTnQ3SGJI?=
 =?utf-8?B?UVNzMjhiZ3IzNHFXUUFMK0k1YUJ5ZGpvaW5zVnBNSVVnNzlYYTltUXkwQ3Y5?=
 =?utf-8?B?T2JVTkJMdkp2b2lyZ1VmczNEaS9rT05OanJITEkzblA2N2xtMEEyZmZRU3pY?=
 =?utf-8?B?dmJSZWVaaHpRNVJOOGRBdW5nOGwwMndub2FXNWdyR28rWlFpSXVUWEgxbFN5?=
 =?utf-8?Q?wZyzofM9y5mnsMboFg5qB5F5m?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741b92c4-be99-4ab4-1e99-08de3e55bd41
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 16:51:50.4122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kECR7oDMasp1SBC9IR5Ujmv5P5PEC0mblFOYj8zHJTd5FuOwi9tPPN6zGYejdOhMOeAoW/FzwFZc0si1v2Tbug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7628


On 18/12/2025 16:17, Krzysztof Kozlowski wrote:
> On 24/11/2025 18:35, Ketan Patil wrote:
>> Group MC error related registers into a struct as they could have soc
>> specific values.
> 
> I do not understand the goal. The values already have "soc specific
> values". Your commit msg should explain why you are doing this and based
> on that explanation that's a no. There is no point in doing this.
Krzysztof is correct. We need to state here that Tegra264 has different 
register offsets that the existing devices and so in order to add 
support for Tegra264 we need to first make this change.

Although in patch 4/4 you add Tegra264, looking at this patch alone the 
reviewer has no idea why we are doing this and it just looks like churn.

-- 
nvpublic

