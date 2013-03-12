From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH V2 3/9] ARM: dt: tegra: add bindings of power management configurations for PMC
Date: Tue, 12 Mar 2013 11:35:43 +0100
Message-ID: <1715411.W3GXSOcQoS@fb07-iapwap2.physik.uni-giessen.de>
References: <1363060962-9172-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363060962-9172-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Joseph,

Am Dienstag, 12. M=E4rz 2013, 12:02:42 schrieb Joseph Lo:
> The PMC mostly controls the entry and exit of the system from differe=
nt
> sleep modes. Different platform or system may have different configur=
ations.
> The power management configurations of PMC is represented as some
> properties. The system needs to define the properties when the system
> supports deep sleep mode (i.e. suspend).
>=20
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2:
> * squash the patches that defined the PM bindings for PMC and the
>   implementation
> * replace the "unsigned long" with "u32" for the variables that are p=
arsed
>   from DT
> ---
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 42 ++++++++++-
>  arch/arm/mach-tegra/pmc.c                          | 83
> ++++++++++++++++++++++ arch/arm/mach-tegra/pmc.h                     =
     |
>  8 +++
>  3 files changed, 132 insertions(+), 1 deletion(-)
>=20
> diff --git
> a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
> b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt =
index
> b5846e2..12a436e 100644
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.=
txt
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.=
txt
> @@ -1,14 +1,46 @@
>  NVIDIA Tegra Power Management Controller (PMC)
>=20
> -Properties:
> +The PMC block interacts with an external Power Management Unit. The =
PMC
> +mostly controls the entry and exit of the system from different slee=
p
> +modes. It provides power-gating controllers for SoC and CPU power-is=
lands.
> +
> +Required properties:
>  - name : Should be pmc
>  - compatible : Should contain "nvidia,tegra<chip>-pmc".
>  - reg : Offset and length of the register set for the device
> +
> +Optional properties:
>  - nvidia,invert-interrupt : If present, inverts the PMU interrupt si=
gnal.
>    The PMU is an external Power Management Unit, whose interrupt outp=
ut
>    signal is fed into the PMC. This signal is optionally inverted, an=
d then
>    fed into the ARM GIC. The PMC is not involved in the detection or
>    handling of this interrupt signal, merely its inversion.
> +- nvidia,suspend-mode : The suspend mode that the platform should us=
e.
> +  Valid valuse are 0, 1 and 2:
> +  0 (LP0): CPU + Core voltage off and DRAM in self-refresh
> +  1 (LP1): CPU vlotage off and DRAM in self-refresh
> +  2 (LP2): CPU voltage off
> +- nvidia,core-power-req-active-high : Boolean, core power request
> active-high +- nvidia,sys-clock-req-active-high : Boolean, system clo=
ck
> request active-high +- nvidia,combined-power-req : Boolean, combined =
power
> request for CPU & Core +- nvidia,cpu-pwr-good-en : Boolean, CPU power=
 good
> signal (from PMIC to PMC) +			   is enabled.
> +
> +Required properties when nvidia,suspend-mode is specified:
> +- nvidia,cpu-pwr-good-time : CPU power good time in uS.
> +- nvidia,cpu-pwr-off-time : CPU power off time in uS.
> +- nvidia,core-pwr-good-time : <Oscillator-stable-time Power-stable-t=
ime>
> +			      Core power good time in uS.
> +- nvidia,core-pwr-off-time : Core power off time in uS.
> +
> +Required properties when nvidia,suspend-mode=3D<0>:
> +- nvidia,lp0-vec : <start length> Starting address and length of LP0=
 vector
> +  The LP0 vector contains the warm boot code that is executed by AVP=
 when
> +  resuming from the LP0 state. The AVP (Audio-Video Processor) is an=
 ARM7
> +  processor and always being the first boot processor when chip is p=
ower
> on +  or resume from deep sleep mode. When the system is resumed from=
 the
> deep +  sleep mode, the warm boot code will restore some PLLs, clocks=
 and
> then +  bring up CPU0 for resuming the system.
>=20
>  Example:
>=20
> @@ -16,4 +48,12 @@ pmc@7000f400 {
>  	compatible =3D "nvidia,tegra20-pmc";
>  	reg =3D <0x7000e400 0x400>;
>  	nvidia,invert-interrupt;
> +	nvidia,suspend-mode =3D <1>;
> +	nvidia,cpu-pwr-good-time =3D <2000>;
> +	nvidia,cpu-pwr-off-time =3D <100>;
> +	nvidia,core-pwr-good-ticks =3D <3845 3845>;
> +	nvidia,core-pwr-off-ticks =3D <458>;

s/ticks/time/

Marc
