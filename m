Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0395F39D6CC
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772619577; cv=fail; b=qwOzohtTYK+VsKotQDiOpmjH7FWgWsfVBh7Yo6aLTRSdnuxAzBp7+B8KlSmch9Go+nk8/Jz53WL6VwuRXbammy4xk5dDTMoAJ95UM5uGIQ3QpY88AsXHKvUcj+fmHl9wEJWYvAV9CpzOON8UQPfpwL4aoPmQCrv/e1KueRLSxgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772619577; c=relaxed/simple;
	bh=vFjFLMO9jqX97Jr+6rVIll3SX37WZIRHfkewFe57RvY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YxMcz9AMrk1joMaBnU+7PA2p9QcoIFnQY8QoN2c1cGxCVdGY3mNP1WjF0RYP0p6yBNTcOnRyyEGrNoXQmwGdIB4eHIhoMFVdZCM00rBCUVIapwPN8HzZy3KgcRcwoWjY+p2nCuTuWVCVea/QpAXMIQBL6d/8kED1kKB/3EL6FIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SmhQ1kV3; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SmhQ1kV3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oy0eMjHY2spVlzMLs0kKtn6To8Rv3mJa1WEqBPAjEWiFWS4BmU0GdCkbivE5FGPLwGg9Vm8RYFetEHw3cM/fy7Uq1jOn87nFkAmUwx2nvcEKu30ee9chBOYorVTSwpeNxvMA9/M+KXu42hmldkqsLt/IGb7iwaGvXGtSaIE+9BYPGzPc+C1CnW1rWNYH4lntiMdIa/JV2hUeFrNvpnGKtYwNUlq1fGmi5UwbLM/hFatd2uuA6EMRlh5nakEzrabCweFIilRrcJjYS2NLfqFH5VAGS5ImlRw2RMXE3sRM2lr363hUQoZ9O9ednd6moj9V9RSc6KCMcSwrmMG2jeU9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YqKxLStARSaQJeR8jurHmGJSvmWobwj6tKfNEZeRf4=;
 b=oRm17qCFNM/r0t/3ISL4TR/q0Me3iOjQITi6Qe+DGGezUBUCCSsXDft/ydPcnPgBZR7wnAvvXyK62jjfV0s/ZwtvGRQ3nF9b/ZHUlR9suJpc38E9vYDfQzJXbcd885czxnsLfMH5x5jvL/oLhng8WPkkrSx9TB8MScOmZ3B+M6OYVssEGzjETSQ4JMjUFumAZqA/HKiiuBKK8qs1Wl9OT5795iqWcvqlOpp7bGdWGiAL3siBxGrxQ6TAhfwy9TY75Nu95fBoIo7YziiKPRlVsyIYgNtdlcENnqeee0c72YQcdSqgUfPYUVv5ryQKqbwkWGefycCSL6N/E0t8lHF3sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YqKxLStARSaQJeR8jurHmGJSvmWobwj6tKfNEZeRf4=;
 b=SmhQ1kV30mlg5qVxtY7/zlVPGbx1LvhwcK4LIegKvZAXRnFwucQSdD3Q6RGXreULfb5EX7ocFGnibi/5Kz9xqwm3VHHFa7UfwtkHUMKkHD9qwJbWexn46uoYT+VnOdJbHb/ejhSkjgdmnPkwz6ctcnrSF6tO16NxSZh+zQRdiim/9/MziFZMvT7LBiVjDnkcC1ZxyDB0E0pTXVreLfmEXCbLXANoXlbbXkyXbq3XoCb8Nok7wI7qZBzpzNivzMGG6LvVNMGv06gXrw3xcPMk/NsMEtAgF5r1rLkKiuQFm+qj2sidJ+ECxi+Hwl6dlaZcHNhjPG+07pwWwZ9VzcR+TQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CY3PR12MB9579.namprd12.prod.outlook.com (2603:10b6:930:10a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 4 Mar
 2026 10:19:32 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 10:19:32 +0000
Message-ID: <e61f57e0-f128-4469-82ce-9540a1df5656@nvidia.com>
Date: Wed, 4 Mar 2026 10:19:29 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: tegra: bpmp: Rename Tegra239 to Tegra238
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260226150933.4067324-1-thierry.reding@kernel.org>
 <20260226150933.4067324-2-thierry.reding@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260226150933.4067324-2-thierry.reding@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0454.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:398::14) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CY3PR12MB9579:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a75cc1-344d-44c2-67a2-08de79d7871a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	DB8JR2kcOo3+v5QUgbs29tugFnAjqNfPwT/Od+dKgfXSjJzUx4A7HaIIt4JmIEvWRo09Jc5lyEN+OL+toi8QXu+VKrY52jg92o99J9Kw+dqRVQ7QIcq8H2DPBM7fXyokI+745MyfA9enFTq5YQ3rN9MwghZYbpKIov5/QXy6pFpg8fRJGZAPmqfLljphzKRLjTFLzoQddSzfga1Spq7C+hakD/XLh+Qe6LwepavW07GKkyJsnbJaplnx3oXW3sWk725ALScHFe/8NoWfeeEaek2LGAtGSKKiewQAjByKMdoHjFqYjXzy9wcgl0DVMSgLxXUJPHy1hquPmeqpajL9cIGSqEcTYZXs7aIfdBfJGC12m9s9THvuVdblFDKa17hlhm2ANk0WoUsf1SwWRhTVMki2zccOwqdjrJcqYrAUDDrpffSsQ3nkgQ48+4EBfIbLiHbEtTmAzzN3W1kjzZcXO8F0siFRKsgnHSmjDCNyk7FvE5lP2UA28WB+WGYq5RrbEwy3AP1Z3ys8kvE+8funhSk6T+VIvPbT23raDwhGCIlGf+9tM4aTUFC37rPBbMhihRuLLrkoP2cVsupWuU+RADio7gvdpuaYqb6qqUgBsX1RvqtyBTEoo0Bto3NyEOi/U9v+oBSanFf9L4Z1CIyF0vpJ2KYNU1OmISS33uRlEACCgeFEFkJmspcqagqUEHSvbm2MgKXwkAsntsK/scm/veaL6QWgBIZXWpOmakqD3lM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UldRaTMxcUJ3VVhXbXpkS0xVQ1RubW45ZjJUZGhpV0lUS1NCZTRBVDlRd1BG?=
 =?utf-8?B?bHdseE5YcnVNaGhJRUwvRWU1S2Ywa2NWL0tUUlMwUElublluY2hrdGQ1TFM5?=
 =?utf-8?B?NUhibmRVdVhCR0NTRTkxSWwrOVVXazdxNkFPcE9vUWRiSFNnTFVFRGlSV0JD?=
 =?utf-8?B?ZWc5ZnZhbE9ZTnREMjBUblQxQXJrdmhOSzVCSlBpN25Fb29lUGU1Qk9QdWl6?=
 =?utf-8?B?cjFpVWFsUXRrOGx4TkhwSkNRc25nODJYT0xYWTBuNFhHdG9xL2FKMEZrS3RT?=
 =?utf-8?B?Ty8zMGtqSEtxREloc2I4QkZ4YjNJTGM4Tld5TndrT2szVDcxNXJuRmpnQk5N?=
 =?utf-8?B?SGM4aUVic29KbTcvN0hCSXdpTGFmem10U2Y3b1p1djNNSGplTnYzaFpIOWFq?=
 =?utf-8?B?aGIvZVRPdi9kckFHVy9IVXVJMDJmMXkyelN2b1FhTDFzQlFyNFJLd2JkNHVk?=
 =?utf-8?B?Y3ZMVkJwT0JBejN2UU94b2JwMXNXSlkwaVVjYWI0R3RNbFNkM0dIMkFpUThK?=
 =?utf-8?B?S3krOEt6YTgzYnZXWnh3T25laEo4QjNseHlqOXVQVE9BeC82c1lkdytiK1ow?=
 =?utf-8?B?MDdKTkRZQ2lvUFhvZVVIQXltbzZSQm5wK01YdFg1L1g1elNZa01jeDJlUjF5?=
 =?utf-8?B?MWFjNUFkUHVSb08vajFaWlo3bmk2NHk1MXpBd00yK2g3NGNvZHp4WEdYTFRn?=
 =?utf-8?B?RDJGU2dtSCtZajZvc3hQNVcxd0F6WGNRVDlwRitzRHZtZXNYUmV3WGtOOVlH?=
 =?utf-8?B?OXlnd3JJcU13dHE3QmI1UGU2NGFpVHFnYVZwQUw0WkpnV1F0SnVYcEl5NE1O?=
 =?utf-8?B?c0lPREtRa2UvbnQxTFh3emFWeldsMnk3Qk1JZTJkYytqdEl5c2xWTmFKMEd0?=
 =?utf-8?B?RVYvRkUwTmUwTWt4Yzl2YUJaakRKMTc3clNmZFFYR2VORmpZamRIR1dreE1K?=
 =?utf-8?B?eUlMS1BPWnhTZ1dlWCtMcXpJdXYwZmdvM0EvQWpQQkdVVVJmbldTOWpWT0ts?=
 =?utf-8?B?TU1Icm91ZVZJQXJNMmxyYnpJQUJIRm1SMGFUY2IwUUtNRVcwZUE5b2xwNWZo?=
 =?utf-8?B?Vmp0cDJMM0hyMWlyZVZBb1V3ZkhrZkRvbWF1RDVvUzA5S1pSc3hWVWVHSUk5?=
 =?utf-8?B?eHkyL2hSVVMvUXhrS1JLeXQ4MjcxL0hqTXZNZHp5a2hqK200UkMxaVZDZkZ6?=
 =?utf-8?B?bHVnZWxiYnkyRXM3TlBGQnpMSEdLQmN0Yno1blRGdDJzdG1KWWdnWUtoOExx?=
 =?utf-8?B?Y1k4blFiVzNpamZTdTNIL2cwenhOUnNHc0lqNUJjOVZnT0FOeTU5eUFFVXA1?=
 =?utf-8?B?R0RtU2p6S2htYWcxSUF6QWdaWVVrb2g4SzR5Z29MenkvVDYwK0ZCV1VJYWZs?=
 =?utf-8?B?dzF6QjN3UHBWdWpDb05XYitpNXZvdUJFNjJZWWpqWCs4Z2IwL2pLTkdxdlU5?=
 =?utf-8?B?bnF3K0lYcHAvSmw2TWF2K2RXNFQrTjBhc0hiMGIvNzNDOUh0V2JYeVoxM29S?=
 =?utf-8?B?dlpXQWY1NjJnc3h0T3IwLzAxOWtBckJOblhPM205M2RqbnIrNXhTYUx6VUdn?=
 =?utf-8?B?QzUxdGtLK0tIaUR3MmxoQy9NcVk1bmg1UXBiVEFzKzdZaDVqVjhldzZZSGVX?=
 =?utf-8?B?czh4UmNEVU1EVUd0Wi9FMVJqZVVSNGdMSkxXSHlPbDVkWXJZMkQ2QmNrYzcz?=
 =?utf-8?B?K2ZOKzhRenVyUFJHdWJvYkx5RFR4ZFYwS25ybUIrY1NGR05ZdkRVQ0hBS3lU?=
 =?utf-8?B?cS9rWkFCNnZhR3FrRTROdk9hVjJheHNqMkVFaWczLzVKY3hOUlN6YkNpeVIy?=
 =?utf-8?B?U1lPTGxQaFA4MVRqRkVzYWhYT0t1UGs0S1pDQXNNWjg5cExYOUJReFBqNktJ?=
 =?utf-8?B?OVhkUngvQ09mUjQzbUR2MFQ0VEh2OUsrbFBnT1JhanJQb1ZoL1FhYkFQd0hG?=
 =?utf-8?B?aWdUaTkzYzk1VzZhcXVPTFM4YzVsaUhOV0NvTC9wdDFpSWszNXYzOXFOVk0z?=
 =?utf-8?B?d2kvY1E3dUdtbzM4aUtpcklxZnhQNit4bis1SkpXZERYdi85SnZKUXh0aHZU?=
 =?utf-8?B?cTU0aUUzOTRidWNKQnYvWklVWXpyZ2JUN3Mwa05JcTVaMVVJaG5Mblc4cFo2?=
 =?utf-8?B?eUJsVjAvMVJGZ0xwNjRtWG00eEo3VnVxVlFXMVRHY3Ezb2xpWm5aeGM5QmRK?=
 =?utf-8?B?QU5DV0xEOVU0ZnZKbWV4eDV0TGtyQmY5bkxRUzdmbXJoRFJiNTJDNjRwQVpo?=
 =?utf-8?B?ZWhJK3VLWGZJeWtHQjBVamxLWkFNVEtoVFBDV2F0Y2VHdlZuNW1MRUU2OGQz?=
 =?utf-8?B?MWZJOXVObDZvbGJMeEpaVU9Nck1oSmV4REl4OEMxaHN4UUpaYXhqa1Jrem9L?=
 =?utf-8?Q?SzyfQHluTbO0AjL9wpElIYCBdC+dsYXM7cCdd0XNLhFkh?=
X-MS-Exchange-AntiSpam-MessageData-1: iLtjQwmyPv8DQg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a75cc1-344d-44c2-67a2-08de79d7871a
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 10:19:32.5454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+KEn2xJ57uqMQOcd0CfJMBvsl0qe0zXipUoTodRjfR5uXzCz5XLEY+1qWgouiea74JBjx25peqDrIgAk8FAaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9579



On 26/02/2026 15:09, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This chip identifies as Tegra238, so update the BPMP ABI header to refer
> to it by the correct name.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   include/soc/tegra/bpmp-abi.h | 48 ++++++++++++++++++------------------
>   1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/include/soc/tegra/bpmp-abi.h b/include/soc/tegra/bpmp-abi.h
> index dc0789c20333..39bb3f87e28d 100644
> --- a/include/soc/tegra/bpmp-abi.h
> +++ b/include/soc/tegra/bpmp-abi.h
> @@ -1020,9 +1020,9 @@ struct cmd_i2c_xfer_request {
>   	/**
>   	 * @brief Tegra PWR_I2C bus identifier
>   	 *
> -	 * @cond (bpmp_t234 || bpmp_t239 || bpmp_t194)
> +	 * @cond (bpmp_t234 || bpmp_t238 || bpmp_t194)
>   	 * Must be set to 5.
> -	 * @endcond (bpmp_t234 || bpmp_t239 || bpmp_t194)
> +	 * @endcond (bpmp_t234 || bpmp_t238 || bpmp_t194)
>   	 * @cond bpmp_th500
>   	 * Must be set to 1.
>   	 * @endcond bpmp_th500
> @@ -2108,7 +2108,7 @@ struct mrq_emc_dvfs_latency_response {
>    * @brief Query EMC HUB frequencies
>    *
>    * * Platforms: T234 onwards
> - * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
> + * @cond (bpmp_t234 || bpmp_t238 || bpmp_th500)
>    * * Initiators: CCPLEX
>    * * Targets: BPMP
>    * * Request Payload: N/A
> @@ -2139,7 +2139,7 @@ struct mrq_emc_dvfs_emchub_response {
>   } BPMP_ABI_PACKED;
>   
>   /** @} EMC */
> -/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
> +/** @endcond (bpmp_t234 || bpmp_t238 || bpmp_th500) */
>   
>   /**
>    * @ingroup MRQ_Codes
> @@ -2147,7 +2147,7 @@ struct mrq_emc_dvfs_emchub_response {
>    * @brief Set EMC display RFL handshake mode of operations
>    *
>    * * Platforms: T234 onwards
> - * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
> + * @cond (bpmp_t234 || bpmp_t238 || bpmp_th500)
>    * * Initiators: CCPLEX
>    * * Targets: BPMP
>    * * Request Payload: @ref mrq_emc_disp_rfl_request
> @@ -2184,7 +2184,7 @@ struct mrq_emc_disp_rfl_request {
>   } BPMP_ABI_PACKED;
>   
>   /** @} EMC */
> -/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
> +/** @endcond (bpmp_t234 || bpmp_t238 || bpmp_th500) */
>   
>   /**
>    * @ingroup MRQ_Codes
> @@ -2192,7 +2192,7 @@ struct mrq_emc_disp_rfl_request {
>    * @brief bwmgr requests
>    *
>    * * Platforms: T234 onwards
> - * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
> + * @cond (bpmp_t234 || bpmp_t238 || bpmp_th500)
>    * * Initiators: CCPLEX
>    * * Targets: BPMP
>    * * Request Payload: @ref mrq_bwmgr_request
> @@ -2299,7 +2299,7 @@ struct mrq_bwmgr_response {
>   } BPMP_ABI_PACKED;
>   
>   /** @} BWMGR */
> -/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
> +/** @endcond (bpmp_t234 || bpmp_t238 || bpmp_th500) */
>   
>   /**
>    * @ingroup MRQ_Codes
> @@ -2307,7 +2307,7 @@ struct mrq_bwmgr_response {
>    * @brief bpmp-integrated bwmgr requests
>    *
>    * * Platforms: T234 onwards
> - * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
> + * @cond (bpmp_t234 || bpmp_t238 || bpmp_th500)
>    * * Initiators: CCPLEX
>    * * Targets: BPMP
>    * * Request Payload: @ref mrq_bwmgr_int_request
> @@ -2445,7 +2445,7 @@ struct mrq_bwmgr_int_response {
>   } BPMP_ABI_PACKED;
>   
>   /** @} BWMGR_INT */
> -/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
> +/** @endcond (bpmp_t234 || bpmp_t238 || bpmp_th500) */
>   
>   /**
>    * @ingroup MRQ_Codes
> @@ -2453,7 +2453,7 @@ struct mrq_bwmgr_int_response {
>    * @brief ISO client requests
>    *
>    * * Platforms: T234 onwards
> - * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
> + * @cond (bpmp_t234 || bpmp_t238 || bpmp_th500)
>    * * Initiators: CCPLEX
>    * * Targets: BPMP
>    * * Request Payload: @ref mrq_iso_client_request
> @@ -2636,7 +2636,7 @@ struct mrq_iso_client_response {
>   } BPMP_ABI_PACKED;
>   
>   /** @} ISO_CLIENT */
> -/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
> +/** @endcond (bpmp_t234 || bpmp_t238 || bpmp_th500) */
>   
>   /**
>    * @ingroup MRQ_Codes
> @@ -2644,7 +2644,7 @@ struct mrq_iso_client_response {
>    * @brief CPU freq. limits in ndiv
>    *
>    * * Platforms: T194 onwards
> - * @cond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
> + * @cond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500)
>    * * Initiators: CCPLEX
>    * * Targets: BPMP
>    * * Request Payload: @ref mrq_cpu_ndiv_limits_request
> @@ -2678,7 +2678,7 @@ struct mrq_cpu_ndiv_limits_response {
>   } BPMP_ABI_PACKED;
>   
>   /** @} CPU */
> -/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500) */
> +/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500) */
>   
>   /**
>    * @ingroup MRQ_Codes
> @@ -2911,7 +2911,7 @@ union mrq_ringbuf_console_bpmp_to_host_response {
>    * @brief Set a strap value controlled by BPMP
>    *
>    * * Platforms: T194 onwards
> - * @cond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
> + * @cond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500)
>    * * Initiators: CCPLEX
>    * * Targets: BPMP
>    * * Request Payload: @ref mrq_strap_request
> @@ -2949,7 +2949,7 @@ struct mrq_strap_request {
>   } BPMP_ABI_PACKED;
>   
>   /** @} Strap */
> -/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500) */
> +/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500) */
>   
>   /**
>    * @ingroup MRQ_Codes
> @@ -2957,7 +2957,7 @@ struct mrq_strap_request {
>    * @brief Perform a UPHY operation
>    *
>    * * Platforms: T194 onwards
> - * @cond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
> + * @cond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500)
>    * * Initiators: CCPLEX
>    * * Targets: BPMP
>    * * Request Payload: @ref mrq_uphy_request
> @@ -2997,23 +2997,23 @@ struct cmd_uphy_margin_status_response {
>   } BPMP_ABI_PACKED;
>   
>   struct cmd_uphy_ep_controller_pll_init_request {
> -	/** @brief EP controller number, T194 valid: 0, 4, 5; T234 valid: 5, 6, 7, 10; T239 valid: 0 */
> +	/** @brief EP controller number, T194 valid: 0, 4, 5; T234 valid: 5, 6, 7, 10; T238 valid: 0 */
>   	uint8_t ep_controller;
>   } BPMP_ABI_PACKED;
>   
>   struct cmd_uphy_pcie_controller_state_request {
> -	/** @brief PCIE controller number, T194 valid: 0-4; T234 valid: 0-10; T239 valid: 0-3 */
> +	/** @brief PCIE controller number, T194 valid: 0-4; T234 valid: 0-10; T238 valid: 0-3 */
>   	uint8_t pcie_controller;
>   	uint8_t enable;
>   } BPMP_ABI_PACKED;
>   
>   struct cmd_uphy_ep_controller_pll_off_request {
> -	/** @brief EP controller number, T194 valid: 0, 4, 5; T234 valid: 5, 6, 7, 10; T239 valid: 0 */
> +	/** @brief EP controller number, T194 valid: 0, 4, 5; T234 valid: 5, 6, 7, 10; T238 valid: 0 */
>   	uint8_t ep_controller;
>   } BPMP_ABI_PACKED;
>   
>   struct cmd_uphy_display_port_init_request {
> -	/** @brief DisplayPort link rate, T239 valid: 1620, 2700, 5400, 8100, 2160, 2430, 3240, 4320, 6750 */
> +	/** @brief DisplayPort link rate, T238 valid: 1620, 2700, 5400, 8100, 2160, 2430, 3240, 4320, 6750 */
>   	uint16_t link_rate;
>   	/** @brief 1: lane 0; 2: lane 1; 3: lane 0 and 1 */
>   	uint16_t lanes_bitmap;
> @@ -3084,7 +3084,7 @@ struct mrq_uphy_response {
>   } BPMP_ABI_PACKED;
>   
>   /** @} UPHY */
> -/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500) */
> +/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500) */
>   
>   /**
>    * @ingroup MRQ_Codes
> @@ -3092,12 +3092,12 @@ struct mrq_uphy_response {
>    * @brief Perform a frequency monitor configuration operations
>    *
>    * * Platforms: T194 onwards
> - * @cond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
> + * @cond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500)
>    * * Initiators: CCPLEX
>    * * Targets: BPMP
>    * * Request Payload: @ref mrq_fmon_request
>    * * Response Payload: @ref mrq_fmon_response
> - * @endcond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
> + * @endcond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500)
>    *
>    * @addtogroup FMON
>    * @{


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic

