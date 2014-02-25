From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 5/5] drm/tegra: Add eDP support
Date: Tue, 25 Feb 2014 09:00:17 +0100
Message-ID: <20140225080016.GA4561@ulmo.nvidia.com>
References: <1390332263-11974-1-git-send-email-treding@nvidia.com>
 <1390332263-11974-6-git-send-email-treding@nvidia.com>
 <52E0349F.2050607@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52E0349F.2050607-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 02:14:07PM -0700, Stephen Warren wrote:
> On 01/21/2014 12:24 PM, Thierry Reding wrote:
[...]
> > +static void tegra_dpaux_write_fifo(struct tegra_dpaux *dpaux, const u8=
 *buffer,
>=20
> Is that anything like writesl(); similar for
> tegra_dpaux_read_fifo()/readsl()?

I never got around to replying to this: the interface to the DPAUX FIFO
isn't a single register that uses non-incrementing writes, but rather a
set of five registers that map the entire FIFO linearly. So it can't be
written to with writesl() or read from with readsl().

The function names are slightly confusing in this regard. But the write
destination is still a FIFO, hence this choice of name.

Thierry

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTDE2QAAoJEN0jrNd/PrOhrwAP/1Aa3Rp53IMGssDLsvpFModm
eESS+vpUkj+GyKfnliOAjjvx9e6XhH/kVsI8dJxiZIGkNeO6QD8QMJsAluuQrj6z
jQUeetKFbu0B7gv++1FlBOxoni3dofZC1fHAdH52d6Ck0w6rHZclqxsTRbhqoRKC
4MRYBKusPaNyralu76nCRR7zDyjpZP0o4J5o3qCTW3D998I6VOHnQCBZKsRjd6wO
WQ/JQIBrbcc6CZj3h2d1WtP+fkRK5ru2ggjN5xtKTae2teDAwinA76Zzge15BLAk
oLFwGCXrsyqMG1exFGDInvmxg/7ncLJLf/Mjr8OpHMA5R+7wpC/QYRrtrIBPoze8
93DI+u6Iv+Bia634Q/NHNKqHndT9hlvgyTTUJjfiMGhYA6/sKhjCWc+u8UkMvPIj
nvsMV80DEbgqinWBUrCq0/w/2QLJYtPkuTemMgpPgWqtVEReE0ktLdNcn5emQT/o
XNLy2V3npP24Wbp+Aw1HVQTwez2jbxOMEbLtW5sNf3JyDHtBKP78hQD8Kgr6BS06
L9SzUMhfJfI1OCGzdxB3IYreIIJ1JiEzzRyr0wMRPTZL0s5S9yCdNht/PJ57/0LO
QG86gEbSP6cyenbz0LyNGd9YZdlDyAi3hRv8keR4nhPbjqN1h+WP4/iKRCbCaa1z
9FrCarZSWeuW0wHtl2dl
=SqiY
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
