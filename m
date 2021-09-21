Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D1DC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 15:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C51E6120A
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 15:15:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233860AbhIUPQ4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 11:16:56 -0400
Received: from mail-bn8nam12on2080.outbound.protection.outlook.com ([40.107.237.80]:48608
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231196AbhIUPQ4 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 11:16:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEu54gcXC2yLvrRAX4hMF/pnzkjCaOxI4hJWuArn7vJg6xcagb0RBUmKy5rFywN6s5nQ6pAq7reFjLnetTfBdCHwfyswin0Nh4zbUulnG0uhhNoalxZ332DT8YsbhjKnKDtwMmXg/5+dKXO5mKFE5M+6PKXHpox+sXRR9pR+jGJOHkHvJaCSVkmLD3Li9PMINmIuI758c+Lma+jDxave2oJEm1c/FjM/5M3W8jCmxviJXuC8HNgFQWSufdOJGGMNP/KWMJx3BX/evHJRgpX0TlqRF7JF3++tq+/SCD3ujTgIdxhSpn3Mev8WlED9RoGKbTyI5eN1mMhfzFLIXFTffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=PhUi1BLjRHVW/76m5bY5U6mtnEieAIP94M3dndJDR60=;
 b=ZoXaT0SHHvGfQRnZbMCc1DNoX2syodIaNw4jMGx/j6kONGPRcr/1uddqs89qZ3+zZFQc3SWvBtgdLTKu703yF/VsaU8Bu+/0GsTxSGkCRnvPnKzQfxCjiWb1rlQpOvPLijgKhxu1lk76UyddG83Eg+E/d8tVXfORbA0TeLtFVRs4uHvgwBJLTZzxX84FGSwiyWNiJQaaEhvA8lUZYQ16fuAekqgLdDjNXxXGP6GArGapWWS6ZLzP48uNE6LCNAz/JL9hIyk33xUfCosT0aTZ8+UJBtZQvCBdup5LzAOb8rnVoo6iUagkJoZBxxOixZ1341Fc2XCzg5CQyL2bHeD6QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhUi1BLjRHVW/76m5bY5U6mtnEieAIP94M3dndJDR60=;
 b=kd5Q2G4C0noZt51+Pwv2AKSEN0NC9fOKOcK5YhhZQBgSS+TgtMdcBn+oUJ8qS4bD9dqVvytkV+T1zAo9lodbrn4NCibOL3c1Yv74hrezLetLbVMa96jFK14bVX9gAgOWs53lFk3h6km+dst7bc4UpYYGbFbSAB0JRz/i9L6glVj5KcIH8zleX5+NuToHdmhDJNlDyxdvHTR6SmwEoDtA3hLnVE5mHAOg6ZnGMHpt7mtuT239HthLYEEieMyGx86mJO8DugsuRDhQo/tRi1fIPvZXrtNG9C6Z2TDjWWDdWJNbz52JkvsLmzwHSDKiqJTPHTqXTuMU5udo/9CW9FE26w==
Received: from BN9PR03CA0751.namprd03.prod.outlook.com (2603:10b6:408:13a::6)
 by BL0PR12MB2404.namprd12.prod.outlook.com (2603:10b6:207:4c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Tue, 21 Sep
 2021 15:15:26 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::62) by BN9PR03CA0751.outlook.office365.com
 (2603:10b6:408:13a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Tue, 21 Sep 2021 15:15:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 15:15:26 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 15:15:16 +0000
Received: from [10.25.97.151] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 15:15:13 +0000
Subject: Re: [PATCH v3 2/3] ASoC: Use schema reference for sound-name-prefix
To:     Rob Herring <robh+dt@kernel.org>
CC:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
 <1630686919-19495-3-git-send-email-spujar@nvidia.com>
 <CAL_JsqJbbDiOAr5-3_JwVMWxdkeGRoPYZuc_8fHp_iGEvH7AWA@mail.gmail.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <e2d8aede-94b1-2658-a465-5f67795c5725@nvidia.com>
Date:   Tue, 21 Sep 2021 20:45:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJbbDiOAr5-3_JwVMWxdkeGRoPYZuc_8fHp_iGEvH7AWA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 967289c6-fa10-4381-2685-08d97d12a405
X-MS-TrafficTypeDiagnostic: BL0PR12MB2404:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2404A79FB7E86495FF9C71F2A7A19@BL0PR12MB2404.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cLe5Kiy1aewtzAcoyqYCeFkZ4tVlvh21TopV/AJjQOwt2Xh67LfD8zXMYgYRaZ/2RhCLe+XBrhZZWAQA3zYGN2iAYBFBKqGlGey/VQSZacFbxkyiSGwgcFiftMw4tz/3JIhEYut6HSUxBdK+GCbPkia2earmAoaiiJGwyI18kg8UngWm+wTqPWXWpFOT1JblCP7mDVEWaPzXhnhdj/wmzBI89sjytBNsNeNDdk0GZyH2yTEdbF2yDPDmkgTxW8M+/sLFpkiImQGbPV6RZVTz+gVMDnPkny5ijPyKKv84VOEa96riWnUncZuG3t17aRcFvpkFEhr0rZ8GIe6venjheUe82jlfFIw9Cw1fSLgkbrpRl/EzQlWquoq5aIZO5CKJ9OFCCmqOGogIxkCkbADUJTgb9FmLrygS9ATKIJbfK/17k2sb7/Xz1Wl2Cx2322oBcRc7FPotc5AOiBCTvsPU/d2q9hp8r4XfOzn2zpkFX8XaveeKifEuZ6s6S6dszj6m4FvrpMztlbcVVjxgHiPUbHuKruicGxT84iWdNiZSpwWDs4RUjkvvwISwH480T+zMSVraJYFIPpS3RJry6OdtSDkHTMbew7b1tlRt5Nsbu3gfymKRSXlowYXfJ3uVcQZ75DJso2D1ArmTL4VcIL2Pq03rDrBA+4OQ7JBc9p6SVyRVv8HNnToMuErxdk8HKqI26Hc+RA1tSOyFDOHsRDgrQoordj8zm3btDYIXgCmINxw=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(36860700001)(83380400001)(8676002)(82310400003)(86362001)(54906003)(16576012)(26005)(70206006)(508600001)(36906005)(2616005)(70586007)(356005)(31696002)(31686004)(4326008)(36756003)(7416002)(426003)(7636003)(336012)(8936002)(2906002)(53546011)(186003)(16526019)(47076005)(316002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 15:15:26.2771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 967289c6-fa10-4381-2685-08d97d12a405
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2404
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 9/20/2021 6:27 PM, Rob Herring wrote:
> External email: Use caution opening links or attachments
>
>
> On Fri, Sep 3, 2021 at 11:36 AM Sameer Pujar <spujar@nvidia.com> wrote:
>> Use schema reference for 'sound-name-prefix' property wherever
>> necessary.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> Cc: Jerome Brunet <jbrunet@baylibre.com>
>> Cc: Stephan Gerhold <stephan@gerhold.net>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
> [...]
>
>> diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
>> index ffb8fcf..68e5ad2 100644
>> --- a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
>> +++ b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
>> @@ -9,6 +9,9 @@ title: NXP/Goodix TFA989X (TFA1) Audio Amplifiers
>>   maintainers:
>>     - Stephan Gerhold <stephan@gerhold.net>
>>
>> +allOf:
>> +  - $ref: name-prefix.yaml#
>> +
>>   properties:
>>     compatible:
>>       enum:
>> @@ -21,12 +24,6 @@ properties:
>>     '#sound-dai-cells':
>>       const: 0
>>
>> -  sound-name-prefix:
> You can't remove the property. This is now a warning in linux-next:
>
> Documentation/devicetree/bindings/sound/nxp,tfa989x.example.dt.yaml:
> audio-codec@34: 'sound-name-prefix' does not match any of the regexes:
> 'pinctrl-[0-9]+'
>   From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
> Documentation/devicetree/bindings/sound/nxp,tfa989x.example.dt.yaml:
> audio-codec@36: 'sound-name-prefix' does not match any of the regexes:
> 'pinctrl-[0-9]+'
>   From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
>
>
> Just 'sound-name-prefix: true' is fine

I will push a fix for this.
