Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EB7C83033
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 16:30:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C83361A55
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 16:22:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346256AbhIBQXz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Sep 2021 12:23:55 -0400
Received: from mail-dm6nam10on2079.outbound.protection.outlook.com ([40.107.93.79]:8929
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346137AbhIBQXu (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 2 Sep 2021 12:23:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGdbxjVHaKaE0fORRXBQBVTl9z83Fxii7FSFLMdiTpFISfY5S8icDajblrhDAoSp3h/yhHH7ITIw4jQmLBCyFgBK25BmEa+vFeyyQc/4+vtRiX5GCnOZLUbF5aP+kolzauqzwKEff/BCqUnJRanrjZRc/B1HV6X8ettJYsUtU9b/ug6AQPnrw2yCc3o5GgJxOzV+O1Tjm2VNcQ5PKNKdmHg4gXba/ru6vdMhjDdvPkDMB+darypqK7jfoT/a0lScA8Q6ga36jKCOyzN2tAXoDvmqTnbFM8aUJnSZ9F2/2pprX/h0Oa2MrlgNIQsoc//Ls+P9PdTdaM7F7aND7lBnRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NEMG0WwwVwkn5m22gV7rOkq4gtv/E6Zj0CPDfFmn64g=;
 b=FSp2wJ0I0qmQzkMKM0fiHfQpSbd1pYWK/3h84c2tncDRz9ppBfAzhyTAP4Evkn3B9J4HSW/VtTai2rqON0Yf56fVDhOM1jEHbxkN46i4kG+0Nfzsow8eJvhbKBtj4CmK78JKxKPVeh9h77HjIy8vLMcEL/8n5TMCsjNHftgLkLKS+/Mp5Dqgyu57RR3VSZDZY5wSgysKcuNwKQxiVYpaDK58+KrhyEEQcnDAwqOqviduviy+fGQfoxVpsAFzbexSoxZWrLgJV5wTTEHWhaceAjbNoY4cMbSW/QNCCvjf1gg97pheu7I8zBjSutCCqUkUNS0kI4u8Cg09Kocp3OnqQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEMG0WwwVwkn5m22gV7rOkq4gtv/E6Zj0CPDfFmn64g=;
 b=c0YyddtwO/UtgkmcTHuBDh36j0ofAoRzkNGebS/Pdmlty57cBL9eec68JIGQ7e0agvzoyAbbADcB/VdiMQHlDXoD9i+UOTcfiC5qNavVezJCDM/R6HItG4ZX//U2jNFXL506hZ6cj5b7IR/Vx38USuPwrYkDmtkfZ6d7qVrYKaNjZisB/CRmuANEWR5tmbis8EmJW1+yJdkGD3kuHY2CDMIXdt4VjtJVup4EP1cLpU7BHd/DJ8tBqeJsZrvdqbRcvY3rTNQuhN8nJruGQxocftUhrOIpBHNc0B2MweCRcYA60rQah1qtnQ9IWgkTHR40gip7Tm2VaTmYZQibTD305Q==
Received: from MWHPR07CA0007.namprd07.prod.outlook.com (2603:10b6:300:116::17)
 by CH2PR12MB3831.namprd12.prod.outlook.com (2603:10b6:610:29::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 16:22:49 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:116:cafe::3e) by MWHPR07CA0007.outlook.office365.com
 (2603:10b6:300:116::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 16:22:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 16:22:48 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep
 2021 16:22:48 +0000
Received: from [10.25.99.244] (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep 2021
 16:22:44 +0000
Subject: Re: [PATCH v2 1/3] ASoC: Add json-schema documentation for
 sound-name-prefix
To:     Jerome Brunet <jbrunet@baylibre.com>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <stephan@gerhold.net>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
References: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
 <1630562033-13231-2-git-send-email-spujar@nvidia.com>
 <1jpmtr5egi.fsf@starbuckisacylon.baylibre.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <96d847bc-bab6-2d99-66f0-1ca93e0f62a8@nvidia.com>
Date:   Thu, 2 Sep 2021 21:52:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1jpmtr5egi.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48420da7-e146-4f1d-ae46-08d96e2de7af
X-MS-TrafficTypeDiagnostic: CH2PR12MB3831:
X-Microsoft-Antispam-PRVS: <CH2PR12MB38312847DAE18F613B42D914A7CE9@CH2PR12MB3831.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LK0WPGNpKxemN+csvO/nehV2turEBkPphW7y9ck1mlbOQzwW0guQ+cZWDjLurC/ogXTRev00Frc2tpNt6fg913tt+9rggpIm4zP/Z5rHga3zz9c9eFUFSy6zY/c4/BuJqcmSkrrTdNa4dQEi41TPAdt8x7KCRgawWPk4CaHviUzk4QQ27FABVU1PHEZbgy/2avyKbB31+U5gO2sAvp1Osul/y1JtWLRCR/YSE2FbKJpzxbO8tNWTuoAtHoPvvkVomKlmQvSBCTtGuzNg7KggUQcafWnxGvOJrpgSQRSxmQxdLMQJqdC+vD2xWeYTtm3OEDlfNzSUekf8M7wFj1HwwMriR3WPWGHefcgVb5RF2pFNZBE3JQ0FirBchUT6WsY1J9uXEhp7/o9pvEX8rAWa4uiKEf6PtNGLVQjk89ms/TRbHjlM/PFQznjZtHz+gSBw+RL4+f4naIzgHBOxnuJobel2HjgeFv5MbVnU1skvSraAUkYAZMcmNLuuAF9p8k8ecZ8o4nKbUyrgXhdgTamz7PXswC77V9HaFGw+Ltko0C2wQYsVo9lqEEG/Er3/wCSJoDkwI2atOdejyEQq6t90AWkz/oIjKk4ZfXe/FpumJHRSCIlBLHi2WtKPUXprmmZBpouf42D++qh5Wz0aK0qsfeHkC9O8FdhKjCPobrY7lhRlbQ0UocnjF8fGFz3Us5nL2/NJmNc5L35LdvprzQa8D3A/X01Hv+h6pEkyCkVOkzXmYXSQ/X6YGLT6exdFK/XSi5Xs1c70si1xuCvl1min4+bP/Q9H5uFS8/qx9jGKYjkPz4BsbxzZvSNAVyNIGpUc1xw9NUGLTUOPFTNPlhnCcqRZmm8v6MtA7qhC+/0THIU=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(46966006)(36840700001)(2616005)(16526019)(356005)(186003)(36860700001)(7636003)(82310400003)(966005)(47076005)(53546011)(478600001)(26005)(82740400003)(336012)(426003)(31696002)(86362001)(5660300002)(70206006)(6666004)(70586007)(4326008)(8936002)(2906002)(8676002)(36906005)(54906003)(31686004)(16576012)(316002)(110136005)(36756003)(7416002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 16:22:48.7500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48420da7-e146-4f1d-ae46-08d96e2de7af
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3831
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 9/2/2021 6:17 PM, Jerome Brunet wrote:
> External email: Use caution opening links or attachments
>
>
> On Thu 02 Sep 2021 at 11:23, Sameer Pujar <spujar@nvidia.com> wrote:
>
>> The 'sound-name-prefix' is used to prepend suitable strings to a
>> component widgets or controls. This is helpful when there are
>> multiple instances of the same component. Add relevant json-schema
>> and is inspired from sound-name-prefix.txt documentation.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> Cc: Jerome Brunet <jbrunet@baylibre.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> ---
>>   .../devicetree/bindings/sound/name-prefix.yaml     | 35 ++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/name-prefix.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/name-prefix.yaml b/Documentation/devicetree/bindings/sound/name-prefix.yaml
>> new file mode 100644
>> index 00000000..b58cc9e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/name-prefix.yaml
>> @@ -0,0 +1,35 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/name-prefix.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Component sound name prefix
>> +
>> +maintainers:
>> +  - Jerome Brunet <jbrunet@baylibre.com>
> Since this file is referenced using "AllOf", am I going to be listed as
> maintainer of all the drivers using the property below ? I'm not sure I
> want that ... :P
>
> Maybe it would be better to drop the above ?

The 'maintainers' seems to be a mandatory field. To address above may be 
drop the top level reference and refer the property directly via a 
definition if the earlier method [in v1] was not appropriate?


