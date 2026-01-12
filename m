Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010049.outbound.protection.outlook.com [52.101.56.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D06A38D;
	Mon, 12 Jan 2026 22:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768255427; cv=fail; b=kPr5QQb6vuJ6xRmF7hJbJQsMbIyr5ViZJE01kLji2bC+bjtARwG2vpc1AAWteemjHkMmpdqH/xyXNhFTTxAPri0J2I3oqdeM1+NKv9h0oyTuopiTOfI4MNUMwsBgibOKvS0StZUlwecpR5EgzHFVZsOXB+yuAozRqw2qUUH8VNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768255427; c=relaxed/simple;
	bh=ckyIHqAOFjjwnS9aqrnQsXjsaRSt8QX4w38S4dib9To=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JBADrwLp33uc7/i377xfp4VbEXj59BGmwMMb69fXaos87ccbPt57E7b1UtTfxOjKlGeb02Te2xXAX9rKaQAJgLnQSvRgf93TigSwvinZDjOxAxzhGXBt3Kp92r+sJgDUiKYpi/MWo8zCpgD/Ow4c6eKeVGN9SEZ+4ERCx9Xu48I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f4BoSaab; arc=fail smtp.client-ip=52.101.56.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f4BoSaab"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAOgB80gKbiHsaWyaJ4hjqLNMP0wVurP4v4w/oaW4u10tZF2SxZuaaHT1IEev6RNDZ2y6DWYszGggy3L2/3c7h1cL4Sl47bUrj2gkpxv6g5r+ubwEifXQe9zm0GRTpKpHXraN7h6PvTMvVwRgLuaErkAJpkhSVBVIcN3W+rdwoP90tnTy3XRzKOxXe8zvP+R4m+rl4O2BwnwkEdfM3hB/oPWjdX+ZQfN5N1ZB9cHQJY3vmIrISorTVN212T21nryBBxAEF61Pp5+OUSQVLC6RZwGWQzJ5EBdX2AArmrkDlCCEjazdFk94MF5IwYUJYN0Mvs3xJnIOekNy6Azj62aqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9RCndJ2w/ZxC6n+tugBEIn6uT5tFcH27pNoaKLstsg=;
 b=BXH4XnRwRl/+4tgFDZOd1oLHeLr540S4lL0ZFeaJ+ta5g175qITMuPb4a9Ug1xCm+Ok14COmTHW+eYmPZ1uSW7QLKynd1u3gA6xEUohNU4gy6v88r59Rg2YMF1ZTXhS60K117AlwHDoPZTussfxh0n5bRoqZ/iawd7RIBUF/hO5aQWydeMIStR53yqQC9PULgaLI+A8CdJSH8dSePumDtbKv84mPmIuOjSD8RA4mXo5CklZhlkLh9LhG4M6SOXqklMSLSTndj2KBWFtDJXrHHuHKxXLf/v4OslC9yv8RWBjXjGXo8gIBRHrxkbHcL06ydQdtzZYTuxfAOyK+t1jPSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9RCndJ2w/ZxC6n+tugBEIn6uT5tFcH27pNoaKLstsg=;
 b=f4BoSaabcV10BanuipJUV9Qcx0/ivibF1qWVUoEKwgxTLyuFx8tr9d9SQjKOMxT93d1BZ8Ms4TMzbUKc/wxxShoAWBnV9arouqZ52ahNqJGqo2ZG3HQNEX1NPuHjXTWtIGUYpN/wi3M0z1iU9MWR+Bb2ngRfFILDhJkySfbm4iGkr/2vXcZiedaMAFrOteEWp/u2pHTIdi6qAGJ1aIpsPracruOONQnguon+nKSH/6qrly9JaX5W1IfdiaCxv3JpjOFGRUdFOB3LefB+3xaxKVyQlj7yGIkxULl6xoREY/tTnzWqaq1abO2Z+ECbsF0LHkIv/miIviSjjp4shr/vAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DM4PR12MB5890.namprd12.prod.outlook.com (2603:10b6:8:66::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 22:03:42 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 22:03:41 +0000
Message-ID: <ea60f024-1f39-483c-87e3-36624bd58d49@nvidia.com>
Date: Mon, 12 Jan 2026 22:03:35 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: tegra: smaug: Add usb-role-switch support
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, JC Kuo <jckuo@nvidia.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
 <20251204-diogo-tegra_phy-v1-5-51a2016d0be8@tecnico.ulisboa.pt>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20251204-diogo-tegra_phy-v1-5-51a2016d0be8@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0206.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::13) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DM4PR12MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: c392d31a-8d3e-4a92-0cbb-08de52267200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVJGdFUwUmV4ZitPSk1nOWM4MGlleUZZeVZncUV3QTBYbkVET0FVS3BtUTQv?=
 =?utf-8?B?eWx2cSs0WjBKM1V5cGJqY29XWlQvMlQxc3Myemt2Tml4RVp5YzVZeEluNGZM?=
 =?utf-8?B?TlRydUluQUg2WG1ma3Nac09CWE44NTR3OHRFbTlqWUwwSmtyS1NlZjFZaFp6?=
 =?utf-8?B?SVpHalB2dFB3RFYrblV1eXhDVnZ4YlNtNXVUSGlGczZ6dlZpd2J6RTR6U0xH?=
 =?utf-8?B?bG5ldGlESkpLaEh5VmsrZ2w0OXF2azUyVjFTMmpvVjAzWDhwNEhOSjhMZDhq?=
 =?utf-8?B?bEtiTmt1cmpDQ2pYVHpoNmFCNWdLUUdjbXBSM0pQNmtaeEJKaSt2Uzl1VXdU?=
 =?utf-8?B?UHBxL0s3V1NNdEI1bEg5ZC9WM0dEZGN5bHVDQVBBT2tpY2M4MUp0QmhUVU1S?=
 =?utf-8?B?aTM4QnFCdVZ3N1dFcEZKOXNtdHZpTjZDMU82WDdsbkptb3NnK0lxbUFwcTQv?=
 =?utf-8?B?dk9tMHAzL1JQbFNzQURnR2NnRDU3Mnl0ZVBOTHlSdHpDVzRVR1drY2lJdnNG?=
 =?utf-8?B?bDZMQ2xZb2JoNFJpWFZlZkloQUpUMCtQd3N1WkpLbGFUT0dHK3VzTWZnSFR6?=
 =?utf-8?B?S29MZzZRK3BsSFAyVHBveFk2VlBnN0x3TXI5Z3EwT1duWXRocHNuSFovUnlT?=
 =?utf-8?B?NGpXM2ErMmFqM3pGUzJoNUtlQjVmTExUWDl3YkpVeVRNS01lNER3SlNJbXd5?=
 =?utf-8?B?MDNCQ0lUcXFHRkpmdVBoV3dHaG01akpPNUE4UURVRVFtdmx1L2N5Wk5Pd3pK?=
 =?utf-8?B?cXF3SmNrQVI0bXhsUEM4M29pc0dYZ1FOc1BDbVBLTmdnMUMxOHJ1M1YyWmNI?=
 =?utf-8?B?Y2VVUmF1L0svcjR4RlFySEwyR3VMeXpyNzB4L1ZockIvYWpabzhVZkVqNEhN?=
 =?utf-8?B?Z1VrV0JkTWtUWUVpY0dIUjdmMEZrRG00RW9OdzZ3VTNtWUhhU2h6dXBkdlcy?=
 =?utf-8?B?RWowRUdHSzZqeHpWWjArN1Yvak1yQklqRUQvUTB1ZUhGaEhqTFFtTHdtcS95?=
 =?utf-8?B?NHpvaWhQTUJKQmlHblBJNWVJSUJjNko3RmFPbEdCU21oSXdmZEJLdFBWZjg0?=
 =?utf-8?B?UnlYeFQzY0dtT0pjakdFWVd6WDdVS0RDZC9BR21IeitSaXVyaGpIS1F0dFZ0?=
 =?utf-8?B?ME9WS29XMWl4R2ZTZUhEUUd1N1lKdjBOMXVhL0kvellsMkRta3BPMVk0OVZB?=
 =?utf-8?B?R2NnWjlsam9GSU9ZNDV0WVRncDVxVU56N09JT01hSStMeVJzaEx1Y2lDRTRE?=
 =?utf-8?B?NWhPRjg3bU1DR0Z3T1Y5KzNzS3o3elZkODYzWG5jRkxwL3hIV1FWSXJnWFdm?=
 =?utf-8?B?djdWOHRwbjlNSmY1d1hsWFBNUytKeGxIZ2ZVYUk3bHpPcUZGZHkvOHMxbGQw?=
 =?utf-8?B?L1JUMjdqZnRnNDNxY202dVprWE80RUdzZGlTb1UrNG9seHpEZjNnUXltWHNJ?=
 =?utf-8?B?U2pwTXBkSHdqSkdjM1pJME5pQ0RlY2JtMEp0NkhvWkpXNVJ1eGRaQkhsS3lx?=
 =?utf-8?B?SjE4ZnVHSElNZXZVTVdDQ05CM2hWWG5YbEMrUGh4RFpNNzNsSXdzbWhyY3c1?=
 =?utf-8?B?dGJ6ZkFzcjZsRnhhN1lBbDU1V0FZK2cxbkVJY1hRN0EraGFoRzM2MFo4NmZp?=
 =?utf-8?B?QzVxWEwzVHovcXp3dVd5OHBxRFN6ejFJWFRtNStTTCtGT3lVYUFkNm5WaFN2?=
 =?utf-8?B?VnpTR0t5b3JLMmF1azVVRCt2N3c1M0JwZTJ1VXAxc1pLV2l3dlc1L0lrckNS?=
 =?utf-8?B?dmpqc0Z2UjlFdzRjN1MvTWlRazM2LzVwNTlPbmlHUjYxMGYzaHA3N01hQVdR?=
 =?utf-8?B?ZEl2RW5nbW1Nbm1BNWRodDlsVjhHaDhCVXJxYWRMVGNROUFLZDcxSFRDVkxJ?=
 =?utf-8?B?eWtXQnNDNTIvRDNlakJzaktWU3NNVWI2bFlHb2xsczVtOUhZb1VZQjJaMVRY?=
 =?utf-8?B?cUZhcVhLSkJ4eHNvUWFnTlRPT1J5SklSMm1JVDE4ZTk2aXFJZ0lYMVg2TFNB?=
 =?utf-8?B?M1M0YWhxT0Vob3FRQU5nenFYdUluVHJibmpBSHlBaDlnblRoc0MzRTZybktI?=
 =?utf-8?Q?ChQa/t?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aC85SFJqY2o1d1FsUjJzY1FNeGY3M0tmSit5L2lNaGdtdVNQdE5rWkNsN2dv?=
 =?utf-8?B?LzF4ZThRTDhMQ2U3WHBoV0lFbnJGMlBRcG1NeWJacUZPVE9jVElpL081MVBD?=
 =?utf-8?B?VUFac0VScHM2UVl0MkZ5OTRrVEZPeFhoTldJNk9zM0lDeDJTdCttVGVxajVK?=
 =?utf-8?B?U210bWNHaVdrVUF1b2xBK3hmeDRIaWtEVlFVSTloZkJUYXE5UkVURXd1WlZE?=
 =?utf-8?B?M0FjR1dJQVM0bUtwUTVTRCtuWTFsUmxyQnZUWTZhVHkvYlhSZWdqUnZadHRL?=
 =?utf-8?B?VVZaSjJYVnZqQjRpVnh0UEVocTZDK1ZsWTVMM3hURGY3QzBtTy9Fa0dPa1VN?=
 =?utf-8?B?UXl0aGMyRWNBQ3pCRVF6N202NkpvL05hVFFVTFVpMlFaOVJnb2ZyQk5VZjR4?=
 =?utf-8?B?SWtaZGVwS256UXkrZnlwN0RxQm5Najl6UFZlRHZYdUR1MGcyS2RlaURrRSt2?=
 =?utf-8?B?bE1BeGk1L2Fib1FHK3Q4c1hPRkFnN2NEQ1BTMVRjSHJyV0piVm1mcXFHTHht?=
 =?utf-8?B?ZFRjc3lSOHdyaldMdFVNY1N2RGN0SldKSDJ0eUxpQ2RINVNyeDM0WDZhVE4x?=
 =?utf-8?B?QkJXZU1DQUdub0V5TFhBRktBVlZ1eEplL2s2djB1VUJnR216dCs1NjBZamg2?=
 =?utf-8?B?UzFBa2hsakc2VEdxQkJscUxYQ3M4QVJJUkJBRnoveUJmK1JQemxER05XN3BI?=
 =?utf-8?B?NnNIWm9hMzNkVy9LTnBFdzBlQjV1MStHUXVSY3lSaE9sa3dqNUxqWHVEUms5?=
 =?utf-8?B?Mmo5WlEzc2dDMlh3dENpRzU2MDI2QVYwVDd3cXlManZnRXgyMitMM1dGK1Br?=
 =?utf-8?B?ZTR5eitYOWdzVWZGcDF3Y0hGWEFwWjIxdVoreFZMcERPU3BGNlNBcjZTV3NK?=
 =?utf-8?B?MGxsMk9UU3J1MXZtVWdZd3hnTzBXQmFEc0tHZ0VaU0s3bERyZUdvUXY2Vnlw?=
 =?utf-8?B?Q0VzNnhkWHJuRkJjWktYNUpKWHV4Q205Umh5S0M1Y1hkdURvUzRLeVV0ckQ3?=
 =?utf-8?B?aWhYSlVHZmoxdXVkZEVTb3NjdkFVQm5RbUVDZUFxR3ZycTRxZzVYajVXdzJN?=
 =?utf-8?B?Y1JhUVg1NHZxM0V3cG5NUmcySFErY3VzUGxsYTkzNWFsYzAzTDJXWm5nZzNV?=
 =?utf-8?B?YkpGRlljU21qNFFVTFJTRVN6TitrcWlhWnNvSEpFNWJ5VmVtSVFIQmo0bTBv?=
 =?utf-8?B?dDZxZWZhTzVJWmNML2xDSDhhbzVmdWJKNXh1d1NXN1AyZ2xRV0ZtLzlKWERB?=
 =?utf-8?B?azVjZGZOcGdPc2syVnNPY0lPN2RMZjJYaXo3VmpXMzhuMjVwV1kreFhjS2FP?=
 =?utf-8?B?Uzd4c1E5Sjc3NjhQalZXeTZqS1dIZzZidVpyMno2WW5KcFZsWVlrUll0Rk5m?=
 =?utf-8?B?Z0tZWWdkYWtFb3pvdVpOU3pBNGxURVVmZThCMlc5MWFSaXg3YjdibWIyekJX?=
 =?utf-8?B?clZJMDBleFhWcVFRTmNlejJmSHBuNWVZNUR5Z2ptcWRMR2NEZWZQS0NKT0po?=
 =?utf-8?B?L09lOTRUTFZRbFMxTmVFc0ZUVTErbVdGbkYvVU9taGNCOW9qWGFML01sOVh6?=
 =?utf-8?B?Z1lzbzBRZk0ydndvMUZhL2NBSytOdkwvNHBtWHlpUGpQSHZYRnliNzZ4cCtH?=
 =?utf-8?B?NHpSS1pPYXJKZGlxODVYZUQxMVFGdlJWRTRrZ0hYOTJQZ01ER2UwYTFHdk9z?=
 =?utf-8?B?N3NkUkczZmJsb3gxTmxkeXRDZkZPL2FCU1cyb1FtYnAzRUROblBpbDhlMFNM?=
 =?utf-8?B?QzZUL3E4bE9aNklQY0tlc0hvMWJnVUllb2Jsa2Ircko5My81d2gvcm15MGs1?=
 =?utf-8?B?NnR4Uy94MHFJeUkrODdrNCtWOXFvV3ZjOXluOGNzWDZoc21TZ0daYy9tZW1J?=
 =?utf-8?B?UCszOHdwWXcvaEF2cFloUHk5NGlUZ25WMFFSR2tETUFyWTdBRlpWWnp2VUpI?=
 =?utf-8?B?RGY0UTg2TUdSMFFzbjFzcjM2ekJ0anpzdlBmemk3OW9pZ2RIcEdHRkFiaDM3?=
 =?utf-8?B?Q2hxcTUzRUUzbVVUVzhCNitrNEhXYldab3NySmVSYXgyZGFrUHlGN1NoQjNk?=
 =?utf-8?B?eHBITUdrSWdENkdmc2gyS0JpU0pxMVhKOTFTcHNkMUgwMDZvTzdNUUR6Myti?=
 =?utf-8?B?K3gxL3E5VDR0SFM4UE9DMXp0QkNmbm80Wk1yNXhwdXJrM1MzeFRvOWw3MUNo?=
 =?utf-8?B?K0l5am5Xa0dkb0tiSVhaRnpFbnFuU3hzRWprT2d5ejIrVDJNcjljMDN2R0Ns?=
 =?utf-8?B?STN6dW5yVVdVWTBGMXJzazR1S01FY3ZDRG9za0xsSlpFVnk2N0c4OGhjRmFQ?=
 =?utf-8?B?ZUFvYWhNZEl1UW1sM0hpazJaU3hqTTNIT1lZMENMcWJUd3dWeWtDcnU3V2JZ?=
 =?utf-8?Q?ivP2rHMRnLWB+CPQN75+ew+NO4OQZsYySEkvz/InlmOVr?=
X-MS-Exchange-AntiSpam-MessageData-1: bJBaQgRF4FQrew==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c392d31a-8d3e-4a92-0cbb-08de52267200
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 22:03:40.9036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfmtnAzkOjHyHAGTTzD7IRCa7uhpMpUVJcP5e9pZyYBi1Hkxk1wpQ/MUo4RjFoeMqgEczm/NXLHCngW6oFHlIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5890


On 04/12/2025 21:27, Diogo Ivo wrote:
> The USB2 port on Smaug is configured for OTG operation but lacked the
> required 'usb-role-switch' property, leading to a failed probe and a
> non-functioning USB port. Add the property along with setting the default
> role to host.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>   arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> index b8d854f90be7..49bf23d6f593 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -1809,6 +1809,8 @@ usb2-0 {
>   				status = "okay";
>   				vbus-supply = <&usbc_vbus>;
>   				mode = "otg";
> +				usb-role-switch;
> +				role-switch-default-mode = "host";
>   			};


This change does add the following warning when building with CHECK_DTBS
...

arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000 (nvidia,tegra210-xusb-padctl): ports:usb2-0: 'role-switch-default-mode' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra210-xusb-padctl.yaml

I know that there are many warnings seen for the smaug DTB, but it would
be good to ensure we don't add more.

Cheers
Jon

-- 
nvpublic

