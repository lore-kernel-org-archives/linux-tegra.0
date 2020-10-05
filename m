Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8D2C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 15:45:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFE44206DD
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 15:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTaKQBTc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbgJEPpe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 11:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbgJEPpe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 11:45:34 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE277C0613CE;
        Mon,  5 Oct 2020 08:45:33 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id l16so2684849eds.3;
        Mon, 05 Oct 2020 08:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jIX21jChmPIeBQ/4cvpbKL+RpuVDXgE5A6afa2c5JOs=;
        b=YTaKQBTcShuhWEE+iFiUyr045bWopbakXqy8HqBiJ81n7aE0uVuoUcmDMlii93g9Sf
         wrXJ14NRlA7CCWkOayoS6sjApjR5hNRWld31JpdXa75d9X6AgdccxxggZ3ZPZmnk5i8K
         kBrmOtCIgy6d4cDZ2bCk/2PbevyWvduNW57WWAzuoEozCvXIzjidPmXGYpZeIqfQaWkI
         e3NlvoLGZI/aOZf1kWkNp1Nlt3Y1Sldj55ybXCabrNc6USmgRvIV2E9/E6onGJrmbIer
         Bs2Ck6uIYQ5mejhehlMEFu8QDbW+EDW0kM058kl2WvIP47CfkOUigzpEqpBYGMDywiuT
         SnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jIX21jChmPIeBQ/4cvpbKL+RpuVDXgE5A6afa2c5JOs=;
        b=iRkayYTnbrgktbeaptm67pjjLnTmkWUrw7i4MjiUzOhQu2iEsxLCPMALnDuJ7CUS2Y
         TQgUZpBDfVNoU0tAXkXggIARyLMNyInCTzCu4nX8GZztEZ2Emzl9dvOvV7r/GV9lubRU
         K356bEapjwBbHd9d740PjpJ7z5WKDWjnpbkYsN2sfVEj6KfsTDbdBmj6+3Jt80Q25Q1K
         kmuJ/4ameAYQPmlZHMyOR+kl6zCjjkpO7D7kdSNbx1EXAaHqw1mKavjbUGj0jzCBMZ/l
         vqkzfZxbvjpRayEHIypSQvrXkUkyzBRKUGis80TfsQfPGAFZcklh/JZmfHmnuu1cSiMl
         1ZrA==
X-Gm-Message-State: AOAM532Rj/ZNoWzaCsj+umWdwMJUqmSh01YzD3V6E0KbnssCixcC5i13
        q7bn9sy9bsr/SnMZe1DU9m4=
X-Google-Smtp-Source: ABdhPJys3SL8vWOGcsrrN8Mv67f++ZQ9gNaQ1G5NzoqCxvPOIPG7SN5/l1DHluqhIQSFUXZDjuhM3g==
X-Received: by 2002:a05:6402:c12:: with SMTP id co18mr279545edb.162.1601912732344;
        Mon, 05 Oct 2020 08:45:32 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id i15sm119065edf.82.2020.10.05.08.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:45:30 -0700 (PDT)
Date:   Mon, 5 Oct 2020 17:45:29 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
Subject: Re: [PATCH 0/3] soc/tegra: Prevent the PMC driver from corrupting
 interrupt routing
Message-ID: <20201005154529.GB628746@ulmo>
References: <20201005111443.1390096-1-maz@kernel.org>
 <20201005112217.GR425362@ulmo>
 <da38356394b63e2210f0e52d2e9bdc60@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline
In-Reply-To: <da38356394b63e2210f0e52d2e9bdc60@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2020 at 02:06:37PM +0100, Marc Zyngier wrote:
> On 2020-10-05 12:22, Thierry Reding wrote:
> > On Mon, Oct 05, 2020 at 12:14:40PM +0100, Marc Zyngier wrote:
> > > Jon recently reported that one of the Tegra systems (Jetson TX2, aka
> > > tegra186) stopped booting with the introduction of the "IPI as IRQs"
> > > series. After a few weeks of head scratching and complete puzzlement,
> > > I obtained a board and started looking at what was happening.
> > >=20
> > > The interrupt hierarchy looks like this:
> > >=20
> > > 	[DEVICE] -A-> [PMC] -B-> [GIC]
> > >=20
> > > which seems simple enough. However, not all the devices attached to
> > > the PMC follow this hierarchy, and in some cases, the 'B' link isn't
> > > present in the HW. In other cases, neither 'A' nor 'B' are present.
> > > And yet the PMC driver creates such linkages using random hwirq values
> > > for the non-existent links, potentially overriding existing mappings
> > > in the process. "What could possibly go wrong?"
> >=20
> > Yes, that would've been my fault. It seemed like the right thing to do
> > at the time, but the way you describe it makes it obvious that it was
> > not. I can't say I understand why this would've worked prior to the
> > rework that made this surface, though.
>=20
> Because until these IPI patches, the range 0-7 never ever appeared
> as actual hwirqs in the GIC domain. SGIs were handled in the GIC
> code, behind the core kernel's back. As soon as we start using
> an actual domain mapping for hwirq 0, the PMC driver starts messing
> with it.

Okay, that makes sense.

> > > It turns out that for the 'B' link, the PMC driver uses hwirq 0, which
> > > is SGI0 for the GIC, and used as the rescheduling IPI. Obviously, this
> > > doesn't go very well, nor very far, as the IPI gets routed to random
> > > drivers. Also, as the handling flow has been overridden, this
> > > interrupt never gets deactivated and can't fire anymore. Yes, this is
> > > bad.
> > >=20
> > > The 'A' link is less problematic, but the hwirq value is still out of
> > > the irqdomain range, and gets remapped every time a new 'A'-less
> > > driver comes up.
> > >=20
> > > Instead, let's trim the unused hierarchy levels as needed. This
> > > requires some checks in the upper levels of the hierarchy as we now
> > > have optional levels, but this looks a lot saner than what we
> > > currently have. With this, tegra186 is back booting on -next.
> > >=20
> > > I haven't tested any wake-up stuff, nor any other nvidia system (this
> > > is the only one I have). If people agree to these changes, I can take
> > > them via the irqchip tree so that they make it into the next merge
> > > window.
> >=20
> > Yeah, it sounds like this needs to go in ideally before the rework that
> > caused this to surface in order to preserve bisectibility. But if it
> > goes in afterwards that's probably fine as well.
>=20
> It's easy to take it as part of the same pull request as the IPI
> stuff. Not fully bisectable for this platform, but close enough.
> I may even be able to merge this in *before* the IPI patches
> (I'd need to rebuild irq/irqchip-next, but that won't alter the commit
> ids of the individual patches as they are on separate branches).

I noticed there's a small conflict with another patch that I've queued
up and that I was thinking of sending in for v5.10. This adds a callback
for .irq_retrigger. I don't exactly recall why I needed this, but I've
been carrying that patch locally for a while now. I don't think it's
critical, but there must've been an issue that it fixed. Unfortunately I
seem to have been in a hurry because the commit message is a bit terse.

I can probably just leave that out for now to not further complicated
things, in which case it should be fine to take your patches here into
v5.10 along with the IPI changes. As I already mentioned I'm a bit
unhappy about the needless move of the irq_chip to a global variable,
but I can send out an updated version with those changed back, which is
basically what I have on my local test branch because I had to manually
apply that patch anyway due to the conflict I mentioned above, so
keeping the embedded irq_chip was actually simpler and reduces the diff
a little bit.

> > Let Jon and myself do a bit of testing with this to verify that the wake
> > up paths are still working.
>=20
> Sure. Let me know what you find.

The results are in and it's a bit of a mixed bag. I was able to confirm
that Tegra194 also boots again after this series and I'm also able to
resume from sleep using either rtcwake or the power-key as wakeup
source, so the wake-events mechanism is still functional after the
series. I do see a bit of breakage on resume, but none of that seems
related to your patches and is likely something that crept in while we
were looking into the current issue.

Jon had started a job in our test farm in parallel and that came back
with a failing suspend/resume test on Tegra186 (Jetson TX2), but that
seems to have been a pre-existing issue. This was already in linux-next
around next-20200910 and Jon had been investigating it when the boot
failures due to the IPI changes started happening. So I then hooked up
my Jetson TX2 and verified locally that I can properly suspend/resume
using either rtcwake or the power-key as wakeup source, just like I
previously did on Tegra194 (Jetson AGX Xavier). Tegra186 seems to be a
little more unstable because it didn't boot every time for me, but that
is probably not related to this.

I also did a bit of testing on Tegra210 and that seems to also still
work. We cannot test suspend/resume and therefore wake-events there
out-of-the-box because of some long-standing issue with USB refusing
to suspend, but I was able to at least trigger wake-up using the
RTC by first unloading the XUSB driver. It doesn't resume to a fully
functional system, but if I do see it resume, then the wake-event
code must have worked.

So, I'm tempted to say:

Tested-by: Thierry Reding <treding@nvidia.com>

on the series and then we can pick up the other pieces once everything
is back to at least booting.

Thanks again for tracking this down, and apologies for breaking it in
the first place. Let me know if you want me to send the bike-shedded
version of your patches.

Thierry

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl97P5UACgkQ3SOs138+
s6GevQ//TqQN0Ouy/peL7cKLz+OoIWvo1tvmn2cMDcl/j29G949wrVa2YzknhG0m
qYAcx14UYRx2gQ8GERZItPsRZan+bLmxwpZuaKwCA+ESMx4CDz27BnvyA0pQ0sFA
BfmZ01XViqjY+XiBLyobrZxhFDTUJvM6oVpl3cQ347orWFZl4tGGzR88i1weqNNo
2ammO1x6pIf/3DHlsT/oY6w5Bcdgj+NPaWjT0CGHHNVovhXcRis71IOTmDop11dv
z8khNftNugfrpIIlPGSYQ8YJBfQY3SiRpNA0xpdtVTQD/akHuzgc5U6qXzXdyuXS
Q6KgQI+VlnmIWvOqz27yZWP3L6c+qoPbS7izddcrNkW3NOYGei+o0868RtiB/I8J
uOd7/R3rrUKJ5au2ONFsGSgXPxqLER8gM7BB3PwItcptsGSUbslP9EnLx9RuXGRY
aCBYrWIFL5Xkj6fkCnBsRtAiapGuM5I0Vn6WPwb5XTEhefjoaVovRV1R21QINdYC
Rzfdk8rmG3Ki4OV4bamHZVf5EINwX13SeODucdM+R5G+GIRD9oJvr0cFc7xedwZD
a4trJFZuWhLJGjoCIn4JSr/rr0+d9UO2q//pkRbBHV3tG8U9kDEbQDJaRB2xm45w
TXmsNfrzNINlRvSJyj+N9KnGvxIbArWpDG3RzbZeFmOwHfU+Fbg=
=s+8M
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
