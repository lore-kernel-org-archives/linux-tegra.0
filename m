Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11023132.outbound.protection.outlook.com [40.93.196.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699C31EFFB2;
	Wed, 24 Sep 2025 20:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758744350; cv=fail; b=fV4fdy0lmp8Mph+YPxlsKIAQKMHCQaduUL0cAcxMdcKiz9PnI8nI3haU4Vr1BzKdQeKZZ8xnORYRvf6/9K7+waQgMu9iX/a0EuQhxzxiOjy+UKf6Hq9ps/yrbhRCW9iUxZELy156DTydlew5x3EBXGAf2PItHyG6yjklfo2BC4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758744350; c=relaxed/simple;
	bh=WrSmvKYt8pGHwdNZbftHRLFO1AX+x4IwXw7VfqSIhOg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=HuEXa+TDk4/o+Y2SkmHs0rNV5sAnnPblOR0Z7Sgcj6Pnh6Zfz4Wd+HgueDrxl+viY0kNbX6QYIf/W3sOlY4arEKYwZ+332H+oDDUc802NZKfT2mO6X2rEqVgjfq+uLhWWDL3hYjZU/2ZUeV+kAfUBwKJtsIxpTJHhSUBVPjlBAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=YexbOOd6; arc=fail smtp.client-ip=40.93.196.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="YexbOOd6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJBjLXs52p6DUukrcAWk71+MP76Z+J6zMK11NH8Q3fAM/H4uX/3aio/3iguI9FLY4sujJtUO2wkE2W+9tdpfdJqGw6qZwAQ3Y4yDTTyOxypJGFQ2TwQpCQWvOlL3DhIgHRRmpn9HgvQnrQ58tWS9GpS+FVmzxD2qNOYVajS7RH8C4ixEj5kR5dwopbGcy53gd616KSNQ/Y78b72oMk9knNuVV7DPkYDx/3+cQil6H6xo5PQmfpbZm3WIGYmlBTSAayp/c0rEzfJQ77W35433tj86Dbvboi5sIc8UGXAnXbeNm0dc78G0/hoOLFu9QDM6uLSyvrLKNyQH5fI8Xu41qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgKewKV1mjWkbkHnRx+H+k4+tCrD9s38d4g73EDRUlg=;
 b=eRXrv78GhvphRQYVrD0nsnUD6nw3GGubCTZ7RrYJ8XzNz7RSTpuPZBamdCeT5yyd3t3krcLzzodxtEko5wQakMivCE621AiSb2af+2TsmSZlcqifOr57zaKr38Sy8y/QMk6arAdAqbTvAyF7+FhzWxE072YlXGYH4vjlQB3k/PbUstZc5Q/mR2ae7TS/M0VugK/l0JtzS6F+t51AS0HBoG3MJI3L721kJz3RyQMzX3ZfsOtS9F0Gy4k+IWwRydcCO596rJY0ulMWQa1eaHDhARi34fzeeQohIku3hQGYA24rODUIlb763hfr1R6EIkDydcUzIMfyOm7Xbzg5Dhjvug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgKewKV1mjWkbkHnRx+H+k4+tCrD9s38d4g73EDRUlg=;
 b=YexbOOd6Zwa7qGOGbaukXoEHrjorCdsq/6XERlOV5qtFb9rCBBN9efPUDWfLTeldSTFerMjoBff/ol/acqEL4bpt9aC81xsf54uxLf5JXtxgdiSYrHk/MAi061yY21w9N9JuHGRlswxKBoMHYJ7VhlUdjxVZsmF4RUQnVetsgjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 SJ0PR01MB7345.prod.exchangelabs.com (2603:10b6:a03:3f0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9; Wed, 24 Sep 2025 20:05:43 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4%6]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 20:05:43 +0000
Date: Wed, 24 Sep 2025 13:05:40 -0700 (PDT)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
cc: will@kernel.org, robin.murphy@arm.com, ilkka@os.amperecomputing.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-tegra@vger.kernel.org, suzuki.poulose@arm.com, mark.rutland@arm.com, 
    treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com, 
    rwiley@nvidia.com, sdonthineni@nvidia.com
Subject: Re: [PATCH v2 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
In-Reply-To: <20250923001840.1586078-2-bwicaksono@nvidia.com>
Message-ID: <34cee8d2-822f-7983-631a-465db7784b12@os.amperecomputing.com>
References: <20250923001840.1586078-1-bwicaksono@nvidia.com> <20250923001840.1586078-2-bwicaksono@nvidia.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: MW4P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::21) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|SJ0PR01MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fc064b0-9c6f-4749-3822-08ddfba5be36
X-LD-Processed: 3bc2b170-fd94-476d-b0ce-4229bdc904a7,ExtAddr
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?86EbMbMHN4cEtJGacM/9Znsuv1BepJY+R7B/dyyoYhRya6NMpPgaB0T6jASR?=
 =?us-ascii?Q?XP+tVhIGSQvj+3aSjbQ3YPHsagPS2s3M5v/HQ/oWx/q+tI3J8g30s4+kYLDl?=
 =?us-ascii?Q?P0KK6E4wjDG4CbmJ/YpffbZGm20EO1EHxkAZNzjGsewgWp53oJ6mr799CLDt?=
 =?us-ascii?Q?l3ZkpwhQ5SLvPz3yo5hQT/0Y7ZQ8PH1IICiFs0YoWWFmcTrTRUQTetWoXMXr?=
 =?us-ascii?Q?oGpAS+dBWSTLdgAQG+v+9ZDt24/AVMTTjZI19ycYdJoQH1LKZVekZnupF7jB?=
 =?us-ascii?Q?fr88eMnbIWXQXHd6nBOa3mpYOWOH2T/0HWLpZmCK6l0BM94C5qMKsMSjQgbx?=
 =?us-ascii?Q?P9uI8ihoaNIPmZOOEz+Sjb1OckyZ/GnJwnZLh/m11Ym1nCqAW2H5Wq8EUj3p?=
 =?us-ascii?Q?w9wk9eRBJ08YHPr0t9pyRZxu6EGKmmiXhaetRql5ibWGnkCTg1v34JSfOtoc?=
 =?us-ascii?Q?w1JPI0wLGkdkCvmvNnmITbJklYRHErolAzlGfnd2gdeosd/a/lXSioaESpS1?=
 =?us-ascii?Q?gxHoBy8c9T3MqQ8JSJWrKqhYwWq3ewIJLuDK6cIrJY9UHMHAnMKsYc3C0Qy3?=
 =?us-ascii?Q?DcgWhY2loMosxqaAHnqhaBZjTIhHyEG7oKXnbxnrGQJjSdxQjjYVQnOYajuO?=
 =?us-ascii?Q?LKYrkIvn5/BmLB6nZcgSR8+fqDXSy182H4WHxFfYgtH9DedwnsZ+TGbBQ2h1?=
 =?us-ascii?Q?nwCyipp77Qgo5hJrucr0up4MLlFnQN1qXSnYXAVQZ73Mz0UR5gYaq+KYcNqq?=
 =?us-ascii?Q?Xap8+gWLbZgVk2wrZxt1V/La325X1KZSsnEsOZosn270uPFHgkQDDgqdsp2m?=
 =?us-ascii?Q?ShEdFEyaOMDOM16yT38wCRizmz7q1LKKVNTiVd9eaZ7uaINqO1wK6x+Bzd8q?=
 =?us-ascii?Q?gOCjHdZnekpkYyGmD/SjP+iBxcexXuSp5dmSAlcUZ1QALGdaXDZTtXlzUPw2?=
 =?us-ascii?Q?4lPiyZmnIr1BBk6hLwSxIyXK3AfZkPNBFP5tRrj5C1AZgAuzVWtgjyV9GOxj?=
 =?us-ascii?Q?Hy/8dtawXcltshk6BQk2DMQLla182p+9mMWQmk7VRrx55c2BhpVIdu5sSNaE?=
 =?us-ascii?Q?89PBQT0rEz3uKt+BhIkWg2UI+eWYLy4zMOkIz9QIxmSy+dZwbw6U9eHDrmCN?=
 =?us-ascii?Q?boEVgT8oGAs03OZcc8LYEHh+9jaSh3t6isRiahK79j7JxDyeDHJdLDwqXe5k?=
 =?us-ascii?Q?EbqvVA+rHpNePobSJMuA98jqb6jeeNlwmfJg5qrRb77/nCP+YCzkHgM56PsG?=
 =?us-ascii?Q?sFjaEM1DFJ2euz2G0kakcxHF/NQkx47Hgvq67Kw6fen38CLTO1s6ZNhqfBNS?=
 =?us-ascii?Q?cIp9POb7Prg8Gx46qK9xRf56i7DaRAMcq3ZRAzYgfSTi/pJpAbJhWqLcTCmN?=
 =?us-ascii?Q?3AmHy5wNCoJTp8Solfk0J8SjgoRXd2NRe4lzgkLdW8NgG8KGKG4aeBHRiXwm?=
 =?us-ascii?Q?39a8CTVE2CPKBmP42NuhfFykqyoFjKSrsBV6LqxGKObfYADh0q6Eow=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?JXMqgnfeqs7CnRDWFTEE4Qdf952CGeJPscDPUN7IXr/hk4SYsuhsgiGyUQBF?=
 =?us-ascii?Q?jXB++CIXgOdfQtDQh3n45eFpUvxWjmhJiLiqT9InUkyjMgdVoTYIINxj3V8y?=
 =?us-ascii?Q?eNCmseb85CLyMOlaZJl/FzpouLqdm6oIHEdNgZe5GRbP2YAFTVy9N/L0GPtF?=
 =?us-ascii?Q?1ONSQIwWKx6C/UvqGHQO9NaLAZtOgbhHRD1PFy7GyzRfV8Mv3AkvCGy1OLZS?=
 =?us-ascii?Q?MjrPhWsT+2sl4oqUjuDmnVHUadfjKRIdB+K+1ILqFRCeqoEmCdFBaCFk6Ut6?=
 =?us-ascii?Q?c6FHkmC4SwQLbN6vbxiOJ/+Ntus2l45QnF79vDZlsuZQDP5eX89twx8Qwbht?=
 =?us-ascii?Q?jY8BtirW8+IFGZk8V1MgMqlitT4Pg8UbovgGphUWE0ouZelgYh0mSXQiqRbR?=
 =?us-ascii?Q?oSI+km0GyXmiJphGfAKvrOpgOFz7PymrVVCbILor0HTzqR0EzokdVRbTAxOK?=
 =?us-ascii?Q?RNOubEjoanGVc8W1we/SAdEi6xcR8LmnNYeDMg8MT1Wa3a0TDfI0gsHNi97y?=
 =?us-ascii?Q?iLtqmo7WnbtYhduDy+5QuRoGGmhZsY6YxIV71HeVwRa4v+pCQG7kGY331ki3?=
 =?us-ascii?Q?quIF2tB9SN6ZiXKyvoYDzk9AeycY06ay0Il6JsuPYLZdrI/euVdWpkW200Xb?=
 =?us-ascii?Q?4kos0mWFore4GeLZhuizT4T6GNPM+i/q1BDwTZfFHF14LkhFve3v4XhoYBv7?=
 =?us-ascii?Q?V5N9OTpHcT+1uu30w+YQhv51loOwZjQNyhRXGtoh+vEQsBy5wKhmQDERLKM/?=
 =?us-ascii?Q?gQJXOeiIbztGtvUJ8XNXlb17b6RFraV5Co5v89uSFjk0c5oVkfIgxl781V30?=
 =?us-ascii?Q?BNpLCeclvFwgXugN0NZvupRvM+cdvMzEkCIQqzSf33yKYip4Ksd+LmZWJC3y?=
 =?us-ascii?Q?xXC0fxXuf0+2ejPrQKJNsiEmoToemfG53541yVOEl+aHYUEmzkqX6y9PdSde?=
 =?us-ascii?Q?c7Fq+AD5zlWr8fev1IuEHgUSJj8d4Ps+gqXc/aGyM+GB+kaISxY8LBaNhiRQ?=
 =?us-ascii?Q?uQE0x4ldcyPaOCNPD0EiRAyYYzJqSmXopvTWbeirZTebXqFV11kRBae0gKj0?=
 =?us-ascii?Q?2KkEJz8VtutPXH2FcaIGUAcw8ZeHzSnG60NHq7MDJy0/e6M4XBHmmLWaF/DA?=
 =?us-ascii?Q?A5fLFGQYoE9E+otyKxBf5JHimfRgnpZe+kHMuOsaO7l/KndmAYfaPqgXCPs8?=
 =?us-ascii?Q?jFq54p7kECiln3SkpJC23uBs6hZQ04fl/HCNC0LwwWKDLviZVwKvbfzxIPs2?=
 =?us-ascii?Q?rhqh+Wna6kYip+HnHb3l5f3tKGduOS0sQlusdMB4vEWGpvVe8ZzFTd6bPWHY?=
 =?us-ascii?Q?FnpZwowDoAwU1V1IHXZEg4kRgXZvmDd+nwUYCFdpdbpHpo8Z42SOs4gQpwj2?=
 =?us-ascii?Q?FEGF/Ea7GdJMWfjeRZyOp+t8PVXdEA0jUb0hH4YqkOGyjjLoXXLuBzMaPC4F?=
 =?us-ascii?Q?n+kYTLevOahuhVuju2NkvvSc8qRN4S8qzedPfmhA+DvPFhGq2EcUdZiBXBiL?=
 =?us-ascii?Q?jcbI1jQV2lAYMfWiuQEzJfvgZNegwKO/W579tAI6csD7d3VUObq2RXn47FBL?=
 =?us-ascii?Q?ieHwwPPrnAWMF0EU8L2by39f1FPqlC1IY8hvgrt9Y5FOEnncRAIn+NLdn2eH?=
 =?us-ascii?Q?tgStNVoQP/CWBsTis9ZRly0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc064b0-9c6f-4749-3822-08ddfba5be36
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:05:43.8063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sC8qRcbPoi8w51Whq4OD9oxd+1Kta63EOSaEcG+EEgK83X+IZivtwspJDucaafnbK2He6SpPSZaWKhMTNaMC7zxlS8/V3kzwZ8umzvsPChahkMbCeBPUogdSFVQaNY9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB7345



On Tue, 23 Sep 2025, Besar Wicaksono wrote:

> Add interface to get ACPI device associated with the
> PMU. This ACPI device may contain additional properties
> not covered by the standard properties.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
> drivers/perf/arm_cspmu/arm_cspmu.c | 22 ++++++++++++++++++++++
> drivers/perf/arm_cspmu/arm_cspmu.h |  9 +++++++++
> 2 files changed, 31 insertions(+)
>
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> index efa9b229e701..75b2d80f783e 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -1090,6 +1090,28 @@ static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
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
> +	sprintf(uid, "%u", apmt_node->inst_secondary);
> +
> +	adev = acpi_dev_get_first_match_dev(hid, uid, -1);
> +	return adev;

I would rather drop adev completely and just do
"return acpi_dev_get_first_match_dev(hid,  uid, -1);"

Regardless,

   Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>


Cheers, Ilkka

> +}
> +EXPORT_SYMBOL_GPL(arm_cspmu_acpi_dev_get);
> #else
> static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
> {
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
> index 19684b76bd96..9c5f11f98acd 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.h
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.h
> @@ -8,6 +8,7 @@
> #ifndef __ARM_CSPMU_H__
> #define __ARM_CSPMU_H__
>
> +#include <linux/acpi.h>
> #include <linux/bitfield.h>
> #include <linux/cpumask.h>
> #include <linux/device.h>
> @@ -222,4 +223,12 @@ int arm_cspmu_impl_register(const struct arm_cspmu_impl_match *impl_match);
> /* Unregister vendor backend. */
> void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match *impl_match);
>
> +#if defined(CONFIG_ACPI)
> +/**
> + * Get ACPI device associated with the PMU.
> + * The caller is responsible for calling acpi_dev_put() on the returned device.
> + */
> +struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu);
> +#endif
> +
> #endif /* __ARM_CSPMU_H__ */
> -- 
> 2.50.1
>
>
