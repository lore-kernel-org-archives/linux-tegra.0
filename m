Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012001.outbound.protection.outlook.com [40.107.209.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46A03D9027;
	Thu, 10 Sep 2026 08:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028520; cv=fail; b=hptuJDbz7ct4PjGUgAojHUPlUSPXbUt/v7/TRpqLgLngyn78S54h+OZlvYqPC5u+jqXeEoSDcPoXKtrvDY8tyK7m6VFwwb0cEVc7TWZOwCiO5MlJwIFox91auE8IPbuINiZMij+l5NKCYLtq1O/h8Ol/laIiLmItP6ZdaAEdjMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028520; c=relaxed/simple;
	bh=uLkd8illXDaYwefV0bQVebUSVAp/2gSFwr02OHv8W3M=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gX/UuMXJwW/dsFrGPJt880zlds9G/46pseXcOSUtIzAjaTiQ4BA0pMUCOU88mqR1bBAZly/rSOLC98iXNAwkIBPlcCc7igFaofpT/wrXKVMC8KREw5lmuEIGYqBa4t3oYGDmDWLwqc+IxvgBi97yQC1h41qHrqnO37b8FDhSrPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qsgLf5Gf; arc=fail smtp.client-ip=40.107.209.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qsgLf5Gf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpUojbwMg8SRzqnWtgpt3VH6jTjJsclTOOmcm/4SgBfqMNMZCLuQMuJmwoHOkN/qKdiZhcVjzq7rDgnfN5jU8kK6vOP6/kRvkRsdICeWklQaYjBufqRkNFbqMg3UfhNlAGnXwUuKUCE3Wadpkebn6sjj3Lrf6ON2b53y+eX+csdmZxNyWDAV7D523pCJ/JqKR6Z7P005/zIGsDB1kgYakuG0OYK+qBq6xG9SaKYM4663N0J7luBl0PArxcipWAa4PrQGXDV59xu99NeI7+tlDMePBPDV2YnbsiFrqJPujNRRZU7TZOhEMZ0Cpto2IduIYS5+KI7xFAfJ+Tl+ugW3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpE57DvSH3PC4qeWGdx3qPMCHgxOtC2Me4g0vUMdSVE=;
 b=LJD85EHw6ycmZYRuqYw2M8699Zku2WlXdjX/s2kw1xelGLiOHlSX3i/OA5cNauFp3sGdx/tAVXUv/KpSGmC02qTLSfP3+YHNUmk/blgsbATKwfgrheTGwjrngQbqbgckGzBF8R92/i9NtCgTrKprywp2Cz92UVas6wthjge9+6qIlzH2pMjZnEwjHNNPylbJG4vjMTADb7fbbu+dG70acvrc01p8vZLNcsA4Xj2B9AKBGGy18Oh16RyKzyvMqkWwuY1wEqBFHG3PKaAXrzjLwki7DZtIwnsgbgS0VJBUDAgUqdfkzo96WGF+x3Zit6fye80I+/pWmnxJGT4PmQpg0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpE57DvSH3PC4qeWGdx3qPMCHgxOtC2Me4g0vUMdSVE=;
 b=qsgLf5GfXhUhH3HSyZidvOtRx+RL0pASkLivmnEapqaTqRxLzGsyKHBcFQlfqD8/ZQearidhmbWepa04mU1w9afn+u9Gmm/LvzoT0ZIizioGFJf1JfKfhYorYovErSOn/Z8a4u+l98mBqwnBxG4p3M0JptzsZOEfzoPE635NT4h12jtLLtd2tlbrPPQ0KbEWSw8ozy00F6IroR/P62vTEXzF5icq9Op6Bqvk8ayWjLA7pF5TEQqFcWpILhA0gFQN2E6iB5RS7N+Wc3TFES5SMtZqpFnzippEaavtQAaA3CUCoAYKGpQxD0zUUWq5z6p9fzxQ18sW6T1zlIT+x1Cuvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9474.namprd12.prod.outlook.com (2603:10b6:8:252::17)
 by MW4PR12MB7484.namprd12.prod.outlook.com (2603:10b6:303:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 08:21:46 +0000
Received: from DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7]) by DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 08:21:46 +0000
From: Srirangan Madhavan <smadhavan@nvidia.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	conor@kernel.org,
	jic23@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	treding@nvidia.com,
	jonathanh@nvidia.com,
	bence.csokas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Srirangan Madhavan <smadhavan@nvidia.com>
Subject: [PATCH v3 0/2] Add SMCCC cache clean/invalidate provider
Date: Thu, 10 Sep 2026 08:21:40 +0000
Message-ID: <20260910082142.1522865-1-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To DS7PR12MB9474.namprd12.prod.outlook.com
 (2603:10b6:8:252::17)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9474:EE_|MW4PR12MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d0ff0b-df8b-43a5-eeaa-08df0f148dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|10067099003|6133799003|5023799004|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	jOH+3YHnDjyN6eNDque7K1jdOHwlqzf0V2GH0qhTqU+UdIfMEOLeRfC2EhcdPCPGYEBz9LvKQjaW/mnFOsC+NeVQK2+RolZ5fNIQBbRV6y4wCVUW31OUb3rbo8hRzBz/V3MFrqidpg+mMTEeFN/woMLd8pRqR48jFgZYc0GULlYsthHrfW9dZcQ818sqMlwYCZMsnOpNkhrbE8krmiDCfIaeiZPAuNaU77U5j0gRlsJRZX9GOoG6E4InpN/jBVHxXeTErsYCU59a2CJ226tJTtoUuiAWYSiI4YbzCufW9cSqcSPfbM133UDH8oQhoVG8gHqEpWt7uqfmCTVNss99Ff1MMFl9HrTlll91MslqjoH6WKfT6Kc0tYEMosPQg+2ff+4u53bpNL8Uv83e9alQV2EIzfEc6tg1aQby1hDK97CNMXis1z1nCBD1zXQyI3+sMGgyMCx0Ne9H9+ZVJqjJUCtf3fY7tKRTCa5TQZ3Z2Sm6LEhZsnUaLymhebGyO10n8XpEiU+KHqYifIUqZIM2wmHBvw7m6HUP6NNWa0l8cpCN0meMLlJFjghDxkOTfbrNH1LMUVOw6bzOL5EbLrv2TZ7OWxv8U6N6+u2pSuzWyivMlzNJJkP3xO5CodGVO0GpwCBE5VwCH1nBKKx3QlXiJ3Q1xf6GUNmFoe5gbJ5M+78=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9474.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(6133799003)(5023799004)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BlGE1fGYz7VilXIzFHf93pgx35EBxMGiLFKyGb4tKbC+m5aHhJRYaGwKjroM?=
 =?us-ascii?Q?TJ1eIrSiw3F++MpkwbXhstpUHWBJdD0CclRdpGiW7DVqzntaBThbONa9nvCA?=
 =?us-ascii?Q?EygsIwvc9FTho+q+6MTYM23Mqgh9VENngLShbhdVHxbxngtv4GdgL+U2k9Lj?=
 =?us-ascii?Q?p1x2b+0x2dXGIHmQBMwNXu2Z228KKfdbRcKoPZkZ8SUHYFA8Pdl3OczqM65N?=
 =?us-ascii?Q?vmDAzybQjBGKxL9ozzpkCIWVRSir4LcjlAH77BTL8M9XDJTj5JKwgQeCF24R?=
 =?us-ascii?Q?mYXz+B+gsDMriPWbQj9hZYY8aV+I//wZMcUhLHCRqmnGcVtBlgjShjP8vn/g?=
 =?us-ascii?Q?uqwPjfFZwCaOO1oLEH1I+gUgMXpZIwmE7q9jyYpVjp+hkEXGBjyJsmzQU5/Y?=
 =?us-ascii?Q?4yVe4raKGrHdLo3ATr8kr6uBBTUFrwWI8fSTDvdkMLT/sq0UpK1s0ZQkeugD?=
 =?us-ascii?Q?a4IERBFNxn9ONrW7R98v1yARAbLTQwY6HLah/v9ErYaDQNUDTeST9zxe31I6?=
 =?us-ascii?Q?VRGx3zl8QSJnLRrVuqyOcZRhDJ7SOYsAKdrMU8eICfkjKP1veVdDfscFlVLE?=
 =?us-ascii?Q?3CdI0Y24atr0TIthWETIPC1604CsjIxkWyfKGwwyA0gi6n/ajhfSY7a2V6F0?=
 =?us-ascii?Q?kt4Fs7h5mVGCtzbaZBBH79N2PTQwiq6V8sj2rks2A521+kcHO60pfwK8Wuo2?=
 =?us-ascii?Q?1VBS/CCy6cBZRKsO7fw7ShO1bkLtz1AgeuKUksUDPb+wHSM+kyDXxLPqMleX?=
 =?us-ascii?Q?jSeyKcLeQAiLRZMOkBf1IDgBuJiHqw7DgkOoo1MSAHPYnU0gYaogJd465scu?=
 =?us-ascii?Q?wSvdch5ut7k0ucM4KqZZ3GW9YZ+3dedu7NsJ5X3VZEH9y3G6iyjNpIB7lu15?=
 =?us-ascii?Q?XwNznNk5kgGc7BbbyVHT6PO4zc5OvuopX+QuklKslXABDVY/q2f9g8TzfsIC?=
 =?us-ascii?Q?8JskBmgMdyMyfHlHWedVoJo2956htIj/uc/Zo4vfUMofjkmaPAr21JlV5C0O?=
 =?us-ascii?Q?pTaPDdYHq2/UxcgijPawT96xhlsSGK/CKAS/MDKYbcsCB0HdGNocL4E9Glfy?=
 =?us-ascii?Q?nGESP6UnAisE/fwvSp56QacPslnpzTgDIih6jqWNaUwVdfXcMWDCpGbmAoup?=
 =?us-ascii?Q?7aZdH78qBCVUi2oEjpHhOdKL71/9VWH46P/wpquzUkVG1eFzJTp693hPrn3L?=
 =?us-ascii?Q?acQGW8gs/5gF458F4UfZKyvj1ZhZLdfgXXXqIdv65KiDmxHYpzEClScpD3O1?=
 =?us-ascii?Q?c72HCaeI6viODPidKccxoh2KqGNwAO2KG84Fkz2PolSehVdye2j8wbu4113b?=
 =?us-ascii?Q?QHNqSoBnMd9ueGIOXWpK0X5Ym3uxZU9+gLawQjaEFqNh0NzSSjMNYpKqDEAR?=
 =?us-ascii?Q?lIN9ofZugzgL2zNYXxkdvnLRkYsLCe3517uTNJU1TTFT6eltHF9ghJoc/Bbz?=
 =?us-ascii?Q?4uWFpg9fKyaLqlOJFqPU7FKeOVFbjYvV6GqOvtcVUXVSwXBgBch4C6w2rVcr?=
 =?us-ascii?Q?rrN6Qnu/q6uEGTSjwY1yMYHh2itw54aUt1sjOzLtio4KfaIZWQR1CfgH01YX?=
 =?us-ascii?Q?J0YCr+rVuR7EWOGlL0oxZq4Pc26G3jMdCVI9EUFYcJ/41nv0bRa7TGfcbIvE?=
 =?us-ascii?Q?K78BJ4A4i/viNxYEh33LSA2bZjuonlGSi2MsPugPpX22Ea+OGmorNHTIzKvv?=
 =?us-ascii?Q?YH688vyb/SNuBr+SjipAWQz58j/4jhK8xhgnT1IKogsfpKDVLXLn7/vKDOWr?=
 =?us-ascii?Q?G9CpeGVIKA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d0ff0b-df8b-43a5-eeaa-08df0f148dde
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:21:46.5063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMUitchparqL5jUe3f185rt0k6owrIurOF4wOY3eggtSjzna88OIwHm8by+eyUZzzTtYzum0iTdDsSU2smcxyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7484

Apologies for the delay in posting v3. We waited until the corresponding
firmware support was available in TF-A. This allowed the provider to be
tested end to end with the CXL Reset series [2].

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
- discovers SMCCC support and attributes at init time
- registers with the generic cache coherency framework used by
  cpu_cache_invalidate_memregion()
- handles transient BUSY/RATE_LIMITED responses with bounded retries

This patch set does not add a software fallback path; when firmware does
not implement the SMCCC cache maintenance interface, the provider is not
registered and existing behavior is preserved.

References:
[1] https://developer.arm.com/documentation/den0028/h
[2] https://lore.kernel.org/linux-cxl/20260902072804.665639-1-smadhavan@nvidia.com/

DEN0028 v1.7 has since been confirmed as stable.

Testing:
- With corresponding TF-A support enabled, exercised the provider through
  the CXL Reset path and verified that it invokes the SMCCC call and
  completes the cache flush successfully.
- ARM64 defconfig with CONFIG_CACHEMAINT_FOR_HOTPLUG=y and
  CONFIG_ARM_SMCCC_CACHE=y
- W=1 build of drivers/cache/arm_smccc_cache.o
- W=1 build of the ARM64 Image

Changes since v2:
- Rebased onto Linux v7.3-rc1.
- Preserved the final BUSY or RATE_LIMITED error after retry exhaustion.
- Dropped the redundant feature query for the mandatory ATTRIBUTES call.
- Preserved the full 64-bit maximum-call-rate value returned in X3.
- Reordered local declarations in reverse-fir-tree order.
- Removed the routine provider registration message.

Changes since v1:
- Added Jonathan Cameron's Reviewed-by tags.
- Clarified the ARM_SMCCC_CACHE Kconfig help text.
- Added a Makefile comment identifying the providers that depend on
  CACHEMAINT_FOR_HOTPLUG.
- Dropped the final-backoff-sleep skip in the retry loop.

Changes since RFC:
- Dropped the RFC tag.
- Moved the provider from arch/arm64/mm to drivers/cache.
- Added a dedicated CONFIG_ARM_SMCCC_CACHE option under the existing
  CACHEMAINT_FOR_HOTPLUG menu.
- Dropped the global-operation coalescing optimization.
- Dropped provider handling for SMCCC_RET_NOT_REQUIRED.
- Removed the unnecessary global provider pointer.
- Removed arm64_ prefixes from static provider-local names.
- Documented why these SMCCC Arch cache maintenance calls use SMC64.
- Anchored the SMCCC return-code comment to DEN0028 v1.7.
- Used fsleep() for retry backoff.
- Used unsigned long for retry delay values passed to fsleep().
- Skipped the final backoff sleep when no retry remains.
- Documented the bounded mutex hold time across the serialized retry
  sequence.
- Added mutex_destroy() on the registration failure path.

Srirangan Madhavan (2):
  arm64: smccc: add cache clean/invalidate IDs and return codes
  cache: add SMCCC-backed cache invalidate provider

 drivers/cache/Kconfig           |  11 +++
 drivers/cache/Makefile          |   2 +
 drivers/cache/arm_smccc_cache.c | 149 ++++++++++++++++++++++++++++++++
 include/linux/arm-smccc.h       |  21 ++++-
 tools/include/linux/arm-smccc.h |  21 ++++-
 5 files changed, 200 insertions(+), 4 deletions(-)
 create mode 100644 drivers/cache/arm_smccc_cache.c


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0
