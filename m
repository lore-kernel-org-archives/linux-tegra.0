Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3668C04FF3
	for <linux-tegra@archiver.kernel.org>; Mon, 24 May 2021 12:22:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7757461261
	for <linux-tegra@archiver.kernel.org>; Mon, 24 May 2021 12:22:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbhEXMYD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 May 2021 08:24:03 -0400
Received: from mail-mw2nam10on2062.outbound.protection.outlook.com ([40.107.94.62]:64608
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232327AbhEXMYC (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 May 2021 08:24:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8von+yxhjrhadwkSNExIgPyTDjmgQ+K365KBZy4f+j3okLQBSH+A3DlYfrjAZIE4vnD2bC1bokoXynA7IjzXNVvzlnYM7oX66n/vyY/iMGEnq0/Lz1rKuunNRrHpFF8Vzy4Xrf2gaaGMPfTGcK2pNEhS/KjVh8LWQyk8Os1yC8BPDiZqQGBltpISUfghshF82/7phIFl0rpNhxZrkqNUKB2KMO4y5bFeakc9Z3QunIdSka4zZwoDzGGzyRGSFcxRDSCKQIUwRF2ZsvXqEF4jD9O1D5NA+rG2I0l2ZXbrKEGYmgevzMR54ozK2G/1LsOe3fWt6dHV/YsAhlgLkVgMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PAiHIdPPL/8LN2pI6m1/GrgY2DzkS2LGV7L49hfHGI=;
 b=HMIwnmpKNICaSrAN4HrBvT7ZWON4Rd5ZRGjfTmHUuXGK8HfFjWii79DNJ4RW8D6GXz6vVPBtUmYK/73Q7CJrSiRpJM/hQxQ9FgcnTsBbO9KoxNsuxWP2Z8OzLzKiYvNAlHPvxtwFSUkW2Glz/AJiOYhZp4A1R7IpekXQ7clVum//OodgeA4qTCPLtUNK+kNAw+SfmyrktMIyxaRSIleUGdhG/c/MkA+XI9MchM6UxgfqRd+99RGMlbbwUC/k9yCB+wOvQqBCgjiu8q3lJlQvCUg1wtvJhVZiYMScHoT1zkSfmEsucCQ6lEf5h2cH423WEpaYSSr3uXF02i183//edw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PAiHIdPPL/8LN2pI6m1/GrgY2DzkS2LGV7L49hfHGI=;
 b=R7ixLWwSdTk6JydlRDhZoMj6SkFZXXXs8ogP3QXGFx153/rXKDNk2CteqMhZ8dMxBx9NRNfDsSk3IrRd1jNwlKzuBXgbrG+qYoQIILpTN3F16XjtEQYEkqkFZcl+h94l9ukaPEB4YdSAubz9LN4AAluX+g1AqVa2iQRZqnqav+RlJjsnODPLiakXQLYaSCe3W7xKmDgxXtAifFVxCpGldOn5py5xmrgRBXyecohLpbQ9A017wiJEa0UUalin03pRqMTwHGRLVegi8+wxdODTf90GPmxYIWMjaCoitoq2ZDmP8+QI5B6D41MuRzmUP4T5VUZL0CZJNy46XEZC2sCqoQ==
Received: from MWHPR15CA0041.namprd15.prod.outlook.com (2603:10b6:300:ad::27)
 by SN1PR12MB2368.namprd12.prod.outlook.com (2603:10b6:802:32::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Mon, 24 May
 2021 12:22:33 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ad:cafe::1a) by MWHPR15CA0041.outlook.office365.com
 (2603:10b6:300:ad::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Mon, 24 May 2021 12:22:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 24 May 2021 12:22:32 +0000
Received: from [10.26.49.10] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 24 May
 2021 12:22:30 +0000
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
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <6bc26992-e136-ef6a-a956-382b5cae5db7@nvidia.com>
Date:   Mon, 24 May 2021 13:22:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <91e53907-d87d-aeeb-4644-3926d4311daa@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04ecb75e-a23b-46a1-d509-08d91eae9b61
X-MS-TrafficTypeDiagnostic: SN1PR12MB2368:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2368DC782409753F8840899ED9269@SN1PR12MB2368.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H9KgRPJqNWidnXNCITpc+WcEgUSF74Upwr0Zk4lQ7FSuNBkF4XPRtSkdygkq4qMHAcQQ8LhwHHoTw8DhLnBdLqofkM7kMozHM7HwGIgAiln0qJdNPojC+q8rF2AWkPJs0rYsFBUuY23d0NBs9WqwIe3bos3SS4ui7QhGdoPNsSLv5fTu1L40RyWO92Qj6NefDrTygc5kRqEzlcFKDEcVABa0bxpKJ4U7/SE5Cai4myiSixOn8sY0kM+ggS02e/qZIjZjGeq7s38a/xYGQO0Wgvi/Lu4uOS5S8SvPzHp7Wi/ef4znNe2alABJJ8haD3CSokj6HmHm/7dNKNC58RccQL9o4zvjbtHT8QlmLpR9pAXdPT4R6RTGimTLSmr7PBLEadhoxGktIw9WTjgDSYduxQVowfkyERcCl39avUe9ku9urSndM8HP+z8T/Po8vdA+/bNgcstu3x/kSaORTiOODTnFJ1wBMMYzCEQmiviVP/MdHqrDgbtQ/hvE+5wakxTjqQBjGKKne0wWKIWYnUEACQouQkBn6TAyT3wMKILSl9mNf6nAIV2Io6JHJ7KwzKFhWqOM84ozGHQRriaHixTH+xjdvElzPdU98X2vp4PB/kVG/wm+vgHK3p73BtdJhm+QSpmBtTgqhEZGbJ8awEO6uQUNIEhV/uy1NTXJqy1yuEiPGASzUkrb7nF/GN9JGuNn
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(36840700001)(46966006)(82310400003)(336012)(70206006)(70586007)(53546011)(426003)(356005)(186003)(36756003)(36860700001)(8676002)(5660300002)(8936002)(2616005)(478600001)(2906002)(316002)(110136005)(16576012)(82740400003)(7416002)(4326008)(7636003)(36906005)(54906003)(26005)(16526019)(31686004)(86362001)(47076005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 12:22:32.8549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ecb75e-a23b-46a1-d509-08d91eae9b61
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2368
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 21/05/2021 20:05, Dmitry Osipenko wrote:

...

>>> +unsigned int tegra_asoc_machine_mclk_rate(unsigned int srate)
>>> +{
>>> +	unsigned int mclk;
>>> +
>>> +	switch (srate) {
>>> +	case 64000:
>>> +	case 88200:
>>> +	case 96000:
>>> +		mclk = 128 * srate;
>>> +		break;
>>> +	default:
>>> +		mclk = 256 * srate;
>>> +		break;
>>> +	}
>>> +	/* FIXME: Codec only requires >= 3MHz if OSR==0 */
>>> +	while (mclk < 6000000)
>>> +		mclk *= 2;
>>
>> So this appears to be specific to the wm8903 codec or at least this is
>> where it came from. And given that the switch statement is not complete
>> in terms of the sample rates (ie. only has a subset), I am wondering if
>> set should keep this specific to the wm8903 codec?
> 
> The RT5631 codec of Asus Transformers will re-use this function.

OK, but does it need this FIXME part? That appears to be codec specific.

> IIUC, the default switch-case works properly for all rates below 64KHz,
> at least I haven't had any problems with it. Could you please clarify
> why you are saying that the switch statement appears to be incomplete?

It looks a bit weird because less than 64kHz and greater than 96kHz we
use 256 and for only 64kHz, 88.2kHz and 96kHz we use 128. So it is not
clear to me which sample rates have actually been tested with this and
if this is complete or not?

Is it intended that we use 256 for sample rates greater than 96kHz?

Jon

