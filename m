Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F2519CD08;
	Fri, 13 Dec 2024 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734083075; cv=fail; b=JMjWHrMb8TdltKNBZOerq4lhcCBzeJrf9h6oZiIdhsh+aKh72hiyArPSIIf21PkClzcWgEbYGRrNnGNnu5i8YQ9BW2n08p6vKKJ0gz5M02wjD7KnlK39CUCBjgc2smMvFZ6HgH4qLSdWRXfNH4wij3JsUaO7NXoh1ZQTglpDrQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734083075; c=relaxed/simple;
	bh=hF8Sp+XRUcx4RjiUlfCTMDpn9t8CQePE0ulji0f3P2Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H7iJAP8lmQzW6D4dvEQ37DZuQm1Elch22J2wsAaR2ZfNZWBLlPv9+GMqLGRpj9I6VSzlqR/utMC5X7u4/yxxODqyXYex/9/iBLM0FlTxVk5xdtm5g31zUKvs72O71pBmLlD0XqyvJrIUmGbQWDN7tmeBLtTvwXaMPP2tsVAo39A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LDy7HxG3; arc=fail smtp.client-ip=40.107.93.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LDy7HxG3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2xl6v+3tmbL5mEM+zx9Bi9DQ9OyhBAS8o9/Ti81Z99QtwytvxwzsA7lyAsrqMSF5GZBYaOb42UMYtnZScUyPJQrRH1BX810FzhxPhenSxyA+7YUm0fp6+4TTBwFvGCY2fWBYVyMwf5etF21IsxGeBy96G/35t9XHjnNpikzHgRj6V3fyUnKz/l3a/srntF+tr9n1xeQHdLNlUbt/US90lX3NRSMH6LPQNTrMrCGuIZLaU95geSnNQDkRcDtQg9M35O7QpYjcblkQ5DyvSTNi91//UVNzNzjZq1Qs3iU2gLjsi+mSWHWEu9HNdImjrbDS1QqSVQA9k8K4T5NQFST7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QM3gjdxCGFE7nFYBXaoPgJ185t1z06L6W2CRJfJzwUk=;
 b=XM/CTpKuqCqlon+WDtNzqGhBCE6o9k1bfOPnimZ/A8xwy/ui8h8epN/6m78yx6UJnSXxB/XO93JTyWWXfkvtJgSfV8ikd/fn2o6n5N6LMcqJ/ueFtLF7pqdl+hOW/EJ3ibL6gWn1q2cW2VZKyOeexjl/0uhF+SQbQz8aGaTIlNaDswtyuZyJIh6GimEjz1jc+rqQLz7AWKqNPEFZ+otnf4roqGzlvaWwsL+NkUlD1aBEEEprr1RS8SOzPyPb+5zs7UWWqijet6XCH1vQJJLoqtMIp9DdMRn2A2uRgvfS4o2Rsy0T1EFIm+9tFJxHjnwHqESXRmv9GaafWGAdQMnl2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QM3gjdxCGFE7nFYBXaoPgJ185t1z06L6W2CRJfJzwUk=;
 b=LDy7HxG3uZaVlxYZJ8fNFB2ucQP8ksyfDdmAtQtr5138AIx9H44pN+BbPSzIrvyjoGGqdt6rdnEpno7wWFn8jY9JdeKO73hMGy4fZ6jtIxMF7zFKOq9JpsRSc1oerfp1TnCvibCn69FJfmpTV4dfZEGFQeVXaXW+/DHspRQbsmPMA86io/JyZJvCBDSBOhHg3OJGKO2BQDmRKVXVLvKpuPFOoqdpAIggrYU8nxmFhi1rUbTotzkR2ClnViDzIH9eBDucFwEMF/48E5U5ENtfMst4VIkz1VmiXBT4MBV9preMfBZVLt/dzHUmgIzqFFvOsFj+PvkmI8qnKSn+tYRxqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MN0PR12MB6102.namprd12.prod.outlook.com (2603:10b6:208:3ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 09:44:29 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%2]) with mapi id 15.20.8230.016; Fri, 13 Dec 2024
 09:44:28 +0000
Message-ID: <dd45836a-a4f4-4383-8ade-d81c1b11c660@nvidia.com>
Date: Fri, 13 Dec 2024 09:44:23 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: tegra: fix typo in Tegra234 dce-fabric
 compatible
To: Ivy Huang <yijuh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, Brad Griffis <bgriffis@nvidia.com>
Cc: Sumit Gupta <sumitg@nvidia.com>
References: <20241213000305.3533971-1-yijuh@nvidia.com>
 <20241213000305.3533971-2-yijuh@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20241213000305.3533971-2-yijuh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::7) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MN0PR12MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: af45dd71-a9e4-491d-f9b4-08dd1b5abcdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmQ1NmhCdkQwSXRqWmJvbEV2Nm0yMUdkZFR0SWgwR1JUQ0VNZVhNMkZFelBa?=
 =?utf-8?B?b1g3TTJrYjFmRFRzaU8zbjVKaGo0Q1NBZXNteGRFRlM5NldaUDNmS0dEeEsy?=
 =?utf-8?B?ZkI3b0tWaTZFOG1MbVlLelIrbUpNcFJpcDRTYnlYWUpaWkZjLzhnNkNJMXhk?=
 =?utf-8?B?SFpVTDA3V0ovK1UrS25YbFczYkNSR3dVUEZQWWgwdzVkMWJNWVdERFJxWkd5?=
 =?utf-8?B?OERLc0lkVzlZcngvWVlRMkpYcmdJMkZNdWtoZlBIUC9YeTRKb1h6dTI4V1Br?=
 =?utf-8?B?cVBhUVUrcERQMDVTMWlFVURJQjV5SlhHdWxCMHpFZFlkdjJQejl5bjVkL0w4?=
 =?utf-8?B?VGlobXZhUkk5RERSOWp1VDFwS1pWRy9rb0wvYXVqTi82bERCUFcrbHFiN3FD?=
 =?utf-8?B?SjhWRHFINjd4ei9Pa295cnhRS25pbTNQcWl4NVFxYU1FTTJlLzlHQ2lnSFJl?=
 =?utf-8?B?UDFQeWEzWFFQTWVsOXhobTVXdkoyZFBoTlZBWWpUaFJaaFZWYUtBbkkxOWpU?=
 =?utf-8?B?WDJ3ZmNLbUJ2ODdONDFhaldKZlJkdmhaYlRTNTRTcXluL3h2cC9ydFNNak5U?=
 =?utf-8?B?QUQ3ZzY2QVNEcmJtWDlMUFhoMHE5aTZtcG8wRlphYThsbEs0KzZqVTI2RW5P?=
 =?utf-8?B?Y016dFZORVo5a3hXNHRSVU5wNjQ0NW9iaFV3QkhhRThpMDFDUDdHcStrek9x?=
 =?utf-8?B?Z3BuZ3N2SkZOK0Z2aGl6aXh0eG10Z1lQSERULzBCeG5IbFdGeVNFamxIT3VT?=
 =?utf-8?B?c1QwWDhVb1RCOHB5M1UyUE1VTUhDZkx5SmZRQThrL1g5VVhTU0VMNDNOcnMx?=
 =?utf-8?B?REIrQU00UVQ2Z3FXNCtqUDd2d2dXdmVGNkhLenhpYVMyMGxGazFUVml0OXhZ?=
 =?utf-8?B?SUt4U3U5MHZ5T1NvYzUwWG4yRyszb3BUV1ZlMkZjRy9wVnErdERBOUxYTWxJ?=
 =?utf-8?B?TFBFSm9PcitJWjJyMVhFbVNYZEQ5cVU5OWp1L0xndFdheExoem1IYVhnTDlv?=
 =?utf-8?B?ZFFGTElWdk1udzhLbm1HVzRFQ2s0RHBkWmZVOUJaOFRXaVNwalgvMlo1Z0dZ?=
 =?utf-8?B?c1lOelBhZUpEd0xlNmI2cjMzQnk3WnFGSFVKMlRjaEM5d2pxOWIzbitiRTBS?=
 =?utf-8?B?dHNzUUR6QlVoUXZLTDN2UUEvMVIwc3ArdUlNSXcvV0VlczU5Qmo1a21JV3RM?=
 =?utf-8?B?eUJjWndwL2JwZ0Z4eTlXVXc1eGNWbm5oV1VhTVhuelpjNCtjeWVTclJvMUIv?=
 =?utf-8?B?YTcvNEFuRFZTeWlmeThCTU0yMEZKblJyaUxuUzJlcjU1U2JuOTBITmZxRzc3?=
 =?utf-8?B?eHBJM0NYYkhCWWxiRlRtdnlDTlpid29uM2RPd1dTKy9hVjNLOGxoQXJXTjNL?=
 =?utf-8?B?ci9UaXFzd0ZUZjRBY3ZIVzZaL3FpZHpCYjdPSXFLWlp2T3FsTU1JRFh3c2JG?=
 =?utf-8?B?UXFpL0o4TzZmK0hBT0tOa3p0NGMybWZIWFdEclhjSXJuVk9DU0x4YTNqMCtY?=
 =?utf-8?B?UkhQVUlXWjdxUkROMDBUVzVhc29icmFQbllmVFdYSGpWM1IvcWdBamh6aldB?=
 =?utf-8?B?NTRjajJ1aEkrcTRKZkJmdEtjR3grejhzQnNUMGR6L2FyY2drS3JRSUw4Y2w4?=
 =?utf-8?B?OVpzSWloeFlOS29LUkMrZGUwQTVDeEQwbGprMlR0RzRoYmQxK0I3MEwwQ1dy?=
 =?utf-8?B?bTVDVkRsWUZKRklJZ1cyb0lxMmhpcnZXUUdaOXRiNGw4L2JuNG1GVUxFbk1U?=
 =?utf-8?B?MkFyUUwwYkdTaisvK1kyLzNDK1RxU2pZM2luc2cxUjFCZmlZZkIwTjF4aW1Y?=
 =?utf-8?B?c3VaWjdyUDFqK3JKYzhZQXlMSmcrYklGeTE5UUx4cit3eUlQN0c3cCtnRzBI?=
 =?utf-8?Q?VVV5Y+anahV3R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUdSY2c3YmI3NGM2N0V4YnRyWnN0SG9LUjN0NVZ5UXRZWWZvc1VuR0ZlMjRr?=
 =?utf-8?B?eWhVNHIwc2lWVG13cVB5bUtqek92N01FK1NUMkU2d2Z6M2lteDFhRDAwUmVv?=
 =?utf-8?B?elllckFZZ2VaMUMraEN2blFXbG9meTE2U2t5RlRaZEovM3A5anU3eXNCbVky?=
 =?utf-8?B?L2huV0Q2TS8xN2pLNy9LSkcycWVFdG1sdWtLWU8venRCczZ6NUd6U0JDWlFD?=
 =?utf-8?B?T25ob1NOc1plRVZ0cTlyNW5ndzFVMW1zalZtMkVJMlYxMU1jRHVzYVVTY05Y?=
 =?utf-8?B?UkgvVi9RckIzYzdtYWxUcXR0M21yME5rLzhpMTZ2anBOQy9RYVlvNlNZMWRn?=
 =?utf-8?B?ZGh3bDdISFg2d1BvZERwT01icVc3R1ovVEREM2RidjdmaXdoM3pMeHlVS0Rw?=
 =?utf-8?B?WUQrdEV1MVdQd2NRQkIwT2I1ZGU3K1p6RGJQKy9RdEZteEU1YWJYbTZiZ0tt?=
 =?utf-8?B?MkhDRE5GaXhyMGg5eWh2ZXBMNnFCZlNOYjVsUlRjYk1YS0svR3ErMFFySkpH?=
 =?utf-8?B?OVM2b1I5L0NWY1RHZjUwckl3YjNDdG1Kd0RhODlmWlkwQTVDektia3RxUnJq?=
 =?utf-8?B?RDdjelZmeUxoSHNJU1V5cXVjYWtWcC9Fbml2c2hsZkZQOEN1UURRS1Qwd0pz?=
 =?utf-8?B?V2JnNnBINzFBOUVDZlpRSE1lS3o2d25Wc2dWMXlsK1F5RkJIZzhXVEZUSC8x?=
 =?utf-8?B?K1l2bXRTb3Nwd2tJUDBNWW1hTGJ6RHFRT1FIT2YrNGdFK2l2WlQrWk9KUzR6?=
 =?utf-8?B?UTlIMWg5RW56TVpWTklmV1ZtNkpLZTZzQWUrZ2xDYjBNYjhHL0RxZTRCRFFP?=
 =?utf-8?B?OUE3ODJSRS9mRVRLVVh3dXN0cUVEdzBXckUwMldiNWpQWDFtYmNYdVZlcFJy?=
 =?utf-8?B?djVON2V5Nm5qTXFjM0xST3RiK0ltMVk1ekIrYTJlMjdFRlJLK1B2SzM0M2Z4?=
 =?utf-8?B?VjEzcnFxM3UyKzZOKzg3M0EwSWZvaFJVSDVNWHJsOEE1UW1VMGNJNFRaWUwx?=
 =?utf-8?B?dG8remE2MGprNm1hTnhxUnJaQUViaGZqSUphR2hnZnp0ZnVOT01MTjFEMWtk?=
 =?utf-8?B?bGJHMHNxQ1FmRmFxdmtFVFBpUndWdWIrd01mYTkzdGcyMWJkUDNBUCsrdEMy?=
 =?utf-8?B?NnNVYVltZTVXZ1ZKSk84cWtwK0NtejF4TzVOVnlJRmtKKzAwMWZPcys1S2Qx?=
 =?utf-8?B?czB5QXRMQlU5T2xRVEExTVFxbGkvTUpHSTV5R3RteVdNTk5Oa2F5NG5xRDZx?=
 =?utf-8?B?S0I2QmRQa2twQVpxTHIrUVlHaGcwaHVZTDErRmRvdVVINUpWVGNBZEwzTEpi?=
 =?utf-8?B?bTlxRjl2SGVFdll0UXNFSzBZS1A4N2twbXNQckRwUDE2UmNRUURWaXhLSmEw?=
 =?utf-8?B?Zk5TejRTaWp3K1oyQ0RaNHdVamFkcm5IRkJFZ1VGc20yQzAvcTBmREZrQVZ2?=
 =?utf-8?B?KzA1MGdOaGluL0lvTE9CajhrVmJCbVR1NjFiaTNwdWNtMkVpQi9qTm5Wb0VN?=
 =?utf-8?B?NmpRZkltQlhIOE8yQWora1lyQXBCdWl3VDZEZkN2K2xBbFIzbXdaUVNjYzVs?=
 =?utf-8?B?SE5uUEo1b1dkVVIyWUUzTjlGNWZJOUp1Z2RDSHcvbmtqd1ltcjhicU5OWFMx?=
 =?utf-8?B?Y01yOHBmdUJrcjUxMDM1eUpQZElQYmlnMFp4dDhINmpERXEzV21LOTFkSm94?=
 =?utf-8?B?NHBPenZRLzlZU25hT3NXWnNjTkJZeXRwY3c1bmRDbjBTR3VPSEJXUkMzakVj?=
 =?utf-8?B?c2FCcnVoZjZDdDZUc09pQmpoamJkUzJVTzR4NjBSa0lVbnlEQmJHL2FTSm9F?=
 =?utf-8?B?L0R1MlYreThyQi9aUS9zQVNtNm90Uzh2bXlBa3gzTDdYWDRyaTNoRHdGZmdv?=
 =?utf-8?B?dU5WWmVGSlNiZTBFWExjbjJ2bGF6M3hKWXZiaytjUzJVVXJxMGg0ZE11L2pD?=
 =?utf-8?B?dTB6eE4rQ296M3A5bXNDSUE4QTZOVkh1NDJsTXVaTmpFclJENldtVzRpWHlE?=
 =?utf-8?B?QUVaeVJPeml6ZXIvZDRsOVlJYjErNFNObFZ2T3JJcFQ2VVZTZnRnRGxBYWJB?=
 =?utf-8?B?WWtFOGFlSGdBd0l4aDdOTVpxTjg0dVRmVjRkK1ltNC81blpqaW1XTkdkN29h?=
 =?utf-8?B?TnIrY1BRcFpRem1halN6c2djcU5CWDUxTjA5dUpmRXZFbmdYRFpjYThRUTBJ?=
 =?utf-8?Q?3pibUbX1O589XQhis7aYauyjiAK+KauqTT42i9qvphFz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af45dd71-a9e4-491d-f9b4-08dd1b5abcdd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 09:44:28.8756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXuCd9E9hUrqZ+GlGpszkqei6sPLQEvHehGVH//n8iLxiMAjKEixgBAcoZaTWEqqMmGPYOPxNs1Fdgf2LozJEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6102


On 13/12/2024 00:03, Ivy Huang wrote:
> From: Sumit Gupta <sumitg@nvidia.com>
> 
> Fix typo in the compatible string of Tegra234 dce-fabric.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> Signed-off-by: Ivy Huang <yijuh@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index 984c85eab41a..d08faf6bb505 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -3995,7 +3995,7 @@
>   		};
>   
>   		dce-fabric@de00000 {
> -			compatible = "nvidia,tegra234-sce-fabric";
> +			compatible = "nvidia,tegra234-dce-fabric";
>   			reg = <0x0 0xde00000 0x0 0x40000>;
>   			interrupts = <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>;
>   			status = "okay";


LGTM! However, we are missing a 'Fixes' tag. We should add the following 
above the 'signed-off-by'.

Fixes: 302e154000ec ("arm64: tegra: Add node for CBB 2.0 on Tegra234")

Thierry, do you want to apply the fixes tag when merging? Could also be 
a candidate for stable.

Otherwise ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic

