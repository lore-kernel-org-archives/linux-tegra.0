Return-Path: <SRS0=jf4o=B7=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143A8C433DF
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Aug 2020 20:17:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3D9E2086A
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Aug 2020 20:17:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNlhIh3U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbgHUURh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Aug 2020 16:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726588AbgHUURg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Aug 2020 16:17:36 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16F0C061573
        for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2020 13:17:36 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id l23so2531584edv.11
        for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2020 13:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U9UF3hv2QJvubGlVZsh3uRKPlmXIm60gU3QOb632buc=;
        b=MNlhIh3UWcxEBjXCySF8+AY5vRFMS2TimpZvJiSiacwzA+YiShAd/30kWy/zEvz3lU
         E+VxfMci1X+CC6YZFpYsR4xTyyQ+QXqGu7P0teVpblB1geJBLAZZF9zu0oo2JctzOnzg
         vbB9thzAqos07an2+v3FbbesH280QSNnFP00yvM/3ILDPRKb3mFFCLJLtlOhL2wJ5KbW
         yOwMxKCmwqjuzOKQtj+n3a+HeseZqxMNhnR1xN8oFErbBlm1OLTF3YmPt5aR0EYNLYgW
         S9yyFnpXuP/swQuIZwfPKWMtChCCeeJUp98fsw//NMViwkRwBnuf7v900VU9f3Clxdgq
         gFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U9UF3hv2QJvubGlVZsh3uRKPlmXIm60gU3QOb632buc=;
        b=oR4RnkGQAPDs6CJucdftkZheTwDGZL4j26BufUpjCjmsmnTl8zS+ma41LijU3hkywL
         VMR+MRG/2P3J1Enn3PnZQiOVew/Q6PAd+N2xD5CDtqkCTZ2K763O+X24qQ7WHO+ttZwj
         NhBGQawhX3a7exEzMNU8h7zDhifrglYEGSxzJujldX92i4C/J7x/E2l7e+v6MTDyPSnk
         opSg0i2XTJ9p4PJM78UbFG4xAW87ll1eKhlICJsLWlAFxEn3+tF0YJrVYh2gVJHsOuBx
         8XDoCgfPJuia42+5zjDelK66WW9A1Qq8Gb6GChw2VVqAZthbuw2LqkO9pAzaIWz7URrZ
         uyUA==
X-Gm-Message-State: AOAM532JhUvtQZWX5htOJeBaCujQ2vs57meR+R/CXTnbEO+gOtJW72Tm
        8lHvfBTUofY9L5ztBAUqx2lLGPJnxaJl2Dn/IQc=
X-Google-Smtp-Source: ABdhPJxjUJv2PFA+JGmRHmq9JpwiBlLGr6PXP0bVvHKlK/YuBHTmfV9Ladg+REk2wVXTE80rl1mQXpQhw1StvQTopOs=
X-Received: by 2002:a05:6402:1591:: with SMTP id c17mr4496191edv.111.1598041055129;
 Fri, 21 Aug 2020 13:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
 <dda406a7-8199-f2ad-b64a-35791aa1033b@wwwdotorg.org> <CAMdYzYpkg9SqcJyDMA0rm9kp-1whT2KQ7+YoebwDHCQpZy2hiA@mail.gmail.com>
In-Reply-To: <CAMdYzYpkg9SqcJyDMA0rm9kp-1whT2KQ7+YoebwDHCQpZy2hiA@mail.gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Fri, 21 Aug 2020 16:17:24 -0400
Message-ID: <CAMdYzYrm9v6LWrG0PKkepouJyBXUmg7VxNh96bMp03VavYGuXQ@mail.gmail.com>
Subject: Re: Chainloading U-Boot from Fastboot on Tegra30
To:     Stephen Warren <swarren@wwwdotorg.org>
Cc:     U-Boot Mailing List <u-boot@lists.denx.de>,
        linux-tegra@vger.kernel.org, Simon Glass <sjg@chromium.org>,
        Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jul 6, 2020 at 3:48 PM Peter Geis <pgwipeout@gmail.com> wrote:
>
> On Mon, Jul 6, 2020 at 1:04 PM Stephen Warren <swarren@wwwdotorg.org> wrote:
> >
> > On 7/3/20 6:32 AM, Peter Geis wrote:
> > > Good Morning,
> > >
> > > I am attempting to expand on the work for chainloading U-Boot on the
> > > nyan-big in order to chainload U-Boot on the Ouya Tegra30 device from fastboot.
> > > I have so far been unsuccessful at getting any output from U-Boot
> > > through this method.
> >
> > I assume that fastboot executes the loaded code on the main CPU not on
> > the boot CPU (AVP). U-Boot SPL on Tegra30 expects to start running on
> > the AVP though; you would have to disable SPL to make this all work, and
> > perhaps fix U-Boot to work without SPL present. I'm not sure what, if
> > any, changes would be required to support that.
> >
> > For background, see:
> > https://http.download.nvidia.com/tegra-public-appnotes/index.html
>
> Apologies for the resend, I realized I didn't reply to the list.
>
> I admit I'm still extremely new to U-Boot, but this is the way I
> understand the boot flow.
> ROM does extremely low level init, then loads U-boot SPL.
> U-Boot SPL does basic init, ram, cpu and required peripherals, then
> loads U-Boot.bin.
> U-Boot.bin is U-Boot proper, with the full interface.
>
> By loading U-Boot.bin as the nyan instructions indicated, I'm
> bypassing the SPL code as if it was already complete.
> The issue I have is I'm not sure what modifications were done to the
> T124 code to allow nyan to do this.
> I've compared the nyan configs to the cardhu configs and I don't see
> anything that sticks out to me.
> I've also dug through the nyan git log and I don't see anything that
> was specifically changed to allow chainloading on T124.
>
> I also am unsure of where fastboot is loading the kernel in order to
> set the text base correctly.

For anyone interested, I succeeded at chainloading u-boot on the Ouya.
The Linux Kernel with low level debugging enabled in the decompressor
will print the load address.

Jumping to kernel at:4861 ms

C:0x80A000C0-0x8112BA40->0x8152C700-0x81C58080
Uncompressing Linux...

So by setting the u-boot text base to 0x80A00000 u-boot now executes,
but it would then immediately silently reboot.
Turns out I needed to define the console in the device-tree, which
isn't defined in the u-boot tegra30-cardhu.dts.
It would then freeze at relocation time, as it was trying to overwrite
the trustzone ram space.
#define CONFIG_PRAM 2048 solves that issue.

I'd like to know if u-boot can read the reserved-memory device-tree
node and use it instead of CONFIG_PRAM?

Otherwise the only issue it seems to have it is does not read the
nvidia proprietary partition table.
Is there a way to force u-boot to read the backup gpt table similar to
the android kernel's method?
