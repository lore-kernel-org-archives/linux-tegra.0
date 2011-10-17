From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC] [PATCH] ARM: tegra: emc: device tree bindings
Date: Mon, 17 Oct 2011 11:16:39 -0700
Message-ID: <CAF6FioW+a-wSZDEum293B2HjDpW=ojWoj+Sh1SVGNgVwfn3SJw@mail.gmail.com>
References: <1318873976-25335-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318873976-25335-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 17, 2011 at 10:52 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote=
:
> First cut at device tree bindings for the EMC tables on tegra.
>
> Note that I have a prerequisite patch that changes the tegra2_emc cod=
e
> to be a platform driver; but I wanted to do a sanity-check of my devi=
ce
> tree usage here before posting the whole series.
>
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ---
> =A0.../devicetree/bindings/arm/tegra/emc.txt =A0 =A0 =A0 =A0 =A0| =A0=
 77 ++++++++++++++++++++
> =A0arch/arm/boot/dts/tegra-seaboard.dts =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 36 +++++++++
> =A0arch/arm/boot/dts/tegra20.dtsi =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A07 ++
> =A03 files changed, 120 insertions(+), 0 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/arm/tegra/emc=
=2Etxt
>
> diff --git a/Documentation/devicetree/bindings/arm/tegra/emc.txt b/Do=
cumentation/devicetree/bindings/arm/tegra/emc.txt
> new file mode 100644
> index 0000000..dd7f845
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/tegra/emc.txt
> @@ -0,0 +1,77 @@
> +Embedded Memory Controller
> +
> +Properties:
> +- name : Should be emc
> +- #address-cells : Should be 1
> +- #size-cells : Should be 0
> +- compatible : should contain "nvidia,tegra20-emc".
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
> + =A0 =A0 =A0 }
> +
> +
> +Embedded Memory Controller configuration table
> +
> +This is a table containing the EMC register settings for the various
> +operating speeds of the memory controller. They are always located a=
s
> +subnodes of the emc controller node.
> +
> +There are two ways of specifying which tables to use:
> +
> +* The simplest is if there is just one set of tables in the device t=
ree,
> + =A0and they will always be used (based on which frequency is used).
> + =A0This is the preferred method, especially when firmware can fill =
in
> + =A0this information based on the specific system information and ju=
st
> + =A0pass it on to the kernel.
> +
> +* The slightly more complex one is when more than one memory configu=
ration
> + =A0might exist on the system. =A0The Tegra20 platform handles this =
during
> + =A0early boot by selecting one out of possible 4 memory settings ba=
sed
> + =A0on a 2-pin "ram code" bootstrap setting on the board. The values=
 of
> + =A0these strappings can be read through a register in the SoC, and =
thus
> + =A0used to select which tables to use.
> +
> +Properties:
> +- name : Should start with emc-table
> +- compatible : should contain "nvidia,tegra20-emc-table".
> +- reg : only needed if nvidia,use-ram-code is present in the

This looks good to me.  And in the future if we don't use the boot ROM
defined RAM code straps we can define a new nvidia,use-xxx-code capabil=
ity
to specify how to select the table.

Thanks,
    Anton

> + =A0parent. If so, the numerical representation of the selected ram =
code
> + =A0as reported by the strap option APB misc register.
> +- clock-frequency : the clock frequency for the EMC at which this
> + =A0table should be used (in kHz).
> +- nvidia,emc-registers : a 46 word array of EMC registers to be prog=
rammed
> + =A0for operation at the 'clock-frequency' setting.
> + =A0The order and contents of the registers are defined in the Tegra=
 TRM.
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 emc-table-333mhz@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,=
tegra20-emc-table";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D < 3=
33000 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,emc-registers =3D=
 < 0 0 0 0 0 0 0 0 0 0 0 0 0 0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A00 0 0 0 0 0 0 0 0 0 0 0 0 0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A00 0 0 0 0 0 0 0 0 0 0 0 0 0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A00 0 0 0 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 emc-table-666mhz@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,=
tegra20-emc-table";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D < 6=
66000 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,emc-registers =3D=
 < 0 0 0 0 0 0 0 0 0 0 0 0 0 0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A00 0 0 0 0 0 0 0 0 0 0 0 0 0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A00 0 0 0 0 0 0 0 0 0 0 0 0 0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A00 0 0 0 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts=
/tegra-seaboard.dts
> index a72299b..2d60b5ff 100644
> --- a/arch/arm/boot/dts/tegra-seaboard.dts
> +++ b/arch/arm/boot/dts/tegra-seaboard.dts
> @@ -20,6 +20,42 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clock-frequency =3D < 216000000 >;
> =A0 =A0 =A0 =A0};
>
> + =A0 =A0 =A0 emc {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 emc-table-166 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,=
tegra20-emc-table";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D < 1=
66500 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,emc-registers =3D=
 < 0x0000000a 0x00000021
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
008 0x00000003 0x00000004 0x00000004
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
002 0x0000000c 0x00000003 0x00000003
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
002 0x00000001 0x00000004 0x00000005
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
004 0x00000009 0x0000000d 0x000004df
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
000 0x00000003 0x00000003 0x00000003
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
003 0x00000001 0x0000000a 0x000000c8
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
003 0x00000006 0x00000004 0x0000000f
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
002 0x00000000 0x00000000 0x00000002
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
000 0x00000000 0x00000083 0xa04004ae
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x007fd=
010 0x00000000 0x00000000 0x00000000
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
000 0x00000000 0x00000000 0x00000000 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 emc-table-333 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,=
tegra20-emc-table";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D < 3=
33000 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,emc-registers =3D=
 < 0x00000014 0x00000041
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
00f 0x00000005 0x00000004 0x00000005
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
003 0x0000000c 0x00000005 0x00000005
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
003 0x00000001 0x00000004 0x00000005
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
004 0x00000009 0x0000000d 0x000009ff
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
000 0x00000003 0x00000003 0x00000005
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
005 0x00000001 0x0000000f 0x000000c8
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
003 0x0000000c 0x00000006 0x0000000f
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
002 0x00000000 0x00000000 0x00000002
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
000 0x00000000 0x00000083 0xe034048b
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x007e8=
010 0x00000000 0x00000000 0x00000000
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000=
000 0x00000000 0x00000000 0x00000000 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +
> =A0 =A0 =A0 =A0sdhci@c8000400 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cd-gpios =3D <&gpio 69 0>; /* gpio PI5=
 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0wp-gpios =3D <&gpio 57 0>; /* gpio PH1=
 */
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra=
20.dtsi
> index 65d7e6a..f4dc8d3 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -120,6 +120,13 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupts =3D < 123 >;
> =A0 =A0 =A0 =A0};
>
> + =A0 =A0 =A0 emc@7000f400 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-emc";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x7000f400 0x200>;
> + =A0 =A0 =A0 };
> +
> =A0 =A0 =A0 =A0sdhci@c8000000 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra20-sdhci";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0xc8000000 0x200>;
> --
> 1.7.4.1
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
