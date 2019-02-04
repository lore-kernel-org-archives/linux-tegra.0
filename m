From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V9 3/5] i2c: tegra: Add DMA support
Date: Mon, 4 Feb 2019 09:18:29 +0100
Message-ID: <20190204081829.GC19087@ulmo>
References: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
 <1549040867-18149-3-git-send-email-skomatineni@nvidia.com>
 <d37e901b-1c26-3d9c-7f68-29e06f4ff993@gmail.com>
 <BYAPR12MB33982BC5A58A000A0CB84F6AC2930@BYAPR12MB3398.namprd12.prod.outlook.com>
 <a5e79739-3ce5-6c22-c9d2-e9d2c709cb30@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uXxzq0nDebZQVNAZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a5e79739-3ce5-6c22-c9d2-e9d2c709cb30@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--uXxzq0nDebZQVNAZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 03, 2019 at 07:48:09PM +0300, Dmitry Osipenko wrote:
> 02.02.2019 21:32, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> This patch adds DMA support for Tegra I2C.
> >>>
> >>> Tegra I2C TX and RX FIFO depth is 8 words. PIO mode is used for=20
> >>> transfer size of the max FIFO depth and DMA mode is used for transfer=
=20
> >>> size higher than max FIFO depth to save CPU overhead.
> >>>
> >>> PIO mode needs full intervention of CPU to fill or empty FIFO's and=
=20
> >>> also need to service multiple data requests interrupt for the same=20
> >>> transaction. This adds delay between data bytes of the same transfer=
=20
> >>> when CPU is fully loaded and some slave devices has internal timeout=
=20
> >>> for no bus activity and stops transaction to avoid bus hang. DMA mode=
=20
> >>> is helpful in such cases.
> >>>
> >>> DMA mode is also helpful for Large transfers during downloading or=20
> >>> uploading FW over I2C to some external devices.
> >>>
> >>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> >>> ---
> >>
> >>
> >>> +static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev) {
> >>> +	struct dma_chan *dma_chan;
> >>> +	u32 *dma_buf;
> >>> +	dma_addr_t dma_phys;
> >>> +	int err =3D 0;
> >>> +
> >>> +	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA))
> >>> +		return -ENODEV;
> >>
> >> Another detail is that we need to keep older kernels working on
> >> T186+ after its device-tree will get the "dmas" property,
> >> device-tree changes shall be backwards-compatible with older
> >> kernels. Hence we need to check that platform actually wants the
> >> APB DMA driver, otherwise T186+ will be failing with -EPROBE_DEFER.
> >=20
> > Yes, that will be a separate patch later for adding DMA support for
> > Tegra186 and later chips once we check on GPCDMA upstream
> >=20
> >=20
>=20
> Sure, and there is a requirement in upstream to keep older kernel
> versions working with the later device-tree updates, as I pointed
> above. Please include the ".has_apb_dma checking" that I'm suggesting
> into the next version.

I don't think that's true. The requirement is for the device-tree ABI to
remain stable, but that technically only requires that kernel updates do
not require a DTB update.

The assumption on which this is based is that the DTB may be shipping in
read-only storage, like it used to fairly commonly in the distant past.

Conversely, if you update the DTB the assumption is that you can also
update the kernel, so the compatibility doesn't need to go that way.

That said, I think what you're proposing here makes sense and is pretty
trivial, so might as well add it at this time.

Thierry

--uXxzq0nDebZQVNAZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxX9VMACgkQ3SOs138+
s6G1ag//exFZIaKJSO0vB5wrW6HZ1CA2EbV9qoMEo+Z/8qGXeXsiHRF3hP78kkn4
hMW0fo8AkBZ4oKvX0F8imDjKYt3qIFp1eRZtZn1IhYFLc6S6E6sr8kHhNybEdIS+
GYTM3A/NuuEqwy+iexT1iQC87+hPTwqZD6ReKFaspI4sFupm28a1qj1RrGpD2fW9
qi2gnehglSzfps2tckWzYlRzH2S7EtEuwfq1hp0ROwn6kLx8UXGMCtEG5w4FYoGY
igp2RTANj/6Y1kPgpyEHaDD5XP2iOzYS6lsBbEKynNHLbIN6MKsDHo7+fTqU5758
botJhulhlj/xuMpb3INjVI/PiyJozWb+/8Wx3Y/f7BFkHFQMn8JYdn7RoJZv7c7x
crSkZnDgZ4ss/WOQzUpEg0NBa451gstRfPhHyXHmuDRHvZ8UezgzE7xv1CvmwUdj
77OgywBwtb8qhLJG2AeTLNs/wOKNZs/gvF8EbECY/YyoNywvSko1cfdesZHlruNZ
9x1bHoyjI5qWhLAscejjZt/6IojXNDH/gY8XBf+iFUegt0eU9uI2g+gH/0JWWz4n
GekHaK0ptUW06irdRuE+XrU6VxrtKUE+OwFoNC9GMuarPvAVeOhfwK5mrBY3TwL5
aXCw8h00zYiwlb7tbBXT/kQrcnWPE1/ofb5mARcUPOByJwu4/GI=
=jv1E
-----END PGP SIGNATURE-----

--uXxzq0nDebZQVNAZ--
