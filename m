Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B992C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Sep 2022 14:39:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235638AbiI2OjO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Sep 2022 10:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235814AbiI2OjD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Sep 2022 10:39:03 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 35BC31C4337
        for <linux-tegra@vger.kernel.org>; Thu, 29 Sep 2022 07:39:00 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 735B11650;
        Thu, 29 Sep 2022 07:39:06 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.81.100])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4868B3F792;
        Thu, 29 Sep 2022 07:38:58 -0700 (PDT)
Date:   Thu, 29 Sep 2022 15:38:52 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
        catalin.marinas@arm.com, james.morse@arm.com, joey.gouly@arm.com,
        maz@kernel.org, will@kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 6/8] arm64: alternatives: have callbacks take a cap
Message-ID: <YzWlLvurVCXOBkKn@FVFF77S0Q05N>
References: <20220912162210.3626215-1-mark.rutland@arm.com>
 <20220912162210.3626215-7-mark.rutland@arm.com>
 <3cecc3a5-30b0-f0bd-c3de-9e09bd21909b@nvidia.com>
 <dc53c62d-58e4-ce20-edc6-969c71801c9a@nvidia.com>
 <YzV3y361Mj9N+CcW@FVFF77S0Q05N>
 <9317eb32-4dc3-c865-a1ac-320a14ebea56@nvidia.com>
 <YzV87YY4N7SJ3Q3H@FVFF77S0Q05N>
 <f38d5afb-6d15-f802-7c81-533fa59e51d8@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f38d5afb-6d15-f802-7c81-533fa59e51d8@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 29, 2022 at 02:37:54PM +0100, Jon Hunter wrote:
> 
> On 29/09/2022 12:09, Mark Rutland wrote:
> 
> ...
> 
> > > Yes that fixes it.
> > > 
> > > Tested-by: Jon Hunter <jonathanh@nvidia.com>
> > 
> > Great!
> > 
> > Could you please let me know which version of binutils, so that we can add
> > something regarding that in a comment and in the commit message?
> > 
> > The output of ${CROSS_COMPILE}as --version would suffice.
> > 
> > With that, I can clean this up and send as a proper patch.
> 
> 
> Yes it is ...
> 
> GNU ld (Linaro_Binutils-2017.08) 2.27.0.20161019

Thanks for that!

FWIW< I can reproduce that with the Linaro 17.05 toolchain release:

| [mark@lakrids:~/src/linux]% uselinaro 17.05 aarch64-linux-gnu-as --version
| GNU assembler (Linaro_Binutils-2017.05) 2.27.0.20161019
| Copyright (C) 2016 Free Software Foundation, Inc.
| This program is free software; you may redistribute it under the terms of
| the GNU General Public License version 3 or later.
| This program has absolutely no warranty.
| This assembler was configured for a target of `aarch64-linux-gnu'.
| [mark@lakrids:~/src/linux]% uselinaro 17.05 make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -s defconfig
| [mark@lakrids:~/src/linux]% uselinaro 17.05 make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -s Image    
| /tmp/ccAy74PK.s: Assembler messages:
| /tmp/ccAy74PK.s:2528: Error: found 'L', expected: ')'
| /tmp/ccAy74PK.s:2528: Error: found 'L', expected: ')'
| /tmp/ccAy74PK.s:2528: Error: found 'L', expected: ')'
| /tmp/ccAy74PK.s:2528: Error: found 'L', expected: ')'
| /tmp/ccAy74PK.s:2528: Error: junk at end of line, first unrecognized character is `L'
| /tmp/ccAy74PK.s:3562: Error: found 'L', expected: ')'
| /tmp/ccAy74PK.s:3562: Error: found 'L', expected: ')'
| /tmp/ccAy74PK.s:3562: Error: found 'L', expected: ')'
| /tmp/ccAy74PK.s:3562: Error: found 'L', expected: ')'
| /tmp/ccAy74PK.s:3562: Error: junk at end of line, first unrecognized character is `L'
| make[1]: *** [scripts/Makefile.build:249: init/main.o] Error 1
| make: *** [Makefile:1853: init] Error 2

... but curiously the 17.08 release seems to have a new, working version of
binutils:

| [mark@lakrids:~/src/linux]% uselinaro 17.08 aarch64-linux-gnu-as --version
| GNU assembler (Linaro_Binutils-2017.08) 2.28.2.20170706
| Copyright (C) 2017 Free Software Foundation, Inc.
| This program is free software; you may redistribute it under the terms of
| the GNU General Public License version 3 or later.
| This program has absolutely no warranty.
| This assembler was configured for a target of `aarch64-linux-gnu'.
| [mark@lakrids:~/src/linux]% uselinaro 17.08 make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -s defconfig
| [mark@lakrids:~/src/linux]% uselinaro 17.08 make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j50 -s Image
| [mark@lakrids:~/src/linux]% echo $?
| 0

... so I'm not sure why your copy has an older binutils.

Regardless, I'll go prep that patch with a real commit message, and add your
Tested-by.

Thanks,
Mark.
