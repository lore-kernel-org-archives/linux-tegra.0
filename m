From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2] arm64: tegra: add topology data for Tegra194 cpu
Date: Wed, 13 Feb 2019 09:12:52 +0100
Message-ID: <20190213081252.GA647@ulmo>
References: <20190131222517.GB13156@mithrandir>
 <1549928827-14006-1-git-send-email-byan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1549928827-14006-1-git-send-email-byan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bo Yan <byan@nvidia.com>
Cc: jonathanh@nvidia.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2019 at 03:47:07PM -0800, Bo Yan wrote:
> The xavier CPU architecture includes 8 CPU cores organized in
> 4 clusters. Add cpu-map data for topology initialization, this
> fixes the topology information in
> /sys/devices/system/cpu/cpu[n]/topology
>=20
> Signed-off-by: Bo Yan <byan@nvidia.com>
> ---
> V2: remove cache nodes, add topology data only
>=20
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 58 ++++++++++++++++++++++++++=
+-----
>  1 file changed, 50 insertions(+), 8 deletions(-)

This mostly looks good to me. One minor comment below.

>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index 6dfa1ca..35e6e76 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -870,56 +870,98 @@
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> =20
> -		cpu@0 {
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu =3D <&cl0_0>;

I wonder if perhaps in this case it would be better to use the full path
to refer to the phandle here. That way we can avoid the labels, which
are somewhat cumbersome to write and the hierarchy, in my opinion, is a
much more natural way to reference these.

What I'm suggesting would look roughly like this:

		cpu-map {
			cluster0 {
				core0 {
					cpu =3D <&{/cpus/cpu@0}>;
				};

				core1 {
					cpu =3D <&{/cpus/cpu@1}>;
				};
			};

			cluster1 {
				core0 {
					cpu =3D <&{/cpus/cpu@2}>;
				};

				core1 {
					cpu =3D <&{/cpus/cpu@3}>;
				};
			};

			...
		};

That's slightly more characters, but I think it's much easier to read
than the labels.

I don't feel very strongly about it, though, so feel free to keep this
as-is if you prefer.

Thierry

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxj0YEACgkQ3SOs138+
s6EIjg//bkjxCg3sURndiknYkGF8P4aeDrmQDiRteucN73TGcbWJYCUEB7mZUa33
0+l0a/zUOapNqSZaHVSgXXiavEAyznJOqQNjpHaaUXieFvsfZRTFPyNenTYwWVq8
yn+MyGyKO69B32NECuBAbqby7kVU2AOyiN58AEFOVD7LF4H33UBFp7PG8PfJOuzB
MIDtZ2oW/VIdJft+044ZQ0LnBcWabrT1K3b/DHm9oBLQFLT3R3DiJz06cSsQs3Bo
ckjxuH0rZ9zql2UV/aivmtwSirw3g6kOrBs0S37nKDna5RQdLLM879k48LeaSXkn
kvo/FdMUWsafb+HGHeV2fmDhw1FS4ta97qNU5Siak72l21E8imIr/fBMr94j+c3P
ANMoBD5HZdQwcPnnsW4dVIT0DoZRzrkpJVG46rduOGpLaBzqXtp53KOkUkoH1X4P
0gJJ0SFw4pF8fzxmGTnqG7cWDViVBacA4Xpo1v1FTFOkbDn7NRzndneoqN+h+TdE
6+ow1/eDq3zZ6LzKk9K3nlkhtaSWdU83/DSIwP/0lyJJcUIW7vxgs9t1tZKl/JK0
sIGHMc9MIZC76lGeuplqo/HZMMMmHceJYNXNVTIA8B31Baooz+JhSIRr7lJkIoal
gd9Z6EEj9/aYPNf1LO4Wz2hONQXdLvakzqnA1TcrMVzM/mKZlKw=
=FQak
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
