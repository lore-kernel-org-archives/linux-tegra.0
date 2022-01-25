Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359AFC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Jan 2022 10:35:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348470AbiAYKfU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Jan 2022 05:35:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42957 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346404AbiAYKaT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jan 2022 05:30:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643106612;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jeBI1CVeLHR/2y3eo4TQixtaNQgk+2mTQh79AAcu0Ig=;
        b=LVWElisT1zXK2tYBC0K6NRkz9S457g0kTNk4hOPVbIrEnm7hx1N0O5cOlTLB2uONDytijC
        5MAhu1WB/bZsqXkCMOl+8ULgJgzFSAysjma4MosrEH9892W4P4AzWRSCdiLEa4FyyMnLkO
        ZsMYaQwih6/ouZPzogzKVxbQQ3aOe2g=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-s2DYrjWeMyCxbrKDuHY-ZQ-1; Tue, 25 Jan 2022 05:30:11 -0500
X-MC-Unique: s2DYrjWeMyCxbrKDuHY-ZQ-1
Received: by mail-ej1-f71.google.com with SMTP id i21-20020a1709063c5500b006b4c7308c19so3334972ejg.14
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jan 2022 02:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jeBI1CVeLHR/2y3eo4TQixtaNQgk+2mTQh79AAcu0Ig=;
        b=DyXozWavIiGa6eArjTD72zGXN++wMJ2dqPLUPyAu4YPvsHBqBV+G0Sfb1VOD37W9Kp
         e81oWKC8aq5UG1sk9XLuqqM2+kLQCcNqCSKhaoiLzZsJDsHy2NADiJsaojoYnX2Ra2+Z
         vOFSpWuFvWpGT9KLvf4c3sO/XfzWrc+HYqBzo3p55ysa1fXyANwaF3XkUgjP4XJt4r/H
         68wqgd6WGGZ3s2ZPqYA7p+wCd6sgwrs81ajMyIA7tAkuW7HOFEjvpbibQRX6N+eQ5yqv
         RPDkGAyhdrpxat0RJTkOnkiJokt6KF7YuV72Lfv/fTAe9eFAdDMo4ThJjQhpoiX7Qvp2
         zhxw==
X-Gm-Message-State: AOAM530cSUcPkBn9gSHnQk02zMnUzS0FgBEIiu0SDU++j6RKsxXgFtif
        DRP+qykKbOV5/EJLzxVgeGgC5NoDJAq7vdUoyH+egfogYXJg23LjQNEDNZF+faBa1XxeXuRf0KI
        JOBnHyLE6iOGaqrd/fOzl6dw7TICLvykraIqn4k8=
X-Received: by 2002:a17:907:7e93:: with SMTP id qb19mr266808ejc.450.1643106609776;
        Tue, 25 Jan 2022 02:30:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvG7vL36kgfYbivxEIr4eAAB8fmCVxPFzEBQzYHM1SR7962CDd2iR6kwPpZKulQczpjmm/6nVzZn5pKQggguk=
X-Received: by 2002:a17:907:7e93:: with SMTP id qb19mr266791ejc.450.1643106609559;
 Tue, 25 Jan 2022 02:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20211029201402.428284-1-wander@redhat.com> <a1ac6254-f79e-d131-fa2a-c7ad714c6d4a@nvidia.com>
 <f451e67d-adb9-01e8-bd11-bf7804863b4b@kernel.org> <8e57400f-d6a8-bd42-6214-fca1fe37a972@kernel.org>
 <11ec4350-b890-4949-cf8f-bc62d530d64f@nvidia.com>
In-Reply-To: <11ec4350-b890-4949-cf8f-bc62d530d64f@nvidia.com>
From:   Wander Costa <wcosta@redhat.com>
Date:   Tue, 25 Jan 2022 07:29:58 -0300
Message-ID: <CAAq0SU=9R3Y_SAdM+HaqavzWBRd1Li-b5bnZZLd5Opfgd0vnkQ@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: Use fifo in 8250 console driver
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Wander Lairson Costa <wander@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Johan Hovold <johan@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jan 25, 2022 at 7:06 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 25/01/2022 09:36, Jiri Slaby wrote:
>
> ...
>
> >> The test is bogus:
> >>          use_fifo = (up->capabilities & UART_CAP_FIFO) &&
> >>                  port->fifosize > 1 &&
> >>                  (serial_port_in(port, UART_FCR) & UART_FCR_ENABLE_FIFO)
> >>
> >> FCR is write only. Reading it, one gets IIR contents.
> >
> > In particular, the test is checking whether there is no interrupt
> > pending (UART_FCR_ENABLE_FIFO == UART_IIR_NO_INT). So it oscillates
> > between use_fifo and not, depending on the interrupt state of the chip.
> >
> > Could you change it into something like this:
> > --- a/drivers/tty/serial/8250/8250_port.c
> > +++ b/drivers/tty/serial/8250/8250_port.c
> > @@ -3396,7 +3396,7 @@ void serial8250_console_write(struct
> > uart_8250_port *up, const char *s,
> >
> >          use_fifo = (up->capabilities & UART_CAP_FIFO) &&
> >                  port->fifosize > 1 &&
> > -               (serial_port_in(port, UART_FCR) & UART_FCR_ENABLE_FIFO) &&
> > +               (up->fcr & UART_FCR_ENABLE_FIFO) &&
> >                  /*
> >                   * After we put a data in the fifo, the controller will
> > send
> >                   * it regardless of the CTS state. Therefore, only use
> > fifo
> >
> >
> > And see whether it fixes the issue. Anyway, of what port type is the
> > serial port (what says dmesg/setserial about that)?
>
>
> Thanks. Unfortunately, this did not fix it. The port type is PORT_TEGRA ...
>
>   70006000.serial: ttyS0 at MMIO 0x70006000 (irq = 72, base_baud = 25500000) is a Tegra

I see PORT_TEGRA has different values for fifosize and tx_loadsz.
Maybe we should use tx_loadsz.
Could you please give a try to this patch:

diff --git a/drivers/tty/serial/8250/8250_port.c
b/drivers/tty/serial/8250/8250_port.c
index 2abb3de11a48..d3a93e5d55f7 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3343,7 +3343,7 @@ static void serial8250_console_fifo_write(struct
uart_8250_port *up,
 {
        int i;
        const char *end = s + count;
-       unsigned int fifosize = up->port.fifosize;
+       unsigned int fifosize = up->tx_loadsz;
        bool cr_sent = false;

        while (s != end) {
@@ -3409,8 +3409,8 @@ void serial8250_console_write(struct
uart_8250_port *up, const char *s,
        }

        use_fifo = (up->capabilities & UART_CAP_FIFO) &&
-               port->fifosize > 1 &&
-               (serial_port_in(port, UART_FCR) & UART_FCR_ENABLE_FIFO) &&
+               up->tx_loadsz > 1 &&
+               (up->fcr & UART_FCR_ENABLE_FIFO) &&
                /*
                 * After we put a data in the fifo, the controller will send
                 * it regardless of the CTS state. Therefore, only use fifo



>
> Jon
>
> --
> nvpublic
>

