Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1A2257AF2;
	Mon, 12 May 2025 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747051316; cv=fail; b=uSpTIkTGAvSIaA4IpDgqaeUDOvQDfgvy8+vajRgO5aEXTD+CGeKWArpraAtb7rItI5hh3E/3StAv8KMCvSvNCRxGWdPsw1as2RlNbwCBcGHoJU+rs+FtGjQahWaSYUhY4/yWrYvFQFcN+WSQwhUMRuIPGPkT7+dVi+TzdSC6PqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747051316; c=relaxed/simple;
	bh=p4R+WTKyhfsbOdV0QSnSty45Gdk8VNH60FV6FtLIbL8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cOxjT7+xtKbpU/U8HDm8wAAGRTo7N4gKCzWMmARE6h8b8JqsdomgtHZW+OfmJcPxek+jgELaUnmv5ndLYxF48XClcFY07PuWz0HZTxGDAZNc9t3yII3ZC8aTjsWpwd/JFrSQRvEAWGOozv82pL2z9a+9RHALi+jRmjWEB41X2hA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UKwK0mAe; arc=fail smtp.client-ip=40.107.92.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UKwK0mAe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxpXzV44iV3dMX7dwxcoIckMRXvCj3zy+sy8ghpT25eJP7VQjkFwfumwk4lGtDq5NsqOqN0MeJ+Vslf5ufFmBf3BAkmuF7r18TLkXVzFE7TU2KbcQmDkUeYGWyI+2nF5f1MmOOL+58e/4uzafREQU+m3aS0yB5isPGhOGq5rkXTFEXbfWzqevyYyZxjXIxlCGC5sM5Gxp0COuHQAg2eURdYGwByMxod8RP6Gc6qCTomm2ujAp45V6wB7nXeZPqRMWiAWB4xPESRgWcgjf9msM6oBGgEXnKsLXQrE3LEraHBzE0+gGtgePcDf6gu6ihGwm8EHp0uzS0mruM3C7uzwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4M7tw3yiMv9uYu+6kpFciDAvh5SdMnXHornowQQr204=;
 b=ogzsQsOTRbGp57+tSWK6Bv5qxMRDvFX85v5GppRVlStqVAsPxuduA4dJY4XDxom20+buqLJpz6icPVdLSuHHoHgAn6xhaJpioVZsAvLxCQPXJ6f1R9hCbt+BmhvUnaqQQunfjVHhIUbG8qzK9Pz01BlC/cn7Ff6dn34EEOJ1ov6XqqQNpd3xfJq1YcfbHhTYG3sitn/3jhBwW+7OndMjae6UDccTyoPXS3fb4d3YlJ/coUgAdqOM6uHO1gaLXn93bT2BDtXqhklT25OPkMAbrrpDNusECH92b+8wKqrmY7psB6Hoq8t+k/UzbZQwD77kVEuxXDB/D0KALyWPe5ogkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4M7tw3yiMv9uYu+6kpFciDAvh5SdMnXHornowQQr204=;
 b=UKwK0mAeK+wa+aLnU/RPXIQS+KB138BO+XE3y05V/Jo9w+uVPi5KBXjgko5R3sLODDHzSbqh+0fFGcsEQagkNpvHaqj7SJSbwe09fuCuHJWbR2WNADNsI1SXcEyhvsmzgTrXbxvC2lpgg2+s2nZsRYIoHAThI1YAPAvRQhjlCiB+dGnGO7JFz+ShdMwPVtpfwdRX2vINhj7O3mBt03blOvEAaL3XoMWOcGlqMY6irKUQFCdQdsPiQWzhLnJxl3FjkjGVJK5cy2vVl+EXrZurPBRXHnqlfR04hlxfhEz4bnetTbBBxk2VMmrNIkhTU28HWkT1E/n4BtCBaBPgPLrkQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9237.namprd12.prod.outlook.com (2603:10b6:a03:554::5)
 by CY8PR12MB7610.namprd12.prod.outlook.com (2603:10b6:930:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 12:01:49 +0000
Received: from SJ2PR12MB9237.namprd12.prod.outlook.com
 ([fe80::be92:6add:7086:6020]) by SJ2PR12MB9237.namprd12.prod.outlook.com
 ([fe80::be92:6add:7086:6020%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 12:01:49 +0000
Message-ID: <9694bc9c-4ad0-46c2-8626-e569734f2e47@nvidia.com>
Date: Mon, 12 May 2025 17:31:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] ASoC: soc-pcm: Optimize hw_params() BE DAI call
To: "Sheetal ." <sheetal@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, peter.ujfalusi@linux.intel.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, mkumard@nvidia.com
References: <20250408083022.3671283-1-sheetal@nvidia.com>
Content-Language: en-GB
From: Sameer Pujar <spujar@nvidia.com>
Autocrypt: addr=spujar@nvidia.com; keydata=
 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
 tFh1Kv06N2eJoLklRzTKy6I=
In-Reply-To: <20250408083022.3671283-1-sheetal@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To SJ2PR12MB9237.namprd12.prod.outlook.com
 (2603:10b6:a03:554::5)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9237:EE_|CY8PR12MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee53371-9da0-45ee-8abf-08dd914cc648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MW1KdUNFbXI5LzVNYm1FTmhzZ1ptMlhxakliWUpZVU5sSGJvdGlJVmhtNGI5?=
 =?utf-8?B?UVl6MXQ4dHFaVkhvbWphcG83ZGh5bi9hWEl5ODdyZ2J3RHB4UjZVVy9Vc2t2?=
 =?utf-8?B?bnh4ei9FOGYxbTFiTGhaeW1NdEJtM21LTWp1REVScFVKcXhkMEdtdDJJUHcx?=
 =?utf-8?B?UTlSTkdldFkvVHQzZUsyMEM5Y1VsZ0p5WFVKODVLaW41ejRuWXEra2Zqa3dM?=
 =?utf-8?B?MG9zUFZqc1lEaTJRZjZvd0hkSEhPYk1VZkd3WnFrUUFpNWhIN0xyaFVMRE5C?=
 =?utf-8?B?bnNSVnk2SjFPcWY5YTV6NGJ1OCtEbjhsUUx6OFcxeU1SWVpYaTduZUFLUGVF?=
 =?utf-8?B?TVIzdGQyQU53T2NPTG1sREV3azQxMUg0TnlJTW1rdlUweW1TUmZJN0l3allX?=
 =?utf-8?B?dWZmMGI4ZkdLVVVXRkxvemx5UkJzVDUvSFFpRnltTUFGQWkxK2pqZVBzK0kz?=
 =?utf-8?B?bjJSSFRCQUJyTEgzT1RaLy9kbkJCcmRwcHh4cW90ZGVTTXVEd0htTEZyUmNC?=
 =?utf-8?B?ZkFROW9wVlZMdUdzUzdMcUcvdXFOcE12ODlCQkR4UGtIcnYvb3RnbDJ3NHpq?=
 =?utf-8?B?cDV4TWxJdEhLOTZUZ09iN3M5dnUwSUl6NXpyU3VMU1d0Z1dvUHVwMCtadW13?=
 =?utf-8?B?d2tBY25ZZ3NXcm5DY2ZiMWkrR3VSc2VSOWFjRDBvcUtrRzROWWc2Zk5BSjBS?=
 =?utf-8?B?cVIwd0lFSDVuY1RhdVVZbFNKZmNpSUtFWXFXUTExWGcrZ3MxZmhiK28zeEFo?=
 =?utf-8?B?QU1ubHJvOXpHOWJXM1NEbE52YThQam9ONDFYUFdsT0dzRmQ4THlvVFk4THE3?=
 =?utf-8?B?QVYxNlpmYk8vTDBTM25HeVJnK3JQQlIvZXA1ZXNuUm92NHYrWDlFc2Jlc3V3?=
 =?utf-8?B?aVhCVXIrNjVUaVE4MHRTTmxXdG1KRFFhQWlOQnhLeHM1cGZTb0QvOFlBNzZG?=
 =?utf-8?B?M0xQUjVlUkJHMyt3d2tOL2VWeTRRMWl4eWxBOFdrQ2VkODhpTzRxQUpGSGRS?=
 =?utf-8?B?WXRtNjkzekxZbmdkOU5YeDEya3Qvc2k2U2RIWEFuUTBZMGlMWUVxMzVscDcx?=
 =?utf-8?B?VHNvNlJOZDhidDVYek53TURJNzNHc2RCQ0VEdGFQZU1zeHU5dGs2VXZjSTlr?=
 =?utf-8?B?dWtLcEtKMXBaa1I2ZENlRDYvaTRZeVkvZ1N3TzJjL1pzWWxRU010NUJRWnlW?=
 =?utf-8?B?bVJLcGVHOFNxSDJ6S1g3c3hHQmFndnliYnBkSXlNVWtudmt2RkVwa3ZFRzNs?=
 =?utf-8?B?eWdiL2xaa29qZDYyYytsdXUrckFxd3FHNUlDQWlxZEY3Zml0bENsTVRUTVBz?=
 =?utf-8?B?N1RhdlJmbm9LTi80UTJzK2REUzNid2lnT080Q282Nm85TkFQM1lBeVp1dkVs?=
 =?utf-8?B?Wnh3YXI2T0dtUm41dllLVTIyRnNUMWNzMkRFLyszVS9teEJsRWNvSTd3TzFX?=
 =?utf-8?B?aC9TM0w2M1pDc0NvS3o5T2wya3REclIvVUc3RnFwM0tqbDJZTmZ4aHpWc2My?=
 =?utf-8?B?SXdxaVppRGIybmJVeU0rN2R3WUFaTktaS3k1VTlYQjJUYUI1cHBxQlRVZml6?=
 =?utf-8?B?VmM1azgrVGVySkYycGs4dlU0RldyTTM4TXprNzJvUGdsYnplUjZiUFZ1SmpW?=
 =?utf-8?B?RU5WL0FrZVk0ZnJGdTVtVUVZV1FEM1pkdWFrdlR2TTVyUjVtZi9tcDVQYUM4?=
 =?utf-8?B?WTVpeEF0TnZoSzJJQkFFc01DaHVocXdUZTFiNWIzTXZlanRKYlVXdjEyTzgv?=
 =?utf-8?B?dlBSVWJUY0FiTW9XSTY4NjE3WjlqYUhUTGFxQk9YSWdMNWU2K2pNeWJpQkIv?=
 =?utf-8?B?YmQ5VFNwRkF5OW9neW9UV2RMcnNqWGZGUVhUaGJGNUNlcDBINzVLaTRoR3lM?=
 =?utf-8?B?MTVMdGx3QXZWUjE5WFIvR3ovd0grZ0IxblJ4Sm1aaWx6NjVuYlU1SFdJZ3lW?=
 =?utf-8?Q?4lMe8Ir+vXg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9237.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHNOOG9ZUWljQVEvV3owOXlPaWg3ZkEvMHZzOTVpRFJPc0FxeDRGS0hVK0Fl?=
 =?utf-8?B?OE4vVk9NVGNFcWxxRk50VWNubHdTYzJUQVhhdng4dnB4L1g4UXMrNHd5OC9I?=
 =?utf-8?B?NS84dE1PdDNoQ01aRlE2S3FYeGtnQ3ljcjdHd0hYS2dZVlQ2TzJxTnZkU1Z1?=
 =?utf-8?B?V1pkMEk2WVNaR1ZjN1FVVkZzUjE2a0tUdkZYUnFhejlxL1VjWk16SHorQits?=
 =?utf-8?B?OWdId0YzMTVhOTFOSjdJNWkrb1lTa2JQV3Z4UFdVZlNwLzBRODcrMU1vUlBD?=
 =?utf-8?B?MW92ajJqRmxKUmg3QzlzZ3FjSy9pTGROdFUrTEhNbWlJVE9TVUlrY0N2YXdG?=
 =?utf-8?B?MUdiKzZ4MzJKZ2lwZk4xRlhRSTRTQnFQMjUzc3lUd2kvTnNLY0M5RktlZjRk?=
 =?utf-8?B?VDg0NkU0L1d3V3BXSWlnM25zb1JIU2FCTVJZcWdEVko0bXV5RUNXaVdmZlBm?=
 =?utf-8?B?RGtWVldLWDd3aTZueHVaOFVzamNOSWxrYjFRMDhGMCtXZi9aeElpYlRXalI1?=
 =?utf-8?B?eENFMjNoRUlveEpuVkY4UTByb3BrQ256clZKaVBxUzRFY0s4bHA0Q3hSNlVn?=
 =?utf-8?B?Wlp6cGx2bFpJbFo4VWVNNWZtOW1JZmU0R0g5M3lZZzF3SVViZktSMEZSNXNl?=
 =?utf-8?B?UklYd2JRcHhtWkxUZUdCU0NkNm5GM21NdVdBOWZ3eFJuUy9UMTlZRGMyLzVW?=
 =?utf-8?B?VjN6VnJCd3NLS2x4eGMzajZ0MjJ2UThPVkp6ZjE3T3B2UVhnQkhyOWtRaU9D?=
 =?utf-8?B?T2lqQjRodzJJV0hMdVRjUldwUzVwZExyK3pFNjBkSXIvbmIzbC9UMDY1Y1dt?=
 =?utf-8?B?OTd4ZVRzblhPWHBLQWRRMXNUNTZRVlIxdW0wcFdJQmJiWks1QVpzZmtaWlp5?=
 =?utf-8?B?S1F5L1hyTGRrNEtseGp4TUtnUnRlVUtlVTEyS3MzWGpHUEFjdXNxNmxJTklE?=
 =?utf-8?B?ZnZUN1dhdlFydEdUK0x5V3k2WWtFd24yV0IrbEdDaEMwcGl3VDdGTzBzcSth?=
 =?utf-8?B?d3NQcTZqa1NoN1FjTGlHVDZuamN3SS9hNVhXMXBxbEphU2QxZjkxN3IvYy9y?=
 =?utf-8?B?WHRLM3pON2NlWldDQUpTdkRURjlwRTdubVBKaGIwY3NmUmNlYWlPc3gwNE1B?=
 =?utf-8?B?a2VOakQrMm9Vbk5aLzRPTFIrY1g2Ry9GYlNUYXVqR1kwak9GSk1xaDlxb2ly?=
 =?utf-8?B?dS9aNnp6Y1MvdW03TEh6MGpPNUIyZzg2aUZUYmtNT0xYejVCbm01aE1CZkt6?=
 =?utf-8?B?czViZ3I3VGc0NHBnTDB1NktrdUFIVWliZXk2UEdSSmh5QmF6dWoyb2pTMkJN?=
 =?utf-8?B?bHNkN0haUTFBSnJxREljT0E5UU1qb05JcFo1ZmQvR1FLWU1PTlNTT005TklC?=
 =?utf-8?B?aW02M0U4YVBiTEdLaXhoUDI1VkNKVjh1Ny9PbUJ3c3JmKzBjODAvZ3pGQStr?=
 =?utf-8?B?L0N1OFFRb2RYbldlMXhwbkFvQnZYYnRkajVmTGVZbVI0UStUTkw0cSt0NHFy?=
 =?utf-8?B?cXk4VEpqK1JlN3pFc3FTNWpIak1FUytXTDgyam9WYjB0VTY5dFQ1VGlkeGdI?=
 =?utf-8?B?MTJJQThPb0VSV3dFVkV2MTlOK3MrVUs1aElhK0NKblRIYzk0MFg3NFppZ2p4?=
 =?utf-8?B?aWdObUpaNU1pOVVvL09LZ2pwdHJXNC8vRzEwTmgwd2ljSzVrTUVJbHNWT0hY?=
 =?utf-8?B?ZHR4ck9aSC9SRkJTbGQ5Q2hKQ29kQ09FMmZPM04xbVhqbEE4c051TXg2KzNO?=
 =?utf-8?B?TlFrNXR1UnJsdjVuc2lVRE5CNlJod3BUZUlFcXNNeGZoa3htckNubEZLVW4y?=
 =?utf-8?B?emZqeStWWDlFaTh0OERwQjRtRXJzZG5WYUtQcnFydmVhaFpRTm4zejNRMTdK?=
 =?utf-8?B?Z1MweU1KQWc3ang3QWw4L2g2RitHU3VJb2x6YlIzSVdkaTVhcVRVTkJKbUhj?=
 =?utf-8?B?RHUrcGk1a1dteitQMEpKWmMrUFhEQVU2RXJDV29KeFdGZlZxa2RwUDNKVGd3?=
 =?utf-8?B?S24zTVNSalFTQjU0SWxtNmVHYURRN1hQUVQxYWYzR3U4YWEzTEVUbkJSUU9o?=
 =?utf-8?B?bTNhcGNENisxKzRCS1Y0NG9jQnRFeFY0eEY5SzlzQlFha3M3NGJ1dGJQY2VI?=
 =?utf-8?Q?lqaAl5A/Wo3t/t8kkjIFTteQc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee53371-9da0-45ee-8abf-08dd914cc648
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9237.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 12:01:49.1148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4tgBd9YaRBNZPN7ru5Fca57bXu7bc2+txsiXE2YRgSieP+9s/tuWFXUw8cJKx0ZdMOJfDGJ7Z8luYDbBbvL8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7610




On 08-04-2025 14:00, Sheetal . wrote:
> From: Sheetal <sheetal@nvidia.com>
>
> The hw_params() function for BE DAI was being called multiple times due
> to an unnecessary SND_SOC_DPCM_STATE_HW_PARAMS state check.
>
> Remove the redundant state check to ensure hw_params() is called only once
> per BE DAI configuration.
>
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---
> Changes in v2:
> - Update commit message as its not a fix.
> - Marked as RFC patch as it requires feedback from other users
>    perspective as well.
> - The patch is being sent separately as other patch is not RFC.
>
>   sound/soc/soc-pcm.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index d7f6d3a6d312..c73be27c4ecb 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2123,7 +2123,6 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
>   			continue;
>   
>   		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_OPEN) &&
> -		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_PARAMS) &&
>   		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_FREE))
>   			continue;
>   

Reviewed-by: Sameer Pujar <spujar@nvidia.com>


Earlier Intel systems needed multiple hw_params() call and I am not sure 
if that still holds good. Given https://lkml.org/lkml/2021/9/28/1267, it 
would be good to get feedback from Intel and I have added few people 
based on the earlier discussion.
