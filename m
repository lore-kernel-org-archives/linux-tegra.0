Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2103.outbound.protection.outlook.com [40.107.243.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ECB21578D;
	Tue, 19 Aug 2025 21:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755638781; cv=fail; b=dXaBodGOTAugNrGqPfeeIkESFBowIDB9BGQEsStlI+dWDZNwKBDKymdMT17ZyBZLAim10R0d0Ap1C36s6Ibt936GZV1CQeTRrw44GUjFENHgLrLyesAAhgV2Ud2EUw3Y5qYzVJjFs5Jzv1+5RtyI51svEIDu+/+cCC2PUD74jQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755638781; c=relaxed/simple;
	bh=4FZge57ecbLWqh9xZWYxm641j5xWgawLSrMzQl3FuWo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=hXU/4V4G7V4p8t2JOTY5xWs4Ir1t0H6FnoYvQvmTcFXPzIBmU31aXTw4ajzgEOlRSYlN+WthINEl5nGzzcCpBcgZwE44Rms2Gn/6ihOZcFyZ+2OvE96CALmSD7Nfrt7IFWWA6h6TXyaSatSubFEdYK+9d4/NxnY4qzfghIwrSWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=MJ15i9/q; arc=fail smtp.client-ip=40.107.243.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="MJ15i9/q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJgk9lrgA8JBB/GqXN724SHunT4kVPRcD92Q2BfziNbg8LDzTKVQaiNPvBX1VWSAcwhcrN01qs+XM4n2YeilZrWrAa1H+WhYDZ7/9j0cw47+dIUUC/eTzBAic+CHnxsZqlrD14xRdY0/2BybKjSeg6W3KsbCYWfkpS0ay55snXX9gp0lR9jQDFrnQT/laNOwW+uWgOR3x/UhcSj09PbeB2lnSBzhM80B3Jpau707hGww6SIfQBIPGbtZPA8x9gR04F4+TAv+9ygzADlY2y1hulkAfeD6cdhTFeu/3BE+9Vxgx89rpwnYsiXaXNZBcf11EEJ49E/TlGqarZ3U59K+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvIZvPGVnLGM2xp6bNBDjEAC6gQoW0codP4/hW9bt0M=;
 b=E1nRx+/wnJdycMyWS4DyyJWoVmxTHdWRcwPC+2ZVtdXlxG3bHz1JfPVFQ/uPRuODSycI/59SdVuzTGN/XRonNOsvrpbBwZfo9gY7CHj6/+rjg8zKqFwcu9mqqln4QbIVRESmkGzNcZMo2EMOfpyR8S3Krntmwlzy2RzNR73Hgn2e0VZfTv/aaNsZCoomZNHIE0xPSPMENkc6TN7pIErdz/RKYK/5wFIM900lEGGa5Mbt5NEEkUYsz/hKzc/lCT3Enc0MDzTxi8aXz84L7A8cccllnH7wKAPiQn/ie40EfUWQDl6fwJ1gXTzZsqVVcTKZKKyTys74lYfiyw0lqwwy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvIZvPGVnLGM2xp6bNBDjEAC6gQoW0codP4/hW9bt0M=;
 b=MJ15i9/qzA1SRQkHVwFPO5Ygf7sb7PkWRh16jwDJH6h8CB6t7oN7dUWmY+OIVNpho6kQCbZhhS7twmdHASEaQmyrlNLshh6WX03gUJU3yHecR2Mzux6w9ypd+vZOrjMQtWKfWGYX9YsR2WXWh+nx0psvHsjDgypYci0vwjHUIvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 MN0PR01MB7681.prod.exchangelabs.com (2603:10b6:208:378::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.24; Tue, 19 Aug 2025 21:26:13 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%6]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 21:26:13 +0000
Date: Tue, 19 Aug 2025 14:26:08 -0700 (PDT)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
cc: will@kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
    suzuki.poulose@arm.com, robin.murphy@arm.com, ilkka@os.amperecomputing.com, 
    mark.rutland@arm.com, treding@nvidia.com, jonathanh@nvidia.com, 
    vsethi@nvidia.com, rwiley@nvidia.com, sdonthineni@nvidia.com
Subject: Re: [PATCH 3/5] perf/arm_cspmu: Add pmpidr support
In-Reply-To: <20250812233411.1694012-4-bwicaksono@nvidia.com>
Message-ID: <44873beb-f296-5ea8-c349-ca2d5f8eab94@os.amperecomputing.com>
References: <20250812233411.1694012-1-bwicaksono@nvidia.com> <20250812233411.1694012-4-bwicaksono@nvidia.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: CY5PR15CA0202.namprd15.prod.outlook.com
 (2603:10b6:930:82::17) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|MN0PR01MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b17887a-0d5a-4391-cbff-08dddf6705c7
X-LD-Processed: 3bc2b170-fd94-476d-b0ce-4229bdc904a7,ExtAddr
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?0Z6g5Yye7YN1xR6Bh9C60dy2XLnCFiLyaDNhyB75uyNAblQwkqR9ixeMp7h0?=
 =?us-ascii?Q?nbAUXrt9KHKP2ldg0Ll3g5PL7LU6Y1Ws4XIiebICcttVuDnZC0GRo1mInIUT?=
 =?us-ascii?Q?88KTp1/jd1t3DAo0NoN2hu24hbrw0ICj0erKZvUQ+FMba2sHOVQF7YPX3wvD?=
 =?us-ascii?Q?lr9eTGeJM08KTvloqt/aQsgsAdmcUvRkwD1gw0WEBtbP0W4uTQTgcW3NBKQQ?=
 =?us-ascii?Q?yfvaTzFZSffS2xYHuNGVCYyptP1HVC1h5/+bOnkXnz2Z8nCXAcRTrpVUqQPA?=
 =?us-ascii?Q?SylU4j+s+ficZmOdCB+TKGrv6sBIcNkMhjHAP2hCcHowkOLw4RKMQmOmLJIg?=
 =?us-ascii?Q?iFTNGM+H6RW+OLa2XyNMjwe2PoMiKJiRLazLmYMkJ6ErJU/QvLCjuUlfyQxR?=
 =?us-ascii?Q?E/dDj/rrUhwXQxr5YFWC/IJ67uWry/C9a2hA7wo9DD3kUPMfxTAPpmSnYgqY?=
 =?us-ascii?Q?TXkY2/gVnUYO5zRLwDyj2tYEzXC4LbUdTYiMQD/w68wSvmd3VSNeQW55ucvq?=
 =?us-ascii?Q?k7drfMlpYc9E2LA4gyXmPRVQ5p/Z+YUJyAmurcy7hQcFKhUOH6eLAYpUhdxW?=
 =?us-ascii?Q?EaRywiAgt2JVp+pX+Iu1DO+Rw3eu6nQfqd0uYJaCBNdCpX1WXPNclgO72pUl?=
 =?us-ascii?Q?Db5rQqP4IopN7VVIZr0PPPKt53VG5n+1ASj+dqjCf20syH3K0JJOEFmKwp9k?=
 =?us-ascii?Q?kk4PyL3OHzdOljkMDprHyGwNHIrEfbBPkJ8K7snCg3Oal0T1vDaJYZEqsjNr?=
 =?us-ascii?Q?yZUxsKxB7QIh0UsrMtTKMmB463RP5V5El3ptTQTlUl76R0XBinqWucNbwbTR?=
 =?us-ascii?Q?NtycWTINHKCy6/US5vIge37pzLo1vNE3WvBxCCiIDruj/Yu93uT8FKMT8LNb?=
 =?us-ascii?Q?VbMhcZ1sH+hLImvSmRfpu8I6fDlQN0JyPoEDhuo9or/pyKgSYTzRMLX+yJGi?=
 =?us-ascii?Q?FO4gzZWeHygUdvfH8BYhlRu0isfOzF8sUcfH9YDcofjWUfFtHgNSGo5FAwuI?=
 =?us-ascii?Q?8RtuKmiYM76F81ZV596XDr0koeBQk+Gw96qC5HZ/TAgWZOPQLKjr2yxoWkF/?=
 =?us-ascii?Q?PKi2xm28E+F6ieGK9K0TAPbKy1d2mZcsiytLv1OKtWXdTVTmPDCGHt15iWbA?=
 =?us-ascii?Q?r+D8nBmgbRAU6n4EYgBykb+zwBKfNnf2ESZzW2C8qElel9fE/WyfDkV8/Yzj?=
 =?us-ascii?Q?JjKDoXuW4/AiNzjceywGPgt/NpWRJDArPQYq1zZ3x/SFPY//DFzOu4TmUaqj?=
 =?us-ascii?Q?EnN3GFrLFLYletZdpyr0PNcFYCrMh4sB4iE6KHWCmbdV0Lmw1FE/0IaAPxlb?=
 =?us-ascii?Q?WOKEZ5Pe0A2jc+cG99oyDJOKnJ1C2ci+PrqtOMg4vfXHjPoSqOoUGoX4+M6c?=
 =?us-ascii?Q?peWNbyKaPM1bParm56MeZBy30TufRdQXcMhUbKxmAVKw1b9b/3Ivf/o2s/bB?=
 =?us-ascii?Q?+qbqyaFszHz/QBFIpr49+RhZZm5bkf9749fET/cdEopjVQ2P43LN0g=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?bBi3TQOqtwH4PrlXnxARX7Vtv8fDOKu1ytnzpmcNRmbW38uvhC6ZRlyHuxOp?=
 =?us-ascii?Q?1Q97TkJ48G1fiTYsR3t5m5qLUV0joiTYCuIrBk5JCQjy+3E5bCFgf7j0ETKV?=
 =?us-ascii?Q?dCgfef+hX0UV1QZL0x7HCeLrecdrDbCGysWsCTaN60YSLjkirEktWQSQzd4I?=
 =?us-ascii?Q?88q1x8euCTPd9finUkHF/14S7Q49lkvk6MLSZ8shIgVDtSEZL2JUWwhMH/N6?=
 =?us-ascii?Q?t9mdlyS21C3JsQ0zZD9PIcn10vbVFsZcH82HsNm6dtqyeorVt5wMIbjJRopj?=
 =?us-ascii?Q?789eCtZPJPByBwZVb+JsqK4PRQJNNC8zI3bVJMOEUyqnh+M4kkXnAGVGM1dw?=
 =?us-ascii?Q?rUPogCjB0G6OR4BsanloeQNNknQ0e49N2Q5xiw6ob/gT3BxhnoC2CVJiOo+0?=
 =?us-ascii?Q?q41PnncmdjepTPOfdFmjkyJYFIzehvJfWge7uOw6L03YtP2bpshB7dzxkZIJ?=
 =?us-ascii?Q?YBK2Lx1oAys3Yjr5TXx26shcq5Gt5S0UUr3HpN3/BvlnqRsmzlGpmDyM2kSx?=
 =?us-ascii?Q?7Q1K0edCYjx2gsaZ9qY1uAPyngYAWRSbfGojYR6Cs14dnJxIlJtW124btTIu?=
 =?us-ascii?Q?vYmWl7qF/VLTFwLPcfwWfRsCUJGXTwnALrP2lHvHZd2qlDXLIOQ5no9ZhISC?=
 =?us-ascii?Q?SOAEmf34ZBIwOYSE7JYslQwwItG5VhT48bu1mzPC9o6VAFw5UhBhZxY5rVHe?=
 =?us-ascii?Q?p+/A1/vC9a5iNCt1Zg2+PDTMBTwdjHaj6H4ww5GNodl/zAcKRfIDooMqzKQK?=
 =?us-ascii?Q?Svj+voYFVWeXJeXJRrE5mNqX/Sky66wgdZjhAIvtObctm9KhN4/frQGUYsNj?=
 =?us-ascii?Q?Fa5q99m8yBh7ts+mCbqzo+7SGYbauhUHI7ab40fyvpOsYG0N8CJ70l30RDkU?=
 =?us-ascii?Q?LMPxymodi+08yjAuEGoBWA3Igfaded6vQPPW8ExQGM5glTCWJIajN5X4kIVt?=
 =?us-ascii?Q?M2SsVJrVLWcyrar8xaMAna2RgLvr5b+dteEodVRbk5QtJ0LfdgASYcWH1hm/?=
 =?us-ascii?Q?hLY2h9HkFwTmmSeaOqqhWYhCA55EmL9evqrJn6sDGow2OSvir7+YxuwtIxT/?=
 =?us-ascii?Q?5RSCPAzaXP55VV2uGPa5qcNZ4bJwv8lHtRv7wduKpBC5ek6Ryg7HDsnHdvKe?=
 =?us-ascii?Q?k23wJAdqpSvqE5543JyxNkH5AdR7l53mL2knsuDFr5LzLKwbbkzmkFqOuerz?=
 =?us-ascii?Q?BI2nXI1AZVdN8pYwK5HcZQPnFWzzmKrgADuZwfuSxcHshBQQj5IFbAduzJKG?=
 =?us-ascii?Q?rOy6UvCXwC9ERf7B0/3DYCVNAFmYSEen4i6b2Mg/EnxipmS6plNRL5DF7wJR?=
 =?us-ascii?Q?1OMWlCsv1oAOYqiVGGhdO0XCp2UQ9e7ouKIcLplz90fdmAxeuzPtMra7z4a2?=
 =?us-ascii?Q?on0Pum5nr8/8f5cku/qaYydztHUMbnz1RaMgOdBxVYeP6ylIRTz/50IhI1BF?=
 =?us-ascii?Q?Zypo4aOnTiGMZg2aM/NfuAK57EXEEfTDj9AiaId4cXJbhlvOe62LMYiawYRx?=
 =?us-ascii?Q?IxlBCwfD5axRwMugtQBxV5AUqZ/MvQ7O2Pl8p3+b8ZNsBqyqWFUmXJS6yG74?=
 =?us-ascii?Q?ZFu4/riivkbOBn/sySZAxvwen9J+QQoNQcJyMSIdgpOmQew8Y90yzdp9P4Op?=
 =?us-ascii?Q?79XQqDUFUiDk6y5HF32NWQY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b17887a-0d5a-4391-cbff-08dddf6705c7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 21:26:12.9542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gEfB0yWQDaUUeS9Pmlk66qPAasZyc3Q6ugqieFxfqmm9qCzL/DNSNiMb9lhDxEKdrXF/9+1h9ZdFGFIjbjdKsjgHjtTjqekrPEQzfJHCyeJ6qW1dC6eFmxSapj8TK7n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR01MB7681



On Tue, 12 Aug 2025, Besar Wicaksono wrote:

> The PMIIDR value is composed by the values in PMPIDR registers.
> We can use PMPIDR registers as alternative for device
> identification for systems that do not implement PMIIDR.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>

Looks good to me

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

> ---
> drivers/perf/arm_cspmu/arm_cspmu.c    | 44 +++++++++++++++++++++++++--
> drivers/perf/arm_cspmu/arm_cspmu.h    | 35 +++++++++++++++++++--
> drivers/perf/arm_cspmu/nvidia_cspmu.c |  2 +-
> 3 files changed, 75 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> index 595e4bdd0b4b..347aefbd1704 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -323,14 +323,14 @@ static struct arm_cspmu_impl_match impl_match[] = {
> 	{
> 		.module_name	= "nvidia_cspmu",
> 		.pmiidr_val	= ARM_CSPMU_IMPL_ID_NVIDIA,
> -		.pmiidr_mask	= ARM_CSPMU_PMIIDR_IMPLEMENTER,
> +		.pmiidr_mask	= PMIIDR_IMPLEMENTER,
> 		.module		= NULL,
> 		.impl_init_ops	= NULL,
> 	},
> 	{
> 		.module_name	= "ampere_cspmu",
> 		.pmiidr_val	= ARM_CSPMU_IMPL_ID_AMPERE,
> -		.pmiidr_mask	= ARM_CSPMU_PMIIDR_IMPLEMENTER,
> +		.pmiidr_mask	= PMIIDR_IMPLEMENTER,
> 		.module		= NULL,
> 		.impl_init_ops	= NULL,
> 	},
> @@ -352,6 +352,44 @@ static struct arm_cspmu_impl_match *arm_cspmu_impl_match_get(u32 pmiidr)
> 	return NULL;
> }
>
> +static u32 arm_cspmu_get_pmiidr(struct arm_cspmu *cspmu)
> +{
> +	u32 pmiidr, pmpidr;
> +
> +	pmiidr = readl(cspmu->base0 + PMIIDR);
> +
> +	if (pmiidr != 0)
> +		return pmiidr;
> +
> +	/* Construct PMIIDR value from PMPIDRs. */
> +
> +	pmpidr = readl(cspmu->base0 + PMPIDR0);
> +	pmiidr |= FIELD_PREP(PMIIDR_PRODUCTID_PART_0,
> +				FIELD_GET(PMPIDR0_PART_0, pmpidr));
> +
> +	pmpidr = readl(cspmu->base0 + PMPIDR1);
> +	pmiidr |= FIELD_PREP(PMIIDR_PRODUCTID_PART_1,
> +				FIELD_GET(PMPIDR1_PART_1, pmpidr));
> +	pmiidr |= FIELD_PREP(PMIIDR_IMPLEMENTER_DES_0,
> +				FIELD_GET(PMPIDR1_DES_0, pmpidr));
> +
> +	pmpidr = readl(cspmu->base0 + PMPIDR2);
> +	pmiidr |= FIELD_PREP(PMIIDR_VARIANT,
> +				FIELD_GET(PMPIDR2_REVISION, pmpidr));
> +	pmiidr |= FIELD_PREP(PMIIDR_IMPLEMENTER_DES_1,
> +				FIELD_GET(PMPIDR2_DES_1, pmpidr));
> +
> +	pmpidr = readl(cspmu->base0 + PMPIDR3);
> +	pmiidr |= FIELD_PREP(PMIIDR_REVISION,
> +				FIELD_GET(PMPIDR3_REVAND, pmpidr));
> +
> +	pmpidr = readl(cspmu->base0 + PMPIDR4);
> +	pmiidr |= FIELD_PREP(PMIIDR_IMPLEMENTER_DES_2,
> +				FIELD_GET(PMPIDR4_DES_2, pmpidr));
> +
> +	return pmiidr;
> +}
> +
> #define DEFAULT_IMPL_OP(name)	.name = arm_cspmu_##name
>
> static int arm_cspmu_init_impl_ops(struct arm_cspmu *cspmu)
> @@ -362,7 +400,7 @@ static int arm_cspmu_init_impl_ops(struct arm_cspmu *cspmu)
>
> 	/* Start with a default PMU implementation */
> 	cspmu->impl.module = THIS_MODULE;
> -	cspmu->impl.pmiidr = readl(cspmu->base0 + PMIIDR);
> +	cspmu->impl.pmiidr = arm_cspmu_get_pmiidr(cspmu);
> 	cspmu->impl.ops = (struct arm_cspmu_impl_ops) {
> 		DEFAULT_IMPL_OP(get_event_attrs),
> 		DEFAULT_IMPL_OP(get_format_attrs),
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
> index e3a4dd068805..7eb150abc3b7 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.h
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.h
> @@ -87,6 +87,11 @@
> #define PMCFGR				0xE00
> #define PMCR				0xE04
> #define PMIIDR				0xE08
> +#define PMPIDR0				0xFE0
> +#define PMPIDR1				0xFE4
> +#define PMPIDR2				0xFE8
> +#define PMPIDR3				0xFEC
> +#define PMPIDR4				0xFD0
>
> /* PMCFGR register field */
> #define PMCFGR_NCG			GENMASK(31, 28)
> @@ -116,8 +121,34 @@
> #define PMCR_E				BIT(0)
>
> /* PMIIDR register field */
> -#define ARM_CSPMU_PMIIDR_IMPLEMENTER	GENMASK(11, 0)
> -#define ARM_CSPMU_PMIIDR_PRODUCTID	GENMASK(31, 20)
> +#define PMIIDR_IMPLEMENTER		GENMASK(11, 0)
> +#define PMIIDR_IMPLEMENTER_DES_0	GENMASK(3, 0)
> +#define PMIIDR_IMPLEMENTER_DES_1	GENMASK(6, 4)
> +#define PMIIDR_IMPLEMENTER_DES_2	GENMASK(11, 8)
> +#define PMIIDR_REVISION			GENMASK(15, 12)
> +#define PMIIDR_VARIANT			GENMASK(19, 16)
> +#define PMIIDR_PRODUCTID		GENMASK(31, 20)
> +#define PMIIDR_PRODUCTID_PART_0		GENMASK(27, 20)
> +#define PMIIDR_PRODUCTID_PART_1		GENMASK(31, 28)
> +
> +/* PMPIDR0 register field */
> +#define PMPIDR0_PART_0			GENMASK(7, 0)
> +
> +/* PMPIDR1 register field */
> +#define PMPIDR1_DES_0			GENMASK(7, 4)
> +#define PMPIDR1_PART_1			GENMASK(3, 0)
> +
> +/* PMPIDR2 register field */
> +#define PMPIDR2_REVISION		GENMASK(7, 4)
> +#define PMPIDR2_DES_1			GENMASK(2, 0)
> +
> +/* PMPIDR3 register field */
> +#define PMPIDR3_REVAND			GENMASK(7, 4)
> +#define PMPIDR3_CMOD			GENMASK(3, 0)
> +
> +/* PMPIDR4 register field */
> +#define PMPIDR4_SIZE			GENMASK(7, 4)
> +#define PMPIDR4_DES_2			GENMASK(3, 0)
>
> /* JEDEC-assigned JEP106 identification code */
> #define ARM_CSPMU_IMPL_ID_NVIDIA	0x36B
> diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> index dc6d4e3e2a1b..b6cec351a142 100644
> --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> @@ -322,7 +322,7 @@ static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
> 	if (!ctx)
> 		return -ENOMEM;
>
> -	prodid = FIELD_GET(ARM_CSPMU_PMIIDR_PRODUCTID, cspmu->impl.pmiidr);
> +	prodid = FIELD_GET(PMIIDR_PRODUCTID, cspmu->impl.pmiidr);
>
> 	/* Find matching PMU. */
> 	for (; match->prodid; match++) {
> -- 
> 2.47.0
>
>
