Return-Path: <SRS0=MjRQ=CA=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8D6C433DF
	for <linux-tegra@archiver.kernel.org>; Sat, 22 Aug 2020 17:15:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB7092078D
	for <linux-tegra@archiver.kernel.org>; Sat, 22 Aug 2020 17:15:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BW+A6sBT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbgHVRPr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 22 Aug 2020 13:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbgHVRPn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 22 Aug 2020 13:15:43 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684CCC061573
        for <linux-tegra@vger.kernel.org>; Sat, 22 Aug 2020 10:15:42 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id t10so6387374ejs.8
        for <linux-tegra@vger.kernel.org>; Sat, 22 Aug 2020 10:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CrKHaRCDxJXVzldPN+yn5O/PW7W3h+V6EFupa6aiE+8=;
        b=BW+A6sBTX+bv3txg6l/LubdtWfwSa5mJhaxgeshemr0b+fa8alM3l9iyyTXt1zuAoO
         /ZUzJqclVzlhANSjBwAlTfhC2lMhiqfdZida8q3U/9ecZy9ZsE+gfpHulF1D69i/iRYM
         ZEWVhofQVCdp43h0GTbQNbhB9QqTJqHHoOIYO8KslnUU5hBTac1Aql+LUiPFX7nRxcBd
         Q/QxqB6UMivcLmYUUBDZvNor9iMc/xkiD4MiS23SceWkjWWknxftjJJJBrvY08AJTUdj
         yMO/QPzwxNHWom4c9T1CG5i6v61vRM/m1Y/dMFdjTbOlCR0tNNj+wDsGFDzGe0iNdr5r
         dTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CrKHaRCDxJXVzldPN+yn5O/PW7W3h+V6EFupa6aiE+8=;
        b=WmWQt5cgVI9tKC7nUnsFh7K+yMRy2CJdWK4KZTsqvEAXEKOjyqqeSKp5Z+SLf5ULrv
         zPWifUIwA1QX3SyBFpLIZloK6TEB/Cw74J58heYdA25SKoJTWG3rYxla//s3ok7kzOtL
         iuYcs78GVclJXnCYqIUSbUIRrSEuAaGVra3dpJMI1CRK3S9w2UKh0fQ8fpzEgoNG4TAI
         31qQj3l/FHcS8AO7NDgkdbwwhMSioP4IpEPZQ5NDAZQ3FayRRTLjbTKewbamH6csGS+x
         Vt/V96FW3y+EgM02Ju7c/iMdRWsYSP2UiyDYRKFTd4KhsRjTo/7W7/4ORwYF5UVwYfI/
         FaCA==
X-Gm-Message-State: AOAM531PW0LWDbyaMUKLDuNgTt8oKO7+mCN9594XRpwTjs9Wd/zrQt+V
        cEsAMLxlGOTxd6NLRx2+Ap5SDmYCyzM74cmvBcc=
X-Google-Smtp-Source: ABdhPJxUF7DAGxgNn3GbjYbJi0jKdI4OkoLnVpqU4mCgG8T98dVKU+Pu0YrI6b4CoYgPTPLLo29R3kCWxHqSCub2a00=
X-Received: by 2002:a17:906:4755:: with SMTP id j21mr7490201ejs.422.1598116540823;
 Sat, 22 Aug 2020 10:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
 <dda406a7-8199-f2ad-b64a-35791aa1033b@wwwdotorg.org> <CAMdYzYpkg9SqcJyDMA0rm9kp-1whT2KQ7+YoebwDHCQpZy2hiA@mail.gmail.com>
 <CAMdYzYrm9v6LWrG0PKkepouJyBXUmg7VxNh96bMp03VavYGuXQ@mail.gmail.com>
 <20200821210451.GE20605@bill-the-cat> <CAMdYzYpj8jYdbFg3QT5x6-HutmYGLBLS2Xjp6grMtv8_aeq2UA@mail.gmail.com>
 <20200821213923.GF20605@bill-the-cat> <8e3d7a19-ab9a-0611-06c1-a3757400c496@wwwdotorg.org>
 <CAMdYzYrh2LoBC6_kxXra3ew5oJa8_ry17kA7Jd==9agLPZYUaA@mail.gmail.com>
In-Reply-To: <CAMdYzYrh2LoBC6_kxXra3ew5oJa8_ry17kA7Jd==9agLPZYUaA@mail.gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Sat, 22 Aug 2020 13:15:29 -0400
Message-ID: <CAMdYzYq2EvWKnz7T0rLQYZWGyRqTiNzGq-0pd-TqcAuxyG5wFg@mail.gmail.com>
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

On Fri, Aug 21, 2020 at 7:30 PM Peter Geis <pgwipeout@gmail.com> wrote:
>
> On Fri, Aug 21, 2020 at 6:41 PM Stephen Warren <swarren@wwwdotorg.org> wrote:
> >
> > On 8/21/20 3:39 PM, Tom Rini wrote:
> > > On Fri, Aug 21, 2020 at 05:30:54PM -0400, Peter Geis wrote:
> > >> On Fri, Aug 21, 2020 at 5:04 PM Tom Rini <trini@konsulko.com> wrote:
> > >>>
> > >>> On Fri, Aug 21, 2020 at 04:17:24PM -0400, Peter Geis wrote:
> > >>>> On Mon, Jul 6, 2020 at 3:48 PM Peter Geis <pgwipeout@gmail.com> wrote:
> > >>>>>
> > >>>>> On Mon, Jul 6, 2020 at 1:04 PM Stephen Warren <swarren@wwwdotorg.org> wrote:
> > >>>>>>
> > >>>>>> On 7/3/20 6:32 AM, Peter Geis wrote:
> > >>>>>>> Good Morning,
> > >>>>>>>
> > >>>>>>> I am attempting to expand on the work for chainloading U-Boot on the
> > >>>>>>> nyan-big in order to chainload U-Boot on the Ouya Tegra30 device from fastboot.
> > >>>>>>> I have so far been unsuccessful at getting any output from U-Boot
> > >>>>>>> through this method.
> > >>>>>>
> > >>>>>> I assume that fastboot executes the loaded code on the main CPU not on
> > >>>>>> the boot CPU (AVP). U-Boot SPL on Tegra30 expects to start running on
> > >>>>>> the AVP though; you would have to disable SPL to make this all work, and
> > >>>>>> perhaps fix U-Boot to work without SPL present. I'm not sure what, if
> > >>>>>> any, changes would be required to support that.
> > >>>>>>
> > >>>>>> For background, see:
> > >>>>>> https://http.download.nvidia.com/tegra-public-appnotes/index.html
> > >>>>>
> > >>>>> Apologies for the resend, I realized I didn't reply to the list.
> > >>>>>
> > >>>>> I admit I'm still extremely new to U-Boot, but this is the way I
> > >>>>> understand the boot flow.
> > >>>>> ROM does extremely low level init, then loads U-boot SPL.
> > >>>>> U-Boot SPL does basic init, ram, cpu and required peripherals, then
> > >>>>> loads U-Boot.bin.
> > >>>>> U-Boot.bin is U-Boot proper, with the full interface.
> > >>>>>
> > >>>>> By loading U-Boot.bin as the nyan instructions indicated, I'm
> > >>>>> bypassing the SPL code as if it was already complete.
> > >>>>> The issue I have is I'm not sure what modifications were done to the
> > >>>>> T124 code to allow nyan to do this.
> > >>>>> I've compared the nyan configs to the cardhu configs and I don't see
> > >>>>> anything that sticks out to me.
> > >>>>> I've also dug through the nyan git log and I don't see anything that
> > >>>>> was specifically changed to allow chainloading on T124.
> > >>>>>
> > >>>>> I also am unsure of where fastboot is loading the kernel in order to
> > >>>>> set the text base correctly.
> > >>>>
> > >>>> For anyone interested, I succeeded at chainloading u-boot on the Ouya.
> > >>>
> > >>> Nice work.
> > >>>
> > >>>> The Linux Kernel with low level debugging enabled in the decompressor
> > >>>> will print the load address.
> > >>>>
> > >>>> Jumping to kernel at:4861 ms
> > >>>>
> > >>>> C:0x80A000C0-0x8112BA40->0x8152C700-0x81C58080
> > >>>> Uncompressing Linux...
> > >>>>
> > >>>> So by setting the u-boot text base to 0x80A00000 u-boot now executes,
> > >>>> but it would then immediately silently reboot.
> > >>>> Turns out I needed to define the console in the device-tree, which
> > >>>> isn't defined in the u-boot tegra30-cardhu.dts.
> > >>>> It would then freeze at relocation time, as it was trying to overwrite
> > >>>> the trustzone ram space.
> > >>>> #define CONFIG_PRAM 2048 solves that issue.
> > >>>>
> > >>>> I'd like to know if u-boot can read the reserved-memory device-tree
> > >>>> node and use it instead of CONFIG_PRAM?
> > >>>
> > >>> Honestly, this is what CONFIG_PRAM is for.  We could possibly add
> > >>> something to get this from device-tree, but we might need to do that
> > >>> early enough that it becomes a tricky thing to do.
> > >>
> > >> Thank you, that makes sense.
> > >>
> > >>>
> > >>>> Otherwise the only issue it seems to have it is does not read the
> > >>>> nvidia proprietary partition table.
> > >>>> Is there a way to force u-boot to read the backup gpt table similar to
> > >>>> the android kernel's method?
> > >>>
> > >>> Some tangential experiments the other day and I saw that U-Boot would
> > >>> read the backup GPT if it's at the expected place.  But that might be
> > >>> only after you do something like "part list mmc 0", so there might in
> > >>> turn be places that we need to be a bit more robust in our checking.
> > >>
> > >> Unfortunately running <part list mmc 0> returns "## Unknown partition
> > >> table type 0"
> > >>
> > >> This is the result of the gpt guid command:
> > >> Tegra30 (Ouya) # gpt guid mmc 0
> > >> GUID Partition Table Header signature is wrong: 0x1000 != 0x5452415020494645
> > >> find_valid_gpt: *** ERROR: Invalid GPT ***
> > >> find_valid_gpt: ***        Using Backup GPT ***
> > >> 00000000-0000-0000-0000-000000000000
> > >> success!
> >
> > That message makes it appear as if it did find the backup GPT? But
> > presumably it didn't actually do so, since an all-zeroes UUID isn't
> > likely correct.
>
> I am unsure of this answer.
> I'd imagine it found something for the header match to succeed on the
> backup, even if the GUID itself is invalid?
>
> >
> > Does this device even have any GPT? IIRC some of the earlier Tegra
> > systems *only* had a TegraPT, and not any valid GPT. Perhaps that we
> > Tegra20 or earlier, and we'd fixed that by Tegra30? Or perhaps this
> > issue only applied to the eMMC boot HW partitions/region, not the main
> > data region.
>
> It does have a valid GPT located at the sector designated by "gpt_sector".
> For several years I have been using a patch I ported for mainline
> Linux from the early android hacking days.
> It essentially overwrites the expected backup sector with the one
> designated in the command line.
> Both the Tegra20 Motorola Xoom and the Tegra30 Ouya use this method
> successfully.
>
> >
> > >> The backup GPT is a valid GPT, and linux will pull the partition table
> > >> from it if forced to look there.
> > >> The android kernel handled this by adding "gpt gpt_sector=15073279" to
> > >> the command line.
> > >
> > > Ah, interesting.  And where is that sector in relation to where the
> > > backup should be?  I'm not sure off-hand how easy it would be to make
> > > backup location easy to run-time configure, but if it's lba - 2 instead
> > > of lba - 1 or something, we could add a build-time "also check.." thing,
> > > if it's a consistent offset, and probably is.  Similarly, we could add
> > > something kinda ugly to allow overriding GPT_PRIMARY_PARTITION_TABLE_LBA
> > > with where that is instead.
>
> The ugly hack is essentially what the downstream Android kernel implemented.
> Ideally we would be able to support TegraPT, but judging by the amount
> of code Dmitry's implementation for the Linux kernel took, it would
> probably be simpler and easier to maintain the downstream
> implementation.

An ugly hack isn't necessary, though some improvements to the part_efi
detection are required.
part_test_efi() only tests if a valid legacy MBR exists, which is not
the best way to validate the existence of a GPT.
For instance, it is possible to have a pure GPT without a MBR.
Or if the MBR is ever corrupted, but the GPT is still valid, the
device wouldn't be bootable.
I found by bypassing the test, the rest of the efi_part code properly
detects the GPT partitions from the backup table.
Tegra30 (Ouya) # part list mmc 0
part_init: try 'EFI': ret=0

Partition Map for MMC device 0  --   Partition Type: EFI

GUID Partition Table Header signature is wrong: 0x1000 != 0x5452415020494645
find_valid_gpt: *** ERROR: Invalid GPT ***
GPT: first_usable_lba: 6000 last_usable_lba: E5EFFF last lba: e60000
alloc_read_gpt_entries: count = 9 * 128 = 1152
find_valid_gpt: ***        Using Backup GPT ***
part_print_efi: gpt-entry at bf954080
Part    Start LBA       End LBA         Name
        Attributes
        Type GUID
        Partition GUID
  1     0x00006000      0x00009fff      "SOS"
        attrs:  0x0000000000000000
        type:   ebd0a0a2-b9e5-4433-87c0-68b6b72699c7
        guid:   f7fff03a-1d9f-1578-5cf4-fef5bae2cdd8
  2     0x0000a000      0x0000dfff      "LNX"
        attrs:  0x0000000000000000
        type:   ebd0a0a2-b9e5-4433-87c0-68b6b72699c7
        guid:   1f1111a0-43b1-fe9f-efaf-67c2f51d6e14
  3     0x0000e000      0x0010dfff      "APP"
        attrs:  0x0000000000000000
        type:   ebd0a0a2-b9e5-4433-87c0-68b6b72699c7
        guid:   2782e847-c576-23ae-a2cc-fb7ff638eba5
  4     0x0010e000      0x0028dfff      "CAC"
        attrs:  0x0000000000000000
        type:   ebd0a0a2-b9e5-4433-87c0-68b6b72699c7
        guid:   013d9517-7827-c9a1-7b12-ea64692dc07a
  5     0x0028e000      0x0028efff      "UPP"
        attrs:  0x0000000000000000
        type:   ebd0a0a2-b9e5-4433-87c0-68b6b72699c7
        guid:   a303a939-d4f2-ee52-b50d-82aad2d6d8d5
  6     0x0028f000      0x0028ffff      "MSC"
        attrs:  0x0000000000000000
        type:   ebd0a0a2-b9e5-4433-87c0-68b6b72699c7
        guid:   eddc4a8f-ee03-9019-852e-740c6d2b9a75
  7     0x00290000      0x0029ffff      "USP"
        attrs:  0x0000000000000000
        type:   ebd0a0a2-b9e5-4433-87c0-68b6b72699c7
        guid:   4eff751d-0945-b9c3-8fce-8dc89c03d30d
  8     0x002a0000      0x002a0fff      "MDA"
        attrs:  0x0000000000000000
        type:   ebd0a0a2-b9e5-4433-87c0-68b6b72699c7
        guid:   fdd5f6fb-d8d4-bdbf-e606-c421803a6ec4
  9     0x002a1000      0x00e5efff      "UDA"
        attrs:  0x0000000000000000
        type:   ebd0a0a2-b9e5-4433-87c0-68b6b72699c7
        guid:   8e57084a-94bc-9d96-fcf5-20b31336fc37

I have now successfully booted the following chain:
Fastboot -> U-Boot -> Linux.

>
> > >
> > > Other-otherwise, I know there's patches in progress to support "tegra
> > > partition table" for Linux and doing that for U-Boot could be handy and
> > > fix this problem as well?
> > >
> >
> >

I have found a few other issues along the way with the Tegra30 code.
The clk dump command returns nothing.
USB appears to be completely broken.
The gadget mode driver only works with the first USB controller on the
Tegra30, but it is trying to attach to the third controller.
If the first controller is the only one available, it simply fails
with "enodev".
The other controllers detect their devices only about half the time.
When they do detect a device, either they fail to configure it or get
constant timeouts when attempting to communicate with it:
starting USB...
Bus usb@7d000000: USB EHCI 1.00
Bus usb@7d004000: USB EHCI 1.00
Bus usb@7d008000: Device 'usb@7d008000': seq 0 is in use by 'usb@7d000000'
USB EHCI 1.00
scanning bus usb@7d000000 for devices... 1 USB Device(s) found
scanning bus usb@7d004000 for devices... EHCI timed out on TD - token=0x80008d80
EHCI timed out on TD - token=0x80008c80
EHCI timed out on TD - token=0x80008c80
EHCI timed out on TD - token=0x80008c80

Tegra30 (Ouya) # usb start
starting USB...
Bus usb@7d000000: USB EHCI 1.00
Bus usb@7d004000: USB EHCI 1.00
Bus usb@7d008000: Device 'usb@7d008000': seq 0 is in use by 'usb@7d000000'
USB EHCI 1.00
scanning bus usb@7d000000 for devices... 1 USB Device(s) found
scanning bus usb@7d004000 for devices... EHCI timed out on TD - token=0x80008c80
unable to get device descriptor (error=-1)
1 USB Device(s) found
scanning bus usb@7d008000 for devices... EHCI timed out on TD - token=0x80008c80
unable to get descriptor, error 22
usb_new_device: Cannot read configuration, skipping device 1058:25f3
1 USB Device(s) found
       scanning usb for storage devices... 0 Storage Device(s) found
