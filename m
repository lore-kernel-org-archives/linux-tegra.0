Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B887C2BA4C
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jan 2022 13:24:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238940AbiAZNYM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jan 2022 08:24:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28527 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239018AbiAZNYM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jan 2022 08:24:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643203451;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ANJWRqaJOsHeBahCZP1aUBPvVHukSwmTjnJxwO3XFi8=;
        b=PI/U1at3D9yLh1M4kiJLHma8Zf9uTX0AiBX2ZdBytOPtvzSfoIHE4n/Pqpe0qU2ntqIIGy
        enBQndMRPAnAOzNFUmFJXZUxErwBQDFkwOBnAss7DpLFY6r2E2G2vhDQUv3Ng+bH2DZ+pp
        tUSr8L5iuNoIK9TH7LV3HnuqCM6ZYXo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-N3gH6zUkMWqBV-yclZB2xA-1; Wed, 26 Jan 2022 08:24:10 -0500
X-MC-Unique: N3gH6zUkMWqBV-yclZB2xA-1
Received: by mail-ed1-f72.google.com with SMTP id eg24-20020a056402289800b00407f95c4c35so6146678edb.10
        for <linux-tegra@vger.kernel.org>; Wed, 26 Jan 2022 05:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ANJWRqaJOsHeBahCZP1aUBPvVHukSwmTjnJxwO3XFi8=;
        b=HZeWcYtBsjhh/HKJyPqtuqsM8mnK5SMbRkLjh1U/1J3zp/Ro5Udvgi/QBoi57P9Hd0
         d2GlnoER3hcGdE5ouqutHD7j8qqb/50jIfuujIKxDrUdcorkm70zvKqAdiWDKHE6kmYH
         fytpmnOMzd6cBlhKy6OSbhW6rmb8SLzUQste8tPEJdI6vN0nmm1Ijq8TKzzLEefnBP+4
         XAP7T7ZRPSGIO+nbNajN6lnLzRD22dSwVoGZ9Sstb1txd02qHbTGCEx4NFeLZJp0w9QA
         jIdMUCxCc+IxHvIjCAZwwZd6dOQ1um0+e51njGKkgASYwgtgiWtJSpbW88NR4i2M/DLx
         ZVEw==
X-Gm-Message-State: AOAM532VE/5Xj9vZHVZuVC2nOP658FTxOz8ZPYPWkCUhcWuJCW9ypgzN
        BRhPJiNAI2QEa1XmDCNhG6a9JsR+PnhkhZvS/Kb476OOS5wHPfjzQv6YuDTWQqf4djYL7Bc3u2N
        2aLENHQrwTNaX8Od+WgFmi4G+PS0NqkulGDFFjy8=
X-Received: by 2002:aa7:d916:: with SMTP id a22mr25322809edr.316.1643203448929;
        Wed, 26 Jan 2022 05:24:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWwMrft4WxUun1ndbSR3lYX4QMq5cL7NVmEXsJv8NqcvjuTwDeS2EsnamlOpKPh8HCYWa/s4tUCv06avVPlVA=
X-Received: by 2002:aa7:d916:: with SMTP id a22mr25322789edr.316.1643203448749;
 Wed, 26 Jan 2022 05:24:08 -0800 (PST)
MIME-Version: 1.0
References: <a1ac6254-f79e-d131-fa2a-c7ad714c6d4a@nvidia.com>
 <f451e67d-adb9-01e8-bd11-bf7804863b4b@kernel.org> <8e57400f-d6a8-bd42-6214-fca1fe37a972@kernel.org>
 <11ec4350-b890-4949-cf8f-bc62d530d64f@nvidia.com> <CAAq0SU=9R3Y_SAdM+HaqavzWBRd1Li-b5bnZZLd5Opfgd0vnkQ@mail.gmail.com>
 <fa42a60c-954a-acc0-3962-f00427153f78@nvidia.com> <YfArHDfrVHw7ApDx@smile.fi.intel.com>
 <YfArWaKJ13+OC/7w@smile.fi.intel.com> <CAAq0SU=U3UY+DUdd1fjj25Yt_QZriShZTSFTsq5B4tPnOYhQvQ@mail.gmail.com>
 <YfELyq5AmxiZxjme@kroah.com> <YfE6AiIgXrd+5qvk@smile.fi.intel.com>
In-Reply-To: <YfE6AiIgXrd+5qvk@smile.fi.intel.com>
From:   Wander Costa <wcosta@redhat.com>
Date:   Wed, 26 Jan 2022 10:23:57 -0300
Message-ID: <CAAq0SU=ivwiGPZoD=BsD67A4A4pvuh0S02L2Udhg8vmjnmCAAw@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: Use fifo in 8250 console driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Wander Lairson Costa <wander@redhat.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Johan Hovold <johan@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jan 26, 2022 at 9:10 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jan 26, 2022 at 09:52:26AM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Jan 25, 2022 at 03:40:36PM -0300, Wander Costa wrote:
> > > On Tue, Jan 25, 2022 at 1:56 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > On Tue, Jan 25, 2022 at 06:53:48PM +0200, Andy Shevchenko wrote:
> > > > > On Tue, Jan 25, 2022 at 12:40:27PM +0000, Jon Hunter wrote:
> > > > > > On 25/01/2022 10:29, Wander Costa wrote:
> > > >
> > > > ...
> > > >
> > > > > > Andy, does this work for X86?
> > > > >
> > > > > Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > >
> > > > > No, it does NOT fix an issue (I see it on a handful x86) with the legacy UART
> > > > > (means the 8250_pnp is in use). And I believe the same will be the case on LPSS
> > > > > ones (8250_dw / 8250_lpss) and HSU (8250_mid), because the patch influences on
> > > > > all of them.
> > > >
> > > > Shall I send a revert and we can continue with a new approach later on?
> > > >
> > >
> > > Tomorrow (or maybe after tomorrow) I am going to post the fixes I
> > > already have, and an additional patch adding a build option
> > > (disabled to default) so people maybe if they want to use the FIFO on
> > > console write. But I understand if people decide to go
> > > ahead and revert the patch.
> >
> > Let me revert this for now.  And no new config options please, this
> > should "just work".
>
> Thanks!
>
> Wander, if you need a test for something new, I may help to perform on
> our (sub)set of x86 machines.
>

Thanks, Andy. I will let you know when I have new patches.

