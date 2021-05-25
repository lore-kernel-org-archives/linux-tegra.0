Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9713C2B9F8
	for <linux-tegra@archiver.kernel.org>; Tue, 25 May 2021 06:51:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1E2B611B0
	for <linux-tegra@archiver.kernel.org>; Tue, 25 May 2021 06:51:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbhEYGxW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 May 2021 02:53:22 -0400
Received: from mail-bn8nam08on2068.outbound.protection.outlook.com ([40.107.100.68]:5048
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231245AbhEYGxW (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 May 2021 02:53:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZuUpVggsngLWuGD52kzKpUhlxplIislCFXi6Tz/et5wjtXKrMJLzljHTjzzEFj01AESqGKVVnn2PkKFBIozhy/DeXprY48Zu3eclMhz8eePqI1bzHdwbHCqhmsu+IogujNlXUil12ZIV02Qj6FHGjlBEQI9v/BTx44IvWb/iNNmDKrwCDiOjZyfkBJ3UTDU3vnlSHTbzCcJcYB4rAKNFPzlR+hVZE3aPvaokctTAiDbAceyGU/nloWnyiixwOldXt08Hhb6WklzTzGMrF+z/T4L+bIE+kiZuunBC1HSEIUCZqNREMM9oUlbo+hU4He4kuzkRGHgtaHYC42dYTWQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WT6M7+N6mnLJMHSN2I+XVCbkDnoTHX7UpBKSzSvjm5s=;
 b=Eyg9daPdJuudU7Y2Bv96+mN3X9DqGj/ou68G59XpWgDEdfAH0pQBw8Z/burmG1+yBJGrKlyNZfmOXyas/Fh77DK2S/PGxh4SGDTsxcWnTJBtMgmzUT7es6NAHRolqF4LjLhQ2UXX9MKZwr4oJj5a3eT5sIyghUS3K5nMAnZCpu4Ivns+yDt19kFTDbJwVLoiUWYrw2yoQiGfl8ddX+juuES+/+h7lUs57mIjg9frd5F8UTvduzWURQUaexaoYRYLl8nbmHaQQpPE8dcOs6ywnzgAlBeWUoG6ep9X9KFAWb5CEoWo2gIf2KNyFy3+XWN7Jff1X96WHOu3cgyV7yrAMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WT6M7+N6mnLJMHSN2I+XVCbkDnoTHX7UpBKSzSvjm5s=;
 b=eVOmF0qvggqw5KXNEP0g3/9GqLwD9qThQI90IojWyV4OL/ru32cJTeIrD2iuveC3RpNP5AyL7UJs5y8YO8KeRsNK41+7oBj8V3mQnzpB5MbKfPyfo27I/658/6Aiuy/zVp6W+znQRGufgzsJcyAF8nBxHpcfHjCHJJVOEUkCkOiXNR+7/8KxT32UbBVAP5xV9eNRQ/Z3xJZf+FZWzVd0OHR4m0etWPFa2CmCv7Xco47cdg9UrV+aNvipuJKdAQy6t342O9Yf272LIsIdeL4yp9qYGAlsRQLBC3+4IFL4BkZwCQrliLsh09X7Z9XNkT6RvXigNQRv9Y/ByNTtt3sftA==
Received: from DM5PR21CA0041.namprd21.prod.outlook.com (2603:10b6:3:ed::27) by
 BY5PR12MB3812.namprd12.prod.outlook.com (2603:10b6:a03:1a7::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Tue, 25 May
 2021 06:51:50 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ed:cafe::ec) by DM5PR21CA0041.outlook.office365.com
 (2603:10b6:3:ed::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.2 via Frontend
 Transport; Tue, 25 May 2021 06:51:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 25 May 2021 06:51:50 +0000
Received: from [10.26.49.10] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 May
 2021 06:51:47 +0000
Subject: Re: [PATCH v2 2/2] ASoC: tegra: Unify ASoC machine drivers
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
CC:     <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20210520175054.28308-1-digetx@gmail.com>
 <20210520175054.28308-3-digetx@gmail.com>
 <32171079-ed4e-1147-2272-5f11bc480c6a@nvidia.com>
 <91e53907-d87d-aeeb-4644-3926d4311daa@gmail.com>
 <6bc26992-e136-ef6a-a956-382b5cae5db7@nvidia.com>
 <f9631faa-5fc8-ecdd-709b-93b58e45a1ac@gmail.com>
 <cf2ee04e-d4cf-14ba-92d0-aa113eb7b8c8@nvidia.com>
 <f27b931f-3f92-32cb-cdf0-d9ae001565fc@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <4cb563a0-8fdb-2425-57fe-633b7be51e01@nvidia.com>
Date:   Tue, 25 May 2021 07:51:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f27b931f-3f92-32cb-cdf0-d9ae001565fc@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf160901-3610-476a-311e-08d91f4992e4
X-MS-TrafficTypeDiagnostic: BY5PR12MB3812:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3812EA05A9AF16483967A3ADD9259@BY5PR12MB3812.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OQo2qG9dqmpYSCyhEMMVn+NyYvGcRQZVZBfA8ZvMZcqZGn9C/G5v0puaIn8pUz70wMAde8gTDbHBiipDTAj4fFTq4SfboT5gWCXTBWWra7c80uKEQ9lpnMOZDRzVc3qPNokw8C25kfqy70k39yk7YMaJa++mU4BE4mJ4G5HTSlePq8mlrmYsuQatnlEvFFu/4otFtxKnx8PofdW9ec4W60ECggOJzEzyVrrxJ+JNsTNeEL42kwbrX9Ypjek1v2kmQsLE582u7VkvP+p++3ONNVAIMJw85RFAd7qb9ERmUgC4wLdz8wBcx9uAHRt+tJC4S7QdPECRZL9+UavOFOGf0LVdW3jsj/0LTxQqeNkA6xAfxWr6H/ryWyK4GtBuI8nOtbBN6i1t5LtMmudlQUNdSVIig+e22nqJCfdW+3AgPz5WsBu/o9jZ6Sv1+b9k7MZiAXFtdIkrd1NJ6wZfdjVOQmD7WT2SVJenZdtv642xO8E30zhaIaMNMyLQqHHZHD0m/5met80RmUi6zEYPpXDCBCrtQCwacm26qwnLyQcEsG71/mvBhOfimtP9XuoglwOgwl+VvXQ8aSWDede0CSwnJkGzUDdS3RtJoi5igGn+GCcQ6/XGFz7HCfDnM/2bBT5WafDiou8iR0UW1lct62ls2Jt9gWmNQCfcxQ6LCVgR2nTqBxWj1aWo5qqXCo5fhRPb
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(46966006)(36840700001)(2906002)(5660300002)(70206006)(478600001)(31696002)(2616005)(7416002)(86362001)(426003)(36906005)(316002)(16576012)(54906003)(82310400003)(26005)(36756003)(70586007)(36860700001)(31686004)(83380400001)(47076005)(82740400003)(53546011)(8936002)(356005)(16526019)(4326008)(110136005)(186003)(8676002)(7636003)(336012)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 06:51:50.6128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf160901-3610-476a-311e-08d91f4992e4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3812
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 24/05/2021 22:02, Dmitry Osipenko wrote:

...

>>> The 128*srate gives MCLK >6MHZ for 64/88/96, 256*srate gives MCLK >6MHZ
>>> for rates below 64kHZ. Looks like the goal is to get MCLK >6MHZ.
>>
>> The wm8903 supports 8kHz sample rates and 256*8000 is less than 6MHz.
>> Yes the FIXME loop corrects this, but you could also extend the case
>> statement to multiply by 512 for 8kHz.
> 
> But what benefits this extension will bring to us if the end result is
> the same?

For the wm8903, nothing, but that is not the concern really.

>>>  The WM8903 datasheet says:
>>>
>>> "The  following  operating  frequency  limits  must  be  observed  when
>>>  configuring  CLK_SYS.  Failure  to  observe   these   limits   will
>>> result   in   degraded  noise   performance   and/or   incorrect
>>> ADC/DAC  functionality.
>>>
>>> If DAC_OSR = 0 then CLK_SYS  3MHz
>>> If DAC_OSR = 1 then CLK_SYS  6MHz"
>>>
>>> Where DAC_OSR is DAC Oversampling Control
>>> 0 = Low power (normal oversample)
>>> 1 = High performance (double rate)
>>>
>>> I see that DAC_OSR=0 by default, it can be switched to 1 by userspace
>>> ALSA control.
>>>
>>
>> Yes that is all fine, but again this is specific to the wm8903.
> 
> Alright, I'll move it to the WM8903 driver in v4. It won't be a problem
> to make that function shared once will be actually needed.

Thanks, but it should only be shared if other codecs actually have this
same requirement. From what you have said about the rt5631 it is not
clear that it actually is the same or not.

Jon

-- 
nvpublic
