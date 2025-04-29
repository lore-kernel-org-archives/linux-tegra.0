Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB652BCF5B;
	Tue, 29 Apr 2025 09:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918127; cv=fail; b=drfvtH9KlwtCgbXAT1CfblyYBLs4gNm5JGVI8xs91/wok3g686HuM4nDtsFHGSWej2D0RLrE5hB7kzNAxEpgYgGIy3nNEWRUg3mMwhAuZlC/elEaoH5fSctN+6eMXvau7H2jptNirT8md+RIiai3ePmndDZLlFX8YSQTc547KL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918127; c=relaxed/simple;
	bh=8ZupSnjm6qJhErHNLdMF8qqjRwF3BVynrS8Kx9DGuWg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AEUOXi/zOiiXU5mP/sD/arwz/MrHwvgDZ8S/qoRYUVbPbFwowKsUr3VGrMH4/HGTqk76MZ7Jy7qvgupnhRYj5zGxUR2KbWUXId9IR4nJvrpVRspKHOGhOWbptoH/RqxsDDGmukJQrBAziu/6lGPGmDmU/e8+loJgphNbxrbX60I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S9ku1Q7a; arc=fail smtp.client-ip=40.107.94.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S9ku1Q7a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzdLsGjMxGiV9glJnDKOqVrCIGpelmR3DXF6PUU0kY/Oj8pqUbtYabuZpuuu3cYsBYFhciGfHAlXvcB3QPhpt4c3/HPOn0bpNdg4AanVQPT0O7lgan3hnFqxBcfa/QnA0aVOfFty05X8L6OSfGiK/7jBcpM9t1tcJQvPyryUtWxfCO4pNNcKHyS0lLPJPSe2f/1xPWnnfgFpv/lr/8L+wbKcnuJIePRIFLgK4nencjO4EWxL50W9C6r2mn5/5DkbU+3YEplHhEbt7duR8IoRVSdlC0zAHCeFHKOw0yfANuxW1dVONL0vWWO3EOkFVcf1hfdPcHbVjeNF3yV0WIFI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiamwMTJrcQM3vUpjuqGYZwkJheX4F37BNlsGtF5MUM=;
 b=j4Auz4vVwehfSwGFXxT6AhOLRg8WvLkv1Y6kyi7DiuMa58e5JO0MI2NTgdwzhh/ZPmTwNRN7RTgD3NxRm9aahmW9+KrjmTKYyiEn2LVKpkxySF60RgYsrwCjH6W9B2ZOOGJv8BOoaf3S6cEev3lKHT9S8cVonPjXz5yqqj4P/XnYF9JG4y9P6ywUcfzWBdsg+LSKZw9TjQ+mEodBvQnKFJPfjeuFsIwXnqOGQIQtkvixm6vuOXK5U3KixRQRb9hB0Y6iXjBcjA2FaYOXI5OfE7tQ5f+JbTHwgDKhC77fe1xBr5f9/9S20/eRgpA1FqKJHgO64mnRweKs8famd3cyJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiamwMTJrcQM3vUpjuqGYZwkJheX4F37BNlsGtF5MUM=;
 b=S9ku1Q7aBCb4qlGVio3Wyx142ZSmFO+ZTV+am52ARFvHOWlAyZYZeIRt7wExuOlRZv1QG1c/1A3q6rOj5mRnf1xBZ2FyZyaNP7K8wBbApLBDA0uUgBkEIZRb6LCSQ1jfx7IXNtxIQb1AJMYh9K3b5tLEnGUdlaX3ECSrNRAo+5hi4rDz0G67z5CvypqOTy/TEmrapuHleVhrSmSg8y6gJc842cTR9nfYuueTiTBDuoYVvlLtJaIHEOTx4P4oymKGDsLZ4w0mPUpDUJubBlZ/nnumUBEpIrWXFWNQFP6p/pRolhLRSIoySQ/8W5AGF3NWB1LU5PbbHxajmYLhouqy/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM6PR12MB4402.namprd12.prod.outlook.com (2603:10b6:5:2a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 09:15:23 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 09:15:23 +0000
Message-ID: <fbb3a1b3-3949-402a-b51c-f5446a392e83@nvidia.com>
Date: Tue, 29 Apr 2025 10:15:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Robert Lin <robelin@nvidia.com>
Cc: thierry.reding@gmail.com, tglx@linutronix.de, pohsuns@nvidia.com,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, sumitg@nvidia.com
References: <20250421100821.2907217-1-robelin@nvidia.com>
 <20250421100821.2907217-2-robelin@nvidia.com>
 <aBCU5vec0XMX5VRz@mai.linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <aBCU5vec0XMX5VRz@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0364.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::9) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM6PR12MB4402:EE_
X-MS-Office365-Filtering-Correlation-Id: be5740ce-e52e-475f-5643-08dd86fe5ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFVDelZiSExyOFFid0NTcVRBcXR5ek5iRXVYUmZPUUtpOWNNTHZQSzgwQm5u?=
 =?utf-8?B?VjAraUwrTDJTNDhJekFzalBmQ0RUanR4bWQ3b29LQ1RIUVZTVmJOSEZpZnpT?=
 =?utf-8?B?TXZGVG82d2EyK3dqNXZPcHZtWWpVRDJqUTl0V0tBM3dTNTljZjRHdlhPeFVB?=
 =?utf-8?B?c0xoUVpocXR6dzBmTVhEd05ST0orclI5bmtiNndKbjY0WWtLb1JWbVJGNEJI?=
 =?utf-8?B?TkhUWDVreFFZUmVwREFsZyszWVU5ZVE0Tlo0OHVaa2IyTzNON2xMcVVjYVVh?=
 =?utf-8?B?dTBNNWh1TEpmY0paSVlrVXoyNlhVbktGaU9HZ2ZpampjQnkxajMzTTl6dk15?=
 =?utf-8?B?UjVMREdtSnhDUVhOZzlBbTIrN2ZzNDFBSG4xbVVkaXVUR25mQXRWVDRhMStQ?=
 =?utf-8?B?NWNITHkxcWxGNENmcUtSUmJaWDQrQzYvYUdJS25RMmQ3TUsreEptcGlJWEZ2?=
 =?utf-8?B?K3N6OFRCWk1yVXlMOHpsc3BGdDZubHdTcXdTYktHNTQwR2xwMzVDMkhMdWxw?=
 =?utf-8?B?cTlGdS8yeGg4cW1DWXhKL1FpUnhGc3lLK3daUlRlVkc3a2Q1S3YrWGw1QWJM?=
 =?utf-8?B?YXNJUXUwQXJ6YVNmVExiZEo5WEpaM0ZWandRR1AzSEhJYjlwODJ2QjRNdjhN?=
 =?utf-8?B?NGNTOGoxZkphRW1IdXJodmlvRzlZOVNEQUgzcFFwRVQxeUpaUXdqbFpLOXhR?=
 =?utf-8?B?SWVobjc2TUcrNHdma2MyU0UrV210L0xDZTBkNWxNVjh2bkZ3V1J2MWxGVHo0?=
 =?utf-8?B?SE5ZZXNhUmhnQzVSTHhNSzZUZXdDL3c5bUMrK2tNd2R2WUgrRkhxOEg3VU9E?=
 =?utf-8?B?aWgrR1VXdTd0eFUybW8yZk03dzhEOVloQXNVMThGUHkxSUdtQ3JlRXFPVmhH?=
 =?utf-8?B?VnVUOGRteXdjaVdJaGVEZER4dlhLa01Pa3JvY3I5cVRGVXBjY3N1QzhDbHFC?=
 =?utf-8?B?UU9vUUVPVm16Tmd4VnBZMDFFVlE3aW1OcTJDZC9VaUVNOTY2c241SWJnalFW?=
 =?utf-8?B?bjRtellXN2NmSzlIYkozeDRlYlRVZ0gybFoydGloKzBHVlNsM1lGUjhYL2lp?=
 =?utf-8?B?S1JrZFk2NE9NKzg2VFNlMXFzd3E3TFRnMEhZVDFpUDRaOElvZmgyZ2xVU1Ji?=
 =?utf-8?B?SFR5UDkzZUplemt3ZzZNOC9QeGdNa2Q5WWxQUnU0SXZiUXJjbE1kc1picWFo?=
 =?utf-8?B?U3gyOTJBNWM0ZVZMc0N1di9yUjM5Mll4V09rMjc3OE1QZWttZWI4eVZKUEpo?=
 =?utf-8?B?SkxmRW90bXg1empoUDBWdVgreSthMllaV2VGYlY0Szd5dmg5NzhLZWZvNTVy?=
 =?utf-8?B?b2FjV3hyanRtY2NPMWhJWGxxMGJWbEZSMHNEK0ZLUHJYVFpHdGF4NGlGTWds?=
 =?utf-8?B?NWxsODV2Q2R6N0VPVDVrb3M2bmhLNm00eHZIaTR6Vjc0V3A2TkR0TkVYYUZP?=
 =?utf-8?B?NCtkV0w1bnFiUFdFZHZRSHBKS3pqRzcwTVJjbU5CL0xWcm5zb2dSUlJKV29j?=
 =?utf-8?B?UEtBU3ppbzZsMm0raHp5azNjVnljSVZqV0dqSW9RanNmR3NOWGJ6WDhJaHRj?=
 =?utf-8?B?QWE5NGwyeDJrZHBJTTNRY3hBZ2oxV0dwMk93SHRzYTVtNHNGNzZWQ1N3Z2h6?=
 =?utf-8?B?TjRnK3h5OHRIQy9IWUFFak9XU3JHYlYydmJrVUt4SnBDRS9IcEJzNEh1LzNQ?=
 =?utf-8?B?T2JHa3Y4aU01VkF6TS9jTzBXU1NJZ2pocmVjZENCblNpWGY3Nm5XMmNPT2VZ?=
 =?utf-8?B?MmpyY29CT2pla2k1eml6anB0Rm5ieTU2NkpDRWJaN2t6OExlVDJmc2hIcFJs?=
 =?utf-8?B?T0QvRkNrTm1Xa25QaHpHU1lJenp6aE9MN3ltMGk0aFRPNmFmQU1RVStsczhk?=
 =?utf-8?B?cmVKTTQwdFJWUXA1Z2srTzc0bWczWmtiVXNhd0NCYUtxdmoxUEhEbjJiRVZx?=
 =?utf-8?Q?9BR8cyjJ0SA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nld5RWFMc3F3SGtsclY4ZnRFb0FueFlTYWM2d1kzNHFiTi9rY1ZJMC93NlRO?=
 =?utf-8?B?TlFuT2dBY2FmN3F4UGFmU0hnajc5YTBCYUxPb3p6MmRwRDBqWXlIeGhONU51?=
 =?utf-8?B?MnkySjl2MjFocGwxYW56amhaZDVKUFd4M2VoZjBFQW0xWHhWQU9SYkNRNjha?=
 =?utf-8?B?YTdDcGRGWnE5ZWJvdS8yY3NPRFFqR3NRR0RZR3NLNFhjZ3pkQmhmRjRVaWtT?=
 =?utf-8?B?SmwwNHZDNGIvZCtGOVNiMng3VHF1dXBpd2d2Q1crSUlMVHZtMTZhYjNjSGw5?=
 =?utf-8?B?NkFJUlpFRWw4dGNCbDhMYU82bkJybFNhWWZWeVAzbDQ0UU4zV0YwdlgrbVdU?=
 =?utf-8?B?UnhGVWgvL3UvV0g0ckRTYTRlQVk1a0Izd21ZVjBhenp0V2ZnS1RhMS9jeW9m?=
 =?utf-8?B?RHF0SDI1Rk9Qd0xCWmJ5VXJmRTZHOU9oZkQvRE40aDY2UHEwYmVDa3VYclpC?=
 =?utf-8?B?bXNLWmdCMTZQcmxYZ3Nnd29oYldKZ2s0OWhITWhDTjRTMmlzOE9jRkZ0ZFhs?=
 =?utf-8?B?d3dlK1cwNndGbDU3aG5mTW9EYk13dzBkMTJmOVdnbG5EMlF6Q0RWZEQ2VWVJ?=
 =?utf-8?B?UVB5c0VWK21VS3JhZUF1OVFydnoreHROUysvcUtlU1JHOFk3N1pkSUFsQk1w?=
 =?utf-8?B?bzVGYS8vTEw0SUxrV3ZlR1BsVzMxUGRkV0VEWVpYckNWTkc5S3NBMEo4cTZ5?=
 =?utf-8?B?aGJidDhRb3RudTlEOXJQaVcxVi9xbnE0QW5PS0JjOFBoRXFNZ25qMzV4Ry9O?=
 =?utf-8?B?MUQzMU9IbUg1NUVlall5YW1VOVZ6amxWenp1ZFFLRmVBbkhMdjl1Njc2SnNH?=
 =?utf-8?B?ZUJkcVVEOUdxY3FGMCszWVB1MjFWVzJYYm9jek1ybjl2SnVnVXJ0dXRlejNR?=
 =?utf-8?B?eEttYUxaUkQ5VnRlSFNEcWtuNSs1anRaRWxNM1phaTkxQ2NPSDhpcDJTbEJC?=
 =?utf-8?B?cFNXbE54bW5ROGs2TlBxcUlYYWJONXpwcUIrV3RncHJSNFJHc3BjdkNRTXBw?=
 =?utf-8?B?YkQ5K0tMa1NjNGloZUVWUDBhWHRmNTZZOTZySm5iVUszdFA3MmFrQ29WWXJv?=
 =?utf-8?B?VFBhU2puWVBlVW44anE4a1ZkTXBFcDJTbk9jeVhSSkgwc0haRWlqU2NGTmhY?=
 =?utf-8?B?ekNJM0RCZ2lGU2JMNmZBYVpJWExoZ0R6VTI1L0pNL1RVMnkwc3NLczVoR0Js?=
 =?utf-8?B?K0pXdUU0Z0tFWFdscW0xWGc3clpFbXQyajdibVdVdDJZUS9rQlpQMG0rTnA4?=
 =?utf-8?B?M2k3YjcvWmVCZnl0VDVnc2xsNGJwYmRCRlZoZ2dLbm02dHE4WkJSeElIemRX?=
 =?utf-8?B?TStGZ1Z2VFFHTVNSbHBQMytJSXc0WDlXeDN1d3k4SDBwc2JQSUkwRzFZd3lH?=
 =?utf-8?B?TUU1WEtib1FkYVVnaDU1U2VGNDdMZmk4eHRJeVR2aFR0Nlg0VjVrMm5Mbkpy?=
 =?utf-8?B?S0cwS0hzV0J1TU5ORjRwTURQSHR4UTNZZnNMT3RXSThVS1VRWjVZSGhBTWpt?=
 =?utf-8?B?RFg3UDc5MFdKN2dwSFd2eDFSNjZrZ0NzS3YwZFhVQnZzMXUwbndSUEhqQm9j?=
 =?utf-8?B?TnMyM1RWSkRtTDBJMUxBaTRCcWRrd3djYXA2M0NiTjZ4WEErQjQ3QzhkUXhD?=
 =?utf-8?B?T0dlTStXZk1NZnRUUHF3R2NBRVlFbWcwbWJpZWtzNU9LUnYwTzFGK3lSa1pB?=
 =?utf-8?B?Mjl5U2JJSytHR0xRMkpONndYOFRTempnZzdPaDh1WlNlMlZkaUM2a2JRbENa?=
 =?utf-8?B?MG43T1ExdXhNcXgzVFJ2dERzd3dUZmpXSHJEMTRvR2JGTzlIbXd3c2RmL1Za?=
 =?utf-8?B?ODVSSTNkRk5FN2RLdVFZdTNPUG1lcnA0UnFGR2ZwWlBDZ0JhcjdmdG9YU2Nw?=
 =?utf-8?B?Mk54NkZTK3p3ZUExMXpqTVU2Z21KdHVpcVh3UTNtY0xaUWhZYmkzYWk2cWl3?=
 =?utf-8?B?cnkxSW5Rby9qdEdic3RLNTV3dVNsd3ROZTdNUkpIRmNweFJEWnlkN2FvM04w?=
 =?utf-8?B?VU8wV2k3RkpnSmJPOThsaG5oTDQxL0Q2QlhkRjFONTJWK0x6Z0NOc2VUNHlu?=
 =?utf-8?B?c3FlR1NCU1ZHN0xoZmFoaFVoSFBkMmJLa3ZBMW5HQWVKUVJvWUxSL2Q0bWRL?=
 =?utf-8?B?SUUyNEV6YSs3NXBBVTRVczJsUWRWSnk2SnpQalFiQmErZnZ6eXd1L1RzVlM4?=
 =?utf-8?B?RlJTVEhmZ2RIc3YxYUV5ZXNNTXpRQytQQlJ2RUMxNGErTW9SVDA4dk5QQ2hT?=
 =?utf-8?B?Q1JQRTEwWnRnMWhORS9FUXZwSUt3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be5740ce-e52e-475f-5643-08dd86fe5ec4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 09:15:22.8938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QnpWk5o1UHL0S1A6W2msUba50yRI83obl+6xlgmWusA9sxxd26whrJULuzGaicUXyHaoasMmZ14NHodGzVImw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4402

Hi Daniel,

On 29/04/2025 09:59, Daniel Lezcano wrote:
> On Mon, Apr 21, 2025 at 06:08:19PM +0800, Robert Lin wrote:
>> From: Pohsun Su <pohsuns@nvidia.com>
>>
>> This change adds support for WDIOC_GETTIMELEFT so userspace
>> programs can get the number of seconds before system reset by
>> the watchdog timer via ioctl.
>>
>> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
>> Signed-off-by: Robert Lin <robelin@nvidia.com>
>> ---
> 
> Hi Robert,
> 
> I realize that this driver should be split in two and the watchdog part go
> under drivers/watchdog.

Are there any other examples you know of where the timer is split in 
this way? It is not clear to me how you propose we do this?

BTW, for this series, I just want to get these updates merged. Any other 
re-factoring we can handle later.

Cheers!
Jon

-- 
nvpublic

