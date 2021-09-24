Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDE4C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 09:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8364C6124B
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 09:31:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245091AbhIXJcs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 05:32:48 -0400
Received: from mail-mw2nam12on2049.outbound.protection.outlook.com ([40.107.244.49]:30232
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243849AbhIXJcs (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 05:32:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wjy3FUSqrQpzU/qN5LkGL6h2c7WRBZG0DOdwJt30DXnVme2u5/L5+9O/uTr+QLI9QHCw1jYIkoX7AE0EQzCZiMNCrrntZMI0l9lyZTNxEoz9TB6aTRdmsroaT2LjSQM8XdjcqtncUMb6gYh/PanomNjtMs5YQHEnd+Svr92PtmzOriWyHYE4VZ0dWPmGHajyB2NczGmRN1SVQCzHn7uJx/l93R+kvMG8DvnO/aigLLYvXHD44hYgp9y/kp1YnGHBPmvgvJg041tcoU5Zttrt0gjwMqL6q2mcNAsSa+momf887Rkm/MoTTk0GTj2/+Xc/dcU7eox7SOU8lPtkB+Q5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=z6+7Z11PwbYetnv8wMlAVmhl+OXlCwHBpXoibbDGxfE=;
 b=TuMmp7C6FO7SREI9744ZSiAePHbHSgsP7WFDtOSRRuQrdafbQNSwWh+jqxZJRFcUtOJkDT/yP57qABzEimar7+AaZi5ommaLc5ARTpF9ScGsrciK2ZHwoEzVZv+xPZBLySaVNWrjyhMnZrxJPFQOQLFbJGIoq1Sl/8zcKFrEgSnrAYxYP6NbHoIPCtdQuodJBdhO8/RfbYZksCksqZuimACQGFnZJlUHuc8neaKz11U7Ipydpv/ovRTuplsNnbtCmzFQOcZN7XBPYyMHFQbu7ycor6ewGeENcRQ2Y8bgXn/P7rWXdH/P3zM9Ew/piXWhBFu6RMu7Vjhr+OXy1HBc9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6+7Z11PwbYetnv8wMlAVmhl+OXlCwHBpXoibbDGxfE=;
 b=RrdEx8Cd7Q/nwItPbtge4p/HwmAHqRtUpzMOcmxrGqIx7IQS8ZrbjL7G+7Owqkvt/puuJOswmP5xkpcukyNE8MBgdV5MeVT1PTtUug9rqNAlCQVMdGP32Ci/7wK3v995X4SDf9Yf+Da2Zi/ZWWB8oNByn5o0hs3PmgtZzTHziN/jcWmOiJf+cBS26F3Q0UJKWNVXiOnR7x5btKltSAoaV+S8vaU8BVptvEZs2yWWicpiFNsCpKws084+jNKHRxSjRUSZmIxQQ05MvnfcOkVBQjrVnBaL2H52wy2lR9clGsxVgiu4VyL+nU+K1tY2Ysqp6GI81/N83QUuX7leqw38fQ==
Received: from BN6PR21CA0018.namprd21.prod.outlook.com (2603:10b6:404:8e::28)
 by DM5PR12MB2344.namprd12.prod.outlook.com (2603:10b6:4:b2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 09:31:14 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:8e:cafe::a0) by BN6PR21CA0018.outlook.office365.com
 (2603:10b6:404:8e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.4 via Frontend
 Transport; Fri, 24 Sep 2021 09:31:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:31:13 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 09:30:35 +0000
Received: from [10.26.49.14] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 09:30:33 +0000
Subject: =?UTF-8?B?UmU6IEJ1aWxkIGVycm9yOiDigJhFTV9SSVNDVuKAmSB1bmRlY2xhcmVk?=
To:     Miles Chen <miles.chen@mediatek.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>
References: <e8965b25-f15b-c7b4-748c-d207dda9c8e8@i2se.com>
 <78cf3af71e035a79d021d17c6fd8a09dd1e4984d.camel@mediatek.com>
CC:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <cf7eea1d-a628-c6c4-270f-fa9895192b24@nvidia.com>
Date:   Fri, 24 Sep 2021 10:30:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <78cf3af71e035a79d021d17c6fd8a09dd1e4984d.camel@mediatek.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27c9d70d-3ba6-440c-80d9-08d97f3e0d8c
X-MS-TrafficTypeDiagnostic: DM5PR12MB2344:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2344E4A6BC2E4078F975514CD9A49@DM5PR12MB2344.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jcCAKbKFOsd9n0bimuWdjwd4md6zuI63RzGTBk8JSqpXjN7gGHdrogt6eWLcYzyjUTaPfkP/DY9RYNXusbTOgLokmDojPR5QyZP3ZLG6qBzQldpHr3qEtIBWkPlD28yY3k51YgRmhbekDBTyQtXvPHoktslIbLLc5u7Wl3iPZ4aj+9m4/XpZZ1mgesw4wVi5/4mfRy34WsuWINCD6luy46IyyWsoDJTeot6R65FnWAhkdhk/RsEHIlgj1B2UuSSpMus2HNYXUYHg9/HcNrV2AxTTm56WfgXfQkPcDM6JnRGTq957RrS4vZw6EJX+CFNXDq624ylt3v5tztIRyUn++06XFATUPz52RyxH06s0wg+VBVutrh1d6FlrzqR7TruNZ1CSnUL+urbsUyx5O5Bugt9DzGTNTaSXC1ry5kRB4Qt3gYxm057y/uwvkcF3obnsuNqQCVW5ZVV2PlQqn+LcZtykcHlNDtOZQ6OTPe2vQslzIem+kBsTgPSX8MRYXQXyn3GLOI8dVqp8QmMyUTxgdBMqaC5W/3LOf8PfZxVCsonBlagCdhfg2dcnGa79kRMUeqTNv0rqZG3Y0AutHFpYLGoA3354MmZ7nE/lNBL5eX3XkSeYHG4I6JFluGR+IhF0uH2BU3DpimF7u7Oa7IXv5s7UPkn4CjkeTocyk4Ked8kNUEeCxz65xNFhFyoxLjPUqid8s6WRVigzaZ/sZpvcvkjo/h1KeqMP3cbdJT4NRZs=
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36860700001)(82310400003)(2906002)(70586007)(53546011)(4326008)(86362001)(110136005)(356005)(36906005)(316002)(186003)(47076005)(8936002)(16576012)(426003)(16526019)(7636003)(336012)(508600001)(2616005)(31696002)(5660300002)(26005)(70206006)(31686004)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:31:13.9848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c9d70d-3ba6-440c-80d9-08d97f3e0d8c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2344
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 13/09/2021 03:49, Miles Chen wrote:
> On Sun, 2021-09-12 at 12:29 +0200, Stefan Wahren wrote:
>> Hi,
>>
>> i tried to compile current torvalds tree
>> ("78e709522d2c012cb0daad2e668506637bffb7c2") for
>> arm/multi_v7_defconfig
>> and get the following build issue:
>>
>>    UPD     include/generated/utsrelease.h
>> scripts/sorttable.c: In function ‘do_file’:
>> scripts/sorttable.c:352:7: error: ‘EM_RISCV’ undeclared (first use in
>> this function)
>>    case EM_RISCV:
>>         ^
>> scripts/sorttable.c:352:7: note: each undeclared identifier is
>> reported
>> only once for each function it appears in
>>
>> I assume this is caused by:
>>
>> 54fed35fd3939398be292e4090b0b1c5ff2238b4 ("riscv: Enable
>> BUILDTIME_TABLE_SORT")
> 
> I hit this error too. I add the follow conditional EM_RISCV
> definition in sorttable.c to build pass (arm64/defconfig).
> 
> I will submit a patch out.
> 
> diff --git a/scripts/sorttable.c b/scripts/sorttable.c
> index f355869c65cd..6ee4fa882919 100644
> --- a/scripts/sorttable.c
> +++ b/scripts/sorttable.c
> @@ -54,6 +54,10 @@
>   #define EM_ARCV2       195
>   #endif
> 
> +#ifndef EM_RISCV
> +#define EM_RISCV       243
> +#endif
> +


This is still broken in the mainline. Any plans to get this fix merged 
there? I believe it has now been broken for nearly 2 weeks.

Thanks!
Jon

-- 
nvpublic
