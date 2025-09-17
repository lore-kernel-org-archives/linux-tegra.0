Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FC336D;
	Wed, 17 Sep 2025 13:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758114820; cv=fail; b=GsJGQ/8L0jgNALFpE6gNnXR49xX87Q7NllLqotJar9O+RcDpVTlxsHksxjFpSmn0Yz/jknslVxWc78xTATvliBSEBY4pVS8eO4Xb9HHj7jSL1b23+RTQbXwmvkDmOTblL9pZBASG7zQSfloLK1PT6XHGYPN84c6xeFPIen8b9xM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758114820; c=relaxed/simple;
	bh=hpHTMz+HmStSx/bDSz2aFAwVf5fTQdNHjpbKtWzEQAk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NHVIM8leoL/IiqnhNcCzv7cuuVvDNSERgMo9hHFJ1tiL931QWbVDotzX66oF0fhP5QcjZWnydeWI+VuTYAElKCkVZTZw0wF/QRvSqqMIAqZ5vD2oH035yz+tI9dTYYuJUD3NaBQJWUq+mMjxiNgo5hP3yDg1cF2qisnV9BXBFss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=agnfqXp5; arc=fail smtp.client-ip=52.101.53.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="agnfqXp5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EekB+FbIGK/YA1aNfaKvQHO9USuIV2HlOkIgLNZfFtKYKQsbLLfqgo/BEr3k0pDQbLa5hM+GnI3jZQme20P5mt6LyqDjiaic7h/dv1Wohar4fbN2937Uc2xOaMM8BZ301L2mOYwKi/XkW+6zgeEH6EML4RXfjCzJuHyFy3BLrzzlndytkICXLjwXP3GY0yOUbsO4+E7JDjnUSNAX9RSARxxDsXwMN+csJq1AXDDh90INowhIYdR+Ui0yx7tIIA7ueND3as1Ev/Wygp17NAQZQHo8aAgj8OWzR1f+RjO0oBnzrSooLVBmYYfIbknuPJcQr5QqEKbamOA6sdcM+5mkYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLUXgcljjaT3VMUx1L8D2+ruBr12vNbSRtTdJ0j8ZII=;
 b=qwmpn0qSonQKtvkfbAwDF012ce0G7kLekon+d+4BNeUeAWKFbh3U9GKuTuZhiUHr8dC/sRA8FeEsCVOB+2UYy79EZmyjDWbySjjSi4g1UQGQFucTvocywTrEWwIcaXk4lg39XqhqnjqCZtuUx4TnN7cr3p+y4viTpR2ibGx2ZWMqUjxEeNLSY4fpzAi78ZVIWMbosGKszb5kiT26lDlLpc1oUOh9EjjAwdclAdT6P2RmBE8Bzjb8t8U25Oukk/01o9kT22o255TH/j9kiuCh4Jx5n4SI79/rfhdd2CM+ZM+TZPfTOQcXkfy2Jbd/UEK6EdOcYMa0ozgRsXaNxCqyyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLUXgcljjaT3VMUx1L8D2+ruBr12vNbSRtTdJ0j8ZII=;
 b=agnfqXp5wrDsska4lDCnH8Ji6sIoFJhZQiftuAyhYihCal7cfCmp+Vx8yi1fF/jfF70XMRAtTwTiJXK/iakqR9JBqMh88YDIL3sILEznT3xyAzOiQ/Be8BwS0PG+c6n2PV/aIcXIz9cc5pe/i1BMTOKajujjTb31IALP/LTmG64HVLW/KYtK4sFxtV8ASPcbgQGH76mwkc7w6/8t2nYRDsDwd7RlAmBMHJ7HDG0bPECFXDeh8pdDTPALVLEV99Rl5rvnit3QwDQUOTHkvw853a8FNAYX9LQanUfaNpjTv1rYoIYNFTwHHE0u5r9iIMpmlfaooJM1V+nr6gDLRhpE5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by BL3PR12MB6404.namprd12.prod.outlook.com (2603:10b6:208:3b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Wed, 17 Sep
 2025 13:13:34 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.9115.022; Wed, 17 Sep 2025
 13:13:34 +0000
Message-ID: <db6cc8d4-2997-46c5-9263-0bb56205ff60@nvidia.com>
Date: Wed, 17 Sep 2025 14:13:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] memory: tegra: Several cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 Aaron Kling <webgeek1234@gmail.com>
References: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0215.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::35) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|BL3PR12MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: 9be61d7f-b2fd-43d4-dd5f-08ddf5ec01a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEdnSExveVJWbkZYdWtlNm1SVjZJdFVDY0M4b2xOOUNJYm41WjBQZGNCa0ZR?=
 =?utf-8?B?L3cwZVlwMEVmWkp6NVE3UWVteEh2QTRZYmNGSU5PTFdwUUdCWU5rZHNEcERQ?=
 =?utf-8?B?VHg1ZDNNOWxDcDRCMDdhNUwxSWVSYnFpNjhnamc0V283SklyQXNrQWpJZjZB?=
 =?utf-8?B?YXZmeWM2N1pCNm9idUxpazZEdmtCUTZwZWlZZjNOaTF0aE5OM2V4UnRWMk1X?=
 =?utf-8?B?NlkxTjJpU2JROU5BUEVyRldIbzNZOVpROU1mbE5wakprMTlXSE1PMWZhamtQ?=
 =?utf-8?B?anUveTJnQlljWHJnMDI5NFdsaDN4TnJFQVlTY0FTTDNJWittVEZ3WTRwd0p1?=
 =?utf-8?B?eXNoQ1VDQTMrRWEvSmZ5L3RxeDBDbkJrUkhxaU83cDdaSzg0TjBiVjhlWlFi?=
 =?utf-8?B?YWx1c1VNeHVxZkRZS3lESHcxTlVseWQ2MEJ1aEc2WGFiRzdNZ0xYMnhlbEFH?=
 =?utf-8?B?WDRGaWtONFdPRFhSUFJXZmpHa040QlhPMStnNlY3NXMvT2lmbnUzL0h3bXZN?=
 =?utf-8?B?dW1OK1JIZ0VpbFcxaVVvZElWN2t0c0NXb2wwak1lR3Nwa0p5dktWcGwveWFN?=
 =?utf-8?B?bGpkUU1VYSs3c294YWxtVjVUanhRRG1NM2JzSHZzWEVad0RlZlh4aWYvcmJl?=
 =?utf-8?B?enRTKzdJT1Z3OHlHa2FXMzdTMGZyREtFV1lkblpacXBqaTREUXAza2tjVENL?=
 =?utf-8?B?NVQ5d1dSd2pUbXVXTk1FcWo4VDEzdmZoRUNvRmQydTJrcTdRM1ZTdU9Cc1h3?=
 =?utf-8?B?L3hvNU41ODhObzdwQlVCOE5ZaWhVd1k0YlZFRkI4V3YxWlhNd3VWdmxuTldv?=
 =?utf-8?B?ZWU2WEMrMm1nYmpwSjVVb2lZWHZCbGNvRUIzNGdKdVpza1lyTTNqYkRWNWs1?=
 =?utf-8?B?bEJEUThOZmc4eEFDMUJaeUp5ZjlqNDZVVzhXdzFpQWRNejRvY3lRbVdmenVR?=
 =?utf-8?B?MGNuQkFxanR5TTZrRDRiWXFWbHZDZkFuSnpiaVlUdmNhOUU0VTVLQW8xOFFX?=
 =?utf-8?B?VGxaV0JxSEFSd1hJNXJkSTdnNEtNblFXN09DMUVNY0FtY1BCcHUwTTVrNjNa?=
 =?utf-8?B?VktVNGNyWnIvOVd0RG0zN2tyY21sUlIxMmI3T0JzY3BDeWphcE1oaFZwaXBn?=
 =?utf-8?B?a1pPU3Z3S0o4Nlp0eWE0SlVKUENXb2tmOHQ5ZE9yM3BOblRNMnhhQzBkaSt0?=
 =?utf-8?B?NDVtdFdzaFc5d3BtL0xMS0ludmFnU0tDVENqTUw0NUNRdW1IY0gvNHpDYWtX?=
 =?utf-8?B?dHN6MlNtSUVNWXFEWmx2bmFEQ3JveEpkaUhYUkpQd3RPTnUwWUpVc2dTc3dU?=
 =?utf-8?B?ZTlVMG41UGw5a0wvOG4wRkNHNE9lcHpyUFhPTml1d1VVSzJkUi9WbU5MQ1Vl?=
 =?utf-8?B?Mkx6T0FKSUNJSUV2cmhaUVFIeW0wU3h5bXc2VUUzR2I0YnVCamZYejRYN1h0?=
 =?utf-8?B?dXl1aWE2OWZIT21GYkcwSUVlSm05TjZJMnh0ME9zTFA3QVVOM1RNcDRVV2wv?=
 =?utf-8?B?Ym1OUGl5eEtxK3BjM0pjVExlU1dEWVlNd2Q1V1pDTUsyWmZteEk1ekRYT2Fp?=
 =?utf-8?B?VDNuV1N6QzBZcm1Bd2hzOXRFL21uNzd1TXBBQXZycTZVbkJUNUZjdk1WRjdh?=
 =?utf-8?B?VzBNMnF2T1VKdlFkN2ZOaTVuMGVXeGFTNkFEcmNuLzdhVmxPRWNnMCs1R0ty?=
 =?utf-8?B?czdGUHlzV2xzbzZBUXpaZGkxVzIvYnFYeTZXQWhpQVNGUlJxUWVneHpYamtH?=
 =?utf-8?B?Y0l4dGllOEVHT1BUcXEwN1Z4ZTdXZ0dhVk14OWpFeEtkNy96VXVMZ2hzU0FN?=
 =?utf-8?B?WTFtMDJYaWs4SFhSQnJCZGYzZDIwb3BNTWlCM2hKNmRnbUVYRmR2TnBOWjdm?=
 =?utf-8?B?RklpZ080V2MrdkZmMEJnNm83UzJWaFR4OEdiZEN5R0g2ZFEzVWlFQ0JuNjFh?=
 =?utf-8?Q?FWoeKk0AyGI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVJCTlVObnJadWhHSTBuWW1HRW9hUWwzdXc5dk5wZFEwY1dMTzIvSWk2aCt5?=
 =?utf-8?B?Nzc5bTliV2huYlF2Uk52VmtOSmdkNjFwSUV1eDJCdUsrUE01eWtnZUZWS2Vv?=
 =?utf-8?B?NjJGc2tLcnUzWDZ6OUEwTUoxVVNjV1hWVVl0NW1nQjNQNkxtb1JqT3E1d2JG?=
 =?utf-8?B?Z3M0VElQSlo1TGZrSWhJUGRueDg0aWhZR2V6UWZJaHkyaGNMdVdiUVQ5bEJz?=
 =?utf-8?B?ekJvdDUrSGRqTW0zSW0wQ1lVU2pES1dnQ0c0YkJLaUhpYjhycExkd1Z2cVFW?=
 =?utf-8?B?d3FWSE1vQnphZ1NKNk5tZHBQYVAzaysrNXdHSlhQYVdHVWU5cjVjL0tnaVdZ?=
 =?utf-8?B?aE1VbHhXMmxYMFhuRmNXdU80RHFnaGUxZEZqeFVERkY1OEhBRGlvOGVWc2hk?=
 =?utf-8?B?TUI5RkE0MVczVWduVkdKelJUaXMwV0laUlN3RnZwSlB3R2dlU3JwNEk0eCs5?=
 =?utf-8?B?VTZwbXlJVGF3L2g4SWluRGdIc2U3VVl4SUt6bHJDRTVqZ2h0SVAwNVhOaCtH?=
 =?utf-8?B?cW9lZzdpTTZaKzVxRzZ3VGFwSFNnMitnVEQ5TE5GRnZ0Zk1KbE1zYVpyTDR5?=
 =?utf-8?B?ZmZMVDZjYXBNZkNmVktmelF1R2Jpa0JBcGFkL1p2Z2RGRjRUYkZrTHRqQWhY?=
 =?utf-8?B?eU5DbUc0T2FwZG5BbTNCck1wM0MvYkI3dE93TlRmWGUzTW9pSFNMQzc0MmF4?=
 =?utf-8?B?Qk52c09xTVpFWktrVTdxUFR2L2wyVlNoeGNVS0k5QnBzdzg3Q2pnSjRjc2xL?=
 =?utf-8?B?eDFycXZDWW0zRUVwZ0MzMFRJQU1kbTFLSUJXWmtEeVlmTTdieXpjNU1wdVpt?=
 =?utf-8?B?c01KTFhOYkVseHpEWjBmNmtZRjdJT0pIYWl6MktvSjNzNEI2N0dGai9qQ1NM?=
 =?utf-8?B?OVBNU2pvU2RMK25wbW9tc1RPejF5VlFhNFV2Wk5WeGlFdnM5bFVEeW1QU0dx?=
 =?utf-8?B?WEpMRDdMY3NZdER0ZzRrS3huWnhxdWpNSklHL3h5THFPeUNuQlNVUzlJK2RZ?=
 =?utf-8?B?SGRPQUw1cDBDZTFSa3c0UElwSk5VUkdlNDhmc0tNS0JzTnYyMTlSUGo5KzNi?=
 =?utf-8?B?dDhraytJd0ZIVDVjZTdrTm5nY3cvVG1QZG9jZEVrMk5Vc2d6dXV3dmRHUVBJ?=
 =?utf-8?B?TS9zdVNNcW82dnh4MFo1aUdDdGRQcUFnTjdaNkNIWE9KeHRRT2xrNEt1RE11?=
 =?utf-8?B?NXMzeTF2WDJVdnkyVXJzWlFGNGlUOS9qWjFnS2g0VUprZ2pjMHoxcC9GVDJF?=
 =?utf-8?B?T2lTdS82ZDQxUjFoUFlZOFlINXVFbGZYRnc5R0F3R3Z0ZjliYk1HNTBNaHZV?=
 =?utf-8?B?TmZ6OWVrUDlvekFHc0hNS016Y050SXpLQ042QWtFbDZBZXRkb1YrRFlqVy9a?=
 =?utf-8?B?NFZUUWdPVlJ2QWhOeEFHUnlPcHdMWUpYUndRV1RkSTg4Nlcxd29idXE0K2RT?=
 =?utf-8?B?SUxtMzQ0cWJYaS90eGl5aTVmZ1Q1dXpDZis5aFFuK1FRdVVUMVFVUkFIbW4v?=
 =?utf-8?B?cExFZVE0OWUrdmpFelZnbjJZNDd2SS8rV1Bxc3BIaGdxViszTXdtZ2Fwbmtu?=
 =?utf-8?B?STFDVVZKTEt6c0orcWs3VGFQUlRneTJpd1FEOStMMm1hZ3hFbDR5M2hUVXkx?=
 =?utf-8?B?WCtWRGNsYUVkVTZXR0JGRmVMRExacEk2bEFOaGNQMWtRRWVGbmtoRWRhVThF?=
 =?utf-8?B?U0NCNW5IaUFvOCthaFMxZGlwUWc4RFBYMUZwSEJRSFZvYkhJdlNoOUlmaFRl?=
 =?utf-8?B?RDU0VGpaVkpST2t1Wk1YdGx1MkhYM2ZJZmEwY3dtSUJ1MGRyVGtpdm0xWTRw?=
 =?utf-8?B?SFJ3cGNCc2Nvd2IwM214bHJzWkxtVzExL2ZkQkhsTmllTG5Iczdxa3ZKcm1G?=
 =?utf-8?B?S0pjRUhaM0JDZXFuVGFmcFJFZU4zVlJlNHF5aGVWUThOdFFNaFBYZzVnTVhR?=
 =?utf-8?B?SHlBOUF5VW5oUDZScGdwQ2Ztbk5FL29oMWFOQlZjdEVYUkZsSVhwQkJWUDZP?=
 =?utf-8?B?d2NveTlxVmlKS0RxbTRRNWNjVXlybG0zRUd6UVZBTmZYMVZuZTRrR1dEK2lm?=
 =?utf-8?B?WkhnTkZXZHZxRUxSeVVxQ0xORVRQbEdLSWsyaFZheUw5Tmw5Sk13UEVPREtL?=
 =?utf-8?B?NW00b0JMMllrUkNKaVhydHN2K1k3bGRHckR3RG93UWRiTjB1M0NvcTFpRDhC?=
 =?utf-8?B?cDI2MjdVNS9hbEExaEZtMS8wWFRHZGFJZEdZREhOanptSUJKUnlpSWdzUjNE?=
 =?utf-8?B?bU5jeGU5OGJkSzRxb0xZcEZhNXpBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be61d7f-b2fd-43d4-dd5f-08ddf5ec01a6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 13:13:34.7657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8cAUeqvyoxpCveaR1FWKikU4vgmz7tGjIp5iomxYkUsaevpdbz8P3F/3gKKNQb53qdZgFufhH+GVxtu5ZCV0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6404

Hi Krzysztof,

On 11/09/2025 10:43, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Fix commit msg copy-paste in the last commits - proper number for
>    "tegraXXX_emc".
> - Link to v1: https://lore.kernel.org/r/20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org
> 
> Few cleanups for Tegra MC/EMC drivers:
> Deferred probe, few simplifyings and function name unification.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (13):
>        memory: tegra124-emc: Simplify return of emc_init()
>        memory: tegra124-emc: Do not print error on icc_node_create() failure
>        memory: tegra186-emc: Do not print error on icc_node_create() failure
>        memory: tegra20-emc: Do not print error on icc_node_create() failure
>        memory: tegra30-emc: Do not print error on icc_node_create() failure
>        memory: tegra30-emc: Simplify and handle deferred probe with dev_err_probe()
>        memory: tegra20-emc: Simplify and handle deferred probe with dev_err_probe()
>        memory: tegra186-emc: Simplify and handle deferred probe with dev_err_probe()
>        memory: tegra124-emc: Simplify and handle deferred probe with dev_err_probe()
>        memory: tegra124-emc: Add the SoC model prefix to functions
>        memory: tegra186-emc: Add the SoC model prefix to functions
>        memory: tegra20-emc: Add the SoC model prefix to functions
>        memory: tegra30-emc: Add the SoC model prefix to functions


Thanks for the series and updates. I have been through them and so feel 
free to add my ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic

