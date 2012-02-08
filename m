From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1 1/2] mfd: tps65910: use regmap for device register
 access.
Date: Wed, 8 Feb 2012 13:58:17 +0000
Message-ID: <20120208135816.GE5943@opensource.wolfsonmicro.com>
References: <1328697985-22504-1-git-send-email-ldewangan@nvidia.com>
 <20120208114120.GF3120@opensource.wolfsonmicro.com>
 <4F32676F.1010305@nvidia.com>
 <20120208130726.GB5943@opensource.wolfsonmicro.com>
 <4F3279D6.4000009@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9l24NVCWtSuIVIod"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F3279D6.4000009-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--9l24NVCWtSuIVIod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 08, 2012 at 07:04:14PM +0530, Laxman Dewangan wrote:
> On Wednesday 08 February 2012 06:37 PM, Mark Brown wrote:

> >Yes, though bulk_write() is tricky as it's *really* unclear what it
> >should take as an argument - should it be raw register size (in which
> >case it's just raw_write()) or should it be ints (in which case it needs
> >to repack the data too)?  I suspect ints but I'm really not convinced
> >there's much use case for this.

>  * @map: Register map to write to
>  * @reg: Initial register to write to
>  * @val: Block of data to be written, laid out for direct transmission to the
>  *       device
>  * @@val_count: Number of registers to write
> int regmap_bulk_write(struct regmap *map, unsigned int reg, void *val,
>                      size_t val_count)

> only support if map->format.parse_val not null like bulk_read.

> It will just do the regamp_raw_write() if all regs are volatile
> otherwise make the unsigned int from the val by function
> map->format.parse_val for separate write for each register.

But that's just raw_write(), there's no benefit to the additional API
call.

--9l24NVCWtSuIVIod
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPMn9yAAoJEBus8iNuMP3d88AQAIkNh+Km3yhg55V5lh+et/ny
IXMCJ9ecYhwPrHFdd5436KnMK8nePB42ILlGJIwNBh7I6QhqCFgBHzkt1v3mvrZV
sTcmyh7/1QIBrKstRJnHczp2Z5P7hgy24v2iUw7Yhyqaym+BRjU5IcRhFLsKLPlX
HT8vuHwPUrSA45bTuN33kw6FzVDjfPX5YOIgpMquEVPDlarlVs0V0unlDC2J+a4E
N1e0Lp/5fFSlih4dbhfltqRwO6sPqYGHC5PZK4Ac2Eqs9gLXaMck1gYm5GiBFqLg
UD8RQcKyjn+LNAnjffFdCoru5TCyL6E/8sL0mqANYf15OGdrEtJFSpFx7AEVEONH
WkSx+Ytp9uSynxJRubC6UY0p7vzr1enNdRRQlOdwYM5GqD6+Fe/UDkBugKOaI3Ye
e+P0QzSmtSPsXOlPhI5rqAoyjDdQmYgB0J6GpzxLb+mJ82yaXe1ZK2kf1BtgwTRV
FthXWpxitQ63odC0J4IeS5ACCtRHO5GlGzk3EupPdtbg1lemysXi4F0ge/N5hGQn
cOcPjhE4jBYHXs5tjjCish4Ib0QfGniijpkMOEMnTb/QrVdTkZfvAN+s1RXUSuoE
sXu4Eyfk18r2FgQO2s2byOufCiwTEAqx1pw13RyymyoIM/KFd/N15KkWXreTRBdg
ErtKS2ugCmXRD1Ie+1Mz
=u4DJ
-----END PGP SIGNATURE-----

--9l24NVCWtSuIVIod--
