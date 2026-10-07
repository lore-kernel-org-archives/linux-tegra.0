Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649F34C4F69;
	Wed,  7 Oct 2026 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791390440; cv=fail; b=tHjMymq56EtQirMPjhFucBmV6mXqwPgkb3DmYGOKY0MPlT/CCw8/pLnFeTiwKwIjwsL7fsDlI9X5IB7YWbwDw5NKJGD38wHKhZqdSe54jKMwtN0ka9TpMpb9N0/0XHx3K5pSBgV+/BeXEmKlEJ3WT4zPB56mgf1oGGp88FMBnpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791390440; c=relaxed/simple;
	bh=xv2c/xvpsqQE1yk0KDgLjOGM1TVzIUi59RfraAlxxWk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nXHFBkoUgeZ+k1XxmxJRQzlhHW+P3Or/mVHzu1bsmllTCT07X5V1UBySm/Myo3jocx3q+FN+CgoauQbHBKDINXwjbJpJHXeHUgVkeVX9dGosGU01oV8VfGlzQdwvmQBxmexYuBZ9GmItgp2fVtxqLwnLX+yvXQad3a1BIFR9mD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ixr/35sO; arc=fail smtp.client-ip=40.107.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ixr/35sO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D59SMxnzKoq5lLq8wXCvrmxP8bYwBlU5FFDTWOhJ6ytC8+lROH09inVExdoKGYVkSrCmow4JkanbqxelDHgsUJg3vZbVR0GBT1GNWBYKMzrgA5yUzAn2hWkQEWuKaaeteRfX9iEC8+hMa8Rja15bjLrfDj8gXEN/IKwEJU8+I+8XVMmmyHatjCHbPHo7KFRUoQVWY1wEuYc8vE909CqtWClZwLYMnnb7MHlPbHLuwIfFJ8+ErYemj4plIOjf9FY0tKK16jRK1xwfLsRFp3rTNeV0uPSnmrAhze7Y/TVZFpQZiv/he45ks/PUSw4+y3XDGhL0fs1j8CbFPkYzbMH1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jd2iowYxTjb3SerXCXWQeaM6oMsfPlPMuFXy1wDX81U=;
 b=iVod7hdEQUkEglCKFxJ41baP20dNs+Wiph2TPfbz4EjbF4dnxz9Qmhs2A5UyBKYXOjfGPfr003Q5CkLkpW24k7AvfThSixm6csrjoZA/noivBlZxR1uX4P7nnltsuF3xU+IXM/+h6to91EJLcXzvqFVZ+ByDTmLHMv3sknUTYcKaCfEBDBp6R3R/Xz2N/+1tv7oYUIOIjifVgJLcA8vOe4IBD7WpCju6sF5oy9Fglr8QqPWF1EJuyIMPj80BTZ7kZXnyx7hXIbeWXXjcWmgTvpZqJuWU0OYpP6QLykAMu6Od0cUlMt3AcjMOlppfpILd+FEZndPrNPYUsiGQJi3bZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jd2iowYxTjb3SerXCXWQeaM6oMsfPlPMuFXy1wDX81U=;
 b=Ixr/35sOE3d8JcyDFfH6oB4mMkcjc+lPuOBehr8zD9+PUr+P3SNGaP4LHUV80xgXVi7kYkoaoPTdvIKc874/MEkNd9gDCwYRmWILG/kXMJQRzb9vFtgMGqGK9oXJBKT6IYe343TXhbO2txqM0lBFV0PeKU51Y7bWLZXMi+lGgM/gA0Nwnranfy5vyYSMwFRQItj7RTelKvmSF0P9MEDM3LkEYtrhQvBDYzaFBNkTsmecFug3qyGhrB7ccGe2gzNnkdvGlevnV+q5gURUTD+F61ZYCDUeXSmYeZM03D2UkviM2GcShzlsVKaMu94K/J+TbzN5A7OvA1s9Pre0LnWGPA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by MN2PR12MB4205.namprd12.prod.outlook.com (2603:10b6:208:198::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 16:27:13 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0451.014; Wed, 7 Oct 2026
 16:27:13 +0000
Message-ID: <25b96f0f-afc6-493c-9428-ab00a0bd9aff@nvidia.com>
Date: Wed, 7 Oct 2026 17:27:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] phy: tegra: Add support for Tegra238 XUSB pad
 controller
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>,
 JC Kuo <jckuo@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>,
 Wayne Chang <waynec@nvidia.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20261007-tegra-phy-v3-0-d501de414710@nvidia.com>
 <20261007-tegra-phy-v3-3-d501de414710@nvidia.com>
 <y7p44oeut66usohn3hdfsx2fndlxhup6osok6uo27c5xreyjvv@uyk37kiedv3u>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <y7p44oeut66usohn3hdfsx2fndlxhup6osok6uo27c5xreyjvv@uyk37kiedv3u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::14) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|MN2PR12MB4205:EE_
X-MS-Office365-Filtering-Correlation-Id: d035b041-b27c-42ab-d1fb-08df248fd7dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|4143699003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	G4HBIaRWDCoO/Ox3gqrcuCsI0p6lICBRM2QfzGS3mXhihU4ZjaW/H4lBBUSwN/flA+QrVG90HAoswZl5lndxpWM/dEacokZxsZiH19kn+/zfcND0LtT5uSj3TyyesfGTskgks6PX3IXz39uYNgh6rBB7PGpcd5O4V9aFEfixa9WaC0kxs3ySkYJj8tuTuiOqEe9JvLuDliElt0enKN64bi31SKrcjRn6xzvRNllDWf8Xt/xlYdOLetUwghyE2XM/+Rx8qD4iPaYcKSY/finCH0brvv8q5RTNOMnzG9xz65hE+Y375tdz0YwwjKaa6uzONR985TSoq4HOaUfGP5EV1k2dqh3nyZT2Z+t6RSc9bPjhlVlJFURbu5akwouMtNJna0wt5HXwbK0dW7XoxBJY3DJ922wW9xjvXKYmFwSIX8ZP7eciiu80ZYQjpEwn5ZUI0ksmpCscfl5+Kh9gIJRS2FXOnASipvcD1pj4HqFiFQXOZ7fYqw1czxlnSLbJ9BqUrdaFBTmmLjEuPgZ0AOkL1iDZf5qDsI3gFGfF3VMjabgqpQwDCoGmz0+JbvT3JRYTS6oPcy7rVJqmQWQaClEK9x9ngregqbGbbVW781Gl/gbKNrhAZ4iA4zVyJ8MqiE/CZXbJDQbbLnBwasqNoYu2UgCe9k+g7f/tW/YWlyBsvaY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(4143699003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWFROVpQR1dKdG9aRFRkdXZqbk9leU1IMTZzTG4yZjg1bkRrQ2hWRG9GUFVt?=
 =?utf-8?B?Q0N4eXc2TEJYU1J3NTRseDEreUZkdlkyMXcwb2xKVDJxdk9jOGlySlRibmhM?=
 =?utf-8?B?SjdQbTNjSWhMbzRLWDQ1UEZ5SXFDMWFvWVBsd0REcDQ1cVRLTWZQazUxVXBr?=
 =?utf-8?B?Tmh5eFhCbzJWWWQzT0VFc1hNZnFQQjFPSFh4SkNXZkl2OGlCRERkMGhYbTAr?=
 =?utf-8?B?WjUzZ3pINmZpY0RRbEE2ZjlwZkt4aW9peDd2a0I1OHJqbzZBZHNHb1VFS21Y?=
 =?utf-8?B?WGJvc2xJNENWM0RBdnZtRTdrYUVpSjV2VVFvdFVtUjQ5aTRLaEszUVAveDIv?=
 =?utf-8?B?YUVKQ1BCbnRnWnJzeUg2UU5iOXprL09TZ3Y2SFhDZlBCcllZdldaSXFmRUN5?=
 =?utf-8?B?NTRHaFFZalpCZTZFeVVzc0RjYVF6L0M2L2ltNldhRDgyQi9yaWtkL1hDMEd4?=
 =?utf-8?B?ZUU5K1pudG13emlBczBLcUwvc1NIZjM1UG5NbnBNclJlOXQ3dWZWK01GcTRD?=
 =?utf-8?B?dTQ0YTdQZUlRbElLMXpsNVpuT2dIb3FiNUtxNjQxR3RycDV5eFRENVNqV2lP?=
 =?utf-8?B?WDBJc3JlVHZpRkt6SmE5THBpc2haL0oycGN3K2kyQ3h4elFHaERTZTNRZzhL?=
 =?utf-8?B?WkdNamE3NzR3NnBydXBIbm1wbEpKeS90QUhvMXlhM1lJVnpzNGxsUzQxckZ1?=
 =?utf-8?B?THN4c3VSR0hLOGxsU2pLZ3dEQ1lLZGJ4dzB0VUgzaWNLa20vTVo5TlBVNkY4?=
 =?utf-8?B?dWZHUzZnRW01MTVZdW9KZEpQVWpZL0Q4UGt4RGk2ZlJESmRQY1cvNGFPR2I5?=
 =?utf-8?B?SkNkWStsUUtDOHdMa0pOU2UzSko0ckQ2aDhyc04waGd3d1dlYW9SdW9hWnVG?=
 =?utf-8?B?SXkyNUgySFcyQTdNdGxlUExramk3UkVKcWZSd2hLeVJqaXo0TEtRMk00cGNi?=
 =?utf-8?B?OW1wbExkNlN5ZHdza1V3WUliZUZ3cDZzK0prY2x4bVBPdVRkUXFwMGFxM25Q?=
 =?utf-8?B?b2RKY1pDVzdmUUJvT1dVWG80UVVwVXpWcXNqcGtwRktxZVhkV0VMZnUvbzVh?=
 =?utf-8?B?MkpZM1M0TEJrVHlKVjdZTFd2c3BUeHg2TXMyR1J5Y1FpNy9GaDdPakFJWFJ6?=
 =?utf-8?B?UGdiSWR6czBFMTExZzhQNTdlWlUzcjI0bmlCQ3R3VElBNE9lcGYxbFJRQnlv?=
 =?utf-8?B?bVpqdEV6cWNISFhVdEUzVU5OUy9uL01ZdENHMG0yT2Rud3ZFZmhTM3NEM000?=
 =?utf-8?B?V0p0TmY4akRsTWF4ZkJpTHE3cmh6K1dEYXBFMFNDRjhoYm9QQ25qZHU0U3Ju?=
 =?utf-8?B?a1NzUWVXOU9mQmxJVUdnVElLMklIMThhanBOaGtIR0NvTUlNcENIc2FQR0p3?=
 =?utf-8?B?U0RHVG5UcnM4K01EZjE1ZWJpcnZhZGQ4OEo3K2I0bHpYdm9WWVBXdFZ3THFX?=
 =?utf-8?B?RGxyK3VLNDJpci91dmExRjhuak9HNkVMaHoyRmh1ZG9pVmc4WllMQ0FnR29O?=
 =?utf-8?B?dW5ld3FYZDBOWjh4dkQzUWt6eldRVTRhRE5Tblg5cHZzYlF0dTEvR0JtY3U4?=
 =?utf-8?B?dWdqbW93bG1NYTRGcWVzTFp3OFZaOERNTVR3UEVaVlNNWVh6aVFFQlhobE92?=
 =?utf-8?B?MXdRZ1RYOFVCSWRDNzU1ZWRzcDVBTnNSY3ZaU1hCSW4vbFQ3d0dLLzY1NUV5?=
 =?utf-8?B?blFSM3VhbXkzWmhKVnp2K3h6aFExNVphbHllZFZIeXBCUEd0MDdlbGpJVXhH?=
 =?utf-8?B?emNPL0c3b0oxdnh6dEovcWRZVjRaRkdGbE4wNmVKOVR6d3NIN2NydGY0S2xU?=
 =?utf-8?B?SUZGcHFrVGFYaFlUcHdqSFVDV0tSRnpsMTMycEh6L0tqMWlmR0x6V0cyOG4r?=
 =?utf-8?B?bnQzbUhZUk9obDVGdW5wUzVkOUVhUWYxc3dNcUM0REZaWnllZFRpVzFCTjdE?=
 =?utf-8?B?WUtOa2dBQmltSkRNT1lwWHNhUi9wNW9pZUhHOGROU0NLMWQ0M0pqR1I4V2xS?=
 =?utf-8?B?aUtDanpTeTNnU2hCOXFjRnNDS1pjVWhWTzNYb241Y3Jid0JMOEtFYTBJc3Ew?=
 =?utf-8?B?WFNMYVFaOThxZ1QyMXBTVTErekNWRGswaCtnZzVXNFFsRWdOVmZRWnphdGE2?=
 =?utf-8?B?ZnBXeEpjRllzd0VWZDh1UmplcXNSbzlVdmxuNm5HYy9XbW01YlRnazF1cmJi?=
 =?utf-8?B?WjBKOFdmcGtBUldVeHlSZVdhaTFzUHRQS3pjU1NnUVRjRHg2eEtoeFhtVW5T?=
 =?utf-8?B?TGY5Nkt4YzFlU3hvL3M1QWhzVTlQSUFTL0taMWp3LzRsR2xFbVVlVHVmT1BU?=
 =?utf-8?B?MVpXNjZ5ZkVDYmdwcnZrUXFPRnpKdi9oQnFEOWh3VEZ5aCthbHdKdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d035b041-b27c-42ab-d1fb-08df248fd7dc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 16:27:13.3870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMQXQL/Eqx5e9H4O0zWECf68Lj9Gv/pmowE8qVQxb6elB+/UCSAIUogg9SOgnt89651V7z+vMnu5bl0flekH1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4205


On 07/10/2026 16:20, Manivannan Sadhasivam wrote:
> On Wed, Oct 07, 2026 at 03:44:43PM +0100, Jon Hunter wrote:
>> Add support for the Tegra238 XUSB pad controller by populating the
>> Tegra238 specific SoC data for the controller. The Tegra238 has three
>> USB2 and USB3 ports, uses the same port ops as Tegra186 and has the
>> same supplies as Tegra194. Due to the dependencies the Tegra238 device
>> has on the Tegra186 port ops and Tegra194 supplies, drop the compile
>> time guards around these structures.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   drivers/phy/tegra/Makefile        |  1 +
>>   drivers/phy/tegra/xusb-tegra186.c | 29 +++++++++++++++++++++++------
>>   drivers/phy/tegra/xusb.c          |  6 ++++++
>>   drivers/phy/tegra/xusb.h          |  3 +++
>>   4 files changed, 33 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
>> index f5ed9582d80b..018a4cab2b40 100644
>> --- a/drivers/phy/tegra/Makefile
>> +++ b/drivers/phy/tegra/Makefile
>> @@ -8,6 +8,7 @@ phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) += xusb-tegra210.o
>>   phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) += xusb-tegra186.o
>>   phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_194_SOC) += xusb-tegra186.o
>>   phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_234_SOC) += xusb-tegra186.o
>> +phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_238_SOC) += xusb-tegra186.o
>>   phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_264_SOC) += xusb-tegra186.o
> 
> This is just a mess. As a followup patch, could you please please switch to
> generic ARCH_TEGRA Kconfig option as done in this commit, 6b5e2f70a95c
> ("PCI: dwc: tegra194: Broaden architecture dependency")?

Yes that would be a good idea and yes I can do that as a follow-up.

Jon

-- 
nvpublic

