From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Mon, 27 Apr 2020 17:32:44 +0200
Message-ID: <20200427153244.GF3464906@ulmo>
References: <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <20200427084424.GA28817@kunai>
 <820200ce-17f3-18c0-6f79-3e582f45492d@gmail.com>
 <20200427103553.GA24446@kunai>
 <20200427105029.GB3464906@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Y/WcH0a6A93yCHGr"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200427105029.GB3464906@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Y/WcH0a6A93yCHGr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 12:50:29PM +0200, Thierry Reding wrote:
> On Mon, Apr 27, 2020 at 12:35:53PM +0200, Wolfram Sang wrote:
> > On Mon, Apr 27, 2020 at 12:07:19PM +0300, Dmitry Osipenko wrote:
> > > 27.04.2020 11:44, Wolfram Sang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > >=20
> > > >> Wolfram, can you revert the following two patches for v5.7, please?
> > > >>
> > > >> 	8814044fe0fa i2c: tegra: Synchronize DMA before termination
> > >=20
> > > This patch has nothing to do with your trouble, why do you want to
> > > revert it?
> >=20
> > I'll wait some more before pushing out, so you can discuss it.
>=20
> Okay, let me run a quick test with that second patch still applied to
> make sure it really is harmless.

Alright, I tested v5.7-rc3 with this patch reverted:

	a900aeac2537 i2c: tegra: Better handle case where CPU0 is busy for a long =
time

and the results came back positive, so I think we can leave patch:

	8814044fe0fa i2c: tegra: Synchronize DMA before termination

in. But then again, I see that Dmitry posted this yesterday:

	https://lkml.org/lkml/2020/4/26/481

which seems like it would be related to this and potentially be a
follow-up fix for some corner cases? So I'm not sure how well this whole
set has been tested yet.

Maybe a better solution would be for the DMA synchronization patch to go
into the 5.8 queue instead to make sure we get more testing cycles.

Thierry

--Y/WcH0a6A93yCHGr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6m+xoACgkQ3SOs138+
s6E5gQ/+P87EF76Ek/gB3avyIodTtpcN7etsoM8oJNJWlmxgooiyhvZEaK6dBO+n
6bwBtehuMfy3b0KW1AjyMsijY4Tf56/COp2fP2rSEMB0IqCPSygjX4w5qmZCVneo
PiM5xCng+BjIu+P+yDiuDJ0w8DZ9IzCdBHuQsY+JIpFQdFZZ9zGO1bgw+rEytVUV
Z8Hcg4/D3dN6FBRFPOPY3riOmi0HCdT9vvV3BRaqQ3fkVLFfgZ/Ve65quPpS+k0t
ewnd8HUMTaP/KrCPU/85PvBmu6PSZ58qZXwVV+M3v1+x8lhdLPZHGsAMcJXXDP1l
okLYy+aFm6gx3+egIhkKNDbEn//RrrgsE1VqGHVwb8ECwL/kII+/bS1v3j7snz7A
e54Y0Er6D52SR8M+8oOGzSRueT/yuLNpx7h+++t72TGZpcvTGNR5KAp+NuIBeArg
ybEEK/IpaLE7DUXZfqZoe/ujdj7ZMPuEPW/pxq5Xl1+XrKkJe7NyWedfdOxvXOpc
AXqLcqSi8c+aKCx8Zoe/mh2klBRCShyYsBOCDiFklwM3lonSgBVIf4xW1bg1n10c
Fw8jeSylwPg+4/lUH3oiIn48fOJtt6yooKbUvBGJ0qaspVEdvMeTKDgEmzoztCBz
rzXVR3x6cdnAO4yIO3Gq3PxL/FR9rYjbZr0p/SwBlGF3KsqW+KA=
=8yDJ
-----END PGP SIGNATURE-----

--Y/WcH0a6A93yCHGr--
