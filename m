From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] drm/tegra: hub: Enable all required clocks
Date: Thu, 29 Nov 2018 17:17:18 +0100
Message-ID: <20181129161718.GA18128@ulmo>
References: <20181128164403.27648-1-thierry.reding@gmail.com>
 <4073bf52-41cd-7886-e7be-300645bd4bdc@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1691185705=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <4073bf52-41cd-7886-e7be-300645bd4bdc@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1691185705==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 29, 2018 at 07:01:52PM +0300, Dmitry Osipenko wrote:
> On 28.11.2018 19:44, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The display architecture on Tegra186 and Tegra194 requires that there be
> > some valid clock on all domains before accessing any display register. A
> > further requirement is that in addition to the host1x, hub, disp and dsc
> > clocks, all the head clocks (pclk0-2 on Tegra186 or pclk0-3 on Tegra194)
> > must also be enabled.
> >=20
> > Implement this logic within the display hub driver to ensure the clocks
> > are always enabled at the right time.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/hub.c | 47 +++++++++++++++++++++++++++++++++++--
> >  drivers/gpu/drm/tegra/hub.h |  3 +++
> >  2 files changed, 48 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> > index 6112d9042979..7e7742877b90 100644
> > --- a/drivers/gpu/drm/tegra/hub.c
> > +++ b/drivers/gpu/drm/tegra/hub.c
> > @@ -742,7 +742,9 @@ static const struct host1x_client_ops tegra_display=
_hub_ops =3D {
> > =20
> >  static int tegra_display_hub_probe(struct platform_device *pdev)
> >  {
> > +	struct device_node *child =3D NULL;
> >  	struct tegra_display_hub *hub;
> > +	struct clk *clk;
> >  	unsigned int i;
> >  	int err;
> > =20
> > @@ -801,6 +803,33 @@ static int tegra_display_hub_probe(struct platform=
_device *pdev)
> >  			return err;
> >  	}
> > =20
> > +	hub->num_heads =3D of_get_child_count(pdev->dev.of_node);
> > +
> > +	hub->clk_heads =3D devm_kcalloc(&pdev->dev, hub->num_heads, sizeof(cl=
k),
> > +				      GFP_KERNEL);
> > +	if (!hub->clk_heads)
> > +		return -ENOMEM;
> > +
> > +	for (i =3D 0; i < hub->num_heads; i++) {
> > +		child =3D of_get_next_child(pdev->dev.of_node, child);
> > +		if (!child) {
> > +			dev_err(&pdev->dev, "failed to find node for head %u\n",
> > +				i);
> > +			return -ENODEV;
> > +		}
> > +
> > +		clk =3D devm_get_clk_from_child(&pdev->dev, child, "dc");
> > +		if (IS_ERR(clk)) {
> > +			dev_err(&pdev->dev, "failed to get clock for head %u\n",
> > +				i);
>=20
> Looks like "of_node_put(child);" missed here.

Indeed, good catch!

> > +			return PTR_ERR(clk);
> > +		}
> > +
> > +		hub->clk_heads[i] =3D clk;
> > +	}
> > +
> > +	of_node_put(child);
> > +
> >  	/* XXX: enable clock across reset? */
> >  	err =3D reset_control_assert(hub->rst);
> >  	if (err < 0)
> > @@ -840,12 +869,16 @@ static int tegra_display_hub_remove(struct platfo=
rm_device *pdev)
> >  static int __maybe_unused tegra_display_hub_suspend(struct device *dev)
> >  {
> >  	struct tegra_display_hub *hub =3D dev_get_drvdata(dev);
> > +	unsigned int i;
> >  	int err;
> > =20
> >  	err =3D reset_control_assert(hub->rst);
> >  	if (err < 0)
> >  		return err;
> > =20
> > +	for (i =3D 0; i < hub->num_heads; i++)
> > +		clk_disable_unprepare(hub->clk_heads[i]);
> > +
> >  	clk_disable_unprepare(hub->clk_hub);
> >  	clk_disable_unprepare(hub->clk_dsc);
> >  	clk_disable_unprepare(hub->clk_disp);
> > @@ -856,6 +889,7 @@ static int __maybe_unused tegra_display_hub_suspend=
(struct device *dev)
> >  static int __maybe_unused tegra_display_hub_resume(struct device *dev)
> >  {
> >  	struct tegra_display_hub *hub =3D dev_get_drvdata(dev);
> > +	unsigned int i;
> >  	int err;
> > =20
> >  	err =3D clk_prepare_enable(hub->clk_disp);
> > @@ -870,13 +904,22 @@ static int __maybe_unused tegra_display_hub_resum=
e(struct device *dev)
> >  	if (err < 0)
> >  		goto disable_dsc;
> > =20
> > +	for (i =3D 0; i < hub->num_heads; i++) {
> > +		err =3D clk_prepare_enable(hub->clk_heads[i]);
> > +		if (err < 0)
> > +			goto disable_heads;
> > +	}
>=20
> What about to use clk_bulk_* API?

Can't do that because we get these clocks from the child nodes, which is
something that we can't do with clk_bulk_*.

What I could do, though, is to call clk_disable_unprepare() in reverse
order to more closely mirror what clk_bulk_* does, which is obviously
the right thing in terms of symmetry.

Thierry

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwAEQoACgkQ3SOs138+
s6EuAxAArpT3XActHjRRm/tRdrAv8eTWXzhQCrK/Gx+9G+4aV/uSI38E6AZKoTIL
I5cCiPg+hOIFH2b2Vog7Vuo7crFbpg9kKUYvcKB5jkTM+zR5lVapqN8W2pJ/D8Ox
Jt+aCFXly8nZAG5qZ4LO373QzJgp30SDqtS86rjQhw5YfSIMDcmYuRjJ/V9OVy7W
bfR0DLlvQrOzSdSHTVVApqXu1/qlvpU6P8NHS1TeIJn0lOvYzBDiBuB4bROQRbUc
667QurEwXTgUbYLkyIcipI0bBMFk6eGdP3tqC0RIKVNv7CoV6qbmPoXZaXYhhIKS
9y/quKrT7Wj1BbDrWW0NsBhxfeU12PefwNdijF5OssZS4yt6zlzOobngGVWEZazk
Tfy50dKZvLNaIIVycCS+X7p/87rh2R9+CO1AndTxXckHTAksBponGtwjLIqQkgzw
6uT0FWrqEJAX4xtR8oMFrJm0wSfnvTKzfAn4DDQp4l4kjd9bLHulTrIyU3eVAqNc
qbyS76W3vbX2rKvRtMpQeSu3hA12d62jl0M3eZvu95YQDyLUKL3+PM2p/J9N98lY
lTUsTQ8yHkFx9gUn0s1Z8MFM5g7dB5Ke6H6MXoynXGxEjtSBhlaI3tUTcqxILy3d
iwTPJsGE+ZGja/9ce25zwvraQ0PHprn4fbC/lz8O9M+zXwZKdxU=
=Ktni
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--

--===============1691185705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1691185705==--
