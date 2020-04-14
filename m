From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Tue, 14 Apr 2020 17:08:15 +0200
Message-ID: <20200414150815.GM3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <e015e35b-3f82-56e1-2d86-ebc467eb92f7@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9169072578923982654=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <e015e35b-3f82-56e1-2d86-ebc467eb92f7@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============9169072578923982654==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="75WsOQSofUOhcSOp"
Content-Disposition: inline


--75WsOQSofUOhcSOp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 05:25:06PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +static int tegra210_emc_remove(struct platform_device *pdev)
> > +{
> > +	struct tegra210_emc *emc =3D platform_get_drvdata(pdev);
> > +
> > +	debugfs_remove_recursive(emc->debugfs.root);
> > +	tegra210_clk_emc_detach(emc->clk);
>=20
> It's great that you want to make this driver modular, but I don't think
> that it's a good idea to suddenly rip off the EMC clock from the users.
>=20
> It should be better to simply disallow unloading of this driver once
> it's loaded.

That's not what we're doing. The clock is going to stay around and users
will be able to access it. The only thing that the above does is take
away the possibility to change the rate of the EMC clock.

So I think this actually makes this really nice both for testing that
unload/reload works and it also gives users an easy way to disable EMC
frequency scaling by simply blacklisting the module.

Thierry

--75WsOQSofUOhcSOp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V0d4ACgkQ3SOs138+
s6GsWw/+M5/HCC6YVqevVHN5rlOJp1Ymn8G8PfobgyJaQ+IQ5YBian1VcklzBhNx
jqEPh0NaQTMm8Lq30si3Es6lnPugjOhhsYpGP2PVQ8Fpgr33hqoileVYzHYe4uMP
uk7SUYzZMoBAdO936koxzvfVIS86NGqzVciHH7xDQqndF1PoRShxkHA+Fmg7FuwA
BNKrTPyYObiEZD0KO45fHkyWxrBl7lfk6Qm9gMyM5wpp80JHI/gGkmE3kUocMW/w
zYXnGLES5NcrDgBDv1aRAlt8pafa1TrFtZIpADX2Y3q533/TEojbb3f9BtYkLCAP
8cfmAfFdHK9gOo68OGpPFePzFZRYdxEH3xCGOsISgMoE5PRIKpLhVZW1/zlaVGHG
yQUuKR2c/G+qlPgD1vb42B7b7cPmA3DU7KGZn7aUhDTuR8ovDd29Xzzqzvf9Gq52
CKZFYirYrVuNF4Yu81JCQejfoOy3dah1EILZ/H4rwsIZGbNmzNt8uMPJ9/b0UAht
9aCgJJC05SNFFeWT7PYgleJHLLl5zpdStTbZgSHdjyS7az2+hTCU/ZxEFVUbfARp
yMauGoTgjC+Tmlo2i8u/TO91xvVVLx0jnhAT9QETnjYkTZtr1T5h8jh9u2EIguHb
oFtPdGtkf4+73XZxomkd6XA3sThbRwKYCuzJUIupCz+fwe2ByZQ=
=UtAs
-----END PGP SIGNATURE-----

--75WsOQSofUOhcSOp--


--===============9169072578923982654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9169072578923982654==--
