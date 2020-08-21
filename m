Return-Path: <SRS0=jf4o=B7=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FFDC433E1
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Aug 2020 21:31:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38B5220724
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Aug 2020 21:31:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZbbWVbT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgHUVbM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Aug 2020 17:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgHUVbH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Aug 2020 17:31:07 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69105C061573
        for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2020 14:31:07 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a26so4138130ejc.2
        for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2020 14:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=POwCROtyYEWyz7NcDskSl6hvf/N4dzdA/gXnU3R5jrc=;
        b=rZbbWVbT8L/tHQsGaefhpu90TTxnO7COFy7pNOMu7N9F5clYQ0o2AsNsj8AY9vNpHP
         YPZzyfZCv6rEDJtTogNZvCwzZCYIfeGUsecKBMIXF+IbziIdOsCa5uUqmBBqsXMuU6bA
         zvx2xt/utDhOr8JicHTAmdbj+Fkhc38OhGOxLxni6Rfz70/wcFY1RFGzOG4/Urym9ndw
         G5FRHqjfE11T0Y1Xw/cSlBsE+hYwmIU9DYgc/hB8xLwQN1fNFAzpkdyS7ALlVj/rT2/S
         px2znh1IayyL8QD6U3YHLuhaSP2dztnY0yjTrr0GIxzwSwk1BRMsXVjkQjaTjE8Vfruv
         JKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=POwCROtyYEWyz7NcDskSl6hvf/N4dzdA/gXnU3R5jrc=;
        b=B/wW4S2U422Q7FnPc0axPt/iSyQLqLY6ENursXqyzS1UI3ZwWVGh1hD2duamLwxo6h
         C9HFMtf0Yiaxd9lILTdtZXTD3/K/S3tCKWfXc/LktRZfrIgwqzbEgL4bp+4eN7fUQAcw
         2gUGMpOQI2HNpQg9KBOIkKylocfggznAZQIEayvE7BWY5I02yrz+hx0A7s2FJFF8G9aX
         ZRJA8N3NwsdpbwjURwb78+rXl0ZYqzehLNECYn+tdQNwyfK5IMay2oXtqpoclbSlHZkH
         o4QKHgG7qQXmLEv7mjcFGSEbB6C85/ZML554hDx/qnLPTxzLmlPLziB/25wdSGtPoHbF
         +9qA==
X-Gm-Message-State: AOAM530/khW3k92wW1Th/yHje1/iwNknSlPb2niBgYUfLSF0k6xRMbX9
        vZxUAahHbokW4JhODoFn+GnQdtqu9/sN7Ocu0V8=
X-Google-Smtp-Source: ABdhPJz06vLpqMvZQz7Hr+Kf2NppMhDjqQg+XFXio/+rcJk39otB7LQHlqIWWeYKH1wY5q3H7Vb51w3ovKdTG/DxrD4=
X-Received: by 2002:a17:906:528d:: with SMTP id c13mr4971172ejm.61.1598045465622;
 Fri, 21 Aug 2020 14:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
 <dda406a7-8199-f2ad-b64a-35791aa1033b@wwwdotorg.org> <CAMdYzYpkg9SqcJyDMA0rm9kp-1whT2KQ7+YoebwDHCQpZy2hiA@mail.gmail.com>
 <CAMdYzYrm9v6LWrG0PKkepouJyBXUmg7VxNh96bMp03VavYGuXQ@mail.gmail.com> <20200821210451.GE20605@bill-the-cat>
In-Reply-To: <20200821210451.GE20605@bill-the-cat>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Fri, 21 Aug 2020 17:30:54 -0400
Message-ID: <CAMdYzYpj8jYdbFg3QT5x6-HutmYGLBLS2Xjp6grMtv8_aeq2UA@mail.gmail.com>
Subject: Re: Chainloading U-Boot from Fastboot on Tegra30
To:     Tom Rini <trini@konsulko.com>
Cc:     Stephen Warren <swarren@wwwdotorg.org>,
        U-Boot Mailing List <u-boot@lists.denx.de>,
        linux-tegra@vger.kernel.org, Simon Glass <sjg@chromium.org>,
        Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Aug 21, 2020 at 5:04 PM Tom Rini <trini@konsulko.com> wrote:
>
> On Fri, Aug 21, 2020 at 04:17:24PM -0400, Peter Geis wrote:
> > On Mon, Jul 6, 2020 at 3:48 PM Peter Geis <pgwipeout@gmail.com> wrote:
> > >
> > > On Mon, Jul 6, 2020 at 1:04 PM Stephen Warren <swarren@wwwdotorg.org> wrote:
> > > >
> > > > On 7/3/20 6:32 AM, Peter Geis wrote:
> > > > > Good Morning,
> > > > >
> > > > > I am attempting to expand on the work for chainloading U-Boot on the
> > > > > nyan-big in order to chainload U-Boot on the Ouya Tegra30 device from fastboot.
> > > > > I have so far been unsuccessful at getting any output from U-Boot
> > > > > through this method.
> > > >
> > > > I assume that fastboot executes the loaded code on the main CPU not on
> > > > the boot CPU (AVP). U-Boot SPL on Tegra30 expects to start running on
> > > > the AVP though; you would have to disable SPL to make this all work, and
> > > > perhaps fix U-Boot to work without SPL present. I'm not sure what, if
> > > > any, changes would be required to support that.
> > > >
> > > > For background, see:
> > > > https://http.download.nvidia.com/tegra-public-appnotes/index.html
> > >
> > > Apologies for the resend, I realized I didn't reply to the list.
> > >
> > > I admit I'm still extremely new to U-Boot, but this is the way I
> > > understand the boot flow.
> > > ROM does extremely low level init, then loads U-boot SPL.
> > > U-Boot SPL does basic init, ram, cpu and required peripherals, then
> > > loads U-Boot.bin.
> > > U-Boot.bin is U-Boot proper, with the full interface.
> > >
> > > By loading U-Boot.bin as the nyan instructions indicated, I'm
> > > bypassing the SPL code as if it was already complete.
> > > The issue I have is I'm not sure what modifications were done to the
> > > T124 code to allow nyan to do this.
> > > I've compared the nyan configs to the cardhu configs and I don't see
> > > anything that sticks out to me.
> > > I've also dug through the nyan git log and I don't see anything that
> > > was specifically changed to allow chainloading on T124.
> > >
> > > I also am unsure of where fastboot is loading the kernel in order to
> > > set the text base correctly.
> >
> > For anyone interested, I succeeded at chainloading u-boot on the Ouya.
>
> Nice work.
>
> > The Linux Kernel with low level debugging enabled in the decompressor
> > will print the load address.
> >
> > Jumping to kernel at:4861 ms
> >
> > C:0x80A000C0-0x8112BA40->0x8152C700-0x81C58080
> > Uncompressing Linux...
> >
> > So by setting the u-boot text base to 0x80A00000 u-boot now executes,
> > but it would then immediately silently reboot.
> > Turns out I needed to define the console in the device-tree, which
> > isn't defined in the u-boot tegra30-cardhu.dts.
> > It would then freeze at relocation time, as it was trying to overwrite
> > the trustzone ram space.
> > #define CONFIG_PRAM 2048 solves that issue.
> >
> > I'd like to know if u-boot can read the reserved-memory device-tree
> > node and use it instead of CONFIG_PRAM?
>
> Honestly, this is what CONFIG_PRAM is for.  We could possibly add
> something to get this from device-tree, but we might need to do that
> early enough that it becomes a tricky thing to do.

Thank you, that makes sense.

>
> > Otherwise the only issue it seems to have it is does not read the
> > nvidia proprietary partition table.
> > Is there a way to force u-boot to read the backup gpt table similar to
> > the android kernel's method?
>
> Some tangential experiments the other day and I saw that U-Boot would
> read the backup GPT if it's at the expected place.  But that might be
> only after you do something like "part list mmc 0", so there might in
> turn be places that we need to be a bit more robust in our checking.

Unfortunately running <part list mmc 0> returns "## Unknown partition
table type 0"

This is the result of the gpt guid command:
Tegra30 (Ouya) # gpt guid mmc 0
GUID Partition Table Header signature is wrong: 0x1000 != 0x5452415020494645
find_valid_gpt: *** ERROR: Invalid GPT ***
find_valid_gpt: ***        Using Backup GPT ***
00000000-0000-0000-0000-000000000000
success!

The backup GPT is a valid GPT, and linux will pull the partition table
from it if forced to look there.
The android kernel handled this by adding "gpt gpt_sector=15073279" to
the command line.

>
> --
> Tom
