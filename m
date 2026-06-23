Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013059.outbound.protection.outlook.com [40.107.201.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315F628C874;
	Tue, 23 Jun 2026 23:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782257874; cv=fail; b=i0T6dx83Gbs9qza0vUIHWjFfaid3KVztOjjKspddJcsuY8/Vd4PkEWsZQv/IXeZMTw+FRLHNgeSeg14s8VjwvdNd3TxjB29dViwJPObydzJHwezB1x8Vya8NoInpIc+9LzG/s95kEhoqVTRt7fMmlWgLTmwDWMXdCcSHR2lOaTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782257874; c=relaxed/simple;
	bh=gomipqlxykMowZuk7qXpdSKZoxBi+ddFauXtkdzVjqc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bCwPaGKqKVY29tLWLWnzM7CfuVw5vhpE4jjRVxmf52N0b3DNLU/tujOZq7iYGgjYITuEuLhdOurcFNK0GLBvekVOdflwcP4ZQA3+TWBiOVlFwxB8jfkYKLOYfzazF5CwzO5epwNwPnHkHjL4JLoGt24dSdFFqtGp0v5b38Tnhdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aQRVMAO1; arc=fail smtp.client-ip=40.107.201.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aQRVMAO1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bN7OuGqblXWSxF06KzSMYSByhbs31ex6WQ7Gj4QdIxfzwkdUl8VQpyH7venTQahV9KDFwWNCX9FIaHS0iOylPuaQ5WX4JVtNSF/ZMBMVGuQ8kiquuYez5hhlZ7lMWXnUY1/nt9NtwvHGwNqWpNP/ikYXh47njjzPILxkYT01/jF/AxqLnKt7Sca9yuN51W60lhbX8Oec+UKu2R32Xc00CMEuENyLemhoT2J2Z7dd0pkxzKh1AwuzVvt7paVAIC0PhcNO68SsPD2WWNOEeKlIoXXs2ao4M2vP56Iz0V8uXCzgr3FYfRRbIInCralNeIogRkvpcWrd8yclxKZCCFRV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXj89P8NQOP2nCPmWd3Wk/nGOtJ4OpsodS1IQuNYTks=;
 b=fwjbo3asj0ea7W8Gkwt7XXUpil0I25aK2xLHmEw6r9jn5XaOsLDndWnau/PcWc/7QG8yo/GhvCZxoUwBboVBQ+KdeHhTG2V5hG1gJMdCElNLoeimzvFP/QB3niAi+ZOsGS+driWs/5pK64hMzQ1quLcgiG2HA8qqZnwV+WBLH3HxtxtlvKuIX2t99HePV0mYdLwM8i8bVto8pW7mE6cDZWeatA3Hm0q0PyCmBj4JLQ4Jtuei956n4478ZdKyBxyEnUII3RdTNb2uQEZKgz7YWk8M3nxtx64LQxg0MrXxEKjGYl+EghYRVVRijV2DZ7DcvIYoNCi/2pOglF1xN0yg1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXj89P8NQOP2nCPmWd3Wk/nGOtJ4OpsodS1IQuNYTks=;
 b=aQRVMAO1JIYoRrSg7zXf4yKF7fBd5sD/1jC5I8yG5ezVoPx34A3DYs2vrNkqXMUQEPpEyKSpFqKokQPtfnnFMDaOMB0Ef4bb+R1eNclJTZNZfggiA890SJNVIOZmyxZ9r7QC3rVM295s1eGJA4Dwt4U6xWVD3sjxdDwk+gauuIQnOGwExjqhvWFvi74GWY5do2gD/IEMaWg3m+NWgjZ6JmIDpW6xifbfftn+bOyjfdnVRYw8Pi39k1HCLQa6AmuCJg1MQSYaKb3U+3YE0jJjili8YQUMpETAXcTO1FSTCxo7Qb+4B4VJCbDYHPXLNbI9mzeJ+w94Xj+EnOmy7daBUw==
Received: from DS7PR12MB9474.namprd12.prod.outlook.com (2603:10b6:8:252::17)
 by PH7PR12MB7331.namprd12.prod.outlook.com (2603:10b6:510:20e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 23:37:49 +0000
Received: from DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7]) by DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7%6]) with mapi id 15.21.0159.012; Tue, 23 Jun 2026
 23:37:49 +0000
From: Srirangan Madhavan <smadhavan@nvidia.com>
To: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, Conor Dooley
	<conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Dan Williams <djbw@kernel.org>, Thierry Reding <treding@nvidia.com>, Jon
 Hunter <jonathanh@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, Souvik
 Chakravarty <Souvik.Chakravarty@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Add SMCCC cache clean/invalidate provider
Thread-Topic: [PATCH v2 0/2] Add SMCCC cache clean/invalidate provider
Thread-Index: AQHc95MpdVuc7Bm9ck23f3rlDLIKzLZM4jlF
Date: Tue, 23 Jun 2026 23:37:48 +0000
Message-ID:
 <DS7PR12MB9474657F83D9FB7A3036ABCEC3EE2@DS7PR12MB9474.namprd12.prod.outlook.com>
References: <20260608220709.1300245-1-smadhavan@nvidia.com>
In-Reply-To: <20260608220709.1300245-1-smadhavan@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9474:EE_|PH7PR12MB7331:EE_
x-ms-office365-filtering-correlation-id: 96ac2265-7873-4c48-c285-08ded1806f7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|38070700021|22082099003|18002099003|56012099006|11063799006|6133799003;
x-microsoft-antispam-message-info:
 MEyMt7GkDqpx4Os7sKTwdNDQe7NbguezbwInR6L7HQGnCMYmUv8TqUoyE0T6QNkujz4t+Qk3sELq3OlXCHm7QP+rNCTEpW52nowqHHnyMOm8fabtdnLnExA68t0b0FlG/zNBY6twMd/F13+Y6LG0hnU6J33VTWPb6YuauIBnRlI/cGTWMgHw+GvhG839gOEU09hvzuH7UuxQUKkiv1M7lpz/VBSuZQdkaTARS0a4q2ulaXlNvvb57rkQYxnwTivlzATcHA3NI4KwFsETJ/XLrPma3/Nw6+MWiJmqLhYlPIxx+RNTtU62MhPmDtPB0ol2TiUPO1ycEXWnA9dLerlS/vzDC9iytWsyPeyEXUfRjz3vso+9MuOCv+KvCakEP06TWy9yjwCE8fIy0b1j2DDNed3e5PNmSp0h6z9RRPDd+G5BVY5ZU+Iyp+S7j0Pl8GMCZDwikceDb2fl4Jjo/PdBaL1lHhJt0hj9SpcGwg25qtUmCiHl7wlnC2hPVepVtfCI2X8BkDey2PW3pUN2Bi/lmUzsB+VSyI0TCOgDVRT+gj+cjNZ2H2AY9r9EoIC9p9MhL5bzLOAsuRBWy/Wg1p/pBy4BRm94+xMZShDZOHlLksIN7N4cMUszJCzIOqh8Iohk366AFqHBgnXVZZluNwqS3D3W+j15M5ZGizZpXVBF5AZyutUPMZG+uAPr2mMmkrVFWwisPZE6MDdaWXXORVS2VSC+nGn4Hyff75F4Fm6nous=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9474.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?W+HlPFNk+vfjHPmyLyBu6Cf3Xa4t+nZG5e3vuHfkkDNQxPSUzFBEABOmvH7M?=
 =?us-ascii?Q?TxVHjRTrspX1BaaUdHZHvQUWICa/KRNxxIlYPJXW/zSDucy6tiKgmZFacDp1?=
 =?us-ascii?Q?ZqEBCgbiWfwomTN92qh6TJJwClqGeU6FBIsIXNYXrbCK6g68lIWaGZcYRjM/?=
 =?us-ascii?Q?Rvj8b174oP5nWs3Yfzq8z0L4yZtlE4v9eUjvoAr8M7n+rtyo7VEGLiClzgPC?=
 =?us-ascii?Q?4pZrL1vPfI4T6GHIh4jmV4FHHmJgiaPA4Tq658NMvo41EsaUUd6k/Ww0GGVy?=
 =?us-ascii?Q?5987umd4+NJO3eYh96Ws9Zh6iQxHcgiHMgpbijcP6nIIwcAqTAfNcP2N58t5?=
 =?us-ascii?Q?nuWUc5yV0MuIjmQLwEnMpE5UObUj/8Rp9m9+wX+Z/4dfVaQmW0En6uM49dyw?=
 =?us-ascii?Q?mS+6qLo9o7h2vcTGDLNiIArxRwFPr031XhxLVfDxF8lmcBOnyq+RNGlEX8wS?=
 =?us-ascii?Q?CPtckURgAROG/VUyLHF2MyiWOXlZsxZbkoja2He7WULcoLjP460syo+X2cyo?=
 =?us-ascii?Q?FloqX8uewqch2ZlKThsyEphwZKp4ZkBR97DoI7UKVfcP3roZlwmN5V510nQy?=
 =?us-ascii?Q?MQ/MvOFMBWKfD9VMbD7x6ju0pFXLWEYxd1f31JqoXgahVdKajAdi6wWsz6q1?=
 =?us-ascii?Q?O1/UPNXCy7xmFxpA60SN3l13VuFgBrWsDLI7rDt1ub6Meb7h3+q1YYb8hwAL?=
 =?us-ascii?Q?c5PlYIyiCIHvpI5dOZusejNHKJAauvwofeVre3/dl94O182df3d9LKoCRW8A?=
 =?us-ascii?Q?9NfI4KLHR9OuyBq0CaXu6h9rRV+Xz+kaEbG4DLSdsMfpm/ErGOWVzNwnSJgu?=
 =?us-ascii?Q?V5roqJkYlEWdPN+l4jIYuJJfiIWR9Jqlr7gslnppCIEu2b5Evb7ubxEPHYq2?=
 =?us-ascii?Q?pNoswHf+pHkDGPnhOObL9pOqrvNTyTKL2/3toAaixm/Oy7gaIlv2pJ0E8I99?=
 =?us-ascii?Q?FoN0U4NOpium1Lz4rKBVRy0Bjm6SMlyU9nIDjDNNHyg3fnzMdECy6BlG/7P3?=
 =?us-ascii?Q?Xjj8cPhOzCs4B/Ohndq9GX3le5V15uYBEqI95zgPf57fnimjSq1dbttPgys+?=
 =?us-ascii?Q?HZW/YuHchERgrLtxsxY/Wq/WCrWEWbrsZ1QSgzbF0ZCGH7OJX2oqnXnxmh/B?=
 =?us-ascii?Q?ERfEiBEIJn6R5CLutFB9EzVOCwfJ5P84YWN9TBnb0BXQAmV2PlwI9Im2XWBP?=
 =?us-ascii?Q?wdS9pXV6QW8+9Fq2I0hMo4sGU+YgOxgLYYAxxbo6ovKYh12uRLt3esbiBFvx?=
 =?us-ascii?Q?tqwCLbDzWyg4F0RyiD5hFe3WPUiGHDFJiWB8NIWJ3J+OBcijrZiCCAuQ8X1p?=
 =?us-ascii?Q?E2yU/Tq4bnmlqe4Kfy8SRf1UQTZFJYkBB/6u3BeqEOGAsFjijO7QPDk8ZJG0?=
 =?us-ascii?Q?nf7juaAWaQNWX5WydmW+WizDvRPms+bLgJlyRZqipU3hxxogFCWdY6dYAL40?=
 =?us-ascii?Q?XixhlqEnTVfzCeeizs0PVdzFo/ZC/9INmY7ZhBlT4KNqZ4xCLg8lmuJsGZw+?=
 =?us-ascii?Q?GzslPdV8Y9t/rPcVBkNulChnf3W1Xg7wJN+KJh0wr2C8CwjhvrjFoA51ecA0?=
 =?us-ascii?Q?/+lxig4cTvrAj7wFXFp/E1QPYYUnvYWZJ9Yqz2f7Mh2UNxVk2diCc9+/iDfT?=
 =?us-ascii?Q?41CD7mumiuCKrf3PU2wv5fUahXipQ7iMLluMwpMitRKTeqgoWzG/sqSXZdY8?=
 =?us-ascii?Q?UGz/WoEr546L77hSgRpr/RukQ3puiXydl5wDHC9m2UiYik6T?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ac2265-7873-4c48-c285-08ded1806f7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2026 23:37:48.9472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y+LwTNCQgwt2L5CvpD2XCUBqYZPuNfXThU/VI3tHc1/3ESQZLncHc2BFWTq8NQkMfMC283XYMGORINRwb3PiSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7331

Hi all,

  Gentle ping on this v2.

  This version includes Jonathan's Reviewed-by tags and addresses the v1
  comments around the Kconfig wording, Makefile ordering/comment, and retry
  loop handling.

  The main open question from v1 was whether DEN0028 v1.7 BET0 is sufficien=
t
  for merging these SMCCC cache maintenance definitions/provider. Could one
  of the Arm/SMCCC maintainers please confirm whether this is acceptable fo=
r
  merge, or whether the series should wait for a non-beta spec revision?

  If the spec status is acceptable, please let me know if there are any
  remaining concerns with v2.

  Thanks,
  Srirangan

________________________________________
From: Srirangan Madhavan
Sent: Monday, June 8, 2026 3:07 PM
To: Mark Rutland; Lorenzo Pieralisi; Sudeep Holla; Conor Dooley; Jonathan C=
ameron
Cc: Catalin Marinas; Will Deacon; Dan Williams; Thierry Reding; Jon Hunter;=
 Souvik Chakravarty; linux-arm-kernel@lists.infradead.org; linux-kernel@vge=
r.kernel.org; linux-tegra@vger.kernel.org; Srirangan Madhavan
Subject: [PATCH v2 0/2] Add SMCCC cache clean/invalidate provider

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
