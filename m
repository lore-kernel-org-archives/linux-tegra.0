From: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/4] [ARM] tegra: Add support for Tegra USB PHYs
Date: Fri, 11 Feb 2011 19:01:34 -0800
Message-ID: <AANLkTimQbmhZu1a+Aojh=2XBv0V9DOZ4-qimiHxXrEW3@mail.gmail.com>
References: <1297228927-23497-1-git-send-email-benoit@android.com>
	<1297228927-23497-2-git-send-email-benoit@android.com>
	<20110209070540.GA17627@morell.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110209070540.GA17627-f3YH7lVHJt/FT5IIyIEb6QC/G2K4zDHf@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 8, 2011 at 11:05 PM,  <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On Tue, Feb 08, 2011 at 09:22:04PM -0800, Benoit Goby wrote:
>
>> +static void ulpi_phy_power_on(struct tegra_usb_phy *phy)
>> +{
>> + =A0 =A0 =A0 unsigned long val;
>> + =A0 =A0 =A0 void __iomem *base =3D phy->regs;
>> + =A0 =A0 =A0 struct tegra_ulpi_config *config =3D phy->config;
>> +
>> + =A0 =A0 =A0 gpio_direction_output(config->reset_gpio, 0);
>> + =A0 =A0 =A0 msleep(5);
>> + =A0 =A0 =A0 gpio_direction_output(config->reset_gpio, 1);
>> +
>> + =A0 =A0 =A0 clk_enable(phy->clk);
>> + =A0 =A0 =A0 msleep(1);
>
> This msleep seems excessive. =A0Does it take that long for the clock =
to
> settle?
>

I tried to use smaller delays but got enumeration issues with delays
<1ms, so I'm keeping the msleep.

Benoit
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
