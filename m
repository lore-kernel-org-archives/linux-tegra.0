From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 3/4] i2c: tegra: Add DMA Support
Date: Sat, 26 Jan 2019 00:10:41 +0100
Message-ID: <20190125231040.GA2013@mithrandir>
References: <1548363113-25969-1-git-send-email-skomatineni@nvidia.com>
 <1548363113-25969-3-git-send-email-skomatineni@nvidia.com>
 <dcc1e094-638e-5b04-7a61-bdbc24ee068f@gmail.com>
 <BYAPR12MB339829FC6F2F95F833FE45A1C29B0@BYAPR12MB3398.namprd12.prod.outlook.com>
 <ad177c2e-3801-ddad-b359-ac83530ee1d6@gmail.com>
 <BYAPR12MB33982ED3A9EC34819D2490F8C29B0@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BYAPR12MB33982ED3A9EC34819D2490F8C29B0@BYAPR12MB3398.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 09:11:54PM +0000, Sowjanya Komatineni wrote:
>=20
>=20
> > >>> +	if (i2c_dev->has_dma) {
> > >>> +		ret =3D tegra_i2c_init_dma_param(i2c_dev, true);
> > >>> +		if (ret =3D=3D -EPROBE_DEFER)
> > >>> +			goto disable_div_clk;
> > >>> +		ret =3D tegra_i2c_init_dma_param(i2c_dev, false);
> > >>> +		if (ret =3D=3D -EPROBE_DEFER)
> > >>> +			goto disable_div_clk;
> > >>
> > >> So tegra_i2c_init_dma_param() could fail, printing a error
> > >> message, and probe will succeed? If allocation fails during the
> > >> driver's probe, then just fail the probe. Please give the
> > >> rationale.
> > >=20
> > > If APB DMA probe doesn=E2=80=99t happen prior to tegra i2c, DMA is not
> > > available by the time tegra_init_dma_param tries to request slave
> > > channel and in those cases dma_request_slave_channel_reason will
> > > return EPROBE_DEFER for tegra I2C probe to retry
> > >=20
> > > In case if DMA is available but DMA buffer allocation fails, then
> > > tegra_i2c_init_dma_param returns ENOMEM and probe also fails
> > > returning same ENOMEM
> >
> > Is that what you're going to change in the next version? Your
> > current variant of the code doesn't fail the probe on ENOMEM and
> > there is duplicated attempt to invoke tegra_i2c_init_dma_param()
> > during the transfer.
>=20
> Sorry correction to my previous reply.  If DMA buffer allocation
> fails, tegra_i2c_init_dma_param returns ENOMEM but probe will succeed
> as i2c transaction need to happen during  boot for some platform
> device programming for successful boot and they use PIO mode as xfer
> bytes is less and deferring i2c probe for ENOMEM causes boot to fail
> so during probe EPROBE_DEFER is only taken care.
>=20
> Re-attempt of tegra_i2c_init_dma_param in xfer happens only if no
> successful DMA channel allocation happens prior to that ( during probe
> in case of ENOMEM).
> DMA mode is mainly for large transfer, and i2c xfer returning failure
> due to failing DMA buffer allocation causes boot to hang as platform
> device programming need to happen which doesn=E2=80=99t need to use DMA.
> Will fix this and will send updated patch to reattempt DMA request and
> buffer allocation during DMA mode transfer and will return fail for
> DMA mode I2C transfer...

I'm wondering if we shouldn't gracefully to PIO if we fail to allocate
DMA buffers. Even if it is unlikely that large transfers (> than the
threshold that activates the DMA paths) will be needed by critical I2C
clients, there's really no reason why we can't do PIO if DMA doesn't
work for some reason.

Thierry

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxLl2cACgkQ3SOs138+
s6EAChAAgRTjQd9z+3Aml48f+zbaN2Q/mCW+W7xsYZ/iFvP7I7mJY8DaZlC5VaGG
2aqpoOMkzJicc3gNaVbqhQo3xhcUYM99qgFLbbHOPZpxJsv6BToT0oA8U1E/YOGs
JmNiFZj8wykc7jCMRF0nNG/x0fSP556CF53RAb4rzNIwCm3S+VdO1bUwUVzPbWWS
yV0IC7X51EE1+86uFMry9UEs8KSVw9VTcjq17Bzdte85ysbysgvC3ei8vyDHKYWS
Jxc+0dOGP3riLn8ulW4uWI7GlZZI6SL5uGtyOo3Lmzyuf9yq2Yz/8XIlZCsedZAg
1TES1tOKc14T4AOEdBVwONUeaUg1v/i5oubkL3QW7bmfygNDc8lHIX1QszlpK+Q1
B+5QPzIDNf/G+VkZ3RLpwym/WCp8iSsLOJEdSEVMzCMdN28bmK6c//YT2//mEYKX
2BrFk8Lybg3ccyShQ/bBpiGnUz3lkqUtKL7N3imt1en17eatNm3oVrb+b7nG/Oyh
dJ6UYg1H1CoQxfMAYMWq3wRyJ29e6P12a9epG2c39/yvOCbH8me3aD9CTokiifm2
2YAsZMibs3inCpQw58HT0qE94eMEkA5PnzJ22Xe8JaLz45OkPsxZtMdPSCL8uHUe
aN18Jis3MRSCqF1FrySeekiugyPlHeYyv45uQ3jN6rC3NIF0zGA=
=LQPk
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
