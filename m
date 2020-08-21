Return-Path: <SRS0=jf4o=B7=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3B6C433DF
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Aug 2020 21:04:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 697CC2076E
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Aug 2020 21:04:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Jz3P0pFH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgHUVE6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Aug 2020 17:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbgHUVE5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Aug 2020 17:04:57 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E38C061573
        for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2020 14:04:57 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id c12so2211766qtn.9
        for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2020 14:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sFejIyYMmwqxb4IKMZP9yV7fOCnLCmHCILHHcvYsqYQ=;
        b=Jz3P0pFHvWWIIkLU+r0ky9Rw0XaunXdnZqZiL3ct/2pq/p2hFwoLGe8KGvnIVtLNzt
         IxcYIFBG+EJeaj2IOnpsGUls7gELF01LXBOS0pwpJRlNeGjwnSRnAgvoBHJp7hI8+8km
         YQ7erUACq59E1soljSd+mFvKZ9eYgcbLfQTjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sFejIyYMmwqxb4IKMZP9yV7fOCnLCmHCILHHcvYsqYQ=;
        b=suX+VHF/9WgEOxE6/QxZN9h3Q2gw6HluZGGpvN6F6lre0lC8NcN190dSK4FwVIk/XM
         XKyEcdPfkt2dsXZoqVpJfPQNhSIFXn+QtA/ScW5IEHcckW8fpobukP7rZ/r+UX+7nnym
         47WO6eTpJ4pPGqSpgfitNp4ufeRJsrQha/gxsByX5XwKpWL1s9dXVB2Pt8WLB31tX5Wh
         mgEiEIcgnXIDKGpIdx2trNTB4ti/7amKG4FmWOaQHnK5gpyQT+7UY685HvlfIuqaY1Fr
         sx3/mYG1/cKZ90/TFxIl3zkdnbvheFTF6PetLQ40i7HqqzgewVNQItZIgDlDFMsANX5u
         P+2Q==
X-Gm-Message-State: AOAM530cwNgaZMId1delTD2N14ysu2x7dON0XKIpDIFFGBtvFbAnfeOI
        xC02dAgGLAPCAVt7V+K+oAwjKw==
X-Google-Smtp-Source: ABdhPJxmJQ+zl1WQtlhEKW32g/V8v9gNlsP3wnmeFXHUDdwUN79RCkAFq2btgSzgXLXJHr8wXLCGkw==
X-Received: by 2002:aed:2ca5:: with SMTP id g34mr4353912qtd.337.1598043896406;
        Fri, 21 Aug 2020 14:04:56 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-129-173.ec.res.rr.com. [65.184.129.173])
        by smtp.gmail.com with ESMTPSA id y3sm3257554qtj.55.2020.08.21.14.04.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 14:04:55 -0700 (PDT)
Date:   Fri, 21 Aug 2020 17:04:51 -0400
From:   Tom Rini <trini@konsulko.com>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Stephen Warren <swarren@wwwdotorg.org>,
        U-Boot Mailing List <u-boot@lists.denx.de>,
        linux-tegra@vger.kernel.org, Simon Glass <sjg@chromium.org>,
        Dmitry Osipenko <digetx@gmail.com>
Subject: Re: Chainloading U-Boot from Fastboot on Tegra30
Message-ID: <20200821210451.GE20605@bill-the-cat>
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
 <dda406a7-8199-f2ad-b64a-35791aa1033b@wwwdotorg.org>
 <CAMdYzYpkg9SqcJyDMA0rm9kp-1whT2KQ7+YoebwDHCQpZy2hiA@mail.gmail.com>
 <CAMdYzYrm9v6LWrG0PKkepouJyBXUmg7VxNh96bMp03VavYGuXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/Ek/IWUXyW6Xe3tX"
Content-Disposition: inline
In-Reply-To: <CAMdYzYrm9v6LWrG0PKkepouJyBXUmg7VxNh96bMp03VavYGuXQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--/Ek/IWUXyW6Xe3tX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2020 at 04:17:24PM -0400, Peter Geis wrote:
> On Mon, Jul 6, 2020 at 3:48 PM Peter Geis <pgwipeout@gmail.com> wrote:
> >
> > On Mon, Jul 6, 2020 at 1:04 PM Stephen Warren <swarren@wwwdotorg.org> w=
rote:
> > >
> > > On 7/3/20 6:32 AM, Peter Geis wrote:
> > > > Good Morning,
> > > >
> > > > I am attempting to expand on the work for chainloading U-Boot on the
> > > > nyan-big in order to chainload U-Boot on the Ouya Tegra30 device fr=
om fastboot.
> > > > I have so far been unsuccessful at getting any output from U-Boot
> > > > through this method.
> > >
> > > I assume that fastboot executes the loaded code on the main CPU not on
> > > the boot CPU (AVP). U-Boot SPL on Tegra30 expects to start running on
> > > the AVP though; you would have to disable SPL to make this all work, =
and
> > > perhaps fix U-Boot to work without SPL present. I'm not sure what, if
> > > any, changes would be required to support that.
> > >
> > > For background, see:
> > > https://http.download.nvidia.com/tegra-public-appnotes/index.html
> >
> > Apologies for the resend, I realized I didn't reply to the list.
> >
> > I admit I'm still extremely new to U-Boot, but this is the way I
> > understand the boot flow.
> > ROM does extremely low level init, then loads U-boot SPL.
> > U-Boot SPL does basic init, ram, cpu and required peripherals, then
> > loads U-Boot.bin.
> > U-Boot.bin is U-Boot proper, with the full interface.
> >
> > By loading U-Boot.bin as the nyan instructions indicated, I'm
> > bypassing the SPL code as if it was already complete.
> > The issue I have is I'm not sure what modifications were done to the
> > T124 code to allow nyan to do this.
> > I've compared the nyan configs to the cardhu configs and I don't see
> > anything that sticks out to me.
> > I've also dug through the nyan git log and I don't see anything that
> > was specifically changed to allow chainloading on T124.
> >
> > I also am unsure of where fastboot is loading the kernel in order to
> > set the text base correctly.
>=20
> For anyone interested, I succeeded at chainloading u-boot on the Ouya.

Nice work.

> The Linux Kernel with low level debugging enabled in the decompressor
> will print the load address.
>=20
> Jumping to kernel at:4861 ms
>=20
> C:0x80A000C0-0x8112BA40->0x8152C700-0x81C58080
> Uncompressing Linux...
>=20
> So by setting the u-boot text base to 0x80A00000 u-boot now executes,
> but it would then immediately silently reboot.
> Turns out I needed to define the console in the device-tree, which
> isn't defined in the u-boot tegra30-cardhu.dts.
> It would then freeze at relocation time, as it was trying to overwrite
> the trustzone ram space.
> #define CONFIG_PRAM 2048 solves that issue.
>=20
> I'd like to know if u-boot can read the reserved-memory device-tree
> node and use it instead of CONFIG_PRAM?

Honestly, this is what CONFIG_PRAM is for.  We could possibly add
something to get this from device-tree, but we might need to do that
early enough that it becomes a tricky thing to do.

> Otherwise the only issue it seems to have it is does not read the
> nvidia proprietary partition table.
> Is there a way to force u-boot to read the backup gpt table similar to
> the android kernel's method?

Some tangential experiments the other day and I saw that U-Boot would
read the backup GPT if it's at the expected place.  But that might be
only after you do something like "part list mmc 0", so there might in
turn be places that we need to be a bit more robust in our checking.

--=20
Tom

--/Ek/IWUXyW6Xe3tX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl9ANvMACgkQFHw5/5Y0
tyyTbQv7BIMyDJ+aFBX9MF5h+wxNJUWYyRqpB3mtChDxagOzWoI74mgnfShwCKUf
Y8CIzYygtK7VfT339Wq+rYA5F1jh51gYHKbHrVjqJzWtSCRtotRW8IhNpp3yUPgI
bSa60uDeBtkxIteyB4TP8hIoVqnVAEbJVPmITyrAADvlxabq7hxZdj9oxo004nMW
OeISyMqw64lArvI+Emozk1ofFzaorg65QYJqV3fbY8ijPmeg1orLmpoDYLXJvvcw
d7E0u0hVIpHiisvAFkrEWgUJFF+BGZkYAExoPpi3fjnxlj8AyxAIIm/yYZr7axkO
RKoYFd0Krbhlr9Z49XLCfUEDW//plNLqMF4zcbq2g+mz8ITLJQpeorNWl1J/S2w0
v4Y5vsweclnxB0mjJv6exiJDCH3VrFq/izTVrZ03HtxAL1EbRzMOdp/vNm7goX6R
boL1SWWZRz/fwS+Rcbaud7s1DJ7M1pu9S9Vr0RhdcPKJYQyHFjA7vGmkIKznCFi1
2dFBeh8p
=1zMF
-----END PGP SIGNATURE-----

--/Ek/IWUXyW6Xe3tX--
