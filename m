From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] soc/tegra: refactor soc_is_tegra()
Date: Wed, 21 Nov 2018 15:56:00 +0100
Message-ID: <20181121145600.GA7739@ulmo>
References: <20181121141204.22819-1-tiny.windzz@gmail.com>
 <2d534bbb-7b75-8521-bf88-36b52c918d19@nvidia.com>
 <20181121144320.GA6446@ulmo>
 <CAEExFWswqoObtnjezRf-3u1ssJ04cwDaggg_HLXju72mannZ6w@mail.gmail.com>
 <bb47ae0d-3607-f396-b9e4-77e25777d6c2@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bb47ae0d-3607-f396-b9e4-77e25777d6c2@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Frank Lee <tiny.windzz@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2018 at 02:50:54PM +0000, Jon Hunter wrote:
>=20
> On 21/11/2018 14:47, Frank Lee wrote:
> > On Wed, Nov 21, 2018 at 10:43 PM Thierry Reding
> > <thierry.reding@gmail.com> wrote:
> >>
> >> On Wed, Nov 21, 2018 at 02:34:57PM +0000, Jon Hunter wrote:
> >>>
> >>> On 21/11/2018 14:12, Yangtao Li wrote:
> >>>> of_find_node_by_path() acquires a reference to the node returned by
> >>>> it and that reference needs to be dropped by its caller.soc_is_tegra=
()
> >>>> doesn't do that, so fix it.Call of_machine_is_compatible() to refact=
or
> >>>> soc_is_tegra() whcih automatically manages the reference count.
> >>>>
> >>>> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> >>>> ---
> >>>>  drivers/soc/tegra/common.c | 12 +++++++-----
> >>>>  1 file changed, 7 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
> >>>> index cd8f41351add..0b40700b672a 100644
> >>>> --- a/drivers/soc/tegra/common.c
> >>>> +++ b/drivers/soc/tegra/common.c
> >>>> @@ -22,11 +22,13 @@ static const struct of_device_id tegra_machine_m=
atch[] =3D {
> >>>>
> >>>>  bool soc_is_tegra(void)
> >>>>  {
> >>>> -   struct device_node *root;
> >>>> +   struct of_device_id *match =3D tegra_machine_match;
> >>>>
> >>>> -   root =3D of_find_node_by_path("/");
> >>>> -   if (!root)
> >>>> -           return false;
> >>>> +   while(match->compatible){
> >>>> +           if(of_machine_is_compatible(match->compatible))
> >>>> +                   return true;
> >>>> +           match++;
> >>>> +   }
> >>>>
> >>>> -   return of_match_node(tegra_machine_match, root) !=3D NULL;
> >>>> +   return false;
> >>>>  }
> >>>
> >>> Ugh ... sorry, I thought that of_machine_is_compatible() looped throu=
gh
> >>> the matches. OK, let's stick with your initial fix.
> >>
> >> Actually I prefer this one. Even if it is slightly more verbose, I thi=
nk
> >> it's much clearer what's actually going on. Also this hides all of the
> >> OF node reference counting in a core function, so it's worth the extra
> >> line, in my opinion.
> >>
> >> Thierry
> > Hi Jon=EF=BC=9A
> >=20
> > I like both, how aboout you?
>=20
> Yes fine with me too. However, looks like there is some formatting that
> needs to be fixed up above. Please make sure you run checkpatch.pl on
> your patches. Otherwise ...
>=20
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
>=20
> Thierry, pick up this version if you prefer.

Yeah, I noticed the formatting issues, but I can take care of them while
applying.

Thanks,
Thierry

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv1cf4ACgkQ3SOs138+
s6HURxAAgZLF0ApqMUdW8u+cYt5TdoxFRNBxdnCers9NjotDx930n4C8esF3FtGB
vORNyNEkCwuetSOBV5XaMkd1ZxedFfNPhD835gQD4wyRrqBABtDxn1SZ+M/TzLE3
ZPELjivuvfSKSbp6yDGOrgqdOIzF54WhRaCzgs65QOQp9BMGoAwESDfBsz5l+h3g
kHbYGuhCFrOd4oCzKyxMtsmUMFgkdqeGlzlXhDbb1NuixkeNK1abgUgElRVAliwO
lwYN7suaRwOAcgeZT6kQwykwgUcATJB82g592wvbkAKj13gSgxcpnt6mblFk63ko
cXUK5wIH3FUu0bn+g/c2eJl5zkUSq0B/0Uyqcxne54q6/Bw0s4ds4sQ2MLIwWduT
hSVvXCj6E1Y1iEMNey/Q5sH5Sl5QU3xdAuAqUuooAzP9Y7Q6eOszRBbu6c1dSfbw
NRFLQANtSr9hT05W64TKwHF52O4wIkLM+sHjBCEWS1YA7sLcrjoaErpXlcAkC3mv
g+uWU6vMD54Ipu8VEROROiyZj7AYu9/ndwm8vZtyZyf3/De6CFUGkZ7AVw34ZCNP
jL5VtdqtfO5n6pggkz2YIxmZbU75xg8vNvMGMbW2Xi3jhhkIcsxpYWGhkuTvG0rn
sOmZD1nrgrpC4NJukaWv6EYTdwsPGoT53hJHFw+NYiRHYXsfsoU=
=zobO
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
