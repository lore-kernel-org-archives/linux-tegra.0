Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62BE2D022;
	Mon, 19 Feb 2024 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345882; cv=fail; b=rpo/NoPo1ggLQp0ktHBNeiSAUwBda/meBIppZp7Z9VFeqYHdmZ6H2C4gtHJi2TmFz6BGVmlkv0RAYwLGfYR0jzmis2kscVyRWb9iYnDs7eE0paT9U8k8rGDIpan8Ghv3/WB9z8tbrKNC5T+9fD9tPPzn3+lVwvXBDBtSb1arXWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345882; c=relaxed/simple;
	bh=xefr/56g47nxrGa1T7yeHMvOeKl6f9BSJyFcAvE02hU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qKztFa+AGZTNIEdd5WJVUrd7t58UJ4b9MsyYM7OpUANmRudfGd+24CpKodzhEuP+O65paB6gC28etNeovmICXHzkgwa7/hStkdHWPWMBHrU6yLDrJuG6GOi/2vlX4GAauJf0kjFy6hfScOBn9MKi1eldEzpGHu1QUJYAuHBNZbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iqHkd/7k; arc=fail smtp.client-ip=40.107.94.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iqHkd/7k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0pRuAnI1LuUZS1h7Mkl1zKC8VFGp85UbNV5J44aEImKDspiIpSDFHwEzLU9+OF5TecGj0o9kZAAWSsRRUbtGPW5nJEkjtSFs7lyo4BvYRjzFgpAEki5bakEjVPXIyHuMEz81RbnoT1tEFd4eUruPe5FoH8VOaUxN0yej1ycCcBRptcf3L9P+PoWZIWzUrsbzfjMpR3SpCrHUTggTa4P0MYGvlC7B1Z7FlIcIDaBy6NO/UAEUpcrwkC/OsEhUfDlnsRyzUYtff1pdQRDUG7oV2VZdu/Ml5RFIrl9+ES/neqKqug+gZx2lnIfrXsX1W5Qk/d5YLomy9gNpl9dPzc/Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPrnSrMGMXjZ+WlVDDyT/ICFeuj1qDObSBr9GB0M0PE=;
 b=XKxeQGP50oiFrJrak/fkeqpOo/ezMtl0tmW2POvhPAnMyNA1SMVK1b33QzRGvdz4rYZUCizCLIKrdzgS6Iqx/xR3PCCtZaEfqr4+e7+sIPVGcSYeLB0PG8wSQETjlDLFiwKgZHpdKR/z+Gl0GssuKgK0vlLGvvL2/4ItUwFj2NVGikFXKlSCLUc+SvouwXzGgc7arxg6aSZcZUADQ/L/eZakhXFBZjK8fRvRUmZI4TDihCQ+utg20sTdabiyFCaUyhC/WiGL4UrUlKG3SPQT34+Ez4xZOxwcRyqBp5WVYqlHGQbXHy/Ok9ozm8su1o529p/M+dSmV7dccsoh4MzGPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPrnSrMGMXjZ+WlVDDyT/ICFeuj1qDObSBr9GB0M0PE=;
 b=iqHkd/7kWp/yQHb2KzhnsoyvUN0tNiQxCphX/HWRqNUwNxVDgoGy7cbrg4PXfiJk0HeCkIRxGzPGCWnzbSZ5MUpYLLDIkxRL8vEJy4oSXKVFLcPy0FlgCs1aI/A1Ud/u2iq9aVpPegxO87ec7uOAPi6ljGoBRDqed/mSc75T8sWq8gqS2uXJr8+FwV4wWf2cf5drLPkncM4VNdRhkBwK9p89CieVn8GyHPtvKzydoff6/t1v6OKQRmCg1dtBpf+zVHcrmPttklI0ezKMcFGvjC0R/X2/oMOLnaO/9+jhFkL0gs45aYQNx1WBwpfbW2pYxkvhyp7/RZ2fVpWYjLCOlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA1PR12MB9003.namprd12.prod.outlook.com (2603:10b6:806:389::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Mon, 19 Feb
 2024 12:31:18 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::a98d:ee51:7f8:7df1]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::a98d:ee51:7f8:7df1%4]) with mapi id 15.20.7316.016; Mon, 19 Feb 2024
 12:31:18 +0000
Message-ID: <26fac116-d44c-48a0-8cd5-b08ff8bd521e@nvidia.com>
Date: Mon, 19 Feb 2024 12:31:16 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: tegra: Add current monitors for Jetson Xavier
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20240216122805.32529-1-jonathanh@nvidia.com>
 <20240216122805.32529-2-jonathanh@nvidia.com>
 <7819c59a-a58d-4c50-bbc7-35b3f803aaae@linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <7819c59a-a58d-4c50-bbc7-35b3f803aaae@linaro.org>
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
X-MS-Office365-Filtering-Correlation-Id: 19978fd6-316e-4577-c519-08dc3146abd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DAJTxo+YjumzAjJ92a0Afz/jAELI+7CxnAFJYO1/yh/2I1wau9PB9AQKyTr6KpJqQwQcNdFXm+K9XdPZNPZfJPUyHCThdmQYDAgDMnqLmNRua2SmAOdfB12RHh8bFFvvs5gQqX8TaMyk7ff6/HB9EBoXZq+24Wszw8asF1j6W7+m8mi0ayBcObuVxfKNKqxYejRf+b2Vcro3BkcdYHLSLsUtR4VKUQ4aj/NDGj1ntUrnKE5/NkmrpZtTIGcBQ1ee9hLjYs7KhDgpvHM/pFvll9KgOOjR8zIuEah4VoHepv/1zrcHzuXOyiwIvK2TGsIjIgzz4SRQC/5PtsXhDLWnn/NNAJKGzD9BGqEdpsGIZWIYYmTjncclxYmeibv9LCPhpdne4GS56CimRV5yWn7nzMVxHKI2uYJLTyBsXWZAJU/V1QdXXIO7n/5AKnxyx44Pk+CiVq3tS3iAYRyM7IuTqdKnjAxCokbfmkBdRK5Zw/qtcsYjv2e7UZ3yAOGNM5K7NEYKEKI262/xTBikL4lnOuPc1VuahUoSHjHTxQm3QQ7dxO9O47m6/Z4E8TvsA5T5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmN4bFBZVVJEZFBxUmp5QmZ4bERzeGN4VkxwWHVSNHNaMW1PT2JzOEV0SWhJ?=
 =?utf-8?B?WHVra1IwRjZBU1lSQmo3cmVuQklYY2dMakRwZFhDNFF4K2tqdEFtRndFZ1Rr?=
 =?utf-8?B?Tk1tY1JuZFB6VjZzVnVkVXZLc05ZaTdnZlZwUnVUL2ltZkFyQitiaVJhUi96?=
 =?utf-8?B?d3FyZVRlT0IyU3Awb3NyOXdCWHB5UC9OZGhBYjRVczJGdVZtb3F0QTdXdWZk?=
 =?utf-8?B?VlBqK0dSTGJaN294K0VpR2tUalgwcEVWVHpSeEJEQ0hMZ1FOaVVWTEJrUGIz?=
 =?utf-8?B?VWxKWSt1TmpOOWpvbUlpNUlHNW1qS0h6ZmV6aUdjYWoyeUFFT3p5cHdnUWtD?=
 =?utf-8?B?L0FZSXk5aTVqUnBxVFljajlYN0V0YVBqQ05wOHZDSzlXazdkUnNJRlZtQ3Av?=
 =?utf-8?B?bjR0M1ZaRkFoMEJrdnRCdXh3WFkyNjVEZmc4bGZqMitrMVBqdlR4Q1pwWk1V?=
 =?utf-8?B?RmowM0oyaU9yd2E5ZmdLc0tEUDJZYUtYMVdSdlcvOFBtcG1ZQ1pVUXRLYzNZ?=
 =?utf-8?B?c0hXdmhuN21ydUJXMUx5RDQ1SHNTUm5JNXlOMndWTzlxOWd0N2pRS2EraUZX?=
 =?utf-8?B?aUx4eVdVNFNjTkxqeDJrallmWndWZkcrc2o1UWhMUVZ0dEo3WnhYZzhVYjds?=
 =?utf-8?B?SmtOUnhNYk9Vd1BTSnVITW8wMGRZa0JIWElmSTZKTkoybWdjd3o4MVNldllO?=
 =?utf-8?B?YVhDVllHWjVWcVZPU2JoS3hiY2ZkWElMbDE2d2tGNXVJejlyemYwYWdJMHN4?=
 =?utf-8?B?RE1pRWpQd0dCWUFmQytob1hyNnVXOURRY1FnQzNYb0pad3pFaHY3bWJUL2hN?=
 =?utf-8?B?MHNJcGYxbTkzRGxGa0t5QS9UYWVpZ0h3MkZSbHRiTXEvRklWSXRiUWlhZDRa?=
 =?utf-8?B?a2hIUis4a2RhYVNsM29UNkp4WXZRWFg4ZUwzVU82ZnpnamJxMlVsRU5GT2RS?=
 =?utf-8?B?YzBZOFlwUjExTzhpQ0I3U3k2TndnSndERzI2QURxbEtiZVZzZDdSeTZBeWdN?=
 =?utf-8?B?R0ZrTjdKb3BFZFBJTlFKcTJZMXBwT2hMOE9GMXU4VUN6Q0RlQ092dEJpUHp4?=
 =?utf-8?B?cE5XZldDTS9wZ0luU0szdWtEZDZiZUtjbXJSdnJMbzN1Qlp5amZqTmN6dmow?=
 =?utf-8?B?SE9TNEYyNENOZnpzR2pMb1RKVjZJYm5rMnR1UmtvZDU2MlhKc0l2OU5DeTdl?=
 =?utf-8?B?VkY3NVZxcTZZZFVLWm1sVGFDUjNRMmhtRnpRV2VHam44TXJuTCs2VlFzdDBs?=
 =?utf-8?B?dnZaVlhvYUNLRHFvZnRSZEJBekZkY1I4TmJxcThQM3g0QTRaYVA1RlBIaVN5?=
 =?utf-8?B?eEVnTHZGczRRWVZ4ckFKbVB2cVFTNHpTRjFxTVJsWnJaRnNmTW1ldHZnVSti?=
 =?utf-8?B?VzZCWnJjRGpWOTB3VzFRdTVnYUNRdExDcFdVTklFWHFMcjlVM2FIMGlKL3hE?=
 =?utf-8?B?dXIwMVlMcEd3RFU1ay9kOHJpd0dEU3hWU3F6SmVEWDhFTzdCMEIxN3pYVm95?=
 =?utf-8?B?Zm5UUElKVWZ5Y2pUcEhpTjRrRU9BdmFXdTN3dDNhZXpKT2d4SjNwVXNrRkUy?=
 =?utf-8?B?eFNnUnViaDNWNUhCNjBwcFNyTkhTM0MyNmx5eVhyY0ZoOU9rS1djN1UrL2xI?=
 =?utf-8?B?Z0t2U0xHeXBabFZXa1VJRmdsUXdPVkN4K2F1ajF0RitpU0hYenlsTHZ5ZnQ0?=
 =?utf-8?B?LzBqTXp1TG5wbnBIdzUzOTAyb1BkZ2prdWI0OVZaRW9YRFdxWTFENDFXRmV0?=
 =?utf-8?B?cjYzQTFlWFFrSzcveGpmRTBQVFNSSjc1Vkc1bURRbTBCMllJUHVPaHNGK0pl?=
 =?utf-8?B?ZEYwWXJ3TjY3TjdFNjFwY3duYWlKMjhTSEpZRkw1Y25yS3FPMDVTY3F0TkNM?=
 =?utf-8?B?NWxNQWdodVRMSDZzSm1USTdXU1F2eEs4R0N3UHlBenJoMW1VRFd2YXBlTVF1?=
 =?utf-8?B?VHk1ZVZERmJ3aWxxZ0lKNEE5UEJ4dVpvbWhNRmxHdXNoTUJBTzd0ZlZHMm1l?=
 =?utf-8?B?Ull2U2VjOUZsYTRvVG5sUERGYjV1UklUVEpMUlJuOTNEd3Y3VjM0VjJxMlE0?=
 =?utf-8?B?eGUybGlUL0paQzYxMXg4dGx3Rmw2WXZZNEoxaHVJYjA1amMxZmdkTlYvVDg5?=
 =?utf-8?B?SHdhYVdvRDd3SmljVXUrMnpVdkpnUlpUbXVSYjhzeDBHWkpGaEJzVXB2SCti?=
 =?utf-8?B?YTR1eSs5TVprVm02ajRJeStpRkxwZFJUeExibVdOekZVTWRpQWloclV0N2pp?=
 =?utf-8?B?NjE0VWlsTDNXOWJJMTY5TlgrY2dBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19978fd6-316e-4577-c519-08dc3146abd2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 12:31:18.2143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFhLKslU+3TK8iBgscRuK1xjvo+ITdDCtRasJWb8AUJgioTrNv1szb24Zjg48SZ+euGpHqHTvs3JSo/GE8pTuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9003


On 16/02/2024 13:19, Krzysztof Kozlowski wrote:
> On 16/02/2024 13:28, Jon Hunter wrote:
>> Add the INA3221 current monitors that are present on the Jetson AGX
>> Xavier and Jetson Xavier NX boards.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 50 +++++++++++++++++++
>>   .../arm64/boot/dts/nvidia/tegra194-p3668.dtsi | 27 ++++++++++
>>   2 files changed, 77 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>> index 5b59c1986e9b..7c57272af044 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>> @@ -53,6 +53,56 @@ memory-controller@2c00000 {
>>   			status = "okay";
>>   		};
>>   
>> +		i2c@c240000 {
>> +			status = "okay";
>> +
>> +			ina3221@40 {
> 
> 
> power-sensor@
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

I will correct this.

Thanks
Jon

-- 
nvpublic
