Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDC6185B67;
	Thu, 17 Apr 2025 13:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744895614; cv=fail; b=NZnRE4Zl/Qh9SxvR34UXRkXDF/l7A+tr8ncmgiFHTn05B5YEiVANYx4hqbJCQZbuSoRSV+fV4yZ93BKDAcnj5SbhbLbmwOGn2Bcg1HapdV7Xezmj5Be0riZlmIYFi7E1pOiFj11W28AjHndgORHg3F/bmZMyzWUZUB3QmsyfiGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744895614; c=relaxed/simple;
	bh=qL0A5Hl7dcQAvH9GkZ2DE8HWhBDeVBxdNCXgAJ4COuE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X7MPprMz4TRmrySxTNN0nMfPS6tGVRSaxEjabE//ToT6eRcbjwuoOQEUwlrKgcgXkQkoQyYl21c8uxuZn3El2T1caWAzhzBFOFCV5VlkrqkdCK14uQIhsSJlphbqr729oP2fkf2eEPXYYUqv3pmiSosFqeTLp6vXhA1CpSUD8vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o11hbEXW; arc=fail smtp.client-ip=40.107.223.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o11hbEXW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auAmMEuJaNkgssyU5FwmpnSKGacxemfw+DUzWCXfhOLPtMcCvEuRyfMOLUnycSrxKn8ax0l3UCqeeIsJ1MY64j3oL2Z8Y9kFKJKZnEyg8R+/OjAwSgecasb/x1+tUDX6LpRPhxsFaPDLnLUN5+bwC+wgSzXwj5DiEmNhDTLd8y1HI9irY+2N4LuTbWVGf7Rb2WkxLsfNwLGCxX7tGcaOYudUjj6S2lHk1dzHsfy5lkTj6cNcDCn50wgdmAd7CMp6WLDd8LUeDrKU8NCIdBEs42xpzfgl3RWSfrmzFh1gecr/oNwaGLU9UbL8gx3+Up4rpVHMTmyDMac7OvZ5ymksww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLkW+qkvrD07wURMyzDMyI0BJDEh3w9X1doOQ29jHBU=;
 b=ddc+J4/AotsGBJqv7Qfxua0AD7MlmzhsdWixlai6vAOxi1/Ct3TQcoLBMUqOmZca7dGs8VdBatvi8gl8Dc5dHqZK9FYlXNIG3WFeZqtzMtlwCoezXYQNaQD5WC6EvqouOJc2MTmaIcK2MwmgS3KsxMh1bmOycvYCZBX5r0IMuiM83oc4v1mfXSonJoczNZXaQ9dI//uN8tjoQmAJKFejwnNfIxWpjOMfegDYN9//1VD8kLq4nv7NjC37U++cfW+yrphA5LgxbjA6VSmmW6rkRO7gklYhWixP6xm9dCHo5OypNWxOThzmskScrq3pR18VTKzzaLuzsZi9c1G6VOuNXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLkW+qkvrD07wURMyzDMyI0BJDEh3w9X1doOQ29jHBU=;
 b=o11hbEXWMZHSK6rBggs552XH91NZBsqMWxUNDdYpRDT/KrM2PrxSlch12wZWGfpVQV19gjuO1ExNE8HHjJQ87bFmcpkG0d3WW6dMrLUkJ5brPE+283efqrIX3rE+awrLj/98ctR9hej5qojupKsYHAPyqu5X0rLelfml9pC4NLIwaH0xLLi2hWQH3ceXXprIGcyCl6FopBBLXxgZHXwlA8prqkQdrYGJHl52fKa3mBH1mOz4sUQZA7SgCSjdY/bMqanyAv6UBboqP6ngrFDAI0s0nNK8AtK3r1OfX6XJXjikDtu9FI/uKSgtBYVykgRvuKBPkapvzG+kBE6Ecxzk1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH7PR12MB6881.namprd12.prod.outlook.com (2603:10b6:510:1b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 13:13:27 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 13:13:27 +0000
Message-ID: <05316a07-2546-4c07-9bda-b609a290d6d0@nvidia.com>
Date: Thu, 17 Apr 2025 14:13:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
To: Robert Lin <robelin@nvidia.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>, Pohsun Su <pohsuns@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>
References: <20250417093110.2751877-1-robelin@nvidia.com>
 <20250417093110.2751877-2-robelin@nvidia.com>
 <6456eb35-3771-4820-b316-3b5ba6c74453@nvidia.com>
 <PH7PR12MB641816B01C956C123FDC5C09D9BC2@PH7PR12MB6418.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <PH7PR12MB641816B01C956C123FDC5C09D9BC2@PH7PR12MB6418.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::7) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH7PR12MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: db87f263-9248-4a71-8b6f-08dd7db1a424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0x3MlZJdUJtZmlMQVhMOGxIdjhwWUtGSm0vNDNlMkFNWHV5VkcvMlVJaDJx?=
 =?utf-8?B?ZEdGbHFqLzFCaDdJcGxZRi82dUMzNlRHU3d2ODBCMFd6aHh1ekNpZm92UHo3?=
 =?utf-8?B?MmhKRU9mZWRlb1BnL3ducWMzQlllRDhWT2ZjWlJhd3BLR3RhOWR1K0dGMVdk?=
 =?utf-8?B?bmJZbXgzekgzVGJHdlc3R2ZUY0J1REFQWlcxL2kyN1RvcGFUQXZCeFFiRzZp?=
 =?utf-8?B?QUVPTW52R2hoQzV1d1NpNnV2V3l5VjIraFUyY0wyRVQ2cTI3aXpmWmVrNlYx?=
 =?utf-8?B?UFFDSzNWVFFBNU1TMElJK3BBMUh5bWo0LzkxeTJWRmlmYlpYV3BVdmdMMGxO?=
 =?utf-8?B?NDFaY1RZZW5jYkpqS1VXU3BLbVRwVlcvdzgvR1Q1UVdGMUVSK25qb2ZxK0tT?=
 =?utf-8?B?Ykdidm9RYjllY09SOWM1cXpNRUd6Y1gxclA5Q2VvaFB4ckI3d0ZySHBxUUZX?=
 =?utf-8?B?cU9PNXRVb3djMEl1L095MVF6R0lnbitXdlV3eUFGZHkzeXRWUHA3ZzNHL0JR?=
 =?utf-8?B?M01FK3YvTEM3bUg0a3NtNnRweUVVeVRpR29ZRzVqd0I1U0QxMDRpRzN1cm95?=
 =?utf-8?B?YmZZeDdkK2JleEc3cU56VXZxbTN5Rm1rbDZ4bUFHaVZZNVdydGFrT045WVpG?=
 =?utf-8?B?cUNnYWxUbWUxYzRWd3hHd3hpRHZ6SnEyY3VoZjNEc0lKaVpyZ1d1a1orYncy?=
 =?utf-8?B?VE4weXhSNmFESmNJRE52VGdjL0EvZ0dNVGRYWW02eHhrYUZiZ3BaeFRwMUF3?=
 =?utf-8?B?SUFodFNsUTR3ZzJreGdhZWZZRXpDL3lpV29rU0tlUjZZdVlqR2hsRmc0WllG?=
 =?utf-8?B?YkdjZEZDRmFpZTJyWkliUU1UVE80djhzc1Z4cmhUa09aTUZ2ajlrcVAxUVcv?=
 =?utf-8?B?NDByMU9KWlJ3RHNpb000VnRCMmNPUWUzaHNTNWJyOFhsU3lzTFNKbFZmZy9i?=
 =?utf-8?B?SWlHbExRbFdzOEpUTUxLaWVHbjFOamtRTmVNc3dqei9QcXRHQTBvVjdSNXZY?=
 =?utf-8?B?cW5MR05nNWE3NzVqSkxTbW9JckVoRFZZRDgwamdYMHdwa1Y2V21PUU9TQlN6?=
 =?utf-8?B?Z1phRTRLWUFMTUdheGxUR1FXc1M4M3NWRHlOUDNXejhEYm1GQ05zSkRBRFpi?=
 =?utf-8?B?QXR1THFlNXdDaExUR1U4K3VwMnVYcEQzdUg3L3NCNTNxRkRiaXlScTdjQitq?=
 =?utf-8?B?Q1N5SEZ5WjJGMVd0RkVWN3dhMElqTFVFY2FMNTRFREZVNjlPUkVqR2NMQk9h?=
 =?utf-8?B?TjhveFRGOHNwRWc2SVcxbWJhRXpONkNOQzFPQmtidm16bVZiN3ltc2lvOHM4?=
 =?utf-8?B?MnM4MnBpTlVGR0pBdWVqMStRcUJVSmh3cVZRaUV3SGl5YmxZTmV6N2tEYUg2?=
 =?utf-8?B?cnpEeGYraXRidCsxeHV0NEVrbEwvY1B0ZVNvanNMa2dpUC9oZ1kvc2p3Q1Ar?=
 =?utf-8?B?TzdqTDE5TVJOTmkxZVhUY3dzZVZUQjNoQmo4Vm5ENkdPQzNMeEF2NWZzMDRy?=
 =?utf-8?B?cmtrSkh5am0wUHdPOFdZUjcrWkIva09pU1Q5MW42bDNSUGxGb1hDbm1wc2RC?=
 =?utf-8?B?UU45Wmo4N0tHNzJGdUpQVDFEOW5BQ3V3cWJSWEZLYkY0TFp3Um9rbEdyMDE2?=
 =?utf-8?B?c0M1VjR1OTFSZ0Y2MllJTXIzeXJnZWE2UDU0bTZDaDUzMHo4YlZ3ZnV5SzU0?=
 =?utf-8?B?RkRqM215YWduamRPbHNEN2xkYkpkdko0bWRJL2lSTGJiYU9tSjh1eEhQcXln?=
 =?utf-8?B?OVhIU0dkQy9Td2dDZWpVK0EydzJrU1RrUk9HRE9TZ2NlWldkNEhLZnYya0hV?=
 =?utf-8?B?YUtxUVorOWJPTUVSUDFJTGw3OEZNNVVBVXRwTWVaVnl5MWpXZHZ3Kzk0ck8w?=
 =?utf-8?B?YUdPampYSmxpRkpzU3dJb1llWXN2RFN1QXpxcjh6TnZQSXh6clNFU1RFd2xr?=
 =?utf-8?Q?Ri9vezU0Pv8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWJlMUh0K1JpVEJqaDlBdmt1ZmZ2V1QvV0YvSjVXcS91bEpHZk52aFc2WFRH?=
 =?utf-8?B?b2EvTFlqcTZQNTdUWlJnSlorMTVjN1ZOZlVLQWRVRDFJVFZrUTdaR3lWWDcy?=
 =?utf-8?B?cHI5U2VaRXNldVJxNEN1NlRhVVNYQ1pJRzBIMnJ2SUlKVlppc0xSSHRXZnhq?=
 =?utf-8?B?MUd6SG1QamlZcWhMMmdkQms3OFB4a1RYTUlWUldSR1JRMi9NNmJVeU1KTzFt?=
 =?utf-8?B?aXp4ai9tMWdmUENvM1VKSk5kbURnYkhqcG1rYmVkSXYva3VjU3BDMFpONG9W?=
 =?utf-8?B?NS9XUEphQldKSlJxek5ZSlpvdUNxS1pBUUdNMWRWeVRkczRzRTZoUDNyelpp?=
 =?utf-8?B?cmlyUng1cTN3aDRiek5WNjQ3c0I1bGJpZHJPV2l4V3dobk1iZ0x6SWs4Z2Fj?=
 =?utf-8?B?TXphb2pqNDJJTHNEenNIVitjelNHMTdFcTlTdVM4bWY2bGsralU0dTRxNVdv?=
 =?utf-8?B?Y1BEL1lQcnFLZGlEMVZrV3lDSTlnNUpkZTNZZHdkV01sQnVtaEJvUk9MQWFi?=
 =?utf-8?B?WHhBaWxESEt0US80TkNlVVEzalhtcktIaEMwRVpHQ3ZzV1oxeGNLenFTdnhU?=
 =?utf-8?B?Tk10S0RNTGdXZk45Sjl4dlcrSkxYODB3TnZBcitKeXk4TmtXM3VCMFdqbjN4?=
 =?utf-8?B?Y0lxVVRGRWxoVFhoTFFNUmp1YnBRenFCZTRsZ2p3MXpaT0phcjJMMXBRWmdI?=
 =?utf-8?B?djIzT2ZvNE5hb3RzZzUxUDdjVXVrS1dZTE8rbXJrbWc5djhZQXp0bnJSREIv?=
 =?utf-8?B?NVJTb0M4U3QyQkFTV0ZuYmtNazFKMlhJMWhTTFhoZ3R2UnlOL056cXNxZDdB?=
 =?utf-8?B?RmFpUk0xWldyMTdFcTRPbWsrVllrMFk5bVBIUk8wbjM4V1p4d3J1c05iUmNM?=
 =?utf-8?B?L0NGUzRmdittUzF6dkZraWtpZW94Y2dvZkdMb0tpenF0WnpCeGhpc21ybXN4?=
 =?utf-8?B?anFTbFhHVTVnbWxHazRRaUdPV2p2Q0NzWFh4R3RxK242Y3p5YUVWOUFKTElJ?=
 =?utf-8?B?a1p1L2pTSG9Jb1RLelhBa01BUjZ2LytudWJBYlBMcGdlMHZqa05HVlYwZWRl?=
 =?utf-8?B?VlJvc25qUDBuc25IUzlaZjJmQk9Eclh4M0NrSFBNWnpIWGNQK0RxdTdnYkZp?=
 =?utf-8?B?QUxiYUkzMkhiQndRWWRnTEt6OFE0MUNrR3BJdnRtRmFKY1oreUdaQllvRUho?=
 =?utf-8?B?VC9NbFVZSVJBUW44QmhPa1FGM2g2K3BKREg0cXd4a0NaRk01eGFXSEUrZlEx?=
 =?utf-8?B?QnNkMGVuSld1aEE2Vkg2VEZ3WEdpRWVwNDc0QlpTdU51dHdVSjNFNllKeU9p?=
 =?utf-8?B?UVkwdkVMWmpnZElORDFraDdSTWVzaDZkSzFSQ3JVdk5uVmtRb3pqVGhCWlhr?=
 =?utf-8?B?RVduN25lZXpUN1hwYUVXVk8rcWFUUTRZS3RpQ2JqbmpqZU0zYzR6UTFsY2Ev?=
 =?utf-8?B?TWg0dEkrKytmL3V2bzdrUEZtWm5sVDZOTkdOMTlaSThvbGlFY3ZUcGRYbjZS?=
 =?utf-8?B?SXIybzZRQXEvd0l0dU5YbFN1NGM0WkR5WGs3dmxmYUhxVmdWZEIvczZmbnQ4?=
 =?utf-8?B?WEdmQU5OWndjYTFyS0JrQkZRNlI3SXFVL0tGMk8vNDdBSGZzbDVqWmxmdEJw?=
 =?utf-8?B?dVFzSnhzMGVIZXc1ZXp0d0Z6bmhNMWtZSHJpOFpqK1lVUkVKWWZKZVlXaC9v?=
 =?utf-8?B?bnFBSHBPaUN1c1NCR2U1RHVZYmhRczFLNThNWVBNaVRaT0l3WVhPb2YzMGpx?=
 =?utf-8?B?U0VmNlV2WHo0MHVvUERFZ3pYMUVKL1RtWHNLRExTbDR6Q3hVODdsdGxpeU9G?=
 =?utf-8?B?bm96bjY3VWY5SUIzNXRvV1U4WHNvRGlTNzZHdlZjY1ZkU3l0bkpUNWZISkU2?=
 =?utf-8?B?VHRiYjdDQnBhZ0NodmlHQkswZnNndnVEb1p5MVVXUStiZ0RWQUJwQ01PcERN?=
 =?utf-8?B?enRQV212WUEydDl1VnZ5elI4ditPNmFxTmFBWDdTSzZ4Z0h4TWhlMXRpaTdZ?=
 =?utf-8?B?eE5kRDAyRTRKem8wRkZ6SXpvNDRIVEMvaXh5Y2srSHc4RnpFTTJqQWxxRFFO?=
 =?utf-8?B?WDZYS0FnbVhNamFBZnJVTnhubEYwMUlQQWpTYjd2M0RrRTRMWkNzNm9jcWVn?=
 =?utf-8?B?RDN3eWRJZFNxZExXQjBOckNPYU45YktjdHkxL3lpOVRkeko4OHIwem1PeGpi?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db87f263-9248-4a71-8b6f-08dd7db1a424
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 13:13:27.4905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwEtQMCDz4ksjh/Zp5OqQ3V/WJPateo6LXknJmK13t24Ecwq4U7YJ+LHyZJgWxdXM6BJEeFwabYptDbmFch54A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6881


On 17/04/2025 12:34, Robert Lin wrote:
> 
> 
>> -----Original Message-----
>> From: Jon Hunter <jonathanh@nvidia.com>
>> Sent: Thursday, April 17, 2025 7:10 PM
>> To: Robert Lin <robelin@nvidia.com>; thierry.reding@gmail.com;
>> daniel.lezcano@linaro.org; tglx@linutronix.de; Pohsun Su
>> <pohsuns@nvidia.com>
>> Cc: linux-kernel@vger.kernel.org; linux-tegra@vger.kernel.org; Sumit Gupta
>> <sumitg@nvidia.com>
>> Subject: Re: [PATCH v4 1/3] clocksource/drivers/timer-tegra186: add
>> WDIOC_GETTIMELEFT support
>>
>>
>> On 17/04/2025 10:31, Robert Lin wrote:
>>> From: Pohsun Su <pohsuns@nvidia.com>
>>>
>>> This change adds support for WDIOC_GETTIMELEFT so userspace programs
>>> can get the number of seconds before system reset by the watchdog
>>> timer via ioctl.
>>>
>>> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
>>> Signed-off-by: Robert Lin <robelin@nvidia.com>
>>> ---
>>>    drivers/clocksource/timer-tegra186.c | 56
>> +++++++++++++++++++++++++++-
>>>    1 file changed, 55 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clocksource/timer-tegra186.c
>>> b/drivers/clocksource/timer-tegra186.c
>>> index ea742889ee06..201b24ca59f4 100644
>>> --- a/drivers/clocksource/timer-tegra186.c
>>> +++ b/drivers/clocksource/timer-tegra186.c
>>> @@ -1,8 +1,9 @@
>>>    // SPDX-License-Identifier: GPL-2.0-only
>>>    /*
>>> - * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
>>> + * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
>>>     */
>>>
>>> +#include <linux/bitfield.h>
>>>    #include <linux/clocksource.h>
>>>    #include <linux/module.h>
>>>    #include <linux/interrupt.h>
>>> @@ -30,6 +31,7 @@
>>>
>>>    #define TMRSR 0x004
>>>    #define  TMRSR_INTR_CLR BIT(30)
>>> +#define  TMRSR_PCV GENMASK(28, 0)
>>>
>>>    #define TMRCSSR 0x008
>>>    #define  TMRCSSR_SRC_USEC (0 << 0)
>>> @@ -46,6 +48,9 @@
>>>    #define  WDTCR_TIMER_SOURCE_MASK 0xf
>>>    #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
>>>
>>> +#define WDTSR 0x004
>>> +#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
>>> +
>>>    #define WDTCMDR 0x008
>>>    #define  WDTCMDR_DISABLE_COUNTER BIT(1)
>>>    #define  WDTCMDR_START_COUNTER BIT(0) @@ -235,12 +240,61 @@
>> static
>>> int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
>>>    	return 0;
>>>    }
>>>
>>> +static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device
>>> +*wdd) {
>>> +	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
>>> +	u32 timeleft, expiration, val;
>>> +
>>> +	if (!watchdog_active(&wdt->base)) {
>>> +		/* return zero if the watchdog timer is not activated. */
>>> +		return 0;
>>> +	}
>>> +
>>> +	/*
>>> +	 * Reset occurs on the fifth expiration of the
>>> +	 * watchdog timer and so when the watchdog timer is configured,
>>> +	 * the actual value programmed into the counter is 1/5 of the
>>> +	 * timeout value. Once the counter reaches 0, expiration count
>>> +	 * will be increased by 1 and the down counter restarts.
>>> +	 * Hence to get the time left before system reset we must
>>> +	 * combine 2 parts:
>>> +	 * 1. value of the current down counter
>>> +	 * 2. (number of counter expirations remaining) * (timeout/5)
>>> +	 */
>>> +
>>> +	/* Get the current number of counter expirations. Should be a
>>> +	 * value between 0 and 4
>>> +	 */
>>> +	val = readl_relaxed(wdt->regs + WDTSR);
>>> +	expiration = FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
>>
>> The above says 'should be between 0 and 4', however, we never check.
>>
>> I am wondering if we should ...
>>
>> if (WARN_ON(expiration > 4)
>>       expiration = 4;
>>
>> To avoid any overflow later on.
>>
> 
> Warning for the bad value seems to be good. But for the part to forcibly bound the value to 4, I'm not sure if this makes sense. Using the bad value from WDTSR or 4 both lead to wrong timeleft value at the end.


I was looking at the code, and if it is 4, then the following ...

timeleft += wdt->base.timeout * (4 - expiration) / 5;

... becomes 0. However, given that in this case something very bad has 
happened, then the other alternative may be to just ...

     if (WARN_ON(expiration > 4)
             return 0;

Jon

-- 
nvpublic

