From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 3/4] soc/tegra: Initialize interrupt controller from DT
Date: Sat, 28 Jun 2014 03:12:09 +0200
Message-ID: <20140628011208.GA13290@ulmo>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
 <1403888329-24755-3-git-send-email-thierry.reding@gmail.com>
 <53ADDC0C.4060401@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53ADDC0C.4060401-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2014 at 03:03:08PM -0600, Stephen Warren wrote:
> On 06/27/2014 10:58 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Obtains the register ranges for the legacy interrupt controller from DT
> > and provide hard-coded values as fallback.
>=20
> > diff --git a/drivers/soc/tegra/irq.c b/drivers/soc/tegra/irq.c
>=20
> >  void __init tegra_init_irq(void)
>=20
> > -	distbase =3D IO_ADDRESS(TEGRA_ARM_INT_DIST_BASE);
> > +	np =3D of_find_matching_node(NULL, ictlr_matches);
> > +	if (np) {
> > +		for (i =3D 0; i < ARRAY_SIZE(ictlr_regs); i++)
> > +			if (of_address_to_resource(np, i, &res) =3D=3D 0)
> > +				ictlr_regs[i] =3D res;
>=20
> It'd be nice to check that loop ran exactly the number of times expected
> based on the compatible value (i.e. SoC) if the legacy interrupt
> controller node.
>=20
> What about erroring out if entries are missing or can't be parsed.

I've added some strict checking of the expected number of entries. I
decided against erroring out on missing entries or when they can't be
parsed because we can still continue using the fallback entries in the
ictlr_regs table. However if a mismatch between the number of detected
entries and the expected entries is detected, the code will now WARN.

> >  	if (num_ictlrs > ARRAY_SIZE(ictlr_reg_base)) {
> > -		WARN(1, "Too many (%d) interrupt controllers found. Maximum is %d.",
> > +		WARN(1, "Too many (%d) interrupt controllers found. Maximum is %zu.",
> >  			num_ictlrs, ARRAY_SIZE(ictlr_reg_base));
>=20
> While we're changing this, maybe we should change that test to
> "num_ictlrs !=3D the expected value", so too few is found as well.

Done. This is slightly complicated by the fact that the non-DT code has
no notion of how many are expected. The maximum number is only used to
prevent overflows when accessing the ictlr_reg_base array.

I've solved this by selecting the maximum depending on tegra_chip_id. I
have sent a v2 to the list with the patch removed that moves all the
drivers to drivers/soc since more work will be required for that. In the
meantime this change is separate and can be merged independent of that.

Thierry

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTrhZoAAoJEN0jrNd/PrOhSpYP+wVJjq3PAudSZ9FENaH1J4Fi
kK170YYwXxhUq46r5cy5VWasMSanKDy7Hxtk29FQR0U9GotQ9x+Uaqx7TGv9YLcI
U2ZrBPZvzmwYDKEW9XhvgsOBFt70QiIRV/GKdsuiIk7SdTHAzOtYBoeXs0J4pgav
0xFxzt3LlM4HctgRjiHApWS9k2m7BJ42obhgsC7KaVhSHQuwbI+9FF3LSfQsxMvV
6xVhQpjXVeVRs++E/SX15jaDv7QbeIR7q36Kx5uish6gw747mFoz3KEDVq54Qx0e
IcqwoTBQkdrYcCRk7vnt5tTujslJ7JYM4eygBYvqzgBPyMc9BmbqmV+d5gw6Mkpa
yinIBNBk9NklQ+MR46GVn7PzJtzuB3NKIl0VbWxfutl/Ze2av5ZdFPNqzR8VS2dH
cQj0ShUxguHrxCnYTWZ3ySAVUU5iji8Xazn23ENgfTA0TtHHXZ+xYSMXeZO1An2/
sSYXnotc8uagEHfdfyikpq3v+BxsXbmw/2J/eoYZiHAfXALes94WhRvQdYIBIUZF
u9qyv4QYVpralvib0bHrFCCgTeDtZVdBd/TwYJDYPnmllq9KhpmCBUd6pQGGgU6l
E0el0yQ2aBFGaIAIh3YQeEXYiXfr3WAHQAinGi60AGbIhWXfsHa4uwo1nq/GFuVi
954rK8g8y1VGyPY4tB8F
=kl6w
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
