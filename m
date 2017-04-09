From: Vagrant Cascadian <vagrant@debian.org>
Subject: Re: [PATCH] arm64: tegra: Add CPU and PSCI nodes for NVIDIA Tegra210
 platforms
Date: Sat, 08 Apr 2017 19:22:41 -0700
Message-ID: <87vaqemia6.fsf@aikidev.net>
References: <1490701718-16571-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1507756759636607622=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1490701718-16571-1-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@nvidia.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Martin Michlmayr <tbm@cyrius.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

--===============1507756759636607622==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 2017-03-28, Jon Hunter wrote:
> Add the CPU and PSCI nodes for the NVIDIA Tegra210 platforms so that
> all CPUs can be enabled on boot. This assumes that the PSCI firmware
> has been loaded during the initial bootstrap on the device before the
> kernel starts (which is typically the case for these platforms). The
> PSCI firmware version is set to v0.2 which aligns with the current
> shipping version for Tegra.
>
> Reported-by: Martin Michlmayr <tbm@cyrius.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Tested on a jetson-tx1; all CPUs were recognized.

Tested-By: Vagrant Cascadian <vagrant@debian.org>

> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 23 ++++++++++++++++++++=
+++
>  arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi | 24 ++++++++++++++++++++=
++++
>  2 files changed, 47 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra210-p2180.dtsi
> index 906fb836d241..de1696c28140 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> @@ -296,6 +296,29 @@
>  		};
>  	};
>=20=20
> +	cpus {
> +		cpu@0 {
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu@1 {
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu@2 {
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu@3 {
> +			enable-method =3D "psci";
> +		};
> +	};
> +
> +	psci {
> +		compatible =3D "arm,psci-0.2";
> +		method =3D "smc";
> +	};
> +
>  	regulators {
>  		vdd_gpu: regulator@100 {
>  			compatible =3D "pwm-regulator";
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra210-p2530.dtsi
> index 0ec92578cacb..67cb039965fd 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
> @@ -51,4 +51,28 @@
>  			clock-frequency =3D <32768>;
>  		};
>  	};
> +
> +	cpus {
> +		cpu@0 {
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu@1 {
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu@2 {
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu@3 {
> +			enable-method =3D "psci";
> +		};
> +	};
> +
> +	psci {
> +		compatible =3D "arm,psci-0.2";
> +		method =3D "smc";
> +	};
> +
>  };
> --=20
> 2.7.4

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEcDardHbDotegGFCHt4uC1IFLkbYFAljpmvEACgkQt4uC1IFL
kbad9w//TAjOgKNRs+5QUZ7R4vYcN6WAMpDW4Dh7gM+2f4P4vkV0IXypBZnWTY+A
rr49gYb74zD5oQ08rLTy+5o6ByhuVOqjEZ5qqNoJdpV/6UK/9UHr7I0C7NEFjiad
naiczujuIzxyOYy7XhV5MF1ThypDIZDGACk7XwLcXtwj9qKWl68ZIxLYdD67xkWP
1e+79uIQgWaHHImwSq8vnXXRoiHHljzI+fSVGGwHv5xygOYySuHKXh/uHmN2wzuq
JsRPxSri7Q6lQDxrGByWLo85t6NazJZ99W47HTQBm4bwhcZdabgnYKFvp83XPz6C
p84yuNIf9PsDJyeErszGeG0X6EPE/OpFvSbbbbBO6IB9BszJGGkyEhpO3ktwFNNr
o7Cp5GxDZcSTnNIIjIYY2HFRwjzOk1XpJAPNjjwN1pSkNr6CNSIHdT+5PLE6Cfd7
vLAXAT+KSjlGt9AQ/w5QcRYBIJcHkSdXMr2LRD+K4KUU/3CDqYzLxiKVo1BfTXBm
GZRT00ougONzzthdBwtKVABRvgqPHkARim5L8lA/yasK1EdrPwMtilb5kGhFg+3v
1vpEhqhz/770TzWkH8Sk316qc5qaV85xN0QVsRwttuhZ10VJ/XQNeUeM+uhtE7Ut
dyVJ6qR4vey9ULzsuJvokTHeC3D7HKj/XbZDH1aqhm0dC/iex8o=
=U+n1
-----END PGP SIGNATURE-----
--=-=-=--


--===============1507756759636607622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1507756759636607622==--
