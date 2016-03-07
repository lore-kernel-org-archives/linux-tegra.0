From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tegrarcm PATCH v1 2/4] Add option --ml_rcm <rcm_ml_blob>
Date: Mon, 7 Mar 2016 09:54:08 +0100
Message-ID: <20160307085408.GD31189@ulmo.nvidia.com>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
 <1457135087-967-3-git-send-email-jimmzhang@nvidia.com>
 <20160305012506.GA19189@nvidia.com>
 <b47263cc6b5a412bbbb9cd4a17d223cf@HQMAIL103.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d9ADC0YsG2v16Js0"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b47263cc6b5a412bbbb9cd4a17d223cf-wO81nVYWzR7YuxH7O460wFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--d9ADC0YsG2v16Js0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 05, 2016 at 02:35:51AM +0000, Jimmy Zhang wrote:
>=20
>=20
> > -----Original Message-----
> > From: Allen Martin
> > Sent: Friday, March 04, 2016 5:25 PM
> > To: Jimmy Zhang
> > Cc: Stephen Warren; alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org; linux-
> > tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Subject: Re: [tegrarcm PATCH v1 2/4] Add option --ml_rcm <rcm_ml_blob>
> >=20
> > On Fri, Mar 04, 2016 at 03:44:45PM -0800, Jimmy Zhang wrote:
> > > This option along with "--pkc <keyfile>" allows user to generate
> > > signed query version rcm, miniloader rcm and signed bootloader
> > > (flasher). With these signed blob, user will then be able to run
> > > tegrarcm on a fused system without keyfile.
> > >
> > > Command syntax:
> > >  $ ./tegrarcm --ml_rcm <ml_rcm_blob> --pkc <keyfile>
> > >
> > > Example:
> > > 1. connect usb cable to recovery mode usb port 2. put target in
> > > recovery mode 3. run command as below:
> > > $ sudo ./tegrarcm --ml_rcm t124_ml_rcm.bin --pkc rsa_priv.der
> > >
> >=20
> > Why this extra step to write the signed miniloader to a separate file?
> > Why not just sign the miniloader in memory when using the --signed
> > option?  It looks like this is also generating a file for the signed
> > RCM messages, which should just be done in memory as well like we do
> > when using CMAC signing.
> >=20
> This is for production purpose for fused board. User can run this step to=
 generate all signed blobs
> from a secured server. On production server, assuming non secured, user u=
ses previous signed
> blobs to download flasher on fused board. By doing so, we can avoid to se=
nd rsa keyfile to
> production server.

I don't like how this makes people jump through hoops to use this
feature. Couldn't we instead implement infrastructure for both
workflows?

For example, the standard behaviour could be to sign everything in
memory, which would allow developers to use this in the most
straightforward way. A command-line option could be added to switch
into "production" mode, where the necessary files are generated and
later used, which would allow the kind of setup that you describe
where the signing and flashing machines are separate.

Thierry

--d9ADC0YsG2v16Js0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW3UGtAAoJEN0jrNd/PrOhjRUP/Aliym/on6a0cZ9nH+FWbqWQ
2rO07Aqhhu6hqw+8ZKxGDWaSJ+fQN5MU+I5BoRLqOUF6hTBwB+uq5ihD+w4mQGKi
U7Eg+prYO0pCSDEci39uuUt5wmrCLAvinZlxYCrHKWdZlB6Ti0Sm+Tppy/OpHGwA
oS7OCrJnZt55MtwkRxncA/GQfZHMXEt7hPwSSXbw5MzskKyCj9FLYnXkO3gPP+Rw
2T4JBPxYVfGqugDTCRR7HnTg5FWBPkD8y2w6TOuBv2nEhFef5GCyhvaL6C90z6kp
K9V0VPn/2yQl8uLe8jLtlwgjUcgaku+IJy+IwutCa5ZtTHVJQ1Xy1UqCxEMBcn2W
KQgdhrsro0AFYY8AkHVij3CvOWggwzeWqGygBF8gY4KaeD5SdN9MiskPGMUljohR
MZ/1M7oRyFgLxLF+DkvfwrlUW0sZ8TftTxs5ZmlPQSUXpm8IzfxUVqTahB7gUh0w
MJzHuTab0h/8Y3ZH/6fUwOs2i6UTL9FTjMhbUf6Ucj3du5MBcKNx1WU36zb/BBrF
PNlg23frjyr1ghWPibpQ9XvU+kgJP3wHlgbjCMm4I3bkKwDRehwjPPdXR4dmHErC
IXVdOYozdfvHq3MSnIUHoe8t7aiUBMsHJSq7sDCTJQxwKy2I/XS/riVHpeZDsVl4
QdOngPCKdnsita4h/uU4
=09Dg
-----END PGP SIGNATURE-----

--d9ADC0YsG2v16Js0--
