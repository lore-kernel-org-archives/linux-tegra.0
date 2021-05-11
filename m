Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0763EC433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 17:35:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C67DF61363
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 17:35:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbhEKRgQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 13:36:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:54484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231329AbhEKRgP (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 13:36:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20864611CA;
        Tue, 11 May 2021 17:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620754509;
        bh=YPhRLTxOgdPzo1iZN2FPl/ndFofc60gotWgeCGFIYOg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UmtMPRNKB5D7IhY0pfXWfAi/zQ0QvTZ7GRfUhVUWWGpcIBbl/c6RxnpfXoqyHX1tq
         4ypfMShci2envDbJXDBdPQlzKaG7lwQwlgOmU5y8GhZxdldjl3h/EZxMFJrBryYA8g
         Xy4OfvGRFoOmsbaz7x7yGXuNWarikVqwuybXdrT51dvPkKxe6mjHctxcaBTdM522I9
         +rjFLXPW1pbTkxvOYaVEjwKiuIgs3+/niVpMrJywj9ML8deTOaGjjL8vdsD1SM9AFh
         MWMlxx/KSH4aaH7nvSjs6GLxYHv37/YgFKUJLEI+yufvxDaMtyaShMEMAW33omxRoV
         P4qOnCVsyK6tA==
Date:   Tue, 11 May 2021 10:35:03 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        kernel test robot <lkp@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 2/2] memory: tegra: Enable compile testing for all
 drivers
Message-ID: <YJrARxhVD7QM/GPv@archlinux-ax161>
References: <20210510213729.7095-3-digetx@gmail.com>
 <202105112125.VctfC6sX-lkp@intel.com>
 <dd0b550e-76a0-bfbc-9d6f-5d867812046d@gmail.com>
 <06addbf3-0090-b76f-65cf-e0c10d284c69@canonical.com>
 <3ab5d50b-4955-7144-5d1d-d44cb0892d65@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ab5d50b-4955-7144-5d1d-d44cb0892d65@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, May 11, 2021 at 07:00:34PM +0300, Dmitry Osipenko wrote:
> 11.05.2021 18:31, Krzysztof Kozlowski пишет:
> ...
>                                       ~~~~~~~~~~~~~~~~~~~~~^
> >>>>> drivers/memory/tegra/tegra124-emc.c:802:26: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744071562067985 to 2147483665 [-Wconstant-conversion]
> >>>                    emc_ccfifo_writel(emc, EMC_ZQ_CAL_LONG_CMD_DEV0, EMC_ZQ_CAL);
> >>>                    ~~~~~~~~~~~~~~~~~      ^~~~~~~~~~~~~~~~~~~~~~~~
> >>>    drivers/memory/tegra/tegra124-emc.c:154:36: note: expanded from macro 'EMC_ZQ_CAL_LONG_CMD_DEV0'
> >>>            (DRAM_DEV_SEL_0 | EMC_ZQ_CAL_LONG | EMC_ZQ_CAL_CMD)
> >>>             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
> >>>    13 warnings generated.
> >>
> >> This doesn't look like a useful warning from clang, it should see that
> >> the constant value itself isn't truncated, hence it should be a problem
> >> of clang. Do you think it's okay to ignore this nonsense?
> > 
> > I admit I also do not see the real issue here. The DRAM_DEV_SEL_0 fits
> > in u32 and there is no other bitwise arithmetic than just OR, so why
> > clang assumes it can have 32 most signifcant bits toggled on?
> > 
> > +Cc Nathan and Nick,
> > Maybe you could shed some light here on this warning?
> > 
> > Dmitry,
> > In general you should not ignore it because:
> > 1. This breaks allyesconfig with clang on powerpc (or it is one of the
> > stoppers),
> > 2. We might want in some future to build it with clang.
> 
> I meant to ignore it from the perspective of the memory drivers, i.e. it
> likely should be fixed in clang and not worked around in the code. Thank
> you for pinging the right people.

I do not think this is a bug in clang, gcc warns the same (just not here
in this case): https://godbolt.org/z/e9GWobMnd

DRAM_DEV_SEL_0 and DRAM_DEV_SEL_1 are implicitly signed integers because
there is no suffix on the literal 1. DRAM_DEV_SEL_0 is 2 << 30, which
can be turned into 1 << 31. That is equal to INT_MAX + 1, which then
overflows and becomes INT_MIN (undefined behavior). INT_MIN is then
promoted to unsigned long because EMC_ZQ_CAL_LONG and EMC_ZQ_CAL_CMD are
unsigned long due to the BIT macro, resulting in the gigantic number
that clang reports above.

I assume that this driver only runs on hardware where unsigned int is
the same size as unsigned long, meaning this problem is merely
theoretical?

Regardless, defining DRAM_DEV_SEL_{0,1} with the BIT macro fixes the
warning for me and should make everything work as expected.

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 5699d909abc2..a21ca8e0841a 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -272,8 +272,8 @@
 #define EMC_PUTERM_ADJ				0x574
 
 #define DRAM_DEV_SEL_ALL			0
-#define DRAM_DEV_SEL_0				(2 << 30)
-#define DRAM_DEV_SEL_1				(1 << 30)
+#define DRAM_DEV_SEL_0				BIT(31)
+#define DRAM_DEV_SEL_1				BIT(30)
 
 #define EMC_CFG_POWER_FEATURES_MASK		\
 	(EMC_CFG_DYN_SREF | EMC_CFG_DRAM_ACPD | EMC_CFG_DRAM_CLKSTOP_SR | \
