From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH 3/4] ARM: tegra: nyan-big: Include compatible revisions
 for proper detection
Date: Wed, 21 Sep 2016 11:31:47 +0200
Message-ID: <1474450307.1239.23.camel@paulk.fr>
References: <20160828173246.32621-1-contact@paulk.fr>
         <20160828173246.32621-3-contact@paulk.fr>
         <a9485a88-55a5-9dd1-1a1b-a6c0a78ff476@nvidia.com>
         <1474394004.1215.2.camel@paulk.fr>
         <d05b8e5a-adf7-9057-b42a-0da1fde84953@nvidia.com>
         <1474394544.1215.13.camel@paulk.fr>
         <6501341f-e14c-4876-dcb7-60a33b7621c4@nvidia.com>
         <1474443809.1239.4.camel@paulk.fr>
         <5461eb20-9372-7fa1-0e48-3d0143393b8c@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-sD5karDeo4Z8mefpD3Lb"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5461eb20-9372-7fa1-0e48-3d0143393b8c@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--=-sD5karDeo4Z8mefpD3Lb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resending with the right CC chain.

Le mercredi 21 septembre 2016 =C3=A0 10:15 +0100, Jon Hunter a =C3=A9crit=
=C2=A0:
>=20
> On 21/09/16 08:43, Paul Kocialkowski wrote:
>=20
> ...
>=20
> > > > > > > > Depthcharge (the payload used with cros devices) will attem=
pt to
> > > > > > > > detect
> > > > > > > > boards using their revision. This includes all the known
> > > > > > > > revisions
> > > > > > > > for
> > > > > > > > the nyan-big board so that the dtb can be selected preferab=
ly.
> > > > > > >=20
> > > > > > > May be I am missing something here, but for the mainline ther=
e is
> > > > > > > only
> > > > > > > one dtb available and so why is this needed for the mainline?
> > > > > >=20
> > > > > > There is indeed a single dts in mainline, but depthcharge will =
use
> > > > > > the
> > > > > > revision
> > > > > > to match the compatible string (e.g. it will look for google,ny=
an-
> > > > > > big-
> > > > > > rev5,
> > > > > > not
> > > > > > google,nyan-big), so we need to list them all in that single dt=
s.
> > > > > > Otherwise,
> > > > > > depthcharge will fall back to the default config, which may or =
may
> > > > > > not
> > > > > > be
> > > > > > suitable for nyan.
> > > > >=20
> > > > > Is tegra124-nyan-big.dtb not the default?
> > > >=20
> > > > You can't expect that to always be the case. The image format allow=
s
> > > > many
> > > > different dts to be provided, so I could easily build with
> > > > multi_v7_defconfig
> > > > and have various dts for various devices in the same image, and jus=
t
> > > > select
> > > > a
> > > > random one as default.
> > >=20
> > > Really? Sounds odd. I was hoping that tegra124-nyan-big.dtb would be =
a
> > > catch all.
>=20
> I meant I was hoping that compatible =3D "google,nyan-big" would be the
> catchall not the dtb file name ;-)

Yeah, I figured :)

>=20
> >=20
> > Yes, the image format (FIT) allows specifying multiple dtb and zImage
> > combinations in the same image[0].
>=20
> Yes I am aware of that. Typically, I have been testing using a FIT image
> with single zImage and dtb. Hence no problems.
>=20
> So are you wanting to create a FIT image to support multiple boards and
> use the single FIT image for all? If so then I can see why you want
> this. Again please describe the motivation for the changes in the
> changelog so it is clear why we are adding this.

Fair enough, will do in v2.

--=20
Paul Kocialkowski, developer of low-level free software for embedded device=
s

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-sD5karDeo4Z8mefpD3Lb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJX4lODAAoJEIT9weqP7pUMp30QAIKGqWWbIYQGJEnOKzXnUmuU
gD97/oAiFlc8k9oLNOemnrLN3b6GsUQS3QVhLu+LQcbL5gx1IbdDPgryh8iRn/y6
YK7nfspp5PTMAbnZwXbkQWUYuwa25kgFfy7CJFNrSxWAH+iRUxrlPDQSYYPbnG1D
W/Gg9dQBXsXycsx0UMNGzLtPxYxFz2j+ywf6ZI3bi1fOugdN2OG4Z5jBEi8qxFAV
d0TQNfnVyyfJIPBML9n3gkyK98mk0b/URRdhvwAPJuygyaykH80GWTbmk4J+DYhM
YOZ+/uxN50gRSmoVrl2j0p/5mNvrSmu5hnv41jKIBRJzTtLZ7v3uV7EXeT+b7one
JVKnJ06JjzJWWjVdQezXOxL3MzqrbbLdUOUnRO+ta+0cvwJE4s6pmjQgpjl4Rej5
3m2VwvQTTAl4uEbfBjzudhQN4INVT1Pty5r5dTYMSpEWYsZf7le40YEEnyGXosJz
+qbsQIoa3sgwCYegWvx7XN+dwW7ZSGSg9kXV2+kr8lt8gPrFP502voexH0NguIQ1
iEt4N45NV1tszgzySDFjqCoRLr8muZFl9S9cqJgSVFV+zwqBT6ARaDN0TKwUrndn
uSesr7mEhJoGqitLbB78zoqMNzt46osGUgd81Rc9/4AdG4Ob4b/7XrUv7fgez+yV
2Nak1a2Rr9gFC1liKTXk
=PqxB
-----END PGP SIGNATURE-----

--=-sD5karDeo4Z8mefpD3Lb--
