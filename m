Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1684C1DFCB;
	Tue, 24 Jun 2025 10:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750759619; cv=fail; b=pWyZvsIug0vOYx9i6lDwjexc1fmG68JCYP8l7t+KHji3gEhAV0kwFN1wqkUrKm/WcqRXkpPUkR0SVZfyPdEc4h2Q0/E57LvEWIzH20LpxtlrblUzbEl+zXDwxS7jZZdDk08jmaeaT2DPj3lPjlTmrlyOvvsHzsB0mc4kh6jbkvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750759619; c=relaxed/simple;
	bh=ofWG6XOAA4pia5VUuOqdA6LqbubWRLXTBG6jy7trNq0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nH2YpFkvOd1L0tzwg3u/r7f7lmM4KSUBWSV5Kk4ZVocPQR3V+eS9ZVnV+Nsy8TWlZvxL8819bbByfIGAVfc5VHCy4E1j0Aal9l2YGgqcvxsT2l+RoJ87KV+jLMFR+GnhhrCzi/qTftweClkNi3c7lg3JQLi5RVhuKEtq79dpa3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nl7SXb/q; arc=fail smtp.client-ip=40.107.236.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nl7SXb/q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Duo1bS1AH0U43m4kKyAMlEP9O4LtUa2rIySywI0d/USQFO89jCBPf55v/AWptwKvvNd+FhXlEHUnCfylp9S46gfs+/JshpPz/JeSWiKrMMKc2RDwYGc5TYkW5v8iKUvweadtctGXt924AS1FGb0ys5GQHmtAueQ0n045FTaqbWw98VKN8KdQUnN3KwVVoFAKEaKsWAGJiJZLmvjfBKqpKpGGIKOsEyoopLFk7PMjHMW8hBt6MPC4f3Zx9hR2qFfjJLtYwotlr+JNLq+TwXG8mAZwtFHZZgVq585kEj3ltfpLAbFjs3cwSS92M7lha123Ct0Wdhy7HSM+X9KOU4fhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L66pZ0iqEH1xKvNjDcXFySteAMYUMaMUe76RmYGq554=;
 b=jkD573fWvQ6I3bp6qrMrls1I1P2FDYdhWEa1WvRZlzdbtFcc9Dt1cRD6P3NwFZODWVazM3Ooxa2OoFM7a3E8pKXLQl1H8OJK2QEa3CTYuxwkuUXe9lYDcUo/ckpnoqg67dxoS6hqHUgeBVX2C0fJ5I/InZA+p2ovwMgF322kQE3XZbGJ1Vh1GTN3pZ3ZHMByJTbk6pbj28pDNA3Q/U8H0SP/eTDumfdjdwDfaSG68DnZrkw4Fcr148ilQoejHx16bwfGn9RDr7mDkHP1EIGkR5BeFGWQd2rzdcv2e+QmMukK1Tqh+iwRTwkqxMPsa1D2kDpAYn/kMcDHDqIC1v8G2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L66pZ0iqEH1xKvNjDcXFySteAMYUMaMUe76RmYGq554=;
 b=nl7SXb/q7LxHrcU3HRXIl0bNxNf95PJzcIdkEnKMJZDAlFiwVP+CNzEV1M9IwWY6DTNnNnw8XBiUIUG+9/zJ1od/qmrXb2sdfQMGPxSXHxNX4gYq/Zj5SJEWAgCm+l2P5CUjoCRYAa/AZA8zb9mUblqazfy30CcUOrgBcNN8ErlN2v32HU7EpbVme3vKJV58yCidBvdk2FlTBL3kz03U6bmYdGOwOI4+6WxqGPLCJ4gcQow/GhNaGvIhkrKmwxtZ4KQ05z+PAYip7PJYy4HZZk0C60Q/2HE74xCDGpbi9hMGy4qtChgSCSAneuq32Go+flpU7bVP2/CpdpYXE9he/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA1PR12MB6412.namprd12.prod.outlook.com (2603:10b6:208:3af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 10:06:54 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8835.027; Tue, 24 Jun 2025
 10:06:54 +0000
Message-ID: <3099e624-4cfb-4582-94be-3c09a9fcba01@nvidia.com>
Date: Tue, 24 Jun 2025 11:06:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource: tegra186: avoid 64-bit division
To: Arnd Bergmann <arnd@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Pohsun Su <pohsuns@nvidia.com>,
 Robert Lin <robelin@nvidia.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20250620111939.3395525-1-arnd@kernel.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20250620111939.3395525-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0306.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::23) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA1PR12MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dee51bd-7f96-4e65-fcee-08ddb306d892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1p3YzRqT3U5SWdwUm50M1dvYWpwdWZhV240akNSelpUaHlET2hMbHM0S3lJ?=
 =?utf-8?B?dzVkWjZmVnEyVHpPcXlTT3kzMDdsdFFTV0dkNzQweGtITGxNay9kbVlMVXJF?=
 =?utf-8?B?NVFyaStxSjlDMUliMS9JSkltOTlvaHRDQ2dEeFJTeHBzWnhFNVRGQ1lxbzk0?=
 =?utf-8?B?OU9vaDFUZk5KQ2I0T24rRUFxNGU0MjgxKzZVWmRaRG5wQ3RDVUFDVm00Y2pD?=
 =?utf-8?B?S0NwdWQwcWRDZEY1ZUk3UEw1Q0cvOVV0T29FOEtReHR4dXhXa1ZsbWwvNHNR?=
 =?utf-8?B?TVNXREFkL09NeUhXZUprMEU5dVM1VEw3VlY0a05RR2pROWpUekE3elBSVjZM?=
 =?utf-8?B?S01oZEJ6S3lXcUdNdUlRMWZsdzNSVXFTajlqbUlnckJ3cGR1d3IrMkVKWTdR?=
 =?utf-8?B?WTJUbHFqN0ZyWXdmSEJyRC9aNVZkWHh0dEJpa04xY3ArMUJQb0NDMEZvcDZq?=
 =?utf-8?B?VmZQZGIrRG5UM2hHTzNCTEpTdTZRbGFCaldXUWhZV2Y0NE8wUVYzbkd4OENu?=
 =?utf-8?B?OWR4dlJ3L3JjVkN6OHM0WVMrd21jNWd6WXFuWnd5TFc2YTB5SnQvZ0tHem9y?=
 =?utf-8?B?Vzg4SllUR2ltM0U0cHhmVGZaekoxRUJNcnVkS0FJSTFHK0diN0tEYjJQKzd6?=
 =?utf-8?B?Q0lIMXd1THFKd3FCRlMyMjhINDFoWEV1NUZ3TjVFOXBnaUtranlPS002VlFl?=
 =?utf-8?B?MWE2VElSeGZTOWJhYWIxd0UwNWxrMk00UXJybGlWbW1IVmU2QWUwTlRLck5K?=
 =?utf-8?B?aGltQW1tL29qK1U5Q0UxbFhXNjRBZjh3NWNJc2czRUpZd1VweUFjWkZrZE5V?=
 =?utf-8?B?RCtwaGpVYTVjcGdtV0hrU05EWjhzdWlZbDFzU0hHQUlUMG1hNnNlVE9MUENG?=
 =?utf-8?B?MWRWVVNDVEdwamdHREN0TWd3aUowOEx3MENjL3N2cHFHclQySVpsejhaS1BH?=
 =?utf-8?B?eUZKVGZPR3JER3JxWVJBVngwamNlRTZ2RWovWE95TzNSamxwRmExKzZRemo5?=
 =?utf-8?B?NlFjMzhxOVduYXYvb2RsVXhsam5id3EzNzZ0NXNreTBvUkJZc1ZWT1pEbkc0?=
 =?utf-8?B?RGxJelArZmV4MGE0THBmbjJwMG5BcG9xK3Z0b29RR1JnNEIvUTFWMU5EVW5W?=
 =?utf-8?B?bjU2RmFSOTlXc1MwVk91U2xSalNGSnFnNEhacEFUQmtIdHVONzlLRGhKbXhW?=
 =?utf-8?B?UlJnREJXTUVhUXhLbGdGN0FweFZ3d2NRckxqL3BlZDZKc2ZZbnBYZjhLbWxa?=
 =?utf-8?B?WU9YcTNueEdrWHRPRzJScTRNa0FCNHM3ckFXU0dNWXkrMjVSWU9TV256R1J6?=
 =?utf-8?B?cENXOXZjd2VGOHdkYjFSUlJYWDQvWWx3ZHZKMER5WFdZUnZvZityOENhdTdG?=
 =?utf-8?B?dVVQRVROUUhVWndPTUhoUGpESUZ2WDU1U3hJblEzWUFyeTRyY0FrN293NWIv?=
 =?utf-8?B?NjNrZlREWE9EZnE3RG55VnNXNTJtUm1LOXJrQ0FlTC9WZzZtSjd3ckxJN2NK?=
 =?utf-8?B?d0loSG9ZVU1LZTRxc211V0lKRkNIMmxtck1uVGp2SVZ4T0I2ckJGeEw3TVJk?=
 =?utf-8?B?UzNmd1pHUzhoZU5IcytoZTlBL0xCQXZHN1liV2FScEtUUGFOVjM1ZU5TeEg3?=
 =?utf-8?B?ZVJxdWhxbDVncm1tUWprYjJ5VHUzaTFzUk9kSXRQQkJGcmo0eDVvdjJ3REY0?=
 =?utf-8?B?a2F1NHlKQUVPamgwWGUwZnRidEUwSTZTaVNmQytrVyt4RHNxdU51cjlzRXM3?=
 =?utf-8?B?eHViU2YvTTl4V2NBWS9MM0tuL1l1a3RzbnAvNksvbm5wSlJ1V2ZUZXc4U0VI?=
 =?utf-8?B?SlJRZERYeHl6WnZzZmdpc3FWZDZSMTBEQ3kwam5MWXp2OXdsdlJUMzlkQkZO?=
 =?utf-8?B?a2p2eGQzcC9DdGVxbEVYaVZGRUVlOTRiR3pyQVZQYjVSeUNHcnl1eDQydEZs?=
 =?utf-8?Q?aVEhJaoYfV0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azM1ZTZEditRVVVhejdDQmIvajBYSnBoNVZsVDRKeHFVRkpYN2wzOXdVVXh2?=
 =?utf-8?B?MUtZamZaeWRXUjZERUx3SW9IK1NiTGEzUTgxalJBM21TWjdKYk9IMktxNFph?=
 =?utf-8?B?K1k5TlMyNHV1SFN1bDY1d3QvTmRrUERaWXZCNTNtZTczMllQa0pteFFiSFdU?=
 =?utf-8?B?eDh6WEMxc3lMaHBHNnRZeWNlbXU5UGtJYk1oemlMaHhxb1VmRGVZQWtXczJs?=
 =?utf-8?B?aUdGbllRUS9kZ1lJWStEL20yWVU0N3pDd0VYQlpyVVR3SWc3UWlEd2VUYTZn?=
 =?utf-8?B?bUlBdDl5b3owVDMrdnRkUWpxQXlKd2FEZFA4RTZjWUR0VG9MSlJlWmErZEI0?=
 =?utf-8?B?Zm1NeVp2VzBBOG9rV0FXTSsxQXgvbjM3cnh6elZIbkJuNXhhMjdBdnU5R1Vz?=
 =?utf-8?B?T3NBQWJrbjlJa2xsbFFxZzV3VlhtQkNTNXFYcEk0V2hFYlhiVlp5L3lTRW1Y?=
 =?utf-8?B?Rkh6SCtkR1JJU1ZmdUpsSjFGbktUa1d2aHE5OXZrVFRiY3ZidGZodTNmT1dJ?=
 =?utf-8?B?Wnl0MnloOWdMQjJiRTBXajVrSkhlVEdaZnRtMEQ1V1FmZFF5TEJrNkw5TW1h?=
 =?utf-8?B?NHVMYkFsaE5PcmJETTN6OHZqN0YwOEZ2WkxOamQ2VHZYWHhaK0ZyTkIrOERW?=
 =?utf-8?B?RFFzQU1NdE56bEordytLR2UzakRNem40TVJlLzFHYnJFOHNINnZEaUNES2pU?=
 =?utf-8?B?a0M3dFJ2OWJmU2ozekkrcnBKdysvUWh5UjU0RFVtVU5ydTJRb0RnQnh2V2ZL?=
 =?utf-8?B?L1JEQXBobXM0a1J5Y2pNSWVPNnN6MTBXZEc2bVNLN2Z5a0VJMlVaNkhBdkNn?=
 =?utf-8?B?Wk1RcktGTDh2TDVSY1ZVWldEUGVqSWlNMGt2aVZBR3UrMDV3elB5V0xNMGNN?=
 =?utf-8?B?YncrUG5PdEFlQmI3YUZZWkVacytLbjlMZW9WOTM4RlpaRUZQcCtMNGdYdXAz?=
 =?utf-8?B?T3JsVG5IZWFyeUVrU0xyN0hVQ3NWMmQ3WkhESy9KM0xXdWZNOTdDSjNBRmJW?=
 =?utf-8?B?RjlYOGhubitmREZMUit5RkkxTUFFK1oxWGMyQ2VPdkZkTTRocWo3MEpOVWkr?=
 =?utf-8?B?OWtrOC9BYXdqeklaQkFDS1JjRFR1VDU3SzV0N1hPOWhxakJ5QThLRSt5aVF4?=
 =?utf-8?B?ekxFR1N6OGpXSFhlTjNMSHZnUW1LemFUOE5YaXJFbFpkQkxJUzVweWFRdEpo?=
 =?utf-8?B?dDlsN1lCaHZpVWt3N090MUVTZUpoSXR3SjJrZit2UFBjcTYvdlgvTGQwVGxU?=
 =?utf-8?B?YVg0YjBGSzNwZGRrWkduRTE1L252M0lsNWFFQ3dJeDVuVnREOVBvN2hvVEwy?=
 =?utf-8?B?d29OeDNjdFFMZmFhWXVVN0ZIRThSV3ZPQTJiUTJ0WkdpNlVpMXc0SHM1Smwy?=
 =?utf-8?B?RG51LzFMaDlWYnVSQUdIOEliYjc3QVFVNjZQOVZXWlhOdjFlSzBORlBJNVph?=
 =?utf-8?B?V3pKL0xZcnlWeUdhaHdGNFRKSVE5SmhXQUcvWStwWjFEQ1I3YkZ6eko4WWt0?=
 =?utf-8?B?Y2NFUHgwZ09OZ1hjTUlxVmhaMUYrS1Z6R1hMVTRQZ2g2cVZrVTFrbDBINXJ4?=
 =?utf-8?B?R3BCZU1yWmlIK0psaWN0VDQzeTV4SkZLYzQxNmc3SHp4TjlRdm4zbVpycXdx?=
 =?utf-8?B?VFFRV2x0TlBURTg2ZUZLRVBHV3lMN2tkL0xjQ2NCd3N2VEx2bjNQcytsRzdR?=
 =?utf-8?B?RmdZYk4raTBlNytpS2JzOTRzVDlNU3pNU3RUZEFxakZWdzhRcFNmVWczbHFF?=
 =?utf-8?B?a0FpUkdWcmlnVUZCVnZ5amVVdWp2bW9waCsrUnVmQk0xbXhXLzVEcTdkdjBt?=
 =?utf-8?B?dnorbTRqS2ZFdTdhMjZOWDUwb0xvS2ltalNCeUVvSE9xL25FNzViYURkUlFT?=
 =?utf-8?B?T0w1blNaYUFhQldPSnFxbmxXdVFXeDg5d3RPUVNkQmJoYUFGSTB4Qit0R2pk?=
 =?utf-8?B?WTcrQVdXTnJEbk9iT3RqVjFwMW4zK1hpOThLUW4yK3p3c2VRRUttYmM4SDBt?=
 =?utf-8?B?QUljMHhkdG1qV0t4cnp2ek8vNXVIUENXVWI2SXVmb3N1Q2NGUDljMm4vY3JG?=
 =?utf-8?B?WmdzL2ZObDJXNnNnZ1VFYWRuS0VicG5XRGVtcWNXRStnU1ZRNmZWbkZXNGV0?=
 =?utf-8?B?Nlo0MHU1ZWM3YUk1ZVRQRDIzV3VTblBpcTNsNWpFdG1DQ1RpRU1TZGQwbHBC?=
 =?utf-8?Q?pCm4R/Zly3HQMQH6d2ddsaumdP/YevozHPqTElMTUGuh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dee51bd-7f96-4e65-fcee-08ddb306d892
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 10:06:54.3524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpUERhnKZm3BTHXRVIBmRspM99di5685ODsxEKRe8YoeqRgF1JarAuYrPbDDdzaG72igY5fGZDVpYB5ahj8fBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6412


On 20/06/2025 12:19, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added function causes a build failure on 32-bit targets with
> older compiler version such as gcc-10:
> 
> arm-linux-gnueabi-ld: drivers/clocksource/timer-tegra186.o: in function `tegra186_wdt_get_timeleft':
> timer-tegra186.c:(.text+0x3c2): undefined reference to `__aeabi_uldivmod'
> 
> The calculation can trivially be changed to avoid the division entirely,
> as USEC_PER_SEC is a multiple of 5. Change both such calculation for
> consistency, even though gcc apparently managed to optimize the other one
> properly already.
> 
> Fixes: 28c842c8b0f5 ("clocksource/drivers/timer-tegra186: Add WDIOC_GETTIMELEFT support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/clocksource/timer-tegra186.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index e5394f98a02e..bd3d443e41cd 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -159,7 +159,7 @@ static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
>   	tmr_writel(wdt->tmr, TMRCSSR_SRC_USEC, TMRCSSR);
>   
>   	/* configure timer (system reset happens on the fifth expiration) */
> -	value = TMRCR_PTV(wdt->base.timeout * USEC_PER_SEC / 5) |
> +	value = TMRCR_PTV(wdt->base.timeout * (USEC_PER_SEC / 5)) |
>   		TMRCR_PERIODIC | TMRCR_ENABLE;
>   	tmr_writel(wdt->tmr, value, TMRCR);
>   
> @@ -267,7 +267,7 @@ static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
>   	 * counter value to the time of the counter expirations that
>   	 * remain.
>   	 */
> -	timeleft += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);
> +	timeleft += (u64)wdt->base.timeout * (USEC_PER_SEC / 5) * (4 - expiration);
>   
>   	/*
>   	 * Convert the current counter value to seconds,


Guenter has also posted a fix for this here [0].

Jon

[0] 
https://lore.kernel.org/linux-tegra/75496de8-51fd-4e27-9f92-babaa0e22c14@nvidia.com/T/#me403a7afd04bbf24e29d3880123a4faa656eab05
-- 
nvpublic

