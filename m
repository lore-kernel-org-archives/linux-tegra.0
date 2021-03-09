Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F48C43381
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Mar 2021 16:29:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A88A6523A
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Mar 2021 16:29:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhCIQ2n (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 9 Mar 2021 11:28:43 -0500
Received: from mail-co1nam11on2078.outbound.protection.outlook.com ([40.107.220.78]:11425
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231133AbhCIQ2J (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 9 Mar 2021 11:28:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCOH9Z58T2vnIxYPh0vPTlKahfxQssmv73Kw0BqkL12c8J6W6NTQpsNoR690mEz8F5Prk+a19imXS2rJA4RHUZpHznaKN9M57+eMMfv7zZAsFg8OM4UZa6eDOb3CXO5eqvA2rLUG9x5JE8nrP895meAcbqEnYOWcNTIDtUgkuPBswXae478Au+c1gs2RnzLW6dCXd1gesL3VvhNwsOCCMqtZuI5MTZqJEskJQgs0S/hms9QjtIKaO7XgV60aruqtqPhpmwtNXsDX8j/ru4IgbWMl890RiIu57qhBiq6+YPWQChxtNzlC+OSzI99/qafaLPNfcYLEBJq8l5mOkJFA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUb7agQ/b3YANbi+op/EDUgvEdubyFwP6waHvCBXwug=;
 b=iK+pL0hYXe2nj+yfkdcIarOuCwyD57spH3czin1MqXQvB6lxsAJIaI182wcPr/Nab5AON7mIvctuJ64N2XD6JiC4glh+IdEt0grd1XlqNQXZpikqPQVZtzIrAEp+8ei0Md5AUq/PfuXhlvpXgzwba/944PmoCwH7EgY4yEoO/75wxHR3YnK2iFNU5N+nrDrSkIQMnfLoxF8aSCh00Fl/CPlEdySyc/65og0w4jTjMyGJHL1dh7d9BwyM0U3VyyYdh+QxT5n93jtkGUH1ok1ID+3s56PB76tWx5kNUBxLlVKT/zBuTgRd9TgN4wqh3tUCG5cA1mDTghUIhg+hEC3b6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUb7agQ/b3YANbi+op/EDUgvEdubyFwP6waHvCBXwug=;
 b=I8dx4YaXLl2MCDqrZIRorQZ0uRIlkIouFMahwt4bVLUPSQd1L8SYbpbuJZyC+kHFaozggywqDutR1xkCnkFLjLx9N5+U7ljlm68B2M4wTr9WqJiq/9ZVd3CZizl3IQTJ3viarhaMQasHGricrFy5qG0g29a+he6yMqnX1MZ4MWBp0LZgJ1mCkbNGS7oCtZdwWG9PcwWdlFU8FVzCdVUGijo88t3WmqsDazCzM3Lu+TEjhKO4p1YiSTQC6M3z7TYT5HqM+YT+vJ2aZ/4Yft8pw4MeFc70BGYvvbqPgeosyB2lRB7t+2Np4M/DsuP0UQllQxw+Vv5bfoycpH+tEW1NWA==
Received: from BN9PR03CA0925.namprd03.prod.outlook.com (2603:10b6:408:107::30)
 by DM6PR12MB3739.namprd12.prod.outlook.com (2603:10b6:5:1c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.28; Tue, 9 Mar
 2021 16:28:06 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::46) by BN9PR03CA0925.outlook.office365.com
 (2603:10b6:408:107::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 9 Mar 2021 16:28:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 16:28:05 +0000
Received: from [10.25.96.88] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 9 Mar
 2021 16:28:02 +0000
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
To:     Michael Walle <michael@walle.cc>
CC:     <alsa-devel@alsa-project.org>, <broonie@kernel.org>,
        <devicetree@vger.kernel.org>, <jonathanh@nvidia.com>,
        <kuninori.morimoto.gx@renesas.com>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <robh@kernel.org>,
        <sharadg@nvidia.com>, <thierry.reding@gmail.com>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
Date:   Tue, 9 Mar 2021 21:57:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210309144156.18887-1-michael@walle.cc>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b286a8f-7d2e-4c09-230c-08d8e3185199
X-MS-TrafficTypeDiagnostic: DM6PR12MB3739:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3739DBEA5143CAFA32416C1DA7929@DM6PR12MB3739.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BuMo92coRle1KTiufCbVYqKtXBH+fZqQsX6sPDvR3SShM3YoHLXHotIT/k1zeGF7VZHi+JjPjx2VmZujMQ3sjXVT2csd16gbiTTYmBOvF9Bokw5dgIi57lMaHDPJRKGjGNasD4HqDSm+M+EklWL37qCy+1KW0xNbmmBkmin73t0rgOPCbRwJGlaH7wRFNr2RoO+erexCHVtpUutGOEL6V6Nz84k7VAaGUnY7P4cMWmYDhSQtSIznoe2ei9EhFSTC857pxzwGb9pvIiCUOXoaz+1SN/IybphrtZyXoAOw8zmiZg+8G1Zbpy+/ddHsObBfUs+VRuKcON2eDSGIQTxZbOzqVqJd689vjCWqTt3okovUXqc5Zac6Bbt0XHQJ8duniReXMhH9zMd3KUeDdFVYXZO2CD/dEfuM6eWSAcGTFTovfjSZoq4wDJyB6j9kXxtSYM5dmhfKzGGwb9BV+D14+AWYa2zLdju8OEP5XCIWgrnB5fAkoa86hP8X/ZebXySHgvyps6W2avPYHf969sNKFVyW22YngjnW4YNAAJmuY39U0mVZ24p/HEjz0Tx80ODAfwy8TsLHn0vzX3EzLnO+SFsFIK9zHDXMwAjmIhADTq/HG9L7MpG497y2KNzE/zLTtKrFDIqa/LvqBmYOmVw9zV8HvYdcr68sd1udZ1sU2Btr9r/Cp6J3ZWcFXqOZlZE5EvQHd8jUSJ8Dw7V+0eyT4fMBDLJRjQbWANblQW0ybSfwqcW1Y8NvyRAQBhjERXH/
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966006)(36840700001)(478600001)(82740400003)(6916009)(31696002)(2906002)(34020700004)(356005)(86362001)(186003)(70586007)(36860700001)(70206006)(7636003)(4326008)(31686004)(16526019)(53546011)(83380400001)(8676002)(426003)(2616005)(16576012)(5660300002)(36906005)(316002)(36756003)(54906003)(82310400003)(6666004)(336012)(26005)(8936002)(47076005)(21314003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 16:28:05.8706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b286a8f-7d2e-4c09-230c-08d8e3185199
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3739
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Michael,

On 3/9/2021 8:11 PM, Michael Walle wrote:
> External email: Use caution opening links or attachments
>
>
> Hi,
>
>> If "clocks = <&xxx>" is specified from the CPU or Codec component
>> device node, the clock is not getting enabled. Thus audio playback
>> or capture fails.
>>
>> Fix this by populating "simple_dai->clk" field when clocks property
>> is specified from device node as well. Also tidy up by re-organising
>> conditional statements of parsing logic.
>>
>> Fixes: bb6fc620c2ed ("ASoC: simple-card-utils: add asoc_simple_card_parse_clk()")
>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> This actually breaks sound on my board
> (arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts).
> The codec on this board (wm8904) has a fixed clock input (only distinct
> frequencies are supported) and uses the FLL of the codec to generate the
> desired sample rate.
>
> It seems that after this patch the clock rate of the codecs clock (rather
> than the FLL) is tried to be changed. Which fails, because it doesn't
> support arbitrary frequencies.

Yes, after the given change the clock will be updated if "*mclk-fs" 
property is specified.

DT you mentioned has property "simple-audio-card,mclk-fs = <256>", which 
means you need a clock that is a function of sample rate. But as per 
above you want a fixed clock for MCLK. I think if you drop this 
property, the clock updates won't happen. Earlier for your case, this 
property was not used at all because the clock handle was not populated.

>
> -michael
>
>> ---
>>   sound/soc/generic/simple-card-utils.c | 13 ++++++-------
>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
>> index bc0b62e..0754d70 100644
>> --- a/sound/soc/generic/simple-card-utils.c
>> +++ b/sound/soc/generic/simple-card-utils.c
>> @@ -173,16 +173,15 @@ int asoc_simple_parse_clk(struct device *dev,
>>         *  or device's module clock.
>>         */
>>        clk = devm_get_clk_from_child(dev, node, NULL);
>> -     if (!IS_ERR(clk)) {
>> -             simple_dai->sysclk = clk_get_rate(clk);
>> +     if (IS_ERR(clk))
>> +             clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
>>
>> +     if (!IS_ERR(clk)) {
>>                simple_dai->clk = clk;
>> -     } else if (!of_property_read_u32(node, "system-clock-frequency", &val)) {
>> +             simple_dai->sysclk = clk_get_rate(clk);
>> +     } else if (!of_property_read_u32(node, "system-clock-frequency",
>> +                                      &val)) {
>>                simple_dai->sysclk = val;
>> -     } else {
>> -             clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
>> -             if (!IS_ERR(clk))
>> -                     simple_dai->sysclk = clk_get_rate(clk);
>>        }
>>
>>        if (of_property_read_bool(node, "system-clock-direction-out"))
>> --
>> 2.7.4
>>
>>

