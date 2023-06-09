Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0794C8300C
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 11:05:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238265AbjFILFU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 07:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239241AbjFILE5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 07:04:57 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6465C210C
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 04:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRNK1dtwTyaS/f38/mZnSw4M0s8DS1ohx0h/sQG2Zo16jPr8WNUR7r3cNKri+ZP9v8QYxB5yD+Ebr398pQabRv+8os2JGxlm9me2KThiwGvvgjlEKlEgr7jF4Z+oAfPRIi6YQAcEVVeb7l2Uk1JIB7I1vP4DARWBIvLRih5npN96B+yEsE/yMrmg3Dsopsg5g09mhy9YXCFWDSNk+WtkvVtrU2cMuvflOq5N69xCnZRvkffMX1KS6lGaJQanx1gMyDcnlkZpILDO4zvinihfnvGmD/ZpY+e5yFKfCq+rROiAb0kLS4vS169TSW3m4g7EYftO5DLj7HeG695YhbDD9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUX9BmiA8LJ5fHs4rsqMGcMVgase4Tl8NzG+p9Pwm/w=;
 b=nhZ0JsvNuQ3fPrwSqWFlPSqj37S6SNO2UZfCUfqZXSDdLan3u67TKnAGlQwkWv5g0WEFy7gbWV5ouUKC1V9OfqnVKM7MhUKWt6ZSNWV6oawdCmgnur3y50t42rfX+PAgO6rlGcrAakCUImix5uzLlNZgvizHTnBh9DTr7y17nA6LhqTG+CoOvOcz83B8lYdV5GGNKHJZnnKByFjAaaE9oFWPo2EFm7s7PkJnZFwHZcT462NGX2pxOTofhhNk5zvyKCf36lmPCOaeOjolXlqC1MC1BOQbVINypGjhrQ3hWSU5n1CGT8ll1z3SgXdKFKCnrXVMC2Xqm9VfVeSBlIOZNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUX9BmiA8LJ5fHs4rsqMGcMVgase4Tl8NzG+p9Pwm/w=;
 b=oweKqmr/EQ09K0Nx9p+FnT5NzHKjBYpJTU+0LeHI6IaHzB83hKbgXPLGi3js5n2Ok+KEQoLO1IvAJzmPvTmrsrLs0lwcwj/BX4n5LVN6OWWcBC8P4+yLAIqpgNgy7GPKHl8JyAKa6Zmb2iC+XFQwi28xPlAPlJmkOse+r1S4QrZgFkBPymGnBqNwTMVtVeWedbcCSGdlEYu1usV7aMan4knu2hkrV7EOAmPX6wSLlnempzA6b1gHeVbUTEcPYwuwm8IKqM1lDZpYMYEbVB4gcb0Rse6aYA3fvH0txHoZv2GTWfcCQPGRjgy0+4mc5H3VhIhpX4OoylhdTHFaQ2gc/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SJ2PR12MB8883.namprd12.prod.outlook.com (2603:10b6:a03:538::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 11:04:54 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8%4]) with mapi id 15.20.6455.037; Fri, 9 Jun 2023
 11:04:54 +0000
Message-ID: <72055af5-ceff-fa64-6437-37056318c976@nvidia.com>
Date:   Fri, 9 Jun 2023 12:04:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] arm64: tegra: Add a few blank lines for better
 readability
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Shubhi Garg <shgarg@nvidia.com>, linux-tegra@vger.kernel.org
References: <20230609105543.3730161-1-thierry.reding@gmail.com>
 <20230609105543.3730161-2-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230609105543.3730161-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0058.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::9) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SJ2PR12MB8883:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b085db2-7b07-491e-5d49-08db68d95ab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S3MVzWbkrtnRzYuFot74AYY1mK70n+PVlBrTF+DyGVEf2p66rHfjTMm+YDmOJJC0EwFC/oCBKgRNmcBZSymtl/y79mec6v1rb2mwTGrI4F/Xv0k7CsVfu+nBMuyiEC8Zv8R6aBN75of2BKqHhnKXNplpxS8s56pzXqZP7xmc3D9ncK7iwEjvNZuUZc5uPUMRuBs37rkm85hHJNdynMdiKKgHXPO8bZhZiOyKpVsiLGfbgQ95WhWlscLDBCNKKTz6gT/MnxpYx5BNJu2RxvMiwxOToAAVnwcVJmhjaNbdgEn+fcjZUOHGObUX1YkesBu+P/ipW1z3dvSQVXZukVuC8+72g3UPa/IYAAurEc6l34nITcoEKmxWYa7SD00VgyffxCklxhpiztUypb7oKFSh5xpVnsMpGlkgEa66jvt3CovJgGj417pusDPyMVwxWt3Rstua/ExR2/Dnm78uq0GLDZg7zLqRivK9cOyRLrtrqfmHe/wfmcGCK2STLeWX4309gd4M++2iw4RFVvO2PlVNYeiZcGS29SyD9REafJRgJZp2Ha6zjdOCD9a+HTVMZoBTJHaZFNU/gfbaor02/FiFxj9SDjiQOYvlXS5DL8UOt3P8pg9wKIZDdTS/V6nj9J5bX2bVVHHzrN5CpwHaH4QwOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199021)(31686004)(6512007)(5660300002)(186003)(41300700001)(6506007)(53546011)(36756003)(2616005)(4326008)(66476007)(66556008)(6666004)(8936002)(66946007)(478600001)(31696002)(6916009)(86362001)(316002)(6486002)(2906002)(8676002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG5VWStYWUFBRm85Wm1neHcyK25tN1hPNE15SnlOdW1BZVFZRGJTckdLdTVU?=
 =?utf-8?B?SkZybzhkYVNmczdULzZMR29lY043NjA3VjZUcHNGczNEWWl3TThCN0d4RU1F?=
 =?utf-8?B?WXdTV2V4cHNVTUduaXZBZTRDbmhOMEtHY0pRa0U5R3NuS3ZLclNHMnJZUU8z?=
 =?utf-8?B?K3pTeEI2NnhEWEFhVFB2VEhIdVNHb3liK0dFWXcwVjJqbExpS3E4VUxxNEtG?=
 =?utf-8?B?anh4SHlhcjhDUUhuUDFYZ2g2RVJGTnl3eFl1OGIxK0NINjdyckI4R2Y5VGxN?=
 =?utf-8?B?RmhxSEUrYzY3MGJnZVlyOElENk5LaWpmdTU1cjFDQUh2RWhMMjRQYUNLSXFj?=
 =?utf-8?B?bDAwVjlnN21rbjdEZFVveTJZc0dIT2lGeW9MNG9GU1ZJazl3bHJQWmpKakFE?=
 =?utf-8?B?blBoaTFqMTI4UWlDZW05Z3pPTE80bGZraUpOL0RmMG90aVcxSjBKVWZkTXNh?=
 =?utf-8?B?eGZoUGUwMHBvK1l2d0F6c3RuUWZVM1RqNlM3NWdYR3E5RHlkQXFIRnlvcHN1?=
 =?utf-8?B?ODYxQWsrTSt3ZzhtQzdZTUZ5Zys1LzA1enR5ZjU3SmR6VXhVTjhabHIzZ3Fp?=
 =?utf-8?B?NXhpSGZqZnAzeXNpblZPdkNsRnhEc3Awd01iTExYVnZzQmVLdGdtSmcyN0dV?=
 =?utf-8?B?MUVML3BEcTQ4bVBORGpPRWtYTDExSTFIUWZObkdscU5zQ1FyRnI4MFM0SXVE?=
 =?utf-8?B?am04dUtvWjU5Z1prQ2I5VWwyN1dtQ3NMYjMwc1dpaEI0dUJLM3QvekJYeGdR?=
 =?utf-8?B?MjZJTWExYU1UVEoyQ01WR0JDSlB0L1Q1YUU5Z0FHdVJoM2JaZERxc3FCcHlj?=
 =?utf-8?B?VGhld0V3d3A5VUk3eVJWeUUzQkdwZkxDbDNjN21CdkpwQS94YnNlUHdvd0pt?=
 =?utf-8?B?WHhwMk1wRWpLWkc1TGZOSkRsZXpjOFVMdDN2aUFiOUtSSFVzSzZaczZscTJ4?=
 =?utf-8?B?SEJQYUQwc0NmMVBybnI5NG5Bb244NGFMZzVaakxiK1hqRmNYTE03MFFrODFw?=
 =?utf-8?B?OFI4SDB0ZG5DU1lqMHJXalBwR2RnSVZubzdQWnE1NTFVMktyaTJEbnVwMllS?=
 =?utf-8?B?M1hUc25FeHYwZ1IrOU9BL3VidFZud3hIQ1ZkTlc4V1RVZDI2YUM0cHllc1Rj?=
 =?utf-8?B?ZU5IM1dvMjVqOElWNzNHbGZNV1dWRjRGaVpJdFlUY0s0MmIwbG8zeG95NERa?=
 =?utf-8?B?dUpOTjlpZ2d5ME1yTEZZeHFYb3lJeDI2bGtWeHJCVWVmVkRLUVpkeHgvaUNl?=
 =?utf-8?B?RUc5dkNtaHR2M0ZnZFRpQytCOXVZY0J5V0l1M0JRWUszZFFlQURzZVdySi9J?=
 =?utf-8?B?ZnJ2eFNQYmZ5QXo4WWpoSmd5ZnNFdkFqTHdmVzkxWmJoRkM2bDRzL2lBcEVV?=
 =?utf-8?B?d2JnWjdmVU5IT05URXFHYkFZTFdDd1RWNUVLZUVqZDBxVFFYNHBBdVp3K0pk?=
 =?utf-8?B?VzBzMTJ4dUF1THhMWGl6MThYOEtweFJmYnQ1Zi9qVzZnWjJsQmdvakdUN2hy?=
 =?utf-8?B?UlN6Nm9mcHYxNS9JYzdKWTFDTmxUdFJEOVQrb2swd0xpc2dLRVpxUEJSMmQ1?=
 =?utf-8?B?TjViVzVGWmVFQ0dXWSt1aDRKbTdZbkdlbktjTjkxSzg2SlBRbyswWnFhRDZ5?=
 =?utf-8?B?ZEdJc0lPODRQYnVlYkV6N3JuWHV1R0cyS3d2NHNPbFVocnR5Ukh4UmtLU2l1?=
 =?utf-8?B?bDlvalI0aEN3UmMxckd2RnZESHYvYjhlcHBsNnp5d3FtWTBsZWw0dE5QSmVr?=
 =?utf-8?B?L3lpeW5heWhTMjBTQ1VxR3o3a3E2Y0JYTjBsb3c2L0tlRVlpbTBmMnorU2FD?=
 =?utf-8?B?bGV5bnFkYXE5UmFBMUZ2NHNTS3doMm5SVjdOdXFRMkYwYy9sbkFYdkxnby9E?=
 =?utf-8?B?WFlwSmxOcCt6cldpaVdsOTZOQUxPbXpFWmM1Vk5NcHR0ak1URENjeUdvd2Iw?=
 =?utf-8?B?VEM0UlpFZmdCRFdqS29xajVnT040blZMVWZOenAyTlQzMllUc3N1b0MrTnNU?=
 =?utf-8?B?NjVPZ0xRcnpHU2xDNG5Wbk5NOU81MzZjbkExYTRTTTI3ckZDRmlJTUI0MXBp?=
 =?utf-8?B?ekZzandkaU1CMnlBbCtrYVJsL1ZnUnZyVEV2bzZlaS9wUy8rcW8vMGhFS3NJ?=
 =?utf-8?B?eXg2M2F1NjlzQllXM2xFY3ZkUUlRTTFkbVc1eERQWmpaWkRsb3A2ZzdKaVg0?=
 =?utf-8?B?NktwVmI5WWdmRUwxV29VMC9wdEhUU3lUK3RuU0YrZmxrTFBNSWxGY29ZNy9P?=
 =?utf-8?B?em5KbG1ZT1RCbEtJbS9lWnpsWHlBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b085db2-7b07-491e-5d49-08db68d95ab4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 11:04:54.4036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95SFqiz+I2e8kywQIpbLXBblvQ57DuWO9u2fmCDoQ0mvYPl7tuO/5eIED6Rv/CERkX+Y5Cfmp4X0RHbrD4lHow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8883
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 09/06/2023 11:55, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Surround device tree nodes with blank lines for increased readability.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   .../boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> index e499010fc673..5f3d6dcf10a2 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> @@ -2247,6 +2247,7 @@ TEGRA234_AON_GPIO(AA, 4)
>   
>   		i2c@c240000 {
>   			status = "okay";
> +
>   			typec@8 {
>   				compatible = "cypress,cypd4226";
>   				reg = <0x08>;
> @@ -2254,22 +2255,27 @@ typec@8 {
>   				interrupts = <TEGRA234_MAIN_GPIO(Y, 4) IRQ_TYPE_LEVEL_LOW>;
>   				firmware-name = "nvidia,jetson-agx-xavier";
>   				status = "okay";
> +
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> +
>   				ccg_typec_con0: connector@0 {
>   					compatible = "usb-c-connector";
>   					reg = <0>;
>   					label = "USB-C";
>   					data-role = "host";
> +
>   					ports {
>   						#address-cells = <1>;
>   						#size-cells = <0>;
> +
>   						port@0 {
>   							reg = <0>;
>   							hs_ucsi_ccg_p0: endpoint {
>   								remote-endpoint = <&hs_typec_p0>;
>   							};
>   						};
> +
>   						port@1 {
>   							reg = <1>;
>   							ss_ucsi_ccg_p0: endpoint {
> @@ -2278,20 +2284,24 @@ ss_ucsi_ccg_p0: endpoint {
>   						};
>   					};
>   				};
> +
>   				ccg_typec_con1: connector@1 {
>   					compatible = "usb-c-connector";
>   					reg = <1>;
>   					label = "USB-C";
>   					data-role = "dual";
> +
>   					ports {
>   						#address-cells = <1>;
>   						#size-cells = <0>;
> +
>   						port@0 {
>   							reg = <0>;
>   							hs_ucsi_ccg_p1: endpoint {
>   								remote-endpoint = <&hs_typec_p1>;
>   							};
>   						};
> +
>   						port@1 {
>   							reg = <1>;
>   							ss_ucsi_ccg_p1: endpoint {


Acked-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic
