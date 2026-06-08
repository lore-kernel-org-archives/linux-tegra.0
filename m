Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011014.outbound.protection.outlook.com [52.101.57.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2219B3101D8;
	Mon,  8 Jun 2026 22:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780956441; cv=fail; b=mcDMFuZ/EUxLWuqjJVdmKafMk5BfpfjDFkGXKIruK23BXtJCpFDZsiAbaOrPD/Nx1qImQyJO3QuT/sZyr6oPN6Xcus02nlLnnaod1qDQDCWrk7kFFHeCLiTF13mVjdJ6nN4IEqnQIfE8h4b1LABQ//RE2WCyPVms86bcm7xpa2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780956441; c=relaxed/simple;
	bh=u+E3CcHZB0E/boyvSa8LgiLmSvuck+ByvLAKj8yOASQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Aa1Ke2D8ljN4SlUj7l/4Lrg7NVKv9PB+b3TPta2Uxe/zpYWN6a8aWkeErkAWD/N294Nul9q5kTfvg7OeiFgDUKxYKxUnamRfO410qozHJGssgRpSS2ZCTOgPXzTg/ehLjkhgBu2TrxtpC/oGnEzSB490++YAmYuFZ0jWOP4AKSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZmXxXuFG; arc=fail smtp.client-ip=52.101.57.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZmXxXuFG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqORd1JgKZlUAZKdODcmmk+dXNMD0xmY0+NtNDcsCNr62aSMPuqem5ohOBkyooU/kkkqey8bvNfuMHNlZxmunJgg85lRf30pPWYbhy4KcLgul7yqWbVeJ9PzWIo3jnLLLjOO0oERUvjR5s+DIF+yNpidYGO1VJkAvVbA1G1fkABQJCswwYBbdjP33n3kYa7q7MzduHGMsWGdk255f31YrtmO8r2Z8GpbNKNwFQNbR+hZj18FJj3Hhjdzh+ikJnrMU8XGdB/5koCqWfoDz/+4iGpk6lexKwJ24ReJ//ibwhoolhaTpVOTlrewsCcy/EazD40wb/sFMWiAJZVO/i3tsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5Bk+qN3sPBuFwQ9EWvnCoMua/5Vf2VS4rUSxzu9hJA=;
 b=zN5XQGfpSps1+oO6szlsTeplSksI0oIvNToXpuD0jGQAyOLL4sPLN4/mvpCSgIOJqDDm7BI61Czq4q07SEzoDb/KstF2xpORQMtPYb3pf6WXcwNJP+mjvIWsfZl/aoL2aT/eG+jL8shGgVc2NtMngCsjxPangqwBJ6hR0CpDAkshlODNmLh8OpA0RyrLMkycuUMAY25n2KUP+ePoO95SUt4CdfxzYgE9dEq2D7Rlt51/STHnMWNSO5FrFECFYzpX5bg6FTlYHA3hDCcmmpKt4JGFeCyZ3v6paCYQedy6Z1SOkJzJrs37zG2TR7Hfxo88UrThCHvyfLrlsCefDKEAcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5Bk+qN3sPBuFwQ9EWvnCoMua/5Vf2VS4rUSxzu9hJA=;
 b=ZmXxXuFGfIrp9LcaAuWdJ38jsqU5skmPyirJwvNTpFk3v33Na/5fWxTChA0A8iUg7OTAgxdLqpQTuLIGqCg87WEom/sBwrYdpdEIHjqAGxVr5Kf8n0ndxuSfBroiIpVrYcROH6RWoQpmCJp4xaaDb9HVOuiDvbafzThf+FT/sRhFNloG7T6AmWGropLWdaRHVyDjrPuyYFMEIee+MJhBswvj1YbdCQSLNoZFaL3j1Usxi29XqIuC5kXyayV4YCh+p0yW1wWdfIC9YbJJcz5voiYfpS0KHmZXLcAQHk+f5wlV75AJK6q/Xxz/1JQq1kmEHK1Ccbbf2d2KQikf8G1gHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
 by PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Mon, 8 Jun 2026
 22:07:14 +0000
Received: from BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::4d08:451e:a51e:33a1]) by BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::4d08:451e:a51e:33a1%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 22:07:14 +0000
From: Srirangan Madhavan <smadhavan@nvidia.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Srirangan Madhavan <smadhavan@nvidia.com>
Subject: [PATCH v2 0/2] Add SMCCC cache clean/invalidate provider
Date: Mon,  8 Jun 2026 22:07:07 +0000
Message-ID: <20260608220709.1300245-1-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To BL4PR12MB9478.namprd12.prod.outlook.com
 (2603:10b6:208:58e::9)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR12MB9478:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2d2972-4fa0-492c-0038-08dec5aa4bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sxBt+BCwGzUAxhh9tdkbOSl6rTZawVwcyNfgpfvs9YdjSn6YH2YSgwh+KZdBgGF+Es3zUMCdEe6IRxuwuGo4T7QW8eKxvkfnXht4QruwHUG5Jv7JPg83WU4y/Wx5kJgE/qLmLK/HFI8mx4YJU7dahQv+BXgZPKEAKIV7lutxZUZk/6BtvqDSa7WJoPkLi2u1LzTvuv4J6Yw/eVL5UZfuYJuCjZqEG0S5Wc3XonIyv9GInZVgddvpDkr/1e4kvKcSDJjtqvcZrK5EditDH8CcNnyLBCjytlOEPQLmV0qfxQHqAVT6/uurweeAHi84H/V3E0LiAM9RDuVXHuC7KfaeDd/58t38cB/lIDcXmWZBHAT5MpsgavigGZRV8vZn9fknQO27kvfUofOTnhit5lQRMgsowOWLGtuFg6bBnXtPXk5jxr+/ijbxnbqXw0CYc1yV4POjyeumH2St0jCllDDy4GvKirHnWREHiTCaR0zz5O5YVEzYPPKu5lDdjiVxgNQSyCZEYwMyQBWX1bHG3sxFqjQupWXiwD6sj6No7FHGlYe0GcTdSyshyfoVP+BqrQmEm0xbbF+bKSSk+W1fVR2xt9jEmDsZhkh27C+aDUWeQrG+Pfib9/gZs/rbw2FNklIIH9FGV8jUdI5UnpcHumQZ2RQnWo1opz/G6sWOIeEYGYs+uhjgqRMWILXK2E3faF0h5w897oogRjJgDDQFbC3xFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR12MB9478.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(11063799006)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z68azzVUSvc4N+iizfwcQeepAe3/uHSrgqgUYY9ssD67G4VsnXTtMr7M5o73?=
 =?us-ascii?Q?ANF9cAxNnL0FXZ/Sc5V6T0h3en6gI4NgJNrXMz1oMn4FqQLTT9HFmIyvnS+T?=
 =?us-ascii?Q?8iBSR0vs9qi2gJSf+vyqoxuVU85LnBJMgdtug7b7Fv65rLRzWNFY6tgfm58+?=
 =?us-ascii?Q?U/qCDi6J+WvePxP0z16aiCu1aUmQTTQTnH5PS8a5XEJbajV69Mgy1FAevK+d?=
 =?us-ascii?Q?kswkSYD+v/8lYpnnMiMJAHJumeGIfK5TVf+FH41K7tEVb55Xw/j0DB+cjEEZ?=
 =?us-ascii?Q?zw0hBD216bRGHw0skHRWhPs1O5puHHWn3PNVjtT/z36QVSVXQet2APcwskLn?=
 =?us-ascii?Q?X9XsDN8YXuuhZ9m3wsVxZVsEoSIxzKO6pI8zyb/YxBva9RvOca3//ymKqvlz?=
 =?us-ascii?Q?RC2SSngk0iocwnZbwtOaulgRWrjUfNGBizbYUtXWeBiYqLXz9jiMgSFjPJ95?=
 =?us-ascii?Q?rs7qSvU70iB+NDTYZUNj6cMgjVa2GjdcxE498jJPCYdV1U2idaS6h6hZRIW+?=
 =?us-ascii?Q?jrw9Rkoc4SiXD0v2rGGJPH75Yvn9fu6NuhDhJqp1uUzA3ZSrOLbWztkowQk2?=
 =?us-ascii?Q?NzNaZkkWkSF7214UmdxSoTPIfgwrL32zie1zRH6XRtKYCO4GcdF/yif6MifP?=
 =?us-ascii?Q?XL7de8TdOJjyXp+9ITxdTxettgSKRRvwXzYNoBbRw/hXpCaxdC1Ym1WsZTec?=
 =?us-ascii?Q?xQof7Im6qOIoCiL2gOYBe3TceT+DKGp+ghDdmlznkYMqHhKQJvd43Linfcb2?=
 =?us-ascii?Q?rYuzn7cB+hcHTDQGFyhPsGSxYv4aLpYa1w5dTp3+e9D0XEkChuJFQrXO02AX?=
 =?us-ascii?Q?RbKtavaiD84HnvhzIbl5XQXecCpMbLJPATVYnHEquHDeaqNzygtPy28+SCy2?=
 =?us-ascii?Q?BzVK9VJkb8UX/6/rYZPwf6Q7gr1lb2jaaAByF+pXh6BbJ1hadDfYf8ZQ26i+?=
 =?us-ascii?Q?N68BGWmCtcGH26E2vZwAmaV5Nbs18hWk6/aLAGg+99Fp+zhIVQCDReIGIOkf?=
 =?us-ascii?Q?imA7/uEa/ixLrZXtyFckWnJo4VhiRteEpWzxG3Ma0HyUVbvIomxJxuRnRqaP?=
 =?us-ascii?Q?RxkaeQpqGC5Nv5WZyVk/IJb+lNmjx3N4gfjYCARvrjmxQ8Vsdj/D2Y185Snl?=
 =?us-ascii?Q?ZeX3zhvIqgpCj/oL58E0UXqg6zhxYc93OvlguwHN8yZpj2LyC9yGwGL01Te+?=
 =?us-ascii?Q?oRaeDLixOI+DEo+N9txo4kPWw3lk89ND23OY2c7JgY3NJZ8mrMkq6JbsR4ut?=
 =?us-ascii?Q?UClpuYI3xzHiXniP2YKVMiJYDpDsA08OXCF45Pcp6rE6HOLeu7x3btA9akkD?=
 =?us-ascii?Q?V0Lg04ihPAV0CjcvFYYdCryxq1UH6Ug/HdpJyPZNpNDuAfTSTApXfu170rob?=
 =?us-ascii?Q?eS86XGCwROO93XN4GWeRseWUjNzyVcDp2ZUwqvVFCWw+ZHcQGjIuvQ2mB6eO?=
 =?us-ascii?Q?x57//8Ob88Jikk0EicDcb7WG0lM9KyyvUSzwUkJM0kmo+LC+D1D/PBpbYXM0?=
 =?us-ascii?Q?IBJO+9sNHoTLPo5Bukp11dxzh6G5BHxBiEcTKAX6WKRMhq4gCPEzarJRme1l?=
 =?us-ascii?Q?lhvp3H4al2acmGXVGN39gOU6gIY1lXtOBibGyENYD7i+OJFNbw5zen4orQfT?=
 =?us-ascii?Q?+CIG6gAqIlYgnaCtNmlT5WDI/gyeR1RYpOnf6Q5pGmXcFqHRwDLljcASGgGW?=
 =?us-ascii?Q?QNuuyCJRZ631sIb0i4cgqCb/MVth6TrpnPeXHAAjxyeDcC2qU5ti3cwx3J2L?=
 =?us-ascii?Q?y9TNbmaOCg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2d2972-4fa0-492c-0038-08dec5aa4bb6
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 22:07:14.0619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xV0AVNLb3LYGVzF06oDM+Ukb0Yda83+3wjv1hFEp+Ezt+lrza4LFQBaR8kBJHcBp/M7YYF8sAEfkV2vM1xkZhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674

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

Reference:
[1] https://developer.arm.com/documentation/den0028/latest

Note: Jonathan Cameron raised whether DEN0028 v1.7 BET0 is sufficient
for merge. Input from Arm maintainers / SMCCC spec owners on that point
would be appreciated.

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
 drivers/cache/arm_smccc_cache.c | 157 ++++++++++++++++++++++++++++++++
 include/linux/arm-smccc.h       |  21 ++++-
 tools/include/linux/arm-smccc.h |  21 ++++-
 5 files changed, 208 insertions(+), 4 deletions(-)
 create mode 100644 drivers/cache/arm_smccc_cache.c


base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
-- 
2.43.0
