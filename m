Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA86C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Sep 2021 04:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2AF26108D
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Sep 2021 04:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhIHE6W (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Sep 2021 00:58:22 -0400
Received: from mail-dm6nam11on2060.outbound.protection.outlook.com ([40.107.223.60]:9205
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229523AbhIHE6V (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 8 Sep 2021 00:58:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWMYgKRyOqOvPNxYcXio3QAbOoC0+3VwCSqmjPIoCq+86wI9Kf8YTpqGHYDHQpd9jP9hELj7bcVNTtSGfgsEmgeGIyM7ws0fb2Gam2gn9f2j0oSsMMVtexKmRm/5sHGsr1ox4CAH+Sw+uFNHw1aSqrXcrnYXRXB3KSfkaStn0Qo9E9LjUyzIcsR/fSbdGMHHxWZgXqDMa/u41hETs7lE2/fJgF779NBkzuas52tZUliL4mOncqjwsxm895rcCz3b543p87AgonIrwQzGcu7DUxmjTeQekoCXt8gjEjZQmgElFMgk0TKvXU7OTAbTAgTMWL0dM399wQgU1j37cUJ2EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=N5sKspYojUfYxn8J11a+CcODWnO0gbynrZz7p9Dag7s=;
 b=QMsjIIrbId2pw3+9qA52DcW7hQZmbmVW1gBJ2n5jwdBsv1URveQyBdInWWQXUShoJo6mPd7zsykKLboUa++T+d7Wn0xJjAJ85w/VCvDlV04q/dNLm5Sa93r/sMN8F/AYnwm09Z8Gpgd/D39cZNCaajFqsEFniKKLTXcxyp4DGuf+XnA0LQjni2cAqhGOfsH7Sm5I3pRAU42VS/R+gWaPYsEMVUpQneoCO+wEmx7eQZkYCv3+liUbllwbwTVkA70+IFQvXVVt+g8rmFkRV75UsQzzVgMZZYV47HC1CZwDV7kj9NZeEB87Z4JAdtxPvg/7Y1Wiq9lwVFQ5idWmqhSYfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5sKspYojUfYxn8J11a+CcODWnO0gbynrZz7p9Dag7s=;
 b=B9E2vzfeCNFdz1y06iajO4RDfwQWxosKk5kz892oEMw3J6Ar/qTlzKvymz93DHSu24uWmhMfkaARqTGEDFQSU+JdFyjuHqVm0hIDT+iWRr+Gw70nEmc3J2YrfEf/fYSiFzmbXWAKNfa+OpSdWPCg9dx5X5dSdtVx4eAk3xYY5mN8Z00JOC+rPg1B8NbCLGvpUuS55gmOTBlgv2rZVyq/FqgbbXB3dMtUxCccXcEVqHASfZCiQiIE6aeS/vgKzOeZT8SggVeXslfoChiXUau7ysEKawYw87E7vs0kAcbPh8aH/7Iw9wgLLDop0WI95NZBRgLVGzns2Cn176hexK6e4g==
Received: from MW4P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::29)
 by CH0PR12MB5139.namprd12.prod.outlook.com (2603:10b6:610:be::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 8 Sep
 2021 04:57:12 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::b2) by MW4P220CA0024.outlook.office365.com
 (2603:10b6:303:115::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20 via Frontend
 Transport; Wed, 8 Sep 2021 04:57:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 04:57:12 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 8 Sep
 2021 04:57:11 +0000
Received: from [10.25.97.165] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 8 Sep
 2021 04:57:02 +0000
From:   Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 00/13] Extend AHUB audio support for Tegra210 and later
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
CC:     <sharadg@nvidia.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
Message-ID: <1f2e9f17-2c88-c72d-008c-07cba947db5e@nvidia.com>
Date:   Wed, 8 Sep 2021 10:26:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcb1d8bb-f278-4eb1-99b3-08d972851ef4
X-MS-TrafficTypeDiagnostic: CH0PR12MB5139:
X-Microsoft-Antispam-PRVS: <CH0PR12MB5139F49B7F9BB6892CEA8697A7D49@CH0PR12MB5139.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hqev6ut4pp0HU9Yy99FV7s7WlUFhpX/3ItGm8XVsnY2uHAW/crCRLjX4JTNZUulIucpCHJdxtpa4ephYXVGILFxd0LRLIAOX+lX88HFmJBQ9yv8gYeSWES/cYqzzaB6uY4ptEtSaveZddhCi5QJr9aKnfnEBtzGUKt7X0pFm5izbbaV5GfWJJ0nt+FrKUx/XOMU4jM6ft5/ZE+XjvUxp5ezisSBWSZJywnPY6UQxY80eIGIHpIrHTzaWpLeLUviGMKwO5UWBWbvRkLBF4v11KsV/ztNlk2Mx0LoLiJ+xl/pk+aBsMwMSYmjc3otPqCLNU4pdKcsCu15TSMn3eMLFhbD4lKxpBNprSkVa9Auq4F7jd6ZlTHKMgwNhSNeMyn35TTKBgjFCzh2VkWcksEbBZjBwCLZaqDA33/dOPo2PIQyhf4bB3jXjxGnNcFK5WhsbCJsibK6gxQvOXyLKFS7CEp2jl4e4AvZeZtDS4Ri51R2rBbx/OO9cpbBlLJEFF2QpZs1fA4/9xxgHWWBaqXizGp/ln2s7kPSLFKsD3j5W54+y7kVUtMUinG6SwEZXW0F0LlgSQawYBId2h04edqZMHmYD5kfWVE1TepjdnJMcySF8cfhx79c0LN1WnYb/k7/wHYZDKKt7/CcaWYhAT9oKlB8VcyxyZoxaz03/t/th3PR2QQ+6JS6X2BSPCpvGS4zAB9A9hFt1mgWk191w8QCjUFhG7398zbHOhViMv6AMCCO7XpmvFjwa48o7N64TsRiCaOLjWfyRma7l7xaSC9KOh4g9CIyzRggWFen4HfKkAKElpuxVTtigF0dqRh6XEIP5NKvNnLgJgfz788aU0oEv/5O1elNW4120J3d6S8D75Uw=
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966006)(36840700001)(31696002)(47076005)(966005)(86362001)(82740400003)(356005)(7636003)(36860700001)(16576012)(54906003)(110136005)(36906005)(4326008)(8676002)(31686004)(316002)(36756003)(16526019)(8936002)(5660300002)(186003)(70586007)(426003)(2906002)(70206006)(6666004)(53546011)(82310400003)(478600001)(7416002)(2616005)(336012)(921005)(26005)(21314003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 04:57:12.4149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb1d8bb-f278-4eb1-99b3-08d972851ef4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5139
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi All,

On 8/27/2021 3:03 PM, Sameer Pujar wrote:
> Earlier as part of series [0], support for ADMAIF and I/O modules (such
> as I2S, DMIC and DSPK) was added. This series aims at exposing some of
> the AHUB internal modules (listed below), which can be used for audio
> pre or post processing.
>
>    * SFC (Sampling Frequency Converter)
>    * MVC (Master Volume Control)
>    * AMX (Audio Multiplexer)
>    * ADX (Audio Demultiplexer)
>    * Mixer
>
> These modules can be plugged into audio paths and relevant processing
> can be done. The MUX routes are extended to allow add or remove above
> modules in the path via mixer controls. This is similar to how specific
> ADMAIF channels are connected to relevant I/O module instances at the
> moment.

> Some of these modules can alter PCM parameters. Consider example of
> resampler (44.1 -> 48 kHz) in the path.
>
>    aplay(44.1 kHz) -> ADMAIF -> SFC -> (48 kHz) I2S -> (48kHz) Codec
>
> The modules following SFC should be using converted sample rate and DAIs
> need to be configured accordingly. The audio-graph driver provides a
> mechanism to fixup the new parameters which can be specified in DT for a
> given DAI. Then core uses these new values via fixup callback and then
> pass it to respective DAIs hw_param() callback. The "convert-rate",
> described in [1], property can be used when there is rate conversion in
> the audio path. Similarly "convert-channels" can be used when there is
> channel conversion in the path. There is no "convert-xxx" property for
> sample size conversions. It can be added if necessary.

In above example, as we see the modules following SFC should be using 
converted PCM parameters (sample rate in above case). For this I am 
currently relying on DT properties ('convert-xxx') which is supported by 
audio-graph-card. This works fine for a static PCM configuration and may 
be fine to start with. But going ahead a more flexible configuration is 
preferred (without the need of a reboot). This came up during [0], but 
now with the introduction of processing modules in the path it becomes 
more important and would be nice to get this addressed.

Are there any mechanisms in place which can be leveraged to apply PCM 
configurations at runtime?
Or any directions/ideas we want to explore?
Any feedback or pointers will be of great help.


[0] https://lkml.org/lkml/2020/2/24/599


Thanks,
Sameer.
