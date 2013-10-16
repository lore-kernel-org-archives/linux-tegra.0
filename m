From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 13/13] WIP: ARM: tegra: Add Tegra114 powergate support
Date: Wed, 16 Oct 2013 12:51:13 +0200
Message-ID: <20131016105112.GF21963@ulmo.nvidia.com>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
 <1381850883-12722-14-git-send-email-treding@nvidia.com>
 <525DB8B2.2050203@wwwdotorg.org>
 <1381890671.11523.15.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oFbHfjnMgUMsrGjO"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1381890671.11523.15.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--oFbHfjnMgUMsrGjO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2013 at 10:31:11AM +0800, Joseph Lo wrote:
> On Wed, 2013-10-16 at 05:50 +0800, Stephen Warren wrote:
> > On 10/15/2013 09:28 AM, Thierry Reding wrote:
> > > Extend the list of power gates found on Tegra114. Note that there are
> > > now holes in the list, so perhaps a simple array is no longer the best
> > > data structure to represent it. But perhaps this is good enough for n=
ow
> > > and can be cleaned up in a follow up patch?
> >=20
> > Peter should probably comment on this, since I think he's touched the
> > powergate driver the most recently.
> >=20
> > One idea might be to have the powergate IDs be "virtual", with a
> > virtual->HW ID mapping table per SoC. The virtual IDs need not have any
> > gaps. I'm not sure that having gaps is really much of a problem though,
> > except for the debugfs code in powergate.c...
> >=20
> > > diff --git a/include/linux/tegra-powergate.h b/include/linux/tegra-po=
wergate.h
> >=20
> > > +#define TEGRA_POWERGATE_DISA	18
> > > +#define TEGRA_POWERGATE_DISB	19
> >=20
> > s/DIS/DSI/ perhaps?
> >=20
> > > -#define TEGRA_POWERGATE_CPU0	TEGRA_POWERGATE_CPU
> >=20
> > I expect that was added deliberately. Perhaps Peter or Joseph can
> > comment? Admittedly, it's not used right now.
> >=20
> > BTW, while you're fiddling with powergate.c, I note that
> > mach-tegra/pmc.c #defines some TEGRA_POWERGATE_xxx rather than including
> > tegra-powergate.h. Can you fix that?
>=20
> The reason why we didn't keep updated this code and use this driver is
> because we want it to convert to use generic power domain
> infrastructure[1]. Not sure this makes sense to you. (Only PCIe uses
> this powergate driver until now.)

We need it for gr3d as well and so far nobody's worked on the conversion
to the power domain infrastructure as far as I know. So in the meantime
we should still extend this driver to cover whatever functionality we
need. Hopefully any effort we invest now can be reused when moving to
the PM domain framework.

Thierry

--oFbHfjnMgUMsrGjO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXm+gAAoJEN0jrNd/PrOhJgoQAKHTm8jLQk4K+J3hdwn6Axyk
iNEEPwwYqNbFNAPXxofbBzLDm9vTuuWNrGNogSIAqcPnh1NKfWemizG0U14BsaUm
VCF6pl+yGR+Z4ZZRSFidqZKeJOVDlVIhpfQRzG0J5itqcgob5QhGlDJTdVuewJYp
P9ug62gsv4FbsV30ZdNsBDYfURhHjljC/fzheFWO2YasoTv64Bs2YKjM+LPBHxJL
ssjXBLUSWbbZlneeRmMcxBJRyinjdfFvoBFXLKr9CvmGAa+iIFWl1AWdoAEAINNe
ikyXbI5x/J8nspJPqptMPhcogw/Oy9CjNBtB1KKWJI8uHYnLSzwtPlKYPKfRa/CN
OFpM4gyeRZj+/1P8l7QBKS6oNFyKc+9JHCvhgsgkbtfarI4Lk9qeNbiT1c+9HPBB
Xzh3U3urqF0RTKgG8QO3kJ6pQK76+MuC4kfKNNwrdWY5wknpXE3VP7IHY4kFWkC7
SU8Vb54ne6Jaim9r5TJ/T5R84ZOOUSQ/m0nAsrdxR54irUFhNQySrP6gp3UDNSXR
Mf5OmWis7gqC6RjN3qn81y3+GvfS4o8/YAFNKdaJqIzu5bIakVLcNsD+W0+gQN4Q
pq7/ndOz/HR8DGUxVv6vrucnnllyxqzy+UTjAeqHauevTagKPuwqdsicoMUfwzBW
vHFIUWg/CrqWPMjqbuCO
=0NkF
-----END PGP SIGNATURE-----

--oFbHfjnMgUMsrGjO--
