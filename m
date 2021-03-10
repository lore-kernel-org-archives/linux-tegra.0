Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B076CC433E6
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 19:20:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A93764FD7
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 19:20:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbhCJTTt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Mar 2021 14:19:49 -0500
Received: from mail-dm6nam10on2061.outbound.protection.outlook.com ([40.107.93.61]:26336
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232824AbhCJTTY (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Mar 2021 14:19:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7j0ZLNZkU8Q5bOCBfiRQLUROcV32POjbVemz/Q6ClhdbZHj8Hn2ofEhU3YIlisd+2mQaCxzu/OQG8lY1n5mP/eUV7iJ59dAhnu2obPwo7gx6zCmA2ATA4tRb9lzbwSiJgzYgTAY+ppEFRVNnX99ulnBnrjiJEyXOno2e6Pp9uKV5ql+A21AKENO60lkdYYFqNsJkf40Rqy/EBxfMo1xSNjS6mpv2JM9yQtK2w5seyBACQUOlNCGzRKtnuY5DxvbE+UV/1xVdfFj796XxecInqI5NmrpcaqATL+CpZ2y4/UNlrQ8QQPAaknnKDwEScXya9sD3hYiKEfubNiJK6uhiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ+CQyliHKMEHOtCGTQatjdSVUv3xVaIFcJKRbQJy2s=;
 b=iS10iMH7LhGV8mQlejj0Pfn3blZDucs9ip6hfIL324vbvfApFdJFuHSt/dxJmVk7ha35M/e7XCq3bOdFzjRVNJnHqgC/nU2vIihG3wH5TzMdk2WFtrnmDHFQQKxrXIqNlsUNnQbHJnPIUZgDlNTjAdK0swS7mfKPv/5/eLxFxWDWwnxEXj1tOKZZbQ6L+7Zg0W/Aig0jfbNWsYTgf34RrgiaklvVS1sGncOiHBD5x2Uxl0MTJPtNyDA8XWP4Uq9iY+WQVyVAA2+FNzsDFqrmSVaUamlLryQM57bC1YT2L3wJ5FKTiQUoK4oIGo8e0ieLCNydZB0Ekss8cNAk9J/4kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ+CQyliHKMEHOtCGTQatjdSVUv3xVaIFcJKRbQJy2s=;
 b=m6tKKLoTA91jnSVNpd8u3YKP8lyVdHDHShYFYxpP9KQpWigP75ei2EkZU7N2WdzTO4vanFTaEf6dptKdmeFcng7HxxD0riLYur4Hh3Gv25H5/ipi8OtirRoyCtzTrojuZDOPtjpKsvRPH+6METPav9gDI0vxNz2aCxOu/lPzsNLp8xNlm8QOo8Li0zDKI6CL9iVkn6G8Yof4eB4ftdE8s6vSS7B8m86wwfsuplaaJLTh72ze4vXFwSmNKO1Fij9vnpbWDD3guB7Aw5iCi8x3ihzXEjVKIZd07HwyUIyCZ27qUydh8+BDL3Q7nHsu8JrFUNg5aU43Fq8zUfKPnMM/Lg==
Received: from DM5PR17CA0062.namprd17.prod.outlook.com (2603:10b6:3:13f::24)
 by DM6PR12MB4186.namprd12.prod.outlook.com (2603:10b6:5:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 19:19:22 +0000
Received: from DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::dd) by DM5PR17CA0062.outlook.office365.com
 (2603:10b6:3:13f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Wed, 10 Mar 2021 19:19:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT048.mail.protection.outlook.com (10.13.173.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 19:19:20 +0000
Received: from [10.25.96.88] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 10 Mar
 2021 19:19:13 +0000
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
To:     Michael Walle <michael@walle.cc>, <broonie@kernel.org>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <jonathanh@nvidia.com>, <kuninori.morimoto.gx@renesas.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <robh@kernel.org>, <sharadg@nvidia.com>, <thierry.reding@gmail.com>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <6e6b312eb91b8b86ceaa8a52311ea437@walle.cc>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <a201acf4-ac96-35c3-1703-1b53a304361b@nvidia.com>
Date:   Thu, 11 Mar 2021 00:49:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6e6b312eb91b8b86ceaa8a52311ea437@walle.cc>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f6103b7-5b02-4e2c-e700-08d8e3f96856
X-MS-TrafficTypeDiagnostic: DM6PR12MB4186:
X-Microsoft-Antispam-PRVS: <DM6PR12MB418671677BDB13AFA49983A9A7919@DM6PR12MB4186.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: duO5IU/ofW2okBUAVk8g5p7Pn1KlPUWuIND6P61DKQTvHVOjLQO+HKBdgPjcoobAOrCrN61I9qXzWqc9RQJldwnzlHUfDugPBByVp6NVJEpnoupi1dVyUTi8T5FF7ciy4PXMP5MJAoO7at8/AJruJNCdP/w6SWbn3lOWfb2Moa2QoUN09wJT39feQvD006TykQ2icGmDWqoK9GLoQ/sxSBMMYNmgDDDroPkAngORKexLynkpyuHEvYM0KlLs18YbDf8vYo4mLOt4tEbhswOqPav8IG3ZbWg925sqbG7EiIPsy/VG7AfnOdi535LhJMj2f0JIu0TCxAwvKS76jwkWdSaHVpzLcoSET7ZGB8fWn14SjmhSHwgE7He523RGJXW81D1s5QBQC5ZeggBKgOE1qQ0KTRo+DzCX6iFZNKcB3Bq/88sK6uzh1UB8OBHEn0m2FPIRdMBq8c9fUtdmRL+cYO2RhSD0OPrl/mIsbo/wzfBKyW/NRnx2yLJgssINtNnrPW+Cyzm6oybYHc8us/I1xJb0gl1QaMa2bCkl0FRVNkRrjX7kv708h4F4QihQUFiIR0+uQTWOuZnRqwzYAljXQFeejIr8EKWCt1OZ9gHFhJNZXOPrGGkRYIYODa43eD768ZM6ycIj1M5LImp9AIsEEVdTjLIwh++KCtLSdt+A9Vu+xVkqLXUHDhhkOGL4cHlFHDss/33xdlSD0iQNK9cM5w==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(36840700001)(46966006)(6666004)(426003)(356005)(5660300002)(34070700002)(31696002)(36756003)(8936002)(31686004)(7636003)(36860700001)(4744005)(336012)(316002)(82740400003)(36906005)(86362001)(4326008)(70586007)(8676002)(47076005)(16526019)(70206006)(83380400001)(2616005)(54906003)(186003)(82310400003)(26005)(2906002)(53546011)(478600001)(16576012)(110136005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 19:19:20.8773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6103b7-5b02-4e2c-e700-08d8e3f96856
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 3/10/2021 11:44 PM, Michael Walle wrote:

> Btw I'm pretty sure, the MCLK was enabled and disabled depending on
> whether there was an audio stream, the last time I've measured the
> clock.

This may be true in your case because wm8904 driver does an explicit 
clock enable/disable and does not rely on simple-card-utils for this. In 
my case it depends on simple-card-utils.
