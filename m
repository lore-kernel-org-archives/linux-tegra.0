Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792622764;
	b=Hg7qX+yDQOCazBKdxcOXLsCpK+FzFzqhZyhq2aYnP9DLc5RHX+GfnPo2cuTXMi+9ZfZk
	 R8GcXw3OMxnJbLq2Yh5EgC7g/yPtiWP8IWvejIAPWzqw1QbkYwNvuxVM5bd1Gia3JJB4j
	 7RF8ZWEEQXwE8QVMOMqvY1eJYEc5JSsLsUYK5QmqpUT971N1QJVf8jLhCinnue7EupdNn
	 55UdLr74nfEPEER7WLfa28aP/NY+/rtxp/3cZEoYKk+3ij7cUmXP8HohCy5aCqaVDm2CZ
	 gkfBINLt9aFipEfi5XCfKgA+ETVM5733QeUhq1C0umdC8ow9j6Ctbg0D0xmoIb+n7+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622764;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Om/cyFKVxjAalj7/03kVu2JqpVs2FrumipmAPz7KcCA=;
	b=o4JaZMJLTW/FF6ACQZS3q6QzgVAa5pea9RkWFDrobJuOY67QXvQo8JjwUNarprS+iGho
	 PNw/H279u8bpEnXeImTeHJkToSQBWhIu1HCRwFtSzQXoXC96JjNUsJ6Ps0i1ZFpkl4BiZ
	 Z3ZswR+/5C8PBWLf1LqDqhVppg8NXPYJ7opqBL/R7byUfMY4gRdQt8/q+YMZNB6SNEH9O
	 x3FNrGva09b6oE6DrvzVN42U/9NIx5fR8/obAy0hHpUVowspZ6Mrzzz3gBKT7wC/Q9HEs
	 Iy5nRYMnCRQXZwMDFOsVwMml3S1n3ihvXtFIiKe1QoSYoW1UC/6VqtxB2nrnY5ymT6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Pd0Oz8sG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.3
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011003.outbound.protection.outlook.com [40.93.194.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27358606A319;
	Wed, 21 Oct 2026 22:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27358606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Pd0Oz8sG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8udxjCz+GdwFjCmTacIZtfoYpSjRoAHqcnyoh8R6UNjqYiz06bA+OjybkNt/XtIzpVCtf85H9SJjgO3dQJzFoOxR+ZYDj+IeZORVm6IJCzbcozS3FgYXoHT8ElhNCK4kJ4yegmFCSLBRDSUkTiM7nYgKUKc74ywAQbeqL3UdHhp3qMopkOg72VyBzX3hNVnCsxayXJtR6C+Rl1g0h4vb36Ix49YZ/Q9Wu8FgVGt/Ag7ZmbjqAAYSy4cb4rMt+OyFkOf245UkXrpWS0OyIR2tluz6vBgy+qO2af5I9lnpi3VUDH1suWcBd7Jh2dxvlTMJQKcpFvMAtWS47tE0BBe9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Om/cyFKVxjAalj7/03kVu2JqpVs2FrumipmAPz7KcCA=;
 b=rtMlSybu/16/nqB0jRZ01veKjgahh3g8N9LPwEvt3fDXIOZ697wiaFvK8VMAUDOrJFOtHtKgBGjQ94v67oPWaARZe/FA2qDNSPywobQ1IQd3ZFCW7EFDrmyih8PyR/33dEp4VEKF+97IoJKFdxKzlShSNvvGJrO623Uta32udIuV3WvfvLQvorZz4zV5QhGHk6ffZ6cBt4m4HNAeFOZ2hsVZtcP/kFPUaD5FChOdx7wjLfqkyJ4/scXG5iPX1s0pM18Bu5p4cKvemXsE7Owc5d/GuqFLe8eE4pNmwWExVl5d6+C9JRxfIoOU6TwNRVp4GHtk8kkki9XcAU6qRVyJSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Om/cyFKVxjAalj7/03kVu2JqpVs2FrumipmAPz7KcCA=;
 b=Pd0Oz8sGVK7J76yXO2d7nM9/X/a1Y8ETBAEdW5l+7Z40YLcoVEjZYVcb3xeNIkRcsExwFPpJQM2g7d3LzULe/9pSXbaJbYLOrfmDGE9iw4I2ivSh78yyRs5rgpTk+AunJEDR5wHNlxVZq2d/Wz/r5vw226MJfRxpy3chf6SYqf0rhQXtxPJkwTAVcJxM8M1UkBjNes/M6bya+kNeicbC9o3zLTi0vxJux5HV3DOM6g2usfLDp0reiKnNR1PQIc3jgOjeTGh5TYjsHdX6VglrkrM/vHPMAefIz/X3/eBbBsaJi840tTtccbIK+a/5tEEbtvkFocIPlsubJzYQPKgkYg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LY0PR12MB727857.namprd12.prod.outlook.com
 (2603:10b6:408:3ba::5) by IA1PR12MB292992.namprd12.prod.outlook.com
 (2603:10b6:208:5a1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 22:46:01 +0000
Received: from LY0PR12MB727857.namprd12.prod.outlook.com
 ([fe80::843e:82cd:41ca:f522]) by LY0PR12MB727857.namprd12.prod.outlook.com
 ([fe80::843e:82cd:41ca:f522%5]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 22:46:01 +0000
From: Srirangan Madhavan <smadhavan@nvidia.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	conor@kernel.org,
	jic23@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	andre.przywara@arm.com,
	aneesh.kumar@kernel.org,
	Souvik.Chakravarty@arm.com,
	treding@nvidia.com,
	jonathanh@nvidia.com,
	bence.csokas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Srirangan Madhavan <smadhavan@nvidia.com>
Subject: [PATCH v5 0/2] Add SMCCC cache clean/invalidate provider
Date: Wed, 21 Oct 2026 22:45:55 +0000
Message-ID: <20261021224557.1827361-1-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:217::6) To LY0PR12MB727857.namprd12.prod.outlook.com
 (2603:10b6:408:3ba::5)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR12MB727857:EE_|IA1PR12MB292992:EE_
X-MS-Office365-Filtering-Correlation-Id: b5fcd8ba-7f9e-4062-3965-08df2fc514c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|261021121427099003|56012099006|5023799004|11063799006|261009223027099003|18002099003|10067099003|261021123027099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	G4fy5mG0iPP7F2a1q3YH6UubJdJ1gB38CkOEXqqSgkSwgmdKbPsvCRFsHzrMMErLpf2K/1lr+BpseDMCMGIQ3e+iCYNdC4QFxf9yJKYvh3+C4MXj4fm/ycsc0y23u4GMRNunOyuOYju+/5ph5yyzxI5aWp3WpOG8zQwccu4jMcxJEonx7/IBKak/bgf3AaVsKvqpWpBSXOUtVLtwU0kv9IMu1SstQiBh82sXwbmi+6sbIVF+kuRJ/R/ND7nkfRbYytM3ATBYiq8P9D+En2xYRea/qVu9cZ32VxNHkC1dE+oeiFUzS3UU3k1RpQMM3OVRPlzjuvPOYk6i3BIgmFMp7sM5wKwcHNB/9fyTd9iNb7KVP4BsDQQJa3Mqo4p6hB12VaPbqZeYaxXiN/utKtER7blF6teD+8Fbb+2Jn4kZsr5+FnFWT7J+lKEFIfaMROca8KQwHY4Cn44imQekOf9s+u7fPyDoETuljZG9IcxoQBWLc2n/inbhXXi8nmzezkr+40JUSQ8M5huD/jA1R0BGZ5pwpFwnQOl0Hm9yCqXUCI51kIfnloB79CyNC/+Q6NIg83zLP+Nj2cpZwzWKz0TRTspU8VjzK22Vog0XWT1/vbbriMeja9KO7vfpBDBdcziTRXprgwRZke4QHJ/B2S/iv54GIF3PfPfGozUXZmJ4O7Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LY0PR12MB727857.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(261021121427099003)(56012099006)(5023799004)(11063799006)(261009223027099003)(18002099003)(10067099003)(261021123027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWxlWnEyTHM0MVo2Sk5CQTdkYW9lajBUbytVdk1PcEFXTXNmR0xxRWJTY1lW?=
 =?utf-8?B?MTNTdi9ZRWdUUmpXTzVqRDdVdk16NmhsZHZXZ25XQXdXd2QxTWtrajRXZEEv?=
 =?utf-8?B?NTlJeWFMNnZoanlkNHZZV1lucm03VUdGQTNKdExuTjlxc1lwL01yQVlBOHZ1?=
 =?utf-8?B?QWVaZXNZWlZySDY3UmVYRGJVWWFpazhBMmdWZVhxdENmTGZMSlQvMEZwdTJ2?=
 =?utf-8?B?S0tBZWpkeU85LzhLNHJPR0hyTXBGeWFNV0V5TXpKeHA3RnFzenJCekJDUlQr?=
 =?utf-8?B?NGNkNTlmeGtqYkFZZm5CL3Y2SUVXQWdjaDA1SERJK3RkU0ozY1FKdVBSSEVE?=
 =?utf-8?B?OHFmbGMwdkpvOXU1aGFFK3A2N0hCNjQyZnNOaGdqaDZHeFhqRFRvdUhGMGdu?=
 =?utf-8?B?MVRHL0xMcGsrenBGTUpyVmtUTGh4ZlVHVHNXelVyb3BKRnJTaVlhbGlLZm4x?=
 =?utf-8?B?My9wVEE5SWd0bVlDemhwRHBOejNOVDQ3Sm52aFRDQnZINnZjN3lzSUVwM3Nl?=
 =?utf-8?B?T2ZraU5EZ3ZsWlFZSTUwMGhPNzhCZm5LN0tpeEE3aHFrUDFmTW4rSHVJc29W?=
 =?utf-8?B?TlVoR0txRkZKT0hXeXZqYzk0TXNlU3pqWktlWHloYVdZbGRHT0tDUjFhcHV2?=
 =?utf-8?B?clltRWJrS3A3QXdTKzhoL0hJZ2hLRVl0eWw3Ujh5c05PU1lzME13SW04NXBH?=
 =?utf-8?B?NzFEZi9ndDc0NjlnTHdQSG5VQkhwaHhMd1QvNmozajlnNFpFelRYeW02RSty?=
 =?utf-8?B?YjhDb2g3azNZTjltb05WelhzbGdRdVhUcTFXMG1nbXZWSTI2V2J1QWhCVXRH?=
 =?utf-8?B?Y016ZGFlKzVGY3BzM08wd2VGTzNPMVk3MkljaDNRQkZuMUkySUxvU2g1VCtI?=
 =?utf-8?B?V3pzS3JvaS9QWFYxRWVQMmorU1ZzbnZUVzMwTXlJcmpXMitHMnFBMzVRRXNY?=
 =?utf-8?B?cWVmSjRRcWxSRjJVS1lKaU5CeUZ4WkZucm1qQkRYVnRxbEZIN2lYY0pnd05Z?=
 =?utf-8?B?TnZ0eXU3VHM0T1psa0Z5TGxpeDVOZ28zUWh4S09jQkN5OE04Uk1UQTRMUzJm?=
 =?utf-8?B?WHNxcEdqcGNYazVqeEVsTFhvdHNyQWcyOUpiSll5R1pGckovWmJsQUFOQmRV?=
 =?utf-8?B?V0dpaVVRcFdnd0ZDazJocXNsNDFqZVRXa0FWZEUwTW13aU40anpRSU1YQXNU?=
 =?utf-8?B?dm5jdm9OTENyWGtWZkRtTHJQNUZ0L200Ny9kL3NMNEt4UlZvWm15bldlcUVz?=
 =?utf-8?B?c2NPdjhNNk03M0lVd0pzWWhpNVhhaEd5ZjNsUlJ3bUlQL1hmU0xPZjdSZDlp?=
 =?utf-8?B?QlpLc0duSng4TXhYd3VaYUJFVDYvQkJkRGs2RVI3c3FhZ0R6VS9ZOVJWMEMx?=
 =?utf-8?B?bW9zc21McFhoenllak5OSmxRN2JiaXJSKzV2ZTA3bDdaVkpScDBacEFCWFdv?=
 =?utf-8?B?UXJyb0VLYnRPeWFpck5aWUZITmFKOGp2SnV4QzdnM0RleWdveUw4ZHYzSlpM?=
 =?utf-8?B?LzN2VnB3d2FhNXl3bEpPeW5ieGxUZ1EyaGw4aVJ0SUcrZ2F6RXlwWGJwYi81?=
 =?utf-8?B?MXpBMzNhZGwvMjFXS1VRaHVZMVN0Y3JIWEZxdW9SVDFBTTBLZjJ0NWJocklu?=
 =?utf-8?B?aS9hVEJmUWNXbVVCeDhONVB4UlNUUi9PQXpFNkNPNjlUZ0lhRlVTNVNWVFVW?=
 =?utf-8?B?M2xzN3NDbW1qcUFBazRvVlZtdWt3eEtOREtVNU5XL09zSThNd0pEOWhPdVZk?=
 =?utf-8?B?MzdkaWpSOVVqdmo3a1p5MDF3TlNZaTQ3QTRYRFpaeDZ6YlJocEtKR3VIaWhK?=
 =?utf-8?B?VDQ2Q2Z5WDhpcWU0bm16enVFUkV4TXY1Vy92UmhSZkYwSWMvSFBITjY5MUYw?=
 =?utf-8?B?N2ZDa3QycGFYS203aEk0aWtuUWFaRDBZMFRDN2xPYXRqYTNtb2kzc0RHZkN2?=
 =?utf-8?B?UmpROWVyRTNtN0R2THpLRExOQjE2MHcvRy8veFFKREtLb0EzV2NFYnV6ZmNz?=
 =?utf-8?B?ZU1XVzgxanpGUUp6YXRCd2tvUHZnRWVBNFVVRE9qcTRtQWo2TGE3S0U0Wm13?=
 =?utf-8?B?cTd6UTNnTEFaZys3TUkvbXdlVllOeUVCN2RCYVlpWE5rZnpkaGxoREwySS9x?=
 =?utf-8?B?UWI2eVhYWHdQeDNSMmo3Z3JoQ3hSekJYMFdNNUdRcVV1M2dHbUNWR3BqLzRJ?=
 =?utf-8?B?eWNHSUNoNUZyb1dxdlJKL0pja082amRUL29ZRWxEYkt5UW0rTmpuVW9NeVRw?=
 =?utf-8?B?ZVU1dSt6bkh2cW5ERjZnTzZ1anFKdzU4T0lBa3VFVHM1Q0JOb09KOTc4N2RJ?=
 =?utf-8?B?aC91cGlsbkl6YkFXVzl0d2lQV2tuYjl3US9Ob052OFdCRXJqY2g4Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fcd8ba-7f9e-4062-3965-08df2fc514c7
X-MS-Exchange-CrossTenant-AuthSource: LY0PR12MB727857.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 22:46:01.5123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXCMw+ldRPJrk4AubM6CbwZIsF+HyxJUNiEmk5u1xdW/VnPsdmn4+AD23jzCMlGef8uIIxAO7Ekz1mjBfPXAbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB292992

This series adds an arm64 backend for memregion cache invalidation users
based on the Arm SMCCC cache clean+invalidate interface.

Per DEN0028, this interface targets systems where a Normal Cacheable
memory region can be modified in ways that are not handled by usual PE
coherency mechanisms, and where VA-based CMOs may be too slow or
insufficient for large ranges and/or system-cache implementations.

Representative use cases include device-backed memory state transitions
where stale CPU/system cache lines must be invalidated reliably (for
example secure erase, reset/offline flows, and dynamic memory
reconfiguration).

Patch 1 introduces the Arm SMCCC cache clean/invalidate function IDs and
transient return codes needed by callers [1].

Patch 2 adds a cache maintenance provider that:
- registers the interface attributes function as an SMCCC device
- binds to the service through the SMCCC bus
- registers with the generic cache coherency framework used by
  cpu_cache_invalidate_memregion()
- handles transient BUSY/RATE_LIMITED responses with bounded retries

This patch set does not add a software fallback path; when firmware does
not implement the SMCCC cache maintenance interface, the SMCCC device is
not registered and existing behavior is preserved.

The series is based on the current SMCCC bus topic branch queued for
v7.4 [3].

Testing:
- With corresponding TF-A support enabled, exercised the cache operation
  path through CXL Reset [2] and verified that it invokes the SMCCC call and
  completes the cache flush successfully.
- ARM64 defconfig with CONFIG_CACHEMAINT_FOR_HOTPLUG=y and
  CONFIG_ARM_SMCCC_CACHE=y
- W=1 build of drivers/cache/arm_smccc_cache.o
- W=1 build of the ARM64 Image

Changes since v4 [4]:
- Dropped the firmware latency attribute from the retry backoff calculation.
- Used the explicit cache attributes function ID when reading the firmware
  attributes during probe.
- Added Jonathan's Reviewed-by tag to patch 2.

References:
[1] https://developer.arm.com/documentation/den0028/h
[2] https://lore.kernel.org/linux-cxl/20260902072804.665639-1-smadhavan@nvidia.com/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/smccc-bus
[4] https://lore.kernel.org/linux-arm-kernel/20261013070205.3566865-1-smadhavan@nvidia.com/

Srirangan Madhavan (2):
  arm64: smccc: add cache clean/invalidate IDs and return codes
  cache: add SMCCC-backed cache invalidate provider

 drivers/cache/Kconfig           |  11 +++
 drivers/cache/Makefile          |   2 +
 drivers/cache/arm_smccc_cache.c | 156 ++++++++++++++++++++++++++++++++
 drivers/firmware/smccc/smccc.c  |   5 +
 include/linux/arm-smccc.h       |  21 ++++-
 5 files changed, 193 insertions(+), 2 deletions(-)
 create mode 100644 drivers/cache/arm_smccc_cache.c


base-commit: c6e78a4080a3b310a9f61db778d6dee7bc646cb7
-- 
2.43.0

