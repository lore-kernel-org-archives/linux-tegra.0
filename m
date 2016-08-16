From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/7] arm64: tegra: Add the various audio devices for
 Tegra210 Smaug
Date: Tue, 16 Aug 2016 15:15:37 +0200
Message-ID: <20160816131537.GD4133@ulmo.ba.sec>
References: <1470756082-19099-1-git-send-email-jonathanh@nvidia.com>
 <1470756082-19099-7-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W5WqUoFLvi1M7tJE"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470756082-19099-7-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--W5WqUoFLvi1M7tJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 09, 2016 at 04:21:21PM +0100, Jon Hunter wrote:
> The Tegra210 Smaug includes the Realtek RT5677 audio codec, Nuvoton
> NAU8825 headset codec and the Maxim MAX98357a audio amplifier. Add
> the nodes for these devices for the Tegra210 Smaug.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 44 +++++++++++++++++++++=
++++++
>  1 file changed, 44 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/b=
oot/dts/nvidia/tegra210-smaug.dts
> index 2c4672527d75..8cdd71f4d9ba 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -1562,6 +1562,45 @@
>  		};
>  	};
> =20
> +	i2c@7000d100 {
> +		status =3D "okay";
> +		clock-frequency =3D <400000>;
> +
> +		nau8825@1a {
> +			compatible =3D "nuvoton,nau8825";
> +			reg =3D <0x1a>;
> +			interrupt-parent =3D <&gpio>;
> +			interrupts =3D <TEGRA_GPIO(E, 6) IRQ_TYPE_LEVEL_LOW>;

Any reason why this uses the interrupt-parent and interrupts properties,
whereas...

> +			clocks =3D <&tegra_car TEGRA210_CLK_CLK_OUT_2>;
> +			clock-names =3D "mclk";
> +
> +			nuvoton,jkdet-enable;
> +			nuvoton,jkdet-polarity =3D <GPIO_ACTIVE_LOW>;
> +			nuvoton,vref-impedance =3D <2>;
> +			nuvoton,micbias-voltage =3D <6>;
> +			nuvoton,sar-threshold-num =3D <4>;
> +			nuvoton,sar-threshold =3D <0xc 0x1e 0x38 0x60>;
> +			nuvoton,sar-hysteresis =3D <1>;
> +			nuvoton,sar-voltage =3D <0>;
> +			nuvoton,sar-compare-time =3D <0>;
> +			nuvoton,sar-sampling-time =3D <0>;
> +			nuvoton,short-key-debounce =3D <2>;
> +			nuvoton,jack-insert-debounce =3D <7>;
> +			nuvoton,jack-eject-debounce =3D <7>;
> +			status =3D "okay";
> +		};
> +
> +		audio-codec@2d {
> +			compatible =3D "realtek,rt5677";
> +			reg =3D <0x2d>;
> +			interrupts-extended =3D <&gpio TEGRA_GPIO(X, 0) IRQ_TYPE_LEVEL_HIGH>;

=2E.. this uses interrupts-extended? I'd like these to be consistent, and
I'm slightly leaning towards the former. Any objections if I change that
while applying?

Thierry

--W5WqUoFLvi1M7tJE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXsxH5AAoJEN0jrNd/PrOhpT8P/RXLMZobYfLLQ0mMXkkNLXbl
clfsvuH6nTPFUkGZhTFXcGTENe6+wbJxbcSvGo1sStqmCDO2YmK9HS38VR5fHIn6
5oKgZs07RaA1G/R7nzgngh0xz4nd9O1/h0ZLUMiWEku816SnzWmRfeSuDZeMMUY4
Me7J+8MLHCzm4jZIcdnPcGY5U1EhplI7vPwEJiCyYT6fw/71pT0J0uqqkR950wwG
pqoa5BuEni5B7b8Zmi0WBKB9yJmsoLtorVDpZcJhc0Q25vrkulYOK62Tk43nRmqV
XOcLkNt0+hzM2MhR9xA+MwOlYXMPCuwsmxQvzgrd6T5HR8BpNm5e+DTgX9F8p/Au
LRJUPRzYQoxk+Rg3qUTWzcq9NrOk4cX43bcmioUzaowWnaTGfoRaN2mb1xNh71Tj
hw959Tlo5HaoJD1+qlShmqLDkNCDlP9lalHLY191wQ3shQnqwiOrGzrjIsOswkea
AJJV55Q8SEdei1Cown1jQa5UQMgUa35j5CpeujZ6qBxSYeH7axZ8Cl/DkrJ0Vm7W
c617tMnzRIN5UoREeRmhykGUF9MOsAYpsc8TzX6PWNB/ohGtgInTCnd40AzNHp4S
GlA1Vg+4yWALNakI3CwRwqLfwFwhEKxpjzYuWjo/RILJ548gv2SYy2pCmyDry6mi
p4r1NVugvDv6Yqvgc9AZ
=Clv5
-----END PGP SIGNATURE-----

--W5WqUoFLvi1M7tJE--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
