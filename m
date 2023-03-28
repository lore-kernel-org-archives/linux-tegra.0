Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10960C76196
	for <linux-tegra@archiver.kernel.org>; Tue, 28 Mar 2023 15:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbjC1P0D (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 28 Mar 2023 11:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233158AbjC1PZs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Mar 2023 11:25:48 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925C3FF00;
        Tue, 28 Mar 2023 08:24:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZpYSLBhbEhxCPmhfOZbxFdWtpJoznrz56d9THMHjzy4pUFPLmjNmXaux0a6U5dwziNp5PtG1sCYQs/qlf9T7REvUvfRNQi8GVeVbsP+6g2C8Z3ET62TH/3yo5+buqzfYHX0UmzC38VMS8wksK/pAHAPnaC4YNLlsrGozWw3Hv17iD9HbiQxYpw2yMDLwaOFXvVWGa4GOF70k1oSaog3lPW4rEHfS0pMec6G+HlIqPKBl4y0ie+uONw9XmCURzsjQiK46oZqxxk64ayUiYpb8J+FUEwepCWDNeYZ8GROkzq7979ZQAYg/fXyHJMsu/7echZTpzoRtAZ4Nw894pstxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EfJgFb+MwvigHm+lTZ+PGuiHXFZRq3X76pWqSGXN7A=;
 b=GBzyA13hgUWjz+yTZRhslMUwikuzpLbhJF9JWPVfjp7Bw7CxmE5yVG3OWQ4q+CaAebGTPZK6k8R9Ue46xbVNC6pjYodhdS1XqLstdzsAyT+DV7C5l/NMhb1fpzQZNW9sk+LLSg9rQsEoIAbvvmC9+ag6UXjr3zWZTLrKczFHv6cJrrF6eNTWSr1D0L4vKFJr3tOQBgEDH+tlgRDAEJfAbgRh6Kdx3dn0oKdmP6GDzxphW2vlBjxSL4/TImOnUZ6jrvhBD7nU1Dh/b335f6kbSpA4B3kXceOYXYBBX7fNbs4TTEtAzdbY8oQra/PLa5J2Idw9FEes1ht1mI8zQQAraQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EfJgFb+MwvigHm+lTZ+PGuiHXFZRq3X76pWqSGXN7A=;
 b=P7isUqMpJzhEB4JQ/70Ys9/ZMTr2FFfMo5HJzld8VRFjJZ2pbI+0Or6Yp9GWkNlBN8HOr/t9Xi75UB+LdCiAKVtEkrUKSpWlen0XK62R8v8wqmnM0aVEhL544Yx54oWkpjCQFIqep8GC4/WuCrK8ih7e+R1Ebl7la8w6ljUqPWTK5L3bGabNY0If8QC2uhVGk2cgCYCDUwfF1N1QTGbs9WzBJNP48xslsqpdJFyF1h04fRtHsJlO8HfZC12k7g+z6ebHCJhX360JTiUZtOmkhZY7vvF8X2cNfeTqnW314jm0Wcn1kasNDyJ9ZNJNbIYcIhWRhqGvdopRWdpbSgfX6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 LV2PR12MB5965.namprd12.prod.outlook.com (2603:10b6:408:172::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 15:23:42 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::abe1:c2f2:c4bb:ba78]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::abe1:c2f2:c4bb:ba78%2]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 15:23:39 +0000
Message-ID: <fb0fe429-7e70-eeea-fa4c-f77b24591efa@nvidia.com>
Date:   Tue, 28 Mar 2023 16:23:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/4] arm64: tegra: Add support for P3768+P3767
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230302093353.3873247-1-thierry.reding@gmail.com>
 <20230302093353.3873247-4-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230302093353.3873247-4-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0500.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::19) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|LV2PR12MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cda8fb8-e96a-4a6e-c604-08db2fa06805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WqqUNeYUfXNpr1wZbJX4BniWUXeJCJ+vJ8nvFPdoDwuRhFPXBh/+SclXiak3Ow3DVZKGzuYeshxiW1kbNKVzg9rBgeSSNNASK7EM+w6qWzZrxN8TLVAlLTdPc/hot/R4vIcgbbOIsU2dqCIAO+vtnRajT7x2t/F3aNS1bs096Pa+0PVj0IA6C+Q5NDzJ2x6Zi5vTcNzvD8KcOzWEnPkZDqe9BaNlpf9WURLtRCl0HwgOrtXvaZI7tY4D6Mbm5N6TAvvT7UYgCiXii5On/eDgtw/lmGYpjPRIXP/Fi4lp7bol2TrO2ZsL+F+J6gf5wSDaTGrxKyGeXpcZA6Knl///afAd+2yUXB767PVFEzQFf5z0NtlKtde9J4MWB4T1qVynLw32+yLAQS0Bm7InmWHE89DqYMbDJC09wJL42C5e+tkD6lLM5i+qVt6lhvQDBOJhu0MrX41yGlwSAe6If8tlegetJdxlUl2T5gRhgOe2+fGFC16KYrTfPmXzKWhPV5yv+9HFX08znCONGawszoAH+N8WTnJAfthUpnDtxBPYPyO5DkpnFskxLwFfhgTrV9cg4Kk2O63YJTK8wIRB/3Auw/lWA/X81HEElaG8cHD/GDpNQzehZ4D66/Xn9zuqZ9roI4OSjxGDoH4vHMg1xuMjxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199021)(2906002)(38100700002)(4326008)(41300700001)(8936002)(5660300002)(31696002)(86362001)(36756003)(6916009)(31686004)(478600001)(316002)(6666004)(6486002)(26005)(55236004)(53546011)(6506007)(6512007)(83380400001)(2616005)(66946007)(66556008)(66476007)(8676002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFhieUxzZFhoWURWMnY0dit2NFdyQmJ1aGkzR2RVbUFiblJWTm1yUjdIVk4x?=
 =?utf-8?B?MFRNWG9maW4wU2hIV3Q3bGN2TXlJRi9aQ0dPYzJOMGFFK1RiZmxVR1JxQVMy?=
 =?utf-8?B?dGFGcEVPR2lmVGtaYjg1SEFqejZkNFhIeVcvRVdOS01KZFRUQmg3eld4WDVU?=
 =?utf-8?B?RHBWeDdIZGVvaGRPcXlIYUVpRkJKNURrNTM1YklHK2tDZ1N4ekpTNm0yQUta?=
 =?utf-8?B?a0tjV01iS0EwWnJaaVNqdzNwU0xsSkdKVittTVZCMUZDNXhoWUJObUFXVkFz?=
 =?utf-8?B?SEN0OVB3L1dkVGpOemxqcDY3TkhFT3RUbXNQTGtBNnZrYjVnVUs3NTE4SUV4?=
 =?utf-8?B?RXVaV2hqTVhCVU1scisyK29rRXh2N2wyRC9vMGhXdnBJandkY3BaWGRJUUhW?=
 =?utf-8?B?RXVoRzN2ellVTlNsWjBTSG96Y2pSY3J2RmU5Nko3Tkk3UGFTNGt1WWFPVEZv?=
 =?utf-8?B?TjY0ckhtRG1ydzZneDQyRUZySVJPbzc3TUhoYWdZU2lCT2JaNDg0SHg5Z094?=
 =?utf-8?B?SituRjZGTU1zZWttRlVwbE41ZHM1RWY4cUxvVGg2ZC9CeUc4MUJvWlU3M3A3?=
 =?utf-8?B?aUh1UWx3QkdMN1ZTMXlJdlJBblpJTWtsZzJPVGxGVlhqbm9uZjJYYXlKNFJD?=
 =?utf-8?B?dWxwbG4xdVZpWi94aVVyQWxNNFdNN1k1NU5JL2tEOWJEVkRoTGFpSjVPVzV2?=
 =?utf-8?B?Z0dPdm1GK0ttMG5sK05CYUxpN2IweU1RYlBlMU9ieDhFS2NOZzZuOU1kcXJt?=
 =?utf-8?B?dFV3VzI1M1ZzQkRHRmNaVXk0WFVVRzRsU0lBZDNKSENPUE5FZzY0NmcybGdl?=
 =?utf-8?B?NVVxUW5nMllRcTVpellmTFllYmduTVNIYlMya1VBZmthY3prcndKNmhzd09S?=
 =?utf-8?B?ZVVNU0s0R1hXYWF3TWxHa2d0ZXhwaDRYeGxwbm9tNFYxbVQyd0V0emJ2a29q?=
 =?utf-8?B?ZzRZY0JQT01RdXUvOHFmNjRabUJhYVZObmtRNkxzODNweGs5c0lPZTNROGM1?=
 =?utf-8?B?QnJOc3lSNFVDTTg5eEpQL2NlR0xTemEycWNjdVdyV0ltc2FVdEtlUktXVEFa?=
 =?utf-8?B?TVkzS01SSWl0TTRQM2VlYmM4WTk1YkFmMkcxd3lzdlFDRUlSczg4UWluUFFv?=
 =?utf-8?B?MHpVUzdnaytqNFB2cFcxVlRuWnBPb1RmMnBtZENVVVdPS09zbW0weVdVaU5k?=
 =?utf-8?B?YStieEs5dWFaOEx3MWQwZ25ndjlOZHhtWE9uaUdiaE85VU5uNjRMSzc5YkdH?=
 =?utf-8?B?UThSblVRcGt0aTFUZXYvMmJsSlJ3dmN1UExiOWlXUWhpNkVPRDVRSmhTYmJ3?=
 =?utf-8?B?WVRHL1NBUWNJd1A1ZEkwSHZLampOa1JtUW9Pc0ZxdnB6ZXVKUmNSbWNmeTQ3?=
 =?utf-8?B?VlRrdG8vNjh4T0FWR2NFOGxPREIrRlhmZCtxbWtqVVpLTFZaMVk3RTRyeC96?=
 =?utf-8?B?Ri9ZSTVHZ3QrSTdjZU9CV2ltZ1dJSHN4UHBRU0xTK20xWDVXOXU2TTR5cmtX?=
 =?utf-8?B?c1JLcHNpa0JrZDR3RmwxL3dLSVRIRkZhVTlWcW5IUEJSTmRwQUc5Qi80S0pt?=
 =?utf-8?B?MEZJL2RLbkIrU1llcUlqV2ZDbTJNN1l3eUw4eWF2anh5cytqbi9rYXUzNTNC?=
 =?utf-8?B?MFlmSjBXNGZIeUdtNlloalZ6aGZ0VlM4amQvRHd3akFaY0NrQ3ZrYVFlUERu?=
 =?utf-8?B?OXlBTW1TZXdpQlJkbUZpS25ISU1rWFhCeUFlQ2hEblZXckFocDRxSWcwQzVC?=
 =?utf-8?B?ckZwRjR2ME5MWWc2eWNqNENpcTFpTFZmRDBpcVRuZ3E4a3hnWXZTZjJ2RTdK?=
 =?utf-8?B?YTVOYXdlQ0lZY0E5NmFWWWJ3K1hQT0piajlDNkY3dzRqNjJMNjdkN0NodFFz?=
 =?utf-8?B?VUJreEh5dmw2NDJhNk1LRUhZbDQzWXdWU3cvQVAwVlUvMWY5ZUR5REJXNlda?=
 =?utf-8?B?Zm9GQW9Fd0RyS3YzcHhRWU5GcVE2Nkk4RWRNaUEzYjVaTURXZld4SWdsRk1h?=
 =?utf-8?B?dys0SHVIWjRQU2VVWDAxK2JHYStQdXJiVWFmTUczdkt5bmdIZ2tWZUNlK1JD?=
 =?utf-8?B?ZjlBRFJkNit3cXR6Rjk1UFA2OUVZbVp0NFZZenh5Rm1tQWx4ajhWcjF5THBu?=
 =?utf-8?Q?6QhEP5lRQeWjcAUjBotZDhprL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cda8fb8-e96a-4a6e-c604-08db2fa06805
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 15:23:39.2971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zz6VFG4xdZhvm+SlJKTePvPRNmWQNTXa6EmXKgYCPxLr4trkWwvM4JPVmb0Cn44l7d5A8Dt0fBEQ54RQH8k4Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5965
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 02/03/2023 09:33, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add support for the combination of the NVIDIA Jetson Orin NX (P3767)
> module and the P3768 carrier board.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   .../nvidia/tegra234-p3768-0000+p3767-0000.dts | 218 ++++++++++++++++++
>   .../boot/dts/nvidia/tegra234-p3768-0000.dtsi  | 133 +++++++++++
>   2 files changed, 351 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
>   create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi

...

> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
> new file mode 100644
> index 000000000000..3ccb17be17fb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/ {
> +	compatible = "nvidia,p3768-0000";
> +
> +	bus@0 {
> +		i2c@3160000 {
> +			status = "okay";
> +
> +			eeprom@56 {
> +				compatible = "atmel,24c02";
> +				reg = <0x56>;
> +
> +				label = "system";
> +				vcc-supply = <&vdd_1v8_sys>;
> +				address-width = <8>;
> +				pagesize = <8>;
> +				size = <256>;
> +				read-only;
> +			};
> +		};


On the board I have, this eeprom appears to be location at address 0x57 
and not 0x56. Can you confirm 0x56 works for you? If so, I wonder if 
there is a board revision issue here?

Thanks
Jon

-- 
nvpublic
