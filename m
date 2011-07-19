From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 2/3] dt: tegra20: Add ehci host controller nodes.
Date: Tue, 19 Jul 2011 16:58:40 -0700
Message-ID: <CAOesGMjKpzG6epJN70TDyvynon81Hr7e8Swh+VG1F7Pd-U818A@mail.gmail.com>
References: <1311115617-9697-1-git-send-email-achew@nvidia.com>
	<1311115617-9697-2-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1311115617-9697-2-git-send-email-achew@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: achew@nvidia.com
Cc: grant.likely@secretlab.ca, swarren@nvidia.com, dwillemsen@nvidia.com, rklein@nvidia.com, mogantyv@nvidia.com, devicetree-discuss@lists.ozlabs.org, linux-tegra@vger.kernel.org, linux-arm-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Tue, Jul 19, 2011 at 3:46 PM,  <achew@nvidia.com> wrote:
> From: Andrew Chew <achew@nvidia.com>
>
> These values were derived from various headers in arch/arm/mach-tegra=
=2E
>
> Signed-off-by: Andrew Chew <achew@nvidia.com>
> ---
> =A0arch/arm/boot/dts/tegra20.dtsi | =A0 52 ++++++++++++++++++++++++++=
++++++++++++++
> =A01 files changed, 52 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra=
20.dtsi
> index 83fedf3..a0353bb 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -160,5 +160,57 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupts =3D < 63 >;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0status =3D "disabled";
> =A0 =A0 =A0 =A0};
> +
> + =A0 =A0 =A0 ehci@c5000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-ehci";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xc5000000 0x4000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D < 52 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mode =3D < 1 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 power_down_on_bus_suspend;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 type =3D "utmi";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 hssync_start_delay =3D < 0 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 idle_wait_delay =3D < 17 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 elastic_limit =3D < 16 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 term_range_adj =3D < 6 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 xcvr_setup =3D < 15 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 xcvr_lsfslew =3D < 2 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 xcvr_lsrslew =3D < 2 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D "disabled";

These are mostly phy related settings, maybe do a phy subnode with
them? That way the usb_phy code can probe on that.


-Olof
