Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013023.outbound.protection.outlook.com [40.93.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8331607AC;
	Tue,  7 Oct 2025 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759852884; cv=fail; b=Dcp2XZ3bHu05Py4eR7U9Y5rHAfZgx38LCot/MU/EDBFEBevu3Vg9jG+6V6t7yRLPNyEc8biSSDnxhTGN/+4dfp25+gMDal6TzH4LlsUkQNTQmpWUqfM8kW458lCloLpFQK++sCAulyqAJ53keLxkMZ9aY0oP/sw9QFDERoha5as=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759852884; c=relaxed/simple;
	bh=/aN2SSrE334vuKKs4sO4WvQFDj8WIskxH9itojoDveg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N0d9vn6ZXK03aKCb1b8vVpoNB9VbJT18tyCE0kEGQNVYqe61vPK+7NTciJaagT97tFv1d/ILi2LjlYKr+Orz/2eko2GGTsE6GExD7m7J6sWsIb8TbqtO22jlymELabEr4ouEdaUGBTbF0MWsPSbQopwTp7oGMJKsWqHRMKQY7Yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D8Y0SV3H; arc=fail smtp.client-ip=40.93.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D8Y0SV3H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFk9VZjorexcL0k7ojTQlk+b1ySi2ZCFSYwGw0V+gILaW0mhtVzPBgKmHby0QA0avSLE2OnbixTHBeaxU/IFDxGJru2zfgeDSV+6xAddZDL+appdoehF19SHKdRKa6pvaTtZ3KWoMG4fkk2/qsyfrhpGnQX1Xd+Ayv+Oy2nOwhAVYAOjXOTR1q+HzG+d66MOnQghhYDzd1r7QlPlhh6KdDvv3OT68zeHmlDue/AQKUh9rPdH6cc7JLwC3TX5weWc8CDtkM3FffQ9RHmIssOGf3QCcKivAcSw9rdGfGMDEsXNKB4cI3DEsBvPpjzRN1fxCMQzxO4ioYdmOSIsj8fHpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nKFMthKi48AjPIH2BhPq3XDLdkdNBNMsgd24OCtAsw=;
 b=qtbveBp6lvM50X5yFwv8iBB/XACktAwYyrDc86ORaRUFiQv2BCYzU5ZfD2eqVWQhamcRBIndLmU0kf+isV8mTO58POaI54e6cwt1fLpGoxv3KnKrGf9oXe0wWdIruAWU9GFpKJCbTK999kyppmZXJ458aqpIaCBqGeU5c6NRCPFnIRK3x3zqc9x9s4v/J8r6FF12iDKyER63wTMitNyJYs0bby6S/Om1mNff/gvFAJMYJitGuNNFN5m9PxZkxwekMy8nlA1R/WZgeXKMukfKvLh5QlZSKN/85As85X82CknDIJAd719D3dDV4j/n3R99/RAUcFaEd2ZxccLPOtpxnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nKFMthKi48AjPIH2BhPq3XDLdkdNBNMsgd24OCtAsw=;
 b=D8Y0SV3H4kKnVSid/9IJk5hF0YORlDb34ALWyp3/qouKI6VeyPWWedCG2ARrRwdl7hWlRkwNDfsKsSS+LFa9rYd8VQUl+t4Dhvh/OZDpoS0cNq1rEGSR+bZNBRYusUmZADAM/QeiNKxLGwqBo9zx7tqB4KNKI+WGWX6la84ycKDJ7y4E4GcIM+YyJ3WsFHPt2vCH1lLcWhBOiBl+qzCRv0Zs+vhpNl4PJYY8LON6P1jxuKrxy2Dv9Hfy1MmNKxpfxszRiZOJn93tpTl77kuEqYVPfdKUze5SGrFPsqE8uRo0qSVvX0+w6uVZGn9GEWDnZwRYojpAd+8rjm9X/53f1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 16:01:14 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 16:01:14 +0000
Message-ID: <4b3cfaee-70dd-4df3-bd12-5deb26217674@nvidia.com>
Date: Tue, 7 Oct 2025 17:01:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] memory: tegra: Add MC error logging support for
 Tegra264
To: Ketan Patil <ketanp@nvidia.com>, krzk@kernel.org, thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251004191123.2145307-1-ketanp@nvidia.com>
 <20251004191123.2145307-5-ketanp@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251004191123.2145307-5-ketanp@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0181.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::8) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: c4aedb9d-e491-40a1-1152-08de05babdd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVcvdjR5V3BOKzVMaWxnZ251RDVRMDI5S3VsNDc4T2hVMUlXbmNneHJMUWhQ?=
 =?utf-8?B?ckRoVldadnVyUmt2L2pWY25kaWxuQ0tWMGg0eWRRMVBOdkFxNi9KNTlGS1ZQ?=
 =?utf-8?B?aGtjOUtqLzdFVWZMS1VJODN4aXcxSkpEVnEra1lYYVE2bFR1SWhPUkZFZHN1?=
 =?utf-8?B?U1lwVUk2aUFOUVpxTHMyTXJySEZNejlyYzBEeTlKOXV4OENpWDNHOHdxRWJT?=
 =?utf-8?B?QWV4S0JyRUhrMmh2Rk1rY20reTRpeE1HMFpZWjZ0RG5NdEtnYnhZNU5sRGh1?=
 =?utf-8?B?VHg2S2U0bS9LSjhlQnNKcjVLa3dwSk1vRE5ON1AvUTVzR2dld2JNVWhkWHhX?=
 =?utf-8?B?bVc0ajJlMEd6S2tMWFMvYnZ2Sy9mUW00R1Q4cFRINmdha1FTL2R6dUNWVWs5?=
 =?utf-8?B?ckduMnpEMDNGRFRuOExSWVZ1QTZsblpxYnQrUGhiWDlWdzdZNEJaRUJNQ1FL?=
 =?utf-8?B?TGlzMlFzZnNvUzFHSVJQWGZ5eDlaZ1JYYjZ4QUE3R0hDMzNSZ0lwZTJkV0RD?=
 =?utf-8?B?cXNFcmhBeFVGRHlkWThEbEFxL2Ewa2tlMkpkWDluWXJTUVo3MU9GZmhHQ1Ux?=
 =?utf-8?B?czExeTk4RlJPN1lid1pRWm9GUldrSVpFc05Fb1RaRWV1amJrSnhMbE8yRGNa?=
 =?utf-8?B?VVJ5VDAveTl1MzdGOURjWmtRNWVDaUJKM0xVTFFFNFdoVTJ2Y3MvS1BWWGJq?=
 =?utf-8?B?MnRmbHhuSWhUbDF5N0o0cEdnK01QdWFNL3FhREpyNGdHN2d1N0JNRkJrVXVy?=
 =?utf-8?B?QUdZREVZWDVwZy9RQ2RpUlF4WGJyVkNEZjNJaGJhanlneUFEZ0ozV2hDbGFG?=
 =?utf-8?B?KzRqT2VMaW1kODFlL3p1OHB0N1R5R3pqYUpFdHBSdVJ5K09ZVnp4a0UyNDVn?=
 =?utf-8?B?VDNkUzhIVFBmSU5EalF4KzI1SHc5Z0p2VGpZbmZPVU4wYmNQVGxFYkZ3eG5H?=
 =?utf-8?B?b3lmNFI3TERvQTFuVFU0NzFUdzF2OEQ3YVM4am02N1FiS0NMbVZnWmJGZkk5?=
 =?utf-8?B?eGQxQUdRdngxdUxnY2gzVktaTWVIV0paNkF6Sk82NWF1eCs2OWJVSkhqVE83?=
 =?utf-8?B?eFpQZ0cxcUpYSDRBNmF6N3h5NWwwODhQMG1wNnhFaGswK1g0UmVzV1luSmFo?=
 =?utf-8?B?NFRXWU96RUY0UjQ4VUZFWmk2MWpjM3NEUGhzaUtNWDR3V2FrcS9Ed1IxVEgy?=
 =?utf-8?B?ekMzQnRBUklBNWh2TFcrWXBIcUlsRGFLcXdNNHd5S3A4ZGt5WkdMUysvV2Y4?=
 =?utf-8?B?VlBBY1NZYVNncWdXQUtxVlAyaWZlRG04NU9Pc0dQam4zQngzd3BuaEV3T0U3?=
 =?utf-8?B?TkFQcFpWZHVHN3JFVXdqVWZIcCtzUE44NTRMQlNNR0xsT1ZWSHp0S2dWUUE5?=
 =?utf-8?B?OUljbGpuU1pJWGdwNC80clk2dXZEZFljSlBhMHh1UzRoZjBTM2N0bDNiSHN3?=
 =?utf-8?B?Z1dtNW1BUHBCSUJqb1dQWmFpTi9jSnZKQ1B0dzBUMmc3NnlCNjZvejNPQVBD?=
 =?utf-8?B?WHNwQ09PZFNBTHRJenFDRVQ4ek53Y01nWFdKRmFPb1JzNTJ5NmhZNnJsdlJJ?=
 =?utf-8?B?K251RkZLNHdKRTFFODBzdVBtUTFWbTA2MGpid1EyN0xDYStTdElid1laSldE?=
 =?utf-8?B?ZVI4VW8vNUhZVXRJSnVFQnN6ZVhwZnVuVkxFYWhzZ01xMEVyVUJXc0dTMWtx?=
 =?utf-8?B?NnBGbmN0eVR2TUJ6UDZOaXhHY3NTOGhrSURBSVBPV3k4T3ZydDlqbHVNaUVi?=
 =?utf-8?B?Q3lpbXcxNFdCYkl0bmhqcXhhZU8yNFEvQ0lOYXlhSS8wNzQwUUhQTVE0b1dj?=
 =?utf-8?B?Vk4yR242Njg2MldrRGkvMDRyK2xGcTdQdms4cW9rM1JtNzJlek4zaHZEVFBV?=
 =?utf-8?B?dWxaaVI5V2xNTTdhRWk2eVpoSUhubnE5bUtOc3psdTRsbkUwMTRvbzU2aGt1?=
 =?utf-8?Q?LujGpVI2SX3GOPMP7UnXkjkcyq2M5Q4q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVJkYnlFOHRzVzVRQWN5d0Fpd29qUDBZQmxWVGNSM2RoZHRrRkdSQ2RYS2tE?=
 =?utf-8?B?OWFRTGNPTXhmeUoxWGFnclBvQi90YUtQUFMwM2lhbjd6QzBURjQ4RVB2TlF1?=
 =?utf-8?B?K2VydnVqSGtYaDlpSkpsTC9XMUlCSW1mN21wMlpJUk1yWXpuT2syTE5hSE4x?=
 =?utf-8?B?alhOM1l4WE5QM1hYVWhuTHBTM0g3eGtZL21DUFRnSEw2dVNKYXRNTDgxVWVK?=
 =?utf-8?B?QTVwVVdmZE1iQlg1TEhPbXo0cjRSZVV0cTdGNVlDYUlSbTc4V3V5VVVEbVVW?=
 =?utf-8?B?aDZTL3QzNGNXdG9VRzE2V254b0JJTGNMYjUyNlVIek5pZkpyMk9yZStVUjVQ?=
 =?utf-8?B?b0xHRC9veTVLRzR6RzMvdFBYOFE2aGNUNkhDRE5Ia0VNdmxLQXp4dTl4YmpG?=
 =?utf-8?B?ZVcrUDFhUWs1MEMwQmhXMm9tdXAwRGFyNVJ0Vjk1dXdjdEpQOWc1WnNnV2ww?=
 =?utf-8?B?OFkzbmFhTEgvVlh3clJCZ3FrMFRQcjZUUE9XeGRCOUVJdWhJeHlpdFFPRnBK?=
 =?utf-8?B?R0Q0NzRrR2tJV2I0emFLWE1SNWYvaGFhT3ZrNWo0YUI2TzFEbDlmUm5KWkVH?=
 =?utf-8?B?cE5qNG16akRyck54bWVzaUNIQ1hhYUhNSC9mQ2NnSi9nbWtRT0ZMRkxQck93?=
 =?utf-8?B?NHo4dGpOSDE2Ny9PZkJDNUhjUE1yc1R2SUVaV0NRWnpzNk5scHhIaGpxampR?=
 =?utf-8?B?U3FRbGN2L2p2WHZiRVYrbTAzM0ZqNHFDZUQyVk9UU3BrOFN0TjNXK21yeUpC?=
 =?utf-8?B?cXJ4cVlIbXU1ZkQ4VjVFL1pLVkQxY1pTc0NEREV0ZE1VZVZLTFNQZUh5Ti8w?=
 =?utf-8?B?RnhEOEEvMnVVSEIwNFlIZkY3S1BiMkVjbEk5OEgvYzkyZC9oaVJqem1oT0Vl?=
 =?utf-8?B?d1p3Ym8vY0xuZENsQU5UdU1ucW1PZWwwSEppdXFOWkRnWkRiRHZ3MllZdTR4?=
 =?utf-8?B?WGRZWmVsdzZ3VFFJUlRrZnpQS1FXR1F6L3B2MkhrQnp2YmJyUTBkbWQvOFc0?=
 =?utf-8?B?QStrWG9nQnVnZ2F4Rk8xenZ4V3hFMTMycnV2YWcxa3lobTJqNG50MFE4MWcx?=
 =?utf-8?B?bXp2UUEzODI5cnRTRitmWFJmNEYvcTArVXV3TldBQllWODRWeTlweEFMMzhs?=
 =?utf-8?B?SDVKZTJCTHE2VmU4UU1JbjVvTEF4T2xNR1FyK2JjaEpoOHA4NGQ5RTZRMjFR?=
 =?utf-8?B?OVMzU2xncFdsOEFWV3dKeXRhSWtxODNXREVBQmVKV3lBLzJtbXFXQ01TREd5?=
 =?utf-8?B?NDllQ0NGYW9sVEJOTDlXVnBUR29rM0xLUmcxdHZSTHNBc3kyZkcwSmE3ZFM4?=
 =?utf-8?B?UHFJdDVDdllVckVDVm1WQmg5SlBQNUJlTCtUMDFsOUJIZitJN29RWTc1WXBQ?=
 =?utf-8?B?dys5MVZlYk5TWTB4OEw0OU5XRlZrR2JRSnpLd1V6NUhHUC9qK3JqUXVESjdJ?=
 =?utf-8?B?THl3dWFTSzNoaTByMVBrYitFZHVOWGNlMHhWY3RYbTRwb3ZaOXp6cEk2MmhG?=
 =?utf-8?B?N2VuWEFwRVI5ZlpPR1hlbVZjamxjN2Q0N2RMZTVOU0hBaWJ0VVFxak9XQ2N6?=
 =?utf-8?B?d2x6VklCQ0NOV3JLTkVvYzdDOWJXTlo4K1p6dUh2eTkrOFNqMDZoS3BYMkM2?=
 =?utf-8?B?ZlJ0NkVJbmNXQjRaMVc0OXgrb1dMN2xaaTFyaUd1R0F0MElMRmJWU3lNb0h1?=
 =?utf-8?B?YzJrUzcwUEx4ZmZHT0ZNemYzVE4reG1xVElYaVpBRDFQQjFMbUV5bVpFL01o?=
 =?utf-8?B?ZXhBczlsNzlraWluVjRiclhtU3pVamZkZmNEZU5WenljZXQvMDNXOTBJdm9B?=
 =?utf-8?B?Vm5rYTNFc3pIUWxYS1ZOdG9rV1ZUV1pUV1BHOXcvWnJEOWd5Z2dOTzhEb0tY?=
 =?utf-8?B?UmhONFR0bmlMQW5KK0lLN2FxS3pmbks0eDZ6d0xBWFQxK3BYTmNXSksrbmo2?=
 =?utf-8?B?SVdJRXpYSnU1RVJJRUwyUUVWcDhkbWpOd1FMVDJBYlMvOTZOS0M0OEFIdmhT?=
 =?utf-8?B?ZkF3TU1nU0ppNDEvN1FQNk9Nak9TbTNTR01TU3dBSnRTT2JhSzlWQ2R0bFVY?=
 =?utf-8?B?ME1oMEdRUG5GbCtQYkN6bkdZb1Z1cTh3bCt1bWRFeldjT3M3SDlwbWtOdGpI?=
 =?utf-8?Q?0KcUHe6cs0e2nzJak4HGaPUou?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4aedb9d-e491-40a1-1152-08de05babdd6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 16:01:14.2918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LfTp/VaybCqndbAhTbp1pedCwaM2KSKHaTZjTHSMRd5qYniDyeC733uB2Tk2zbhvCbTB1Mf5ZAefBh/r/ZvG+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949

Hi Ketan,

On 04/10/2025 20:11, Ketan Patil wrote:
> In Tegra264, different components from memory subsystems like Memory
> Controller Fabric (MCF), HUB, HUB Common (HUBC), Side Band Shim (SBS)
> and MC Channels have different interrupt lines for receiving memory
> controller error interrupts.
> 
> Add support for logging memory controller errors on Tegra264.
> - Add MC error handling flow for MCF, HUB, HUBC, SBS and MC Channel.
> - Each of these components have different interrupt lines for MC error.
> - Register interrupt handlers for interrupts from these different MC
> components.
> - There is no global interrupt status register in Tegra264 unlike older
> Tegra chips.
> - There are common interrupt status registers in case of MCF, HUB, HUBC
> from which figure out the slice number or hub number responsible for
> generating interrupt and then read interrupt status register to find out
> type of violation.
> - Introduce new SoC specific fields in tegra_mc_soc like interrupt mask
> values for MCF, HUB, HUBC etc., which are SOC specific.
> 
> Signed-off-by: Ketan Patil <ketanp@nvidia.com>

...

> +static irqreturn_t handle_hub_irq(int irq, void *data)
> +{
> +	struct tegra_mc *mc = data;
> +	unsigned long hub_global_intstat, hub_intstat, hub_interrupted = 0;
> +	unsigned int hub_gobal_mask = 0x7F00, hub_gobal_shift = 8, hub;

I assume the above are typos and these should be 'hub_global_mask' and 
'hub_global_shift'?

> +
> +	/* Read MSS_HUB_GLOBAL_INTSTATUS_0 from MCB block */
> +	hub_global_intstat = mc_ch_readl(mc, MC_BROADCAST_CHANNEL, MSS_HUB_GLOBAL_INTSTATUS_0);
> +	if (hub_global_intstat == 0) {
> +		dev_err(mc->dev, "No interrupt in HUB/HUBC\n");

It appears that this handle_hub_irq() is used for multiple interrupts, 
should the error messages in this function print the IRQ number that 
triggered this?

BTW, it appears that all interrupts that use this handle_hub_irq() 
function pass the same tegra_mc structure and so from what I can tell 
they are all reading and accessing the same registers. Is that intentional?

Jon

-- 
nvpublic

