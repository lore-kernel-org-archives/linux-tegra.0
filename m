Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010049.outbound.protection.outlook.com [52.101.61.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76A8368D79
	for <linux-tegra@vger.kernel.org>; Fri, 11 Sep 2026 14:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138109; cv=fail; b=g9IgBYEPlVtFHT2vJi/eFyV0aFowSCz2KSgjKPcR1RJQjwiJJMBT1+UuuX5mjdbhZTmmq0WnTFysvKg8PCJx0TaKffwqR9FleqAnkksuGmaFT4KZQcW/xbEHjKbCOGillRrGsBPxuypcJOfmPl1iGnFm+YJgT4nvo1CmnFFusCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138109; c=relaxed/simple;
	bh=v81l6nfvm18cTWkM6c36o/cQJ448YuUdJOZjiibvLDI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=acbE9KPwYH7lQJ0vC8VE2g7Ch93Lt+rNdqZ71hvulhKAI+ytvtx9AQlqyN755Gvdwmj26E0xJPsSoVq+3rCG6v72iJgzRKiLTybiPbiULSrZzxZRMZGbkILYXbKpjPckDuPKutqa7RfCER9t4muf9P62xEJvK8sOeOmcROC4cX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R2ku9ApW; arc=fail smtp.client-ip=52.101.61.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R2ku9ApW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItRs36kDCDIEWpPFJ3uGr0/R2DxTsuG2T+FKKtGuZQJU38Fu3BA4xZl7FrtSSOL9Pb+zFknc8a0D4Wl9lcXdecoB8YzPA9M/1m6ojLZ+WwoLWAXWoEI2wXHTwwksctgu2XdxpDPpf1kSGsGBhZqZOOY4pbI8VD37Jq5m3Glux+ZM3mG1C2lU+CeQvxfIBB1n7ojHSKNwyj0T17mXFzD3A6pTzMPSnwRLy8FPzRUvQd43bVIPpyydrAc79p4/FzR83lDCO3wsJuIY8By3ZXk+FG5WRCI6/Dc0ZTene0gstfDa7QctuGQrvFrStzqWcHnzClZwbvMuuuMMteBPk/1CHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THzcl2AJDQycob+pTPz76ZcJ5MnbzHUjwztBAJ2fp74=;
 b=sLSouNyM2bGpl+KHUmMj43Sh9pac1+dMs5EUf4Ye228mqnvWA8YaDA7V7TjTNRoio3XbATl66Sjsbt7wNsxcJsBzIUbCB02LQAGw6NLOOd7YvuQw/GfLGnqwNajcOvVInsEQIhtI5z/vUuBNa933/8w5XRooTGauNiAwDdhFOf2LvsSorzJsN+UGcaBgwBrbHm+WeiZqNKoYn0O9JfSjYNitDv6XEw+96R94ul7eUBbY6jyLQADlCRgzx7vI1pmGIrxRdB/AQzKIX/Ux89AHgyqvXT9S+t8FQslpAoiQqSEU/Z21hjRr5rOG/z55pqA/oTABq33/Hc7zjh7oftWe2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THzcl2AJDQycob+pTPz76ZcJ5MnbzHUjwztBAJ2fp74=;
 b=R2ku9ApWgqqm8qxloJWNBaqOPJ4S58GbRyQhdtmyaeVFVjyEzbFMyrRkb6NLQSdchqViBtbLLumCLgHh0aNSofdXviJKk728hpfzREFn3eFMFRMgf9naltP64kp74davqzYEQ/UxnVFmbcT1K0uT9y6PrVijb3xdrpq/yTj/4O9skTQB48ICS11gnSvxQUNhyoPARUHCJB3I7/MX3WyJqtvAC/SCwBLW0tJtzYzdyKY1iGy1nAuYSBk5FSTnv/hVmn+iok1QAj2oK1S9WMFkidQ6dIPGvkUU61dd322EKbYAO0Spcep02encjyek2sam8viAft8DyF2/fUNQdfuAPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 14:48:24 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%6]) with mapi id 15.21.0382.014; Fri, 11 Sep 2026
 14:48:24 +0000
Message-ID: <353be5ea-4845-42dd-a902-430f0ed37348@nvidia.com>
Date: Fri, 11 Sep 2026 15:48:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Enable built-in RTC on Jetson AGX Thor
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org
References: <20260817143205.287870-1-thierry.reding@kernel.org>
 <75f49105-f36a-48cb-877b-5ab96c8fcd90@nvidia.com> <aoQ4vGb2-FwwXss9@orome>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <aoQ4vGb2-FwwXss9@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0390.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::15) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 09bae491-55e2-4f1f-cc09-08df1013bb05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	70QsWKy3uBD9ATqNOYjn1mMj1rsXNVhVuCvRdiFT8QE0F4DqFXnVAVO6D5C53icqnDR0VzPhwXGbjBzsY1MDLsZTm/hYDQHu7ffKbV3U2XzhfxizkPetPibaK1POQBCqCNVr6bYsXiI0gj/ciVxBiTFk/wWuosB3Hx2DZnX45HXVqyjK0/5E2Ru8mqUMcnZ+xbQHwm9IMj1MxYs60vShGmX4rGOohQQJYzSBG/JfipLmEH4JyE/tjHAukTKWleFuCQ85LD1Zy/06zE2ql2p05pFBATr1iqFI6Dx6O8C3OxdBlpCQJs0xQBO9d7JBFRJemRghIMvoueqPNbX05TdYkVc1GUxRCiNgcv3oJItnPMSN7r956xA5jXlQVAp0/hG2Eo9jrxKfMYKeBovi2Te5ObbLMwIxftofxDtvnIhFindEqL8f6ledqB+7bxNm12AMrx0tU8NMcRsrgXPuKX7BALlUFRmwVqWMLSraW5D+owKmufmosovbYGYar6gmGYXGpOiELrWpXTewodXOSIbw86l4Bb+XzB7/TKQ6Jf0vHbKwYhgwNHlw5UuVrBW4pWcYPa/uUeuaBmbaLQR1nsc5sx4WpmuLAnaGbLxy7N5aWdPNtglFGsXmPhsTNv7kEqBPibS9BCNHvYpX8EWkCBxjrL0UdvEdWRhwL/xpgpnPsec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVc2M2NNOFg5dDdJQldKeEdSWlBwSXFJMEZYbkt4d1hHdzFOM2ZhWUhGQ1NR?=
 =?utf-8?B?UGUwZWFlYzlMdzA0M2ZYTXRQVjV6b1JYSGROQnNIamgvazd3RGh0aTl4UGky?=
 =?utf-8?B?a0ZBTkc2UmcwalFhbktwYU9PMXVtdE5OS2ZkdGZuM0dGRmY2VUhVZWVWS1d1?=
 =?utf-8?B?VWgwT3M1TVhmS3pQKzArRjJ5WGFoUGYvSUNHcTR1bU1ZdkdWT244SW1kenF5?=
 =?utf-8?B?d1pxSnNpbnpmM1dUNVJrS0NLU1MyUkcrZEp3dmRRaGduZzFYZnNLaXNRYW9w?=
 =?utf-8?B?N1NXUnNqVytCaXBHSGxmdDRiMVVRSWtQRWtsak9aemJrT3hRb0FQMG5TblBh?=
 =?utf-8?B?L3M4NHRjWk9pZ3duQkErWGZha1VJQ0QyUXQrZUFJZ3l2Z0RnTnVWN0tENjFS?=
 =?utf-8?B?ZTFpaFRhZktBZDhJUXZXR3RpOFM1TkY0WXM5Ry9vOXhNcjlraG1ZUk02UUVL?=
 =?utf-8?B?L3hKTjZNQm9qSlhkelc3L1dBZTAxcnBuYThSOUk1b2NIQis5TGxFRERUUmk4?=
 =?utf-8?B?c0NYaWp2bWxOZnBzR3NZcTY3eDRZT3NHc0dhY05NOFZCM0RKQ1VmQVhUcWow?=
 =?utf-8?B?bFl2cnNTQ2ZlSzRSMmFDSGhUWkJTQm5OUS9mVWhOR0dQVUpTcUl1QXdyRTM3?=
 =?utf-8?B?eXZSbGZ0SlJCK2tEN2VzbnpIK2lhTGRlU3FEUFVsVmNiU0lrSE9RMHk3bFpw?=
 =?utf-8?B?ZzdQZEVEejFPZDFpckRsb3ZZNklLSUR0ZUZnK1lNZ0NOeXJadjhsZHlpTmpH?=
 =?utf-8?B?WXFPNXFuQjMydC9EVWlJSlNmN2dhc0UyR3I1aTZXbUZqemp0dlN0OStRaC9D?=
 =?utf-8?B?QXBzK2RENXRuMitvazNoMnQweTI3REJLTTM4dTlLbHBHeklMTWRDclg3Mzdl?=
 =?utf-8?B?Q2k1NmNKd2RLUjY2bHdDMy9WWnpSQUx1RVRtSGFRdDhQTzFMQXFJRGlNSWNk?=
 =?utf-8?B?ZStRZ3k0d0pHZHpFSDhrTGJUOHQ4TDZmWERUTXNHV3orVmIyMXlGRmtrK1Iw?=
 =?utf-8?B?OUpOeXRsNUVGc2VyZGxoUkhzYkJ6MktjZkpsRTRlOERtSW5XVGp1V0pZZVpO?=
 =?utf-8?B?REl5SGIxUnhRRHczaG01NytjZ0ZrSDNlQjhjek1DazdXMEluN2tXZm94OC9Y?=
 =?utf-8?B?M2llSEhobjdVVjZRdmVib0tuSThseVpwdm1OKy95U0REVkZSR0NGY3NRck1P?=
 =?utf-8?B?elMzMkRjSjZaNzdjYzJvWnRjbzdoNnBuSmNxVHNSTGNVYmJLblgxTWswemli?=
 =?utf-8?B?bnl0eWhrcEw0amtHcTY4eGNVYTFJU1BEUWFEUVVYaFBzVk5NU2NoN0R4REta?=
 =?utf-8?B?SjEvUzZxZjR2b1FEalVMQmExZ09kUlV2MTRyQWUvTGhxanNyV082ZWxwTVEw?=
 =?utf-8?B?RkNxOGE0d1ZHNUMvak9kcytwUS82dTBhdG53MzZOd3VnSjh2NGJPLzA2NmFJ?=
 =?utf-8?B?UjRVWkZnZm4yMlN2dVNVYkpUaDBaazVvSERzWnBGMnJxK0dlakRMaXF5L2w3?=
 =?utf-8?B?SnRhTjRueVpxMXp0TVI0Z3Nyc3lwRFFUcm4veUMwS25Cd2IvbEUzaEN2b3Uw?=
 =?utf-8?B?Lzc2VFZuUmdNL2MrdGl3ejRpRlVVUGdmQTEvRVlGcFQ5SW1HNXRSY0l1MUdZ?=
 =?utf-8?B?QStmMjVYWXJTNG9FTmowODdaYjFGNklTdkZVZEFLeW83NlpKRjUrT2ErM1d6?=
 =?utf-8?B?ckticWhjeWFDdDVxZHRBSk9wTjcwYk81cUhnTklHaHNFMENVNXNEVE15bmV3?=
 =?utf-8?B?VWk2c3VHaHE1L3cydVg1L1YwcTFPZVdpOGJZTlB5NjNUSE1zMHQ3TjdYVVZr?=
 =?utf-8?B?blFIUFpaSEUvT01zaUpGOFgrWFRlUE1PQXB1U2ZxOUl5NWhGblVMQXptZW05?=
 =?utf-8?B?TVlhMDJzdXR0QjUvNkpLUHk1N2pNOXgzRzhaYTRQeGFFazcva2NZZ2RHTHlz?=
 =?utf-8?B?VkJkMEduMUQraXlSdDJaRG5pVmxwM2FTUEVRWEdoQzhLdXVUdzZaMUNmMSs2?=
 =?utf-8?B?N25PTEtoR1VKMjVzV1I2a3pLWUZtVStOczh5TU0rYlo5SUYzOGdhTTI0K0NL?=
 =?utf-8?B?VU1POURuckYrdCtDaVN2VFhndVcxaUJ3YU5aanJ4Z090cUZFenZhdTNraFlp?=
 =?utf-8?B?U2RzdkJXRm55YU5CT2FXUllrVjZBMjRCWTFDeGc0R21CSHN5N3ppSUxiUlJJ?=
 =?utf-8?B?OUd3aHA0aVBHOHIvVWtpMjQ2NzNWNnRySHA3Z0NweXVVbVIvNC9hNG9wcmZZ?=
 =?utf-8?B?eCtpTnhieURWMG54WkR0NExpVVoyTHIwRXgvRkxleE1sakNzMHNMU3hib21M?=
 =?utf-8?B?ZVI1Q2xZZlEyS05ySWdDTXA2WUwzZllkREpSUkRxRFJNRnRrRCt2QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09bae491-55e2-4f1f-cc09-08df1013bb05
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:48:24.1064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kw7fXOl50q2LfL99v12O9+rgYn9JwBN72dIlZTfMCfol7AUeDe/QnY6BoXS9T89vnv3dWdZmIywQE90hGGroEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6342


On 18/08/2026 11:54, Thierry Reding wrote:
> On Mon, Aug 17, 2026 at 03:41:31PM +0100, Jon Hunter wrote:
>>
>> On 17/08/2026 15:32, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> The built-in RTC is mostly useful for testing suspend/resume cycles.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>    arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
>>> index c4ba3322ed9a..113ecf297378 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
>>> @@ -13,6 +13,12 @@ chosen {
>>>    		stdout-path = "serial0:115200n8";
>>>    	};
>>> +	bus@0 {
>>> +		rtc@c2c0000 {
>>> +			status = "okay";
>>> +		};
>>> +	};
>>> +
>>
>>
>> Any reason we should not just enable in tegra264.dtsi by default? I see that
>> we do that for tegra234.
> 
> This is more of a development type of option and not everybody may want
> to have it enabled, especially since it's not always hooked up to do
> anything useful. We commonly use it on the devkit for suspend/resume
> testing, so it's useful there, but even then there's usually another RTC
> on a PMIC or something that's considered the primary one.
> 
> So in production I suspect people may not want to enable the built-in
> RTC. If we enabled it by default, then people would have to explicitly
> disable it again.
> 
> I don't feel very strongly either way, and I could easily be swayed.

I would be good to get this added. I don't have strong feelings either
way. So ...

Tested-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

