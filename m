From: Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v1 1/4] dt-binding: usb: ci-hdrc-usb2: Document NVIDIA
 Tegra support
Date: Thu, 19 Dec 2019 06:58:03 +0000
Message-ID: <20191219065800.GB19921@b29397-desktop>
References: <20191218175313.16235-1-digetx@gmail.com>
 <20191218175313.16235-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191218175313.16235-2-digetx@gmail.com>
Content-Language: en-US
Content-ID: <B49D0639DF65C0448C79274696758281@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 19-12-18 20:53:10, Dmitry Osipenko wrote:
> NVIDIA Tegra SoCs use ChipIdea silicon IP for the USB controllers.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Doc=
umentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> index cfc9f40ab641..51376cbe5f3d 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> @@ -15,6 +15,10 @@ Required properties:
>  	"qcom,ci-hdrc"
>  	"chipidea,usb2"
>  	"xlnx,zynq-usb-2.20a"
> +	"nvidia,tegra20-udc"
> +	"nvidia,tegra30-udc"
> +	"nvidia,tegra114-udc"
> +	"nvidia,tegra124-udc"
>  - reg: base address and length of the registers
>  - interrupts: interrupt for the USB controller
> =20

Acked-by: Peter Chen <peter.chen@nxp.com>

--=20

Thanks,
Peter Chen=
