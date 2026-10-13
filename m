Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011023.outbound.protection.outlook.com [52.101.57.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564373B0AD6;
	Tue, 13 Oct 2026 07:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874935; cv=fail; b=HgKDLVjMQMbJqhnb7p7nlfSGRJBFswTGiAFZo0XLH0USv88nFoZPQWgakh5t/k5YoUpd15Z6bMAuEEQ1q04jyL0euHbXHpX3l9vckQ6k+p8lAl9TGY5GQe87rRGMmSxyVEc9s/Gqxm0ZM/jKr1WmZCkpVcNbctiBlPYA7I9YUZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874935; c=relaxed/simple;
	bh=vDNJIgWnruePL1E/y2zXkzSZ5a72uqQcqKxquZjFyQk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nC2hzq5zyYtvHTGRzvMXRCEHcXHjGIoUey4O3UZm0mLAwjSdvwDGr1aydZxkqR2UZXqic0CxzCseG6JvNGJ4AnC0q1MaeW2OWTuHkCwzAfEAmzk12EsMmz4Fn0trWEosq9xEMD68mzDfNkTVsww0QYRx3Znnq+VGgLkkIfFojrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WmY70vDk; arc=fail smtp.client-ip=52.101.57.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WmY70vDk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nputcfLeLIjJGhfz4c1ltoLjS6Xbb+okVJzW+qDX9m6BGHwyu6xpajccqhTQlbziONeV/rs0nWQwBTHB9GWtfD6gN+U75N/Vw+NuJIGquA+xfKigzVWl8+nRm4tFj2HICicdGR5sGqY6FjjCxQahhFAEAoGrdCEtb+/OyJxGcZVx33zHWjs68mMUATHK7oPJwdDDCz9gI142rS2FJ8wno47YYgJWNF6x4lrijMuQlzv3kFUFgKb67lyVuwRP2tbn3HpIk+Zztk3V8Ad3LLLQcKxHsKURXO1R2b140+Qv/B2SRTw4gOQYsUGoARI6Ol80gVNfdDNC7CI7obP1/WMe6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlJOMcxW9ZrlwWT0lPMOPWXSHtzr6xFkCMhjWue+wXc=;
 b=gbYaCxaJHuC37STSS4ylLezfaKMc7j2PNxcdaSf39dmKQiF1UFNOVVnpDjvAVJetSEe1re6FKz3AVbwRx4tM/8ACIye+igvUX676OZ4DCCRaqabcaVRJWC2HFs10BHPY15t12drEkIP5U27G2Ew+gBTDltDl3+gFDRSnGs/GGfa7fGpGwhoCDpLx57oBOEt2s8sBjlQ71RW7azd/pByT8fPHoMkvBmn48iE34ZsEhnWDkTe/ft3k8Xj4uFMlW637bBZahvcQ2rpv5t/fnqzYvwPsEBF0gYElL6vtBFnVHLwYBRObj2hGxrAfRS4PTTVneQH8yyenZ4TeK1FnTBOeRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlJOMcxW9ZrlwWT0lPMOPWXSHtzr6xFkCMhjWue+wXc=;
 b=WmY70vDkFmap7gt5FSeNgdyZKp6JYCK/ORNRGi2SuRYMssYhYx6GCUc9z9WVJ10XO4WL1HsLo3Ed/zYeeq0lh5p9aUW3y9SRL4MZ9n+Cl/mvWS7WlWgY0b/pqrB/HxV70KmPTGWQTZmuZaTyEVR4QHaoNd+iarv3uJrOO6H1JuXOd01ljGhI3DmTkQgxKu+DUdol/kXfWM/ou0m9kDbEPHXVEfvlBylrEVEjcJmxueG3EDuOlL/NeX4BN1TmOGlQ3xWT8HtXrUqNBftJCcn1/4pcs07v5kk5/n6I7zA4RKrkc8Zd0EhIXF5cNp6Eog1aGpUSPhaG1nuZU/nXKbOd1A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LY0PR12MB727857.namprd12.prod.outlook.com
 (2603:10b6:408:3ba::5) by CY8PR12MB7416.namprd12.prod.outlook.com
 (2603:10b6:930:5c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 07:02:10 +0000
Received: from LY0PR12MB727857.namprd12.prod.outlook.com
 ([fe80::843e:82cd:41ca:f522]) by LY0PR12MB727857.namprd12.prod.outlook.com
 ([fe80::843e:82cd:41ca:f522%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 07:02:09 +0000
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
Subject: [PATCH v4 0/2] Add SMCCC cache clean/invalidate provider
Date: Tue, 13 Oct 2026 07:02:03 +0000
Message-ID: <20261013070205.3566865-1-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0058.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::7) To LY0PR12MB727857.namprd12.prod.outlook.com
 (2603:10b6:408:3ba::5)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR12MB727857:EE_|CY8PR12MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c2ad4b-5f4f-4b48-cc29-08df28f7e636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|10067099003|261009223027099003|5023799004|11063799006|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	YqhkmNDXSItcIv7E8BXP5uswE1jISk4R1uGFs7OeyIjhp/IkIhzzyxXGHew+Cfu+NGnvh7CSsMr3Hd+CX+y/XjgAmuzSuYSErnuKkOJ9OG6/us6un2eROyyHFo+JWdzmwaTueckh9iaaLXWU2YDePIOXA44igugptj1aGafdocVvW0XTtqYbkH2K+KR2bHrwEFRKgLixr1d5Ik6B//hPHYpUQMqemaIyNV78tAHmuIMABv/H/s8VmNO0jcYX+RwpGyD3KMvRJyiGwxSRa5wz0QxDd+1KQ2WFYs2IRgyLlGHhQRjG75LoJTYT1wMfUQiYGOEkNraZ+Y7dmON/xNoNaPFpT8flEWKAgk8tjuxCjmuY611nOmooatNMY6x5s7P+mnd6jCPo/DLoERyv14k/SQ8nT5VQ3RLTM4OLM1cYrDJO7C+1zoGUoy2CFhvqDuxCsGpsHZUxLtzQmB4qRXUsbSFcSlVHfeV4zklNQnhY62h0dUd7sK0YQRh7qZXLoNL31xxrbKpP2TBKGJ6YmLBykVZNOFCVrmCx5aZw1kvrerAxrioTLmPgK3w1yNqd4YJ0ZDKelrc5MN3CQrpz7C47/p9Exgcp5C0c72+1ro1lQw+Kve/ADaWr5cq3i8n31wsi0EzNBdhKoL/cG2FYcrU8vFrcXjvZfdkSKrKOigcJdfg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LY0PR12MB727857.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(10067099003)(261009223027099003)(5023799004)(11063799006)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVVqODRGbDhMVGtPMkVGS3FjRjdmZHJrUXF3ODdJeGpMbFRjV0R3TlIwd3VY?=
 =?utf-8?B?YjhRTnpESjYwWmZDTkQvUG12OFRqRFZNdlRuU2EyT2ZlQ1ozUHF1NHdiZ3BP?=
 =?utf-8?B?aDlZOFp6UUJRV3A0aS9YelZCdUlDcnc4aHpuTzV3M21vS01wa1Z2ZmErelJk?=
 =?utf-8?B?b0RYSjZjV2lMalVPaHVJQ2NSQ09pUGQ4MkYyZnRpKzVibnk4eEJIditheTkv?=
 =?utf-8?B?d0lCRktqYTN5RUkwVFNrRmhUQTJnODNwWWlqOWU0QlpwWHBkYUcyMUJPQlFS?=
 =?utf-8?B?WW9yb25wK29vSWFyRlVvdHFXNDcrcTR2bFVnQWZBcWgreUZJMHVPWkJ6VUZw?=
 =?utf-8?B?TXlwY1J5eDYxdUUvb2dxUUpZQ3FLRmx2NVNZQzVlbXQ5SzZKWENQNTZ5cERC?=
 =?utf-8?B?eXB0Q2czaU1HV2luL2Z2K0tOQXZTVjlOd0ZlSUlleDNCYkprZWhENnZld1ZG?=
 =?utf-8?B?MGVud01Wbk1HejRxQXYzSDFteTE1R0FrU25YeFdmWjJkelcxeUdmZldQaThY?=
 =?utf-8?B?TUpXaFZoRG5LYkhvZEwxSldFc29EM043RW9JVE5MY3kyWmlLR3AySkNXQXRr?=
 =?utf-8?B?bEFqQllWSURDVDhIRkx1Y3B0b0k4ck9TL05uQVhWNWJJRTREMzVnVnRqYVFK?=
 =?utf-8?B?dVR1UEQvTVBPNlkvVmJEc3BmdmxORHhHQzE1RzZSalFXVUwyNVUvR1JXT2lV?=
 =?utf-8?B?M3hLZVdSS0M4ZnBXd05yTWFVQUdTUzNRYTFadmFmckxYUU1OemNjeUJKeFNI?=
 =?utf-8?B?MjZiNDBLTHJMYlV2c04wZkVxZ2hhNHFaWGczaFordFZBRHVSK0NQeVRjdmxu?=
 =?utf-8?B?bmtYa3ZTZDROek40RGVXVGxXZjJYR050aVZYUkZJbmcwMkx0V2pvekd0cFhs?=
 =?utf-8?B?bm5rVitucFpRampEL25PM2thWDhPUTRuemM1RytwdXIvUWo1ZDE0RldiUFJj?=
 =?utf-8?B?MlhTK29Pd1hqUDN3VWFNc21nVHNqK3RZV083cGdCbzRpZVJKNlRWcEJweW41?=
 =?utf-8?B?Y3RnSzFLdFVEVzVMS2FvdGROVTk1dk5ZRnNLaXptY0hMQzZNSW5MdnlOcy9j?=
 =?utf-8?B?eG5FdzlpNDdKOGVjUEJyd3NVOStUTlduT2pHNjQwSE9WMXVkeXZFMFN0cnha?=
 =?utf-8?B?MlN0M1pCcEVKWDVVdE5KQkJUNHViRktpeEJwYmNmSU1wYkdtUGtEcXQyUlor?=
 =?utf-8?B?Z0wrVlkwTkxoQUh3R2dybGdwWmwzVVVhbzRTYk9kTDBneS95bk9nVGRTMWtr?=
 =?utf-8?B?Z096S1pEQ1dRUHJNckJYN0t5TXpxYjdhL0tXemo5bWxZMXhBZkJ2N0FOZHJL?=
 =?utf-8?B?c3BqdkZBS0ZWckk4NkZJczBUOGx1cVhPaGU5UlBXOE5uUnk4ekFObEV0V3dW?=
 =?utf-8?B?a214VysrditDMTVhNndTcHlqcXpJQ2xvcyt3dlQyT01BaFFKL1IxLzR5QXJa?=
 =?utf-8?B?MHZLZGRXOWxFeDZ4dTFZdi9NQTc3M3JUclVkNHNOMmVJUnNRZHhieUhySW90?=
 =?utf-8?B?ZlhmeWxMcUkxRFA2ODI2MnIyRlBON3JOU0J2SlRqTjY3ZnZ6QlE3SnRDWnZT?=
 =?utf-8?B?cnBXMXYxVjZTMXVKUDhyYlZCampGUlFSYmdQWmpObUtrbjZBem5OV28zcDVK?=
 =?utf-8?B?R2c5N3pDTW01ZDNZT3BOZ2daVUtZaVBhKy96UkFRdVpFQTRQOGdENFRaeXFl?=
 =?utf-8?B?TVBCcUlGMlF3dkRZNWI5VW9ZZktSZ1hvSU5BYzJHUUxRZldrWElLQ3Via1N0?=
 =?utf-8?B?VGpzd25xKzdQUUs3NlNWN3hWblVFc3Fla3o2d3UwajFHelVwcjE1QmlTcHJo?=
 =?utf-8?B?dkdCeHNsbVd1ZTY1SktGbnpKYW5vVmtOZzRFa01oRCs3bGVrVXAxNlZONW5G?=
 =?utf-8?B?bDBSU2NrK3J0eGxFNHo0ZXNyS3VKZzEyYjdqc2pxMmRmZWxBWCt3YWdtU1RH?=
 =?utf-8?B?Sk1kRVFUUDluelB5RDcwaDIvWnNXME5iL0ZWNnhwODVoeVcxbFY4YmVwa2Zw?=
 =?utf-8?B?R1BLZXRWc3JJOEZXRWhabm9MbUloNDUycFk1SERENWdURlFlaENjaERGT2JU?=
 =?utf-8?B?Z2trU0I2bHZ4RDVuazVCdHAzQk9JVmJPQ1QxRHgxNnYwY1pwNW5xTG1UTmlk?=
 =?utf-8?B?czgzSUZkS0JEcVN0Q3RlekJIU2VQU3ZMZHFCNHdiR0swN0l0V1RpaVVPS0M3?=
 =?utf-8?B?M0IxV1RrZm02S0tQOXZrYitoalpEZHdzNGtTdGFwdEV2cEtJbDdrb242RWtQ?=
 =?utf-8?B?WWljbW53b2ZxRDFOZGVFWTZXVGFMSVdUWlM2QSt1d25RK2w4VHhScDFMaDQ4?=
 =?utf-8?B?MHV1VXczek9TVU9yalYwVjc5Uk1UditGNkYwcERwQ01xbURVd0tsZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c2ad4b-5f4f-4b48-cc29-08df28f7e636
X-MS-Exchange-CrossTenant-AuthSource: LY0PR12MB727857.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 07:02:09.4946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nyEHV6UrkSfWO59MsNHg07Fh49QXlPpLRbWYaQB4s4MSQ6LAzIi8FMzXI1xIHgfFJcLRQOO2WCKqgOMA3vBMwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7416

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

References:
[1] https://developer.arm.com/documentation/den0028/h
[2] https://lore.kernel.org/linux-cxl/20260902072804.665639-1-smadhavan@nvidia.com/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/smccc-bus

DEN0028 v1.7 has since been confirmed as stable.

Testing:
- With corresponding TF-A support enabled, exercised the cache operation
  path through CXL Reset [2] and verified that it invokes the SMCCC call and
  completes the cache flush successfully.
- ARM64 defconfig with CONFIG_CACHEMAINT_FOR_HOTPLUG=y and
  CONFIG_ARM_SMCCC_CACHE=y
- W=1 build of drivers/cache/arm_smccc_cache.o
- W=1 build of the ARM64 Image

Changes since v3:
- Rebased onto the current SMCCC bus topic branch queued for v7.4.
- Converted the provider to an SMCCC bus driver and registered the
  attributes function as an SMCCC device.
- Added an explicit DEN0028 v1.7 reference to the provider source and
  patch 2 commit message.
- Dropped the unused tools/include copy of the new definitions.
- Replaced the catch-all linux/kernel.h include with the specific headers
  used by the provider.
- Added Reviewed-by tags for patch 1 from Bence and Andre.
- Dropped the review tags from patch 2 because the SMCCC bus conversion
  changed its discovery and initialization paths after the rebase.

Srirangan Madhavan (2):
  arm64: smccc: add cache clean/invalidate IDs and return codes
  cache: add SMCCC-backed cache invalidate provider

 drivers/cache/Kconfig           |  11 +++
 drivers/cache/Makefile          |   2 +
 drivers/cache/arm_smccc_cache.c | 161 ++++++++++++++++++++++++++++++++
 drivers/firmware/smccc/smccc.c  |   5 +
 include/linux/arm-smccc.h       |  21 ++++-
 5 files changed, 198 insertions(+), 2 deletions(-)
 create mode 100644 drivers/cache/arm_smccc_cache.c


base-commit: c6e78a4080a3b310a9f61db778d6dee7bc646cb7
-- 
2.43.0

