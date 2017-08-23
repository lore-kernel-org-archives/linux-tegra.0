From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: Register SoC device
Date: Wed, 23 Aug 2017 11:11:30 +0200
Message-ID: <20170823091130.GA4157@ulmo>
References: <20170817144217.31346-1-thierry.reding@gmail.com>
 <61dde661-313f-0b51-233b-ce957c514a55@arm.com>
 <20170822111922.GA15965@ulmo>
 <CAK8P3a0XHobGzSzP4w5zCJNZ-v2bmZ8yFPs0PudD9XMETJDJdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a0XHobGzSzP4w5zCJNZ-v2bmZ8yFPs0PudD9XMETJDJdg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2017 at 10:49:36AM +0200, Arnd Bergmann wrote:
> On Tue, Aug 22, 2017 at 1:19 PM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Tue, Aug 22, 2017 at 11:15:21AM +0100, Sudeep Holla wrote:
> >>
> >>
> >> On 17/08/17 15:42, Thierry Reding wrote:
> >> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> >
> >> > Move this code from arch/arm/mach-tegra and make it common among 32-=
bit
> >> > and 64-bit Tegra SoCs. This is slightly complicated by the fact that=
 on
> >> > 32-bit Tegra, the SoC device is used as the parent for all devices t=
hat
> >> > are instantiated from device tree.
> >> >
> >>
> >> This seem to be in linux-next and causing the below splat on my platfo=
rm
> >> which is not Tegra :)
> >>
> >> WARNING: .... at drivers/soc/tegra/fuse/tegra-apbmisc.c:48
> >> tegra_get_chip_id+0x30/0x40
> >> Modules linked in:
> >> CPU: 2 PID: 1 Comm: swapper/0 Not tainted
> >> 4.13.0-rc6-next-20170822-00008-g52a8e57512ae #13
> >> task: ffff8009768a0000 task.stack: ffff000008038000
> >> PC is at tegra_get_chip_id+0x30/0x40
> >> LR is at tegra_get_chip_id+0x30/0x40
> >>  tegra_get_chip_id+0x30/0x40
> >>  tegra_soc_device_register+0x68/0xd0
> >>  tegra_init_soc+0x10/0x44
> >>  do_one_initcall+0x38/0x120
> >>  kernel_init_freeable+0x184/0x224
> >>  kernel_init+0x10/0x100
> >>  ret_from_fork+0x10/0x18
> >
> > Indeed. Does the below patch fix this?
> >
> > Thierry
> >
> > --- >8 ---
> > From 5706cacc2af5e4ef138d1cd9e1269ca4947a447f Mon Sep 17 00:00:00 2001
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Date: Tue, 22 Aug 2017 13:15:18 +0200
> > Subject: [PATCH] soc/tegra: Restrict SoC device registration to Tegra
> >
> > Commit 8a46828e623c ("soc/tegra: Register SoC device") added an initcall
> > to register the SoC device on Tegra. However, that code is unrestricted
> > and will run on all platforms, causing unwanted warnings.
> >
> > Fix this by first checking that we're running on hardware that supports
> > the fuses block that we use to provide SoC information.
> >
> > Fixes: 8a46828e623c ("soc/tegra: Register SoC device")
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> I just found the same thing by inspection after running into
>=20
> drivers/soc/tegra/fuse/fuse-tegra.c:360:0: error: expected ';' at end of =
input
>=20
> Please fix that as well.

Done, though it's strange that I didn't see those errors. Are those
compiler errors or sparse errors?

I'll be sending out both patches right away.

> Lastly, I believe that tegra_init_fuse() has the same bug, it just doesn'=
t lead
> to an Oops, just to a harmless warning message, but please add another
> check there, or combine the two checks in some form.

I don't think that's the case. The of_find_matching_node_and_match()
should catch all non-Tegra cases, and the backward-compatibility
fallback has an extra check on the SoC compatible. See the comment on
lines 295-298.

That code is fairly old and I haven't seen anybody bring up any errors
on non-Tegra platforms for that particular piece.

Thanks,
Thierry

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlmdRsAACgkQ3SOs138+
s6HrSQ//aHPQ/MqyEgtEHt4NxPRYXu0zPzoIHcZVEAfQtgsbRX3ZpR0Se4sKs/td
+Db9CVwtT2QaG6llBz09VaevuSUrA+gU1HnHfEFg4f1amEHlVHNmiy+CSMN3Rwq6
7AUqKesfGGV4hD8fvxbPwq4LhGGs0Z9RESF948FnENWYIOyAkU1F4c3ob2ZtVQcL
eSu1/kYPkoSPsuyKeitNYEl9X0SbH9RAEMrwcJmVmuP8uwrfLiYemFQEnxkEA+2P
EgYgytoj/ObL4pVzTQBoYaBjZdtajvuePWxTWVujIRoehu6aLJli6IwhqZN+Sj6P
PMyfpqQVNrtzG0K8EDveqmptR+1oJhM9DskoUyofvBuqzPGCo7wKvU0266yYhnwc
24uBzPa0hBvNjpbYmbVNpy03UFFT0K0yhBHgYDlpWL8/J8zkQ/UV6U85bgRDEYQL
wKsWGmAgw96/bYOl5Kztq1OejRAX8nPK1nkeG7VQjzHlfXS77ayWzQknOqWgT0bI
bIDkJpwG4tF91t/37zJSJ+gD+3CxdThvgL3qKjaHpvTfSp3hgtADap3strlFgsb3
bbAsw/2Det8CfdKgqx4lhobndbLhwmKWjCJTwWrOulEte9IsJtN8Y76yNbJv/R8K
83Uol9VbFDDtaXS0VMyGF91TSrK1jryoDXjQz908fPftNRwklOo=
=X9D6
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
