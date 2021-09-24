Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB6AC4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 12:57:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BFC96124B
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 12:57:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344481AbhIXM7L (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 08:59:11 -0400
Received: from mail-dm3nam07on2053.outbound.protection.outlook.com ([40.107.95.53]:64481
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345227AbhIXM5i (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 08:57:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feDLSGDOolYdJi9hA71riymlSxICPwtsz9YZE0P1ANIQe2Vnwv/76tol443A0n5o2uEMFMZdL+jf+0YQUrysqLOWUdgEeXDH/U0K6boLYNOjKu3kmancC474AA0m/nX1VzLKqhEv9gwZHLEdaf1fQApLmzTICQJIU6tH1qWWgSVhPIa0f72hQoCbOs6ziDzIwWOS9x/3XKruaLXxBBJAPWe1TJ19vBGBNEKtYRXtRIdeDdf5GUYDWdNKtpBS5PI18q0E9Izg6m/xKqgUzskWQViL8p9C33Oa4HwHCHg8f/dKe1CX7nkgkU19vzGdfy8Frvr95K1Nbsx469azrQHgTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8du3U5j3cA2b3kkqZO6l9gm04IN93r2lMHekEhv60z0=;
 b=gB/u1YDlUPkqJ82pTLGh2tIXo4PWKMnWMm1cUib6FMgnmfB2nPq6FO/n2GadMJhg2cGYDpw+0VRTjaLGgEw7sbSxCV6f55zwidyASpGj/ouixfBkzI5+oart+0uujdtxBbD/6WmNPznCYTYRWHYZVX4CTZM90biowPWaewUFlEfkqPU0SSkYEtjmbnGnZV8XGp1OPwFwUVm2JA16VBgIOiEdg/eYddmwpUAZPJV/QT2YzkR3qKF0FLNpvf1yi8zuVYEjuWTOlv/t6KatnJXCBw2qpC/Q+nt4X3YNWnPAG2/NocX3YPOeGzXl6RlOXt56cOQQdKrHIxvtRe8Fab83JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8du3U5j3cA2b3kkqZO6l9gm04IN93r2lMHekEhv60z0=;
 b=mc5cSd0+kTO1/d7VO9z2nl9Rjnp8CkM/vTFH8pwRAMUFLthCB+l3nMGAkRLr77YKA6P2w8x0qN5Cc10LIAqCNiQM0fIJD9n2e3e2geBpRk+IVLDH16p525IU1UzQIot71MaaZtQUlXqIHopMH6KWsH+AxM4703+qkDL5n5IsmDL1avMiaGQE2R4qsiGWPwrUIDt7HTzDG+ordrq5wxSxDGd4hh1yOrN6fQM6Fn9hzNdoPs5tPOqvCsbXlZb/3awuG35qGSli/B8RlyeY3NK0zXEjd+6/4a5U7BK/vypupEvNsDgjOFbV8j6x4xPsE3/A524CZr8zTmAkZCEXtxZlIg==
Received: from MW4PR04CA0365.namprd04.prod.outlook.com (2603:10b6:303:81::10)
 by BYAPR12MB4982.namprd12.prod.outlook.com (2603:10b6:a03:106::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 12:56:03 +0000
Received: from CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::54) by MW4PR04CA0365.outlook.office365.com
 (2603:10b6:303:81::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 12:56:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT028.mail.protection.outlook.com (10.13.175.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 12:56:03 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 05:56:03 -0700
Received: from [10.26.49.14] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 12:56:01 +0000
Subject: =?UTF-8?B?UmU6IEJ1aWxkIGVycm9yOiDigJhFTV9SSVNDVuKAmSB1bmRlY2xhcmVk?=
To:     <miles.chen@mediatek.com>, Stefan Wahren <stefan.wahren@i2se.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>
CC:     <linux-tegra@vger.kernel.org>
References: <e8965b25-f15b-c7b4-748c-d207dda9c8e8@i2se.com>
 <78cf3af71e035a79d021d17c6fd8a09dd1e4984d.camel@mediatek.com>
 <cf7eea1d-a628-c6c4-270f-fa9895192b24@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <277d1f76-c105-5fc4-6658-058286f503f0@nvidia.com>
Date:   Fri, 24 Sep 2021 13:55:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cf7eea1d-a628-c6c4-270f-fa9895192b24@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 808fe0fa-b40f-4030-16b5-08d97f5aaab7
X-MS-TrafficTypeDiagnostic: BYAPR12MB4982:
X-Microsoft-Antispam-PRVS: <BYAPR12MB4982F080D28755A1E5430D2ED9A49@BYAPR12MB4982.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: diIfLQ8OQIJ0h93C4Z9SkpXEsn2rVVT9ACGE0JI2esqoCsLQKI5I2XohGjLDpAok+832xjOv2NnE/gv1V+oC2XqeGEROeV/yrzCvs0+IZm5/xN3XHV9oZOp8LtxWbbcFuuv1VE7WLVgXCy6dsl7K/QD0/fm53ahyoXbjpbIaLOun9rAqbNf5wHPzcJuVNTFc5Hzio9gogpxBnIcXqleac2d/Ox2CGyquuySyfiZFTETzQLRDV1ExCppK25t1tHMdnJxlCqwfFZuUP3qbdYgyHwHRBl4D0Ds6tj1QnNm5Szsg4jU/s2h8V74zizyxpttUUDBlDo2WyTLYbVx6x/bDTF3itD7HKc9q1mE2JS3DkGAR4y2SDAKCXoZkW1yF6EExrCnp5Zbi+lTDFsQYduxDXPK46J/DyRBPYFssCD64BaNPfYzsKI44T49hN3xscpim6QL7qwKZVTvxsHZO46NVlFu9XEnAx1DkwQXsUit6Ctlts4FidkM3Q7oeK6SgaqkOLtOTR6ByhmS9VlfkZmT55y3e/YZtlGLfdKQdaZkm8BUNdH5MXsrBw03G81Oke7e1wGLeCJ+DZwna7xUxgJk5UGVNj419XVxL1kCngvH+Jfa67PYbpC1Sb0MeiatlG0KggeqD4Wd45tQO4ECo4aoTxStFZHikiL7zP9X9gIVjQPhSwpo8nbP4NhdrTGkvZp+OTpVlgvWrelHPJGGJ+Jb040Q5MXoz7bHrB0Aln/qehiE=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36756003)(336012)(83380400001)(31696002)(47076005)(4744005)(2906002)(5660300002)(508600001)(426003)(2616005)(86362001)(4326008)(31686004)(70206006)(70586007)(356005)(36860700001)(110136005)(82310400003)(16526019)(26005)(186003)(53546011)(7636003)(316002)(16576012)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 12:56:03.6506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 808fe0fa-b40f-4030-16b5-08d97f5aaab7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4982
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 24/09/2021 13:15, miles.chen@mediatek.com wrote:
> From: Jon Hunter <jonathanh@nvidia.com>
> 
> 
>> This is still broken in the mainline. Any plans to get this fix merged 
>> there? I believe it has now been broken for nearly 2 weeks.
> 
> the fix [1] is in linux-next now, thanks.

Yes I know that. However, we need it in the mainline. It has been broken 
for nearly 2 weeks now and all our automation for mainline is not 
running because we cannot build. Please get this fix into mainline as 
soon as possible.

Jon

-- 
nvpublic
