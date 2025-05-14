Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2459C205AA8;
	Wed, 14 May 2025 07:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206852; cv=fail; b=RmWmJRrec+YhOV89Vxz2QK37LAqBPaRs0ySz5zkvRqqoIXy/hgcd6WZ73NlqE2fB7w3qN4SnckF+xSTKP2CGo6UKyjpJaz8KDeMeOKeUxuheSaw+Sf6eievWG8QpnYpHa4FRlxdt4xfDeRV4jOuMxaQ/Ad1eypC1BtCqT3rMZBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206852; c=relaxed/simple;
	bh=kvDxZnWbqYPzaYa6DeU6PNAIXBPq0moU/JgQgwkl2FY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UH8LGPVVnrhEISMHlPIR8RMpDyQWzkHwHKsXUURqQKbB2wqOB51/x8Djfkb4LYINZt+H5sw5eGbkDCo1aEtcmhIxUpS1yIgOT3cfWvk1Q/BRg3dNk6eFQ1Pnm+K8IDs9TWD6f2kpGdbtwHh8Pw54fK+oEbwK/z9u7A48QcfOgEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QyKcOLIk; arc=fail smtp.client-ip=40.107.102.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QyKcOLIk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxAZuUuLDxguOIec5K4opV1q4dVxO67a32C21mdE0W9QSzq2Bq8yydupzVPHbJYsROqJZvjRHvJov0DeqW8shS1ApM+KkM04KhIhCW/fBtL2hNwHlRGIz3h4FtqpWc5R7XzSXuSyItZq7HDWyMgagPb9szD9uh1lGXsfZa8maifPd9/IWMOzU/FswCDgBXyPuD1KMAiaOKp+OdWDRRZJQ0usm8/hx5cMraJFVI35WxFVmOzKIJAe4tzYqsgGQ+x7TuBv8Mto5TB+ml3A1eTjdm7BTwaYaR6qRJhLoliqz+msN0em3CxvXsA6hWGfc7qdNqW5WkanE4Gr+PHLd+Nxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eY4Mo+g5SqguUy8WjH9wUnbR4uCEHUFwbwbgr95eHJE=;
 b=cpBSku8HzIcuvasgfzWSXyjMZoVZG/jJUgqsXLYj+dfTlZlEcdOWEgU9yWDYFIyI6ZbdMOfRHLuz2O9/9HxDwR3kE/jQ19bH0AwsL6jaFEYj+HWgaEva7b1PcnxRZuPppvoN7akoHLrjjS2AB5ACRvHPxHRX7UJa0Er9zKn7LaqOjL36fGfvUK/8abXfpwM04trzG/tInBZbSYt4J1VxmG4xP4wAILnMRvjaSCWcKS4kbeQhGsWA0iZ/xw9ljDORoWHf7A7F08JCxws4Q2s2ZEQzyBSickAp/0JsG/w/6S/RnBH9/1VPmK8zvYNbX9TepKMdiDRcyF0HR6EMoezqnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eY4Mo+g5SqguUy8WjH9wUnbR4uCEHUFwbwbgr95eHJE=;
 b=QyKcOLIkxqm9RcJuF1B2LBwrgV+IJlK726KWjuOfVExkLp+fwKTEaGOm+WJlae9NsacyTxifp8/1K1PubZAOJ49yhF39mQK6ymrqh8vtoOoWXdLZfkWoLiSeXrzpofly5zq2JBDcz7XBQ11UvRVJhrrhm4qn7dPVWXMnF9ih4rG6o/mfiZ25IFmKMoFb4IonYPV/8zgKcrKa4vpBv5bJV0eqTO/+q29nPY113N0YBKSFIJyJqkJvUZzAym0LHN6wa/jllRhvJeMg63/s77cAekEoiNQ2EWihMQMrBVBkWPQSNJR0/NFKhUPdqERWeQRUA7jT3ir9Cqakgsl9w/eQ+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH3PR12MB9123.namprd12.prod.outlook.com (2603:10b6:610:1a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 07:14:08 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 07:14:08 +0000
Message-ID: <5af489ef-0e47-4895-a714-4a4eb68517aa@nvidia.com>
Date: Wed, 14 May 2025 08:14:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V2a 35/45] genirq/manage: Rework irq_set_irq_wake()
To: Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20250429065337.117370076@linutronix.de>
 <20250429065422.128859754@linutronix.de>
 <e9a0abc5-7ee0-4ee1-9e19-37d43a5d41de@kernel.org> <87plgtq0qb.ffs@tglx>
 <87ldrhq0hc.ffs@tglx> <35f464cf-c264-4f2b-9e0b-fd8a71526aa1@nvidia.com>
 <87ecwsjf3n.ffs@tglx>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <87ecwsjf3n.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0129.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::20) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH3PR12MB9123:EE_
X-MS-Office365-Filtering-Correlation-Id: 40a977f3-eed5-4dee-47d9-08dd92b6eac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUR1VW9Lc0xaUll5ckpzaE9MdGRVUmpJWG5jc0t6emI0b2ErdU5CaDMyTzZa?=
 =?utf-8?B?YmJaU2dZdU5mZHZaYTJrNzFIZ09WYjYvb1I2TVN0aHprWnFrQ3YyV05yTEIz?=
 =?utf-8?B?MC8rQ1lWeXVrRTJRZ3dTUUhPSzBHU0YxMkxCeHFNM0pGZTA4ekczWG5kR1J3?=
 =?utf-8?B?bGRWVWwzbDdWMFNFYVVITjBCYUMvL1EySlVCVkR6N0QxL3BYT0dQdUU4Mmxn?=
 =?utf-8?B?Q1IrRVhIMU1HUzJJU3BYWHRNbmRXNUtiNHUzcmJ5RzU3YlVVRXRISG1UdjUx?=
 =?utf-8?B?a3B6azFvVFlTZE9iVk1kMHhZTVN0bUtjc3lkbWFSUWRGOXJYNWNDREpFUElK?=
 =?utf-8?B?bllrbnNSdVF0ZFNPV3M2QnhlZ2RTbnRhVXVJT20zWmE1RFN4N2xadFFoV0R0?=
 =?utf-8?B?c0ZuUEwybElTZVVnc0daeXpQRmd0VU9wR2NyTXF5ZjBjNHpkU2RyNUEzWE4z?=
 =?utf-8?B?UGkveXoxWXJSUlYrZWh2dXc4SkcxdldiMmdHTzVOTGRGTGVCZzRtMERNbmM1?=
 =?utf-8?B?bkdRSE93Wm85Z1B1YlVLcFJRNVU1R21RSjgybzlCdHl1bVU3a05POFBNcWp0?=
 =?utf-8?B?T2FJT095RytBWEVlaThVNXZ6ZWZGclVRWW1kZWhtN3RCUWR4ZEk2bGpoRUFl?=
 =?utf-8?B?VlVEaUpDR01xYzBlSEtPeTNUSWx6RVFTZWJCUWttblNubGJudVhsMVRVQnFZ?=
 =?utf-8?B?a3NYYkd0d1hJS1lhMmdoVTAwamF2Y1dIVCtqMjRnVGtRWW81SzNobm9lSW9l?=
 =?utf-8?B?Z1RrS3FoUjBtZHVPUDJCYnVBZ0FrNHBvbnBMTTBXajRucVRmMS9yYXFIaGVR?=
 =?utf-8?B?a2EzQXpDcDhYb0JHZjFDQlRGMkFYeDZFM0dkU1lhVzh2elMrMEpqUDZINmE4?=
 =?utf-8?B?QUJ5RjdFZG9BUXFDZjRHODFCWjlPL0VubExmZm9jUGV4Nkx3RDVTQkltdFA2?=
 =?utf-8?B?V0cvdzMyRjRTUzNISU5BL1RXOGJVUUhnVlNtR25EdFY1b081eUljMUpmaGxS?=
 =?utf-8?B?RDJ2SW0wV3RoQnYrOU9mVExvTTVrSjVHWVBRM0swS0xWbFBLWWlMQksxMEwx?=
 =?utf-8?B?bjZOUklDVmRlb3JObWVyaDQwbWtiQTdreHpkVHZZSHRoaTk5UmhtekdvOU5B?=
 =?utf-8?B?dnhnMXlQRkNvNm82ZUt1MTNSWWV0ZW9ZeEo4VlNWWlRDTlh4eFF1Y0drdDNa?=
 =?utf-8?B?ZWFhdXhrYlJjaTRaNHRZSDFNcTFxNWF3cE95elltbWtaZUlOdmloY2FhUHBi?=
 =?utf-8?B?RlRGaW1PNGhBWkxQVU1BaVVid1NteG9mcEtHV25vKzZtbUFxeVp3TEhXOE8z?=
 =?utf-8?B?THFDUGJsVmlSdWR2UklHSGU4cVphNWVIYmFsMUVVVG1wcDMwYnR6Nzk5ZXpZ?=
 =?utf-8?B?RWI0aS9WM2UyWEJYa2ZFUHJEWE9xVmx2Z01xeVdVMFRBSXlOeEdQWG5WNDMy?=
 =?utf-8?B?R1p2OWVQd2JEck5uKzV5bGcyZjRSelFjM3VRNGt4azl6Um4yQXA4dFBrVWNS?=
 =?utf-8?B?K1NvWnc1NThEK2NkbEUwMG92RGZlcjF6d25waFRWdkUranQ4N2lFdUdQU0JE?=
 =?utf-8?B?Y2djL25WRlZUZnkzSE8zbzRzRC9nMGVoV2ZlZFFJcmk0d0F0dUVqeEpqbWRx?=
 =?utf-8?B?VDZlZTNocDVIS0pBT3NTWXV1RG9jZTdscDhoZVp4TXlSbTE5c2FNUXJueEpL?=
 =?utf-8?B?NkFLZDJOVHVyU0ZPcVdvUXN3YnRrYUFiYWxEMTduUGdGTE1wUFE4QktKd0hX?=
 =?utf-8?B?UVF3WFptTDAyZm1GcmViaEdpTGI4NG9FeUVxRVZ4RVdGWVYrbUhRUEk2a21V?=
 =?utf-8?B?cnVDUEdxTlZEbGptczN2WGs5K0pTdUNxemZIOEEvanZkSk5LK0ppUW9vRWJo?=
 =?utf-8?B?dm5UUnpld3lsN0JxVDRHV0NPWmVvOVBVVlVnUlJnT1VQcDZlNVdkU1VoY2RW?=
 =?utf-8?Q?3HW4ksPr4AI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzJneC9WWE5qZFUzaW5QaVdmYlROdjVtWklZRi8wV2tTaERPcEdrU1grWDhx?=
 =?utf-8?B?Z1Nydm1jZFBJRS9uT0lUY3p4NEhhd0Njck1jdFQ4YlZwcUlSNTdGTUU1WXpF?=
 =?utf-8?B?ZXNIeE5PU0lWcXdaZ2dya09jeHUrSkg1YXRNZ2c5blNyRTd3Qld5RFdpZ2dH?=
 =?utf-8?B?ZzQ5UE1WK2h6UkFmSVFIOU43aCtsdXlpaDBwQlFtWU9CeDVjbEtuQTV2V3FW?=
 =?utf-8?B?dkpFYmttc2MwMEUxK1o0bWp4Q2xvWFFjVG02UlJFMUx2L0NvVXBOZ3hJRTBF?=
 =?utf-8?B?T3g1ZzBHWlpNVFYwZHJXcFZQT0NURnR5QnJIaFhkYk1CTDREYTQvMjg3aXE3?=
 =?utf-8?B?UkZ1a1VpNms3MkhTeXIvcGlnQjF1cUtyN0RodHB6M1dWMTZ4dGg3NnVDczVw?=
 =?utf-8?B?SDRJT1ZmZ1FIQ2l1RXcxODlUWnNPb2ZaQ0dsNjRxTzRYQTBpNHY0eHhDYkho?=
 =?utf-8?B?cSsyNW5mSmZWTjcwK2d0TGJWbThMemxzMXpKcEhaVFBlZlFoQ0xlMzQ2WVox?=
 =?utf-8?B?UitlV1VZT1BOWkF0WEYrM3ZvVzRjZkluZmNrWCtiMm5TNkwyOFFBRXNuOVFr?=
 =?utf-8?B?V0tydVNNNDlIRVJWMkN6VFlnWGhZMC9VZ0JOZDVLRW9SdXkzNm1oYUdTbkFM?=
 =?utf-8?B?SVFVbzU3akxIU09NR0d3Q3JrMGY5VDJyczlxcmRGV1FoamY4TXF5T0Faa1dv?=
 =?utf-8?B?bUJydC9uRC9aK3hsaVZ6dVRjZWhVK1EvQXRsQjZRTHdra1gxWHZyajRtNEJs?=
 =?utf-8?B?Q1BXcEtoZFh0aWlmOHBiOW5BNXBxMzZlMWVEcGJWeVpVOEVxcXpUQ2dGZlMx?=
 =?utf-8?B?dVRNV0ExM2xoT3RkN0dqUVpVYmJFYURjTmFNSC91ZXZtUjYyYWgxbmFBOUhX?=
 =?utf-8?B?djExVFFWNHZMb2kxMHNnWWZBNXUrMDVvcENZa2d2ODBnNHd1c2pub1pHc3Mw?=
 =?utf-8?B?eSswbUdqQXJrMnJnbTY4QUptTjV6MkNoRVdETHlObXF5aXo3K21JbDhCdHpE?=
 =?utf-8?B?WnAxNk5nclZtUG10WHBFOXQ1elc5Vld5VUlKOEdBRkQ5Wjg0ODlGWDcrR0xq?=
 =?utf-8?B?Nk9vbWxQTGpQRnhSckp5S25LTW5FSG53S1EzQUhjc2NsUzY4Y3VBTlhZV01x?=
 =?utf-8?B?MW1mSFZWdWNPdEFERnB2UXRkSWlsWFp2Zyt2WHY4dzlEVGJtSEwrVnp4RlVm?=
 =?utf-8?B?ZDJMMHBIbDNUZ09INjh1MUc1OERCdWcrYzRyZFdzL0FjUkg5WTB4QlhYZzdL?=
 =?utf-8?B?OElOcnBibVR2emRYUGhVdWZtWW9ienNodGUvZUY2alhDdTFoRndLd3U2QVdo?=
 =?utf-8?B?REhsU0w3bXVBUWhIK3BlMjlyK2dkWEg4UEFvS0M1bmJNMjZBWnBJRVhhK1pk?=
 =?utf-8?B?Yk0wS2p3Wm9aZU1adUtEN1RubTZ2OHJWcmRRQ1BpdlQ4TklobkduelRPS0Ny?=
 =?utf-8?B?b3pLTnZ6d09yOHVXejRMa1FyYmhaZnVkS25OZFZrSWtCQnNDUlRUQUNOWUFN?=
 =?utf-8?B?VUFzTzdleTZxUUt4aW53TitjNlRQR05aK0xDOGtXVVVGV0trd000WEYvbjF1?=
 =?utf-8?B?VndpZ1M2dnhXcklwRXJKR2xxNnB5bUI3WmxWMXZGTHBDOXJSVEROaURLMFA4?=
 =?utf-8?B?WmdsR2lBSDJVZU5wN1lvdWVvRnFVK2JodjVhQ01JcHpVZDhJSVc1Nzd3RnU3?=
 =?utf-8?B?TVVLbXE3RTRZSllid3JsbzZ6WE9oYjEzNGk2OXUvcDJSZmRrQ0wvbGlJNWli?=
 =?utf-8?B?WFFmNTFYb0lOZHhCRXFqV3crZDY4OWZqLytrNG8rOGw1VC9xbks1Qm9XQ3R3?=
 =?utf-8?B?bUlpY2lWTnBoVmNDbHRMMGd5MXRIZUFBclFuVzdwK0JqNlY4ZS9uSlFEUTBQ?=
 =?utf-8?B?M3M1MlU0cUtuUERZZVE4VGpXWEwrRE9ETjdtNTJpUWVBcXhKYzJja1ZGMUE0?=
 =?utf-8?B?eU1wekkwbXRBdFJ3UDBxZWVqMlZ3WU9ENFZzNTFNMkUwbG5Tc3NOVFdMN3RP?=
 =?utf-8?B?RWNBNTJ5L2E4VEpxcVRzY1Q3SFZpT2toZmxvT3FUKzZZUENGNlVwU0tiQWFa?=
 =?utf-8?B?L0Njb0FyM1hkKzVaVzBjK0p5REQ5eituRWNQRGZXaEVkVjQwRTl1bjg0anEv?=
 =?utf-8?B?V09ZVWlYUUlXSll6bm5xbHZsamU2U2tTazhyY1BFNVppMW9XRG5maHRlYWp1?=
 =?utf-8?Q?gH8AxsHFCmuA4h70n4t87xakPkBC0NgBdrJHMYI1mq2o?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a977f3-eed5-4dee-47d9-08dd92b6eac9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 07:14:08.0050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkJHC5d1RX2vwQbRUeiOxUlcZBYxgL+MyG1o1a8jxAx28KU3wMhVri7sAm8DLkMkuN2YlF1RJmLpexUeDPH+UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9123


On 13/05/2025 23:55, Thomas Gleixner wrote:
> On Tue, May 13 2025 at 18:32, Jon Hunter wrote:
>> On 30/04/2025 13:48, Thomas Gleixner wrote:
>>> @@ -846,45 +846,40 @@ static int set_irq_wake_real(unsigned in
>>>     */
>>>    int irq_set_irq_wake(unsigned int irq, unsigned int on)
>>>    {
>>> -	unsigned long flags;
>>> -	struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
>>> -	int ret = 0;
>>> +	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
>>
>>
>> I noticed a suspend regression on some of our Tegra boards and bisect
>> pointed to this commit. I made the following change and this does appear
>> to fix it ...
>>
>> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
>> index 2861e11acf3a..c94837382037 100644
>> --- a/kernel/irq/manage.c
>> +++ b/kernel/irq/manage.c
>> @@ -846,7 +846,7 @@ static int set_irq_wake_real(unsigned int irq,
>> unsigned int on)
>>     */
>>    int irq_set_irq_wake(unsigned int irq, unsigned int on)
>>    {
>> -       scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
>> +       scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
>>                   struct irq_desc *desc = scoped_irqdesc;
>>                   int ret = 0;
>>
>> Hence, I wanted to ask if this should still be using the buslock scope here?
> 
> Of course. My bad. Care to send a patch with a proper change log?

Yes no problem! Thanks for confirming.

Jon

-- 
nvpublic

