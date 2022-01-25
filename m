Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A505C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Jan 2022 18:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbiAYSkx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Jan 2022 13:40:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51373 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232889AbiAYSkw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jan 2022 13:40:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643136051;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=g6xgw7PLLB99kGOm82Md5xSrceAHr+vyHuVH486XnJc=;
        b=QFrDht///ZiAsWtq5NB+5Xfy9GgQOWlmnYsXx1JW/G6PzlBFV3wV/s5PgUddS4dwi7u+JE
        W1JXRW0SeqAoNEEcmg/+cxbgavhtAH0aF1703vWgClKwRp8x8kJL83cRryoKRSfCWbRwIQ
        FnTsjJ/YEmfR+nh5OCG0leEmMooZ5Sw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-OMp3Np22MC6dbD83M0rwMQ-1; Tue, 25 Jan 2022 13:40:49 -0500
X-MC-Unique: OMp3Np22MC6dbD83M0rwMQ-1
Received: by mail-ed1-f71.google.com with SMTP id p17-20020aa7c891000000b004052d1936a5so11134235eds.7
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jan 2022 10:40:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g6xgw7PLLB99kGOm82Md5xSrceAHr+vyHuVH486XnJc=;
        b=nUEpLIxf+8khRVlBvVIFmzEYFD/Qw5we1/5uzRGD5/tBwNj7pHdb9fN6RmZqwDv1q5
         2FrQMNAIWbk1A8oqWT6knvdwkIXGrgKGKN1pUBi/4qwZcOJ5qllFNe7amAdu77PrrGQT
         FV0LNopL1b4SI1AtXBPFqm4jJ3lk+g6iSHtlf+YAsZZ2Ekubp9XkEe4pfD5KsWoOfQXz
         ASCd++j8QZB8GweCWgquPkFWK6boCQIR4czsJQ+jbFOi/2+GLoEZFXdrIw9f+mOacsVf
         91n8hTtd7ufzh4k43///F+N/nIxljkWmZZNpYrFDtzFCo9FyneOs6qCgbgf3apwP3Ns6
         x1oQ==
X-Gm-Message-State: AOAM531/Oszl8NuGXJIoegbHRMSakyQrjzkr7kBRML2bHMi8bxQn0z9E
        t6d0v2V76jrj9IIj3wqQhkoAxTvOO7NBYHfDP8T4myOJlhg2xxXd0erqlUzLfsvjSL3rBd7Q3Ky
        k8+dApKVG/aL/iQ7wnz8AAlHcpGfaGcHVVqFLyUU=
X-Received: by 2002:aa7:c046:: with SMTP id k6mr18187799edo.9.1643136048744;
        Tue, 25 Jan 2022 10:40:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxya5dJ1miI9SET/rdoVMG9M9jvYhFhoQdOs0j/ZIC5u8/OefiKgy0godTNlvTTkg6wialGZuuOBdiW278y2To=
X-Received: by 2002:aa7:c046:: with SMTP id k6mr18187780edo.9.1643136048545;
 Tue, 25 Jan 2022 10:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20211029201402.428284-1-wander@redhat.com> <a1ac6254-f79e-d131-fa2a-c7ad714c6d4a@nvidia.com>
 <f451e67d-adb9-01e8-bd11-bf7804863b4b@kernel.org> <8e57400f-d6a8-bd42-6214-fca1fe37a972@kernel.org>
 <11ec4350-b890-4949-cf8f-bc62d530d64f@nvidia.com> <CAAq0SU=9R3Y_SAdM+HaqavzWBRd1Li-b5bnZZLd5Opfgd0vnkQ@mail.gmail.com>
 <fa42a60c-954a-acc0-3962-f00427153f78@nvidia.com> <YfArHDfrVHw7ApDx@smile.fi.intel.com>
 <YfArWaKJ13+OC/7w@smile.fi.intel.com>
In-Reply-To: <YfArWaKJ13+OC/7w@smile.fi.intel.com>
From:   Wander Costa <wcosta@redhat.com>
Date:   Tue, 25 Jan 2022 15:40:36 -0300
Message-ID: <CAAq0SU=U3UY+DUdd1fjj25Yt_QZriShZTSFTsq5B4tPnOYhQvQ@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: Use fifo in 8250 console driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Wander Lairson Costa <wander@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On Tue, Jan 25, 2022 at 1:56 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jan 25, 2022 at 06:53:48PM +0200, Andy Shevchenko wrote:
> > On Tue, Jan 25, 2022 at 12:40:27PM +0000, Jon Hunter wrote:
> > > On 25/01/2022 10:29, Wander Costa wrote:
>
> ...
>
> > > Andy, does this work for X86?
> >
> > Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > No, it does NOT fix an issue (I see it on a handful x86) with the legacy UART
> > (means the 8250_pnp is in use). And I believe the same will be the case on LPSS
> > ones (8250_dw / 8250_lpss) and HSU (8250_mid), because the patch influences on
> > all of them.
>
> Shall I send a revert and we can continue with a new approach later on?
>

Tomorrow (or maybe after tomorrow) I am going to post the fixes I
already have, and an additional patch adding a build option
(disabled to default) so people maybe if they want to use the FIFO on
console write. But I understand if people decide to go
ahead and revert the patch.

> --
> With Best Regards,
> Andy Shevchenko
>
>

