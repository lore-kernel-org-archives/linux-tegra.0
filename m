Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013031.outbound.protection.outlook.com [40.93.196.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0EA496D4B;
	Fri,  2 Oct 2026 15:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954634; cv=fail; b=qZZmWNp5QbGOZb36cnSSD3GIUi2zHkhr2VKlZBqo+AzkgkvoVfxsukvs2RI6uWiKjiBM5MEWyJgDsNV9Xf5qf3W13cZtv1+lgvgKX3Adju6Dcmy/PDv+bcu0UnvVVdVLPLn9VW2v53Z7vMB+zqE4mptel3Y/ifoV0qD9TgGlG0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954634; c=relaxed/simple;
	bh=yg3FyD8Jv64TSfmC3EN69SFO5gX0d8Qt4lyHoh8h7fw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sl5Aa0oPur/IK7yiTfYBI+YedvyBbkbAcdYOpu9N2gcW8LvMzx+hJ4WLDdcJ9lxS7vnqJzIu4r1hD20AGY1PPGQPXdqnK3H1QwzytGhU+KG+J9f1RfVp5P7fUg45ewy8E4F0MxbMTJNWJgJV3ILdITsWNCQH2BD4vs63Dk67874=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aHJXB+8y; arc=fail smtp.client-ip=40.93.196.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aHJXB+8y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgq0w3KYkKHJOGGlfQW7Sqt5Bas0KNf8bgPCe59WoCz+ZvLyTkmYFnrU+YWMOgH+U4VbtbyK7GiImBmRmeKu57Ga4U/4tbe30Ruc8LYOFIzRj1B5o1LXRWaorX4tEVg2yIE6hs0TKF6DuryN+FDuxCUxMxgAfeXUGdt7EjdJphgXgF7ggh0ihAjQ9VAP6e6UEKkKNt9HiZawd7jjqZT/qBKgPtLWePl2VyHD4qzpAyrfOCh7hJM+3/vvOExz5fvdVd4v8YXd7HZMO28MfPMRs+ow1TQybgXSoypCmdjgVCKd470BtAh/18L3Ak5i4GxvjMSn3av1MH6uTMr5VyuEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSxu9Wn2o5OF6QVxrV6MzzE5l7YNiHkMbLlkrRakPxk=;
 b=QgpxuXTRhsNQ3vJCRpigwyP2Up0lP7JS9Rzl+NzabjgOMhLkTAhRdOEKhq9gTKYuuygTORIstIAXBKIt/xBGm4jXWJ+84VuWxfbI1Tuij+hZn/AZveHOAElEC7zxX5Vzg6uVb4Sw1lj9A+j2BY9IhaaQD752z6Ym2NYwgrpNuHspPh7z0JR9X6pW3kimhgo2xLYymrpKSPuH4HgEZJm8B+ghK5Vz3/Dgoi1l+Mp6m3DReD6ZHcqjbxHlGmYDYkj+Xd/Bs6l+t3XSIR4ZmdIBOX5PY1Sy+rimMLGF3WqRJH/D5JSg4oNRA3UD6LPRKQKSwV1Ef9ZmcXvr1/1dbESJUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSxu9Wn2o5OF6QVxrV6MzzE5l7YNiHkMbLlkrRakPxk=;
 b=aHJXB+8yvGJjX7rxrlZ1TCr0KEEeccjrqcXfToHh+qc892kgErSQ9UiRNX7dE+3WBh5bS+NR0k+ZT/YPF0ublMkvpwAz86ZAV7+FIP/awh8sDdzzE9SbPoEtw41FuaIezcDbV66Op/EpaYtB0TyvJWragV/8C3u4k8FDYAj5aHhNuJheAg94fqhTlxE9siE4AZFh1pnPIy/eEpg3FoPgzQcGQ7w6WezzPbpK/JB02zpsd+LKMouzRx0wNdzBzqrkhelO5RjIB6DS2a3ctR0pJs7YsEEkvbWtWP88fqmCGlrVPJQnqb7lwbYtHbE4P8gIhouTM3jQWJiPWMHhVCAkGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by CH2PR12MB4200.namprd12.prod.outlook.com (2603:10b6:610:ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 15:23:42 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0451.014; Fri, 2 Oct 2026
 15:23:40 +0000
Message-ID: <af1e3a7f-61ee-4484-8cc2-9ebd9903392e@nvidia.com>
Date: Fri, 2 Oct 2026 16:23:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: usb: tegra-xudc: Add Tegra238 XUDC
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Nagarjuna Kristam <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>
References: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
 <20260921-tegra-usb-v1-2-74a925a35d82@nvidia.com>
 <20260925-obedient-proficient-nyala-31f81b@quoll>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260925-obedient-proficient-nyala-31f81b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF0001A32E.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::695) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|CH2PR12MB4200:EE_
X-MS-Office365-Filtering-Correlation-Id: c2586da3-ba91-47dd-9d28-08df2099236a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10070799003|22082099003|18002099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	0uwIskS/+f+Wcw6bGeZFnb3JD8ZxrOd86Izvw+6BFf+8TawgRHVIjVM+1fcIgUDmPM+N1q0AosbwyFDsHCF2+6vBXbaB2fRaeBBXXnZISNlJ/rBkUoBLGzqouBoZq+QUYYDhhLl+MHlAaG6IoTa1Rjn3CTJ54jMJSx7ZJLQICYaMwOqu2YULvzJxDzrFE/OAVcbW4xMPExL4h+EI41Ho8K3qYOY08Q0zoKmj0g9AZz6cLY+aEYuMrpAsoiED+L5vUokH5a9/uzR3xZakAZKQOdl86Ixg+JzcPc0nzIeB5rf8VEzSM6NXckk5IEPOUY+6TplRJdMbLCTgSAOLJidls6eVLLzOEpU3FwSIhww42FhLLHzTqJUtuZ9sMEwi9Dyg2m11HVZZ+enYD9IriZSMRphkkdaGj1rwd13NUmCZDtEmZS90mOwF/deJ7lv0L1pGEmS69x/IX5jgspWFBhLge8Qs6tj3BEyqJC2G2K8lj3Lm2Jwoo8Jark1k1arIAzrH9/KDKXspk0BlHeL1GwkveRo2L2O0biEvnujBiEf3MXtcxhstgcbUuPgfa7EKv0vGmBXkc8ua0ympDSiQe31tomNxBbeSUHPKVyzF+5/9FlD7PIMXL8lyalsXjnLCuTNN2PJ+0y4xOix6u6JXuHeZ1+YmzsFe9hI21D9ej/eLv/A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10070799003)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VytQTlNqOUY1c1oyWXJYanlzcUExeStUSGlwNFNUMkVOVlVvMkRSU2kwZ1pj?=
 =?utf-8?B?eWVjdWJkYkkwdGMyVEpETXQyNzRzR1dMQkFlcVVpODhkVFc0M21JalEzRWNU?=
 =?utf-8?B?bzZ1YjJMM0lCUjlSU0lyMkVxU09tN3JweTBSb1pxS05qRzJUNUdWbDhFekZ3?=
 =?utf-8?B?L01YeGRhWDJmVUhrUUxGbnpURktyS2k4QUlFRmVGcUVmdnZWTkRnZmlub1gz?=
 =?utf-8?B?V09LU3VWZGdHZXdxYUNaa2dKcUEzMTNScTByTG1qeTJGOFh6cE9CUEdCcFQy?=
 =?utf-8?B?bEl5TGRCV21yQlF0MjhPZURCYm92UklDV2JoMWpnbHpBSG9zVFFNbFhXd0Fi?=
 =?utf-8?B?VW1BUnN6aytBMWltVFVXNFJRRVE1UTg2MlF5d3NBREI0UmlyWEgxV3krTW4r?=
 =?utf-8?B?QWNQeEFmZlJQdlZHSFlxMENqMDUxTzFGRlRwdEJYOW9Tc1Z5Y1RjTFZKOVdQ?=
 =?utf-8?B?WTJWT0xrc1VSejlrRGMrNzlTb3luR3dpZ0QwcVF6Z0dhOHZXTkR2YUFaVUFq?=
 =?utf-8?B?S3JZVlVQUTdaZ2FvbWxxOWJydkswNW0vU2N0Z0FuMll6ZXJmcDViZFhDWEJO?=
 =?utf-8?B?bUxueHRDVUYxdERPOWI0Z1hlcTAzSkJUaGV0MmpMNFBmOWM3TVVNcXdoWXhi?=
 =?utf-8?B?NDA0bWFHcXhjSW55Y1loRnd1S3NEbC9HcmQrN1VSU3VEY3pQWjZYeVkwa1Fx?=
 =?utf-8?B?dlJDM0lTMklFYXgyYjVybTg2bmxKbnhGV0JRSzlYU3J4N0NEUjZiazZ5QzM1?=
 =?utf-8?B?L1Mva2hIQktMdXhjaGF6UGdEUFV4eTlldDdJQVVaakxKM24zcFJiU21QaU4v?=
 =?utf-8?B?d3BROENvYytpVUREbE1OWFFFelNuYTNhemVFRVBrVDgreVB3Slpxcm1nbnFu?=
 =?utf-8?B?dlQyQ244eGFybHhDOTZNbVBEd3dvMFhJMStkVzkzRVJWNUlLblc3VlY2SWJC?=
 =?utf-8?B?ZmVMbzhNZzBDdk1KaEx6OEw5Rk96dERVUmZSWU90TFgzNUNhNTlXa3ZiZ1kz?=
 =?utf-8?B?ZlU5d0ttYndmcjlJd1JReDZrc1lEQlE2bnZEbERHTGVNejA0STBBVndsMjFt?=
 =?utf-8?B?V3k1MVpCZGNKditqeVJwYWloTnhyWldJMVZHaFd4WW1TUnhiQ0J3cVF6UHdj?=
 =?utf-8?B?ZlgrUkhwV0d1R0c3emVJTy9IV0pmUDdQWjhYUjZjeDhaU3M3M1dmTzFCTitV?=
 =?utf-8?B?ek9QSnRpVm42dUowVXRVdlhabHQ4NXVkWG5HMS9XaXdIY3RhbU8vSDlvNTFU?=
 =?utf-8?B?TU1jRy9ISkltelpEdlIzWFFqVFJRQjRKY1VqMExvVktCT0pjR3BWV3VpZU1B?=
 =?utf-8?B?RVE5bUdtSkdObm9LMjdjRVBpdGw4WEpJaXI2MDd6QnRJVHRzdVRhbTR2ckhr?=
 =?utf-8?B?QnJ3ZS9BM01kOXU3WFROaCs3TTE3dEdSWjZpMmh4ZWdCS0FlL3Fjczd1YmVC?=
 =?utf-8?B?Nk9Ld0RUMHpJY1RZbzl2MGhCaHNEZTdqc2FaTEpLWXpodE0zNnBuNHRNWUlS?=
 =?utf-8?B?OC9FUm1FMVFrY1Q2T2pkQnF0RWNFUFhQZmluejlaamtBcGM4blByUEI1c1NN?=
 =?utf-8?B?Z2NTc0JmSHhLVys2T0dXYW1QWUpodFdGOGRVNnRtNkpNZCs5aGlpc0tsVjBk?=
 =?utf-8?B?MXVMSzlVVyt3eWcwNVM5S0hhN2JNdGQyWjNDSnQ3bXA4L3gzZ3I2V3NRS1hM?=
 =?utf-8?B?SDBsV0M0VTNlU01uSkJUWEUrcVEyZHdsbCs0dzNYQmtsQkczMEtVdVlyQm10?=
 =?utf-8?B?YithTUp0ai8vekJxdDZxQmxkTFBnVkFWejNtdDk3UmkxR2RGSXROYk5wZStW?=
 =?utf-8?B?UFBDMSs2TlVEOWNOSDhXYzJQaSt0WDVCcVhlOFRCdmxIUU40YnF0VjJyY25O?=
 =?utf-8?B?c3hkWUhZQU0wVlhnV1lwK3ZGQnRrZGx5akNYdE0wbEhnTnJuMldGelJEMXVC?=
 =?utf-8?B?dmR6TkRzM1RsZXVlengraEV0Z0xxbWpYRjc2Tk41bExSNWhyV0dkcjlmc1Uy?=
 =?utf-8?B?WjBqV081d1hoejZpV3VHTlEzVnNPTjd0SVIzdzJkSUN4MWk2VHFDS1BHMjRp?=
 =?utf-8?B?QitVQzNLWTk5Q2hKNGdVNTEvcjlwVW1HSWtCVVNUd2w1QkVKTmNGbkNKZGlO?=
 =?utf-8?B?RjVON054VDErc1FETkRscHdQZ2NqR1A0S084S1FmRzNsOW05TkkzQ0dQRTJu?=
 =?utf-8?B?Ujk1V2x2UzdlbnIrYzFiQTFwbEFwYkx5UUkwSWlYQ1BGRDBKZGtraDNvUHh3?=
 =?utf-8?B?ZEhjbW01Tm5vdzZhOURDb3pHaVBtSGxVNlZjYXFFNkR5MlNURDR4ZnFTd1JN?=
 =?utf-8?B?clVqckhOK3dFaG5UdEwzbUU1d1hqUzNpblJHYnZ3c3Y3UUFCVGpOREtTZ29W?=
 =?utf-8?Q?RinW9eUIBebnHmznRxqi1ghxntIRty9kexWGvUrcIn9Qb?=
X-MS-Exchange-AntiSpam-MessageData-1: fKFPhbACaKiGhg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2586da3-ba91-47dd-9d28-08df2099236a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 15:23:40.7303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jj7DRpeZ1LueZ8a+vaZ4fAH3GkshSs78hAOuPka0yUm5gWi5UwJYwVbEkMQol15vK1Ta7LAHDg+Z2o59QgiOeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4200


On 25/09/2026 14:28, Krzysztof Kozlowski wrote:
> On Mon, Sep 21, 2026 at 01:19:02PM +0100, Jon Hunter wrote:
>> Add a compatible string for the Tegra238 XUDC device. The Tegra238 XUDC
>> is similar to that found on the Tegra234 device but only support 3 PHYs
>> compared to the 4 PHYs on the Tegra234. The XUDC binding only defines
>> which of the available PHYs is used by the XUDC controller and the Tegra
>> XUSB pad controller binding [0] defines the PHYs that are available.
>>
>> [0] Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Similarly to my recent comment for the XHCI binding, Tegra238 does not have
power-domains for USB. Unlike the UDC binding this binding has a required
section and so I should have caught this before, but I missed it and that
is my fault. I will correct this.

Jon

-- 
nvpublic

