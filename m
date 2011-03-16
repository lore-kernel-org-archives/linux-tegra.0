From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: Move tegra in linux-next merge order
Date: Thu, 17 Mar 2011 09:50:16 +1100
Message-ID: <20110317095016.e0fd4012.sfr@canb.auug.org.au>
References: <AANLkTikoBGKh9DP1q3ujDBg1fH5Azkahy8RpSO=GqzOR@mail.gmail.com>
	<20110317091048.98b63924.sfr@canb.auug.org.au>
	<20110316221522.GF15605@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__17_Mar_2011_09_50_16_+1100_CMeqVl+mwpTkbGDB"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110316221522.GF15605-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Linux Tegra Mailing List <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Ben Dooks (embedded platforms)" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--Signature=_Thu__17_Mar_2011_09_50_16_+1100_CMeqVl+mwpTkbGDB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, 16 Mar 2011 22:15:22 +0000 Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVpmvS+d8x4Xz@public.gmane.org=
cro.com> wrote:
>
> On Thu, Mar 17, 2011 at 09:10:48AM +1100, Stephen Rothwell wrote:
>=20
> > The usual way to do that is for (in this case) the asoc tree to have a
> > branch that contains the commits that the tegra tree depends on and for
> > both trees to merge the branch.   This is much better than (say)
> > cherry-picking the commits into the tegra tree.
>=20
> We'd need to cherry pick the commits into a branch to create the new
> ASoC branch anyway, I can't rebase the tree as it's merged elsewhere.
> The need to use the code in the Tegra tree wasn't flagged until too
> late.

All you would need to do is create a branch (ref) at the last of the
necessary commits in the asoc tree and Colin could pull that.  This means
that Colin will merge a (hopefully not to large) subset of the asoc tree.
Or he could just merge the asoc tree as it is today.  Either way, the
merge commit should contain an explanation.
--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__17_Mar_2011_09_50_16_+1100_CMeqVl+mwpTkbGDB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNgT6oAAoJEDMEi1NhKgbsJOMH/3uIAqJUIm6+9ym1TFFv8fhz
oKDOrB2bAyAygLdsMPvb9X9wC2m3A9C/sbLeZf028Fix/EcL2mmWvzFxSoF9fJ4c
/Hy2D7C9T3EQmhvLaHdXSFG5Q+MxcAQEz4gwik5G3oHObfwRr0zu6SZL/5CS19Ob
j3PhLj0bEFIJvVBVtfS0917qcZEkXNVFmBGW54my6o0oGp6XhV8V4GPoM4rmRuzP
O5/eIWG2LKDE183IsYRnkUJ8lJKgyL/wOJexQtSEgNTIcct7NkkTysUbGdjxIS0t
efx6wxHXLQmAJPyh+mwCXXdflrKKvc+wFYU7RiQ/V57+mnVXMSBBNoJ346Xe4JE=
=mHfS
-----END PGP SIGNATURE-----

--Signature=_Thu__17_Mar_2011_09_50_16_+1100_CMeqVl+mwpTkbGDB--
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
