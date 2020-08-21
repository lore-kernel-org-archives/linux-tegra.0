Return-Path: <SRS0=jf4o=B7=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C957C433DF
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Aug 2020 21:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CABD20724
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Aug 2020 21:39:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Fwf7eOn3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgHUVj2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Aug 2020 17:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbgHUVj1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Aug 2020 17:39:27 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354B5C061573
        for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2020 14:39:27 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d27so2288127qtg.4
        for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2020 14:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n8cbPEm+rd8YlrOsEy0eb1kbHDOvEIYpZOCY+ofhRq4=;
        b=Fwf7eOn3fEiWFS03qBhzFkOyoKJMrFqI/Fh+Ps69/rBiEFTZb4GaJqJez1PcQoV1j6
         R5c4Oq4lv7U1/yUZtAyuHejQYTO8o1mcbvahkc0K44/NpbxpmB129jAhQKSg427sZqNH
         /zCllUw70y0ZmNx5ahH3SI6PC8EzABEZdx2xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n8cbPEm+rd8YlrOsEy0eb1kbHDOvEIYpZOCY+ofhRq4=;
        b=cyLJHaP8eyXm5KUPhA7bP6lgLVNuVmLI8qsXEDce08y2xTLVi1y+Rf/6HVzWFJrdfv
         /PxjkW6jbJuaZ8qyO01zOQ3Zsba7S455Q0IwWxJdZ0xwgdbpj0vh8envZ7DyPVSiiT4K
         X7H3cfl6tL/bus5GV7m0zvaSP4nfsEGve/Rb77u0Auc1n672nKC7n0VH7vnqvRQWJ0SJ
         VMSczOiFzhNdokB+a/9XhQtBc7AleAEMXfJHiuyphL3AfjsA/XPhMTbMFs8iDU4QQd/t
         MjeCNTvmo97Qa9fwI1dgE8T/yN/5XRqvYsRRThEuiQN/0Xnt629zLY71CWOW/7f6YwGW
         KdAg==
X-Gm-Message-State: AOAM531iI/yjRKrxaxz1vSHZKQEK3R0Yd8TrpPF3JEWkO0C/wToqDCcW
        MpvfCAMg7xFXQ6UWXc/dEG1vRQ==
X-Google-Smtp-Source: ABdhPJzdi1j0Roq9CXDY4Y+Qdq027n6UKrLpeYQEYhPvw7WUXSXITMKWWTGYNf4aOr8Cd76iQn0yoA==
X-Received: by 2002:ac8:4248:: with SMTP id r8mr4441132qtm.218.1598045966306;
        Fri, 21 Aug 2020 14:39:26 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-129-173.ec.res.rr.com. [65.184.129.173])
        by smtp.gmail.com with ESMTPSA id l1sm2931379qtp.96.2020.08.21.14.39.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 14:39:25 -0700 (PDT)
Date:   Fri, 21 Aug 2020 17:39:23 -0400
From:   Tom Rini <trini@konsulko.com>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Stephen Warren <swarren@wwwdotorg.org>,
        U-Boot Mailing List <u-boot@lists.denx.de>,
        linux-tegra@vger.kernel.org, Simon Glass <sjg@chromium.org>,
        Dmitry Osipenko <digetx@gmail.com>
Subject: Re: Chainloading U-Boot from Fastboot on Tegra30
Message-ID: <20200821213923.GF20605@bill-the-cat>
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
 <dda406a7-8199-f2ad-b64a-35791aa1033b@wwwdotorg.org>
 <CAMdYzYpkg9SqcJyDMA0rm9kp-1whT2KQ7+YoebwDHCQpZy2hiA@mail.gmail.com>
 <CAMdYzYrm9v6LWrG0PKkepouJyBXUmg7VxNh96bMp03VavYGuXQ@mail.gmail.com>
 <20200821210451.GE20605@bill-the-cat>
 <CAMdYzYpj8jYdbFg3QT5x6-HutmYGLBLS2Xjp6grMtv8_aeq2UA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xIXIZ7RJ+BaZHQ0n"
Content-Disposition: inline
In-Reply-To: <CAMdYzYpj8jYdbFg3QT5x6-HutmYGLBLS2Xjp6grMtv8_aeq2UA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--xIXIZ7RJ+BaZHQ0n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2020 at 05:30:54PM -0400, Peter Geis wrote:
> On Fri, Aug 21, 2020 at 5:04 PM Tom Rini <trini@konsulko.com> wrote:
> >
> > On Fri, Aug 21, 2020 at 04:17:24PM -0400, Peter Geis wrote:
> > > On Mon, Jul 6, 2020 at 3:48 PM Peter Geis <pgwipeout@gmail.com> wrote:
> > > >
> > > > On Mon, Jul 6, 2020 at 1:04 PM Stephen Warren <swarren@wwwdotorg.or=
g> wrote:
> > > > >
> > > > > On 7/3/20 6:32 AM, Peter Geis wrote:
> > > > > > Good Morning,
> > > > > >
> > > > > > I am attempting to expand on the work for chainloading U-Boot o=
n the
> > > > > > nyan-big in order to chainload U-Boot on the Ouya Tegra30 devic=
e from fastboot.
> > > > > > I have so far been unsuccessful at getting any output from U-Bo=
ot
> > > > > > through this method.
> > > > >
> > > > > I assume that fastboot executes the loaded code on the main CPU n=
ot on
> > > > > the boot CPU (AVP). U-Boot SPL on Tegra30 expects to start runnin=
g on
> > > > > the AVP though; you would have to disable SPL to make this all wo=
rk, and
> > > > > perhaps fix U-Boot to work without SPL present. I'm not sure what=
, if
> > > > > any, changes would be required to support that.
> > > > >
> > > > > For background, see:
> > > > > https://http.download.nvidia.com/tegra-public-appnotes/index.html
> > > >
> > > > Apologies for the resend, I realized I didn't reply to the list.
> > > >
> > > > I admit I'm still extremely new to U-Boot, but this is the way I
> > > > understand the boot flow.
> > > > ROM does extremely low level init, then loads U-boot SPL.
> > > > U-Boot SPL does basic init, ram, cpu and required peripherals, then
> > > > loads U-Boot.bin.
> > > > U-Boot.bin is U-Boot proper, with the full interface.
> > > >
> > > > By loading U-Boot.bin as the nyan instructions indicated, I'm
> > > > bypassing the SPL code as if it was already complete.
> > > > The issue I have is I'm not sure what modifications were done to the
> > > > T124 code to allow nyan to do this.
> > > > I've compared the nyan configs to the cardhu configs and I don't see
> > > > anything that sticks out to me.
> > > > I've also dug through the nyan git log and I don't see anything that
> > > > was specifically changed to allow chainloading on T124.
> > > >
> > > > I also am unsure of where fastboot is loading the kernel in order to
> > > > set the text base correctly.
> > >
> > > For anyone interested, I succeeded at chainloading u-boot on the Ouya.
> >
> > Nice work.
> >
> > > The Linux Kernel with low level debugging enabled in the decompressor
> > > will print the load address.
> > >
> > > Jumping to kernel at:4861 ms
> > >
> > > C:0x80A000C0-0x8112BA40->0x8152C700-0x81C58080
> > > Uncompressing Linux...
> > >
> > > So by setting the u-boot text base to 0x80A00000 u-boot now executes,
> > > but it would then immediately silently reboot.
> > > Turns out I needed to define the console in the device-tree, which
> > > isn't defined in the u-boot tegra30-cardhu.dts.
> > > It would then freeze at relocation time, as it was trying to overwrite
> > > the trustzone ram space.
> > > #define CONFIG_PRAM 2048 solves that issue.
> > >
> > > I'd like to know if u-boot can read the reserved-memory device-tree
> > > node and use it instead of CONFIG_PRAM?
> >
> > Honestly, this is what CONFIG_PRAM is for.  We could possibly add
> > something to get this from device-tree, but we might need to do that
> > early enough that it becomes a tricky thing to do.
>=20
> Thank you, that makes sense.
>=20
> >
> > > Otherwise the only issue it seems to have it is does not read the
> > > nvidia proprietary partition table.
> > > Is there a way to force u-boot to read the backup gpt table similar to
> > > the android kernel's method?
> >
> > Some tangential experiments the other day and I saw that U-Boot would
> > read the backup GPT if it's at the expected place.  But that might be
> > only after you do something like "part list mmc 0", so there might in
> > turn be places that we need to be a bit more robust in our checking.
>=20
> Unfortunately running <part list mmc 0> returns "## Unknown partition
> table type 0"
>=20
> This is the result of the gpt guid command:
> Tegra30 (Ouya) # gpt guid mmc 0
> GUID Partition Table Header signature is wrong: 0x1000 !=3D 0x54524150204=
94645
> find_valid_gpt: *** ERROR: Invalid GPT ***
> find_valid_gpt: ***        Using Backup GPT ***
> 00000000-0000-0000-0000-000000000000
> success!
>=20
> The backup GPT is a valid GPT, and linux will pull the partition table
> from it if forced to look there.
> The android kernel handled this by adding "gpt gpt_sector=3D15073279" to
> the command line.

Ah, interesting.  And where is that sector in relation to where the
backup should be?  I'm not sure off-hand how easy it would be to make
backup location easy to run-time configure, but if it's lba - 2 instead
of lba - 1 or something, we could add a build-time "also check.." thing,
if it's a consistent offset, and probably is.  Similarly, we could add
something kinda ugly to allow overriding GPT_PRIMARY_PARTITION_TABLE_LBA
with where that is instead.

Other-otherwise, I know there's patches in progress to support "tegra
partition table" for Linux and doing that for U-Boot could be handy and
fix this problem as well?

--=20
Tom

--xIXIZ7RJ+BaZHQ0n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl9APwAACgkQFHw5/5Y0
tyyhvwv+IWYMqsVAQ8rkpmkFXPUD92e7BzxeMaZZYqrMsO4E8r6UhWf7np0S1dAb
t7OKiSBq0EvAI378jwEVEI+4qp02ov/J6IvXQ8ddXTVVfRJ0IbhT6glj0/7rfoor
LPpTziRevvp1B1inEc0xUza0uXE8ZListZZHk82Tr8WddEPEDmpyhdHfv+4WcTDm
NZZAXdPM8br5BeQuh0jghDnkqLEsxO1LGKhpha9EyLSx8DkyKTAhFD3xLVahxQ1v
HaBojUQwDM3tk/pi8v8PNiLpo4d9oYjbEbtTEYHww5Jis8I5ScX8jhM8xa/Ucyab
l8odCFVbc7ZYLCCqJEC9BODN40F4VS16R8eAVE/wiWiG4TxYLBIFwwIClYWGKlPo
C6XwTPzV4zbVpke5RGYVS8mc5Ojr3t5lRrkI+HF0UbFOg+mIZbbtL0r/G9nHFXJM
pODha/IF+Xt1MFPK5b48aiNdPQSoBxq0i/QzdSpsZmWZRt3GTkBwhElnz5G/HAA6
zVET1KCQ
=ceZI
-----END PGP SIGNATURE-----

--xIXIZ7RJ+BaZHQ0n--
