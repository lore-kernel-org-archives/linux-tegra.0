From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpu: host1x: Do not output error message for deferred
 probe
Date: Wed, 5 Jun 2019 10:28:48 +0200
Message-ID: <20190605082848.GB10944@ulmo>
References: <20190604153150.22265-1-thierry.reding@gmail.com>
 <21c2443c-9166-edc0-5d7b-46b9e3c48e70@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1851008855=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <21c2443c-9166-edc0-5d7b-46b9e3c48e70@gmail.com>
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


--===============1851008855==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 07:07:42PM +0300, Dmitry Osipenko wrote:
> 04.06.2019 18:31, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > When deferring probe, avoid logging a confusing error message. While at
> > it, make the error message more informational.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/host1x/dev.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> > index c55e2d634887..5a3f797240d4 100644
> > --- a/drivers/gpu/host1x/dev.c
> > +++ b/drivers/gpu/host1x/dev.c
> > @@ -247,8 +247,11 @@ static int host1x_probe(struct platform_device *pd=
ev)
> > =20
> >  	host->clk =3D devm_clk_get(&pdev->dev, NULL);
> >  	if (IS_ERR(host->clk)) {
> > -		dev_err(&pdev->dev, "failed to get clock\n");
> >  		err =3D PTR_ERR(host->clk);
> > +
> > +		if (err !=3D -EPROBE_DEFER)
> > +			dev_err(&pdev->dev, "failed to get clock: %d\n", err);
> > +
> >  		return err;
> >  	}
>=20
> The clock driver should be available at the time of host1x's probing on
> all Tegra's because it is one of essential core drivers that become
> available early during boot.

That's the currently baked-in assumption. However, there can be any
number of reasons for why the clocks may not show up as early as
expected, as evidenced in the case of Tegra186.

> I guess you're making this change for T186, is it because the BPMP
> driver's probe getting deferred? If yes, won't it be possible to fix the
> defer of the clock driver instead of making such changes in the affected
> drivers?

The reason why this is now happening on Tegra186 is because the BPMP is
bound to an IOMMU to avoid getting faults from the new no-bypass policy
that the ARM SMMU driver is implementing as of v5.2-rc1.

As a result of binding to an IOMMU, the first probe of the BPMP driver
will get deferred, so any driver trying to request a clock after that
and before BPMP gets probed successfully the next time, any clk_get()
calls will fail with -EPROBE_DEFER.

This is a bit unfortunate, but like I said, these kinds of things can
happen, and probe deferral was designed specifically to deal with that
kind of situation so that we wouldn't have to rely on all of these
built-in assumptions that occasionally break.

The driver also already handles deferred probe properly. The only thing
that this patch really changes is to no longer consider -EPROBE_DEFER an
error. It's in fact a pretty common situation in many drivers and should
not warrant a kernel log message.

Thierry

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz3fT0ACgkQ3SOs138+
s6H6CxAAjksm0GKQVJfgP9oa8/awYO5STAzYVXRAv1tkftH7X+7FMqYpjUs9KcZi
UD7m+IThegn9yncbIVfzOY3n6Y6eKizhzJPUv4rksDsoUTVcpecP7SHPk7EMPryn
GkmtCSTMYYXp7euVP1/lLWaD1lyEYj+DqtcE+6lTJdLHLNjG/H8ywAq4nL5m3UaP
1IyzMCzVuvyoaEzqGrYszpkGSXbhdXq2+pv52qMfXYiNnHCeF27Jn7ERCl6VKg0s
kNwabue1nrw2xdcccOMvKsUSuuQ9gfkyiZohVWXZD1wKIt/iKsGto2kcnCMQ+ImK
GKepAc8xogAPqHCbPXasQDPWqhui1JXye9n/MNGA3izHijY/a46Chn4FYt/uXhX8
eRPxDDJT95g0bNYEao+n8bvx4Q5CceYZJ95EmfApo6PAhT3ig/THoXvymPgIY13P
RLIEgM1vqcgxXud7FDeOorwrdOKWZAyAyIkeElhOxeQISs4HMVVw04XOtLKO4MgK
142vVxZKkky3N5CaUuFDrBMcLVutM7C0+fReMJIawlZ+LICKfC6VEhtOJb9zUOkd
j8O0FOVMSpsM/Zo0ySeEfi1z3mD6OxUZfda7LJkO77YCWJTd1ZSWQbMAcARn3iIA
JwR9brfOE271R4XVQgTHjjucOhm1T9q3sBKK7pl+xs70aRGAJZ4=
=C+uG
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--

--===============1851008855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1851008855==--
