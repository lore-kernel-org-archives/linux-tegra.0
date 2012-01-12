From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 7/9] arm/tegra: emc: device tree bindings
Date: Thu, 12 Jan 2012 13:48:10 -0800
Message-ID: <CAPnjgZ2vLiNWTweDduMgpEF-Jeucszvef20p3abv0kk6Pj3XTA@mail.gmail.com>
References: <1324599468-12845-1-git-send-email-olof@lixom.net>
	<1324599468-12845-8-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324599468-12845-8-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Olof,

On Thu, Dec 22, 2011 at 4:17 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> Device tree bindings for the EMC tables on tegra.
>
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> ---
> =A0.../devicetree/bindings/arm/tegra/emc.txt =A0 =A0 =A0 =A0 =A0| =A0=
100 ++++++++++++++++++++
> =A0arch/arm/boot/dts/tegra20.dtsi =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A07 ++
> =A02 files changed, 107 insertions(+), 0 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/arm/tegra/emc=
=2Etxt
>
> diff --git a/Documentation/devicetree/bindings/arm/tegra/emc.txt b/Do=
cumentation/devicetree/bindings/arm/tegra/emc.txt
> new file mode 100644
> index 0000000..09335f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/tegra/emc.txt
> @@ -0,0 +1,100 @@
> +Embedded Memory Controller
> +
> +Properties:
> +- name : Should be emc
> +- #address-cells : Should be 1
> +- #size-cells : Should be 0
> +- compatible : Should contain "nvidia,tegra20-emc".
> +- reg : Offset and length of the register set for the device
> +- nvidia,use-ram-code : If present, the sub-nodes will be addressed
> + =A0and chosen using the ramcode board selector. If omitted, only on=
e
> + =A0set of tables can be present and said tables will be used
> + =A0irrespective of ram-code configuration.
> +
> +Child device nodes describe the memory settings for different config=
urations and clock rates.
> +
> +Example:
> +
> + =A0 =A0 =A0 emc@7000f400 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D < 1 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D < 0 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-emc";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x7000f4000 0x200>;

Minor point - that should be 0x7000f400.

Regards,
SImon
