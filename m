Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87AECD98FF
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Oct 2023 08:16:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbjJKIQA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Oct 2023 04:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbjJKIP6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Oct 2023 04:15:58 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D3BB8;
        Wed, 11 Oct 2023 01:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihq5BfJQYDuAaHoPUGc2hyIYWcTGLsCR3krFo8jkxdA/cqa0UuhX3KLBqOSCKCoNwqG0enZnXUF7VWKCPsdsTVuXw1J5wzpCSIqPVaDze3PgU2lmMBQX03pkInAM/PjJUKTV4blhPFvToCECGqGlz0Z4JNJ+JbRyivuUBfoMk4h37TeJL8XFINH5jgkIfl4SrJx6sqtWAnxUrUo4LbiCmo4R+X71qKwkitjhzdM7+1JB8TgsWbrxHZ+2mkgxhGp/opkNDuHHupS/y8oRHxAXagDesI8ki1Aee4EuvudTyezFLQ0hFE/pt8mSBE9mygtAUVhDTkvt5hBX39q/txITDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SfKkebFdJz4GvZMXz+2bpaV9NhVhsAvfWiDJ95NpHI=;
 b=JT6rd0xcH0HV1A/d7nDolvIZOGOi2zHyXi4T5CHPvqCow6il583qSwJrV3/PGHvY7qCxNSEGN2YIxPDt2grzFSz1kLwiecFtgK5tdb/pqqFKVcjqDDEtYlHP77n2SSzdmRnamxat+8NzJEYxSPA8/04RnzBefNvnB9rePfNcba9Ega4sYcqtIuLIlmsIZ/Qx4JbpU08eD7BcGItsVN9ApTPFQv6Ba3KymJ4p/5XwTl6xN5cGFBf25iYeYiuM/n2DXzLf/WgSI7ideW857eb0KCYY30c1TfjXn9nLZVBcO7nn2qzjROnp1iyGX1SC7TJ3C6a2Z/NWCpbBR72xqsV/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SfKkebFdJz4GvZMXz+2bpaV9NhVhsAvfWiDJ95NpHI=;
 b=idGQ74EmmrQOkyMLvsXxfEhop3hRC2BmBQUqLSnsj+WR5LXxYncMHoaQNLDwwnYuSKfaDWx9yQrwiv7Jh9HDenzycIE7IV8SvIkagMzehLV9biOlExwlgex9yuW02jFOaFV2mrZrfoXKXpwlY9AiA5XM99w1CtUd1n1j/EaHaybVSCMiBVPBXyCjd8qT9O+VGiFCRWNvx07rTVAEXrQ4yrV5VjKADY22CNIKxcmOlP47eIIB52bFIrc5bemu5PWVFhrW/0AmByQvMdaNndoWWybp0h6IGX4Ulcgyf7EUPXQIM0kGUMRWMMImaA8WLgio3MZ5wxR1OFD/PJNR0SRIWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM4PR12MB8570.namprd12.prod.outlook.com (2603:10b6:8:18b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.38; Wed, 11 Oct 2023 08:15:52 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::3356:8104:bbc3:69fc]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::3356:8104:bbc3:69fc%7]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 08:15:51 +0000
Message-ID: <dcd1d1b2-81fe-4d25-b1c4-cc3f89c44151@nvidia.com>
Date:   Wed, 11 Oct 2023 09:15:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 3/4] hwmon: ina3221: Add support for channel summation
 disable
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Ninad Malwade <nmalwade@nvidia.com>,
        Rajkumar Kasirajan <rkasirajan@nvidia.com>
References: <20230929103650.86074-1-jonathanh@nvidia.com>
 <20230929103650.86074-4-jonathanh@nvidia.com>
Content-Language: en-US
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230929103650.86074-4-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::13) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM4PR12MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: aa9b6259-dd70-476f-4cab-08dbca32481b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3kJYDL/ASOpM5OP8aahFEbwTw7IzHaT3aWqKpqZoI7sySYzGjjQuENDHxlDOV6qkQIdelQ5t4zNGrHtt63syJH2HCNxQL0Ln0V1ef/5ApGngjO7liPx8z6JHQ8LEGLAinocesPl3kUwSUFO3lei5uziz/RMArdqDJYj2dd0QOryrufp/bRui/ulHmDazGxaJaL189GiC74a4zMiR9KY28HvEU+wDtWKorhNiNt1I3CehgABEe+sKxULbw3wTjcvfZp2zI2ArhwTYBldvwWNlXYJ3dEj7jIm98PiRHiA5h4e2pIjVvASaRbrdvRSi/PEetFL9VFM52dHpMs4ZAZdozhKAkI2SF+r+yb2/fGkAqLOR/ExQChEUyaYuZfsXYHXmiVCE0D27yTO6Ek4PNPfnC2gYEY8be4ouQ/MqbAlI07Mc4m6ItO5r7HFvb3rCeLzH+9qwM2e6pUrqgYSPLSZ06ACmNqK+caesjz9i4mc41g9K6lUj26Go9ltDIV7kB2ocqwZo6G9NU5jt76IS/X60At03UXpdOGtLxMkA+xpiozy4FdB3gYneD8p3wfEC1rM1RnV29+ERzk1EyCq+2g7bzcStoWl+zPsAcyziRlHCjcNGhhThyL1YccTt862Gk4qd6/9ofa4psRiXKu4kfECSVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39860400002)(136003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(31686004)(6506007)(53546011)(107886003)(6512007)(36756003)(31696002)(86362001)(38100700002)(83380400001)(2906002)(2616005)(6486002)(6666004)(478600001)(4326008)(8676002)(8936002)(41300700001)(316002)(66946007)(66556008)(5660300002)(54906003)(110136005)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THRNcHFVNVE1SzhEa3ptK2FBejl5eG9EN0tFZ01oRVZ4Rld2bGlkNVM4SStm?=
 =?utf-8?B?R2VZNVNuUlhKQ0hNRVEvdHlpMGpXeUI3N0dNSEZORWZXNVpmVmdVOXQ2SEE2?=
 =?utf-8?B?MTFQck01NXYraXFGbmV2Tk53S1Q0WkVPSlNJdTZsUFViYm54K3F0TEg0UEtR?=
 =?utf-8?B?SnkrZjg3QlNZU01hY3NvbmdKdjM3b0p2QTh6OTZGQTBrMnc0UzI4RmRBWWVG?=
 =?utf-8?B?Z2syUDZrRUdVZ1ZjeldLdDY5ajNqQTg3UFo3RHl4aHBpNW5VNEtCNTRxYVFn?=
 =?utf-8?B?cHhLYjFqRjR0TFRDbGszVjZCVjl2bFZwTmxqZms0Z1FXdFNHcmdmM2Z4NEM2?=
 =?utf-8?B?bEJ6bnZnVnhjcVArNXh5aTJRUnVJRDhUSDZuTVdsNFdtblgzcGttYWNmdDNj?=
 =?utf-8?B?enFvUzJ2NzA0NmdWL0JreVJFWGZDOGFoR1lDRmxZWGlyb1JGenNIVUI1MUVm?=
 =?utf-8?B?OTRmMlBudFA0dVF2dFIxNlh3b0JRVjlyUVljcnhueHJERlF3MDE0WWpOWlQ4?=
 =?utf-8?B?NTBseDg0Q2lkMDc3Z0laa3pkNGE1SWVkVTdsMnNrVlkxQ0ttVy90d20yZWVw?=
 =?utf-8?B?VGVWczJhaldHanQxS0xXaVdaWFAwd1NKbU92MWdWc2l2azY4aldXWGFoNkg2?=
 =?utf-8?B?a3lLTmVFS1dBdkpuR1c3aG95QWlsdmFCbksvMWg2cllzWVJmOEc5S0tLdEpZ?=
 =?utf-8?B?VVR3Q2gzUFQvVEFQTGYxZXRYdnJrbEpjb0tQZXFObTFUUUpRNElWZFUzZlRX?=
 =?utf-8?B?TEh6QUhPZGZwVGpQZUU0dS9NdVhuTnJyMllteXFsR0xNMUlzUGk0eUFPMWZ0?=
 =?utf-8?B?Z1RwU3p0WU53NlpOTUdzb3NMdjFmOUFYWlhHdnNIVXcwNkg4MCs0M1ZZc1Z4?=
 =?utf-8?B?am45RWZNZURibmdNYnBEdW14bE1iYloyOHcvUy8yanliR25rQ28rdFNBRWtM?=
 =?utf-8?B?bDVnbDF0eXZYRWNsVjdabFY0RmVHbW85a3FFRDJrVmpNM0k5eCs1ZnVXa1FV?=
 =?utf-8?B?bkg2OFB0QXpHajV3QkFtQklrRXJDN2ZGUm1uV216cVkxYTE5dU1qZnNQN0xr?=
 =?utf-8?B?ZElhY2MzNEZnWVJudWhqMEtNU08vcUMxWDVJTHc0Z09vVWIzbS9xZmZtSnZ1?=
 =?utf-8?B?eEdXMldOU2szMVBoelNzKzErUGppQ0U1OFVRVHpnVzQ2eU53UFVocW1rUFcz?=
 =?utf-8?B?Zml1TXJyUzlTem4ySURxTCtIKzVxVGdROEw4Z08xR1g4a3E0eDJtOTlwbS9h?=
 =?utf-8?B?S1hZdzVMdkxGck95azlacjgwWVBTVVZldUlhdTdZbyt1VXphV3RvK2hGTWxD?=
 =?utf-8?B?Y0ozZTlabjYyeC9DY3QrUnNxdFR1R290Smg1WmN4Zm5ZNHZtYzBSUGdMRzdz?=
 =?utf-8?B?d1orblhkYUx2Y3J3K2lFMnp3bHVyMXcvaCtuc21tNTBMd2JUU291a1B1bzIz?=
 =?utf-8?B?T25Vb0w0MEtVenNyUTJPRy9LY2p4Q09Hc0VCb05YUmtzNVJTZkk1aldpMG9R?=
 =?utf-8?B?Y3VRT09FTnoyeE9nZHMvczYrZTdlMzVPSzlBQWhhQmpNK3FlT1VZQVhVRDRh?=
 =?utf-8?B?VTFVWGNUUkFjM3J1Y2JUd0NEOURmN1JpWEtqY0Z3VzFYR1NCWlcxOWxoUEdD?=
 =?utf-8?B?NWN6eXd5QncrMk1ES0cxL2wrWVFMNDdrTEgzemxCRWVIcHcyZklyVEFHSUh4?=
 =?utf-8?B?NVU3YnlpaENSdXdUMG1YWERUMDI2SHhCL3I5enpoZ2ZGclNZUWUreDJVWGxT?=
 =?utf-8?B?dVp4VWlBUVE2UnNnak1pYXNoMEtPakxzMUJCYUhJdDBVZmNaSzIyZmorVVlO?=
 =?utf-8?B?ank2cW9zREh3NFp2S0xBOWRBV2o5ZGEzRE0zT3lwTzF0YnVFV2FwZ0xqNllH?=
 =?utf-8?B?VFcrKzlPTGdVR2RWZ0JYb1d4ZlJkVE02MVpnUUtaOEF3dHlqajdpWUU4TkRJ?=
 =?utf-8?B?WEltaFhzcFl6YVYrZ3ByVkEyNVBxdnBrOHg5OHBMSzJ3cDBSTEZHMVA4OVgr?=
 =?utf-8?B?Yi9pSjAzN29CaFNDK09qZHJJK3E4SUI0T1JLVGVqTDZvdDZReXVta1dhbkkx?=
 =?utf-8?B?cFo2bEFNbFdXcy84QWMyUHhRNU1pc1FaOGpuSEFCVVRiZnZBOFRqNnQzMDJP?=
 =?utf-8?B?N1dobGJwRzVNM21XK2NUVkdxL3RtY0p5YmtMQmZsWDZSMGtjUEQzYk9ISUpm?=
 =?utf-8?Q?R5znWzhAjFmyuiaVB2y7JFxf+jOWd6OhM7Ise2xDkY3c?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9b6259-dd70-476f-4cab-08dbca32481b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 08:15:51.1478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTwqqw/51g++f2g74zzBEir1bNGzBbmWudD5ITIOFXCjISOOVvrpiyIwm88BsKuNctxNa33RepUIpMu/+Hfq5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8570
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Jean, Guenter,

On 29/09/2023 11:36, Jon Hunter wrote:
> From: Ninad Malwade <nmalwade@nvidia.com>
> 
> The INA3221 allows the Critical alert pin to be controlled by the
> summation control function. This function adds the single
> shunt-voltage conversions for the desired channels in order to compare
> the combined sum to the programmed limit. The Shunt-Voltage Sum Limit
> register contains the programmed value that is compared to the value in
> the Shunt-Voltage Sum register in order to determine if the total summed
> limit is exceeded. If the shunt-voltage sum limit value is exceeded, the
> Critical alert pin pulls low.
> 
> For the summation limit to have a meaningful value, we have to use the
> same shunt-resistor value on all included channels. Unless equal
> shunt-resistor values are used for each channel, the summation control
> function cannot be used and it is not enabled by the driver.
> 
> To address this, add support to disable the summation of specific
> channels via device tree property "ti,summation-disable". The channel
> which has this property would be excluded from the calculation of
> summation control function.
> 
> For example, summation control function calculates Shunt-Voltage Sum as:
> 
> - input_shunt_voltage_summation = input_shunt_voltage_channel1
>                                  + input_shunt_voltage_channel2
>                                  + input_shunt_voltage_channel3
> 
> If we want the summation to only use channel1 and channel3, we can add
> 'ti,summation-disable' property in device tree node for channel2. Then
> the calculation will skip channel2.
> 
> - input_shunt_voltage_summation = input_shunt_voltage_channel1
>                                  + input_shunt_voltage_channel3
> 
> Note that we only want the channel to be skipped for summation control
> function rather than completely disabled. Therefore, even if we add the
> property 'ti,summation-disable', the channel is still enabled and
> functional.
> 
> Finally, create debugfs entries that display if summation is disabled
> for each of the channels.
> 
> Signed-off-by: Rajkumar Kasirajan <rkasirajan@nvidia.com>
> Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
> Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>


Any feedback on this?

Thanks
Jon

-- 
nvpublic
