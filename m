Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FCD286A1;
	Fri, 13 Dec 2024 02:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734057127; cv=fail; b=EP7jF23BD583Hk1zIYpfcA+DGafNsEYs7kdESeH0JTn2Lnl/i5iuFxTocnSXdx6BcoiJh0QdZBuF9ckbibdqUZHOXsmWpcSswz2fheeuml2XR5o/LJ6uWohT9O/oGCW0p8jGbNEuU49xH8wjjqYJTeh3t4j7i3VoYuIpy/9BUCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734057127; c=relaxed/simple;
	bh=ORzK7T5bKrGvzpiUy0c6dBtYU8T6Wgjmr643PGhit9Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AAsSSynL1PbUJnnunwLlS4JxWjLDR4OgDcptHFq5qO28ps3km5bKIg0yzBRUJGYtGl3ZMNrQ8FbKLLylF3rdOi1bmoGuDsh1RTW/JQublqVWUQbqDyiN+DIvACWgSmfNu40UOMwtBiQGT23hmVhZAAC7Sk2+eLJzfL4HNBmE9Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l6EoKJwR; arc=fail smtp.client-ip=40.107.100.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l6EoKJwR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pG0ONy7a29E8de8pmLKv/2s96nfkD9dktpEBxLpj6vZkp6ZUhq68pcqUlou8xqTfeiS6DZ2oGwaa++0by2k9LnkwvMjh6ueJTRnX54+6i2nC8RtT1WTlPyuNEEGdgkMuhM4Asm48flO4xC3Ws8SyzehlzN5a0OlHulN16Mr5yCE0YOd339/3Psfrq5PY+ySkIJbnyrsX/Ji4bZKCV33IVgDwP6NYRMA4g3n3aDLrtViAjBVZr9Nt+YUjD0daJCW5mQbVEJMsl6XRok1RNWLa+hXElAWQvgm122xFXI15dAtfrERTQjqf9+yYKlCD1LfZFssMXEQjwb7qQmyGUgm1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvJRpY4rUMEspiFfPRur3k9nqW9CS2qN2FjJzY2mgC4=;
 b=LAb9eSpzPoEeqRsdNgoZYsinHdnvVi4ZFWBJrQB/ByFWDhqlkUH0uaGkFvPJTIgZZJmvGRhBJTBRVxrT1MghSvshIphI43OjR+2dihx/w4byyq2M3n31K6MzSwRod0gEFN+XFR77wbxb4HxWFBKo372UsOH+CazGrGdDyrqcsg+9MPok6yHs9MAawnAJ7Gyks+0gPMRA73tnANnB5A4M4iZg6Px7s46DWljHxva9HWps6FyLW6ck0GF2iXRJPF7yIgvQVk0l5wCa1WjbXUefweWXgu1qyW6Yvgpd4N4D9d8FoQDpLoQFmcnAyzGB/onoEPj/fXsMw8qVf3la09HlkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvJRpY4rUMEspiFfPRur3k9nqW9CS2qN2FjJzY2mgC4=;
 b=l6EoKJwRjVAlnQe0Th2+fvvf9EUAmxqvrabL7PgmNa20yD7If5XKI8jkw+9hOelUQuuxsZXIItdKgiEcQKveGrBxHQE6TmSHfTg4GJTfJQ2T4TmQMp+/nSIcKs0sez85kmmI/AO/OORG0No5wB237y1C3i5XTGXwvhZgaw6q+14Wq0v3GlrvS3Y3uLHICchjdW6rGhVCK161Ua+B2Hi52xyxdJHvoYTr3xmZAiVvQ2yuKYA0EQW7MplpNkMqEP8kOXPzF6eCOWWK7A9ZypJEtcTz8YD8BZu7mLm3gu9R5voxeQLJhV7QN/g57Ymjs0X66qcrr0PEfQeLaLMalCjlqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB6237.namprd12.prod.outlook.com (2603:10b6:8:97::18) by
 CH2PR12MB4070.namprd12.prod.outlook.com (2603:10b6:610:ae::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.17; Fri, 13 Dec 2024 02:32:02 +0000
Received: from DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6]) by DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6%6]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 02:32:02 +0000
Message-ID: <f023b16a-20b7-4fe9-bc30-bdcac71f9003@nvidia.com>
Date: Thu, 12 Dec 2024 18:32:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: tegra: fix typo in Tegra234 dce-fabric
 compatible
To: Ivy Huang <yijuh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Sumit Gupta <sumitg@nvidia.com>
References: <20241213000305.3533971-1-yijuh@nvidia.com>
 <20241213000305.3533971-2-yijuh@nvidia.com>
Content-Language: en-US
From: Brad Griffis <bgriffis@nvidia.com>
In-Reply-To: <20241213000305.3533971-2-yijuh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:610:76::17) To DS7PR12MB6237.namprd12.prod.outlook.com
 (2603:10b6:8:97::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6237:EE_|CH2PR12MB4070:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f2a1b7-76c4-4d5a-c522-08dd1b1e5391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmVkTHZzR1hIUE9YRWtjL2dlUDFOOUVobG9pLzh5NjlHMVJhNU1nOWNqMllO?=
 =?utf-8?B?bnppSENLS2V5QXFVYTJzM1RXQ1o2ZlY2am4ycWhFSnV6ekw0TEdIa2R2ZGVU?=
 =?utf-8?B?R1pWbFdlc0NLYTlLTndLUFh1SWxEalI5VHFJQnd3WGhSbFBZUzMveStXNzdw?=
 =?utf-8?B?bkVnQW8vSmxTRW9SZHpwdmVpNUdsWWROT2RpVDJMUXNCanR3WWJFZHlneGpq?=
 =?utf-8?B?RmxHa0V2V1lqZUdzY0tlTHpRTS9FZnNWQ2FEUVkvbEN5REtmTStBOTRZQ2hN?=
 =?utf-8?B?SHRrMitqd3paOWJVOUNKODk1eWcrcjRtUjlPY3Q0OG1OdlJId2dZNGU3UVZz?=
 =?utf-8?B?UjZaRlZlTllZdDhyUWl3MjArUjZHS1RneS91djFwTlM5RzNqejFCQitvV3Na?=
 =?utf-8?B?NFBONzV1cldzdHpzWjJ4aGhOVWsxZUtmOU1YazZVMkczT0Fqdkx5RThFZVBL?=
 =?utf-8?B?UkRQUHVHT2tPRUgyL09vWmhkaXU0dTdYaU5EVWFiSk9BZW44STZGOUw4bytT?=
 =?utf-8?B?MHhtVU41MC9hMndRVnRUL1NESmdkYjlEUnp1VjJmRGUzMERmbloxMkRWVUQ5?=
 =?utf-8?B?UWNqZjNiK042SjdaSDdyNS9VMkpOeWpNa00rZzRqdlBBOWFDZ09pMmpwMXgz?=
 =?utf-8?B?MHluMDNIdUtlQXI3OGMyWkhPMVIvMUJxSWgvNlEzZnlnVitiWHZpYzhBMVM2?=
 =?utf-8?B?cTVTYlIxZTBoYXFPc2hkVmRnOVRzbHdDOVdRT3hBYStJNHFQVWwydEdnMkJm?=
 =?utf-8?B?NGdmOCtsbWJrbUFBSDMzdkE3YWFnSk9qTUpYYm51VXpxWGQzMDQ2NnZYWnRu?=
 =?utf-8?B?blc2a1QrdGgyaE53S0dmK3hhUERXTnY3QndCYis2OU5oc2E4SHdlSUN1Z1F6?=
 =?utf-8?B?ZEpyL2ZqR0Rka05Za1pZRGV4UlZtaVFYdzQ0bk0vK3I2SG9lcEhYaG9rWDFi?=
 =?utf-8?B?VXA5bW1IclVxbTZXbW13ZUdITFA5Qzc3OGRxTEJvZ0VpNTZ0ZzU5a2NhcHI3?=
 =?utf-8?B?azVVR0VtNnNyM2FUVURmcEYwQXE1QVNHTnVQVy8zOWIwN1cxZ3VPejJqWHpF?=
 =?utf-8?B?a3FKbWJtNTF0VjhCbGJXbDNHVEpxaW9NQnJuYlg3MnBTaUJZVFg2UUpUdXBx?=
 =?utf-8?B?cUhTaTVGekNjS0VHN0daSjdOSzFyQmxScjJ0ejM5SXhPTWRGb0VmM0FxbnNB?=
 =?utf-8?B?NXd3NVJSTXF2Tzh5RVB4M2d4YzBVeHIrMi8ybjllWHBrV1ZNV3Q1TzNVdEVw?=
 =?utf-8?B?ZGppdExIZ1ppOVRxb3FIQ2R1OHZYSmtFMHNWT2VQUVB3VExWQTZpQm51WnhW?=
 =?utf-8?B?Q3VXb0UvNEVwdW04UWxYRXdtMXdVV1I5SDFlVUEwQ3creVl1dzJFTVZFa3d0?=
 =?utf-8?B?cmNjaW5VZVJpcXM5a2dPV3laaTU3V2d2S0hybHdTdHBVQ3FzdXk2TEEvdnU4?=
 =?utf-8?B?aWJ1cktUYlJBT3c2L0FvL2JuM3c1dm5aSnp1MzFNajFGcVB0eC8yWklaR0U4?=
 =?utf-8?B?U2ZvKzZQUzF3Q3cwcnVEdHNzazhEQXZ1MzZ5bGJKM1pxL2V2ZFpCUXhVd3dV?=
 =?utf-8?B?SnRSRjQvc3J0QzBKT0ZiVUhwRGdqbzZ3dHNKVTdnL1BESXA5bjViS3VHS1NO?=
 =?utf-8?B?T3hJWVcwUlBaVjl4OHlDZytONVN5c3krVExMRHhPa0JjK1VHNGhmeFY3Qmdj?=
 =?utf-8?B?N08zR1QvblE5OS8wZ3l1SXFnclphbUh3MEFYNnNEVXV5UGhPUlN4UVhuTmRF?=
 =?utf-8?B?Nm9lUXZXTVBBaTRDTjJRdTd2c05hYmJFU3M2Ulk3Rmxsc3R0Mm5jS3pSS3BC?=
 =?utf-8?B?bWJDOWlKRmhUdFYxNitFQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6237.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkI5VW9CNGZQMC9PWWswTW5UVUttanNlYnpuenZpYzE1VUtHVzcxSmI5ZTlw?=
 =?utf-8?B?b1FNenBzNXk2bFpVcVdSdGgyUU5EaGJ4RDhHeVRRdytEa2pFT1pTL3VTQUt4?=
 =?utf-8?B?bDVua1RXN1JZS294QjZTTXpXK1FSQnEyNUdaempxN044RVVPdzhENmZab3pZ?=
 =?utf-8?B?UGF3N2xmbkFEZ1RIa3UwN0RVelJta3FCZzltWUtxTjQ5bFpaRCtXYXF1VW1P?=
 =?utf-8?B?WnJiRk00NTlidVhvTGxmU2Fsc0VkVDRRWG10dEdxTHRsNEdVbkdwaFl2RGNX?=
 =?utf-8?B?MWpvcncwcXA4VTRvQ1Bpc01Xak5xSDJkYkFRR2Y1eVFoWXR0dTlUK2xUY3Bo?=
 =?utf-8?B?TXhZam1YR21qSmdxMlJTdElJZU1ZdGpOSUlYZmVrTzA1NUxUY0J4SStOdW1Z?=
 =?utf-8?B?eHRSY1p6U2wxZEhOT0NJcjVPbE42c3R4MXhpeVRIcVVUMDU4ZmgwdFZtUk5D?=
 =?utf-8?B?WTlsNmVxdytHTHhNN0hLU1JlZ1VGQnRVRXU5aXg3YmZnWXNxWG5qenh6S2FF?=
 =?utf-8?B?ellUTkFhODJEcXYwZDFPTFh6anNBVW9xN2NlNjdTMjNYdGlFeElDcWZpUlBF?=
 =?utf-8?B?cjlla1ZCdUhSZGxXL0lUMWU5Qld2TitTUStSOUtNNjNqbzRITjhhUzlHdm42?=
 =?utf-8?B?ZnZ5Y2xXMHR2UnVSeWxCZ2lwSFBmZzBjWmh1Nyt6eVoyc0VJL1dONFlhZGtv?=
 =?utf-8?B?c2l1Qm1ESUNmZ3FSV0h3a29JNGJNWVJhdExYS1ZSTmhvbWlzbmVuU1c2c1hj?=
 =?utf-8?B?bzVza2Flb2p2MThHYVFKenBRS3NkZktRZkR0ZG16bTJuc2pnTXJaOVpLVS91?=
 =?utf-8?B?UHozd21mYXhYK2pzRW9jL25DcW56anpIMUlhbThBTEhCTCtFNDhLbTJxazdx?=
 =?utf-8?B?L25QM1c5Z29vUURWaklleW0wRy9jN2E2N2NGUGlGRXRnYXI5NVdPRTVKRVlP?=
 =?utf-8?B?cWtTbUo0Q2VicGllK2xvZkgzV0VCZGs5TURhWVUxaXRMd0ZQSEhqTEdzSTl0?=
 =?utf-8?B?L29hZDd3MThWVkJaa2tLWFp4V3ZqMTlwaDd6VXNNc2xVdmtUK3BRb0hWSVQy?=
 =?utf-8?B?NkFWYlJSMEpDMHZHVU1NYU1zU0w3KzVFM0RtVExxajJNWGwvVXY1RDJoL3ll?=
 =?utf-8?B?VFYzbW1nNk1EZ052aFFXQkpYUUQ0c2JaY1NFdldsVUpYN0NpeDhCUnRveG1x?=
 =?utf-8?B?VmVOQmx4U1B4aG00TWxkTDBFUDY3VU5OdlovY2tmMkJtK1RHOFI5TnVJNHNr?=
 =?utf-8?B?ODhVV3NGSkYvZFRjcTQ4bktNZjFWVW42TWhhQUl4NlNEeW5nNStiV2ozU0pV?=
 =?utf-8?B?QnE1UTY4MGphRUcwdGJTSnIwN3VEQS82QXUvL0c1aGVzQWswZjhPbnlJR2pQ?=
 =?utf-8?B?OERiUDhRM08veW9vLzVnTkJzNnV2dzlod0p3WG9vOTFiUlFxMThTWUt6Z281?=
 =?utf-8?B?VTVXZlhFMXNDU2lleXg5KytnY1c4NGEzVzZWbEx1OGk2QWNMWTE4eWdyWFV4?=
 =?utf-8?B?a3BObnAxOXpPbzlBVjVhYXNsTk1VSDJyT3YvWGVkaUJqK2RrU0lnM0xaT0tv?=
 =?utf-8?B?WmRHUlRjekE4dFVsNkhqL1Z2Mk5xTjkxakJ4elNzUkJnZG80cnBFSXd3MnBl?=
 =?utf-8?B?SWora3EzQUxoMGt1TUhuT0RpR0xOVHBwdUJLbkN3L2pXRDRaS0xTS05wOS9j?=
 =?utf-8?B?ckNoYzNtMnQyeGxDMHdJRm9aNmp2TkpEaWZnd0xmZlV1c0F0QUduM0Z0VUlz?=
 =?utf-8?B?cTl2S2F3Y1lnblVMeWdCNkRoamYzcHdTeEZJcDhUK29FeE01WU1zd2dlMU16?=
 =?utf-8?B?cHlRYzRDQU5CN2pVQ0YwUXJMZ1AwZmtjdFRocUZQOGxnS1ZDN3ZTeVVGUHE3?=
 =?utf-8?B?bURZbWVwUFlpL040bGU4eVhaRXN6b09CcGRQeWVWSU1VcGxMSTk2dDlaNWJi?=
 =?utf-8?B?SlJTSGxUMjlMSFNCWitXbWVZMDBXUlJqYU9ncHdNT1NsSFZuSzNoM2RGeUVK?=
 =?utf-8?B?V29sNUNueXJHYjJqa2JCQkRYdVBJQkdOWXZhQmJuRS8yaXVDWGJiQ0pDNGdp?=
 =?utf-8?B?bjNHRGZKenBtUFlvWWlQeUFld3VEUlZ2YW41OVNkZEs3Z09YS1ZMQWVTTmhv?=
 =?utf-8?Q?td/J0Wtu6+fljeNIJmRvffawF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f2a1b7-76c4-4d5a-c522-08dd1b1e5391
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6237.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 02:32:02.3328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYqLQ1XRvtbP+r8JB7fmOmLF/jtCE6qxZJPv/RJOsZ/4mXQDzGMOyYm2ISW1aaVCcqXc6PD9rHze6GIOtshr+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4070

On 12/12/24 16:03, Ivy Huang wrote:
> From: Sumit Gupta <sumitg@nvidia.com>
> 
> Fix typo in the compatible string of Tegra234 dce-fabric.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> Signed-off-by: Ivy Huang <yijuh@nvidia.com>

Reviewed-by: Brad Griffis <bgriffis@nvidia.com>

