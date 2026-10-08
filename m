Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010041.outbound.protection.outlook.com [52.101.193.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9563E9C11;
	Thu,  8 Oct 2026 12:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791461380; cv=fail; b=GV1zWRgWM0ahvVEwy4HawdtIjU5pJUDCgqbLyyX6Jxdz0q24Lz1AxQsfjqcqYcMzn+PcHmGRu+StqiSR6JlV2IQGB5tJVXi25UmWuCF7n7LVKFCKcLu9dh2Ly8rMpDN7Q8gX5EnvbxakK6tXnFsShWHgpPt10xKF8mQPp1I0V2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791461380; c=relaxed/simple;
	bh=ihwgLZmdZpU8C3/e7hqCRwLPFYD9mjOccGv7CukzExc=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mlUYsUJJzKCBV+GbStZNWPoKjn6AA4i3/2Nn/M5dd+Je0fjads2s2b+HpqIXr1HSNPxS5hlcfpUn1l0UvllouAWN9Do2F6lUzeWqPFjPClC0nLyF41lzbDUgOK80RJzZBB04IqfaMm57rB5/7xywZt3sRT0qzEJYzLbQ0+t4m5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UL0u6kRC; arc=fail smtp.client-ip=52.101.193.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UL0u6kRC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vC73q37/aDhWGrAqs9+YM+jO1c4wbNP3RwvTmylWd31bP0s0saVNHavXSJOVReCpQa99viqITcCnSihXY8xB7y9lxBMBncscpMPmoqD8LxBWbZ30aBfv0IdT/t04R9IJPNrVs3BrjN04/OO57p9DmfZ+HfCosmBK7HCv8RaqJl59Cgcp2/agcx0ViNulvg2WPzg8zguy4f/5ATxZ4dugizR0rk7wvhcBt6aOhmJb/PgjVpdU8rPUlK5mtMfVXq9GinIMFph73VQ45imdRr2WfgofuEr+xnNVR7ewwu3HfMSN/6D9QGv7/oob5etzzbgInjWMMmHgG8Gg5hEDmRTGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBRpjnyogdMVg3B62bPVaVxr5xhn7hZlNHq67RIqJRI=;
 b=Qf80faHwnQQDinHh1nXcmudWYS8+AJCjRieStcPrTyuJqreaNHxlMfEVOoWldibtNMFKc/tlBpQzWxItLwY222O0Y4nWJBZortrNs55gEJgKZEcNo/n7IgjHMF2ORA8z2UshhiorpU0y0z6DVBKvDzrYriOvP8hY/7zGKwvBRKNR1twsQFt97dtoXMn5Upsnb5CDthO2JuC9b0LBIP/hJJMsvIkmah+ZqiWcbK4whz0hjiGsy+md/Cd3LbJsZXVRupT38rnrQYxhwzmL+tzjR1G5awUqDmzEJKQD0GK67PzJwgaNewFWfQ6MDW090Na493nRr3Lt4c0MQOQe4abEZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBRpjnyogdMVg3B62bPVaVxr5xhn7hZlNHq67RIqJRI=;
 b=UL0u6kRCirTLimrgP1ydd4FYSVsXz/hyDeZLBjODTWx91Mlu0SPv0P4O0ZaN6mDcek5fo6SBGReIFKxh28KjGyvtBpCKEEySRDTvFWAhDkEAXzwDBkn77CWYbbrMpjPQMfjVVimR8bFZsRcGEufuZb9OEHwQqLklT+9NxIpLJFytZlUmFhQ3uL1GUL6WaJgT8J7Q983eqUqVJMaHlkN6AcPT6YWkSH3dFQXBBzq/N54nbyBh3k+xRTZYHIEoHReA/NrjyEgFxK3OS4b2jX9PnK5W6kaE3GP8TOvTGE7dhAFrhkcPvM7dTufuac39mrtP9WBXHVbZ25EbNIkX+D0IBA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by BY5PR12MB4068.namprd12.prod.outlook.com (2603:10b6:a03:203::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:09:35 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0451.014; Thu, 8 Oct 2026
 12:09:35 +0000
Message-ID: <576e4762-4ced-4abb-99ef-a895415e30af@nvidia.com>
Date: Thu, 8 Oct 2026 13:09:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] phy: tegra: Add support for Tegra238 XUSB pad
 controller
From: Jon Hunter <jonathanh@nvidia.com>
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
 <25b96f0f-afc6-493c-9428-ab00a0bd9aff@nvidia.com>
Content-Language: en-US
In-Reply-To: <25b96f0f-afc6-493c-9428-ab00a0bd9aff@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0033.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::6) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|BY5PR12MB4068:EE_
X-MS-Office365-Filtering-Correlation-Id: c01e8912-cab4-4589-3830-08df253504ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	inXd7ly7KFI+Pj4f5nSZUInjlZ4nHYFmI8+kYmB/8qAqsPdF2zaaDRJIu036tHHlQ7RwXgEtKzv4UjYtN23s2tUf/m+4FqXB3+s7SuIeBO1Yth1m+ALkB5A38qeixrh9IVICVOs8CZHlnbpayYhDJCpBnZD5rzTelxCxyOWlIUUSO+FnRsCfAgjOxTpHaCR5mjB3EZsSfBSuQQd1M/pBXq4ru1mmC9pLTMwMZAJTTz7vobbFSL1iOiG89oNZaXRUAhJm7dxqA0NhBjAWJIAkCaIC1WTRB7+k5cfhbRUxxaBt3YLjRW496VcaI7XEOw8YaKXda18ZwKRlVNoSd9ZRHMEztZkhMNXAXMPmR7ePkUiOZ5vkf4/FqMMwZv3wpXWyg64jaRWQqgKj+g3Z6Mte9WFO429y6Ww1xDQERJMF29h5rDxpm1E3bGNSEaufr90IPExD2XVpv0gGZWXrUqX5ggP/gWgLdxVJH6wTzse1blGC/Du3lQtXWF6kwal47s/8BibdmGR4cTSxAsE3duqL3A/ScOEW+F0u2qdMW8dXQ56yOPcCZOamM8r+9wgTZLA+yxKM8W2UvIh7EVUeAdQYZlOsZZJ+e75D3ROI44dAbBxidyxWCD+xCfjm9hVFWGtB44vJjtl8p1bPbTnrnl0qLoSRaiC+4WIYGWPEXrFSHbE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHZ1TDYwck8rL09pdGxOU3A0L2c2WmRnTzlXU1Y2WHNLbVJURHV5R0owSU1K?=
 =?utf-8?B?Q1ZZTXpBb1lkNEVNSVBlb3pzbG5Mb1BCVEMvUGxMWVNEQjJRYkIxMEgwUHR0?=
 =?utf-8?B?OWNrdmZ0S0RhQTE1MUZWYS85a0U3cjVTeFUyOVJFVXJERDk4anhxRVB6S0JU?=
 =?utf-8?B?bVN5c2UvekRZN3Z6N2pWWHZGTW9uakZ2aFVYS1IzQXJFVWM2aW9kT241NjhC?=
 =?utf-8?B?Rm1KQTBKR2lSRWlJNURoWFVCbDdWeW9zQWdYckZwNFFEU1ZaYWNUL3VUNkdD?=
 =?utf-8?B?TGtzcXlpamRWbVR1Q0N4RnNOMEtXZDUyODA4QXV4QTI4UkNnSVBvKzU2TGVz?=
 =?utf-8?B?L3NZNFlBYVMxM0E0dEp6MGc2S2k0Q0tqNkxTMUc1emhjVk9ENGJETTRJcENN?=
 =?utf-8?B?Wk8wcTViWCt3ODVVZnQrWlorY3pIdWtsako1dDhoODl1UmFlQk9kdTJqRmxa?=
 =?utf-8?B?dFNJV3EyZXk4eXJLWVlaK2dtY1dYRFNER2tXWHhzTWd2MUpuc3RLNDJXM09u?=
 =?utf-8?B?aHJFSXIyRlhvcno5bEpDL2VqcGRvMEVyRnhjVmRVOW4wQWdPSWI0eWJvN1dq?=
 =?utf-8?B?WUlrOVhGS0RFSlowR3YyL3cwd0tIdU5PODJvdHFVc2UxaFRaRWlvMUNMS2Z5?=
 =?utf-8?B?Qms2bXFINEVldzlKUUJjeGJoN3o2OTVzRnBJbUMwcjBtR3pkbXFLYW82dndk?=
 =?utf-8?B?Yk1CbDlHQkh1VHdPZ1NKVVVZa3kzTmhKV2UxZkF2ZnF3WndjMmR5TnlPLzJi?=
 =?utf-8?B?MUE0ZUVraXh4SVZPbFJ1TnNzNXhtcW0xVmgwZktGWUdFNURpSGZzb1F2YWRR?=
 =?utf-8?B?WVI5SWtEa1R3ajZtSVN5SFdtMDJZVTlJdmJQRlVNVFhBbkVlZm9Xbk52cVU4?=
 =?utf-8?B?OHVUOFdWdXZud3VYaUNvSlMyZVhtZ1VGN1dybC92Tm1YUHlUNUF1VkF6c09K?=
 =?utf-8?B?cDhNNDR3UkFRdWoxQ0dIdGNuNVEwSzZ5V040TWo5K3JWcTF4UDdWNDdmWWdR?=
 =?utf-8?B?WE5yTmI0Mk84eXFwZWRrNENVVGlIODgzcmFhTkZxT3F4TUNLcXUyNE1EdkRR?=
 =?utf-8?B?MGdpOUpxenpHckFkVC9ZQnNyOHlzTW4xQ1I1cTU2a21aZGJXdWlGV1VOQmJ3?=
 =?utf-8?B?eGROOG1kKzRFMFpUbFA5RzBiSkpjMGdpQXFlV3BPYnorVmhMYVhNOUpyTDNr?=
 =?utf-8?B?b2hURTJGRk16WVZSQ0dhK0g3c1JLK21WbnhiZnZzRDhZMzVZbUIxTVZzTThs?=
 =?utf-8?B?REJnTFRkUHNZemdtUzBORmdIWm5UYjhTMFdmNE1WOTN0T0lSQ1FYcWs5dUYw?=
 =?utf-8?B?alNoN0V6QVcxVEtiZXZXYmE5elpGZEVHR2RDUzcreUZwa0pSazNudkNGdDdj?=
 =?utf-8?B?eXZ4bUZlZlpMMWNoVkZNaGd3Ni9UWDlDZVc4dFFxcnA5RHB1bVFXa2hkSGpU?=
 =?utf-8?B?Q1RwL1lqSTFlNGYwN0dRamwxSSszeWRhNjR1NDZrMkJQZEhWd082K1ErTENW?=
 =?utf-8?B?eW0veU5CSHVtM2NaRjh3N3VJbzJIckVsZDlZNHJycHgxY3BxRGRDdkNHZjRJ?=
 =?utf-8?B?USsySHo0Vm1kazY2aXdjb2d2OHNNdHkrOFFDSUJnZUovSnd5U2czZVVuMlZs?=
 =?utf-8?B?eEdFMWFIdHFLWWh2Q2ZxSFRzSGVuSWdCV0cyMWNUdFlrOGlyaGhpeVJoeUp4?=
 =?utf-8?B?bnZ2cnhBK21pZDh4S0s2OE1TWHVmSkxZdnE3Q0xRcVUwT1UzK3F4NTFCWVRH?=
 =?utf-8?B?QXpuZzJvSzhNNkNkcGUzeEVRbm5hbFZHZDdSTUFnZ3B4Z1BBR0pDMVMzdTcx?=
 =?utf-8?B?eFdKREdNWlhwNlpyYW9IZnNqc3kxOE5QOFJHRjlVTkt1MTcybk9DdVBOVEIz?=
 =?utf-8?B?RDYxbnk0VmdXOTBMUmEyeTBrdWRST0dWRmpjc0xncW9VcWVwUzdwS256N3RX?=
 =?utf-8?B?eWpwVVkyZVdxR3FEVHM3Qk9tQzBabzJpM1M0U2E2dHRadGJmMVgvUGRCeGJW?=
 =?utf-8?B?M3oxaFNXRU9WVytuc1hhSWxUS2RmakVvRlJIRlJib21vRmxqUHFPWmZHa25B?=
 =?utf-8?B?S3ZoVkZqMzNPMUdzR2tZZVZXc3RhZFRpQ2RVSkkyRUVUSzArT21sTm92TDNw?=
 =?utf-8?B?RUtMZVlkOWlrUGl5dk82eXpCZFJwbFhsMmdlOEYza2F3SXFUTjdwYVhQOEpE?=
 =?utf-8?B?UzRKSG1rYmFWOXowb0c2SkM3YlQvQkFNZXJUUWoxd3U1OEVRa1RDdTh4UStl?=
 =?utf-8?B?anpYREc2RFVtMGhTM3Vvb3hUTmt4RjY1SUdwU3Nkd0FvMUg5dGRGMFJ2VllZ?=
 =?utf-8?B?bTV1bFJyVElXcHZMMit6dEkxQkpXYmg0bm9QZWo1Qms4Z1pBM25iUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c01e8912-cab4-4589-3830-08df253504ae
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:09:35.3161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ys3H6ciLKF54WvxH3WJkBoQ+V990Jkpvw69+/K2NhWT5L9sTmHVPqzFmdxvhFjnfGBWL05QGUA5rQEaWMhAEcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4068


On 07/10/2026 17:27, Jon Hunter wrote:
> 
> On 07/10/2026 16:20, Manivannan Sadhasivam wrote:
>> On Wed, Oct 07, 2026 at 03:44:43PM +0100, Jon Hunter wrote:
>>> Add support for the Tegra238 XUSB pad controller by populating the
>>> Tegra238 specific SoC data for the controller. The Tegra238 has three
>>> USB2 and USB3 ports, uses the same port ops as Tegra186 and has the
>>> same supplies as Tegra194. Due to the dependencies the Tegra238 device
>>> has on the Tegra186 port ops and Tegra194 supplies, drop the compile
>>> time guards around these structures.
>>>
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>> ---
>>>   drivers/phy/tegra/Makefile        |  1 +
>>>   drivers/phy/tegra/xusb-tegra186.c | 29 +++++++++++++++++++++++------
>>>   drivers/phy/tegra/xusb.c          |  6 ++++++
>>>   drivers/phy/tegra/xusb.h          |  3 +++
>>>   4 files changed, 33 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
>>> index f5ed9582d80b..018a4cab2b40 100644
>>> --- a/drivers/phy/tegra/Makefile
>>> +++ b/drivers/phy/tegra/Makefile
>>> @@ -8,6 +8,7 @@ phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) += xusb-tegra210.o
>>>   phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) += xusb-tegra186.o
>>>   phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_194_SOC) += xusb-tegra186.o
>>>   phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_234_SOC) += xusb-tegra186.o
>>> +phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_238_SOC) += xusb-tegra186.o
>>>   phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_264_SOC) += xusb-tegra186.o
>>
>> This is just a mess. As a followup patch, could you please please switch to
>> generic ARCH_TEGRA Kconfig option as done in this commit, 6b5e2f70a95c
>> ("PCI: dwc: tegra194: Broaden architecture dependency")?
> 
> Yes that would be a good idea and yes I can do that as a follow-up.
I did see the latest sashiko warning:

"Does this cause missing declaration warnings (-Wmissing-declarations or
-Wmissing-prototypes)".

I am not seeing any warnings but I can also address that in the
follow-up.

Jon
-- 
nvpublic

