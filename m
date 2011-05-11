From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 1/2] ARM: Tegra: Device Tree Support: Update how sdhci
 devices are initialized
Date: Wed, 11 May 2011 20:21:32 +0200
Message-ID: <BANLkTik2JxjT6aNYFOEGB9rg7q2zxC+nig@mail.gmail.com>
References: <20110510201108.22693.50319.stgit@riker> <20110510201414.22693.7427.stgit@riker>
 <74CDBE0F657A3D45AFBB94109FB122FF04986AA06A@HQMAIL01.nvidia.com>
 <BANLkTingm7PCJPC-xCremYg_Ab7qFvPSag@mail.gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF04986AA077@HQMAIL01.nvidia.com>
 <4DC9BD39.30108@secretlab.ca> <74CDBE0F657A3D45AFBB94109FB122FF04986AA0A6@HQMAIL01.nvidia.com>
 <4DC9CB47.9000900@secretlab.ca> <74CDBE0F657A3D45AFBB94109FB122FF04986AA0E4@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04986AA0E4-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, May 11, 2011 at 7:01 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> John Bonesio wrote at Tuesday, May 10, 2011 5:33 PM:
> +static struct tegra_sdhci_platform_data sdhci_pdata1 =3D {
> + =A0 =A0 =A0 .cd_gpio =A0 =A0 =A0 =A0=3D -1,
> + =A0 =A0 =A0 .wp_gpio =A0 =A0 =A0 =A0=3D -1,
> + =A0 =A0 =A0 .power_gpio =A0 =A0 =3D -1,
> +};
> ...
> + =A0 =A0 =A0 tegra_sdhci_device1.dev.platform_data =3D &sdhci_pdata1=
;
>
> The SDHCI driver has already been updated to get this platform data
> from the OF node in the platform device; it doesn't need hard-coded
> platform data to be passed to it.
>
> Similarly, the following from your I2C patch shouldn't be required:
>
> +static struct tegra_i2c_platform_data harmony_i2c1_platform_data =3D=
 {
> + =A0 =A0 =A0 .bus_clk_rate =A0 =3D 400000,
> +};
> ...
> + =A0 =A0 =A0 tegra_i2c_device1.dev.platform_data =3D &harmony_i2c1_p=
latform_data;

Correct.  John, you /should/ be able to simply drop the hunk in this
patch that adds platform_data bits.  All you're doing with this patch
is dropping the local declaration of the platform_devices and using
the ones defined in arch/arm/mach-tegra/devices.c.  Setting the
platform_data pointer is not required.

g.
