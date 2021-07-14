Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6829C11F67
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 12:00:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F7FB6128B
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 12:00:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239271AbhGNMC4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Jul 2021 08:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239276AbhGNMCx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Jul 2021 08:02:53 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65D0C061766;
        Wed, 14 Jul 2021 05:00:01 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id h9so2988203ljm.5;
        Wed, 14 Jul 2021 05:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2npMGSVMz93HDxKFt2vGxTMDB6GmAmEEWPg6NT2aXQs=;
        b=rk8KJK+wAW/0L1Hr5gSfUxfI5yh+B4nNkIHbRX2mUq6p2OqnyLv85lQF64i8yfHldp
         jSoR+abxra7dhixDjqf9A3c0qvvv8bCf4k7Jspcb9kPfVNDeqCv4gnYYM+mzjAs8Owc3
         GpZDI7+mabxI6TDghTnyMRXSO4DR5KHnU4G59+y5gm80X5cut+t3neuWGChGSfimJ3wF
         4lr0F0CHOnicvLpbJZto8VYy1LJJeLYNDqPj68V7vCz8o+kqVj5X+x1+fHhBFJji2IrD
         10KVO1ZVDHgbkhOC0KwnD7MmzdIvscPGHgde0TpiPtJtMC6+dkMKH+P2ljhkL3p/gt0x
         e4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2npMGSVMz93HDxKFt2vGxTMDB6GmAmEEWPg6NT2aXQs=;
        b=s/7CQQFlMV8If9VtPyzC0cpoNPBjeUJ5fcwlvZP4Uf6v4qG7XDh5GPT62aF84RFKPz
         VtXdUXiyQ+IhUPUWXzGiIZtZCJLi3vCJAI9x5eSy9ymmP5Gm+A/p0Izy8gMiyCVGhq3h
         0eZTzLkUJK1ABqLTwixT6nGlFYya27l0/FuXDui6N3nVQMf2QePu8kEPEQYUQt6DAgny
         1lz7keeEZI3NNnYtt3JQqWbqfGcCOPR8Vw62MjjyIBpLbX9mVebMsU9z7XcqYyknlaz+
         VAlW7I43Hez5y5twOVN5ODH1pfbzU1+RkaLOLKTLD875hsFjiEZ/BXoSMx7T8jJguEX5
         bBtQ==
X-Gm-Message-State: AOAM532OHEb5Q9n72bMaB/dCEdKX8tI/pHQFdvf5ZdNAwOO5ixIG6EOh
        EZhMVQoX65BePxEgDgW7f/ZIoCLadIM=
X-Google-Smtp-Source: ABdhPJxRXEMPkgjgf2al80idTVWUieRnheauI9rCtgfQ2cRFxozEZt5qO3sP9o9GA1eYyHAJ2PF/2w==
X-Received: by 2002:a2e:a288:: with SMTP id k8mr8577728lja.107.1626263999864;
        Wed, 14 Jul 2021 04:59:59 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.googlemail.com with ESMTPSA id x3sm149458lfr.201.2021.07.14.04.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 04:59:59 -0700 (PDT)
Subject: Re: [PATCH v8 2/9] clk: tegra: Fix refcounting of gate clocks
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20210516163041.12818-1-digetx@gmail.com>
 <20210516163041.12818-3-digetx@gmail.com>
 <fa13f623-dbd1-9b0c-dfd1-8d58800e04b4@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e61f1ee5-2c1e-7a1b-094e-810a587ce3cd@gmail.com>
Date:   Wed, 14 Jul 2021 14:59:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fa13f623-dbd1-9b0c-dfd1-8d58800e04b4@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

14.07.2021 14:48, Jon Hunter пишет:
> 
> On 16/05/2021 17:30, Dmitry Osipenko wrote:
>> The refcounting of the gate clocks has a bug causing the enable_refcnt
>> to underflow when unused clocks are disabled. This happens because clk
>> provider erroneously bumps the refcount if clock is enabled at a boot
>> time, which it shouldn't be doing, and it does this only for the gate
>> clocks, while peripheral clocks are using the same gate ops and the
>> peripheral clocks are missing the initial bump. Hence the refcount of
>> the peripheral clocks is 0 when unused clocks are disabled and then the
>> counter is decremented further by the gate ops, causing the integer
>> underflow.
>>
>> Fix this problem by removing the erroneous bump and by implementing the
>> disable_unused() callback, which disables the unused gates properly.
>>
>> The visible effect of the bug is such that the unused clocks are never
>> gated if a loaded kernel module grabs the unused clocks and starts to use
>> them. In practice this shouldn't cause any real problems for the drivers
>> and boards supported by the kernel today.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/clk/tegra/clk-periph-gate.c | 72 +++++++++++++++++++----------
>>  drivers/clk/tegra/clk-periph.c      | 11 +++++
>>  2 files changed, 58 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-periph-gate.c
>> index 4b31beefc9fc..dc3f92678407 100644
>> --- a/drivers/clk/tegra/clk-periph-gate.c
>> +++ b/drivers/clk/tegra/clk-periph-gate.c
>> @@ -48,18 +48,9 @@ static int clk_periph_is_enabled(struct clk_hw *hw)
>>  	return state;
>>  }
>>  
>> -static int clk_periph_enable(struct clk_hw *hw)
>> +static void clk_periph_enable_locked(struct clk_hw *hw)
>>  {
>>  	struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
>> -	unsigned long flags = 0;
>> -
>> -	spin_lock_irqsave(&periph_ref_lock, flags);
>> -
>> -	gate->enable_refcnt[gate->clk_num]++;
>> -	if (gate->enable_refcnt[gate->clk_num] > 1) {
>> -		spin_unlock_irqrestore(&periph_ref_lock, flags);
>> -		return 0;
>> -	}
>>  
>>  	write_enb_set(periph_clk_to_bit(gate), gate);
>>  	udelay(2);
>> @@ -78,6 +69,32 @@ static int clk_periph_enable(struct clk_hw *hw)
>>  		udelay(1);
>>  		writel_relaxed(0, gate->clk_base + LVL2_CLK_GATE_OVRE);
>>  	}
>> +}
>> +
>> +static void clk_periph_disable_locked(struct clk_hw *hw)
>> +{
>> +	struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
>> +
>> +	/*
>> +	 * If peripheral is in the APB bus then read the APB bus to
>> +	 * flush the write operation in apb bus. This will avoid the
>> +	 * peripheral access after disabling clock
>> +	 */
>> +	if (gate->flags & TEGRA_PERIPH_ON_APB)
>> +		tegra_read_chipid();
>> +
>> +	write_enb_clr(periph_clk_to_bit(gate), gate);
>> +}
>> +
>> +static int clk_periph_enable(struct clk_hw *hw)
>> +{
>> +	struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
>> +	unsigned long flags = 0;
>> +
>> +	spin_lock_irqsave(&periph_ref_lock, flags);
>> +
>> +	if (!gate->enable_refcnt[gate->clk_num]++)
>> +		clk_periph_enable_locked(hw);
>>  
>>  	spin_unlock_irqrestore(&periph_ref_lock, flags);
>>  
>> @@ -91,21 +108,28 @@ static void clk_periph_disable(struct clk_hw *hw)
>>  
>>  	spin_lock_irqsave(&periph_ref_lock, flags);
>>  
>> -	gate->enable_refcnt[gate->clk_num]--;
>> -	if (gate->enable_refcnt[gate->clk_num] > 0) {
>> -		spin_unlock_irqrestore(&periph_ref_lock, flags);
>> -		return;
>> -	}
>> +	WARN_ON(!gate->enable_refcnt[gate->clk_num]);
>> +
>> +	if (--gate->enable_refcnt[gate->clk_num] == 0)
>> +		clk_periph_disable_locked(hw);
>> +
>> +	spin_unlock_irqrestore(&periph_ref_lock, flags);
>> +}
> 
> 
> A consequence of this change is now I see the following on Tegra210
> Jetson Nano ...
> 
> [    8.138810] ------------[ cut here ]------------
> [    8.150529] WARNING: CPU: 3 PID: 1 at /dvs/git/dirty/git-master_l4t-upstream/kernel/drivers/clk/tegra/clk-periph-gate.c:103 clk_periph_disable+0x68/0x90
> [    8.164279] Modules linked in:
> [    8.167373] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc1-gb34c0e9111d0 #1
> [    8.174905] Hardware name: NVIDIA Jetson Nano Developer Kit (DT)
> [    8.180934] pstate: 000000c5 (nzcv daIF -PAN -UAO -TCO BTYPE=--)
> [    8.186983] pc : clk_periph_disable+0x68/0x90
> [    8.191388] lr : clk_periph_disable+0x20/0x90
> [    8.195788] sp : ffff8000120abca0
> [    8.199123] x29: ffff8000120abca0 x28: 0000000000000000 x27: ffff800011791070
> [    8.206331] x26: ffff8000116e0458 x25: ffff800011fe3000 x24: ffff800011fe3000
> [    8.213527] x23: ffff000080138000 x22: 0000000000000000 x21: 00000000000000c0
> [    8.220725] x20: ffff0000800391b8 x19: ffff800012047000 x18: 0000000000000068
> [    8.227920] x17: 0000000000000007 x16: 0000000000000001 x15: ffff800011222000
> [    8.235116] x14: ffff8000120ab940 x13: ffff800011f629b8 x12: ffff000000000001
> [    8.242313] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> [    8.249507] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000004
> [    8.256700] x5 : ffff800011040d10 x4 : 0000000000000000 x3 : 000000000000000f
> [    8.263892] x2 : ffff00008000c400 x1 : 0000000000000000 x0 : 0000000000000000
> [    8.271088] Call trace:
> [    8.273557]  clk_periph_disable+0x68/0x90
> [    8.277615]  clk_sdmmc_mux_disable+0x1c/0x28
> [    8.281924]  clk_disable_unused_subtree+0xac/0xe4
> [    8.286685]  clk_disable_unused_subtree+0x3c/0xe4
> [    8.291433]  clk_disable_unused_subtree+0x3c/0xe4
> [    8.296182]  clk_disable_unused_subtree+0x3c/0xe4
> [    8.300931]  clk_disable_unused_subtree+0x3c/0xe4
> [    8.305678]  clk_disable_unused+0x5c/0xe8
> [    8.309730]  do_one_initcall+0x58/0x1b8
> [    8.313607]  kernel_init_freeable+0x22c/0x29c
> [    8.318002]  kernel_init+0x20/0x120
> [    8.321536]  ret_from_fork+0x10/0x18
> [    8.325150] ---[ end trace b5b8bc7cd88ff097 ]---
> 
> 
> Any thoughts on how to resolve this?
> 
> I now see this has been picked up for stable, but I don't see where
> this was tagged for stable and so I am not sure how that happened?

Seems you'll need to implement the disable_unused() callback for the
clk_sdmmc_mux to fix it. It's good that this problem has been caught.

diff --git a/drivers/clk/tegra/clk-sdmmc-mux.c
b/drivers/clk/tegra/clk-sdmmc-mux.c
index 316912d3b1a4..4f2c3309eea4 100644
--- a/drivers/clk/tegra/clk-sdmmc-mux.c
+++ b/drivers/clk/tegra/clk-sdmmc-mux.c
@@ -194,6 +194,15 @@ static void clk_sdmmc_mux_disable(struct clk_hw *hw)
 	gate_ops->disable(gate_hw);
 }

+static void clk_sdmmc_mux_disable_unused(struct clk_hw *hw)
+{
+	struct tegra_sdmmc_mux *sdmmc_mux = to_clk_sdmmc_mux(hw);
+	const struct clk_ops *gate_ops = sdmmc_mux->gate_ops;
+	struct clk_hw *gate_hw = &sdmmc_mux->gate.hw;
+
+	gate_ops->disable_unused(gate_hw);
+}
+
 static void clk_sdmmc_mux_restore_context(struct clk_hw *hw)
 {
 	struct clk_hw *parent = clk_hw_get_parent(hw);
@@ -218,6 +227,7 @@ static const struct clk_ops tegra_clk_sdmmc_mux_ops = {
 	.is_enabled = clk_sdmmc_mux_is_enabled,
 	.enable = clk_sdmmc_mux_enable,
 	.disable = clk_sdmmc_mux_disable,
+	.disable_unused = clk_sdmmc_mux_disable_unused,
 	.restore_context = clk_sdmmc_mux_restore_context,
 };

