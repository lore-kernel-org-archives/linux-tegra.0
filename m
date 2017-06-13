From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/22] drm/tegra: dc: Drop the reset asserts to
 workaround a bug
Date: Tue, 13 Jun 2017 17:07:44 +0200
Message-ID: <20170613150744.GE20577@ulmo.fritz.box>
References: <cover.1495498184.git.digetx@gmail.com>
 <35e1ef44da98701b2c507c31ecc0812530303d2d.1495498184.git.digetx@gmail.com>
 <20170613134546.GH16758@ulmo.fritz.box>
 <8d131ad2-5d1a-635e-4a6c-73b69cbf8e72@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AsxXAMtlQ5JHofzM"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8d131ad2-5d1a-635e-4a6c-73b69cbf8e72-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--AsxXAMtlQ5JHofzM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2017 at 05:18:37PM +0300, Dmitry Osipenko wrote:
> On 13.06.2017 16:45, Thierry Reding wrote:
> > On Tue, May 23, 2017 at 03:14:23AM +0300, Dmitry Osipenko wrote:
> >> Commit 33a8eb8 ("Implement runtime PM") introduced HW reset control. It
> >> causes a hang on Tegra20 if both display controllers are utilized (RGB
> >> panel and HDMI). The TRM suggests that each display controller has its=
 own
> >> reset control, apparently it is not correct. Let's remove the interact=
ion
> >> with the resets for now as a workaround.
> >>
> >> Fixes: 33a8eb8d40ee ("drm/tegra: dc: Implement runtime PM")
> >> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  drivers/gpu/drm/tegra/dc.c | 15 ---------------
> >>  1 file changed, 15 deletions(-)
> >=20
> > Do you mind if I parameterize this to restrict omission of the assert
> > and deassert to Tegra20? I'm fairly sure that these resets are important
> > on later chips in order to properly reset the display controllers.
>=20
> I don't mind at all, I can parameterize it in the next rev myself if you =
wish.

Sure, why not.

Thierry

--AsxXAMtlQ5JHofzM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlk//8AACgkQ3SOs138+
s6HBYQ/+L/KpDJiUkLVRKR5neqPu9jfjmKx2a6w4dLCguWJBTHo1ANUT2gGrU7jr
eIQl1xUvicL7EKUEX7njZjOEB7qLaPtCU/ddAiSdgSFOC8DgQ11A1icOLKOZTlab
ECizFZGf8zdNyo8HIoSHC+NWDrxBaZUgS8Xqiyig06ZIg1Rku6bov55+NwI6kX+7
uZ5vHxKot5h7G9GhJ9Cnn6ygTafzgnjl7swYorCfWh1xs8wb+3WWo8K7/H10fLIY
4Ip8xpyu49eNAdSg1+NUeo/iZGXtfUTmTqQ03UHLOL6FOqUqmMW6GDmlZQH2pVpP
0UQyUuuwBKMqBme7MeHUuli25P3YuewnPEGSnMZ5FCzScgiTZbe4S8T0ZnBRoMH1
pRnNNQJUfJosIbbP/938crhmEeeR4oxl5g80n8/8SJ/k35/HjQ8/Cvs2TSzCJ+da
8YvoLJ4SYWRkOTHL21lzD/j9IXiQfKkvA3WgpkaZomke60Igwlr8z/qxjIBv5AXp
1yNXuyMJp7X24CRXwUBiyfbYVcDg44PXgI1NvDuNwb6VtwMJfYALchhb2KUHHG7z
22MSHQEel5d8vXTG58KKusYY0lCv12aLWLKsDnkBDT6im3i9JT2KC6JMVGxLG2bl
CzByBI8NXm9Vcw0xCubTFfbVzbhXGNf8GRZR5GhTjQKc8ExL3NE=
=Xhkh
-----END PGP SIGNATURE-----

--AsxXAMtlQ5JHofzM--
