From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/10] ARM: tegra: Add MIPI calibration DT entries for
 Tegra114
Date: Fri, 20 Dec 2013 12:56:13 +0100
Message-ID: <20131220115613.GP27787@ulmo.nvidia.com>
References: <1387468774-14216-1-git-send-email-treding@nvidia.com>
 <1387468774-14216-4-git-send-email-treding@nvidia.com>
 <52B38B14.8080605@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kOdvwer/5gjFgNo6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52B38B14.8080605-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--kOdvwer/5gjFgNo6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2013 at 05:11:00PM -0700, Stephen Warren wrote:
> On 12/19/2013 08:59 AM, Thierry Reding wrote:
> > Add a device node for the MIPI calibration block on Tegra114. There is
> > no need to disable it by default because it only enables the clock while
> > performing calibration and therefore shouldn't be consuming any power
> > when unused.
>=20
> > diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra1=
14.dtsi
>=20
> > +	mipi: mipi {
>=20
> That should be:
>=20
> 	mipi: mipi@700e3000 {
>=20
> I fixed it up for you.

Right. Many of the patches I'm carrying locally predate the unit number
requirement change. I did make a pass to update all, but this must have
slipped through the cracks.

Thanks,
Thierry

--kOdvwer/5gjFgNo6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJStDBdAAoJEN0jrNd/PrOhhRQQAJhhzKuEpZp3qQzOezhKyY4x
DclJ1ByukKZWcB/qHItZBiQwkPPLClIE+CAOjLX2ujjdy9KZocryc0TU3+RngXeV
epxVKiAKKks5htzab1xO0NDMgJ61ByTikCW12Qsd1RFCndoeFowkllOSGEBz8mdi
rs3qiJDzWxwV9NXRQNcEFELcMye5c8M+uGEy9FKyGEHTQEDaHj+56x+JTtCug4gi
V/w8mGaLdVRTcwz8x0M6iB/Pwt3owCcVuLa6uPfLVaJbRqozMvhpIdt3+54txLgD
FH9pbc2ubEoFYO5h982HDyrKV3glzHvvmeXg0mEaavg03aTmZ9PzX2S03Zx3KdE9
IlA5MDdKJyB+d5XPwqkjtqHYtwNGrDV9eq3AEScDhK2XTMuoPaISFu2O8ZLAVMd0
e/SOy4VJD5qWl2Lfc/DrVqwbCqU0mNNimrXRFDpeqH05/KbpgIWmzD8nKxwfpuGj
y6rM5oOhKa9beEKOsnXgrfccvosq0hUuv0vuSFXkiUxORVrFOb09mnOC/aDgg3+M
S7cmBtjl1+9oHPKWMBMk7XjS/908BdCc3RJzJqxnq+CODdF0GtoM2P4bFV19rTac
iAsULgInwoSTtPGU/WpjkPHc+YtC1ciiZ8HAhUNos0tmmUEdf55KjSx/ZfYUiMp8
YPcu532j/L7WmOURxoYh
=Eftt
-----END PGP SIGNATURE-----

--kOdvwer/5gjFgNo6--
