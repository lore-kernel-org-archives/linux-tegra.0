From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Mon, 27 Apr 2020 16:19:22 +0200
Message-ID: <20200427141922.GD3464906@ulmo>
References: <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427103851.GB24446@kunai>
 <dc2de966-81d6-6ad5-0c51-16dd28ca4165@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lc9FT7cWel8HagAv"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dc2de966-81d6-6ad5-0c51-16dd28ca4165@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Manikanta Maddireddy <mmaddireddy@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--lc9FT7cWel8HagAv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 04:15:21PM +0300, Dmitry Osipenko wrote:
> 27.04.2020 13:38, Wolfram Sang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, Apr 27, 2020 at 12:52:10PM +0300, Dmitry Osipenko wrote:
> >> 27.04.2020 10:48, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> ...
> >>>> Maybe but all these other problems appear to have existed for someti=
me
> >>>> now. We need to fix all, but for the moment we need to figure out wh=
at's
> >>>> best for v5.7.
> >>>
> >>> To me it doesn't sound like we have a good handle on what exactly is
> >>> going on here and we're mostly just poking around.
> >>>
> >>> And even if things weren't working quite properly before, it sounds to
> >>> me like this patch actually made things worse.
> >>
> >> There is a plenty of time to work on the proper fix now. To me it soun=
ds
> >> like you're giving up on fixing the root of the problem, sorry.
> >=20
> > From what I understood, there were (at least) two regressions reported.
> > So, to me, it makes sense to revert the change, so for upstream users
> > everything stays "the same". Of course, this does not mean it should
> > stay like this forever and you guys can work on fixing the root causes.
> > I'll happily apply them for this release when you are confident with the
> > results.
> >=20
>=20
> For now it's a single regression in the PCIe driver and it's actually
> not a regression, but a PCIe driver bug that needs to be fixed. The I2C
> part should be okay.
>=20
> By reverting the I2C patch, we're back to the PCIe bug being papered
> over and I don't like this. Let's just fix the PCIe driver and the
> problem is gone.. it needs to be fixed anyways.

Yes, that bug should be fixed anyway. But that doesn't justify breaking
suspend/resume completely, which *is* a regression.

Look, I'm not saying that we should drop this patch altogether. All I'm
saying is that we should postpone it so that we can: a) get suspend and
resume working again (and by doing so make sure no other suspend/resume
regressions silently creep in, because that always seems to happen when
you're not looking) and b) fix any preexisting issues without possibly
scrambling the result with this perhaps unrelated fix.

So, again, I think the safest road forward is to back this one out for
now, fix whatever this other bug is and once suspend/resume is working
properly again we can revisit this patch based on a known-good baseline.

Thierry

--lc9FT7cWel8HagAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6m6egACgkQ3SOs138+
s6Hmsw//Uzwdybr9wuj6AsAY89t463pL9vAk42ZwhrzZBpXcey07PyykuVPeOksH
dlekmFYutFVttiZne1WWhfyo0q+pWa7OtsmatGZ0zj6Dqa69Jv3lwpwXTwm1dHoC
T+NTx7/h3Gcz4qWY8sZBiikzXwePh5WkZ9n02t5j5xeOBaxPBnvNWsd/1dx3Wry6
aFwOvwEOmCGKTLvx3h+IgGGCXU2Fw9TXWL9PM0RygZD4/ZGmzpsrcI0Kq/qhsEax
ZIqfNYKt7Df/71HBSusjwzUf1Xc4PBHXQXY5DC0XT+lIZxlWcDkeVoH9/hsm+/mn
Y5Z1jHdYtUXvfeVEM7Uygj4r87Qqq9oRyO09vzstZBgMnlfw7ooQUT/MaHcUpMY3
bd66W/9pO6LsBVJ32+GpL3WavNmD7h1EwU4VoSjkHKr5bDl5PWMqDrUB3H72TjK4
567mRx2ZdLJ5G7x76PXH7P8FT9XmbGvFHRtY2J1oV8DTTFUwnA5Z1op9A88tcKIO
+s1kmqFObLC5PIQUx9hCzbprRN2R8p4WemoG3Goe2Cs3ZUcaTbIVUKA0K+xLoJPx
xOcFR0cWOYzabOGW8le54lj5IrCDFtYocozhD/KzYhoW1ZuEN7w+ljR64xIcbB7D
D3/heQd0r+WLZQxYT7sBrpK70bB7DPXXuIScoLR4fmcBUdinTDk=
=3Tty
-----END PGP SIGNATURE-----

--lc9FT7cWel8HagAv--
