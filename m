Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D652E62A
	for <linux-tegra@vger.kernel.org>; Mon, 19 Feb 2024 12:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345798; cv=fail; b=DvfW0vnPI3LyqGNSYkcFbWuGvdOcYjXJ9M9B4Si9rCt7auPV64+DTPXcNBpiC9jkwZpM9OrLHIJHJN7cUKFS3h74YYmUSxV1aF01poAbF1c9WWmxvc5UtfsgRyuqDR6fRlQOgdkyCoIBImG0LQQLTp+WmoA0ZDX5Z2h6qas1Hso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345798; c=relaxed/simple;
	bh=vLmj5tN2aVGqPOa41tvxVDuXNpOBpXuNgXlD9IoNSCI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E1Z3/WntfSsQqYi57hXr3jksJj5aFs3dfflx0xJYS0QfjIf4x42p60jJ/RBAyAdAB5YEEIs6fdp0yYOlcYahY0+taRypILYuDQbtEvGsdWYM3ewdO0/VzeLmoRv4DIfdQeRsCa1y0Ys56Ul9oRCC5FdXVUfawtcmIhXHF6sbpRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g0fjLpGo; arc=fail smtp.client-ip=40.107.93.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g0fjLpGo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcEpUmQbuMJgK9ZX88EMy/YThcZUv30ZyrG1bRnwrp+8NNCtYPeO7BEfQ8B5WKsVQcreRDmPfoEGac37URL56Pp/9EVDqm0/Uy9YUAEtPcCK9XrZsAbQipHHK7LuFPfDZsrPU8bXSRDYA647S0Szu5UGC6eWRJqkR7qowpwNR7CugcOM2MpLT8ih78va8fNHhlqNAfUjTFfufo5YaN/RJ3jNVzrvVfbMNxdTaZ+9U3sMu9fqLQMMcL2YhaatgsRQ54nCjqSzSaTCW5OOluITeQx1t2yRpuXTlnZmLiYCxwWrW3uZT8CGlvc5R8+Ypj7phpR5qfT7PnWjuRq34YDsaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhviSmI3G0RBVvUpJs15gUwCs183IPWbXIaS5nv5Tc4=;
 b=WV6OUdEeJ2jWnNX2akLA9i/0qzGZ+NGwpn73StNQtksUyzEnPMhw5BUBnu0sQgsoxSdEIgWEYM47GIYRMzrwVWp0ZAA3uFY7moCvVFVp39jVCNDHYoW4Dwp4xfWwtFAbjWtLegPRqu2nKLUxNQivjffNGtK5DDsxu0LNFOt5Ac78qTLvzVJ6Y+/w7awhMxtAj73JSYD9r4sIMU5ELvac2KM93TwZfDPWKBqYK1VVcJVT/3Mpj1XsUakZ0NAo/TACzUCwaw+WgxA3+K/t0cCCQ/TZ6xeQDXAmLmbQaVOBJlsoDyjD/Ab7gyMeiFw+t1dV+eEdRRJLRCqgTB17EIZDRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhviSmI3G0RBVvUpJs15gUwCs183IPWbXIaS5nv5Tc4=;
 b=g0fjLpGoYIIn2Z1xj42VroARFcb9lmFYGrcQF9CGVQ9QwxU/0tcMN4UHzJ9JvEJAVJ/RadKD6L/5BI607Q36kSazwrEhsr9KdTY4gqiocLvliULu+pNa9ZPdBFiNMKc9dD2hSLAxrbOhH5y0EHEDx+fuuz7fz+/MYknbZ3OQRi5xjKFyW1W7kiwfXfu1HX8oXfpM4K5BGNsNDTillECv+NbiJjz16R9opU9904u5cuSsgc316KM8IE9M3DJMz2LuMDD07XVLBziL7FHnnCR0kDaDWJd6G5OiTviAsu4qebiZkECfgaO/H0AjKK5P6jMk8fwYm8Wnkx7NrMD79wfUrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA1PR12MB9003.namprd12.prod.outlook.com (2603:10b6:806:389::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Mon, 19 Feb
 2024 12:29:54 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::a98d:ee51:7f8:7df1]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::a98d:ee51:7f8:7df1%4]) with mapi id 15.20.7316.016; Mon, 19 Feb 2024
 12:29:54 +0000
Message-ID: <090e71fa-a20c-419a-ad08-a2c692c2d76a@nvidia.com>
Date: Mon, 19 Feb 2024 12:29:49 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] memory: tegra: Correct DLA client names
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
References: <20240216123057.33018-1-jonathanh@nvidia.com>
 <20240216123057.33018-2-jonathanh@nvidia.com>
 <fa429d30-088b-4fba-9b84-cfc6b44f65bd@linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <fa429d30-088b-4fba-9b84-cfc6b44f65bd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0408.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::17) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SA1PR12MB9003:EE_
X-MS-Office365-Filtering-Correlation-Id: b46c4c11-4f80-49f2-b965-08dc314679e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0Jt/xBd+tjOjg4WZnIotfsEPYHdW+i/3kzu+EqMGtOKY+tZ+UguF8NPupJ362roMIK+hwwRNDCiDLICTCmcjQ5oHDgzEgM8yecTrV+M0Ar/qYsG4RqVoi1UVhRmVpR3E3grZKyCq+8PcGYPA8AI6U9sJx8SAPFnjcrVtDRZJMKzqKU1QBezQyVuWZvUrZvLmeyA7BoX/j+Mq4rWNCM/gGAwliZsWb/uEwo1LBZ96l/QAeDjX4eMez3U5Ol7nDTo7+rwTxHZItFBNCWDJMJ+99CFjDxdZr7KmxPAfHb3Go/7qwJSZ7YWnfqRhSiRZm++A7EMoCcMKMjcEvUm6LVq4RGbmThUfiAg9VhIBwn4Ukln6hbbf8H5DwqR5F05+Rvc80rme7dAo3DjKp8kR+IDM4pyqTTbXM4Uo697G01tlLbSCHP+YFtNS7n86S3M+gp+mLTXlCzJrO6Urs/YbkAsKWYJXPbP1F+4DDT1DZqImoAJAeiCYNOaKpxyYhFkow36L1/dbpYJSX0Q6UB0xFehXCmPrUogrPFrMN/lUA5S/+cA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDh3clp4aVc0dWV6Um5hRHhuNGJMaldtRi81R2UvWEdFYjBZM2U1Ymg3b3BP?=
 =?utf-8?B?UnFXYUR3aVpPMEh6ZWtockxaMUo1dk1vd0h0Z1VGT01XWjMyV3ZEZjVoTDEr?=
 =?utf-8?B?YjYxbjlBNmcyK1RuYkhGMEtsY0NycVF1bG1obWZxS0diT2htWW9qSXJrNnNp?=
 =?utf-8?B?dm0xZGtsa1ArK1RZdjZjeHJqK2I2ZDVsZDVuVVU2THk0dWFDMGM1WmFWNTM1?=
 =?utf-8?B?b0dxcVg2MmIvbkdHM29NbFFKR1RrNis3TGhSSTd2RExEbElsV0NnNXBsMFBN?=
 =?utf-8?B?ZUJRY0NPc21hdnlLNmpyNWFKUWViNzRCcHQ3YWZpUXpocHB5OHI3aEhBemRw?=
 =?utf-8?B?cDJ3U3lGVDBOMXdHY2R6Mk03amNrZnNtN1I2MUFwU1Qzc0s0eW8zZFVsRVVt?=
 =?utf-8?B?S3lpcGhyQ2V0OThneGV6ZHkzUlJWenB4ZFI5dVFjU2kyTm9URGpkdVBUOEE3?=
 =?utf-8?B?b1JQSjN2enJMd1RVUFplZ2dRcnBIaWZlaTdlS3R4QTVvWDlWRE83RTYyY25L?=
 =?utf-8?B?UEpiRDN3NVNzRnpzN2txYUlJODlFNUhGMDNZajZNZVlXMHRsQzdidUZmekJB?=
 =?utf-8?B?TkxZdWs3a1lmaWNpdEFpNHV5WStTSlhlVUlXcTlmUVdOaUtHYmF4VUkyUmVs?=
 =?utf-8?B?NGZUWXFFdlErY3R2UW51YVRXUjk4WUVEcloxNzhwQzRkeUh4UUNDTzBpM2RQ?=
 =?utf-8?B?dDdPOUFPcW84OHh6azRPU3ZreXpxZEhCY3hZT01ubEpSMHBNZlFrYUxvWTdm?=
 =?utf-8?B?TjBCc3p3QXdvM1BDTVFqU3pKSUc0RlRXVlpFZG44ZkgvYjlteEh4Wmt1VGJj?=
 =?utf-8?B?b3k1TWdzeWtLYS94dHRjQjVVeXNVZXArNDArOUp0STNGdmlLTWttTG5aNE9B?=
 =?utf-8?B?cEQrQ3FqMUFFNFRGZWVXYjdNNEtsOE9LYVQvb2wvOWlma2EweGRDWnJhOWYz?=
 =?utf-8?B?K1FQdkFLUHlUU0l6K3krVHo3cGNaV1J2VmRaK3o4S0dWaGsydVZTeFRaUFgw?=
 =?utf-8?B?MG9OR1BHcXhWNllocTNrUW5NVzlxZk1lSTU4czFaSXFuNFpwOUgrUCtQN0Ew?=
 =?utf-8?B?WldxeFo4dmdSZ1JZck1ObGVYME1SMTFGeDdQcVY3c3l0VytkeSsvM2pqZmtK?=
 =?utf-8?B?Q2Qzdm9TbjgrZDFEZlJXeGhMa3EyL0kyNjNIUjFza3JxcXBEUnEyc210c2hn?=
 =?utf-8?B?UGRTZ3FQM1dUVlVTYTRub0tYMm9wampNbWJSVnNtelU3eUpTZW90dS94aTNu?=
 =?utf-8?B?VnEyVURocmEzcWVLT2xNaDYzakVhYk9tSEF4NnB1TkFUc0xHYU51angzdUNJ?=
 =?utf-8?B?OG1mekVVNXZSdUNYRkZLVHdVb0FlSDlmSnNobVJCa2lBanRJRit0eUwwZERm?=
 =?utf-8?B?YlRuczJEd3BSZXFRMmhudWUzbnNxaUdlTzA5VnVIRm1WSVRsWlVzeCtuWmhI?=
 =?utf-8?B?L0tNTjJFTEh2a3pNQkg0QjRoWFZPcUlibkIxNnI2TWhlVGlLSnIzOG9TREM3?=
 =?utf-8?B?NnNVRXhRTnI4cGQ4cjNPNkF3ZG53QW96dTBKN3c1RjN4dkw5V2lJUnIwc3hk?=
 =?utf-8?B?V05MajJ0TzMra1lBUkhsazlCb01MNWtESXJUQXZVWGdvWFpzaFlPV3BPU1JH?=
 =?utf-8?B?UG5vbUoxQ2VmRTJvYXU4b2RCVzIxL1lpYllHdkM3dkZMV0F3dFFhSlVEYTRV?=
 =?utf-8?B?V3o0TmN4dUdEaE40T0g0ZkE3cU8zUTNqQ2svQnlyY1ZqY0dPMFVsM2ZsRFZM?=
 =?utf-8?B?djZ5THdIU1FTU1VRY3ViRmxabFEybkMrUHB0aW1LMzJpNjNPRURUNmp3TVUr?=
 =?utf-8?B?cWN5OUF1QVAwL2RnOFVuaXBNdHA5Z0NNUllTYTludGwvbkhJZFU2MlNGOVJv?=
 =?utf-8?B?b2dObTZ1Mk83Mmt4Z2c1cEVEdTZqaUpvMWFtWFAvcXhKTnZBak5PQlJtWTly?=
 =?utf-8?B?d25SSlNGV1pvV0pUVlBlZngvOFl3czg5MFBKY2VlWWtaYk8zeWxpd1l0Zi9r?=
 =?utf-8?B?UERCRExNWHFGUkFNb20rcG90VzZ0VnhEdzZ0NTFYL3FVTVFyT05kbkU0aW12?=
 =?utf-8?B?ZlBaUkJaQndmYjloTnVHS29VemEzci84ZWVmWUl3SVVKa24yL2hBNUZvYkpS?=
 =?utf-8?B?UDJndmFZa080aWlPdVk5SEVYOGVSR01QUnp3ZTZ3L2lUVElZdThzLzNLU2dR?=
 =?utf-8?B?UDdsTDZZblQwTWZQbjQrN0k3eFJqTmZXUjN5SmRLUTlYZEgvS3prMjdkMXJa?=
 =?utf-8?B?ZjZmS3ZyMklpOVg1WUxPZTlUeEJRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b46c4c11-4f80-49f2-b965-08dc314679e3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 12:29:54.5312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWBfeRqGZLOuhjLKqk0DFC22zvqawZSWurEGv6hwepzIJpNScnhYYZ4V4rCmsGvI5tTVsoMibUHXH4ayAR4B9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9003


On 17/02/2024 10:06, Krzysztof Kozlowski wrote:
> On 16/02/2024 13:30, Jon Hunter wrote:
>> Correct the DLA memory client names for Tegra234 to align with the
>> memory client IDs.
> 
> That's a fix, so what's a effect of the bug?

Right now, it fixes some print messages in the driver, but we really 
need to correct this before adding interconnect support for the DLA 
clients in patch 3/3 where the name is also used.

> Also, all fixes cannot be after cleanups. Put it first in the patchset.

Yes indeed. I will re-order and update the commit message for this change.

Thanks
Jon

-- 
nvpublic
