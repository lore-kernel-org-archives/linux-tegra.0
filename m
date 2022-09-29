Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE66EC4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Sep 2022 10:10:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234934AbiI2KK3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Sep 2022 06:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235308AbiI2KKX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Sep 2022 06:10:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE007F0B5
        for <linux-tegra@vger.kernel.org>; Thu, 29 Sep 2022 03:10:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 14B52B823F4
        for <linux-tegra@vger.kernel.org>; Thu, 29 Sep 2022 10:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C637EC433B5
        for <linux-tegra@vger.kernel.org>; Thu, 29 Sep 2022 10:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664446217;
        bh=cz4dMWsON9yrEVJT4yvHVh8L5Bbs3MSlA30bliNofpA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JlBYnZPvya2D3aIV37kbcT91PzgcbU4Pu5GUn/pyZhAZ+FO4MXctt2fYmvAiDAotV
         eTeR9ckSWMsObftz+zOt0Jl0a4823e/hZMW/7FMZq7msKeQKdLp2Esy5+pikd9QQh3
         AtkrUBDQeLOvVk2BZtidk5EKx/BUd3SwmN1YFtOcdyaSjBnaD3qpa+tr0qwOp9MFoJ
         S4PHv53MwrAF++uBvb4ElBO4M57iIKtfGiKXehbxAxV/fQLzfqI2XwyPRIfa7kbZ6S
         q8Ql7A/C3AqolMa/blUh10Qn5Hkq0+nsQYCfteozZ7Ks5lvXBmocW4vZfB2kqgPNUZ
         WN79Vjb4FE5uA==
Received: by mail-lf1-f46.google.com with SMTP id a2so1505708lfb.6
        for <linux-tegra@vger.kernel.org>; Thu, 29 Sep 2022 03:10:17 -0700 (PDT)
X-Gm-Message-State: ACrzQf0U1Z+U3li8zSycr4gl9RyE8vEgNjJstPMsaLefdV5Sb5Fbn7f4
        BnTw4M3fIno2KP3nWkxe6m2nOGMztSzXMWgypt4=
X-Google-Smtp-Source: AMsMyM5vJujibuvo1ihZbn/smR6yjW+H/huttb46k44io0Xzax7OmeGuUWtnoVUjBbdX1RM7uhW7bZDhnvmLMGF+Bhk=
X-Received: by 2002:a05:6512:c0f:b0:49b:1e8c:59fd with SMTP id
 z15-20020a0565120c0f00b0049b1e8c59fdmr971411lfu.426.1664446215783; Thu, 29
 Sep 2022 03:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220912162210.3626215-1-mark.rutland@arm.com>
 <20220912162210.3626215-7-mark.rutland@arm.com> <3cecc3a5-30b0-f0bd-c3de-9e09bd21909b@nvidia.com>
 <dc53c62d-58e4-ce20-edc6-969c71801c9a@nvidia.com>
In-Reply-To: <dc53c62d-58e4-ce20-edc6-969c71801c9a@nvidia.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 29 Sep 2022 12:10:04 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHWyB8v8Wv-cMn7nZXvRWJ=FPsQd+7Yfni+fV7cbCGY8A@mail.gmail.com>
Message-ID: <CAMj1kXHWyB8v8Wv-cMn7nZXvRWJ=FPsQd+7Yfni+fV7cbCGY8A@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: alternatives: have callbacks take a cap
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
        james.morse@arm.com, joey.gouly@arm.com, maz@kernel.org,
        will@kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 29 Sept 2022 at 11:54, Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 27/09/2022 10:31, Jon Hunter wrote:
>
> ...
>
> >> diff --git a/arch/arm64/include/asm/alternative-macros.h
> >> b/arch/arm64/include/asm/alternative-macros.h
> >> index 7e157ab6cd505..189c31be163ce 100644
> >> --- a/arch/arm64/include/asm/alternative-macros.h
> >> +++ b/arch/arm64/include/asm/alternative-macros.h
> >> @@ -2,10 +2,16 @@
> >>   #ifndef __ASM_ALTERNATIVE_MACROS_H
> >>   #define __ASM_ALTERNATIVE_MACROS_H
> >> +#include <linux/const.h>
> >> +
> >>   #include <asm/cpucaps.h>
> >>   #include <asm/insn-def.h>
> >> -#define ARM64_CB_PATCH ARM64_NCAPS
> >> +#define ARM64_CB_BIT    (UL(1) << 15)
> >> +
> >> +#if ARM64_NCAPS >= ARM64_CB_BIT
> >> +#error "cpucaps have overflown ARM64_CB_BIT"
> >> +#endif
> >
> >
> > Some of our builders are failing and bisect is pointing to this commit.
> > Looks like they don't like the above and I see the following errors ...
> >
> >    CC      arch/arm64/kvm/hyp/vhe/debug-sr.o
> > /tmp/ccY3kbki.s: Assembler messages:
> > /tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
> > /tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
> > /tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
> > /tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
> > /tmp/ccY3kbki.s:1600: Error: junk at end of line, first unrecognized
> > character is `L'
> > /tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
> > /tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
> > /tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
> > /tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
> > /tmp/ccY3kbki.s:1723: Error: junk at end of line, first unrecognized
> > character is `L'
> > scripts/Makefile.build:249: recipe for target
> > 'arch/arm64/kvm/hyp/vhe/debug-sr.o' failed
> >
> > Seems that it does not like the 'UL' macro for some reason. Any thoughts?
>
>
> FYI, this issue is seen with GCC6 but GCC7 and beyond appear to work fine.
>

Are you using the same version of binutils with those different
compilers? And which is/are the exact version(s)?
