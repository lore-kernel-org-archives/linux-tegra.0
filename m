From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] soc/tegra: pmc: Avoid crash for non-wake IRQs
Date: Fri, 31 May 2019 12:28:58 +0200
Message-ID: <20190531102858.GA21355@ulmo>
References: <20190529102654.14665-1-thierry.reding@gmail.com>
 <20190529102654.14665-2-thierry.reding@gmail.com>
 <27ffbfe6-1c88-63a1-aee1-7fe6ce252e54@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1472630103226839781=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <27ffbfe6-1c88-63a1-aee1-7fe6ce252e54@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-arm-kernel@lists.infradead.org, Bitan Biswas <bbiswas@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============1472630103226839781==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2019 at 10:32:40AM +0100, Jon Hunter wrote:
>=20
>=20
> On 29/05/2019 11:26, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > For interrupts that are not wakeup sources but that may end up getting
> > mapped through the PMC as interrupt parent (this can happen for GPIOs),
> > return early in order to avoid a subsequent crash from an out-of-bounds
> > access to the register region.
>=20
> Maybe worth clarifying here what you mean by 'not wakeup sources'
> because the Tegra GPIO driver does have a set_wake() API to enable
> wakeup at the LIC IIRC. So maybe GPIOs that are not wakeup sources for
> what level of suspend?

Wakeup sources in the context of PMC is always LP0 wakeup sources. At
that point I don't think LIC is enabled anymore. So LIC is to wake up
=66rom LP1 (and perhaps LP2), while PMC wakeup sources need to be
configured in order to wake up from LP0.

Adding Peter to confirm, I think he's more familiar with the power
states on earlier chips than I am.

Thierry

>=20
> > Reported-by: Bitan Biswas <bbiswas@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/soc/tegra/pmc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> > index 653fe2c466f6..6e66b5e293be 100644
> > --- a/drivers/soc/tegra/pmc.c
> > +++ b/drivers/soc/tegra/pmc.c
> > @@ -1924,6 +1924,9 @@ static int tegra_pmc_irq_set_wake(struct irq_data=
 *data, unsigned int on)
> >  	unsigned int offset, bit;
> >  	u32 value;
> > =20
> > +	if (WARN_ON(data->hwirq =3D=3D ULONG_MAX))
> > +		return 0;
> > +
> >  	offset =3D data->hwirq / 32;
> >  	bit =3D data->hwirq % 32;
>=20
> Otherwise ...
>=20
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
>=20
> Cheers
> Jon
>=20
>=20
> --=20
> nvpublic

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzxAecACgkQ3SOs138+
s6FFaxAAr4aaLWFmkpEiABQ0zu4tN5TmLuUUgZ9pYuwjTMW0yzcIYx5gB+Y6XlOP
1WEmbHUwx81+e6C5hEmhRigPbBj1AZcA9QZzSUS6WrwAVl5a+10Qb85ESl4x2yIS
jLotoprmcHyachwpD+zfn2P7xyAIgvntTyrN1rYbBZzebGwGdXNv5kgqdAjFrEs+
GNVGVS1Pk6NOWX3Vh4SrvSp59q5QG41ZPdBabRZfZVrF9jG+9imIm1Thtz/RU3rk
4AC2p5LpQi3ErQ6JSNlAfNToDAw98q1CK+MerhmgAytjpbHRSK7F5fqJpNwWFhEt
0MGEemqz9dvEJe9iDnc1kE2j2zmyG/qB5XLU8tzLGyZWybqF2nsgOIDVrcRan/Ag
/lYvza2oquo8/VP5iVyMw9JzjYUp+tMbMBv0hc5fzwU5PFYKIlJYUwC35oQgdyLd
RVDcm8TZYZiu42fIb1Pl1b8E5Vki/vyF9B7NN6TAfV6Odp56WHo7OJb8oL1kxt4u
BC447KHwr/Uk3/9kcHCjIIf10dVZp9nDp8Zp/5k4P32nMxhCPkNmKhb9I5Lm6z07
DivFYgbK56pFlcB8pMfE0fjHRmSgaxafCenrhioANV2sHQiR1pb6H7oYV81Xeybt
cTq95XTe+SrThiOwdK0B9b4VXqPW+UHawqnJ0dhvbaKuDqKKumA=
=kCdx
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--


--===============1472630103226839781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1472630103226839781==--
