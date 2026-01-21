Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437C62877C3;
	Wed, 21 Jan 2026 15:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769009833; cv=fail; b=hY/LnJX56TJkqCvVaFBqn0qvR5l9N5oINHAbakMlh39vmfgwTU001GBCsEKKCj0wuRcyVt9c77IP4bd36S2m73qU1a7UxiVtJvbpG92qkCIqmAKUEi64OIRtpjUvK96fCdykuy6gt59igEPHUR4it6R2CDrgZrGFgWMJ2aLc1v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769009833; c=relaxed/simple;
	bh=DoFg5TsVC8b5RbZanwqsC0ocMaMjVyC8O/tzsEAY/K8=;
	h=Message-ID:Date:From:Subject:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oZ4W2NhKiQXul+2LzWsfPeTdAZlDlc1e+nkq8E57Y6qYiSgzJ3SAv91kmKi9luEMGqW0wwJ7bwBSRvfRHU9+yB+eoXFp8DEB4nBRfWHsnEAW1UrGUQo2+xMUO0Q5KsVtVqwGMEwFAdyX3FcwvbTe2LAEXyMPaZSB5h68Mzvq+6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h0Ea5wIj; arc=fail smtp.client-ip=52.101.85.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h0Ea5wIj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKuwVBv0Dt9f/d/7v3PAZKvic4CcFlkdHoI0k1bahIA/yWRJO+YtMoE4vmgWFez4+4PMPKk9FqgeuDpK58H8gZeSi0JQL8Zma+JJnppLPSeE32zSx1hlHFBrw8Kk2gaKcb2xR5hjAeeUiR6QC3eiLmnxxQ+sXa3uDoyQdjXHu0eZ71954/iMxyI2m9DILH74Zvz9QvpKxKGsn9IZGWxhXuomewx2JMoloRDuzbnm1e6X9/6xheunDbAoAM4MMZ0AL6YF7ZhkZmueh8U8x585lL2arcmkB8Dq+hi8TnmUFb9eUg1CCbwvmvUvt1T5ZKIWGGEISofPBtJjO0402gkjDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isQ7B6BqPSf5zWrqcyDkB3J6WmFoBxxtHhG4+3UILBA=;
 b=tbIep3sJe4OI+gebFBKDsbGK9HzuNsAM4vznAAdUaq38UcNtg17nhAy5m4Z9L4sRxyEV+dYuKcwxCkTzZltS1G5eDEb56EU4wE6KkNnXiNy1vhwCNrv/DDa0KnP8f5srwXijKoN0rGigz6SQLNGyrEa/DrKY2fRgYPVlSH6MAmhj6aFtzn21OZSGdh67xf2iD+J978LaN3CWzdearO6bFtlbNpGczrBzPkt/BXp03vGIMgss0egQP+YCKnHDWcmv5T6R0FDDNeGMXkYCL0ylrk7FQpFN4ziUvTFMU8IEGpmkOUmsFgFiMJ/WCKf4tJjVDlqmfKvBmeXaNzOcohfdTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isQ7B6BqPSf5zWrqcyDkB3J6WmFoBxxtHhG4+3UILBA=;
 b=h0Ea5wIjXTPCkwfKkJrQ7z+NDe+CaqThps8T7wmlUH/YcYINWBEVDleOYB/Hw0tqOMHng37tZ/6WDiwAiQ21VQZrvga44p+viTqAWYIurJxNMjOEtRirR5pTob1MgXVFDgrX4rRQc3pjN9klSumqoaGHTvTF88wSHnayTg75yRomteNSDlzsddbDIlGuVRk49N+jn/GUUf3pXCmYN8G0LruRo3nv00RDWSV3auxVpsj4QmRGQCoeh/R/iMf74c/D5uWaBkLmktlxsnAFLo+BASwoSGaPONSgqyaIoY3ANhTJ+lJw3Mkj56nxmT+SRAvLUQR+NKN/WnBT+6wvRlgSBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by DS0PR12MB7535.namprd12.prod.outlook.com (2603:10b6:8:13a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 15:37:03 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 15:37:03 +0000
Message-ID: <f730c0c4-42ff-495b-a9a2-c61e6391d2be@nvidia.com>
Date: Wed, 21 Jan 2026 21:06:53 +0530
User-Agent: Mozilla Thunderbird
From: Kartik Rajput <kkartik@nvidia.com>
Subject: Re: [PATCH v8 3/4] i2c: tegra: Add logic to support different
 register offsets
To: Jon Hunter <jonathanh@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260120092032.83100-1-kkartik@nvidia.com>
 <20260120092032.83100-4-kkartik@nvidia.com>
 <b91fa3a8-3fcd-4c74-826a-9679421f5fb6@nvidia.com>
Content-Language: en-US
In-Reply-To: <b91fa3a8-3fcd-4c74-826a-9679421f5fb6@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::10) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|DS0PR12MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 4694b42c-3224-4988-c806-08de5902ece7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0JYeVhQOHVJVDlES0VKblRYQWY0TXphYkpKa284c3p0OUZzUG91YzFYZ1dr?=
 =?utf-8?B?YlI3Q1AwNXBlRW1mOGtMb2VEaGViYnNFMlc4ZTZpNVA2ZGYvZ0RlRTEyRDB4?=
 =?utf-8?B?SzJ5N056VVd1cndpeXBPRENUalQyMldpRUJzMldmK3dNQjBsMHJ2ekRBN0pU?=
 =?utf-8?B?SGg4MzJGU3FEbE9xSHp1M1hMaVlHTTNSVjBiaVVvRW1ZcjhCc1U0Qm9VSnlZ?=
 =?utf-8?B?M0FqeW04Z3p6SHBEYnlWVVU1elN1MVA3YWxoWUo2ZTYzMk1yTXBveVppV25S?=
 =?utf-8?B?QTFtUHg2U3gxVnlVUXpwUUFRYm1xNjlyZnFmTUk1Z2t0eTZxdTJVWHk2b2FR?=
 =?utf-8?B?RHI1U1dYc3o0U01BMkRXb2I2UVQ3K3RtTTBuOFJVQjBMMHpWazRoOEUraDM1?=
 =?utf-8?B?K2V4RnFPTXJjMWtoVkExMFdJekRBejE3UmMzRE0wWCttZGNBekNsWlZ1eWVX?=
 =?utf-8?B?MkYyNTQwVUxuUWhIcXFXaVdMY2FxYjlWNXJlN2FvQStTR1V1dE1Hc0RlYitw?=
 =?utf-8?B?YXBtL3E3cTl5dStoeExPeTlIbWljRDYwcDFXam1WcVJLSFpRTlJkTzNtZHFI?=
 =?utf-8?B?N2tjN1BGY3Q0cTg0RlM4N01kOXoxQnRLVTBPd3RMN2ttcFYrKzRCYzloa3ZI?=
 =?utf-8?B?dkNCWU1oRTlRTUtiSUh3Wi9SS0Fvanp1SHVJR1Z0cDNWMURER3hrOGVmYjZK?=
 =?utf-8?B?NXg0bXU3Q2RWRE5VU3V0Y00xT1BlRkszRGh2THozTDJtUk04a1RPejBGV2o2?=
 =?utf-8?B?OVp0Ym0xV2xnWnVOUUszcENBRGpwZTRzMDNlMEpSYXdjZnFNZlkrdEl3VlZn?=
 =?utf-8?B?c0txdDFXK2lMYVJaSU1FSGFSSHZ1TjBLRU5uNlFFSDl0SkllcnJHQnBtc0Fn?=
 =?utf-8?B?dm5XYWFyOUZ6aDliUFJVekQ2SGdrS1hnZjI1TkhVc2dkNlZMamcwUFdMQnJ2?=
 =?utf-8?B?K2hiSFZuTXgxcFE5Qzg0WG94cDNWam9BNEJTaDdPRElJRVVsYWJudmsrSnFu?=
 =?utf-8?B?OHMrZ1hIeHQ2c05rRFRtd2taRCt5dlgrNUs1QXI1WXdUTTFRdjBsV0tlNzVs?=
 =?utf-8?B?dmJ4RTYxdUhEQTVMNEErNHFuMGZNT1VtVXlvbTAwbElMS0p6OEt1R1lVWXlD?=
 =?utf-8?B?Z0hJeFI3emt5OTZRVTBKdEdvMEQ0bUM2K05UVll6RUJjRTNHN2NieEpHQjQ0?=
 =?utf-8?B?MGpFM1BzOUhGRXhsbU1Hem9XKzN2Uk5hRWxad2FyeUg0cWVlU1pudGlnejQ0?=
 =?utf-8?B?b2pJclYvWEh0ZUlVMW5kL1dLVVovTEtoa3ZyY1M1aGpRR1c3QmhKaTF6WkhT?=
 =?utf-8?B?cytieXJCZ2JIZEJKSHRmQ015RGMycVNBWmxjUGRiWlcxVEd2QVh6SFh4VUZr?=
 =?utf-8?B?cVFGY1RyeWJGc1VEQXRqWEVFeVhGNW45RFpEMGNDNlBkUCtiUnNpaU53T3g4?=
 =?utf-8?B?c3dwV0hZaVR4TEpDZmRFSmZQd1RVQ2NDUUxhNUtMcUF3cEJEREUveUJBRDhD?=
 =?utf-8?B?Yit1RHRhZGN4Nmlwck15dnN1aWI0bkNYNzVqWkxRRHlwdjlLR1N0WEllbkpS?=
 =?utf-8?B?SU9BRTZvVDlVenArNWNScjVYZFJvR1FoaG9DN2UyNWp5eWo0NFhkRERWTVh0?=
 =?utf-8?B?L1FHWWcyUlJtZHZCQWcyL1ZvVVlzSHRtK1d2VjljeEQ2VzNYMGZJb0dFUXNw?=
 =?utf-8?B?S1l6WTN2OEVJMzV6MU5kZ3ljRStMVzRzUGdIenY0NEtZc0NFd3Y2eU0yZUZT?=
 =?utf-8?B?bmI1V0NVV05udGt6c05XSjZpdEg3WnBWZDBRb005UEQ3QUJ1U1hGU3VnREVK?=
 =?utf-8?B?S2g4akJ0Ni9GV1dORDJGdHlxaHJhRkEyemt6OWwyc1dkdm14R2h2citiQ05k?=
 =?utf-8?B?UmhXNG9KSnMxV2EzSzBVZ0dtMCt4ODVuRVZPTy9tc0FmakRibk5PRTAxQmov?=
 =?utf-8?B?RU9JZHRiTG5OL3hOdzR5R29tSk5iY0NSTWFiQmh4NCt4U2FjSGQzYmN4VkFT?=
 =?utf-8?B?Q0hQUHdnNWZkZHRGSWtpQWxNUWc4TVlicmFvU0liL3ZYcWNKeU41Tk5Lelpz?=
 =?utf-8?B?aVY5Q1lYS0JFWDZSMDhzVlFpN2MxbEs5RDBCMUpINWtJSTloY2d4MjBYZFZq?=
 =?utf-8?B?UGQrVWJzVldKNmpEVjkwQm1yY1ZvVytrcjI5LzIyVmxuR1d1T09vZGU1cmVn?=
 =?utf-8?B?Vmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGZ2WVlRTGZsNFNxbzVnelgvYVdVRnNWRkl2Q28zSTFkdHNwYVovK0xoci9r?=
 =?utf-8?B?VWNUc0J1cVNEL2dYQnAyN2hkTE9vM3hMbHo0VXVXaHdQazVSaUYwRHl2V2x6?=
 =?utf-8?B?ZWRGMWRYNSs2NXU3aVdiL1ZJbENCRitaM2h3MWRoS0NSVDhSemVBbUxTOFlG?=
 =?utf-8?B?V2RPbk9ibXNkcUcyVVM0ZktaOHdBcGNweWkzR0lZK2lialpkRVhucDVEOFpR?=
 =?utf-8?B?UWVIS2MrbWs2MkNldFlNbHdzZWU4NE5zejBjL1hUbTBhUXZIUFpPSGlWVjFn?=
 =?utf-8?B?a296RUVkQzhNU243NkZFNzNFWmRURnppNWkwejBVTndpUXdXZ2Z6REd6YUpy?=
 =?utf-8?B?MHJBMWhoLzR0TDhEUG1zZktySTlmSjhkOXlwb3p3M250bUIwTDVPL1Bkbm1p?=
 =?utf-8?B?MUN3UVJqZFlyZ25FZ3lzSG1LeXNHQmpqRUJURVlIQjk5ZkdmRHZNaUFlaFF3?=
 =?utf-8?B?TENrWXNDSTFwMHZNU0FHVktVWG94NWZYZnY1akFqV09SNXJzczdQS1N4RnIz?=
 =?utf-8?B?cVQ2ZG5JYmlzdDVtZWcxaWhodnNSVitJODh5TEw5RlFsam1xMEIyM29RbXZh?=
 =?utf-8?B?Z21TRWxGYmRNVkVPOHFqVzhxR3N1U3BQV3hLSmV6MXVuWkthTlJnakw1ajlI?=
 =?utf-8?B?TlV1cGNXQzN5RGNsY3NwajBJbVkyOGdLbjJOVWZjUHUzRUhGSVhkdllOSlMw?=
 =?utf-8?B?K3MzTEdQZ3JLMW1oTldybEZ3d2JzUDBxcENyMFdJdVhNNjl3WldjNC9Kb3lS?=
 =?utf-8?B?cnlBTE11aUdVQW42Mk4yQk5DU3k5UDN4azNPYkJ3MGxaK3pkdHBNNlRjaDNG?=
 =?utf-8?B?UFhtQ3YwVHBjdlFxSHVnajVhQ0dpQytkUjF0T296UlNSQjNxZUdMWlc4N0xw?=
 =?utf-8?B?UlA2QlRSNjhBbmF5MFBEc3RtbnoyQ3VydDAvRkd6c0dIaUp0UGJMNnN0Rjlu?=
 =?utf-8?B?WlNFd29JeG82MEo3Z3UyV3RRQWFWOWtkK1BKcG9MeXVCR2ZuNTY3Z21vNnRu?=
 =?utf-8?B?T3hYU1NTLzF2dVBaaHd5a2UvWHJNOC90b2c0QXBrcmpFMDVQbzR1WU9mRzl3?=
 =?utf-8?B?Y2RnOVZiaHJFdkpiSTE0MVMxUUhsZmRwWEd1OGFXYTk3S0lwZ0JMQXRxVll3?=
 =?utf-8?B?bFMvMzVRQjU3UEJkbEU1anZpRW1LYXBxVHZhWTlBZDZGbjcxWm1EdS91Q2Ux?=
 =?utf-8?B?Q3Q1cGxUemN2UTJzMnlCcmtndEIrb3hXTUJDZTB2aVdiRnQzVE5jYlltalgr?=
 =?utf-8?B?VTBKSHJPOGJEM0xyZURCMnprVXpQRXV5L2liZk9nVnp0bWFqZGJvSnhuQ1Bm?=
 =?utf-8?B?THorYTJpamEvVGZsU0g4SUR0NTNDVlo5NWN3U0F4REdIKzl2VmNOcWZUN2g1?=
 =?utf-8?B?Z29YaFkzU3Z2WXlYSEs1cDhQQ0g0QTBaZ0tMWGxnNzlJZFp2TU1sVGVrZ3l0?=
 =?utf-8?B?N2RUaTRUanRxOTFzWkZkVmt0c29nNEp2VnlJMU9EZ3d2RXdsNHV5Z2x3cHJG?=
 =?utf-8?B?NFNSVEUyZnV6ODArRnM2WGtoUnlSVXY4dVlwZ013QXFUT2VVREJiQUFwZXpH?=
 =?utf-8?B?NTFtdC90cTNTTjNNTnA1d1ROcjB0Qi9zS0w4Vm5ZMUhUOHAzdGlGRTl4RlBW?=
 =?utf-8?B?QmlCeTZZdEM2Y2xrUTI5d1g5QTEyc0lMRXJDRldiN3o0WXBNYVI4bElmZXBQ?=
 =?utf-8?B?ZHByN2RSaW94bFdXTlpWcXNhbkc1L2hYRGpzanVnLzV2VmJlYTdSdWZ3WFZx?=
 =?utf-8?B?dWd3d2J0ODBKS1B2L3dnVGNOZGwvaG4rMHdxNDRiUmYwSVJTL1NjbUdzaVFK?=
 =?utf-8?B?SG9vSWcvQ0JoWDRmUllVbkN6UmR2ck1RaWVoR25SWVBhcjRzTG1HTDJUTkg3?=
 =?utf-8?B?b3VjK0FVVFJiMVZNanhIMDd5Vzc5WSs1dHhyTWN6WVF0eTM1YTJrcjJWWHhi?=
 =?utf-8?B?Qk1weUhzN3FZL0FiVDJ6RHNwS0dsSTh1NkNDd1BQbkJuREtIVHJ4K3ZVaGo4?=
 =?utf-8?B?eDdHS09kbjBnMFJ1alBJaVZhYXozK2FBZ1pTalg2NnlsN2lzYURkdmY5VTRv?=
 =?utf-8?B?WVN6aHhKNXpYejlNV25HRU9DSlBJcTFOWSs3T3JuTWNoUk5JQ1RDbDh5R2NL?=
 =?utf-8?B?TDhYMUwyU0NRaEZuY3RseFdoQWtEZUZLZHJqQUVCdDl2RFMxSVgwSjB5akkw?=
 =?utf-8?B?YUhRMzltb2ZuRXRqZU1OTnUzSzdCZE5sMFY2OG9IVDhSejRtbE9NQ1JMQ2Y0?=
 =?utf-8?B?QktFRVJGUHhEMC9jN0N6VXB2ai91ZFFZcEVRTWRoK0NJZXo0aUFUakhMSEFO?=
 =?utf-8?B?bVkzdEprUWhGSm9CWlJGSDRVRVNNT1lUbzdLcytGRmVXK21Ha2FLZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4694b42c-3224-4988-c806-08de5902ece7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:37:03.5164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1eV0sDoi1HRWLa4s+BKOeLVZ6chZGpkHKtihkoLGKDlRKW3q83iGlMrJrbRq11AQty7NSOPfm2grRkeWTW4W3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7535

Hi Jon,

Thanks for reviewing the patch!

On 21/01/26 20:00, Jon Hunter wrote:
> 
> 
> On 20/01/2026 09:20, Kartik Rajput wrote:
>> Tegra410 use different offsets for existing I2C registers, update
>> the logic to use appropriate offsets per SoC.
>>
>> As the registers offsets are now also defined for dvc and vi, following
> 
> So this is still not accurate because the DVC offsets definition have not changed.
> 
>> -static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>> -               unsigned int reg)
>> -{
>> -    writel_relaxed(val, i2c_dev->base + reg);
>> -}
>> -
>> -static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
>> -{
>> -    return readl_relaxed(i2c_dev->base + reg);
>> -}
> 
> ...
> 
>> @@ -619,14 +712,14 @@ static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
>>   {
>>       u32 val;
>> -    val = dvc_readl(i2c_dev, DVC_CTRL_REG3);
>> +    val = i2c_readl(i2c_dev, DVC_CTRL_REG3);
>>       val |= DVC_CTRL_REG3_SW_PROG;
>>       val |= DVC_CTRL_REG3_I2C_DONE_INTR_EN;
>> -    dvc_writel(i2c_dev, val, DVC_CTRL_REG3);
>> +    writel_relaxed(val, i2c_dev->base + DVC_CTRL_REG3);
>> -    val = dvc_readl(i2c_dev, DVC_CTRL_REG1);
>> +    val = i2c_readl(i2c_dev, DVC_CTRL_REG1);
>>       val |= DVC_CTRL_REG1_INTR_EN;
>> -    dvc_writel(i2c_dev, val, DVC_CTRL_REG1);
>> +    writel_relaxed(val, i2c_dev->base + DVC_CTRL_REG1);
>>   }
> 
> Looking at the above, I think I would be tempted to leave this as-is and not make any changes here to reduce the diff.
> 

I have posted v9 with dvc_readl/writel related modifications removed.

Thanks,
Kartik
