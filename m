Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8253682C94
	for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708704326; cv=fail; b=FALoPpvDCPAqOn9woX+Qh19lZsOdEtM/oszmUXAxEe8BOS73LzZaTApsBQRK79AXUDZ/G5l90wnRykPOZx7q0Jn/0azYHmSaSxq4vGiYmrfYRqeLUFjLetNsLaURH9t/R5IQccN/ulfDhWtzGz38mBIBOgWJ4nSvAOFNKQJ8FaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708704326; c=relaxed/simple;
	bh=LvkW2vvXioJ4b3OWYCKs66EJhbbTB/+SsNP2C86vc48=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I1aXSt4+PUie5XrkVWGMkXrxVtZocGIQNkUiKPyp1DacJAkmt+KjhNMsw+RajWAkEGNLYS3G/bDnQS/bLeSsqJIGRjLFT/nTiGa9OyMwtLdoEGmB1PYP6V6ncgwt4SPVDtvLwQUAkDsXg690YNCsxxZ74exNDbylQMG+bgkFAhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DueBCNkn; arc=fail smtp.client-ip=40.107.94.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DueBCNkn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W43L07QH3f2UoV236vvDXWAyoiVaWQtRX3Q5Y0UymknDS1OpnGF0uxed/WUR78L5t3QQhY3DCKa66uw4o+yF6AKc5ZNek627WbSkXBybe5H/CMKQMxk9DZtuzt7iTRJ+gysGDvuFeGHS7noapucp4HtRA53ZobyuINCtbusARsHl+r4VVmA6rfg6xPEiOBk7AKplYJfnHS6h5cAKVlQ+AzabxRyLE4m2AamVwsry/EUnQwOsbiM8vXt1zncAX3/Dd+Rv9Yevge8OYiQihfLPQRD1aWVJPgIcKi0l5A1OOdKw9oS9pJQaV2Qkf02bjOuOQ51CFPjWBwACtphaDE5Pdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RZFJvmmYbHp7Ay2jQRtiEC7ghz1MO+sCHLjgeczHCs=;
 b=eM1tPRe61iHCVX5xTrzaduj/k72rj3fmPnTlUXzuIH19ZZCB+dCMKeP7cHQMy/LwaILBPMo+CpcZwrPFQugjxdTwWybm9YZMO9KUV0BNREimd92TnycnUOrpeMrH7WfUEhuaIWzHBxuiW7vuvjp2RqrtYj318vBwhh7Q9GPlIB4Lg78ddXkTyR1iHh5H/XSEwdN3JGw3M5ApxqZUmeYT+62BQ+aXdJxQS3+CVM9vW6iRg4sdVcb4l3DOXm8JBwwI0vmfmWeMSWCTKP0YyguBL9X6hFPSFhCiRD3BwkkEk6y7qa9rZOXbmylFVg27aTAyy7ILBeebDkgCAWcxu043tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RZFJvmmYbHp7Ay2jQRtiEC7ghz1MO+sCHLjgeczHCs=;
 b=DueBCNknQTXTtAUowORIshmU0YQxDCA48JV705Eo+cg/83wPQfqZTqH89LR5kjY9jdQNcEIoxHOMZ3guNYgjrdwPYlcO/qv0YTLBlvTjJDG0CxXOBE40EfyRiWFsQrOd/cHO8w1Ym7QPaICftMAivhgLHdddD5w1uFwRcvDMc9v1LKd6zToOatK1FwNbYlDwUSpEQf3dZFWSpaHYH543CuKcdJ4A4KOcKpkkeBhGSLEEJ8fc+5N8nqLWnOZE1kMyre/DrjSX4EjYV3qoyZcj3da8XmWl+LxVeu51NlVu0F4x4AycOmbG74/9b+ewDi+tG1eSDLRymhsCaqQnAdnemw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BN9PR12MB5196.namprd12.prod.outlook.com (2603:10b6:408:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 16:05:20 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::a98d:ee51:7f8:7df1]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::a98d:ee51:7f8:7df1%4]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 16:05:20 +0000
Message-ID: <b97daf49-3568-44fa-907e-bd444ea00858@nvidia.com>
Date: Fri, 23 Feb 2024 16:05:16 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Add AXI configuration for Tegra234 MGBE
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
References: <20240222170135.3096122-1-thierry.reding@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20240222170135.3096122-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0075.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::8) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BN9PR12MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b44fb72-c85e-4251-b7df-08dc34893c25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WiSpwQ7q02By6JLIyGZp1+xshN9WsgwfOCVaKoZdKrjCf8Dewtj43vN7oZEpJGB2KWFXXYqkes2R95h4PrBjnZoUhm4j1myZFiKcW66MwL6SBXqcU0Kfa5Ma6yrK4ippHbtA0ya9dKOrBGC18goc7wNrttx/mn/cBNWZRwPjHBkbqi+gSdpJgmtmR7lyA1W/bj/3G7D8RJBDKTCXfPgJxbRr+K4LiLrbym/VzFGlpc1DFadOV4Jw9GmFfhKqtzSR4KT0nVvu9jc8SOj8vr0OxmTJ3tGWxehzCPMDTGeWyX/Uiv+qc2MpMExmIP+pvLck52QXRXnI3zNEzd81jr6Kr2EkpmgWx2D0GDmkHAT8edbIS056wtpZuDirNzQSNF6AHdj4c4a1NHDSGlknr4fHRsMx+OIwK2jo21OcJmK1K8xaVhJ6Jl7kQabG4Kk+J0OEYSUPAcXist0KofdVy/PPR5fBY3pI2zEmccoi0uTBSrP4nRlevLPdZNf17HDk3fO37VwT+55QexGH6UgqLPLNkM1TuVYfLrt421LcEp1X3Aw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnVTdTNGZEIzTXBJZnZMNnMwMk8xY1oxejZlSjJ0dHNhenNFc3FRR1dEdjZP?=
 =?utf-8?B?S2t6WllZc2hDNW9YVFlBTnJHKzJ1OFNCK2RncnJtY0lLMEtmZUhKOXRlSnp3?=
 =?utf-8?B?MHBTN09va3IwUFhjQ0wwblJRT1JOL2FhSmFOVDBUb3NoQ0Q1Z21OSkF5YXYy?=
 =?utf-8?B?RW9MMVdialZWZ0FYZTMwVms5a2ViZ1pKVjRadW13c2YvY05OZk0xaXZteVRW?=
 =?utf-8?B?dGZscVVyWDVoQjM1UUtqZm9TMUM4Sm9yREpUMUV0ME95KzgvbCs1ODMxNmUz?=
 =?utf-8?B?eVIrZzZXdnNRQVd0MkhFbUtNL1g1eEtWSFRvYmNyT2c3TkVHR1V4L3hiTFBR?=
 =?utf-8?B?Y1RjcnZHM1ZUM1RyYXRycldqQzVCMUorMG9Yb29EdkVkUEU0eFE2VENsU1FU?=
 =?utf-8?B?YjAxZlJyREFWeXJNby91UVAvYkkvb3hVRDJ2dGxtbktORSs2WXRGeGxwZEpi?=
 =?utf-8?B?cGtNS043WnNNN1BjUk12amJWWHUxamNNS0N0ak83VUZYRU54VFVwR3dQd0Yr?=
 =?utf-8?B?R3ZIYmNTa2xDUkVXUXB5b282N09IQnZXWTZDM0RUSlJJNWdxdFR5RlBpSmtU?=
 =?utf-8?B?TEp2QVJUSHkybWtHK3BGdzlJSXFsd1RuUzI4U3AzWGZFUXJoQ3VqVC96SWdW?=
 =?utf-8?B?Z2R4bmZEa256ZzBxejNVa1dUUDRkTGdHWkp0RjdNNEFuTHZmMldBajFyK2Yy?=
 =?utf-8?B?S1NJRCtIQnI5TVhyczRzWkZ1by9ZVjZMN1hBSWorMndVaHR0MzRwaXlUU3RG?=
 =?utf-8?B?RUJ5Q1ZpdG9yQVhtQnpkOFk3aDlGWERlc29FTnlGNlY2V0p6b0YyZDJrY0dX?=
 =?utf-8?B?OUVQREdiS2J2Tnl0RTFNTGY2Y1JNc0pYZmxlUkwweHRrL3JlRmFZcHN4WG93?=
 =?utf-8?B?WlNNOXdUaTJVc1JZazZETjc4dEJHaE1xWldiODVNdlh0WXVuWXZldkhDc0c1?=
 =?utf-8?B?K3B0MUpLOHpmRExlU1FWb2NYTU1MMTJWRG5hY20wSTVZdDhHZlVPUEpSc1NQ?=
 =?utf-8?B?N09YcjVrRVY3SFZ4SlVnczNGcDN3blJxdXNqZzlXSWNOcmczM1lMSWxJUUdW?=
 =?utf-8?B?R2R6Z0dPWDc3VytxYzZHajJnWllpSjk5bzM0eUdnbG9WbXpvNkRjUnVWY3lU?=
 =?utf-8?B?SlJZa2JUR05aa0FadmFJRFlxY0YxeVJGdWZpdmRKaDRmdm9NZ0h5U00yZVp1?=
 =?utf-8?B?aVV0RFNoYU9JZmNLSTdLTFRTTGhsVXRXTkRVeXhYcldSdlBhWU40VzBNQTRQ?=
 =?utf-8?B?TW1oN0dDblRnalJpOE03WTVhMHhpeTRuWjAwQjJvMjNWbExCVWlXNExYWDUy?=
 =?utf-8?B?SzZVOEQvMnNxSWJyUFp0R2JEc0VqUXcvSWx0R1VaN0h2RUJ6OTY1Z3lMYmNG?=
 =?utf-8?B?QUU2YXlJTzdnRjhpbnEyOURXeEhyRWVmNnBJUDFoL0pxcVFuNFQ3eXhVMUN4?=
 =?utf-8?B?d3hxVHB3OFo0UXgwRm9Kdkp1M1FjZGhEODdtRjJ4b2Z1WnFQaXJjZndONExJ?=
 =?utf-8?B?SUdDdEZJNDhydmdCTzFLVUMva2JwRHFxY1hmU3ZEZm1Kc08wdElmeGxPdXZv?=
 =?utf-8?B?b3N1S2dEMG9YOTRTc1FBRm1SbUU2eXRUZWJpM0prcHR2K21YMi9KcHlpWjIw?=
 =?utf-8?B?am4wb2xPRjdnU0dnTG1UWlhrVVFkanVZUkdQM3JxcHk5djk2SVZkcGJwWlV5?=
 =?utf-8?B?c2lXb04zYVAwcktRcWVPZU40eWwwalkyeVZpdGZVZDcrbzdMZjhTZE5rcTN3?=
 =?utf-8?B?QmRQWnBndTlXRVFHRDBIUEpMdlZvTUxSc1JiWHFMa3JzM1lIeUsvazNUYWY4?=
 =?utf-8?B?aTd5Q0RIcVJ0ZFhNVllVMU9zd3BMSXJWTjY5ZldUaTJSS1k4ZStXOVQ0dVdT?=
 =?utf-8?B?VkN1bStzcnZhNWdDS1RxN2dkMUt1bGZGYjFSWGZycWNXMXpaNXhhYm1ENCtt?=
 =?utf-8?B?NFhvdURKZENpQUx1Tkllc0pheEduSFY0K2ZCYVhvNEhNcGsxSGY3Z25CcG9z?=
 =?utf-8?B?RUt6K01Fa1h3NmxNZnZ4WUt4NFVaNDVhY1ovR3NhYkFJdHkzNW10Tnp1SlBI?=
 =?utf-8?B?cExTY283UnFoTDBBMS9QVERvbzhKdFpXZWpIb1BhZGw1STB2cnE3TFRsU3ll?=
 =?utf-8?B?ajlvTkh0NmFLMXBWZ2ltTG1Lbkl0S2EvVmhqVHpuREJMVHoweU9Xd2FMME13?=
 =?utf-8?B?SXEzZFNCVEpZS1VsaWRHTDJvbG9TU3VPMVVqZlpXc2FxY2JzcGd6WTF4UVJx?=
 =?utf-8?B?VEl2UTNWYWZFalZ5alBET3dZUkt3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b44fb72-c85e-4251-b7df-08dc34893c25
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 16:05:20.5341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CspkZzNEskYNw7vSGhEDlqj43dVW/DWZqLZPdQC9QRVhStZFjZ7jg4AGbNbDYxukcC/RNkqsrTezYtjB7cVvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5196


On 22/02/2024 17:01, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The MGBE devices found on Tegra234 need their AXI interface configured
> to operate at peak performance. Ideally we would do this in the driver
> based off the compatible string, but the DT bindings already specify a
> separate mechanism, so reuse that.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index 3f16595d099c..84c74155a5ca 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -1461,6 +1461,14 @@ ethernet@6800000 {
>   			iommus = <&smmu_niso0 TEGRA234_SID_MGBE>;
>   			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_MGBEA>;
>   			status = "disabled";
> +
> +			snps,axi-config = <&mgbe0_axi_setup>;
> +
> +			mgbe0_axi_setup: stmmac-axi-config {
> +				snps,blen = <256 128 64 32>;
> +				snps,rd_osr_lmt = <63>;
> +				snps,wr_osr_lmt = <63>;
> +			};
>   		};
>   
>   		ethernet@6900000 {
> @@ -1495,6 +1503,14 @@ ethernet@6900000 {
>   			iommus = <&smmu_niso0 TEGRA234_SID_MGBE_VF1>;
>   			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_MGBEB>;
>   			status = "disabled";
> +
> +			snps,axi-config = <&mgbe1_axi_setup>;
> +
> +			mgbe1_axi_setup: stmmac-axi-config {
> +				snps,blen = <256 128 64 32>;
> +				snps,rd_osr_lmt = <63>;
> +				snps,wr_osr_lmt = <63>;
> +			};
>   		};
>   
>   		ethernet@6a00000 {
> @@ -1529,6 +1545,14 @@ ethernet@6a00000 {
>   			iommus = <&smmu_niso0 TEGRA234_SID_MGBE_VF2>;
>   			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_MGBEC>;
>   			status = "disabled";
> +
> +			snps,axi-config = <&mgbe2_axi_setup>;
> +
> +			mgbe2_axi_setup: stmmac-axi-config {
> +				snps,blen = <256 128 64 32>;
> +				snps,rd_osr_lmt = <63>;
> +				snps,wr_osr_lmt = <63>;
> +			};
>   		};
>   
>   		ethernet@6b00000 {

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Fixes the speed for me! Thanks!

Jon

-- 
nvpublic
