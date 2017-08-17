From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH 1/3] sound: ASoC: tegra: Remove
 SoC-specific Kconfig depends and selects
Date: Thu, 17 Aug 2017 22:07:56 +0300
Message-ID: <1502996876.1287.2.camel@paulk.fr>
References: <20170730112220.15525-1-contact@paulk.fr>
 <20170731102309.GE26667@ulmo> <20170817142211.GH6854@ulmo>
 <20170817142639.ixe7pfzpfhwbhz5q@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6989655100755740901=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20170817142639.ixe7pfzpfhwbhz5q@sirena.org.uk>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============6989655100755740901==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-SoSlj/7N600orvPJ/a6m"


--=-SoSlj/7N600orvPJ/a6m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 17 ao=C3=BBt 2017 =C3=A0 15:26 +0100, Mark Brown a =C3=A9crit :
> On Thu, Aug 17, 2017 at 04:22:11PM +0200, Thierry Reding wrote:
>=20
> > do you want to pick this up, or would you rather provide an Acked-by=
=20
> > so
> > that I can take it through the Tegra tree along with the defconfig
> > changes? I can provide a branch with this patch in case we ever need
> > it
> > for conflict resolution.
>=20
> I don't know what this patch is, sorry.  I think I probably deleted
> the
> mail since the subject line indicates it's not for me.
>=20
> Please submit patches using subject lines reflecting the style for the
> subsystem.  This makes it easier for people to identify relevant
> patches.  Look at what existing commits in the area you're changing
> are
> doing and make sure your subject lines visually resemble what they're
> doing.

I have just sent out another version with a subject line that matches
what others have been doing (mainly, dropping the "sound:" prefix).

Cheers,

--=20
Paul Kocialkowski,

developer of free digital technology and hardware support.

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-SoSlj/7N600orvPJ/a6m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlmV6YwACgkQhP3B6o/u
lQxq2xAAifdHbe7SUy5A6C2rYySg21oYD2uy5ebKOU8/oIhqB1FywBCABKxTKVmJ
n/DGd2+xgKAMbtlwML3PDBjHS9OUi/PZ82Eo1EkyLowtLrYNEN921wGYyowgi3Bt
w3BmBaZdW54YFV8kXyXaCJf9Cej3NhSRNxud3spFMcQiIfoXw+G6Oe9YXVBCGUbx
pT0yTbLyqdY/OO35i7fvkbfHilRat7oxfHvL+a/6xRTjdL00FVOaqL7Ghg23Dw3C
pbbXP4JjjAwgARXWPkyNqSfD6bvyFsS9ilMcDmYu2NPympfZkcc1DWsEg1DNqgMp
2bR59j5V9gIScSBJ2wlpzDSEcKeP7UXMLh9bTj5M7wrjdhkhlzqrw+EDvKf+8BoG
wkYOMwKmm6Wa4rAb+5ap5vASy+270rjiFkMxlgp19UvIVlKSQQ7ok1RlGWRAXKHq
Sc5o+2G04oFfj4VMyVL+u702o2DB9B2pnvAsPYpKEyM2G8AVuMYLY2J/3DX7nM4I
uH2YOHpD5Ry5C92h+ZyaCF11fb7LlRREhVHZIPkFIoEUJd+Z8M/EicIHh4SmuBuq
deBwcAksxGSrTj8zSwyhPD7d0Fu3Cy+fQS3sKrcPJl/jMTpPGp+YI5pwYeIZTWZS
VRX4eZQippGuE3qfV5BC/poFXu7EMcETbWezW9ZaaR5N0keSMFU=
=ybiH
-----END PGP SIGNATURE-----

--=-SoSlj/7N600orvPJ/a6m--


--===============6989655100755740901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6989655100755740901==--
