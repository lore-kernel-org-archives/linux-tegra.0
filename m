From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpu: host1x: Do not output error message for deferred
 probe
Date: Wed, 5 Jun 2019 14:32:26 +0200
Message-ID: <20190605123226.GA724@ulmo>
References: <20190604153150.22265-1-thierry.reding@gmail.com>
 <21c2443c-9166-edc0-5d7b-46b9e3c48e70@gmail.com>
 <20190605082848.GB10944@ulmo>
 <1654b4cb-930c-dbc7-b40d-1f854ff2ac69@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1676642646=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1654b4cb-930c-dbc7-b40d-1f854ff2ac69@gmail.com>
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


--===============1676642646==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 02:25:43PM +0300, Dmitry Osipenko wrote:
> 05.06.2019 11:28, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Jun 04, 2019 at 07:07:42PM +0300, Dmitry Osipenko wrote:
> >> 04.06.2019 18:31, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> When deferring probe, avoid logging a confusing error message. While =
at
> >>> it, make the error message more informational.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>  drivers/gpu/host1x/dev.c | 5 ++++-
> >>>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> >>> index c55e2d634887..5a3f797240d4 100644
> >>> --- a/drivers/gpu/host1x/dev.c
> >>> +++ b/drivers/gpu/host1x/dev.c
> >>> @@ -247,8 +247,11 @@ static int host1x_probe(struct platform_device *=
pdev)
> >>> =20
> >>>  	host->clk =3D devm_clk_get(&pdev->dev, NULL);
> >>>  	if (IS_ERR(host->clk)) {
> >>> -		dev_err(&pdev->dev, "failed to get clock\n");
> >>>  		err =3D PTR_ERR(host->clk);
> >>> +
> >>> +		if (err !=3D -EPROBE_DEFER)
> >>> +			dev_err(&pdev->dev, "failed to get clock: %d\n", err);
> >>> +
> >>>  		return err;
> >>>  	}
> >>
> >> The clock driver should be available at the time of host1x's probing on
> >> all Tegra's because it is one of essential core drivers that become
> >> available early during boot.
> >=20
> > That's the currently baked-in assumption. However, there can be any
> > number of reasons for why the clocks may not show up as early as
> > expected, as evidenced in the case of Tegra186.
> >=20
> >> I guess you're making this change for T186, is it because the BPMP
> >> driver's probe getting deferred? If yes, won't it be possible to fix t=
he
> >> defer of the clock driver instead of making such changes in the affect=
ed
> >> drivers?
> >=20
> > The reason why this is now happening on Tegra186 is because the BPMP is
> > bound to an IOMMU to avoid getting faults from the new no-bypass policy
> > that the ARM SMMU driver is implementing as of v5.2-rc1.
> >=20
> > As a result of binding to an IOMMU, the first probe of the BPMP driver
> > will get deferred, so any driver trying to request a clock after that
> > and before BPMP gets probed successfully the next time, any clk_get()
> > calls will fail with -EPROBE_DEFER.
> >=20
> > This is a bit unfortunate, but like I said, these kinds of things can
> > happen, and probe deferral was designed specifically to deal with that
> > kind of situation so that we wouldn't have to rely on all of these
> > built-in assumptions that occasionally break.
> >=20
> > The driver also already handles deferred probe properly. The only thing
> > that this patch really changes is to no longer consider -EPROBE_DEFER an
> > error. It's in fact a pretty common situation in many drivers and should
> > not warrant a kernel log message.
>=20
> You're trying to mask symptoms instead of curing the decease and it looks
> like the decease could be cured.

There's nothing here to cure. -EPROBE_DEFER was designed specifically to
avoid having to play these kinds of games with initcall levels.

What this patch tries to do is just to avoid printing an error message
for something that is not an error. -EPROBE_DEFER is totally expected to
happen, it's normal, it's not something that we should bother users with
because things end up sorting themselves out in the end.

> Won't something like this work for you?

I'm sure we could find a number of ways to fix this. But there's no need
to fix this because it's not broken. What is broken is that we output an
error message when this happens and make an elephant out of a fly.

Thierry

> From fbeabba5f1151e96edc38620db67593585558ca0 Mon Sep 17 00:00:00 2001
> From: Dmitry Osipenko <digetx@gmail.com>
> Date: Wed, 5 Jun 2019 14:02:00 +0300
> Subject: [PATCH 1/2] iommu/arm-smmu: Move driver registration to subsys l=
evel
>=20
> On some platforms there is a dependency on the IOMMU availability that
> comes up early during of the boot process. One example is NVIDIA Tegra186
> which uses firmware, called BPMP, which manages lots of core functions
> like system clocks for example. That firmware driver require IOMMU
> functionality and hence the driver's probing is getting deferred because
> the ARM's SMMU driver is probed later, thus all the drivers that depend
> on the BPMP availability are also getting deferred on Tegra186. Let's move
> SMMU driver's registration to an earlier boot stage, allowing drivers like
> BPMP to probe successfully without the defer.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/iommu/arm-smmu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 5e54cc0a28b3..08919f2fdf04 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -2410,4 +2410,9 @@ static struct platform_driver arm_smmu_driver =3D {
>  	.probe	=3D arm_smmu_device_probe,
>  	.shutdown =3D arm_smmu_device_shutdown,
>  };
> -builtin_platform_driver(arm_smmu_driver);
> +
> +static int __init arm_smmu_init(void)
> +{
> +	return platform_driver_register(&arm_smmu_driver);
> +}
> +subsys_initcall(arm_smmu_init);
> --=20
> 2.21.0
>=20
> From 12ec90e22405b6d5574cbfcbd33b92736ad6bfe4 Mon Sep 17 00:00:00 2001
> From: Dmitry Osipenko <digetx@gmail.com>
> Date: Wed, 5 Jun 2019 14:13:15 +0300
> Subject: [PATCH 2/2] firmware/tegra: Move driver registration to subsys-s=
ync
>  level
>=20
> The BPMP driver depends on the ARM SMMU driver which is now getting
> probed from the subsys level, hence let's move the BPMP's probing to
> the subsys-sync level in order to avoid probe deferring of the BPMP's
> driver.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/firmware/tegra/bpmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> index dd775e8ba5a0..3f649e12f9f6 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -883,4 +883,4 @@ static int __init tegra_bpmp_init(void)
>  {
>  	return platform_driver_register(&tegra_bpmp_driver);
>  }
> -core_initcall(tegra_bpmp_init);
> +subsys_initcall_sync(tegra_bpmp_init);
> --=20
> 2.21.0
>=20
>=20

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz3tlcACgkQ3SOs138+
s6HoIg//TpvVX6jsZE4AVoQy09MOZMZkG2ANwQRMkNqg+b37kOSWIRhZ+/T775bn
8U2DkT9rhKQTE45nf7pvpVhVEw4eGkb4PmBtjYlN21KGmtuKSmdl8wAiyg8XqJsf
QthU+ONiDOQhmHtmtPi0sRrdvPfscod7c+k4oyWhxrE8Nz7I7bjDyBtiU1a4GPwM
9liEUV87ueiU/UA1EaDmRLYzA3Lx6Pn+XIeRdKjeHJ8pBM4Q160qfkGBfn3rX0jM
GfCj7OzM1p3ylh1dMpgMthfetiVSxTKogyYhhmDJYhDgPROXabQUSMwbB1ex+sUH
JSmqE9N89tFx/cwaF8o+6PZ1Hfn5XSBuoe4hVvUGu4xjyVCJiizHKyG9E+JVED5E
sGxmFdDPo3/oQpbROwdJfQlyxAjqb/2ct8VXdfJiSm+U3MQ5C/yd4519jTHeG4Hi
dayOayost6++cTVXgc5SJDJ19IHNUclH8DHP8iYhqdZhG1xz6NsK4ZyIfdeZ7SY7
XbnOOtNtiSbm2Zjc70ok3rev0Z9WoIPNVCxLiFroyrIXbjNerGdfvHgBsEqAUmJi
9cEYSCyqntXEo9ay8C2q7a2UVXrYqsatTBHR6kbh3/AsnHNUnwVPnN8kjG7HsJLA
vU3vL/uaSs+H7AzfJpTKopH40Lv/IwLqnnkK7NldGKDf5Bc56x4=
=JIcB
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--

--===============1676642646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1676642646==--
