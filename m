Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11022138.outbound.protection.outlook.com [40.93.195.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C1331C57B;
	Thu, 29 Jan 2026 22:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769726105; cv=fail; b=oDz36ltPeRlElMzUZWks8ihUUawDiXFCzxFhwnj9VqX166XhmEtg731XmneR31rhsqaPsT7enSecye4qPXyPuNMfqY2lXHXOICgCvRBUEwPOGNzhReVqY61nDqVIx3CyW9CnrxLYDK9d+WUioBsMAPqx0hgS0YK9DvGJYeGuXWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769726105; c=relaxed/simple;
	bh=VcTuxWuJP3W4EOPib2wQUc7VdwDFZ1vLOOSy3A4Shxg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=KDLeHX/c3HIEhGr5Y63As+iLtoD3CfwOzLdz/IgTZD7yaVfcOO54OikxzPtP+jtNG4iv+5kP51GoYoWO94CkVi4GA3Sdd4zJISBxMSBha5u+S33g2DTnzw21RsHnXgw9nodhDhays2djVLLiAgRhPjYLej9CtxVHylFNSrWDxa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=Mstpzz90; arc=fail smtp.client-ip=40.93.195.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="Mstpzz90"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7sFoD8hnfsYQOcMQl+352IiW78b3askkm7Z6H6oZfoxDBl6kS1Umt0MrodV4mA2snvRIvPWC/scwIAa1zAQoTLbEE81jNKTCsTZWGaXxYworyY56EEDLZ9cmxe/uIBOmgGdmz1sLUglNiS959zGeSohZOKTVZDV4+u4EMqe2iMhPwI9rJUPCiLZe5yVn6g7I9Dt9YCqDIIdpDP2RyoVrWi7hCLJsta7MD6PCtNd6sFoBrerQWlhTiuY+jm+uOFMbo6xbCHWWXARvsuDmhoG1OcA8PoZiURgPNtCO9GVPqJo5r920Vhr7BnjRB44Ii4am9g6eGBJunNH///J6V8w0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeS0oGVy2awzsUg0L4wDRAsRz+sOGkLkm4H4e47DsJ4=;
 b=LOAII9c1tzbSLdcQqzZQDZHrscPn/tQ5xyqC2vUz9kOJPOYcg94652WGOpkXzUmeInEwZA7zlTjGqRa4Yfo+Ts6nXzkPmFdddVsH0VenBnAteXjoktrNcD3Z42HN+H2mZOIA5hv9bWU//fFqC5rgffLidVdMt46rGZwEYscIMQaEPff0NimVkgUy/7CxevxBYRAGPmG51bVd/w7AZjC/RjyBO0oRkY/OugY/KvZshQEug+zKToB1RRCu5WXLTxIqmB2FVZu1fCVMAKumTHdPWrI5PzjFwZRayFGOVAVsK9BGMhpnDXgU1OJefI0PjYrUsgPI12ewVP+oQT4Qd5SLmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeS0oGVy2awzsUg0L4wDRAsRz+sOGkLkm4H4e47DsJ4=;
 b=Mstpzz90fugnDsJ8XsubfkkWKEmnYAiPZ1NZJxIuK37emlJ1/1CBPXzWJYn+h84iul7cfrZoeN4Y/L6RFv/u+xk6Ei6wJTCF7lad/Lb/W09iNIHxkjpgBk4mw8UzzQZzixUDDp0yKxVk7M7TdzvSg/wtDjFjDDuFuJapt4fvncQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 PH7PR01MB8496.prod.exchangelabs.com (2603:10b6:510:2f2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.8; Thu, 29 Jan 2026 22:34:59 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 22:34:59 +0000
Date: Thu, 29 Jan 2026 14:34:56 -0800 (PST)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
cc: will@kernel.org, suzuki.poulose@arm.com, robin.murphy@arm.com, 
    ilkka@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
    mark.rutland@arm.com, treding@nvidia.com, jonathanh@nvidia.com, 
    vsethi@nvidia.com, rwiley@nvidia.com, sdonthineni@nvidia.com, 
    skelley@nvidia.com, ywan@nvidia.com, mochs@nvidia.com, nirmoyd@nvidia.com
Subject: Re: [PATCH 4/8] perf/arm_cspmu: nvidia: Add Tegra410 PCIE PMU
In-Reply-To: <20260126181155.2776097-5-bwicaksono@nvidia.com>
Message-ID: <a7862fa1-db3b-8a51-7df7-c7daf782c9ee@os.amperecomputing.com>
References: <20260126181155.2776097-1-bwicaksono@nvidia.com> <20260126181155.2776097-5-bwicaksono@nvidia.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: MW4PR04CA0141.namprd04.prod.outlook.com
 (2603:10b6:303:84::26) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|PH7PR01MB8496:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f090c9-ec86-4ad0-aaba-08de5f86a289
X-LD-Processed: 3bc2b170-fd94-476d-b0ce-4229bdc904a7,ExtAddr
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19052099003|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?BAlWVb0ca4ksGdolZJyE2+0ptDM7DC1me9G94JEGVy+1hdr0BC2fxooJOOpc?=
 =?us-ascii?Q?YCaIiSywVzMstvQDylFhHgdHWE1ZlUywVqtrxDNa0CkWP162/BjywW81Ehfe?=
 =?us-ascii?Q?X907g9XHwMOqsDjaASRld7PrkCaYWik5cbqtwA0QgiKd9YCno6lIlxiII9uX?=
 =?us-ascii?Q?NwtVRLsmV+XqRQhKleenPdDKMszxK09MxyeqJYG6O/jTeVDCbJtaiTbkPTFv?=
 =?us-ascii?Q?u/K3s+wdWY1APWU1uyZvcos0xzs334CQ2LS6ntqtBsrig3sfjNiAcqRYCZcd?=
 =?us-ascii?Q?1DE2v2zy1weBzt8aDPsfC7CzO4ZYGOtuGv62Z33BX6va2Pty8aFTz0EO8ZW7?=
 =?us-ascii?Q?gXW6pK56QikfHhyOfHAk6OEHgif8/0nA93WfDLPaS/cTBb0I7vjQ/W4mcVmC?=
 =?us-ascii?Q?2wTQdhBZ/fuOT04y68Yc+bIWqeTpHv6QoyErQ8rFRW2aDu41EVmDOD76kxa8?=
 =?us-ascii?Q?9JVSD8DiEATNWyWGVgUW8OFkaEoh9HV7TeL+jFMLL+9bHEDs06EwQ0qvF7LZ?=
 =?us-ascii?Q?4pyJhly7QqyDjZJG3b+8K17WQfBbrWHLSuGIRM9bjuohLNHPFpl9N2vUKt+7?=
 =?us-ascii?Q?eNZG/AuACSg5ZvzPYTdAeJnfB5kuXj4kZBlrF3p2ElpJ/YmnhMAGxmCMPE8B?=
 =?us-ascii?Q?mRu2B025zhQGpvDneoIr9ZMIf8vnTC5SU46esLS9fXO9I/h4A/8tXX/QCliZ?=
 =?us-ascii?Q?40J4s43+iwQPLOL9Mo6hOSJyjkhErhvfGWCRMTOzoDej96/IIECJ+YrQkDMk?=
 =?us-ascii?Q?miFCgA/MR1IBSZ4AIVDS8bzgfObWUzgWiHyAHpCwQLuDHEPsiyeQhHM23u/T?=
 =?us-ascii?Q?1l9iss4Kz6bmU4IQN+3s6FWWbawYSiuzXKposCZjwX0dJwT0zt3UCwdQRjS2?=
 =?us-ascii?Q?aKGCtlOomYKw5HQjaxac/sUufrXQwXzl8j+b9P8gGkNOcqxGeJxArpFtMwoe?=
 =?us-ascii?Q?IqUwC7onBSlTGA3vltkzdCfTcdADDGt8fzD+wdHpzEParhV8zSBdk8etx5c0?=
 =?us-ascii?Q?0A1sVaeq3Xqmtz/UMpo4kgrf2/7sMU9tlp+NXYicO6Z8As9U0U8VRnT3tqBF?=
 =?us-ascii?Q?aLPnqkWJXPnFz/53ppODoaFu1ou6fsR3fZ2zYBlc86qxgIMWupNdMjxcE8BC?=
 =?us-ascii?Q?thFHIo1D6Lw/QrWZekQPZCYIlsiRO0ZXuruT14X8ED/LH+d+KyeHcDud0wJo?=
 =?us-ascii?Q?wAk78pqahPNGm1kybYM3hhn3th7uFdErPfRKZi3bsfk0kPjmUOR0aoxZXthL?=
 =?us-ascii?Q?Dxux8LVqeRl4tf2BZjSuYLvNfOKpNkhRQybvGX6FswRqlruCCCsz8ECqGOll?=
 =?us-ascii?Q?zkm7ZvQRNnI1OFKPA0aUGrdN9oGV0ALyPb1VT6ubCrEcit3wZekUy7PMn5mi?=
 =?us-ascii?Q?oHFnExnhhHknLbmDhKEyeRpAMVLHZltgZKik9WGiBaOcrvAW6iV8IbbBTF7y?=
 =?us-ascii?Q?UrVI9yTBt46xGhYLBRxQDQn2OdcOQC+HCA5UB7kKR4+QQkJzxl3E4nx3SuHE?=
 =?us-ascii?Q?rb+60qa1fp7c0KeufeX3vbdyRT72fZxLMeaktuDCMRdgsiq97PdnR7Tgjq4e?=
 =?us-ascii?Q?yTdYtyySp0QXV3yug3c=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19052099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?rC8denYyV6MKZOa3YZEdMrMH+PKZ68g3l8AHHjoD2DarNJ57PhOrNo23xFcF?=
 =?us-ascii?Q?R/YaHezZQxAqwWwegRpfEFeXsRIqIzicR2c/EjMFr7YjaYWgFwnCueiagPm6?=
 =?us-ascii?Q?sPIiYas5UHL8CurWma6VvnwcZYHu0k/YEKTRQGkFNbF77nXAMkhb8HBBLwGs?=
 =?us-ascii?Q?mLpJb75bKl7Wf84oFYdR3gZp+IwQQhS/r7f36RWDfiNkja5GMbfl5NeeObz0?=
 =?us-ascii?Q?4pk2NibGhZaDtZwy2E+xRzP28uxt7yZXtO9AU4VtAzdVkg8qG0QvvP7ffACB?=
 =?us-ascii?Q?xjrdDylbvdg0Yi/UptXaMhauF0MwlV8fRxN5yJrrVpdtsO0JiotIT5iW2ysp?=
 =?us-ascii?Q?h4mcP/IldzIiSJiVxfd68yeITfDmpCZjsqghYCQ94rEMNlJgGwqqwNypV+Oa?=
 =?us-ascii?Q?XX7tREGmDQECNlzF2CWSnx9G20qkVs01wNjVtPHcBflKLO2jIIU0CTk95xYR?=
 =?us-ascii?Q?xv0PeGDhXiN3jhNvtR5204KWSEzdnHgb+aoGYY9L7ANJ+yT/h2CJSGcmbHlM?=
 =?us-ascii?Q?ftFzydqG66MgPIh1jpECLXBUK0tjSARRaErYvun48PuhXm3/PEBsQahLP0Bm?=
 =?us-ascii?Q?zBWpEZZKh+1r51UjB4Di9XLclz8auZUmGyaX1cxMCJkZRHJDBsdOIZ8kYFCA?=
 =?us-ascii?Q?Bt95U1sAg28u/LVbS+cK9QkJwtm/HXZyupslEq8yn0aBLSvUizou0hxzHrjN?=
 =?us-ascii?Q?pybQltUpWHKkOqEoFumE7oezxtANLFMPr94SI0xOH8ED8iolihUtpypIVHt2?=
 =?us-ascii?Q?wGoWgbsrxOw8Ih88JyPkUGb+vqcVXrE8k6045AbvBJ1fCV1/+rFBAmmRBZcv?=
 =?us-ascii?Q?CxIwwSGBvthGa5vua18fiG8lsbHL4etJsv0ogCKMg2Puab3X3dal0mQApZxK?=
 =?us-ascii?Q?0YlVpu8BC/1unup8A6nx5bRdmcgTZsBDZLfwUSEC5+TWygZrF3d0ctAUJ+Fs?=
 =?us-ascii?Q?O1FfD/kwcb1Gg+Nq6ZHBmADhNpIuV1oWSKWjD3LCt5denJvMKnqbghKfOcyR?=
 =?us-ascii?Q?2smpkV8f+GhNPTNwmXOeL2f1tkUreFHJoZlec9K1XYnnopALghMiQVK+sXXD?=
 =?us-ascii?Q?IsxoOZqPBz2fMkHuDl+scYP2AQDqA7Yub+713DcWSOi/bFWjvR10NkBLXQiQ?=
 =?us-ascii?Q?AFKG4zZvjEJ3+314R6Y5t7y65vrps8kWLBzm2siU9T/a1K7VX+QBz3/BpUua?=
 =?us-ascii?Q?oFA6WysOwnj6HZh40qCSSemeZNGT1MDOcth2JRlvS7ECCltldDfm01aeYLom?=
 =?us-ascii?Q?W1NGf6YsHGg/SWHycRXhxGAd4Bdsaqz9BcKb25m5QNc/97eNY+i2l7pp4Z3Y?=
 =?us-ascii?Q?UfzKatZzYsTEwDV/SshyPS91M+LQtJ1d93GdI4GiWTc6KzPGfsFoyaDngESS?=
 =?us-ascii?Q?1RnAUvb+YWHYFNbI9u4ckr6XvDRvaJjxhrLDMheXyXhjLlLMFp5Kbs8i1nfX?=
 =?us-ascii?Q?Bgx8UfyrhlZHJgp37KF4gbckYEvLCpyQzfmor9Ih03BwadmRJLkoWpwxLdzw?=
 =?us-ascii?Q?zKHzgIdJ1u6Vw/8cbPkZEK/0llvmlUs4QJBC2Kthxx4VPdo4iU/YVZ63Co7d?=
 =?us-ascii?Q?f1h14s0YYegtjVRQqiC6u5JD6Dm59bXpHQhRg7du3H7iHQIlUUt45/F1lJjv?=
 =?us-ascii?Q?cervhwu11a1Ij/K8DW5jPIpYxgXbw9uK7AccR/SDVeVCffeL6+r+mvn7G4BU?=
 =?us-ascii?Q?vJpgYthCfkPMDlnCWyCZP3CGvXIqb+dQMrKqBWrxfaq8kmiYuuw6vwwUmQdU?=
 =?us-ascii?Q?LLkG3Zm2STo4PxW2OfppLgcy4nfpO6KZj1/GPY76FOKiBJMEYiSC?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f090c9-ec86-4ad0-aaba-08de5f86a289
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 22:34:59.1488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Y7QzH2XrO3b9N/hPzSSZlB95aYVg+1ipu9EvFQnu0j0yXUT3rWgsg632Vti4puxl3ifBO8m5fP4gDtIofYjKZz4lmLtR8ZwQZjciYsroXc9UvAyfeniUij9+dhhYQu0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB8496


Hi Besar,

On Mon, 26 Jan 2026, Besar Wicaksono wrote:
> Adds PCIE PMU support in Tegra410 SOC.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
> .../admin-guide/perf/nvidia-tegra410-pmu.rst  | 162 ++++++++++++++
> drivers/perf/arm_cspmu/nvidia_cspmu.c         | 208 +++++++++++++++++-
> 2 files changed, 368 insertions(+), 2 deletions(-)
>

<snip>

> diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> index c67667097a3c..3a5531d1f94c 100644
> --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c

> @@ -453,7 +645,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
> static char *nv_cspmu_format_name(const struct arm_cspmu *cspmu,
> 				  const struct nv_cspmu_match *match)
> {
> -	char *name;
> +	char *name = NULL;

You can remove the assignment in the default branch below now.

Otherwise, the patch looks good to me

 	Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

Cheers, Ilkka


> 	struct device *dev = cspmu->dev;
>
> 	static atomic_t pmu_generic_idx = {0};
> @@ -467,6 +659,16 @@ static char *nv_cspmu_format_name(const struct arm_cspmu *cspmu,
> 				       socket);
> 		break;
> 	}
> +	case NAME_FMT_SOCKET_INST: {
> +		const int cpu = cpumask_first(&cspmu->associated_cpus);
> +		const int socket = cpu_to_node(cpu);
> +		u32 inst_id;
> +
> +		if (!nv_cspmu_get_inst_id(cspmu, &inst_id))
> +			name = devm_kasprintf(dev, GFP_KERNEL,
> +					match->name_pattern, socket, inst_id);
> +		break;
> +	}
> 	case NAME_FMT_GENERIC:
> 		name = devm_kasprintf(dev, GFP_KERNEL, match->name_pattern,
> 				       atomic_fetch_inc(&pmu_generic_idx));
 		break;
 	default:
                 name = NULL;
                 ^^^^^^^^^^^^

                 break;
         }

