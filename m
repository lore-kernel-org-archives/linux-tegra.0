Return-Path: <SRS0=jf4o=B7=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C76CC433E1
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Aug 2020 23:30:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5478420702
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Aug 2020 23:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1X5JluC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgHUXag (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Aug 2020 19:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgHUXaf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Aug 2020 19:30:35 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013FAC061573
        for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2020 16:30:35 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id k25so2938041edj.13
        for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2020 16:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pSlfwOMEnaZHHJpArruaM1gO4WSNK7A0t8iCwRQMHpw=;
        b=B1X5JluC1lsg6E6R0HWJo5MLTczT7wOu1p6u7QtRZqKEM6BJ0PlNuwXtwsY5ShW1bB
         nVt/oB/eyXsRx2ZMiP1OkfJ3jM08cRDAL7Em3cqF2VGoBCPYPIACFuyyyDNcKAqPSdFy
         9hlP49n+v3NksDd1fxG5FX87A+IAif/gVV0Zzho90TaothbEFwFhpKgBPSij4QgAQv/x
         p1VPKBvCRvqsMhVQ98h6OfnBzuvW14UeYNOgiw4HblHmHXfRbaLcebSA7v5krfh09mae
         XwHi0QTm6LPFLtkxSIrrBPv0mnhfyXhI1AiCcSeEirh3npxT4aPVijKT5/CS8ZYwMDgQ
         pS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pSlfwOMEnaZHHJpArruaM1gO4WSNK7A0t8iCwRQMHpw=;
        b=S1tWvwHRapenQejr6+TfkpjZnrA3hLtv4XkaGX7Hf0Am1DbP8MKUEXs8XuodgyKbts
         WnBQBUPdfbbEg6pit9FL12tAKmYuZoYXt+R/C+6/ABPoaWY5hoMBNgPdqnAYLWCctsrO
         vdr3rrK3JlzDG5NNcCpv0Oa/puAVtawXlFitOuIeBt2B1UF6XVfVIpMTuEFTKVX5YVv3
         umrwPoKtpVSXAe3TWCDQYKzEZTQemtS3NSod0K7JPbl/E29QGpP94jvg9OrfWMIX8L/Q
         JPjqk6bPshakOYUd+aUkDI/sMhtRQK4gVz1BdLdr+BWs/N84ajQ3k/Tpn8gtgYnBFXjJ
         10/A==
X-Gm-Message-State: AOAM531+TGvearUIPzoex8U1WAfbAv6l/cJghmNsU5JNLDUw5y55ueA0
        NX+hFdaARJkBvaXc1SWhCdc6H9YdayZmyID9Tb8=
X-Google-Smtp-Source: ABdhPJza0XdJ6eXBhndxdUlSKAMjWetKG/2lrbhdjiJT7hc8lXGM7QiFh+E9bjvJcqU2IJcjN+Ah5vc85I3h5VH6hDs=
X-Received: by 2002:a50:e109:: with SMTP id h9mr5201601edl.47.1598052633245;
 Fri, 21 Aug 2020 16:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
 <dda406a7-8199-f2ad-b64a-35791aa1033b@wwwdotorg.org> <CAMdYzYpkg9SqcJyDMA0rm9kp-1whT2KQ7+YoebwDHCQpZy2hiA@mail.gmail.com>
 <CAMdYzYrm9v6LWrG0PKkepouJyBXUmg7VxNh96bMp03VavYGuXQ@mail.gmail.com>
 <20200821210451.GE20605@bill-the-cat> <CAMdYzYpj8jYdbFg3QT5x6-HutmYGLBLS2Xjp6grMtv8_aeq2UA@mail.gmail.com>
 <20200821213923.GF20605@bill-the-cat> <8e3d7a19-ab9a-0611-06c1-a3757400c496@wwwdotorg.org>
In-Reply-To: <8e3d7a19-ab9a-0611-06c1-a3757400c496@wwwdotorg.org>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Fri, 21 Aug 2020 19:30:22 -0400
Message-ID: <CAMdYzYrh2LoBC6_kxXra3ew5oJa8_ry17kA7Jd==9agLPZYUaA@mail.gmail.com>
Subject: Re: Chainloading U-Boot from Fastboot on Tegra30
To:     Stephen Warren <swarren@wwwdotorg.org>
Cc:     Tom Rini <trini@konsulko.com>,
        U-Boot Mailing List <u-boot@lists.denx.de>,
        linux-tegra@vger.kernel.org, Simon Glass <sjg@chromium.org>,
        Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Aug 21, 2020 at 6:41 PM Stephen Warren <swarren@wwwdotorg.org> wrote:
>
> On 8/21/20 3:39 PM, Tom Rini wrote:
> > On Fri, Aug 21, 2020 at 05:30:54PM -0400, Peter Geis wrote:
> >> On Fri, Aug 21, 2020 at 5:04 PM Tom Rini <trini@konsulko.com> wrote:
> >>>
> >>> On Fri, Aug 21, 2020 at 04:17:24PM -0400, Peter Geis wrote:
> >>>> On Mon, Jul 6, 2020 at 3:48 PM Peter Geis <pgwipeout@gmail.com> wrote:
> >>>>>
> >>>>> On Mon, Jul 6, 2020 at 1:04 PM Stephen Warren <swarren@wwwdotorg.org> wrote:
> >>>>>>
> >>>>>> On 7/3/20 6:32 AM, Peter Geis wrote:
> >>>>>>> Good Morning,
> >>>>>>>
> >>>>>>> I am attempting to expand on the work for chainloading U-Boot on the
> >>>>>>> nyan-big in order to chainload U-Boot on the Ouya Tegra30 device from fastboot.
> >>>>>>> I have so far been unsuccessful at getting any output from U-Boot
> >>>>>>> through this method.
> >>>>>>
> >>>>>> I assume that fastboot executes the loaded code on the main CPU not on
> >>>>>> the boot CPU (AVP). U-Boot SPL on Tegra30 expects to start running on
> >>>>>> the AVP though; you would have to disable SPL to make this all work, and
> >>>>>> perhaps fix U-Boot to work without SPL present. I'm not sure what, if
> >>>>>> any, changes would be required to support that.
> >>>>>>
> >>>>>> For background, see:
> >>>>>> https://http.download.nvidia.com/tegra-public-appnotes/index.html
> >>>>>
> >>>>> Apologies for the resend, I realized I didn't reply to the list.
> >>>>>
> >>>>> I admit I'm still extremely new to U-Boot, but this is the way I
> >>>>> understand the boot flow.
> >>>>> ROM does extremely low level init, then loads U-boot SPL.
> >>>>> U-Boot SPL does basic init, ram, cpu and required peripherals, then
> >>>>> loads U-Boot.bin.
> >>>>> U-Boot.bin is U-Boot proper, with the full interface.
> >>>>>
> >>>>> By loading U-Boot.bin as the nyan instructions indicated, I'm
> >>>>> bypassing the SPL code as if it was already complete.
> >>>>> The issue I have is I'm not sure what modifications were done to the
> >>>>> T124 code to allow nyan to do this.
> >>>>> I've compared the nyan configs to the cardhu configs and I don't see
> >>>>> anything that sticks out to me.
> >>>>> I've also dug through the nyan git log and I don't see anything that
> >>>>> was specifically changed to allow chainloading on T124.
> >>>>>
> >>>>> I also am unsure of where fastboot is loading the kernel in order to
> >>>>> set the text base correctly.
> >>>>
> >>>> For anyone interested, I succeeded at chainloading u-boot on the Ouya.
> >>>
> >>> Nice work.
> >>>
> >>>> The Linux Kernel with low level debugging enabled in the decompressor
> >>>> will print the load address.
> >>>>
> >>>> Jumping to kernel at:4861 ms
> >>>>
> >>>> C:0x80A000C0-0x8112BA40->0x8152C700-0x81C58080
> >>>> Uncompressing Linux...
> >>>>
> >>>> So by setting the u-boot text base to 0x80A00000 u-boot now executes,
> >>>> but it would then immediately silently reboot.
> >>>> Turns out I needed to define the console in the device-tree, which
> >>>> isn't defined in the u-boot tegra30-cardhu.dts.
> >>>> It would then freeze at relocation time, as it was trying to overwrite
> >>>> the trustzone ram space.
> >>>> #define CONFIG_PRAM 2048 solves that issue.
> >>>>
> >>>> I'd like to know if u-boot can read the reserved-memory device-tree
> >>>> node and use it instead of CONFIG_PRAM?
> >>>
> >>> Honestly, this is what CONFIG_PRAM is for.  We could possibly add
> >>> something to get this from device-tree, but we might need to do that
> >>> early enough that it becomes a tricky thing to do.
> >>
> >> Thank you, that makes sense.
> >>
> >>>
> >>>> Otherwise the only issue it seems to have it is does not read the
> >>>> nvidia proprietary partition table.
> >>>> Is there a way to force u-boot to read the backup gpt table similar to
> >>>> the android kernel's method?
> >>>
> >>> Some tangential experiments the other day and I saw that U-Boot would
> >>> read the backup GPT if it's at the expected place.  But that might be
> >>> only after you do something like "part list mmc 0", so there might in
> >>> turn be places that we need to be a bit more robust in our checking.
> >>
> >> Unfortunately running <part list mmc 0> returns "## Unknown partition
> >> table type 0"
> >>
> >> This is the result of the gpt guid command:
> >> Tegra30 (Ouya) # gpt guid mmc 0
> >> GUID Partition Table Header signature is wrong: 0x1000 != 0x5452415020494645
> >> find_valid_gpt: *** ERROR: Invalid GPT ***
> >> find_valid_gpt: ***        Using Backup GPT ***
> >> 00000000-0000-0000-0000-000000000000
> >> success!
>
> That message makes it appear as if it did find the backup GPT? But
> presumably it didn't actually do so, since an all-zeroes UUID isn't
> likely correct.

I am unsure of this answer.
I'd imagine it found something for the header match to succeed on the
backup, even if the GUID itself is invalid?

>
> Does this device even have any GPT? IIRC some of the earlier Tegra
> systems *only* had a TegraPT, and not any valid GPT. Perhaps that we
> Tegra20 or earlier, and we'd fixed that by Tegra30? Or perhaps this
> issue only applied to the eMMC boot HW partitions/region, not the main
> data region.

It does have a valid GPT located at the sector designated by "gpt_sector".
For several years I have been using a patch I ported for mainline
Linux from the early android hacking days.
It essentially overwrites the expected backup sector with the one
designated in the command line.
Both the Tegra20 Motorola Xoom and the Tegra30 Ouya use this method
successfully.

>
> >> The backup GPT is a valid GPT, and linux will pull the partition table
> >> from it if forced to look there.
> >> The android kernel handled this by adding "gpt gpt_sector=15073279" to
> >> the command line.
> >
> > Ah, interesting.  And where is that sector in relation to where the
> > backup should be?  I'm not sure off-hand how easy it would be to make
> > backup location easy to run-time configure, but if it's lba - 2 instead
> > of lba - 1 or something, we could add a build-time "also check.." thing,
> > if it's a consistent offset, and probably is.  Similarly, we could add
> > something kinda ugly to allow overriding GPT_PRIMARY_PARTITION_TABLE_LBA
> > with where that is instead.

The ugly hack is essentially what the downstream Android kernel implemented.
Ideally we would be able to support TegraPT, but judging by the amount
of code Dmitry's implementation for the Linux kernel took, it would
probably be simpler and easier to maintain the downstream
implementation.

> >
> > Other-otherwise, I know there's patches in progress to support "tegra
> > partition table" for Linux and doing that for U-Boot could be handy and
> > fix this problem as well?
> >
>
>
