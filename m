Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33B4158DAC;
	Thu, 19 Jun 2025 07:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317927; cv=fail; b=MrDAT/47EWPBXTHE8AGVi5M1Rfzl3+xCXWqPbt5y8IdBBw0I2fqaPfr7azu6mZr3RLF5ffE+Z+6aJx3kTNC67/+OL0bS7apzRW6Bi6T+Nt/IelyluDWM61PL2Fn6Wy7OzAT4uAuBo98c0ZSxIQ1nzsidlqlBf+jEkPy399A3+rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317927; c=relaxed/simple;
	bh=1NebLpreTBAhd6HnKhAgyG7e0dZgyoVuQYIL1zbtcyc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GBg4RewNTuQDG+Ilpsysyhf97jdWftzBb995tlrKhQCVKuNJKUTQkQF79VicN96uqx8M4TCl5wcyoWcDzYPJAXjU5FXboddrFzA34xzN2nhuvFL7QtlAm7gaxWrSJVd2b2eehFnqlikWA9qLqnnDYVshJ1kVaPSUeEln43jpvyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LtYuSpPs; arc=fail smtp.client-ip=40.107.92.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LtYuSpPs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuZd1fB1Vn6GvxVxQMUpCvszetAGpXujgOB85exw+32F3DranmocS3DUcCnIU6Dr13PUdGy5tNN624yspTEKvperYd3v5o0wzG4TaO+GZkZiRiE1BZUtzNO4G8rPim4qg210RhDTTchuOwb/C4HsW7iMymoWLTGKrsnzJCr65qbS51VZtVPpAYIx75N+GXzSO/apFHnQhD7V6J0DtkpJfAoW04hosOdEj5uMqSEiZGla8z1NMZH0YHg+XEqcH3c6UcMmRCOktPt73ztJmSZmyxUXJ+CNzZLqI0UOdEe0BwdAPWNnqsLSMloU+9Wq9Q1fisnXiVX16innET61eYib0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njc23GhnP0h6JXwa2nfX/mLm4ww0BiIEXFNU7JFEp/I=;
 b=FIqgfc9j569MGVycbPTemFSOBWVeSDGaqna+UsQVbZCbhelDI7jU7EHEXNjnrXOTq9TdGJkQsmuxW+r5roM3CW0paXUDjcu5apk9gJuWH3VxXUdt4PP2UaNJlA4t9c6RRaSc4Lu6Ts3hKtxT+rJYvREhpsUvSKsyYCbVwVPVHmBPBCj+jJMc3N0ZQPzkpgSNcAZej3Gt2T+xBVLbXQGQzmw+fEb4roNiUTOiaMyErhtSPOGDZOji8ILag63dcXcoILtEGxxfMRyl8yTGyU+4eIkMB0G2lPlwgCQckt0xoQQIA8rO97xagaCl4iuMAJzvTF2JloGOnggxiglf9JAbYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njc23GhnP0h6JXwa2nfX/mLm4ww0BiIEXFNU7JFEp/I=;
 b=LtYuSpPsrNZnSkZBOSErMoU5sWT2G4Hgtw3ZH+45lELR5ngL0HUXYlSJX+JfhFyCgS0tuyh2ByAOd1j+W/AWyDS2U5A0bObC1DVDZXM/TaQiOczO5DMEzj/0n7XkhkLHd/PjzSGRr31R2PF6XfdS0qwL3tOAlrfS8lSbv3v8zfF8KCZqOX4urkHt7uFYSLfWpU9gWIS3ZDSQNAsIKa6tvXPymJgiwnF+tMVyyHWWhs5r62d/mvML6CVLENe1hwna8yXyzi4bzUEIPuD0FZ0L+ZaoWGez31a8ZyfB9mvLUReGeD9iWWFQLhogppq3X2F2rdjrkNdvTImg5RM/zMWuVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA3PR12MB9200.namprd12.prod.outlook.com (2603:10b6:806:39c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Thu, 19 Jun
 2025 07:25:22 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 07:25:22 +0000
Message-ID: <b2d62fe6-3e19-405a-a6e4-d135fce52328@nvidia.com>
Date: Thu, 19 Jun 2025 08:25:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clocksource/drivers/timer-tegra186: Simplify
 calculating timeleft
To: Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, Pohsun Su <pohsuns@nvidia.com>,
 Robert Lin <robelin@nvidia.com>
References: <20250614175556.922159-1-linux@roeck-us.net>
 <20250614175556.922159-2-linux@roeck-us.net>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250614175556.922159-2-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::11) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA3PR12MB9200:EE_
X-MS-Office365-Filtering-Correlation-Id: 053bab82-f549-42ee-18df-08ddaf027379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RE1lblhJN2NtejRlcmk4aUhwTGtEMVVwc05DT0tkNGRSc1FlMFpzMW8yZTlz?=
 =?utf-8?B?ZktlNWk4dFN1b2hDcmxPVEk3MDlFUExpcmlNYU44S2RySFlnWW9URzluZ3lI?=
 =?utf-8?B?VGV1L29pWitMM1E3bVJ1dzBRcHRLMW9sVFRYdXI0aDg0VnRIRGNxbmRpa1Q4?=
 =?utf-8?B?cldGRmMzMVFIZTFEU2xEY0xZTUJYQUJBV1JUUXVjVytjOEdhczFjNlBEaGto?=
 =?utf-8?B?YVFMOThoTTdibXdYc2NIT05EM1hoejNnbXVjSmlWQnZ5QzlhdzlzRWtDRk9u?=
 =?utf-8?B?NHBFTkVGUUhaYTQ5TTJtT0l6cXhOdnlyN0duZ3lyQUpiNWFHaEs4RHdyZCtW?=
 =?utf-8?B?WVkzRkZzRUlaV0E0QVlWc0NNWHlZSy9JZ00zMTB0c2ZsYkdQNDc0Z2YzakJG?=
 =?utf-8?B?bFBuMXhmTzlPUUg2azlKbkkvRWNJUWZRcUxhd0R0b0dIemEyckxOYjVZVjUv?=
 =?utf-8?B?YkxoUHhhWUVMenhOM1czREJzSFkrc1c3bHZ5UzBjVzJwVktlZ2YxdDRtcmJk?=
 =?utf-8?B?TjZXUDdRdzAxQmZDbkg2aWxGaDRtSUFXSHRlOWwyMVBJTTNVTVJidDJtSmZC?=
 =?utf-8?B?dkYxU0VzQ1o4aG5iZEZhTDUvM21aQUdXTEZOREcyKzZDQ3R6SEZOZDJJZHYz?=
 =?utf-8?B?WXZSWmppSjRidHRrejRmTWdaTVJIeHU2amcvQVkwRzcyYTVJQ2ZwTG9OeExB?=
 =?utf-8?B?STNXTW5Vbnd3MzF0Z05Bd0VwQkExRUlNUlgwSWV6WWU1Zi9Rb2NkY1VDbVpk?=
 =?utf-8?B?TlNSYkw0WkNvZ3RCNXpnYlJESmovdkZ1bS9pSmZ6aUVHTmJwMTdiSzU1Q3B4?=
 =?utf-8?B?NTB0Nlo5R0s0WlNYazVTVFFaVDdmb0h6RmRPWTRMY3ZNTExkbEN2RzZrdGVQ?=
 =?utf-8?B?R0EyRWdnSHRwOFl2RVJmelZmNWJJMkRLby81VnN2V0tZT2t6OW5ubHphbnNn?=
 =?utf-8?B?NXZNbEhlQnk0dDZrWXRYZzN5bk02aVJXNVlMUFpwT21JWVlYNWNndmg4VHJo?=
 =?utf-8?B?azhVZHVDeGQrblQ3TXk0c0RxWDF4L0Z0cHVjUGlVclNJRXFaNTZhZHpMdVU4?=
 =?utf-8?B?b2hUNFh4M1RZVFZlNm8rNWV4cXJlMFdlOWxUaFBGRGtGMVN3bzNDUDFWc3pk?=
 =?utf-8?B?T0owZDVUQUZQMURKL041dk1aNUtEcUdDNFlPMzZvdDhxWiswNHMzc0J5ZHV0?=
 =?utf-8?B?QkF5YVBOVENtN1lhZ2t3MEpicnc5Ly9Xc0d4RlJxdGZOQlFHYlc4YWlHQnBk?=
 =?utf-8?B?YlFpa085aXorY05yeEpnbE1wL2l4WCtCdGRtc3dzSEphOGdCZFhQOVhBd0pF?=
 =?utf-8?B?bldMcjZQd2R2WTgwcG1Zck52MEc4TTlkenVPTmxGOU8zbzBpRkUzaGtsV29B?=
 =?utf-8?B?SldwRnFtcENYUEFwUUpZbkhGQVoxUmdaMm8rSFI1TElSbjV5VTBvMGgzVmhV?=
 =?utf-8?B?UWdXVG5GT2RsUm02cnhCdVVBcW5VMEV3azVkUWhmcnM5OTBYY1J5dktmbUtS?=
 =?utf-8?B?VUp6MmVKMGZGdGtiUFhsTFhxaENkS1NkVDVYM3EwWkRWOTRHdkhrUDRSVkZE?=
 =?utf-8?B?QzVIVjJDQ3NkeVZpcXUvYnFhQkQ5K2QzYk1UbCtyUFVWRlVXTUNNdk45Umtu?=
 =?utf-8?B?cGFaNkVRQkFmby9sU2pHaTJnU1BKMUNQUTA0TzNCR3hVL1ExOWh0NnU0UXdx?=
 =?utf-8?B?aTd4WTFrQnpIWWsvNHhTb29aWll4UlVkNTFJK2tGY2R6ZDU5bjBRYjZEMElY?=
 =?utf-8?B?anlyL2xmS1c0WE1GTFk0Y1g0QWtYaGhHVW1Ubk9qa3REaURnS01UTVh5UDgx?=
 =?utf-8?B?bHgwZUZxS2hqTmpvUzcrSXNzUjBndERhem9hRlJ0bStHMGxqWE9ZYUJ6NFFH?=
 =?utf-8?B?TU9vMFBNZVcxNEc2SWFVeEcyYkcyZXlFK3c1UUF1T2V4N3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3VwYm5UUDFnRjNZRDFRMURnSy9rNmVpZGlzTzUxWDltaE1qQzdiSmhRK2NT?=
 =?utf-8?B?cnBCK3VJU3cvOXU0aWxDcU8yZEFTSVIzN1JNdGd4RDNPKzdqRWo4ZFIvMHJo?=
 =?utf-8?B?Rm5TQUd5djJIRkdJTTkzUWg4YUJLZ1lWZ2V3eUM4ZnFiZU9YY05QTUpleWN6?=
 =?utf-8?B?UGJvVXBBaXBFTGFGNllLQS9yTzdkd1J4ZG1NYmRyeU9GaUk4NDJ3M0UzK3ph?=
 =?utf-8?B?WDZOSXYyYWxBOGNOTDRTQlFEcEN1d1E1ZytlaW9xZWRHSG5FenlTQzhXZFFp?=
 =?utf-8?B?amtMalR6UHNKcWlQdnBEYi9yaGJvQ2x0L3Y3TzJPem43djRjU2I5MlZESUFH?=
 =?utf-8?B?K2lScCtmQ1hESzc5RXU5UDZjblc4Z3ljTTRPcWZ1Q1BQL0ZuRkxOSlRTejB6?=
 =?utf-8?B?Q1dnc0ZNV3dYd2lXOW9BRnlQc2pkZzgzL0RhUTh5dVppeTh3MGMrQWpEazFS?=
 =?utf-8?B?MnQ1V0MvaDE5MnVsWThEZlo3NXRuYk9temNXcklKRUpnbVp2TVg2YldweUdm?=
 =?utf-8?B?cVJnREhIQk5NbUpYK2pvTkFVUk45OVN0WC9KT1J5b3orUmRLd0xBR2w5QXcz?=
 =?utf-8?B?Q0QrSldhSFVCNnRmdi9ldFVOOHVZb0NTSW82N09SaThYWnVFTE5Ock5hTTZw?=
 =?utf-8?B?N3A2aDhMZVU4eDA3ZkphOXU1WVZTNlQ4Z2FTZkxlelZUeDIzYWJkN0tiNXNE?=
 =?utf-8?B?OE9IUjY1bjJWYjdJcmIyTEhlYysyRGtHQTg0UjVySEFQTnhndmZpY2kzK2pS?=
 =?utf-8?B?V2QwZG9zSW5HaDJpMFRLanNweTNOWEYrZUpXRjBIVFFQS3VJTVRpRStiZWdZ?=
 =?utf-8?B?dFBJaURUei9QNElhRE02TE51M09OYXIrSCtpTTZteE04VXJuemRDVmFORUZ5?=
 =?utf-8?B?N2hNNTR1QlA1N1d3VnNETEFreFNxUzNhSklEOTA5anRrTUlaUFpNdjBUVVFo?=
 =?utf-8?B?SkhObDdoeEY4ckhhMElYY3lxOUp0OG1QalM0UjkzdTd5VVFnbFRvdG1mRk5y?=
 =?utf-8?B?Q3JpMTdWNXU3dDF6R3IrVHZ0akFrQlRsV0xSTE13RlFlUW5aNUlvcDRIMUpH?=
 =?utf-8?B?alVieUpnL2tyWlJDY3FWWWM2Ni9mbU1vR1QrQUpZTXp3SGZ2cXB1R0FhRHRt?=
 =?utf-8?B?NFIrTkVGK0kweXBXa25GeU1KdDNhYVJKR0VvUW1TNVVMSzd6aEQ5VW1RSzhs?=
 =?utf-8?B?d0NLTmxpWU1IWHpqSDcwNFJyZ0Q2KzN0UE8yUFFNSmxqR3hDWmUwS2JGK3BJ?=
 =?utf-8?B?dGY3NDNRNzVZdUJwWjVxQUNocU9OaG1IQjZNbGNTeno1ZjF6WCtrZEVRSkVz?=
 =?utf-8?B?TlVSZTJrajh3S29nNXRMRFRJV0pIc25zTUtpWDhma2sxS0UrdDZ0SE9qVDhT?=
 =?utf-8?B?VkpYZkFoN0YyTnZCQ3MzMHpYcmNtanJOTkVFRHRSQzc0TDVXV2dXeDQwc1lI?=
 =?utf-8?B?cUprTGZjRGlFRDBBNlNETVlBZTN5ZVFPU0RkSzMrWHVmUGtCeGo0MzJlN1g5?=
 =?utf-8?B?dnEyRGFxMjdSUU4wNzRKQ0xXZFB5cHh3MnVIRmZ3ZndCRkpkQjU1R29KYjlS?=
 =?utf-8?B?NG5kSmpyTTVrWG0yNW1FNEtZUmQ0T2R3NE5wNjhESGhFcVNJYWxVdk5GNnky?=
 =?utf-8?B?ejdkRzlOMWJhNW9aWGFKbnlQaVZYQkRYQmNtZElaWkh6M1ZuLzVwcVNFc1NV?=
 =?utf-8?B?eUlMUlE3NGc3dk5TZlZ0YWJCbW5SSm9xbkRZT1ZwZkdVVDlIRjQ0TWtwSGVz?=
 =?utf-8?B?Tkxycmt1RGpGMHpVTVdnaDFRbDNkNEVMY3M4WXJQQWFLcGR2VUpTTFJ6V1Yz?=
 =?utf-8?B?RlZXMmk5RlFNcTZadSt1V2R4Nkx5bVhhNDZiVXhjTVQyaitickxnS1FjNjli?=
 =?utf-8?B?dTFnTFZMSzQwdjhtbTZZSWFtV053UXhOTkZTTThVdmJZZlVOMDNGR3J6K2JS?=
 =?utf-8?B?K2dtRGdUK0k4R09Hb0drallzeVJScGp0bDdHN0dSanFmcXArRElXZUdTTlVR?=
 =?utf-8?B?VGxFZGhQR1dtbTZQV1hveFo4Q0tEdlBGUjhwMmNSOGZKa1I2SmVaZmNJczZX?=
 =?utf-8?B?MjF6V25vM25RWFhBODhxWmtyL2pVNk8yQllBcTJXTEgxMlZTUGUzUnYrUFFH?=
 =?utf-8?Q?H0Yl/5rrfFK1I5NHwpPorgeTC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 053bab82-f549-42ee-18df-08ddaf027379
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 07:25:22.0789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1jqRVq5065WbhxC7xaae5M4F35w/9RJXjMmjzeQUV7XdAQ0rsCMmMJNDXZ28S8Ug424RnCgWpySsRNL+s9rbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9200


On 14/06/2025 18:55, Guenter Roeck wrote:
> It is not necessary to use 64-bit operations to calculate the
> remaining watchdog timeout. Simplify to use 32-bit operations,
> and add comments explaining why there will be no overflow.
> 
> Cc: Pohsun Su <pohsuns@nvidia.com>
> Cc: Robert Lin <robelin@nvidia.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   drivers/clocksource/timer-tegra186.c | 25 +++++++++++++++----------
>   1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index 7b506de65438..6ed319bb4e06 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -231,7 +231,7 @@ static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
>   {
>   	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
>   	u32 expiration, val;
> -	u64 timeleft;
> +	u32 timeleft;
>   
>   	if (!watchdog_active(&wdt->base)) {
>   		/* return zero if the watchdog timer is not activated. */
> @@ -266,21 +266,26 @@ static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
>   	 * Calculate the time remaining by adding the time for the
>   	 * counter value to the time of the counter expirations that
>   	 * remain.
> +	 * Note: Since wdt->base.timeout is bound to 255, the maximum
> +	 * value added to timeleft is
> +	 *   255 * (1,000,000 / 5) * 4
> +	 * = 255 * 200,000 * 4
> +	 * = 204,000,000
> +	 * TMRSR_PCV is a 29-bit field.
> +	 * Its maximum value is 0x1fffffff = 536,870,911.
> +	 * 204,000,000 + 536,870,911 = 740,870,911 = 0x2C28CAFF.
> +	 * timeleft can therefore not overflow, and 64-bit calculations
> +	 * are not necessary.

Nit, I may have worded this the other way around and said that 'timeleft 
  cannot overflow a 32-bit type and so 32-bit variables are sufficient 
for this calculation'. Simply because there are no longer any 64-bit 
variables used now. Anyway from the history of the change it will be 
clear where this came from.

>   	 */
> -	timeleft += ((u64)wdt->base.timeout * (USEC_PER_SEC / 5)) * (4 - expiration);
> +	timeleft += (wdt->base.timeout * (USEC_PER_SEC / 5)) * (4 - expiration);
>   
>   	/*
>   	 * Convert the current counter value to seconds,
> -	 * rounding up to the nearest second. Cast u64 to
> -	 * u32 under the assumption that no overflow happens
> -	 * when coverting to seconds.
> +	 * rounding to the nearest second.
>   	 */
> -	timeleft = DIV_ROUND_CLOSEST_ULL(timeleft, USEC_PER_SEC);
> +	timeleft = DIV_ROUND_CLOSEST(timeleft, USEC_PER_SEC);
>   
> -	if (WARN_ON_ONCE(timeleft > U32_MAX))
> -		return U32_MAX;
> -
> -	return lower_32_bits(timeleft);
> +	return timeleft;
>   }
>   
>   static const struct watchdog_ops tegra186_wdt_ops = {

Otherwise ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

