From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [RFC 6/7] pwm: Add Tegra2 SoC support
Date: Tue, 20 Dec 2011 14:29:20 -0800
Message-ID: <CAOesGMibzg80rpeUMt-RTyz=0cffHtZmUe09XDdODNKwZmsX2A@mail.gmail.com>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
	<1324377138-32129-7-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324377138-32129-7-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Tue, Dec 20, 2011 at 2:32 AM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

If the code is copyright nvidia without a signed-off-by from them,
then they at least deserve mentioning of original authorship in the
change log.

It's also proving itself easier to do the driver and the device tree
and board-dt update separately since they tend to have different merge
paths.

Care to split up as two patches, one for drivers/ and one for arch/arm/=
?


Thanks!

-Olof


> diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/boa=
rd-dt.c
> index 2fa599d..387146c 100644
> --- a/arch/arm/mach-tegra/board-dt.c
> +++ b/arch/arm/mach-tegra/board-dt.c
> @@ -81,6 +81,7 @@ struct of_dev_auxdata tegra20_auxdata_lookup[] __in=
itdata =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &tegra_ehci2_device.dev.p=
latform_data),
> =A0 =A0 =A0 =A0OF_DEV_AUXDATA("nvidia,tegra20-ehci", TEGRA_USB3_BASE,=
 "tegra-ehci.2",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &tegra_ehci3_device.dev.p=
latform_data),
> + =A0 =A0 =A0 OF_DEV_AUXDATA("nvidia,tegra20-pwm", TEGRA_PWFM_BASE, "=
tegra-pwm", NULL),
> =A0 =A0 =A0 =A0{}
> =A0};
>
> diff --git a/arch/arm/mach-tegra/devices.c b/arch/arm/mach-tegra/devi=
ces.c
> index 7a2a02d..c67d85d 100644
> --- a/arch/arm/mach-tegra/devices.c
> +++ b/arch/arm/mach-tegra/devices.c
> @@ -704,3 +704,18 @@ struct platform_device tegra_pcm_device =3D {
> =A0 =A0 =A0 =A0.name =3D "tegra-pcm-audio",
> =A0 =A0 =A0 =A0.id =3D -1,
> =A0};
> +
> +static struct resource tegra_pwm_resources[] =3D {
> + =A0 =A0 =A0 [0] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =3D TEGRA_PWFM_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =3D TEGRA_PWFM_BASE + TEGRA_PWFM_S=
IZE - 1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =3D IORESOURCE_MEM,
> + =A0 =A0 =A0 },
> +};
> +
> +struct platform_device tegra_pwm_device =3D {
> + =A0 =A0 =A0 .name =3D "tegra-pwm",
> + =A0 =A0 =A0 .id =3D -1,
> + =A0 =A0 =A0 .num_resources =3D ARRAY_SIZE(tegra_pwm_resources),
> + =A0 =A0 =A0 .resource =3D tegra_pwm_resources,
> +};
> diff --git a/arch/arm/mach-tegra/devices.h b/arch/arm/mach-tegra/devi=
ces.h
> index 873ecb2..a8a5e25 100644
> --- a/arch/arm/mach-tegra/devices.h
> +++ b/arch/arm/mach-tegra/devices.h
> @@ -48,5 +48,6 @@ extern struct platform_device tegra_i2s_device1;
> =A0extern struct platform_device tegra_i2s_device2;
> =A0extern struct platform_device tegra_das_device;
> =A0extern struct platform_device tegra_pcm_device;
> +extern struct platform_device tegra_pwm_device;
>
> =A0#endif

I don't think you need the platform_device at all, since all platforms
should probe this device via DT (no legacy board file users in-tree).

> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 93c1052..7c6a137 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -9,4 +9,9 @@ menuconfig PWM
>
> =A0if PWM
>
> +config PWM_TEGRA
> + =A0 =A0 =A0 tristate "NVIDIA Tegra PWM support"
> + =A0 =A0 =A0 depends on ARCH_TEGRA
> + =A0 =A0 =A0 default n

No need to specify default n, since that's the default default. :)


-Olof
