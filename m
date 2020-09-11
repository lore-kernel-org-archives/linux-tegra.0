Return-Path: <SRS0=EsoP=CU=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD7CC433E2
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Sep 2020 07:46:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DC9E22209
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Sep 2020 07:46:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iJSfcSRD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbgIKHqJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Sep 2020 03:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgIKHp5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Sep 2020 03:45:57 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B50C061757
        for <linux-tegra@vger.kernel.org>; Fri, 11 Sep 2020 00:45:56 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id g4so9030726edk.0
        for <linux-tegra@vger.kernel.org>; Fri, 11 Sep 2020 00:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H10t/PoYzFp2YJmus+JauG6BT44xTI8He+24ZzfKGuc=;
        b=iJSfcSRDOI0uj91Wf8MfSv/rALU7QF9mAKdWgTtdYgxxMFt80M8rsPWnXsXYMzUpZK
         xHebxWWZTzyE/epGDO1WpaKpE8SOrd0QpZqajO8z3MCuct47/WoledDN2wrpFrTVsELB
         C/Dyw6kPcsR4JDILPM/nBFjJEI3h0YHOinecmu1KOgC5RsTbTTEEaZwZDv4YHbWn9RIm
         ZviGWZDSck3+GZAMoo2bfIS1Lxd32PEiG9+OLmj4P9a/W52MoUUrfQmqYprssftujuh9
         DmCIv8Yi1GSnT8yjI/bThPIVd20V7UVAMCV+ydLH3qveG2n2iguoJxEkaBA2PVarhCv6
         2M+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H10t/PoYzFp2YJmus+JauG6BT44xTI8He+24ZzfKGuc=;
        b=hbeR54UWCIPtx0xOKr/lByHIgs/tCuuz0aL/tvZmtRe3qdcFH4pryIZMrXbO9BTcHU
         lIwUzkJ+LMzRjiCJej7vSuu3FL6+UUGXJlGsf9nYcioQN7DGBJCI76AHBl0VzIPyZZX6
         zV8ZLpXQ8UWcZoTQxLPSEflBiz4PlOWivENe13VHbPUWUJaqaEeKrWYXqBZ6EywfpUYS
         73Z1O5lCqKYmEgplTxIBL28hQ93SiREMihJ86K/3znYoRuD8KVV1bGuaZJGkE5HFvsoO
         7kZgGEjZyz/5M/qE/TJsp2D37I9DDOgqyIAMa49YPkWpvEkWKZwB/kS0mKz9KYZ0+MuT
         eLhA==
X-Gm-Message-State: AOAM533f+vfClf/KYdlAlVBSZGJ+2In86kLubQNhZpwgRFp9rPhjB1je
        +6uykVOM5PaJr/sf8xOhcHqEqGY2JaHChdDbBx0xgQ==
X-Google-Smtp-Source: ABdhPJzoAxY70MZcPNGWxyG6zQ6qr5FKoQPOg9NgPLDiF+Ir58RNLJLUI7l1ei3YibuFb2rBegUpdWQ+ccblZaesBJc=
X-Received: by 2002:a50:e79c:: with SMTP id b28mr712767edn.371.1599810354627;
 Fri, 11 Sep 2020 00:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200910134239.192030-1-jonathanh@nvidia.com> <20200910134239.192030-2-jonathanh@nvidia.com>
 <CAMpxmJXbhrmJJn4f3zk4=Y2tCwLzpFc+c6NbxcqVe8eaLSRvtw@mail.gmail.com>
 <88021f57-b8cf-d3d6-0e9c-19ed0bccb729@nvidia.com> <5afe9537-dc50-16ff-028e-b4539c6f924a@nvidia.com>
In-Reply-To: <5afe9537-dc50-16ff-028e-b4539c6f924a@nvidia.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 11 Sep 2020 09:45:43 +0200
Message-ID: <CAMpxmJUAhJmGA_3nKs51hF=08vY19U5Rpfz30DLgOOiTMuxjzA@mail.gmail.com>
Subject: Re: [PATCH 1/5] misc: eeprom: at24: Initialise AT24 NVMEM ID field
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 10, 2020 at 8:19 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 10/09/2020 19:15, Jon Hunter wrote:
> >
> > On 10/09/2020 16:35, Bartosz Golaszewski wrote:
> >> On Thu, Sep 10, 2020 at 3:43 PM Jon Hunter <jonathanh@nvidia.com> wrote:
> >>>
> >>> The AT24 EEPROM driver does not initialise the 'id' field of the
> >>> nvmem_config structure and because the entire structure is not
> >>> initialised, it ends up with a random value. This causes the NVMEM
> >>> driver to append the device 'devid' value to name of the NVMEM
> >>> device. Although this is not a problem per-se, for I2C devices such as
> >>> the AT24, that already have a device unique name, there does not seem
> >>> much value in appending an additional 0 to the I2C name. For example,
> >>> appending a 0 to an I2C device name such as 1-0050 does not seem
> >>> necessary and maybe even a bit confusing. Therefore, fix this by
> >>> setting the NVMEM config.id to NVMEM_DEVID_NONE for AT24 EEPROMs.
> >>>
> >>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >>> ---
> >>>  drivers/misc/eeprom/at24.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> >>> index e9df1ca251df..3f7a3bb6a36c 100644
> >>> --- a/drivers/misc/eeprom/at24.c
> >>> +++ b/drivers/misc/eeprom/at24.c
> >>> @@ -715,6 +715,7 @@ static int at24_probe(struct i2c_client *client)
> >>>
> >>>         nvmem_config.name = dev_name(dev);
> >>>         nvmem_config.dev = dev;
> >>> +       nvmem_config.id = NVMEM_DEVID_NONE;
> >>>         nvmem_config.read_only = !writable;
> >>>         nvmem_config.root_only = !(flags & AT24_FLAG_IRUGO);
> >>>         nvmem_config.owner = THIS_MODULE;
> >>> --
> >>> 2.25.1
> >>>
> >>
> >> This patch is correct and thanks for catching it. I vaguely recall
> >> wondering at some point why the appended 0 in the nvmem name for at24.
> >> Unfortunately this change would affect how the device is visible in
> >> user-space in /sys/bus/nvmem/devices/ and this could break existing
> >> users. Also: there are many in-kernel users that would need to be
> >> updated. I'm afraid we'll need some sort of backward compatibility.
> >
> >
> > Thanks, yes that is a problem. I guess for now we could explicitly init
> > to NVMEM_DEVID_AUTO or maybe just 0 so that it defaults to the same path
> > in the NVMEM driver. However, I am not sure how we can make allow some
> > devices to use NVMEM_DEVID_NONE and others use something else. This is
> > not really something that we can describe in DT because it has nothing
> > to do with h/w.
>
>
> Unless we make the configuration of the 'id' dependent on the 'label'
> property so something like ...
>
>         if (device_property_present(dev, "label")) {
>                 nvmem_config.id = NVMEM_DEVID_NONE;
>                 err = device_property_read_string(dev, "label",
>                                                   &nvmem_config.name);
>                 if (err)
>                         return err;
>         } else {
>                 nvmem_config.id = NVMEM_DEVID_AUTO;
>                 nvmem_config.name = dev_name(dev);
>         }
>
> Cheers
> Jon
>
> --
> nvpublic

Yes, this looks like the best compromise we can get for now. Please
make sure to document why we do this in the code.

Bartosz
