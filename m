Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0112BC433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 11:06:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8AB964FF3
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 11:06:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbhCKLFk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 06:05:40 -0500
Received: from mail-co1nam11on2086.outbound.protection.outlook.com ([40.107.220.86]:56033
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232471AbhCKLFT (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 06:05:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEogXTsCAqJ5INCYKtiAopLennCZuDI6ylA/8WfhUdw9n/f99UoDXXCmDffhscXjufKo6DqJA9RVzzc513NMLdr4k18kBasaeJYhdfPZmkxwgSr3+G3P4i6M9G9QfHEuA6lpnKPZ5rJHUQlsIGdQzv94b2zen7RjTPTDQgmVE+J8EHhDaFXe0m2AlwhZDI+FIsi27rqNpN8dyqTJBHFJl8XU98w0d4FZSp0lZV9zIOLx0THfCyil18GFzcfqNinNPdE8UeKpRMSGmOwANIU9TC2u+UGzKllQOAaarK2naHr3xgqW4eNDFf295ilru+PpaF2sRAzinzXC8hQtqN56gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QRj6y21FlOiEhwFfTKCngF0acahnG/suqsGsziZZ+4=;
 b=F5pzJ146n5VEs4aIw436nm8+nZXSW+yO4uQxt8t2YnkrA16Uh/HaVAILq7o5AN4hawWGm8M6JGfQZ7Mc1RA+YIpDlsQ8k69ZwAU4SqPyxpE9l3AJoVjTIYy8ESckkr2T/VDtfodDRV7opZnxUlSxe1maUO4n4x6z4nc5M9IwrG1+DKxQcyfq9k7cdkV512qSYljE7nXAoGFPNMhVT8zCI9EKOSmWqk5OVWQ3oQPN3gOhHBf5bSWSAtEBMzpu5WscELoYPuFnY+2+WfhDx/e2AJKdT+rS/WGtliQ4ja/UFhSgXweKhgc0IMNgUHvPlIJ5pmFbq8pEhWMzvWh6KNN/7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QRj6y21FlOiEhwFfTKCngF0acahnG/suqsGsziZZ+4=;
 b=OGgU/0Sb7XzkOViqAbUKGgtKEoxZ+15DaOfGipieUG0v7OpfY3Lou9X//OMnW9kqhyXSxTAhOgGQ1pcZ2D45Q3hsLmg3LJzWlhkpcSKflWGL5cBRND0s8IH1abFLkFc0IBrPw6JcgfbxRLN+b1WzG2NlXNfeyYoHwfeoi7mF1FxPfTyQq/hKz69clGF+57GREUly/6AKpQULaGTp9/JaEZgtzNT84W6vQMy0zxMu8N9is/giVr9Ab9X8mbGa9A2hRCn9Nfk02h/jMY7AeSeEqNi1DhAE9I2DMCoS/OcELGvM5+rM+EwhUaI11qNwn4j7MBhG0X8+HfOt6PrBiivt2w==
Received: from DM5PR15CA0066.namprd15.prod.outlook.com (2603:10b6:3:ae::28) by
 DM6PR12MB4499.namprd12.prod.outlook.com (2603:10b6:5:2ab::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.28; Thu, 11 Mar 2021 11:05:16 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::c9) by DM5PR15CA0066.outlook.office365.com
 (2603:10b6:3:ae::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Thu, 11 Mar 2021 11:05:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Thu, 11 Mar 2021 11:05:16 +0000
Received: from [10.25.96.88] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 11 Mar
 2021 11:05:07 +0000
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
To:     Michael Walle <michael@walle.cc>
CC:     <alsa-devel@alsa-project.org>, <broonie@kernel.org>,
        <devicetree@vger.kernel.org>, <jonathanh@nvidia.com>,
        <kuninori.morimoto.gx@renesas.com>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <robh@kernel.org>,
        <sharadg@nvidia.com>, <thierry.reding@gmail.com>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <eb26f8e0a4c99d0c9de9d92612102718@walle.cc>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <fa654e7a-80cc-7ae8-15c6-780e7fa29bb1@nvidia.com>
Date:   Thu, 11 Mar 2021 16:35:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <eb26f8e0a4c99d0c9de9d92612102718@walle.cc>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ad0165d-ccce-4a56-752e-08d8e47d8d69
X-MS-TrafficTypeDiagnostic: DM6PR12MB4499:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4499200C9C64C136AF3A5845A7909@DM6PR12MB4499.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0hNjpcwtnlR4D5F88ybt5x7uNGyLV6tcmiUbti/IMH5lPVCKacFf9iypdL6lsyX9LReLpNP7lXw7K963M9H831fc/hh6RHbGR53OW1bOCStVBRQqFcrkgeWOyUWAh6Xq5vUbpFM/38/AIejh/rUF9Sb9VBpD+q7TsIFPl9+rzsnBw9DEbywFMkc8G+hiW0+7kzuMppn3PJpvOby1WT7fgLVcYwITwyBexIEa1XthmPVG9Bw8vOH2sesXMxk73LmWayCoMzrNyFR8PKLWDfRrgQWTr4AegXq8GWo6Xp15m5qcM05ysNomotX7ib1o0Zn0rnaA2sJd2CwJclbhMZKg61Ivi3v4uADXvv8Q7Cuq53xTo9cqOMzAJJcFEdZWWOTMBCdk4jvb0CRjAmHDL06qANWJw3FiLVAen8kMImBgugRAH8gBDAYsUAWFdKaUYKBTUXReSiy9ZxaBaKc9bHbCnkhWNIsdsYifi7zIvOs0NGONMQs5x9Wxm4kd/7hN5wKQDDG5LkUNfBDvJ09NQX+I5bTiF9HUdIes8+X52qRQiJLp7v03hHyJ5VkPaOfN5u4ZsuAqxvXLvJo+qYo1xoTD134do2mIUKgAPt20gP22sbRFsmmo3UoRgDaHkh6mbI58Vj2aVDWGuCBYt8amgOI5/nRjyBSAuDNmDjOXmuFmxRqObxHOr/joJwP07bVB4Y/M/ozc0nqMySNF8j/hoOy6F6LFaDGXRNyfJUuHB5zWVbvhRuu9Y1+ATWSYqa0s+Vq3jhGBAij5es+uuLHYc7N6NdEJu6kbqecThKJcjNDK9so=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(46966006)(36840700001)(47076005)(82740400003)(4326008)(53546011)(7636003)(356005)(316002)(31686004)(6666004)(966005)(478600001)(8936002)(26005)(70586007)(16526019)(36756003)(34070700002)(31696002)(186003)(70206006)(36860700001)(8676002)(426003)(86362001)(16576012)(54906003)(2906002)(82310400003)(83380400001)(2616005)(36906005)(336012)(6916009)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 11:05:16.6379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad0165d-ccce-4a56-752e-08d8e47d8d69
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4499
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 3/11/2021 3:57 PM, Michael Walle wrote:
> I've had a closer look at this and it seems you're messing around
> with the clock of the codec's node (which is _not_ a subnode of
> the simple-audio-card). I don't think this is correct.
>
> I guess you should rather set the clock property in the codec
> subnode of the simple-audio-card, which is then picked up by the
> simple-audio-card driver and changed accordingly.
>
> For example:
>                simple-audio-card,dai-link@0 {
>                        reg = <0>;
>                        bitclock-master = <&dailink0_master>;
>                        frame-master = <&dailink0_master>;
>                        format = "i2s";
>
>                        cpu {
>                                sound-dai = <&sai6>;
>                        };
>
>                        dailink0_master: codec {
>                                sound-dai = <&wm8904>;
>                                clocks = <&mclk>;
>                        };
>                };
>
> In this case mclk will be enabled and disabled accordingly.
>
> Could you test this?
>

It would work and initially I had similar patch, see [0] and related 
series. Suggestion is to always use "clocks" property with devices only.


[0] 
https://patchwork.kernel.org/project/alsa-devel/patch/1611944866-29373-4-git-send-email-spujar@nvidia.com/
