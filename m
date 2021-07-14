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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873FAC11F67
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 17:59:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67C6C613C9
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 17:59:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbhGNSB6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Jul 2021 14:01:58 -0400
Received: from mail-dm6nam12on2045.outbound.protection.outlook.com ([40.107.243.45]:24864
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229685AbhGNSB6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Jul 2021 14:01:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCpXQSpZvCtHImOs4w4XscFjR7NV6ve+YFNACvcmbE8Z3HvAgW0YrieMnIFqwzVREt+T4YY8Tbbe28wEi1ykzRLE72xdUfatEuZwAtALdd774DSGYB6OI0VPm+wreLFiT7lLVOEwVxWhjylBjl14OeO4rmbUTW07Z4nQdcXcEsjWgYEl4B8FhtMvgAaVLcZZU6sT/hzkXYhHumviBVzYhaq+1XhCMSaeLnCRdEQE6U3N5U/pgjbh9AiiD2Tvgj2o8m+5tGEtS+cXxGBZB4mmz5RAlaZfz0kaXCVSUSP2EtQ2t97HPPZ87hU7gPEEYtc2XWCIyWAM7A5itSOHK4Hk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXxn7OgoTMcguY6W+LzG43oZYffxO8c7agZeMfqbS/0=;
 b=lk3uoY1vV3+LGNyq7VDn/5WPt82oObHGbakvas0BRmEqjOpHMFb5MBJ3bME1Rl8X8oSDRl8qVkHkudRWPRGe51yccH1RbyZO9JO+s14L7KPOKQbsHz439pV+5hNJIeGmDTutj40mEcJ+Oi5wE8wkSPbom08MGzBsjcFYE+eXCbX/wxuug2gxmnDNYr+pp9xtXmj0tN+movqDGNgx4a62vPZC2J7fRe4pBVYwhVkzdBh+OhXdjjpGQiG85wdMz++Tw6mbyPPNMjfyDJSBWKy6rICQ+pho3LHPPIl2Yhc72k3U9cVfcsRKGbhUUWJj114UUdwVFXGe5OXmSiHfERrhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXxn7OgoTMcguY6W+LzG43oZYffxO8c7agZeMfqbS/0=;
 b=L0gQ21YrMdek56eZfyM95lbSpi+KN0SJTZvn4ivY9MKo+J04YmtKlnk73YjE0biPnGuT70JE3S1GbF7HwzPE5sZ3y2y2U7Sj2Mp4/IQ8ZRWlxHxlQ/zaFICfu6Bi8fVAvQPFw1nGzkOt4MViHDehScnG8k1as8exMMytTAadDaxAv1UlJqCfgHkfLNi/fey1YuBT0UOw8zEyJloP3lcmlbGMYGXDrihrx6XRayqXMFjte4RBJgwxz0UAUdArIditCkkOfzEc4ZVcsMgFngqRP4KEBfJXhRcIy9Uu+7/1dT3XAw2VQJKIwqcThdkFsdS/U53yiXfnXEZRjcGs9vu4lw==
Received: from BN8PR12CA0006.namprd12.prod.outlook.com (2603:10b6:408:60::19)
 by BN6PR12MB1698.namprd12.prod.outlook.com (2603:10b6:404:106::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 17:59:04 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::d0) by BN8PR12CA0006.outlook.office365.com
 (2603:10b6:408:60::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Wed, 14 Jul 2021 17:59:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 17:59:04 +0000
Received: from [10.26.49.10] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Jul
 2021 17:59:00 +0000
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
 <fa13f623-dbd1-9b0c-dfd1-8d58800e04b4@nvidia.com>
 <e61f1ee5-2c1e-7a1b-094e-810a587ce3cd@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c3abab78-2172-51b7-88c3-20f69fbec3b5@nvidia.com>
Date:   Wed, 14 Jul 2021 18:58:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e61f1ee5-2c1e-7a1b-094e-810a587ce3cd@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb53a789-53a5-460e-4dca-08d946f111a2
X-MS-TrafficTypeDiagnostic: BN6PR12MB1698:
X-Microsoft-Antispam-PRVS: <BN6PR12MB16986515DF651E3CA49197DCD9139@BN6PR12MB1698.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0NBbSCqOnsYBkbz48xNu55mdgOXSPy4ZhxNjAkhqN8SzhyovC9KKByaxK/ZRAhw0iC+GV3DbhGvwfmQbgii0Y79L4DixVXnKD7f1qKAp3QvbKPVnGFwLCd0J46Tlvsi5Jh1AAOrU4exKw0E8RcXr8apmnvRtmVs8mVNXa3nrX0fbpWg8KZwqjoczSGj6z4bUijDBGgqyy1G/Hy7yGnYMxUgioj+YFSNBIuMd5XPhVc5svuDtUA4Kr6XI32EcgP+4+ERfrIKkKijLxKVQMIBNTue50kWNKiTCtXMlZfYF0trvLbfpMF7nadaWGbI/du/HupkKKRvUWYB/3zuxx7Y4tjqIJaLGqXNe6x0jUaFrxTm+198CwF4QXex21eb9nZO2JlRqw8d4TIZOl+Ka33Vfvg/Y6xVm8qY2zRTQIpa4hrISlfwe5ijO+Zz/C44WLQKfm2gCo0W/2CX8gkw1kcOb6xaVNWbfxUoLicfNXOqLiBrfAwDrNIKVx2QcZ+h1OSmkenclJk1ie5nUCD/TComU3hwwxWUKlIEMLf2mSd+lH1pj/t9xIucDDYHAbI9mSuuBh6Ajo9eOiuEpnqDmxJgdjWCLBW8CBN0OWiBF7EfoujZnhVT1yErFTdrW+2o9nC3H8xNQuo4sOio7sTpwF52SFtpWA9LbH7iG91bA0Vfh77Ujh5nxwlHTCxP9wy0L1Uh3owADPEUnEeWoX5qcJHHMWpGkECLsRGlirdQuffmNkT70NYKzBYaN4rD2PvnGdI8a/bfxDmdmgGRZnHnJy8fnNA==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(36840700001)(46966006)(36860700001)(186003)(54906003)(2616005)(8936002)(16526019)(336012)(110136005)(426003)(16576012)(8676002)(70206006)(53546011)(316002)(36906005)(70586007)(83380400001)(31696002)(26005)(47076005)(2906002)(86362001)(36756003)(31686004)(82310400003)(356005)(4326008)(7636003)(7416002)(34020700004)(82740400003)(478600001)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 17:59:04.4578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb53a789-53a5-460e-4dca-08d946f111a2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1698
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 14/07/2021 12:59, Dmitry Osipenko wrote:
> 14.07.2021 14:48, Jon Hunter пишет:
>>
>> On 16/05/2021 17:30, Dmitry Osipenko wrote:
>>> The refcounting of the gate clocks has a bug causing the enable_refcnt
>>> to underflow when unused clocks are disabled. This happens because clk
>>> provider erroneously bumps the refcount if clock is enabled at a boot
>>> time, which it shouldn't be doing, and it does this only for the gate
>>> clocks, while peripheral clocks are using the same gate ops and the
>>> peripheral clocks are missing the initial bump. Hence the refcount of
>>> the peripheral clocks is 0 when unused clocks are disabled and then the
>>> counter is decremented further by the gate ops, causing the integer
>>> underflow.
>>>
>>> Fix this problem by removing the erroneous bump and by implementing the
>>> disable_unused() callback, which disables the unused gates properly.
>>>
>>> The visible effect of the bug is such that the unused clocks are never
>>> gated if a loaded kernel module grabs the unused clocks and starts to use
>>> them. In practice this shouldn't cause any real problems for the drivers
>>> and boards supported by the kernel today.
>>>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

...

> Seems you'll need to implement the disable_unused() callback for the
> clk_sdmmc_mux to fix it. It's good that this problem has been caught.
> 
> diff --git a/drivers/clk/tegra/clk-sdmmc-mux.c
> b/drivers/clk/tegra/clk-sdmmc-mux.c
> index 316912d3b1a4..4f2c3309eea4 100644
> --- a/drivers/clk/tegra/clk-sdmmc-mux.c
> +++ b/drivers/clk/tegra/clk-sdmmc-mux.c
> @@ -194,6 +194,15 @@ static void clk_sdmmc_mux_disable(struct clk_hw *hw)
>  	gate_ops->disable(gate_hw);
>  }
> 
> +static void clk_sdmmc_mux_disable_unused(struct clk_hw *hw)
> +{
> +	struct tegra_sdmmc_mux *sdmmc_mux = to_clk_sdmmc_mux(hw);
> +	const struct clk_ops *gate_ops = sdmmc_mux->gate_ops;
> +	struct clk_hw *gate_hw = &sdmmc_mux->gate.hw;
> +
> +	gate_ops->disable_unused(gate_hw);
> +}
> +
>  static void clk_sdmmc_mux_restore_context(struct clk_hw *hw)
>  {
>  	struct clk_hw *parent = clk_hw_get_parent(hw);
> @@ -218,6 +227,7 @@ static const struct clk_ops tegra_clk_sdmmc_mux_ops = {
>  	.is_enabled = clk_sdmmc_mux_is_enabled,
>  	.enable = clk_sdmmc_mux_enable,
>  	.disable = clk_sdmmc_mux_disable,
> +	.disable_unused = clk_sdmmc_mux_disable_unused,
>  	.restore_context = clk_sdmmc_mux_restore_context,
>  };
> 


Thanks, that fixes it! Please feel free to add my test-by and acked-by
when you send out the patch.

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers!
Jon

-- 
nvpublic
