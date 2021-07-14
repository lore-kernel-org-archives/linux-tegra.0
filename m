Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6923C11F66
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 11:48:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2491613AF
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 11:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbhGNLvR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Jul 2021 07:51:17 -0400
Received: from mail-dm6nam10on2071.outbound.protection.outlook.com ([40.107.93.71]:27041
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230405AbhGNLvQ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Jul 2021 07:51:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQNFrvXFtOG9ToK9/oXR0KM4/l4gbKAtAvS2JmRGeBySrGq0CXZVSfkbbcKlobMwav0KugBPv7Km1u6+wugvNfRkMiFcxkxx/rYkttrn2KgXLSlmCrRySdqmH8XgpOym7P91c0pFyA9SE2aSJ4LFKK+xHch7P950jp0proQbHmh5GDnWe1h7P2iX6jl/wa+mbalBDYp+apff+3F71Ae8e94TIvL+avK33YGQiixEMROP7PHuWPmO45UTTHAlAm8OocE8uXk2cHuTkARIwrDV+RE21eLG8tfkXruWCbvEReVniWtN332ZXW/UKUoBzEodw109EYlET3AY1vYH+rHWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYrKNqKfovm55LhLTJNP0tcBZiW+FInUoZ8DFv72V8g=;
 b=Jtn7KlhU+YdXly+MWZUQAwuVHnbtjbmjL2Eg5Zh2/gZP6I8K4bz5FDxXpMsBHeKPyJnrBdo6VivEd+N+m3F8TGgc8oj1h5IZvUqmhw98Tn1xsfH3NNH1ujbsFuRfHmySjzw/L7yAezoAJYV/kMEeuGDedV5Xv3AI53tn0YuFpgwK9mWAPnUWdPF1OdqyrYJL2XoeJtpvBtocb89FeBbFHH7CC4xPetcUei8d4E5QSKDqyH8F1Ce7yfAJoTAJTf2WTFhW5QIP7MJ/gfO8BnUEDdwVnZQLniHNdcFqOcP2y0i8JPa4yAdMX1DZE3wvaoZzuKuwU+DyMDcy9DhM3D2Gvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYrKNqKfovm55LhLTJNP0tcBZiW+FInUoZ8DFv72V8g=;
 b=CxYFtsBb/zMCab5HqdbeAzqIAL9ZpRN25WLHfQnlVEq4VEeFuMMDCa+YZEkzmXcWgM3I/YgWUCP8TrIFhtqXzatCgUbLbz/SkDOYO05x2cWC1DEDDioOyrqjsGHEawntejgC3qKjUJblCROy/AeEDy7iAzY1p15V1diG4skDLTnWR+me1NxIpUbstKznQiJLgxahwZIqQdPk5/N0sIcyXea9sGdjgWikPioNtCJXqjQUyFUejX72vgGWTJH3uOa7tZch+lb1zYFLDT3Hyl5WVJyw6kE5FzmQQxn2I+U4PgU+OSjLa2ItCEDy+ZzN6bZiZSEHfkNoUDMGF0XborfYow==
Received: from MWHPR1401CA0023.namprd14.prod.outlook.com
 (2603:10b6:301:4b::33) by BL0PR12MB2482.namprd12.prod.outlook.com
 (2603:10b6:207:4a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 14 Jul
 2021 11:48:23 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4b:cafe::c2) by MWHPR1401CA0023.outlook.office365.com
 (2603:10b6:301:4b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Wed, 14 Jul 2021 11:48:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 11:48:22 +0000
Received: from [10.26.49.10] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Jul
 2021 11:48:19 +0000
Subject: Re: [PATCH v8 2/9] clk: tegra: Fix refcounting of gate clocks
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20210516163041.12818-1-digetx@gmail.com>
 <20210516163041.12818-3-digetx@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <fa13f623-dbd1-9b0c-dfd1-8d58800e04b4@nvidia.com>
Date:   Wed, 14 Jul 2021 12:48:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210516163041.12818-3-digetx@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74cd21e8-c596-4c17-f303-08d946bd488a
X-MS-TrafficTypeDiagnostic: BL0PR12MB2482:
X-Microsoft-Antispam-PRVS: <BL0PR12MB24823194EB3EEA511B13ECB0D9139@BL0PR12MB2482.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q+BaAtqL6f5L3qsSGbZsTlFe1UBrdw3H0BOo0jKcLcYXbXi/mBJU/+eUAYZyJIXmE0jIGSP0/5dlytwYAxlLyeqEuHESTLWmlhE3MwDG/dyv4BZpmR053+XyM8UWJTVMCH4LMms56XlPzcLZfHO0WmuDkm2PbT0AukSv2H7xXHVGaOYqG6C8Ot+l2A6oNufXk405KB1aZskyskmOUJXgAtqmloH/kKfU+jdnDxlWPFTjpFotYwnz7hNiRlMCSreG5ZNZVhZ/PIqkUPSd/iL8PM5rdSkJzdmwu7DYQphT9GRsWC2qRz02HAy9YkfZjWMAy+psLDjBVv4LwCZtFgtUlwS/HGTFghSmjZB309raAiZUnFoiRiW6NwmIVVggl5M0iHRJoou1fR+rU/hZlanm7/CxPwy0nnJUahXQceIXFfY4bXYtuW7SlleUL7kZR5hYIA0z42KkxuvEynCZ7kunIcgZ5iv0rigYlQSYh/fXUmjSvG/aeNGYlSavRvJw/6R2iF/i01OP54qtmy9vRFFXyGTkF/svx8X2ZYoouF34Ll/7gN/23LngNa3ji7iSJSHVU/+tfXJILptMvf3bhTL2OkBNsQgr3uaHASMpxIW7+IIR4mK4wHNUQEkgJH8SrkboV7jksyOgthndaMNcBvJCRpsBNrilOn2vm4/FgrbG1WWMZCYVEPec168EFiH5gAl71n5QzLBMxqorGb2ga8DcCLVxdh8TUwyADXSjWBdkltL+nGYaMfWRa7a4P0yAC1zG/+Y6/J9OkH1h+JjgvEvDbQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966006)(36840700001)(36756003)(2906002)(83380400001)(8676002)(8936002)(47076005)(45080400002)(478600001)(4326008)(7416002)(54906003)(110136005)(36860700001)(70206006)(336012)(82310400003)(356005)(2616005)(70586007)(426003)(31696002)(5660300002)(34020700004)(316002)(16576012)(7636003)(16526019)(186003)(36906005)(86362001)(26005)(53546011)(31686004)(82740400003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 11:48:22.8325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74cd21e8-c596-4c17-f303-08d946bd488a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2482
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 16/05/2021 17:30, Dmitry Osipenko wrote:
> The refcounting of the gate clocks has a bug causing the enable_refcnt
> to underflow when unused clocks are disabled. This happens because clk
> provider erroneously bumps the refcount if clock is enabled at a boot
> time, which it shouldn't be doing, and it does this only for the gate
> clocks, while peripheral clocks are using the same gate ops and the
> peripheral clocks are missing the initial bump. Hence the refcount of
> the peripheral clocks is 0 when unused clocks are disabled and then the
> counter is decremented further by the gate ops, causing the integer
> underflow.
> 
> Fix this problem by removing the erroneous bump and by implementing the
> disable_unused() callback, which disables the unused gates properly.
> 
> The visible effect of the bug is such that the unused clocks are never
> gated if a loaded kernel module grabs the unused clocks and starts to use
> them. In practice this shouldn't cause any real problems for the drivers
> and boards supported by the kernel today.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk-periph-gate.c | 72 +++++++++++++++++++----------
>  drivers/clk/tegra/clk-periph.c      | 11 +++++
>  2 files changed, 58 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-periph-gate.c
> index 4b31beefc9fc..dc3f92678407 100644
> --- a/drivers/clk/tegra/clk-periph-gate.c
> +++ b/drivers/clk/tegra/clk-periph-gate.c
> @@ -48,18 +48,9 @@ static int clk_periph_is_enabled(struct clk_hw *hw)
>  	return state;
>  }
>  
> -static int clk_periph_enable(struct clk_hw *hw)
> +static void clk_periph_enable_locked(struct clk_hw *hw)
>  {
>  	struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
> -	unsigned long flags = 0;
> -
> -	spin_lock_irqsave(&periph_ref_lock, flags);
> -
> -	gate->enable_refcnt[gate->clk_num]++;
> -	if (gate->enable_refcnt[gate->clk_num] > 1) {
> -		spin_unlock_irqrestore(&periph_ref_lock, flags);
> -		return 0;
> -	}
>  
>  	write_enb_set(periph_clk_to_bit(gate), gate);
>  	udelay(2);
> @@ -78,6 +69,32 @@ static int clk_periph_enable(struct clk_hw *hw)
>  		udelay(1);
>  		writel_relaxed(0, gate->clk_base + LVL2_CLK_GATE_OVRE);
>  	}
> +}
> +
> +static void clk_periph_disable_locked(struct clk_hw *hw)
> +{
> +	struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
> +
> +	/*
> +	 * If peripheral is in the APB bus then read the APB bus to
> +	 * flush the write operation in apb bus. This will avoid the
> +	 * peripheral access after disabling clock
> +	 */
> +	if (gate->flags & TEGRA_PERIPH_ON_APB)
> +		tegra_read_chipid();
> +
> +	write_enb_clr(periph_clk_to_bit(gate), gate);
> +}
> +
> +static int clk_periph_enable(struct clk_hw *hw)
> +{
> +	struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
> +	unsigned long flags = 0;
> +
> +	spin_lock_irqsave(&periph_ref_lock, flags);
> +
> +	if (!gate->enable_refcnt[gate->clk_num]++)
> +		clk_periph_enable_locked(hw);
>  
>  	spin_unlock_irqrestore(&periph_ref_lock, flags);
>  
> @@ -91,21 +108,28 @@ static void clk_periph_disable(struct clk_hw *hw)
>  
>  	spin_lock_irqsave(&periph_ref_lock, flags);
>  
> -	gate->enable_refcnt[gate->clk_num]--;
> -	if (gate->enable_refcnt[gate->clk_num] > 0) {
> -		spin_unlock_irqrestore(&periph_ref_lock, flags);
> -		return;
> -	}
> +	WARN_ON(!gate->enable_refcnt[gate->clk_num]);
> +
> +	if (--gate->enable_refcnt[gate->clk_num] == 0)
> +		clk_periph_disable_locked(hw);
> +
> +	spin_unlock_irqrestore(&periph_ref_lock, flags);
> +}


A consequence of this change is now I see the following on Tegra210
Jetson Nano ...

[    8.138810] ------------[ cut here ]------------
[    8.150529] WARNING: CPU: 3 PID: 1 at /dvs/git/dirty/git-master_l4t-upstream/kernel/drivers/clk/tegra/clk-periph-gate.c:103 clk_periph_disable+0x68/0x90
[    8.164279] Modules linked in:
[    8.167373] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc1-gb34c0e9111d0 #1
[    8.174905] Hardware name: NVIDIA Jetson Nano Developer Kit (DT)
[    8.180934] pstate: 000000c5 (nzcv daIF -PAN -UAO -TCO BTYPE=--)
[    8.186983] pc : clk_periph_disable+0x68/0x90
[    8.191388] lr : clk_periph_disable+0x20/0x90
[    8.195788] sp : ffff8000120abca0
[    8.199123] x29: ffff8000120abca0 x28: 0000000000000000 x27: ffff800011791070
[    8.206331] x26: ffff8000116e0458 x25: ffff800011fe3000 x24: ffff800011fe3000
[    8.213527] x23: ffff000080138000 x22: 0000000000000000 x21: 00000000000000c0
[    8.220725] x20: ffff0000800391b8 x19: ffff800012047000 x18: 0000000000000068
[    8.227920] x17: 0000000000000007 x16: 0000000000000001 x15: ffff800011222000
[    8.235116] x14: ffff8000120ab940 x13: ffff800011f629b8 x12: ffff000000000001
[    8.242313] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
[    8.249507] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000004
[    8.256700] x5 : ffff800011040d10 x4 : 0000000000000000 x3 : 000000000000000f
[    8.263892] x2 : ffff00008000c400 x1 : 0000000000000000 x0 : 0000000000000000
[    8.271088] Call trace:
[    8.273557]  clk_periph_disable+0x68/0x90
[    8.277615]  clk_sdmmc_mux_disable+0x1c/0x28
[    8.281924]  clk_disable_unused_subtree+0xac/0xe4
[    8.286685]  clk_disable_unused_subtree+0x3c/0xe4
[    8.291433]  clk_disable_unused_subtree+0x3c/0xe4
[    8.296182]  clk_disable_unused_subtree+0x3c/0xe4
[    8.300931]  clk_disable_unused_subtree+0x3c/0xe4
[    8.305678]  clk_disable_unused+0x5c/0xe8
[    8.309730]  do_one_initcall+0x58/0x1b8
[    8.313607]  kernel_init_freeable+0x22c/0x29c
[    8.318002]  kernel_init+0x20/0x120
[    8.321536]  ret_from_fork+0x10/0x18
[    8.325150] ---[ end trace b5b8bc7cd88ff097 ]---


Any thoughts on how to resolve this?

I now see this has been picked up for stable, but I don't see where
this was tagged for stable and so I am not sure how that happened?

Jon

-- 
nvpublic
