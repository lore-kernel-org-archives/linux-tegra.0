Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2106.outbound.protection.outlook.com [40.107.93.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B584230FF2A;
	Tue, 19 Aug 2025 20:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755634573; cv=fail; b=aPXCtWTmqHJbyQds1b6K6UdnRnuwPzNCs7Ihpn2TbJhbYK2LHmilPigr0HMUlaRBGnA8D7vsc14U8NiR5Uyj4EfaHW3QrQaPP5wR1dLloN7gScDUQnhhAoAw7zj0iHXJJPslOon37T50hMmNUaKJgB7NrNNUqxqi2XdwmcPvbt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755634573; c=relaxed/simple;
	bh=IgBPLQ3ZKRi7xtCLlq1OSoGBLvdEd4jqv0NJ/l69i7U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=AMem9QfSzX61NNsbrrRaUg8/1xPqzL/a2a5SvgkplcWQFsA0mnG4tQUohfYPWZY3r5SkuTE6gRYsxzUzA6Og4RaZVZ+WaE+w6tVXH7xBHf4ACMf2tSLppWNfQxQ3GOGIBhFDaYGG+c9FmdywUzjahqiKHflAkpeDDMrgiqRIsAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=NMF46rnE; arc=fail smtp.client-ip=40.107.93.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="NMF46rnE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Au3LxLODlS4YkYdTsfKoY14bVLKvOceLD08PwgG/BAGMXUekIoVM21/RAEHB2ebNBtezUqbJ6Ma16rEYMlixKp+JeuOPyRCvCCLHY5NJCm+iwbV9NPI96fXsWc+xUF5HnMNxA3swGe+UNC6pPH1vqA+zkEL0EyMueK2WRZuIwuPRYuJcGPsbKQj1Z18ilJtrHJdEdCzXyLpmKdO0aalKZsiF/ukPf+0oYr1pPWAuDryCgx9Glnhqax8EhNhulEFvVBfsXFf84lB4tWJkDg0VDjuEjfLW6LQboMQF7wmR4yRhuJwH8j+sFhQMsu/6LhPPi2xVUwHDempnw815uQ6Xkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTEr5AtdtP6/ZeFPn1IHW1EB753QSY8qntGgQZFucw4=;
 b=Wh9RjvYE6qUlEfNEChUhLjxQdWQBexnqauENyHiZTIk+jOXI2JfztonoMreQxWWnRs3xJO9yIevIg3Y5+wfD7bPPKxJqg3gZhwa+F7ejsE6no//oTRoRhjiGn528K1oe5KY5IhHKI9a7KBZxJ/t2UofrC1MfrkdKb2JwNszp7/qlxVKxcDHruzXRT2RlfLrYTGS6eksQGUNtUC2jWjyYCWjQezB8c4aWAwJOjwpr0vj2xYVccWAxZivP+94vhFyvrfF95dzRTxBCoGHgqpFR60IU1Lg+rAVBZOlehXD5WdU5w9WsbPu8t7Mix5rwsWx8OEDxfbyL1MSuxwk/ErXtOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTEr5AtdtP6/ZeFPn1IHW1EB753QSY8qntGgQZFucw4=;
 b=NMF46rnEFPp7V+VdlsHH15o7gleiLQF1lGjDWWzFEwrbihkMoVuXk+pq6FPUFwta/BilM5H7sUcJCMS2hzM6E2bOQrRgbKt70qQ3TklJ4NTcUxTu1/Xp5V7yN6lYBrC76sBpg4Hz2z3jEThwgi+Hlvt0ebEMY282GJYSsLIL+X0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 SA1PR01MB6527.prod.exchangelabs.com (2603:10b6:806:187::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.24; Tue, 19 Aug 2025 20:16:09 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%6]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 20:16:09 +0000
Date: Tue, 19 Aug 2025 13:16:01 -0700 (PDT)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
cc: will@kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
    suzuki.poulose@arm.com, robin.murphy@arm.com, ilkka@os.amperecomputing.com, 
    mark.rutland@arm.com, treding@nvidia.com, jonathanh@nvidia.com, 
    vsethi@nvidia.com, rwiley@nvidia.com, sdonthineni@nvidia.com
Subject: Re: [PATCH 1/5] perf/arm_cspmu: Export arm_cspmu_apmt_node
In-Reply-To: <20250812233411.1694012-2-bwicaksono@nvidia.com>
Message-ID: <88a25a26-109d-b5cc-4bd2-776c3c2ba113@os.amperecomputing.com>
References: <20250812233411.1694012-1-bwicaksono@nvidia.com> <20250812233411.1694012-2-bwicaksono@nvidia.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: SN6PR16CA0049.namprd16.prod.outlook.com
 (2603:10b6:805:ca::26) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|SA1PR01MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d6dbf0-eace-419e-3ed1-08dddf5d3c23
X-LD-Processed: 3bc2b170-fd94-476d-b0ce-4229bdc904a7,ExtAddr
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?JUkn+wIOxqAtoLNlqq7swYVU0OiV/CEQESTY6+H3nDjbsvfufIBA8spAaniX?=
 =?us-ascii?Q?R0G7flAOM2s+y/zs1x5xxSe2MojcZLnV7CZGyhKpD+UJHuBrn80S9R9vHGTj?=
 =?us-ascii?Q?bbsEFRz6Gpu3IoeSGgg9yW06c/f/DUAi/dM+IeB3slmKcUea/LxDUZeaXj63?=
 =?us-ascii?Q?Car9J5L23NG+HFDMg5wqTyh+okkDTzeM8mqqN2bEn7Vo5dS/SilfLcCBgpEb?=
 =?us-ascii?Q?XSj6MN8DzhUowGawnJdpSegyF9mROe3n/wJJmN7BxJ9DeFQYDGJNTVzQdWkf?=
 =?us-ascii?Q?V8fENuzoG1RxhSxdws9arThjOOdFgeL5P76fqXMw8tKLMHGScs8cXRl+3CtP?=
 =?us-ascii?Q?VZcaO+6uhtPMWBa7kqZGSZ/XXoqK2KpkyuLnvPGlqbk1i6RfrZ14Pq/tmFFL?=
 =?us-ascii?Q?q+40kKdg/zqOAtS/eB211kzDwpz2KLxiOLHqmv15w14pDyHoJbYUOxMUn54F?=
 =?us-ascii?Q?bKLUdMDoblX2XvabmG39XFiFYwF/T+P5ICSqNOH3+FDRlLt/EBUxdcoeKrCg?=
 =?us-ascii?Q?1a3bQzJtKolrwIzmQ82JX4DcFNZx87KOGAGIk2R1ct2+FP9KYnh4kyIBY5lC?=
 =?us-ascii?Q?jvYuSnZIqbz6vOIxZf3Yg9OPQqZRjcITWL3BIrFjWVp5CCY1pb0l0wi4T16x?=
 =?us-ascii?Q?T5NRJxPnPYrPpL90NMEZMnAM7Wg94RbwwFwhVIVzihgcRiKIjUmB/7g3jDnn?=
 =?us-ascii?Q?d5lPcdQ6ox+sB4glEWKknhzjwGNEBm8xvAjGkWdEJQdTRlzy4UFDC+0kV7Mk?=
 =?us-ascii?Q?+vkyyTIFrrZLUfsc92jNuPzpEFSd9ZxwiRTgZ+sY8RuF+XKVLHP7jOc2A5Ac?=
 =?us-ascii?Q?X5HnFocF+s3mBehX3pMSWGMrJKnY4btXU9Q/PSa7RgOewAl5+VYtJSLh58on?=
 =?us-ascii?Q?TWaegP6xR0VgiJ58wktVaZRDUPfxu9Xtx/gHjHJEzEhsKD4ahBTRAun8/JQ/?=
 =?us-ascii?Q?LBEm/ySq/HvpV+B8FuNROGA6lCDtEy8vV5NbKQOz5tXXT849c0XuF2jS7prT?=
 =?us-ascii?Q?ngP9up+T2giBAJ8XRxMOuh3DcHmwcl+3Et7pcQatY2l5uaxUorZPGNtwIYOf?=
 =?us-ascii?Q?Q2Ud0IFQKLnM7qI+BUvTRhk6V2BUD+CZ0Z7/7G2VCWF19IaogyWSGUrLeR8m?=
 =?us-ascii?Q?ZXoYHXMh9N4xZUkP2s9/52WxNyicukaYqsxuC4NXmo12mogBzFx29Ku5hZAv?=
 =?us-ascii?Q?leQXQR+rUYb7/X1s8cEgcKnwzRhTL3PHgXEYUxNugbDSwy4TPp2lM9++K8lF?=
 =?us-ascii?Q?AeK1GmZOg11zyaxvwQ7BkTQ/tCz4VPWjZebm3BGIXo+fNfAy/ledORqtBEDF?=
 =?us-ascii?Q?+F3fjrM2uW28ddAFO+MG7atFIw9kArMf29tbCWyIxYYqtmURO4Rgva/MAOAL?=
 =?us-ascii?Q?B327d5u7dQUKHjsRvn+Dw0w5sQE2oogUaav03f4ezdMrYYXfTZe3mpaxQXuB?=
 =?us-ascii?Q?h8Olo8ufOLmEsOT9jd/6Ih/H6POvBPJmBqK3tDur5eLLfGGqFPYNvA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?rgjewn73h0875uEwx3wHbyFegSpa9QHllkivdzNfSitpufi79b3Okm2YUBMP?=
 =?us-ascii?Q?KA7QIbF8USzWJfVNKNasDBS1auT6NOKBPKDEUheysv75SghDLS5F4ncEUtq6?=
 =?us-ascii?Q?RC4mu//ZIDO0z8TRmlwSTp1ypqX3kmCPcSrOoT8KKQSbDnPmpIQitm6y4P8H?=
 =?us-ascii?Q?9A5fFqSuBbCVUBiQaRwbktdjXHFh+7BwWUnuUuNLkpuJVkCBPz8SkrtX/M+S?=
 =?us-ascii?Q?sessvpkr9hMgAXUma7i9LR7ire7mmH6sgjDyetfnr30N5G4PnzfzlY41ZubD?=
 =?us-ascii?Q?VsBcgzTAiR+S2Ll6vkLB50evqivo0vc1MFk55LnfJRJ63NGBFhMRnhyFJ5XU?=
 =?us-ascii?Q?9GCkNtcMgnvEW/eaNxOY/6KUJXVVkwq/1TE0I+UNL7kqp35bFEtPioo1yjeR?=
 =?us-ascii?Q?hbhRop6VexQVaLIpGzQO91/AsziNTcowQaIbLeW2tc0dlL7JYPMCtl/emBOf?=
 =?us-ascii?Q?/ewyExApVbxoEt6j/cE8A41EFS1SE0WY4vtlUbtCrCepaeFtHR6Fnt1V13J5?=
 =?us-ascii?Q?vNckI1Tp7gUxRzcoYpFCCGCtsjfM1GrXn0atCM9IagWjh5ZGZIr1ccNCn1kE?=
 =?us-ascii?Q?rSoKZ7iycYZ+aybLhiWiP8M1dL4CjLQwjwP0mToAebU0hHk6C6tq1e7SvNM2?=
 =?us-ascii?Q?1N18TdznuROkDT7xoG3CV5mhDL4l7VOISvqBqbCFcMNiejM5ngeCppJsYxxb?=
 =?us-ascii?Q?kQkulcBATN1qS+mO1tgmgt9fKqlWgYRUuU7ZUuOP63IeK5SSkUYKxCBWa2iJ?=
 =?us-ascii?Q?BKjwX9sKi9O597cR/+hZCeBpbdBFW3lHssVfNrXHwNG8IhRO8kslxiYzHpCS?=
 =?us-ascii?Q?Mo9zhjE68K8Tx8+Hb5XPW8EQC4xJeHgosb6W9T/zTz8AyGgGTtOPUNwhziPE?=
 =?us-ascii?Q?Cz+UgXo+U01vZihuf5TWvoFspG2uB8TiziE1TWiMSAlA8Te6KzX93W7OSBdm?=
 =?us-ascii?Q?VhfUFO+jew0GEdo0kbl+TADMgMZFid1YcSlCC88xl2ngVR6jVeP1T2LQ3wNN?=
 =?us-ascii?Q?9S3ykDUoArjN4NVqjhG3ud+Nv3ng/H0gi6XN/eBWfzvGrbc9/wa6y2Ned8Xt?=
 =?us-ascii?Q?D3xGZItyjDfYhwGkxwZ8hZnXhEvtFZyoF+1QChm3syDoSKJ1EmYMbeZ4WJWh?=
 =?us-ascii?Q?vBNqSt7dSZUzrkq6v3X4e8du4MvZHat/NNSgqOGdH/F88kL9BMivnNbSeQHV?=
 =?us-ascii?Q?q2Kw5Exp2Pm/TApbHYOoqKwEJAwIWPUGs/Znl4qUZeN2Ihnjyu2XWGgi1WLA?=
 =?us-ascii?Q?ksA5fUDElWfRX7yl+7E8J9RngG19DD/pBrf6zIEPGP46Lr7VSqL7DmHAJnt6?=
 =?us-ascii?Q?LHZhPTzUYbhlZyk5D6YE+sS6IsPWFLe7KGf3mB2FI9sBzW2EMJ4cg6r3asAV?=
 =?us-ascii?Q?cdKn+L+cg7/vwCZpnPFa+QC9sddR+Pia1mUO3uxPFe24P2cvODCP11N8Nw0h?=
 =?us-ascii?Q?yrTdhemHyJrxq08qrl+3qVWYh/CMpObLaxjLo3G1zR8/dqQlbfiCGIoPW3W9?=
 =?us-ascii?Q?qwflv1jPl6V6yh0dGJtkXaI3OdxtB6rBdviH4mIEFxAUG4TPvOXxlApf4pd2?=
 =?us-ascii?Q?v+PMeLA7RZpbUPfvpu4ckf/XsbAlWV5UOUeb+N8mWN61YO4Ajx7P4EUJkRam?=
 =?us-ascii?Q?yrivUXSvfFrEBucA2VE4+wk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d6dbf0-eace-419e-3ed1-08dddf5d3c23
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 20:16:09.2153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2w5LrJOd5ryCeu9OObbsrZRMKLG8w2ZGocwSYPMRwfJixSsVNEswJq75T7ePw/3/aOmHknt5q2XP+2tSHSja4UYVlJ4vM6K8tGXLfZgGGPL4e5YHF/8secpS9ZvisGNC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6527


Hi Ben,

On Tue, 12 Aug 2025, Besar Wicaksono wrote:
> Make arm_cspmu_apmt_node API accessible to vendor driver.

I think I haven't seen the latest version of the spec. So, I'm curious,
what kind of information the table has that the vendor drivers needs to 
have access to it?

>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
> drivers/perf/arm_cspmu/arm_cspmu.c | 3 ++-
> drivers/perf/arm_cspmu/arm_cspmu.h | 4 ++++
> 2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> index efa9b229e701..e4b98cfa606c 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -70,12 +70,13 @@ static void arm_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
> static void arm_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
> 				    const struct perf_event *event);
>
> -static struct acpi_apmt_node *arm_cspmu_apmt_node(struct device *dev)
> +struct acpi_apmt_node *arm_cspmu_apmt_node(struct device *dev)
> {
> 	struct acpi_apmt_node **ptr = dev_get_platdata(dev);
>
> 	return ptr ? *ptr : NULL;
> }
> +EXPORT_SYMBOL_GPL(arm_cspmu_apmt_node);

Rather than exporting the function, wouldn't it be better to move it to 
arm_cspmu.h instead?

Cheers, Ilkka

>
> /*
>  * In CoreSight PMU architecture, all of the MMIO registers are 32-bit except
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
> index 19684b76bd96..36c1dcce33d6 100644
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
> @@ -222,4 +223,7 @@ int arm_cspmu_impl_register(const struct arm_cspmu_impl_match *impl_match);
> /* Unregister vendor backend. */
> void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match *impl_match);
>
> +/* Get ACPI APMT node. */
> +struct acpi_apmt_node *arm_cspmu_apmt_node(struct device *dev);
> +
> #endif /* __ARM_CSPMU_H__ */
> -- 
> 2.47.0
>
>
