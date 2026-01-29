Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11020090.outbound.protection.outlook.com [52.101.85.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E9A30AACA;
	Thu, 29 Jan 2026 22:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769725401; cv=fail; b=dIswF2Trb/YNMv0C6I1LvFD2PQ167Ag3bZjDRGTUz1AQmASeBdfbOpzoS6WUaJ43WKAjCqUlj3qPSLl8pxSjGcmQjqxC8bpnSot7RLELufEm/ERuE9fP1QpzqFjUB/D6PydNm8sIB0ww28TNBnX6b3iM+5ThNctpt7rlwMA3vyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769725401; c=relaxed/simple;
	bh=HGIL9W6WL3tWPb0qizrH4Za985KwTQQZ2Fh2CH4Z6xg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=f2YgJywDaPHB3J4hcZT3rXUhn7krSH9uOf2798SfmDBXXaTRlvDLJ7sV7uzxF8EHiZPTsQCt2dwFbucnISGD4kRVNfmBkEaop//rRYVjfLHa/NhdxIpgpCF/pbCCqO9uY0CmlPcERrJ20dJ4odyHGqI37tbOR62tuGSDLQQFuEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=WQ6iZiYc; arc=fail smtp.client-ip=52.101.85.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="WQ6iZiYc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpnL0Xz+iwVhW+6WkVG8p4S+rhsNsf8KRLyPKEjgNP8DOxF9ibl2LHe/BIWT0Rz9OUP/u9Q49UzTN+g7wJbdWJ5f/WH/lJzrBW0IcHLfkWR16IsS/8CkyQS3/vP5vKYCDLsrEfd7N+i4gFYmzCbUmdVCb0oE8MqBlQUCvVYGOExE9cKhx5+fTuviOuG9h7JmAmk2vcjPjMCD2GYbokgw7fY6SUK1xIl73Hc28tk9P+xwW3N4JeuocPvqHk4UP8nux897tJdK2rEtPzzHt5LH8rPaeTHNng7MgN2UN4jRmr5fzueFqTR3YRAlX2NNMcfV6xZaQlpty67UKt7kVs0oKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9KrnX7WxYTbSsJ5iXPyNvX4RP9/BOtOB8dIkyiVKZw=;
 b=jfH9hHjbAxWRSs/0fZLEZlCFgyPIIBuA52DF7W8PB7eCGj0PuYHW7cr6LMH4e1yhPWz5eT/o6bkX1bONMB9xLHpFUGY0n+rR7Zv3Hiz8zmLGXGFQs4UgrssKDnmmYkbD5twKDgMNo72lZA5rSogV6TFncTDRzgFUdHFp3DoxU1Bw93E8R2xHf1Fl+58TbStb88VIo20s88rpwiJa85jCuogL4rhWmNg0SISVCXGpM7jKFrJMfKycNUe0A5vFtIQnD5LlJEzj6g09P4P8czetbfDaLNJ1BJQId+rcEkYIL+03PeQOXK3KoqcGiJBDNjXJS0qQrAj7nD2eP3991EKYqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9KrnX7WxYTbSsJ5iXPyNvX4RP9/BOtOB8dIkyiVKZw=;
 b=WQ6iZiYcPlyS7l3/qdYC+w/GNN24n0fQAfp8kyXaTNlQzFaB68/OpW+KO1xeW5U0hPS9QV9ywVHeLAHsG95bDBlCP2vSFrNm+6elXOe4cj1p8Eux4xLc2R5kXKETy1FzhGsom6cy6CS9rjZuJ4kUh7ABrdDuT/X+izhBlALretU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 DM4PR01MB7809.prod.exchangelabs.com (2603:10b6:8:68::20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.10; Thu, 29 Jan 2026 22:23:16 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 22:23:16 +0000
Date: Thu, 29 Jan 2026 14:23:14 -0800 (PST)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
cc: will@kernel.org, suzuki.poulose@arm.com, robin.murphy@arm.com, 
    ilkka@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
    mark.rutland@arm.com, treding@nvidia.com, jonathanh@nvidia.com, 
    vsethi@nvidia.com, rwiley@nvidia.com, sdonthineni@nvidia.com, 
    skelley@nvidia.com, ywan@nvidia.com, mochs@nvidia.com, nirmoyd@nvidia.com
Subject: Re: [PATCH 3/8] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
In-Reply-To: <20260126181155.2776097-4-bwicaksono@nvidia.com>
Message-ID: <3e96b16f-a53f-438b-fcd9-2e1b6fef2136@os.amperecomputing.com>
References: <20260126181155.2776097-1-bwicaksono@nvidia.com> <20260126181155.2776097-4-bwicaksono@nvidia.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: MW4PR04CA0206.namprd04.prod.outlook.com
 (2603:10b6:303:86::31) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|DM4PR01MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e7cf362-cef9-447d-cc52-08de5f84ffc9
X-LD-Processed: 3bc2b170-fd94-476d-b0ce-4229bdc904a7,ExtAddr
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?G5RNh8wAtkl3T5C3ZSvwOwdGs4ncUoeGUMo4MXOjPVPpd3eMJRYFHaG7yydw?=
 =?us-ascii?Q?f/HprxNVho7BGkzGcp30qLxxnGDd9kxIjZUeUwtTuMO4Ut/n3cLSYOTPyk04?=
 =?us-ascii?Q?/WVAolV7e67dGHz4mrFc0XqwOKy0nHabOPkpz8S95Pf9FuYrzZk6SPPAopsJ?=
 =?us-ascii?Q?Bs4WMwVdDXjVqvr4oXmtDnL5tf/4W+XKnTAm+iQMi6CgUgADTkLg4JO92pVi?=
 =?us-ascii?Q?ZH9qO3/5OYJAXlArQ3k2rvmXrFcL+/6JCqE8wjwZDtMfg/2F7OOJmypHpN8J?=
 =?us-ascii?Q?qT2QvxCzUWbB7wjMDil9PU0Rmh2QiGh6HYy6pEWG+zxJpIuP8m/X2vgYeEH1?=
 =?us-ascii?Q?bVEZ+Nyb+CqoBbEhbYkhjx8EifrDWdXO3RPgy9ma4cUTepvH6RI+EylJZcIR?=
 =?us-ascii?Q?dQ2qSlug2Jxasl8epfLq0HGpcaLovGFl8P7X1Ih42a1NyCV0PO9PFAnO2G2j?=
 =?us-ascii?Q?7QA85h1U7MPrYFHr9lhwDNKnpWhu0nPmalNIS0vDT6sDBrEMtKOmnAxWJFCe?=
 =?us-ascii?Q?Vw2uuxOgbj5JtrDIhySWQ3mhW1eZJctO8pfKo3Z6V97h05cT9gYqP3qasZ+B?=
 =?us-ascii?Q?5FipqGQ6nyf9Mwhcs1yGvsMQlrV1lXdf/7ggJmIc/XyxKhOgNowa93eZsIvI?=
 =?us-ascii?Q?z0vr6kORT2qc34VzdkcC+MMSa2VAEVRFtujKh+ugu9/SryLQGrySdwTCdc+s?=
 =?us-ascii?Q?KXg4brk6Rcaso+nv25kkI1ZTtoJ5UaT6oy01+siTt3+ROV7ByJ1QoXbP/Gbc?=
 =?us-ascii?Q?LnY4OspQH+6ofcY87dSzWQff/ZLRapRH5lp2exT8XGdeBOMd7zwlmdGNbPJ+?=
 =?us-ascii?Q?AvltGNbRDBWAahcT36ZypZ8r5NVoJUqOZ9EJ292LqDDYoEwxTJ6qWcOlZo5r?=
 =?us-ascii?Q?+FGzvBB9pgYXXqPTzuZupZ38I4FUDwNqlamAGCvM7xQOIyOkYVceezgs5vxm?=
 =?us-ascii?Q?YXq5u1tGlPJ6sk02ToW9y80rCrvAI9pnlMS51mn1tmBHyzvSmIJnn+AN8L6o?=
 =?us-ascii?Q?jnAi/HiA7ptFagw5UXPL0ISzulqVrDYcCna4G06n6quvKO7zruVy3VgAjqRd?=
 =?us-ascii?Q?V78wvEt1T65dS9+U0Pf6ufi3jObM+u17xnZvuI0DndEw8udm53sUv1qxazau?=
 =?us-ascii?Q?lLtTYbohdw5vOOzw9j7Ttm9N88mPUvc7JAIsPrg5SarGT57Ho8WntDgFKNUS?=
 =?us-ascii?Q?mt5ht+0EEJYGBOduYrBIej7T21kHrvervy1KmIGdWB33pR14HESAQtZGBufg?=
 =?us-ascii?Q?1iCwGSBemex/qYjO+lw038bxQdWijFdxJsqPA0WyedNThcKxAzGZaF4pH1MO?=
 =?us-ascii?Q?c6XtlIDsUHPM1d/u2Nc6nFH4zNvapNsfAGC+GOIMjLEiy1oEPee4l4V4+D73?=
 =?us-ascii?Q?ANxifSJNkvhEm4OTh4G+5OSjawFpCukLN1osulxZGnEq3Ym+oM09uQ2IUuzM?=
 =?us-ascii?Q?YrzstDE30wNSb00ySXSKDMWndgsLSqOXcES12PzCWBf655EDHpQvb0sODKVZ?=
 =?us-ascii?Q?ikvujKA2QtXWuwb6YDHs8esxI1nU6xN6LX7bu7vP+DOhSNARKRlPcI0eYnSg?=
 =?us-ascii?Q?STM2bL4Hj5PonKodjqw=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?6AYSaYNvJ3HE5rdNbqfEN3Gc8hacYsrq9JYi6L7Cbbw0xrTLHKtx3vZrv8u4?=
 =?us-ascii?Q?vf7qLyikPOr9uERB9xse3UEZq9fTMk8gzIjyMUtzatREEqqUo/UY9pCdeiu4?=
 =?us-ascii?Q?dzsmq4VTLWTLEBOEj8vjb9KLiYPydRttSyHRzJJrSm/tciSWcCLwjJO9XVTS?=
 =?us-ascii?Q?V1TB2N3NEAXjkAv0/9wFdtau78lRgtq3JGqSCDTIgRFpooQ6CivwT7QRpM1b?=
 =?us-ascii?Q?YAsCkKlbbL377wjZyTlz/Q5tQsmBVHnHdFw1+QPH2ugt6PHUMZgdYL73gRWd?=
 =?us-ascii?Q?BR5RUwoRxVET3jkD6ySx3UPGzANsj4+8pWjSbl1R8U9GXSylmogrihzszprW?=
 =?us-ascii?Q?wqZA8hIdvWga2WNKZ3dDxUeunt0lTijGIHBNspmxls9IY5xaxU8ZggD7zSkQ?=
 =?us-ascii?Q?ZWhgeBJAWKpLbSOszst2eiVdbXdDYRGKh4cCAw30mC/mp5odI/sdJUYXZcAo?=
 =?us-ascii?Q?ISYZEeBNXOK3z5XKwJZRmAmlEWcCQK1rztrJTnsDpAVR3UndmBTXnYDxVfwW?=
 =?us-ascii?Q?/6hhbJZzWiyDDzL+cUIW16rwW5hoAiHLbqhcHh+bsj/aRPgi4D8vruSMJz8V?=
 =?us-ascii?Q?7jgs10zAcrYc706pkfwtn4k2RK+Iwc59iOUGn+lJhcyhFYZLCc7JxASzidXI?=
 =?us-ascii?Q?BskurZfaiX5r5bqEBOv9e/aDQhGINBxTF718qtH5WKe0DhJ37lG5qhKl3D1X?=
 =?us-ascii?Q?xAJU98aoc8rrsUxgv4RfOfKqqj78Wbobd92nYaAzH0o3vES9hS3Ed0QinFEV?=
 =?us-ascii?Q?zchHHpR6mzLn7y4XCLXVHiN4LjIU5qk0LsWajEfGgi19tIQzU3uadsQBcxiR?=
 =?us-ascii?Q?aXFC62RJ8mL8N68ruVTX1nV16u7UPzgrMOLGVImvOs80k/WW9bm9jM6//MGp?=
 =?us-ascii?Q?xYDqGoDrLOdxa2DU5bHy+Uyh8BzhK5WybY0pNGnP/qnsMWfNVB2TxboTRrXn?=
 =?us-ascii?Q?BfwM85NfchAscfxa23TiWtohLOw2ngQ0f/eq+F9FmqzTrPMCDO8+jRsEjyed?=
 =?us-ascii?Q?NtWRPg+WrjI4MX0MU+P8971WoEMA+SNhnuGTslCluLUnUFfdzAPPWx+X4mEo?=
 =?us-ascii?Q?ivpSm+awOF5sNw+PatlOvvGlgyUesRNTjpScoEXn2FALFV+RHqBYvG4v5HTK?=
 =?us-ascii?Q?mHTO4aKxXVm0kKYouSdwE5n1LLcoU3lmL/YTVgy7zodcBz0eqYI/zPWOhCrj?=
 =?us-ascii?Q?AVYuOceoyWPIC+BMOp1eyfmrjVtQqXWBhhwju9OntyfKYIEYg8paXyMfrOOb?=
 =?us-ascii?Q?4KxmoTR47E7Jxl47dQxyxFQqfqgmvmeyMSL6s8Ohc7ln/virGO5cFFgRj/mx?=
 =?us-ascii?Q?1SiUSO6dZXU3dp8PSy+EWGhBHhQEZ0FE9+o7RLjk8Uq2/oiAS0svK3CkHnGK?=
 =?us-ascii?Q?X1jjNyttZpkDgMrMNP/1uhnX76Pwnux6syt28XVx1aElzaEfW73EkwpvHyB+?=
 =?us-ascii?Q?h04sXow4ogSqLUc68aCp2TeeZ3VziwWum2Xa+AZfJ2gU25wmPwgFm11hcQx9?=
 =?us-ascii?Q?w9csRxK1LZ6rJlMV5e72KlGi+cjc55Xczcj9uVxOOk++CtHUfPS7Z8pGKba1?=
 =?us-ascii?Q?1cFSgVapY2g8W3WDox4Ah1zfvcojXG+SYklr0UdBNl9Fdpc3GGKI4fXJ+N0P?=
 =?us-ascii?Q?n9rAhimZqadx0bDm2p/pbp2y7Klb1AheiGnLohcsMDKN6GNUwumRXGxngqjk?=
 =?us-ascii?Q?8HsXWIKBydgf/29JF95s91NfF4z8cCtZOWkjxzO+ufss6j1/bCkGxfgmSpWS?=
 =?us-ascii?Q?f+g7qLJw1AGIPth2Gjv9UqMnpX3wDQs=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7cf362-cef9-447d-cc52-08de5f84ffc9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 22:23:16.5780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMeESBhPCAAkUjXLv0/rMQHZ2LwhZU1Is8rSrgpg7Lwhrs25cUpVnO3lMOAbJ4SWsqzdavZQtbU0Dr9QcGs8mNZkr6hydVgcFIG2mRxRuki4RQaw/Dssz0qvEhLFqkex
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR01MB7809


Hi Besar,

On Mon, 26 Jan 2026, Besar Wicaksono wrote:
> Add interface to get ACPI device associated with the
> PMU. This ACPI device may contain additional properties
> not covered by the standard properties.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
> drivers/perf/arm_cspmu/arm_cspmu.c | 24 +++++++++++++++++++++++-
> drivers/perf/arm_cspmu/arm_cspmu.h | 17 ++++++++++++++++-
> 2 files changed, 39 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> index 34430b68f602..dadc9b765d80 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -16,7 +16,7 @@
>  * The user should refer to the vendor technical documentation to get details
>  * about the supported events.
>  *
> - * Copyright (c) 2022-2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + * Copyright (c) 2022-2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
>  *
>  */
>
> @@ -1132,6 +1132,28 @@ static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
>
> 	return 0;
> }
> +
> +struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu)
> +{
> +	char hid[16];
> +	char uid[16];
> +	struct acpi_device *adev;
> +	const struct acpi_apmt_node *apmt_node;
> +
> +	apmt_node = arm_cspmu_apmt_node(cspmu->dev);
> +	if (!apmt_node || apmt_node->type != ACPI_APMT_NODE_TYPE_ACPI)
> +		return NULL;
> +
> +	memset(hid, 0, sizeof(hid));
> +	memset(uid, 0, sizeof(uid));
> +
> +	memcpy(hid, &apmt_node->inst_primary, sizeof(apmt_node->inst_primary));
> +	snprintf(uid, sizeof(uid), "%u", apmt_node->inst_secondary);
> +
> +	adev = acpi_dev_get_first_match_dev(hid, uid, -1);
> +	return adev;

I'd probably just do

 	return acpi_dev_get_first_match_dev(hid, uid, -1);

but it doesn't really matter. Regardless,

 	Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

Cheers, Ilkka
