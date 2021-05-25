Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B32CC2B9F8
	for <linux-tegra@archiver.kernel.org>; Tue, 25 May 2021 08:40:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BCAD6141B
	for <linux-tegra@archiver.kernel.org>; Tue, 25 May 2021 08:40:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhEYImE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 May 2021 04:42:04 -0400
Received: from mail-bn7nam10on2062.outbound.protection.outlook.com ([40.107.92.62]:12512
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230108AbhEYImE (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 May 2021 04:42:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOfzXlivrxcGNghm6sdL6tyDuFOc1TBXlRf+w0uVnHbsR5QYFed/d3UnGeI8ltyfL0mE2j1AsEmU+n6O8ea6Vu+5GFxmkfXOw5/z6H1oBzn02D4rfybDpeTH7tYz/d5Xulvp8vrlA6hcasBoQgHHOjatgDYwkyAxB01QicIvRkGtmWGmfP+OZyWDDWO32eKuC9e1IyFlBWrz2RPGopi+2VvIk1RkDflJ3XbS8jjDyeiFU8/wINqr9H88Jwa/EB7Gbkav6/2QGUMKpAedS0dJqUS3LZ8Lx5h3s2T8InevprBQAEs79HtQZkFjg3Ub5sXc0owysmRoWinkDCbxZH4W/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pyc5F7Fj8O+dV3DYFFUZN5sA8rdJ5gDq4gQrDEvmW24=;
 b=J9O2F6zLSmuUFiuDOn55IR7z4hz43hxZqEF3t14ioJ/9v2zgdNIWh8kcACtd6AmvSNhhwaadCfkLznwwHuFhj9WL/bHzh7Yn5DkDL3wrOm4ibrvvwHLnddNYcRHfYh2LbzpKG1dhs6XhoqEzzcT/7ktuewWQ8ThAYKQG2sSu5W+T2j8IuK38nFALMb9MKaM0QrzBaGF1PYGyNVe58eIps2RTp/MUt2tjMRM/whUJZfja4mp92VWAe4fpuL1IFWyXrF6xpPmTKOnuUTa2Iqlq54RtWxVXFD7Qdnhif05bYi80FaX8z+XtVCOJ0QMqy1XZm7Ikk/iEbdMLdv5jWPHsFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pyc5F7Fj8O+dV3DYFFUZN5sA8rdJ5gDq4gQrDEvmW24=;
 b=KBn8Qa2GPxayAC4hjSWT9X++uIKDvfQt8F69W+LWOPVdt4pqfDCmot9ba6pJ4mnEnXwmtdY6LyVvaNCd6Vo5OWeqFa28Q57kNzde7tkW30007JM4XYQY7t57p5tF2O2h4aMe/HkZakigm6qB2hcKb2UQIEgeUA/fqAHRXn3Ye43Z0fqD3aC1WiDW+TrFoO1p0oIMWE0IvtTOC9NrG6TCZbxekIIGUXQZuL9sUITZnNSpW6PiebwZQ0CMFOjk/Q9vWm/nJO8bKYfJicsVu2bWq8zFTbf5vZ1JZfNaep2v4qjUXSSlw60T5vJiTrd/sGPgKPwTQqSi92RYQgjyZfpS2A==
Received: from BN0PR03CA0047.namprd03.prod.outlook.com (2603:10b6:408:e7::22)
 by BYAPR12MB3272.namprd12.prod.outlook.com (2603:10b6:a03:131::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Tue, 25 May
 2021 08:40:31 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::81) by BN0PR03CA0047.outlook.office365.com
 (2603:10b6:408:e7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Tue, 25 May 2021 08:40:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 25 May 2021 08:40:31 +0000
Received: from [10.26.49.10] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 May
 2021 08:40:28 +0000
Subject: Re: [PATCH v3 4/4] ASoC: tegra: Specify components string for Nexus 7
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
CC:     <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20210523234437.25077-1-digetx@gmail.com>
 <20210523234437.25077-5-digetx@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <03775d09-f3ff-ff7a-626a-812163d6871d@nvidia.com>
Date:   Tue, 25 May 2021 09:40:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210523234437.25077-5-digetx@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e11b96e5-e72b-4b3f-e340-08d91f58c197
X-MS-TrafficTypeDiagnostic: BYAPR12MB3272:
X-Microsoft-Antispam-PRVS: <BYAPR12MB32724A425C9675189C4299B0D9259@BYAPR12MB3272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ypb5SjwC7MznWBT7Q57ZsgjHo74/7tMKsToHeUlTbqIEbqUIDe8Mgk1+BQ5oQ9n8etoWRB34evDqi4+fuiqGMsOCfa1ev/uiWyRyILw91Jf66PLnP0SkKzeFjhoxu2i8ngBOddFOLVU3J0F0JBhlTGqR4FkUNFURkd76tWNXtoymADTX7gF40CWESlyAZf04p9j/Dw+sNhT5lIhzud/NZY5VWQ+yJTTLMqzunMkl3ybsSH8r3L1/ILL75quAxFWLc7khqH4KP3wsm5J0lsSgfhe3jgh/DfgnJ+bxdFjO0fCWotUvSN3GegI+Z9IYKFxsWQAn85/kSuXtjjfZnRvN7vkrvbCEkwkbg6vl2s1mCybsVkATGy+2UnT5QFlaJoRkU+woks2aZfp/kpWu14/1kymbzN+zjyS3QJ5CXmZvigObFvVSdSU7x2O/laCsycjXc5LygkrFwYWmXzjNhDMPyBrZxqrFE/CyVLt4fcSSOCPajpYMO3HZoDeR2tAmnTAGGnrp/FsRZeLNqDGE1sy3HJ9hYNaoqftNa4uSWG/uVAxOsWzOK9oekwd2RxyGCgFv74kwhxW0m0Ff80lj4AElCz3aS6XLfzR7GlBX5ggBNeLZ0RBqzTUwHJa0ZqdlZz77rOgBU+MIz5s0sUlXceX8K6wqhWxjRsK09PRMQMDbZ6fmgcqas2MnSiQl2gFHL2a
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966006)(36840700001)(36860700001)(2906002)(426003)(82310400003)(31686004)(4326008)(5660300002)(53546011)(31696002)(2616005)(7416002)(36756003)(26005)(86362001)(8676002)(70206006)(336012)(16526019)(8936002)(7636003)(356005)(70586007)(82740400003)(110136005)(186003)(478600001)(36906005)(16576012)(316002)(47076005)(54906003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 08:40:31.3436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e11b96e5-e72b-4b3f-e340-08d91f58c197
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3272
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 24/05/2021 00:44, Dmitry Osipenko wrote:
> Specify components string for Nexus 7 using the Intel BayTrail components
> format. This may allow us to create a more generic UCM for RT5640 codec.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra_asoc_machine.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
> index a81f2ebfc00c..87e0a47040a5 100644
> --- a/sound/soc/tegra/tegra_asoc_machine.c
> +++ b/sound/soc/tegra/tegra_asoc_machine.c
> @@ -671,6 +671,24 @@ static const struct tegra_asoc_data tegra_rt5640_data = {
>  	.add_hp_jack = true,
>  };
>  
> +/*
> + * Speaker: Connected to SPO L/R P/N pins, stereo.
> + * Internal Microphone: Digital, connected to DMIC1_DAT IN2P/N pins.
> + * Headphones: Connected to HPOL/R pins.
> + * Headset Microphone: Unconnected.
> + *
> + * IF2_DAC/ADC are unpopulated.
> + */
> +static const struct tegra_asoc_data tegra_rt5640_grouper_data = {
> +	.components = "codec:rt5640 cfg-spk:2 cfg-mic:dmic1 aif:1",
> +	.mclk_rate = tegra_machine_mclk_rate_256,
> +	.card = &snd_soc_tegra_rt5640,
> +	.add_common_dapm_widgets = true,
> +	.add_common_controls = true,
> +	.add_common_snd_ops = true,
> +	.add_hp_jack = true,
> +};
> +
>  /* RT5632 machine */
>  
>  SND_SOC_DAILINK_DEFS(rt5632_hifi,
> @@ -712,6 +730,7 @@ static const struct of_device_id tegra_machine_of_match[] = {
>  	{ .compatible = "nvidia,tegra-audio-wm8753", .data = &tegra_wm8753_data },
>  	{ .compatible = "nvidia,tegra-audio-rt5677", .data = &tegra_rt5677_data },
>  	{ .compatible = "nvidia,tegra-audio-rt5640", .data = &tegra_rt5640_data },
> +	{ .compatible = "nvidia,tegra-audio-rt5640-grouper", .data = &tegra_rt5640_grouper_data },


Is there any harm always populating the components data for rt5640? I
did not see any existing UCM support for Tegra+rt5640 platforms in ALSA.

Jon

-- 
nvpublic
