Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F73C00A5A
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 12:16:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjASMQG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 07:16:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbjASMQF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 07:16:05 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C1ED59B6E;
        Thu, 19 Jan 2023 04:16:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9Exz2wrECpgraNE84W89z0iB6WslXOLXXTccBpJrpm5sPvwMaFwmkhFeDM/ItUBvoBEZvayzgzqYYDvKHPx4UhTS+QQ3zslAaCxALPXdJr73h+m2f+uGGOt4PIyJMxIXZquJoruI7XgUea3PcdfIVZPQU8ahTs9weAFF/1o2Ib0WlX54WGUmRJEPTb1Z615Wx9l0n0qWraDA5/vCw12FONEulkyb3Qs100xUezrKu+ET/JE9X1BtnmMW1wiNG9B48008YvK0CjUN7bMwD47/jeEh1IgazugtYfQucaMAnHHA9MZBvhiK7mhNV7gYJF5dGyTUY/8dueSqSUkLXzO+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rPeKoK3BE35WPtLN7wouyAabPAn2gfWSYUhMT4fVdc=;
 b=d6T88xMQeOy4HwEA958skPkO05LmzsQMksfEIIOSPgOKuG9ltq5/y84IQi0AudetPhnWV5pyn4QBoEDKwRR5fCdI+l6GgEPH155Uu7vxGbytFsCY5PmBRpy10uOEl8N6LMDdJ6OUFQTULd4rGfW1Urz2VpaP1pd2jDD52B+z5nmZu1OMZsaW3NGVEKGfgOW7DJpr2IPX87M/yue5dfTU0lw77UTFJwRKoddygQ1cDgQD4Le/llKgSObnrLIoUv4uycmSzkLm0NHB6FrrErzNE5964K18qjawOv/+ccgm1zV1bBg+y2DCarKPzMIE1DdevRFLK0gWh91hQk45QvPVzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rPeKoK3BE35WPtLN7wouyAabPAn2gfWSYUhMT4fVdc=;
 b=C4e9ZKLZpVaLjEZBg3bHFT4+qUQtVEysPFUQ4OnsOfD0m3aOAs6tJJ1X3qxnhI505NulD6go06uQComKVMjuR6U6il4l6BFR2cXOtIWez/U/v79OqkbpSwqAWXUPZbkgyO0wGV8S3vVgowXkX1zPO8NUdT0aZhWsACUX19+MZW8p2NucrI6prSnQ+SYh+vw/oZSEEQxH9B0mRATAlbglnhqq0c+6uGZ2+ZKPDqHoJt7w298v4DGOjiR4Gb5ZAwQrXBPN5TriBFmbOeVQ7y+/Zy8Dzc/kHH9NWVkjFEaAdl3sCbAD4xYzDKxvdd5MzFB5xdmKgpStrNFbxyhKvlPPpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM4PR12MB5724.namprd12.prod.outlook.com (2603:10b6:8:5f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.25; Thu, 19 Jan 2023 12:16:02 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%7]) with mapi id 15.20.6002.013; Thu, 19 Jan 2023
 12:16:02 +0000
Message-ID: <9122d01d-9c21-74a9-5a42-1b110aeb7ccc@nvidia.com>
Date:   Thu, 19 Jan 2023 12:11:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V5 5/6] usb: typec: ucsi_ccg: Remove ccgx,firmware-build
 property
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230119111741.33901-1-jonathanh@nvidia.com>
 <20230119111741.33901-6-jonathanh@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230119111741.33901-6-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0164.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::13) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM4PR12MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d0f788-a174-40d0-b257-08dafa16ee22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c0DntFSYLI6k2gX9ScfZH4sv+kMDce5dLfhqs/4fgVs+l9q31hBl7wLs55LPYVuLOTijxDRIBqS9OfSzL2qpAeyt3K+8HIVr4lGuO2NYbDNtFkqKu4D6NMcQei319O0r8Rf54UTclGsrJIMGJRvmXNqOuD7vr1v7Yjo4B55+IhrrAFHkwOrrUXxuUtfHdpGdtoYhUIvMuKOs1l8LaB0x1hV9n8caFYjWO9/LeIt+54YOG6P5PZZ+UGi2zsjV39vrqz4K2NAdBa3w5eG9Sa1dGxIRBPkoepb13ld+tpUuyRJ6t8fHYRZdhC1b3TZilHiDmfUk0nG58pqTHppQTEAXsCjxty5U7mwvDuy57CYViF019KGFYWliv+xPrWdAtNnCxGpgpHTbpYWatAeIdbfCz0XkoHet1fNer6P7gufiYTbUe0rzetxwh7CvkMIOGuAXD2t8euhSUQRMOh+bUv8qJiO9uFj1pCpHLhnqlgmmUIRbBL4QcCW34MuneYvf0xK6f6unin05KL113U7uJlpGrVsQkAyB/WgtWk2CBEgCocy+UyDqLtk70ZvO1WCLfTKPvwJGlegmr64FeDTuUk/r05NTnEIF5br6LbvjVdYsQz8Br00fZrszNpG+P8vu/YNQ3BgJX9RHKiRIxh769gOnuAHUvLDbL7kDPinQ63UhX3RUwRWCvHfBLUNNmxVpRhVhauVNcy4PHiHa0v6BiBcpeJE6el2MRSW8f20yEI51Jd0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199015)(31686004)(86362001)(31696002)(5660300002)(41300700001)(8936002)(38100700002)(36756003)(26005)(6512007)(6486002)(478600001)(110136005)(83380400001)(53546011)(6506007)(186003)(55236004)(6666004)(107886003)(8676002)(316002)(4326008)(66946007)(66476007)(66556008)(2616005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cklpdzBQMzZ4bmFuL3E0VnVTc1pnSkczSk9BNFlucmZKaFlpWXRTd1VwZG5F?=
 =?utf-8?B?U3JwaHZXSGNwTUFBWi9MTFlXWDJ6VHFZL1M4QWJ0WUtNeWtKdWZQSUJZell6?=
 =?utf-8?B?RTdEa0o3bHlDYVUzTlowYkx6dlY5MkgweTFSTUhJckZhSVRZR0w5RFNJRFV0?=
 =?utf-8?B?M0s0NGhHeVFiSkZ3MXNITkYxMlRZcjZoRGR6N1FFenV4SlVBUUt4MzR3MG92?=
 =?utf-8?B?a1pSRndvd252VXY4bzgyZndvamFMK0lSN2tvenlmSEhjMjNpS1dvTVR6QWVi?=
 =?utf-8?B?bE05dWhVR1lEblc0a2pVRTFlLzFSWWdGR2ZFZmxpMTVheGhPRzJ2ZFlGUWtI?=
 =?utf-8?B?RlhBZUVaMks5SzRRblZpSnExT09TRWhkVjI4SkhUK0pCWjJBbCtnNDlkNHBy?=
 =?utf-8?B?Ti8rS25tblJPTVVub2RWNmJTQzhwWWlmTGlLRTE0cElQSk9XTXpURExLMzdO?=
 =?utf-8?B?ZlIvZkRHNmx6SnE2YU5MT0RzaG9pYkFjNFlHdXE0SDc3YmJVVDJ0bTdSa1pm?=
 =?utf-8?B?V1BySEs1TWZMZkJVSnpQWUh4MlJjdHRpUmdLdXBaWkhHT2M4eWdtS2xxOWJC?=
 =?utf-8?B?SE90dU9DdXVtT3g4c0RJczQvRytGZjlvMTZGVTFIZnBOWHVNME96bDBFcUlH?=
 =?utf-8?B?cHd1OUxPRnBaVTl2QVMrQ2N4OUcwc3lyblExcUNoUDdXYU1RdGJYVFVhR0FJ?=
 =?utf-8?B?YjZJeitOT01WMTh6alpaQm5wM1IwUnh0YXprcEFnRWUzNUlqbUdMWVZaUEtm?=
 =?utf-8?B?YnF2c015NHU5NnBnbmdPZEpQcnhMNEptbDJ5TUpHNW1SR2RjMWpYNUN5QlRz?=
 =?utf-8?B?RHNOUkN4VmErY3locFM1bWdUa3NhYWtrcEljQ2EzTlFhSGVRTTI4TUVsdzF0?=
 =?utf-8?B?cXU5YXRzMGlKQ25tbmQ2RXM3bUdVcFV1QzJsM0hpRGdGOE9YOXJvMCtJcjcx?=
 =?utf-8?B?dUZSRDdnTU8zbnBGSmhHZWxFNVFaSTlnNXlUU24zRnBiSzZKVzg4RDFXZkZ6?=
 =?utf-8?B?UHRMR2I3aklPMCt3MUhCbnJuSFV6V1NKR1ZWL3RjNHc4aGZuSUo4VkpQMkQz?=
 =?utf-8?B?RHBQemtYU3oxd0NlUDdOYmpMVmdiZ3BxTEJEV2ZtcUZLVFo0Vm4wNWJxVllo?=
 =?utf-8?B?Vjh0MVFkaHNBTml5YTlWdjVhNWVMOVNGRmk0dER4QW9EVjFGUlZTdzAwdDE0?=
 =?utf-8?B?UXArMFZyUDNDa094c0lsSm92OUhOYk5CV2tYbG9QWFpuYVZ5OWQrMmhSZlgr?=
 =?utf-8?B?U1dsVWtrVUpyUXg5VmVOQWs1bjRBY0pFUHNRamZ5MWZDNUl5ME1QQWhMOWhS?=
 =?utf-8?B?TE9naklJWXpVWWJORmlFRHg0VmFpd0FYUm5ra1VPUy8wekdkK2FrL1lDaDN4?=
 =?utf-8?B?bnFUNzNyMEhSL0NwcktzU296SForQUdoZHlTQ2VXQUhJNGVYd1Q0YW1JLzlD?=
 =?utf-8?B?OWlHVm9rcnczQzBPSHFIbVFjWEVPM3R2dkRuQld1QXJGMk1OSVp5cEc2dVhs?=
 =?utf-8?B?NllPcndYclBwS2JTVll4cFc4QlZYZUREZmRlYlVxaFRIanpSZ1RqdHdzaXo0?=
 =?utf-8?B?QzZzaUdPVHVmcEZVNmluOGp0ODRYOXR1YmR5dllXdUN3V3JUTlBLM2xpY2sy?=
 =?utf-8?B?NU5XTVFxdmFicjVtelEvZm1JM1o3MUd6QmFYSDVoN2g4VHd1ek1zWmJQWlha?=
 =?utf-8?B?Q3JBQ0FiMHhLelIybXdDVm5nUFZIMDBXU2tadmxZNkhDcGRqTzU5NEZjNGp4?=
 =?utf-8?B?anlaR0ExSWI5YnR4UGdDVXY5YzNhQi8xK0c3UmdxV2c0dXdXT0pDS3NTTXpt?=
 =?utf-8?B?L3BDd1dtR2tXeGJick1yVlJqTDEwVE1rcFJqSlNvUGUzWHpUQ3RtVEo1SWhj?=
 =?utf-8?B?WnhxajFkUi9LMmNCam5BMmc3eStSYW9rSVc3QTBuVkJTNTV2WlVEcHJaUnls?=
 =?utf-8?B?dFNUUUZUaTNXOUMvcU04Wm01eHhUdU9GaGdIdlRzT0tOMTlJRnJPYXBFRHFO?=
 =?utf-8?B?azRmaFdtRXFiRWNjbkJTVjVSMDAwb21xUHNDNmtBT09UT0M4VDZVV2xHNzRM?=
 =?utf-8?B?RUM5OExEbU55aVl2S0tPN2dFb1oxRG0yclVKNWYzTEFkRFF2OHE2Qm9QbDFN?=
 =?utf-8?B?K01TQUcyRFZQV3dqWlVJOVFzR2RlY1BRbmx2SGFFV0Nsc2kvZTUxbFplRW1l?=
 =?utf-8?B?K3c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d0f788-a174-40d0-b257-08dafa16ee22
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 12:16:02.0946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qpr3a0qsznpB9mN2ghZfr7moU2Zq3s1/sqRsaMs79F2QEo/gr4X7ihkYU3RW/JDS4bhQ6POo64BeiHBghLuExw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5724
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 19/01/2023 11:17, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Remove the property 'ccgx,firmware-build' now we have migrated devices
> to using the 'firmware-name' property.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V5: Added this patch from V3
> 
>   drivers/usb/typec/ucsi/ucsi_ccg.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 889a831e251d..0f18b32df8e6 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1358,16 +1358,13 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>   	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
>   
>   	/* Only fail FW flashing when FW build information is not provided */
> -	status = device_property_read_u16(dev, "ccgx,firmware-build",
> -					  &uc->fw_build);
> -	if (status) {
> -		status = device_property_read_string(dev, "firmware-name",
> -						     &fw_name);
> -		if (!status) {
> -			if (!strcmp(fw_name, "nvidia,jetson-agx-xavier"))
> -				uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
> -			else if (!strcmp(fw_name, "nvidia,gpu"))
> -				uc->fw_build = CCG_FW_BUILD_NVIDIA;
> +	status = device_property_read_string(dev, "firmware-name",
> +					     &fw_name);
> +	if (!status) {
> +		if (!strcmp(fw_name, "nvidia,jetson-agx-xavier"))
> +			uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
> +		else if (!strcmp(fw_name, "nvidia,gpu"))
> +			uc->fw_build = CCG_FW_BUILD_NVIDIA;
>   		}

The above } should have been removed as well. Not a good start to the 
day ...

>   	}
>   

-- 
nvpublic
