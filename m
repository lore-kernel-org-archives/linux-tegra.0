From: mirq-test@rere.qmqm.pl
Subject: Re: [PATCH 1/3] arm64: tegra: Add unit-address for CBB on Tegra194
Date: Fri, 26 Jul 2019 18:04:42 +0200
Message-ID: <20190726160442.GA22187@qmqm.qmqm.pl>
References: <20190726101618.26896-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190726101618.26896-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 26, 2019 at 12:16:16PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> =

> The control back-bone (CBB) starts at physical address 0, so give it a
> unit-address to comply with standard naming practices checked for by the
> device tree compiler.
> =

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 20 +++++++++----------
>  .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  2 +-
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  2 +-
>  3 files changed, 12 insertions(+), 12 deletions(-)
> =

> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra194-p2888.dtsi
> index 62e07e1197cc..02f6a8f0d741 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> @@ -8,17 +8,17 @@
>  	compatible =3D "nvidia,p2888", "nvidia,tegra194";
>  =

>  	aliases {
> -		sdhci0 =3D "/cbb/sdhci@3460000";
> -		sdhci1 =3D "/cbb/sdhci@3400000";
> +		sdhci0 =3D "/cbb@0/sdhci@3460000";
> +		sdhci1 =3D "/cbb@0/sdhci@3400000";
>  		serial0 =3D &tcu;
>  		i2c0 =3D "/bpmp/i2c";
> -		i2c1 =3D "/cbb/i2c@3160000";
> -		i2c2 =3D "/cbb/i2c@c240000";
> -		i2c3 =3D "/cbb/i2c@3180000";
> -		i2c4 =3D "/cbb/i2c@3190000";
> -		i2c5 =3D "/cbb/i2c@31c0000";
> -		i2c6 =3D "/cbb/i2c@c250000";
> -		i2c7 =3D "/cbb/i2c@31e0000";
> +		i2c1 =3D "/cbb@0/i2c@3160000";
> +		i2c2 =3D "/cbb@0/i2c@c240000";
> +		i2c3 =3D "/cbb@0/i2c@3180000";
> +		i2c4 =3D "/cbb@0/i2c@3190000";
> +		i2c5 =3D "/cbb@0/i2c@31c0000";
> +		i2c6 =3D "/cbb@0/i2c@c250000";
> +		i2c7 =3D "/cbb@0/i2c@31e0000";
>  	};
[...]

There are aliases in tegra194.dtsi like gen1_i2c, maybe they could
be used here?

Best Regards,
Micha=B3=A0Miros=B3aw
