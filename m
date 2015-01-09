From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: pmc: Add Tegra132 support
Date: Fri, 9 Jan 2015 11:12:53 +0100
Message-ID: <20150109101252.GG27845@ulmo>
References: <1420701657-32543-1-git-send-email-thierry.reding@gmail.com>
 <alpine.DEB.2.02.1501082232280.28771@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="doKZ0ri6bHmN2Q5y"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1501082232280.28771-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--doKZ0ri6bHmN2Q5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 08, 2015 at 10:34:35PM +0000, Paul Walmsley wrote:
> On Thu, 8 Jan 2015, Thierry Reding wrote:
>=20
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Tegra132 uses the same GPU as Tegra124 and the same special-case is
> > needed to remove clamps. However Tegra132 has a separate chip ID, so in
> > order to avoid having to extend the list of chip IDs for the special
> > case, add a feature flag to the SoC data.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Reviewed-by: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Nit: not sure I would call it a special-case; to me it's more of an=20
> evolutionary change due to the radically different GPU in T124 & T132.

I reworded the commit message slightly, so it says:

	Tegra132 uses the same GPU as Tegra124 and therefore requires the same
	method to remove clamps. ...

I hope that's less misleading.

Thierry

--doKZ0ri6bHmN2Q5y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUr6mkAAoJEN0jrNd/PrOhthQP/iyfsWgiz7UFx/nFM2QD6Akc
fwIJ9fil0gbS2eQxnuSrM9To6wQOCb/FTq3EHknp0/y5KdhW9H88P02YoyaAC5ld
JMfsp6EPAwyaQs3TEznBWEqtPx2JwTUNa8OZzgLgIxPPQDtCSQtDQyQLJAFDhYgS
ViqZllagaTbhqon8KXBDuepC6mO9HFmjRbSVcL9B7IQanJYvhPg9wCnhX7Z9gm0W
Bmp1woHTdCjgv+niABm0s3GVZgrDszWPIBoPta52DufVQAeoqermojUiVBsjrDgS
1DFuyRGNt+SHrg1J+aMX+tlgRtO7ISMgkCAyPU+Io+HJHKvXpsCWxF40Riofn7TU
VwNe3mgedRSn76N7oPijFM0lzRRbtZ2NaRRmBIKr/Rc0MF9CdOjOs+EuaLCU5/1i
J2EDDfT0fcabkslzmyz6SEeloH68Y4OWLEo19mwCtgG5OqyW1HLfZv/SWQ82SG3O
STXHKMMD9U4+MD6fKrW2Yv8C1mhMIDRIYmJfnA9WNgVonjR9z43SG4TBykVLMHPj
WJkadZG5fmdU7MlBL8djXmytf8auTPFkKdZTLBboppBUT6klRfrsDW9/K0t7u8v+
sL6MeMGNZyoVhe5yeNqBPDxGLvE7a2wRpP1ZHzrIWZQj52kdE733sqkyyA+/NzKa
vCkHeCyMRunw02OsfKQU
=pWYy
-----END PGP SIGNATURE-----

--doKZ0ri6bHmN2Q5y--
