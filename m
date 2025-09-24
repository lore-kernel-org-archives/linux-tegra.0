Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11023095.outbound.protection.outlook.com [40.93.196.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06BA11185;
	Wed, 24 Sep 2025 20:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758744397; cv=fail; b=HDEDqi25e4cTCzHSzpWxFSAd+7NWR1TFo3Dsfa4sJLM34ZrjWj/IAspf7ICOxPXiD5X/C4pliy59Uh7yEbpONOwUc3qyLJmY0BuWZJ0fJPsszBOQPfiTikHcZNQONxUEUOzqarHqe4oUkr8QM4Pyq4qkNFUlM8b13qowol81EwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758744397; c=relaxed/simple;
	bh=cjiz8LCMFOoKOz6MrYWeuRYS+a8x/QFdo2Lcvs7tqQM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=KQsvvrPlvWXxpyHEOHtuI3xkXgXLabdK+MKJi65LyUBACzK2vadoHT2IRmYZ6uP4JU0ouigajZEM33/bYoGBbQMjpTK3UNQqgNnT8R/fax/tEAXcK6alOS/ZjNm0eX4bTq8Fw3dFCZO3geKI8glqcfJ+lUILPlvk3OOnE1pxNak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=lGMBn6ai; arc=fail smtp.client-ip=40.93.196.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="lGMBn6ai"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5/1W1nt2AzoHdXZ9MUqLkj8tHyp6LQtjD/+kFUpL9JkeVcDmJwPKwOGAohjMnjq3jSVPmSc1QfY037F2icUoXOFV4Nc19062Z1CexJLgjcE0CxgSvSJROkL8xINx140TeMQTQ6q8c/Dpr3PEgNU20Vi5mF5sCPm9WT349I7oUfJTNaCmse1gdS9AYO/fFYkmqFXPe0Newv6TDoX3jrhaahP7MasgbMraSyTZhAprCfGf/4ys3XdLNWf8rgQlUSPUXeHONhNl5kn6kJhxoZngsdq0FZqGMFbCd6j6MwH5DC/z4whXxUgYYlTOew0o7Iu3O4wslkyAaddCZS1PKI21A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boGnXQLrKRRfRhD43A41rYSk67vCi+UBqXzIcsAc13k=;
 b=AJ/kr0EyOjZUhGqPNLeK1iyRcCqalkTdDwUfJX4J2BFy5MP/lNZ+KJLHD7zcBaZQ4Q+76QaT6SAEpf5rVjqovTRTEOlN/gs/C5+QVHK+6E2h2nu4B+jIJv+0ON2dDkde1KbE8Fj8alQRZ21z6qpFcS+EQfSW+lqdtZanWmNldjS1bJz5KmFPKtmLQCiiBsN51efIe/DDjyize8uSXCie1xNCpak2zMHGfj7E+rXEMX7dGtZLHiErc0iyJrCSKWxiVsfRRe+LaDKkJl59rFOCVmDrte/pHqOkPZJqdqwBiTgBc1+91ZjUSIqsnnOQ1qDTZYrJvsl0acEvaY+CZ8suXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boGnXQLrKRRfRhD43A41rYSk67vCi+UBqXzIcsAc13k=;
 b=lGMBn6ai4DqWfNYFYIur3gig3bordQwlvtE7mg9CLkkhGRpyOUhXldHFwhPBzR7XaSl6P9oD8BmNU8hLleoj2EKI8gkLJ1wXezqhdLDO0QPvkakiAiHIorvVqTK3UZpql5FinUlfSu+uXiQZV9s5u5IG1ZwkpRCy9ERmYvI4ImQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 SJ0PR01MB7345.prod.exchangelabs.com (2603:10b6:a03:3f0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9; Wed, 24 Sep 2025 20:06:33 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4%6]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 20:06:33 +0000
Date: Wed, 24 Sep 2025 13:06:31 -0700 (PDT)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
cc: will@kernel.org, robin.murphy@arm.com, ilkka@os.amperecomputing.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-tegra@vger.kernel.org, suzuki.poulose@arm.com, mark.rutland@arm.com, 
    treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com, 
    rwiley@nvidia.com, sdonthineni@nvidia.com
Subject: Re: [PATCH v2 2/5] perf/arm_cspmu: Add callback to reset filter
 config
In-Reply-To: <20250923001840.1586078-3-bwicaksono@nvidia.com>
Message-ID: <76c3163c-5127-1e3a-5ced-222e6f51a7f3@os.amperecomputing.com>
References: <20250923001840.1586078-1-bwicaksono@nvidia.com> <20250923001840.1586078-3-bwicaksono@nvidia.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: MW4PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:303:8d::29) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|SJ0PR01MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 75d30505-af66-457e-a94b-08ddfba5dbbf
X-LD-Processed: 3bc2b170-fd94-476d-b0ce-4229bdc904a7,ExtAddr
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?8qf6kjWJ2lrcFQXqLuyFVQF69kYjLgwSBJ2JlfTsAq+N88O45XVBmtwp7MYN?=
 =?us-ascii?Q?xiRImDwuzkiK/yGPdSmjjDWK9ajx4KpoCPhu3+roiGJkm0V1rsoBkmpWHhMn?=
 =?us-ascii?Q?d/DvBaZDM7l78h8AnstnWOIHdCfM6oCYNLFezgc15etTgvwj7JrODxDew4AB?=
 =?us-ascii?Q?17t6Ea1lFRjyzb70ygMotJTf0de3/Tb0+6ppKN+W9c/QfQNATEarTJQVbumr?=
 =?us-ascii?Q?vY6RyU3t6/9u6z2/8U2M9zMiqrKx6VQe/gz2vi0y5TD02sdAYpdJCDu3GE0G?=
 =?us-ascii?Q?IuCJp7bvFodjxmR7gp+49W7RDXoEIgmzVeW5mnGpihERqb1w00VLrLiiHOeH?=
 =?us-ascii?Q?EVJwUBnmWpuVFhZIFYG+7xKjBWIYAuV7c2ZEqNDEP4Oknop8/eV/6glUKEFx?=
 =?us-ascii?Q?8whF9TxtKSgqjmizCgRnlz3O3aj22ut/NepCGp/AD/UNk1TkPliUv4M9LdBY?=
 =?us-ascii?Q?xtzhBiDThaB379/OVoxjUr7Bcz3TFTiKQx4bdfTmFGrSHKy33rQ5It+NaBce?=
 =?us-ascii?Q?OGa08OYggX22SGNgP4lgiavH1JjP0TD9Ww3DP+gphOy8RmE276zocrEYKKb/?=
 =?us-ascii?Q?cHE848L7UO3xGoVxPGgfJzuDjCVFPI98I6BOv/LnFjhfCqnSwFFjnK2Ny2wa?=
 =?us-ascii?Q?R1mmwoCXZF5qCsRKtzzd0E6gC1cfY5sc9OgwHNjMOhHFxdrZ73/+IdDvCeeW?=
 =?us-ascii?Q?ZrQK6okYPaubssd/TZ0l+QMdW098YrbuJwPanEDAtD977QKjlD4lHi+zIGMM?=
 =?us-ascii?Q?xHIFhFYBVM84Cj4sGhxMfYkNhLQOB0ZmkgrXhE+5B4PSwOL3e0yDCT7ziVct?=
 =?us-ascii?Q?MNJuWghCJJSU2K930puUnUIW1Y6td4qOUmsE8sJZU4XlqjseIp5cLzjHYTiv?=
 =?us-ascii?Q?psrq61rs7+2+MJiOceF82kj0dhD6uZN5SndCuN5jGd/9dnbQWU0yJtNcg8Er?=
 =?us-ascii?Q?Wf6gtLwKBAD1wv0h7bj1tDmqEPdCS/meJ0UCaicJ6N9r8XBM4vXIhAdiwwVx?=
 =?us-ascii?Q?YoDxg8ToIW1xT0s1xSiB+eaW0X0jibj3/dA4VrDzGk7/2arECClgFgzc3/an?=
 =?us-ascii?Q?dEbv/T1EgOvbfzIRtGY19Q0SWMuhKAAwAv9H/QytFtS2SqqRXqhBE7p5v+lz?=
 =?us-ascii?Q?Vxmv8/Jzxmfpul2lHXj/wnlNr9ksvleuz1C3RL0Gc4oBQhCufUdH319AkcqN?=
 =?us-ascii?Q?G2WbK9dS3bX7rXj+8W/b+AhwLiFdGrozVAsuziRSFlS3LIraZIfi19e/0zOT?=
 =?us-ascii?Q?mjncIehaUAit5NSfZ2s/2PXtlRlNZMuuaH1O6ogKyAItO5+Ha5gzv1iiTSb+?=
 =?us-ascii?Q?pG2NMnYhQ39ILzySCfT0VnqhTqpu8rY94/Cra93VkiAmbeYs6CjZ3jlJ3oho?=
 =?us-ascii?Q?PZST9bRHM8m1XHUWhX+aN3liQWXppx2Xk9CTDtscCMHa2KxB7350LagkWSW7?=
 =?us-ascii?Q?2vh/eMGhdG75mTKunjiSCTmKkHfaU7iR0xU0Pq1oblRaSRg/lpd70A=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?xl/5Rle7LwkTiPilsvkTES/1H9lvB7JcBKufaKXJeh3QmzNZS1MfUadvYCgj?=
 =?us-ascii?Q?W8pkh8/cu76wdvXfovBB9UATWOTYGXv9JJIZUzVILx8UY7sqaPBwY856IhBa?=
 =?us-ascii?Q?NqTA1e4AbJ4m/7mxNU2VKLNz4ZnvTFDiGndEWPQ1ZFQOIrk3hZebKATrWN1I?=
 =?us-ascii?Q?iEE4du5GraU1ihpxJUVwii1i0P4K1yeelUeQvtL+wf3vMTe43c7dd8Pc9NC6?=
 =?us-ascii?Q?WdgpMJaoc+zhkM4vdBSdZcWEhVo/khmBjIBsdrv2zk21sJEQWT4+1H5T1jg8?=
 =?us-ascii?Q?mU1iJYpm+uxwEaqV0mp2ZHhPPvZEkrjwUuXW6L+38gwACxiswLJIqjHTD9ZM?=
 =?us-ascii?Q?yGTz1OiPisoCpDswcQRvqQxr7TePVOPszfyk5KWjslk1tuXnEtIF7fAt1UQf?=
 =?us-ascii?Q?Hrvi7bgT0tjNzds+SNx/Ua0b1+ZH9ns2wDxYSI7mgVvThkPsfpaNTVBOHhGA?=
 =?us-ascii?Q?6Hmp9enzAhfiGlfPx2BPp5KOdIMaLYFJD3wF2oBuKygS26iGxJbJTN7ECkIt?=
 =?us-ascii?Q?jz9gIkkUh3FmJ44FjUXTPZlbazviVOeLPfVR8CA5y41Ve12kLGqN4dfRG9+x?=
 =?us-ascii?Q?x9/d2lDtqtRLxSyTVnD66Ym3bDr00QB25VtmT5Xek8SYzRykAcOspfQs4bx6?=
 =?us-ascii?Q?XFwoYA1/yMY3ARxNqIU1stjF63sHeQQXlW2MMFzSkZUqiQGh8oEOLuFjiR8U?=
 =?us-ascii?Q?UK9+YiO03+ktVP3y2F72t0QMfv0oJz9Rl6V4I6XZTrxR7EJZiqht0u7k/rzQ?=
 =?us-ascii?Q?FDAeanm1PVe7o7ipq6BkpKaKi2lRrmVGH5Mm7n2lXcImFf91DFEjQgGnBgzo?=
 =?us-ascii?Q?MTjEHZs4sNr2pXXd+/AuuLvsaVAyd8I5AM68V6BgL+kyUUGquuJSmNTjDYHK?=
 =?us-ascii?Q?KqhNW/VRm/5qpKpXalQV9yQ+DY3zbNTYx349kYkSw2UFWJlEsr9vE3jz2ckB?=
 =?us-ascii?Q?yC9jtZeFVzsmmQ/kWfjsPleGbTueaxugjfbVBywoiPKm+UplvtU0VnQ1kj5y?=
 =?us-ascii?Q?yo3ZvsQ1bsmqgefhnfeEhuACFXlaqFM3jSPPlTPxuQ4sw7hCWncdX6FLmMYt?=
 =?us-ascii?Q?4Dk7QRlkDLLcoNqYjdnD5Drtv82B/0igzJrjdnrmPjrSqTvLKMHgGPgJZGhb?=
 =?us-ascii?Q?rfauZ6F9j68JU4KOV5f27cVj0BYrjfF8u4YQ50jyEaPJ+CpmfxiB2vaZJEhH?=
 =?us-ascii?Q?CsY0NXNnByEquiCY95fxqX7UrKgDCw3qdnMmBkYZ7WWSgQX3/x0uqUwx46kk?=
 =?us-ascii?Q?yWGcLByvnRsVvhSW7GeQ7+YDBM27RrUdSH4ib/PyqBEExtZ+Ml+PTXUtZkAD?=
 =?us-ascii?Q?SwdoxNB537ruJomC9CqPsaxsLtyI/lXg8tZUuvDJtyVdIMfLdU46BtFh/gbY?=
 =?us-ascii?Q?o0iwwMMDqtwM67/KeqbjvDUmAbcKbjxaT16iW3tLUNr8ZpYQEYBfMaSsLXqE?=
 =?us-ascii?Q?B+Ldc9LWQiWf0a7lS/LKOway95HW1j8ezVdR2h86ctzenTjvfFTYCCUvNkoQ?=
 =?us-ascii?Q?0W6kUhBt5NwDCxjEYh1Mt62YLuiXdQNayw/KJMrgnb18Ob182D4ufWVLK4Y1?=
 =?us-ascii?Q?n7mrtECqpZW8ntHkPTEkNtVSNu//fKb2NcRcBN0iyGt01F8v+6E18lT0y1Ni?=
 =?us-ascii?Q?HB2hPCWZXDEZU0Pt64u6HYg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d30505-af66-457e-a94b-08ddfba5dbbf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:06:33.2633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5jA69AJ+57lp7TcHqJuLTR0v/9ov4MN9ckjwlTvkWUzEgsSoIY4rsSZJzOG34Cna0Ny/iNSqCT7CQzWOqe4PE3UxpvEz4LEMRUzVAnCdtKyPT0R8xe11ogHDll9y76U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB7345


On Tue, 23 Sep 2025, Besar Wicaksono wrote:
> Implementer may need to reset a filter config when
> stopping a counter, thus adding a callback for this.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>


> ---
> drivers/perf/arm_cspmu/arm_cspmu.c | 4 ++++
> drivers/perf/arm_cspmu/arm_cspmu.h | 4 +++-
> 2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> index 75b2d80f783e..43770c8ecd14 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -815,6 +815,10 @@ static void arm_cspmu_stop(struct perf_event *event, int pmu_flags)
> 		return;
>
> 	arm_cspmu_disable_counter(cspmu, hwc->idx);
> +
> +	if (cspmu->impl.ops.reset_ev_filter)
> +		cspmu->impl.ops.reset_ev_filter(cspmu, event);
> +
> 	arm_cspmu_event_update(event);
>
> 	hwc->state |= PERF_HES_STOPPED | PERF_HES_UPTODATE;
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
> index 9c5f11f98acd..21d7e6e2f2da 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.h
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.h
> @@ -153,11 +153,13 @@ struct arm_cspmu_impl_ops {
> 	bool (*is_cycle_counter_event)(const struct perf_event *event);
> 	/* Decode event type/id from configs */
> 	u32 (*event_type)(const struct perf_event *event);
> -	/* Set event filters */
> +	/* Set/reset event filters */
> 	void (*set_cc_filter)(struct arm_cspmu *cspmu,
> 			      const struct perf_event *event);
> 	void (*set_ev_filter)(struct arm_cspmu *cspmu,
> 			      const struct perf_event *event);
> +	void (*reset_ev_filter)(struct arm_cspmu *cspmu,
> +				const struct perf_event *event);
> 	/* Implementation specific event validation */
> 	int (*validate_event)(struct arm_cspmu *cspmu,
> 			      struct perf_event *event);
> -- 
> 2.50.1
>
>
