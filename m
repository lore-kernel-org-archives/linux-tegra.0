Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E793C2B9F4
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Jun 2021 08:28:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81A0361C29
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Jun 2021 08:28:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbhF1Ia7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Jun 2021 04:30:59 -0400
Received: from mail-bn7nam10on2062.outbound.protection.outlook.com ([40.107.92.62]:50017
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232378AbhF1Ia7 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Jun 2021 04:30:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvTkJ6I/DUIUG/R42Esr+BiHMjrQAPYL12TECf6OFIl4HpqSosIYaZ7bGbtnpndS00P9RQ2L+zOhJN5Xi2AA6olauNLQxwM94kkbDfBmrzldWMlBjIYcN1YmUmiE8qgM/wZ9FVyKEUIgY1DJKPYHGAZt4r5FYvAe/t3R0SVkDC1YwE3sOBrD94O5TcRbaYtZUiVCIhOrJOB50t5IvqYBwZFP8srQglmnTLlugOZNfZGjUjepkWY7eEuwAKQEBlPsuLKbn7DxWcZ+WkJztLy1M7aJk92fag2Fg4zPf0Jxi0lePey5aCf0JOa+I3rIDD5dZE9kG+TpQrB9OO50jWVEmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/qVlOI17/ruiq2J9x5tdImUEtDlA6XvwQayKyFyZ0Y=;
 b=jffB5creiFHeH6Wjx5ORyJkOwWMfljBHZ24HiR77d+drLdAmlqDEROtiAME1mJdkHqXZYD4xhys8hmfcZSHzHmWENGVDaRYr+4LV/P6pSXB/p/vAP17kWAVavBg9n7XnRp1xFIArsXY1GOTlPiF8VE/BIxl3LVzlp/6HWFaFxAE+iMwzIKs8FF5yojqfwkfjgQdMqNhafA9XYKPaky9z78MpnJXyzBV4cpeVAl+ckw+B+HJ5nmvnGINi32494ZeXF8VFrx6WwtaVqDDIIoLJNoju1bOZ3WJqjg6ukVPCf9QCaN5a33wJcVaA8wMoStUrC8bQeLwaPctaaV4NaHXVQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/qVlOI17/ruiq2J9x5tdImUEtDlA6XvwQayKyFyZ0Y=;
 b=nKeGYPnZ8LMwDVQKNqDLQesAdUVKEjGyDr5/mdy5ertCWio43DBs1YiJ4kN/DDUydy/nuG+R30lrJADePbT2ef3GjMJ2L7mOSSdfPjqFgrjzEVKHqTIqqs0pfem/lX2dMGVoBKYxoha5q1yA2W7kNG0xvKCQqmzhRR8RI+YwrglN+CbXjxA9yS90b3w7pv1TIAXvUtYAZUh45eAhEGsSOalpYdWsIP+rDWm0olPvCmFwq/vXcY/3l2bZ61q6tfBW6F9LwqpW2/XxS0gpe1G7+MR839Vl7thHR6zPCLrl3tgUQk4JBSWV6r7BJroPZQ7RoWwczHhNs2JughMFJ8Qo3w==
Received: from DM5PR06CA0095.namprd06.prod.outlook.com (2603:10b6:3:4::33) by
 BL0PR12MB2434.namprd12.prod.outlook.com (2603:10b6:207:4d::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19; Mon, 28 Jun 2021 08:28:32 +0000
Received: from DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:4:cafe::5c) by DM5PR06CA0095.outlook.office365.com
 (2603:10b6:3:4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Mon, 28 Jun 2021 08:28:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT048.mail.protection.outlook.com (10.13.173.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 08:28:32 +0000
Received: from [10.26.49.10] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Jun
 2021 08:28:29 +0000
Subject: Re: [PATCH] soc/tegra: Fix an error handling path in
 'tegra_powergate_power_up()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        <thierry.reding@gmail.com>, <digetx@gmail.com>,
        <ulf.hansson@linaro.org>, <maz@kernel.org>,
        <gustavoars@kernel.org>, <jckuo@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <46d3af4a83e2e7b680c857e8969167f0d2d94841.1624809134.git.christophe.jaillet@wanadoo.fr>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <52f72ce4-a630-af2f-858e-488e4dd7d9cf@nvidia.com>
Date:   Mon, 28 Jun 2021 09:28:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <46d3af4a83e2e7b680c857e8969167f0d2d94841.1624809134.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29a36b55-d20a-423e-7435-08d93a0eb71b
X-MS-TrafficTypeDiagnostic: BL0PR12MB2434:
X-Microsoft-Antispam-PRVS: <BL0PR12MB24343D398D7021B27BA15F3AD9039@BL0PR12MB2434.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vlyKjluu++3ibjG2u+NioAS92veO1OHq5/bbMPuUO9Z6+BSnDDPy4CXHEQa9iLOR1pFWyf1EnPSjoagHKB7/Op0Fr/Zl+0PstWb//I8bZOHWBoAfiyv3pdc8PrppIljQghf5mpTpbgqpzCmwLJX6HtRekJ1vtb/BapvQybM1rcfJAO5Uisa79engxL+6Nc0/T+uw4Ra807GN9wg56/gzfbodrSV3NGeew9EJMVCUcnTICAHWcFLd2gQAVuGnCsLkWY1kUhzFNAtG/HJn+d7rbcVEo7cwGmGUxwdmsFZDuDc3mUaclLbEa0/rzjKdK6qI1JXkFqTI7OpqkvGabEa5Bx2Ns1TKmizY4ggBXIBEdz9XkVPoeo9Yd8rKPH3rsK0hqjbf99Z72FcPmJ+I6ku+6AV6t6kAG7W5XMz76p4D/eWk3ppuckV8nTTTSccymTw60OGjaN03Q9o/e6n1KDZIelrVqTk+7TGFlbvBaNEo37EP5BSlXC9P3m3hHWBZetWZUy7a5EFgZURhfoUsWsMmCP1yFxRUmR3F8KTxDAxZXgwfhuMe0hQSOe58y3JAaR6MZfknSq/Ss0sXRrqAMb4b9Vh4cOdHoIvUEp35leQSqSRFUC2KhhenaeUcpznNEimvHldHnJ9t0hr6zcCM2QlCs+OaecnZQNV41YzR0wq32pTx0dGX3YJxVlM8D/cYvnN69oGWAGMOddlm6mUG7OYVKiIXG9qDN6F6Iim9wlAGhBo=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(46966006)(36840700001)(36860700001)(5660300002)(6636002)(16526019)(336012)(8936002)(31686004)(53546011)(86362001)(82740400003)(70206006)(426003)(70586007)(8676002)(110136005)(316002)(7636003)(478600001)(2616005)(356005)(4326008)(186003)(36756003)(16576012)(31696002)(26005)(82310400003)(47076005)(2906002)(83380400001)(54906003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 08:28:32.4599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a36b55-d20a-423e-7435-08d93a0eb71b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2434
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 27/06/2021 16:54, Christophe JAILLET wrote:
> If an error occurs after a successful 'tegra_powergate_enable_clocks()'
> call, it must be undone by a 'tegra_powergate_disable_clocks()' call, as
> already done in the below and above error handling paths of this function.
> 
> Update the 'goto' to branch at the correct place of the error handling
> path.
> 
> Fixes: a38045121bf4 ("soc/tegra: pmc: Add generic PM domain support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> /!\ This patch is speculative /!\
> Review with care.
> ---
>  drivers/soc/tegra/pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index ea62f84d1c8b..b8ef9506f3de 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -782,7 +782,7 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
>  
>  	err = reset_control_deassert(pg->reset);
>  	if (err)
> -		goto powergate_off;
> +		goto disable_clks;
>  
>  	usleep_range(10, 20);


Thanks for the fix.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
