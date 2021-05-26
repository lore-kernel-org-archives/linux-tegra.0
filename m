Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D13C47088
	for <linux-tegra@archiver.kernel.org>; Wed, 26 May 2021 21:08:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 346D4613DE
	for <linux-tegra@archiver.kernel.org>; Wed, 26 May 2021 21:08:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbhEZVKE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 May 2021 17:10:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:38332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232452AbhEZVKD (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 May 2021 17:10:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28A95613DC;
        Wed, 26 May 2021 21:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622063311;
        bh=yrwh9NXllmpDxPVwReEAqxWduz2WlsK3NdzPDYgF1Zw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IVJq4A7j+K473EM2UDPiQcGNkigN73j/9Sda29M5BtnSEJeINW1Pl89JEDbwurH/i
         Idi49H1rKQKCWGAxOBWTzxDN5x6SnfrgqaXiCdq2LcQKqCJRbj/ZaW1VraT7b35dzy
         aKRddeIhVFNccVo/SH3KXfAbBouXDYDN4F0G8H5n7tQ5kR/5CuINw9oeXyStYVm7ig
         xUCeoPyvkNpNVpM/UfmCtG7BEpCCQoot0G9zTUaNQNaiYnbGK4o8GeRFw/++hSSUET
         HV1rfxfEdctyRGm/s3/BrexjfD1Q5S6aHyhAYeB08JcuY2Gi4M6lTWAdFaWObwg0Pz
         pvwE24h7jpGcQ==
Date:   Wed, 26 May 2021 22:08:27 +0100
From:   Will Deacon <will@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <Suzuki.Poulose@arm.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: Check if GMID_EL1.BS is the same on all CPUs
Message-ID: <20210526210825.GA20442@willie-the-truck>
References: <20210511182322.3830-1-catalin.marinas@arm.com>
 <20210511182322.3830-3-catalin.marinas@arm.com>
 <e30a7d50-5ee3-990a-3f0a-d5009f1e6869@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e30a7d50-5ee3-990a-3f0a-d5009f1e6869@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, May 26, 2021 at 08:47:16PM +0100, Jon Hunter wrote:
> On 11/05/2021 19:23, Catalin Marinas wrote:
> > diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> > index 4bea701117d4..cd9f2d51285b 100644
> > --- a/arch/arm64/kernel/cpuinfo.c
> > +++ b/arch/arm64/kernel/cpuinfo.c
> > @@ -359,6 +359,7 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
> >  	info->reg_dczid = read_cpuid(DCZID_EL0);
> >  	info->reg_midr = read_cpuid_id();
> >  	info->reg_revidr = read_cpuid(REVIDR_EL1);
> > +	info->reg_gmid = read_cpuid(GMID_EL1);
> >  
> >  	info->reg_id_aa64dfr0 = read_cpuid(ID_AA64DFR0_EL1);
> >  	info->reg_id_aa64dfr1 = read_cpuid(ID_AA64DFR1_EL1);
> 
> 
> I am seeing the following undefined instruction crash on all our 
> ARM64 Tegra devices on today's -next and bisect is pointing to
> this patch. Reverting this patch on top of -next does fix the 
> problem. Let me know if you have any thoughts.

Catalin just posted a fixed version, so should be solved asap (I'll push a
new branch shortly).

Thanks!

Will
