Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BDB212F1A;
	Wed,  2 Oct 2024 18:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727893848; cv=fail; b=H2G7WiAtfFz+O3kGk0NSX2h+Blw8ASPYV382tInhuoRYemIBlKYzUsdYL5sxG1NCMDVA620F4g6puUDdGCHNglxLV1q0Yc0zEEwlrSKUxmbjp46FRnhk5UySIveNRJFAO4lsvtCrBphPCCFh9f0Iug6KrBnZR6oC3AWcY/rua+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727893848; c=relaxed/simple;
	bh=tyzx4loggMjOR7rphZ9S1WWnzkSSc8SwiZvvXAyW10o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jyaVyApSaBq9LBSTqiZzQm2eIU2L91ihKg6dS5RB5Zgllxnt+ukGyTuTYHw0q4z+wFQu8M1E3ct1/TBusnX2W2x3NbEVPn5bbykdMXECDUiBJ0+8qNVgM8cHQ+iDctDIt7n+49b7FB+p0BU7+/DFGvqpNn2nTLpjModNh/DKe2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ys6gQUkL; arc=fail smtp.client-ip=40.107.243.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ys6gQUkL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBOtv7+/JKBBuaZYaVsW0ZUXdbzg58pWuYHvkut2wBq3XK6IrBOsSahWLRUUIHRwSKFBjkDKY0S8WEaKmlYMECrojJVXkyGSNrZioDDnJMBTs/qjD6v9YhpzTr1dMDRAanoyAe0IFv03bsr+yQPQcu3RqmhPuJTHLs3H2gcIQSfKSkZqbBdM0Ara1NMhD6FGqTp2mIsFszqfpDcJSljBU+KFARBW7HDxZoPKCSzGT1BfRFvacQ6vOhtVPjYM/71jArg0bq9QkuALMZKGNbquFO4VmLanhl6efstf85dZMDPb0KAsosQJaq1O+lKPSPR+Mhwms+gf50+wu/KCw2UJiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6z0nt8pd71fJoTq9wOBfUdzcz1kdV0OMb2pIWukvoj0=;
 b=FvMaeUE5ut/JLyz0xNt5wq4dc601NCXsx3POhjv5NkZnbtWn2uXnvo78fx8RjO6QMXUa/+Zy9Q73rH6kASFu7xkU1p74hXAtu2BQ0BxdRemWxpIoypAlxi8FUaxjHlU5YNzt7lqQ7BhAeZJu0aMZED0rBhSZC7Cslg6kS91P1VAqbb7Ap8boomyE/Mfd2oAkxyUdvM3fYiQibUK/H4JjbFAQHZrWSXW29yieDryuylKahsdBnHi4bwxK4n4K/RyylfbyXiRRJyEBMbVXwYZ2aujHMrMWUBDy0GNAjw71phewyktaZfGj0yLT0A7v5PjZhhGKo246DVC/qCooqmMwTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6z0nt8pd71fJoTq9wOBfUdzcz1kdV0OMb2pIWukvoj0=;
 b=Ys6gQUkLB5REClTQ5rVZt0+0SEq9e+4xQ+U+I6BpcSrEaDrMUeJ0Lgdjaxcl5Uel0JeY8/RT2GL+LlQsstgAPMxhRep3dGIg+u8t6MIPClO4fJ3M9X+/DC6hLgKkyNc1LyMMEuwZ26OCxDqHyZ0onAlDKLXyIeILHxk2KqAynv1jgpAsbHfZBGmpdaZjBAe9g80Pcm5GSYPk3mQV0ALSx5oIAwQ1z6ZOUJlMxPYwewY4U9Rf/BnLntjMGoRU9TsXSD99G2zmoSXOQYmb3zPdKeBS6YtXtc6enLrjvj0LOaHaQTgwJS6oGWPUcvDFXdi8bXVFgt0U9DzF+Pq3xjdyLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS7PR12MB8322.namprd12.prod.outlook.com (2603:10b6:8:ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Wed, 2 Oct
 2024 18:30:43 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8005.028; Wed, 2 Oct 2024
 18:30:43 +0000
Message-ID: <b1b67db0-3b9c-4d96-a119-fe3fcf51b6e3@nvidia.com>
Date: Wed, 2 Oct 2024 19:30:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: Don't try to create links if they are not
 needed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Saravana Kannan <saravanak@google.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20240910130019.35081-1-jonathanh@nvidia.com>
 <2024091152-impound-salt-c748@gregkh>
 <d89c89f8-0036-44a4-8ffa-ea89ed576a9f@nvidia.com>
 <2024091627-online-favored-7a9f@gregkh>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <2024091627-online-favored-7a9f@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::15) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS7PR12MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2161de-9ad8-4142-a7ec-08dce31052f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VE9VSmo5ZGRmQkRMNGpWT2o2QTY5aGp1Z2d4UmlLUUxvNDY5K0p2VGkrQlJW?=
 =?utf-8?B?Wk12bjhzYVIvZXRJSi9BaDhOMDhsR0tONzltSkk0NHpVTmE1aUVrV2tOdG9n?=
 =?utf-8?B?cndKUWgxQzlkWVNTRFhtUHRKSFpGWk1ZU0QybkY2QWpOSjJrL05tNTlEZWZW?=
 =?utf-8?B?dnlxaDhETWpkVm8za3I0SHJSblh3d05qTVNnNTU0eThCOHd1aEJzZ09GV3ht?=
 =?utf-8?B?MEJDN3ZKVVgyVmJyYkRNeUFDQjN5cGdPdGhkZjFxN0dXb1JBaGlHQk1yT1Vx?=
 =?utf-8?B?OXpEaW0zMVBTWkpSdThwcXNXN3RvZGZtR0ZoT1BJZUNEMDRCcDlCbEw5cnpN?=
 =?utf-8?B?T21XU1MyaXZDSnJneWltRWFxQkRrZVRNdGtQTElyYkE5elJ2TFgvamJJR05u?=
 =?utf-8?B?QzFDcXBKdXd0cEFqVzdjUjd4MGtmTDJjaGpOUmhRRWsxV0pwNFpic1JXekxV?=
 =?utf-8?B?d1lmcldwVEhMVFdmcmc3WU02bm9tNzF0c2t0dGFUMnhvYitIdXZTOVY0NFB5?=
 =?utf-8?B?c3hsSDh1cUwxRnp3NTgxSnhYaW5jSmZWMzdHcm9sY0hxdlRwWW4rS0Z1R2Z2?=
 =?utf-8?B?S2hwSVQzU1kzVXpFRCtlVEVPbTM0bmZZZHgvYmxvSnFzWTZCUHp6WG9GNUwr?=
 =?utf-8?B?SEd4YUpQRmpNNGRQaFhqU3BuVWZIMEd5R3FoZEVwaUUxOHBtM3UrL3NrODUy?=
 =?utf-8?B?ZnlZM1VtU1I4SUhETkpPMnZyVEV5R1p3UHA1N1NVQTF0RHI5MFltUFFIVzdH?=
 =?utf-8?B?K3ViclllZDFvNS8yNE5LSVVybVljSEdpTjdWQnkydG5wZnBZQXBrQVpWeFJY?=
 =?utf-8?B?Ynd1azZ0VkxnRkpyandFMzREQjlLZXBySkpBbER6RERxQWs5VEhhQVVGc1l0?=
 =?utf-8?B?UUt0MExDc2gxMEpRTytrNWZDYUp6L0tpNGdzdFhMUmdzSEtmQnkvRzIybzdR?=
 =?utf-8?B?SGpQZUovQ21tSVExTnVkQ1VVdk1kZFd5QjRDQkRjTkZ5ZHhCNUx6TUUyZjVK?=
 =?utf-8?B?Nm5JTkJkQmVlUUtTY1pIWDlNR1NWUGtyVzV3MU96N0FyR013cmpmSVZydzVj?=
 =?utf-8?B?KzVZdVcxdzFjN1cvTnV0c3dxdTVYaEhqNENPdzdvakhjZHFvcW1UL0xFZGFk?=
 =?utf-8?B?M1NYYzRFMTNyRnN6cWYrNyt4MmRCMm5hQzd1MVNLRkZYdWZXaE5yQk81RjZ3?=
 =?utf-8?B?YzVlY1NRNXdMZFgvajNGUHUrT2M0VjUycVVucXEwdVJmUHJkblQ0aTZ6b0hB?=
 =?utf-8?B?Ni9FZGswM0JEQ3AvMDJFUFlOZkIrR0tPQnBDcC9PV1Z3a0x6QW95NHg0VnRi?=
 =?utf-8?B?M2hFbS9IQllqd3FrSis0UWVraDE3Wm1ITjZNK3M2ME9SaExxMUdudFQwT3ZM?=
 =?utf-8?B?M1E0b1BCRis2S2NvWHVaN2ZOL0tuQWRRY2pOTTh6TFRZQ2x6QXR6dHQzK3Ju?=
 =?utf-8?B?QjVNd1REQ05zOFJKdW1taWpuREdlYU94TGpZZEZKeTZhdGtaWVJVQ28xUjE5?=
 =?utf-8?B?S2JEcjRWaHpkVVBnYXM5Qy9pR3hRbXk0TDdHSzE0L1QyYytrRHdXRWlULzB0?=
 =?utf-8?B?V1BLMjcxeEd0RURtQjBOMjhZL3RLY01Ea3lnNVNHSG1kcSt4NlR4dkpaOGVQ?=
 =?utf-8?B?OGlHckx3WGhBYjVkVUNPUFlPWVpVZ1NnWVZlNlFZU2JYWGdLZ0lQTVJiWlFh?=
 =?utf-8?B?SklNa2JqTnVHZGMzZ2JCWFliekdBczZQeTlLZHIxVk9rbWFjN3YvMllBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUhvUGFjenkyYlRKSS8yekM3cHp2RjlVTEs3bjJxcnlQQy8vclZRNGptWGNG?=
 =?utf-8?B?eVNnZWpJa3UrcUFHRFQrSjFhL2crSXpVM1VNd21SUEZRK292UUJ1dktXcFFP?=
 =?utf-8?B?clExUTluRGFnNG1GalN3T2hxSFhPT3d6QU9CbjhndW52bVFCdmQ0bktnT1M5?=
 =?utf-8?B?VnZPYzgyOEYxSXhyaTJsKzJKUEJINE1kWFN1QzVjQWdlQkdxbDhINjZTQktt?=
 =?utf-8?B?d1VrTlpsZ2xjT1lXc0pUemNZSjVQV3JJNDNYVnUwd29TY1FHdm1zaU9oWk1S?=
 =?utf-8?B?MGpXeXZHT0NtcURlRUptaHF5TnRHVlQrOTBFNVNQZzRvaFBXcVFQa0xvU0JM?=
 =?utf-8?B?R3JJQ3ZtMXY5NEtFOXYxUFlrdGplRUZjeDdFKzdNTmhxNWpvWldhTURTVS9p?=
 =?utf-8?B?UzFhSmNCdGNzSHlNbWtrTCtGTW9LWlpIUzNEc1NQTnVUVDAvREw2VGo0NzRX?=
 =?utf-8?B?b1pMb1J3ZC9haThhcjlOajBUdDFZeDJUcFpEeEtwK0E4VTU3djY3OHZRdG5C?=
 =?utf-8?B?RG1mQndaczNRTU5WWGVOQlZESWFRZ3MxNWhZckpncmNIMnhpWTZtZGE5TmU5?=
 =?utf-8?B?SU9KWmxNc2JOY1BHNVRzQTNWcnByZUtIL0xUSkdrS0pHS0FIVW92NDF5RVBi?=
 =?utf-8?B?b3JMWFlpdUpEQWlUalJCMVQ3VnlJT1V0Sk5VRU9OMzF2dVJiaEIvVkZTc3Bk?=
 =?utf-8?B?RnM2b0hkQTRuOXJHSEovdlg0dmk1NEpkZXZTazQ2TDBhMkwrZkZxNmdHYlNi?=
 =?utf-8?B?VHBoeG1ydFJQYXFYU1ZHVGpuUVVnRlRnUXhvSWppV0p4SHJZOEZtam5TT0tE?=
 =?utf-8?B?M3FuOWVJMExRdHRSN1VEZkE3dG5WSHYxNUJXNmozLzJ4ZzhLWG1Sc1l4WnVU?=
 =?utf-8?B?Smk4aks1QmZHVG9xUnlVMm5rZlc0TjRkcUdzU2U4UithTnZPWVFKdUp6aWI1?=
 =?utf-8?B?QmtYcVFkSkdxelZUVHFCL3JoL0YxUGt5K3kzbVJYVkFnWkRZdWVuaVhnZGU2?=
 =?utf-8?B?OHRNMi9zS1dSdHhPd3R0UElyTjRtWFpwUndNNlE1R1NQTDY3SmVyd1BDMVVl?=
 =?utf-8?B?czdQN0dsUmFReEhaYk5KMTBEdUU2dzJ6WFIvYzZCbDY3ZThad0FUZ3VJckZN?=
 =?utf-8?B?ejhxY0hiV3hDOGNKZWZEUjdXNWdEaVJtTTc4TzUzdDE1KzdUTDV2SWFjWkFP?=
 =?utf-8?B?dlB4R3JsbHI5L0greWZaTTJJNVBKQis2V1NDR1FmNWROTFhnNkNNMmluTmxI?=
 =?utf-8?B?bWw1NTN6a1FjL3I2Z0hJQlRNZ3J4clZZYVBaVUFJOHhnTXZQaUFtMjViYk55?=
 =?utf-8?B?akZFT3o2cXQxcWFvUUw5Vmh2Y0pIQ2diOTBuaFJXRys5NEg5dkMzTHBvTjVt?=
 =?utf-8?B?MkY2djYvbEc5UjRRVkpISG5hRG9FRTRQODd2cllMMFh0VHdCQnRBRStsTytm?=
 =?utf-8?B?MTBnc0x6T1Jvc0plcXBVTnRUTHBURGJiS09rd1hTNTdLNXBKK2dLMmY1b2xT?=
 =?utf-8?B?SXVZMzFzK0N4anVqRmhzVGkxb1lzeHJnOG0xZ3AyUVhuMlhUQ1JEUkI1eWw5?=
 =?utf-8?B?REtDa1d3bEsrUXRVWGFwcGxwZER5WlpGVHVHdnc2Z3g2eTU0am0zelBrT3c0?=
 =?utf-8?B?VTBZZWUzWVVTSGpWNGZuZ2I0Q1VnMWlaSkVWTWlwOWFNejE2Zlcya09Pb0N4?=
 =?utf-8?B?TEpMemtIUVd1d2NCYmJhVzhQRjBKb3BNbEh6bTY5dFJxbld6bzNOT0tVc1kx?=
 =?utf-8?B?SjloQ3hqU3ZuM3pFVVJjZHRkUjZpVmQyYjFhOWRibnVPaC9Jazd3bk4xdVd2?=
 =?utf-8?B?NC9jbU1VcHFoS0l0VHVPSUtFRk1UVHdsQlA1ZHUyWU54NFRmUWV5Wjc4dHpa?=
 =?utf-8?B?Z1pCWTFXMTlTdmVNb2JIb2NrNjlVRWdrcTRSVE9aR2c2RVl4NkNObTlxN0RZ?=
 =?utf-8?B?cGZFWVlIK0IwQUVFTXNQb2JhaUlKeVUwallDdFFNN0FvL3ovc0FqLy9ZZnpq?=
 =?utf-8?B?aXgrMmI0SlVYZmRlbk5ZT052enA1TEsxQ1M0YnFrMk5pRDZSVDI5RVRSTG0v?=
 =?utf-8?B?SnMvbUZmR0NFOUJvcS9TYlY1U1FJWDZ2aWhUbFRHTUlOYU8yMHp3eEcxRkdh?=
 =?utf-8?B?eVNMNjBEY2c5S2RzcjBXc1Y1OTA1T1JXd2l3NC91aUk1dUV2OE9jbC8xdFdw?=
 =?utf-8?Q?xrvcO6dqwr5rioa1zYWN2mImRDCDsOLqzVblzOYJMH7P?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2161de-9ad8-4142-a7ec-08dce31052f2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 18:30:43.2704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hsHlnzG19CJZHoSGrYXbvPlPozXB9xCNtOphjcQCgQ4A/b8kZr2N466Xr+zqRDQqDv6S7jdPolgQYgthTfRPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8322

Hi Greg,

On 16/09/2024 18:49, Greg Kroah-Hartman wrote:
> On Mon, Sep 16, 2024 at 03:50:34PM +0100, Jon Hunter wrote:
>>
>> On 11/09/2024 15:32, Greg Kroah-Hartman wrote:
>>> On Tue, Sep 10, 2024 at 02:00:19PM +0100, Jon Hunter wrote:
>>>> The following error messages are observed on boot with the Tegra234
>>>> Jetson AGX Orin board ...
>>>>
>>>>    tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>>>>      with 1-0008
>>>>    tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>>>>      with 1-0008
>>>>    tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>>>>      with 1-0008
>>>>
>>>> In the above case, device_link_add() intentionally returns NULL because
>>>> these are SYNC_STATE_ONLY links and the device is already probed.
>>>> Therefore, the above messages are not actually errors. Fix this by
>>>> replicating the test from device_link_add() in the function
>>>> fw_devlink_create_devlink() and don't call device_link_add() if there
>>>> are no links to create.
>>>>
>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>
>>> What commit id does this fix?
>>
>>
>> Hard to say exactly. The above error message was first added with commit
>> 3fb16866b51d ("driver core: fw_devlink: Make cycle detection more robust")
>> but at this time we did not have the support in place for Tegra234 USB. I am
>> guessing we first started seeing this when I enabled support for the type-c
>> controller in commit 16744314ee57 ("arm64: tegra: Populate USB Type-C
>> Controller for Jetson AGX Orin"). I can confirm if that is helpful?
>>
> 
> That helps, I'll look at this after -rc1 is out, thanks!


Let me know if there is anything else I can answer on this one.

Thanks
Jon

-- 
nvpublic
