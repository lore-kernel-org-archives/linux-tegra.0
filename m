Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F33C77B75
	for <linux-tegra@archiver.kernel.org>; Wed, 17 May 2023 11:59:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbjEQL7j (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 May 2023 07:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbjEQL7i (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 May 2023 07:59:38 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2067.outbound.protection.outlook.com [40.107.100.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49EC8194
        for <linux-tegra@vger.kernel.org>; Wed, 17 May 2023 04:59:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OquoSZMGYCASpojv9F8xiUOSTUpxDpa6Y8ir1yEgNelB/ZYz8vzJqZIzG4OiHDVSuunJndZy5th74O7iCdS16QUKlChuZ5hCCBeidEHexBfC2+zzPOKsO4P42B8ZSNk1h9Aees8jxglKAwc1M3iJ5Q9oWDiHvyFiqKrxd1L9gvu8E7INnCQM8dXcAJAgW6FalK1fFczql0dqk/U4GFPIVXJdpElfGrCrwwUzFgHhCWTBzsRyuNVxnZ5VWGfvNy6mEREUjirD+1zpjkPqm97D4obfHQ/bgzCc8JT9jXFK283Z4NyvTYZtiDTna9kBn016vM2vPLFQYCOy/G1j//ryeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODX/1aP5POvoG35q/x3xJEYoIFM7vMhUxRimHKms/34=;
 b=df9esC7yT7X05xqXUwDODKpI0mLFiLvBWUjwa+fP0UJnxTtMxeJcTIjvNju1FVX2Kj8rdBWkdTC2WuuWOVeac11w2SDRENOqnibMXKG4pk2Is8UhxqTOpZB74h9SHjcAwdzVQek4DIlomIy228Z2aUAzXkbq4JPFwTckuuKv/73e/0D4HK+xG/6955SGtJedCCs3SzPCyykBJJZiYVeZeklEsCABC0If5lDMty2HZPCkFolAzPNQK/wnbMnQrz7lT6MPOPCcAWzPDKFH/JiMz1fb7HH9UAD0UwReZZmmkLvaNTmRoOuCZCRRca7Z95ZuxxDvqEhFzOuBlEGXTwboIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODX/1aP5POvoG35q/x3xJEYoIFM7vMhUxRimHKms/34=;
 b=RiWeimhswFLGV8UeH5e9vWP9ch8E4cfKOGFxowIG+Ruv/ECJ9lAdVvQCuQA4nKEv5RU/Dht8uD2cAs+IHT5LH4N1/l+/Drj6OSsa9SWmgdUMi8kX/Tous1RD4DBaQ/yH5jBlz3OC3XVYfPxdecyrOv0SwLhGbfsnO2DVYDYMtTVborj/8cyPN7b+EXlVv7mxUpKQtC7HbSOh5+af9EcwbfF7eMtwwG+Qu7oZj1kr+yFYtFen4syo5+EqfIMP6fXME6FIs6kkiropzqFq+oSGdwJLvJM6iFumrKylwYvYX620eug9iopX40GFcJ9Rzt/rw8gNaqShako2nvY914pCbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW3PR12MB4380.namprd12.prod.outlook.com (2603:10b6:303:5a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.33; Wed, 17 May 2023 11:59:34 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8%4]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 11:59:34 +0000
Message-ID: <89583b89-ea8c-8096-b083-6ab773e6c281@nvidia.com>
Date:   Wed, 17 May 2023 12:59:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] phy: mediatek: Avoid floating point constants
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Guillaume Ranquet <granquet@baylibre.com>,
        linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20230419122131.2167122-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230419122131.2167122-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0046.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::34) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MW3PR12MB4380:EE_
X-MS-Office365-Filtering-Correlation-Id: 12c32696-a268-483c-3e3b-08db56ce2e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rf4t9yBD6xHDvQ4yCw4pipf4G2CsVOo4fc12huD3rqQM0Jlc5aDOpZo0axXDsR8rex4AyjXFnY8rIstcgQm/JqNrS0wmRjVI79MIugmZ+o8L3MbnrJXztWLLCXzAbd8/wcykSE3S2QTUCcpTjSh/lB5O1IYt6wr9P/0GTFES0d+VoTVQ3Grh03b0TE3rXOywyfYwzHF3XiAEwuvdcxUOOaGWHz5ykswMiYznYNJmKfUwluOj2NCuJsjcYTOCHXE84WnirDc2bbrexZ7kjbKATrFJOkFZirAl4QqMqgi7TR4QeDt9uh2OvRjcBoIEIxvDw/94BHRo0I3l3ZIDDe85OoUM35G1WgdWNrYSq+LK1pgI3IClVFaeu9bKFhDIAMjKAZXMcnzmvHudK78agetaUTEV/GS1llE0UL4QC8MTws7QPRN3e63iem7oW9tDu6U4q8TBe/LisUcxaP98PMxjZ2oL6254HhC/Fhq+j9+qR4W/9tMEQTRp1x/B4W83+jAYKGKI3CDBmmRowBOrldaa+fofheuiZrsGsx05JEb/hNUbKTtsAOyz1WCaiagcj1kqVVOCJTQRkSD0UWgIP3wJ7Eo5tIYSV1i/OA4n4uKAY5KPFIuzOB0Pl0Ri0wJy2w07wPsQyyq0k8q3WUkoL2LFZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(5660300002)(8676002)(8936002)(7416002)(54906003)(83380400001)(53546011)(31696002)(6506007)(6512007)(38100700002)(2616005)(186003)(41300700001)(478600001)(6486002)(110136005)(6666004)(66476007)(86362001)(66556008)(66946007)(4326008)(36756003)(316002)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THBGb2hUaER4T3EweVFHY0k2c3EzZFZTcHNUNWJvSkxIbml4Rll4cXh0VllL?=
 =?utf-8?B?WTFkWVh1NGgyVk10OTlXcWpIQWtJOUQ4dytQaDdDNjFiTHZIUXJVZlNpZDl2?=
 =?utf-8?B?dnU5aVAwOFZhUDZ2OGpaSk42SkhjZ2U4aDlGeWpXMWFCOEJjVVB0NFdZcU1V?=
 =?utf-8?B?bGJjdjJFTDlKTTNYQmNqbEFRYjZXL3RlZEp4MjNZb2QvN2g3NStPSWF0SXNR?=
 =?utf-8?B?WlozdUNiUDhrUlN3bUJRUGtLYXBiblZiWS8yTTY5ODNYT080OU9OSkhvUU1z?=
 =?utf-8?B?a1lSakxVWnpDZ1VpLzR0SU5QaVdIRHBjN042U0Vrc3hkY245R3dWcjdTZmJ2?=
 =?utf-8?B?Um9wcUpNTnNYclZtczRWTm1UUGJQWXJkWWNNMjRISjhTS0gyeitobUsyalFJ?=
 =?utf-8?B?QVM3Zjl2MVZRcHhjZFN3WjU1NGdMcEZOT0FZK0l1Vys4TWl6ZisrTmJ6ZXpZ?=
 =?utf-8?B?Vk4vOEdlb2ZZMGFDeHA4WkxWb0FKTHdpQTNhUGtQZVNOMThUQTU5WXpKYUtn?=
 =?utf-8?B?Rk9YaFhVcTVKVVExaTQ5MnlJeXlkVHlJZlFaODcwa3k1ZzhwVzBoUTEzWGdZ?=
 =?utf-8?B?M2FWMTNnbjVvQTNUVWI4clBFbHpiekhQZUVtRGtDbVVBTSt2dnV5SEhldm5O?=
 =?utf-8?B?RDdYYitEYnRZRnZ3MFp0RDhsK3RNb1N2dWRBRTdhdlBFTGNmSnpBV1U3NzN4?=
 =?utf-8?B?UnNHaHV5eGJzM0pMdCsvd3lCalh6SzBkaUEvK0lwa2JldDNLSDh4S2xXdE16?=
 =?utf-8?B?Ynk5L1BudTVsK003Z00xZVFIMjFPUnIvQkovelFtMDZuZzlUVXp0K0tBV3Zu?=
 =?utf-8?B?R2Q4V29UNXdkdFgvQUtNa0RzRFY4V1NZc0dLUEZjN2RQVUlZYno1OTJnMlBr?=
 =?utf-8?B?WlZ2SVpmRTMwTTlxQXowN0lXTzJMbmlvOWV3VUhwTXU2WEVzUlpqcWhwRi9N?=
 =?utf-8?B?dXFBbDJnZmw1OTY5M251T0s1MUZaMUlFY3dVcTJENlpQclJPUFp0ZXA0dHdj?=
 =?utf-8?B?OUNkM20vZ2gxVnVpVjIyNkJselEvWnprTlhRdzNiWHJBL3A3TlgzdXNzS2Va?=
 =?utf-8?B?RnVBVy80Zk5vTXcwRFI2OUlpVmh0UlJHckpsMFpDRDdMVFU2aWtZVEVTOEMr?=
 =?utf-8?B?ZWI3bUkrNlMyV1psVVFiMHE2dVdpSUtha2xaUWZsd09lbWtjYzZsZ3JoTXdp?=
 =?utf-8?B?Nng3WDdOdk9pSEU2ckF2TUJqSExwZGhiUGh1bUZ0ekpHV3o4R2NpYjNFRXdC?=
 =?utf-8?B?VkF6VlovSWNkbHJReE94d1pwQkV3bGVySXRGUG5sM1NWeDhNayt6dVoxMDhs?=
 =?utf-8?B?cHdLYTg5czUvY1ZZZ053cXlWMU5RaUFucFdkcHZZTG9lKzdESi9laDZHVmRH?=
 =?utf-8?B?cW5DYXRnT3N6eXBzQVN0UHh4OE1ZNWtNQnZPTjhvdEU0RTVHNmllc0pBak9D?=
 =?utf-8?B?b01GWnRvSWpESkVnZTYrd29nN0h0a281dFJHZ2YveStSN1RHZkFaT3lsYzVK?=
 =?utf-8?B?ZUNZcWtFOFFzMWNQcmtqTDRmMGFMSkRWb3JNTnNyeE9PeFBLUmFUbjUvb1ZE?=
 =?utf-8?B?TWVja1BKUWYybFFPYndIcDBidTlueWRQbDIwNkNiRXYxb2ZoMTdWaWNhV2Y5?=
 =?utf-8?B?cHF0VU1IY3FjNWsxaHYwVjJjeFNSamdyS2h1clBHMHp1SElBUlpMUnltWGlt?=
 =?utf-8?B?dkRBNndQdHdsK1h4bnVXcFlDdE1aZ1FCS0tKWVYzZ083RmJiYWNtclJUQVpH?=
 =?utf-8?B?RXhaRzJFRUFDeG9Md2UvNnlaNTFOUVFvYk1FWE5EM3l5OWQwZ1Y0UmtjVFpo?=
 =?utf-8?B?Sm5iRVJFOUdQZEY5ZVFyUFVVN2V3UFlVbzRaOVJwamRYOWJQQkRkT1dwQ2FZ?=
 =?utf-8?B?eWlVZDM3cFBxVkV2Q3YySHc5emdKM2F4c3lQSytrcVoxTUFjNDVldkdhOWUw?=
 =?utf-8?B?bTBCMjY5NFphdEgxcm4zR29RUHpMSU9Jb05VajcyMjJIUzF4ZmNLbFRQUkVQ?=
 =?utf-8?B?M0F1bGJrSjBUWi8yTkk3VjN2a1NuMFI4REpxZWluR2hZckM0V2pWOVdKNHh3?=
 =?utf-8?B?Z0JJdFpoOWJqV1IxK2RJR0Qrb1BUMHMwME42UjlUUmxaRitDODdNMUxjN29n?=
 =?utf-8?B?MlZqOGJmWUpUS0oxSXFaTjhQY0dmSjU2N1B3Y1pmQU01SmZaRDk0TUk5UE5K?=
 =?utf-8?B?c0pQTkp6NFhjWE43NkY3Z1h1WU1BRWhURk0xTkJMMW93V2dqellnc2lDaVUz?=
 =?utf-8?B?TEhWbDFNNVVGTDVmMHQ1WDBqUVJ3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c32696-a268-483c-3e3b-08db56ce2e54
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 11:59:34.6485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbpXjV2icruE/RLyaHS8OsdbgfIyzfBpSo8zHsGTLIBNy9Z4esjahaoVudtAtUCdNs7kMa8KYew8usBnLzH3hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4380
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Vinod,

On 19/04/2023 13:21, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> When building with old versions of GCC (6.3 in this case), the compiler
> stumbles over the floating point constants in this driver:
> 
> 	: In function ‘mtk_hdmi_pll_prepare’:
> 	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:331:23: error: ‘-mgeneral-regs-only’ is incompatible with floating-point code
> 	  } else if (pixel_clk >= 74.175 * MEGA && pixel_clk <= 300 * MEGA) {
> 
> 	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:361:12: error: ‘-mgeneral-regs-only’ is incompatible with floating-point code
> 	 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
> 		    ^~~~~~~~~~~~~~~~~~~~
> 	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:361:12: error: ‘-mgeneral-regs-only’ is incompatible with floating-point code
> 
> Fix this by switching to the KILO macro instead and multiplying the
> constants by 1000 to get rid of the floating point.
> 
> Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> index abfc077fb0a8..b10af26cad2f 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -239,9 +239,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>   		txposdiv = 8;
>   	else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)
>   		txposdiv = 4;
> -	else if (tmds_clk >= 148.35 * MEGA && tmds_clk < 296.7 * MEGA)
> +	else if (tmds_clk >= 148350 * KILO && tmds_clk < 296700 * KILO)
>   		txposdiv = 2;
> -	else if (tmds_clk >= 296.7 * MEGA && tmds_clk <= 594 * MEGA)
> +	else if (tmds_clk >= 296700 * KILO && tmds_clk <= 594 * MEGA)
>   		txposdiv = 1;
>   	else
>   		return -EINVAL;
> @@ -328,12 +328,12 @@ static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
>   		clk_channel_bias = 0x34; /* 20mA */
>   		impedance_en = 0xf;
>   		impedance = 0x36; /* 100ohm */
> -	} else if (pixel_clk >= 74.175 * MEGA && pixel_clk <= 300 * MEGA) {
> +	} else if (pixel_clk >= 74175 * KILO && pixel_clk <= 300 * MEGA) {
>   		data_channel_bias = 0x34; /* 20mA */
>   		clk_channel_bias = 0x2c; /* 16mA */
>   		impedance_en = 0xf;
>   		impedance = 0x36; /* 100ohm */
> -	} else if (pixel_clk >= 27 * MEGA && pixel_clk < 74.175 * MEGA) {
> +	} else if (pixel_clk >= 27 * MEGA && pixel_clk < 74175 * KILO) {
>   		data_channel_bias = 0x14; /* 10mA */
>   		clk_channel_bias = 0x14; /* 10mA */
>   		impedance_en = 0x0;


This is breaking kernel compilation with older compilers such as GCC7. 
This is now in the mainline and older compilers cannot build the kernel 
with this driver enabled. The kernel docs say the min version supported 
is GCC 5.1 currently.

Can we get this merged as a fix for v6.4?

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
