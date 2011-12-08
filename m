From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 3/8] arm/tegra: Split Seaboard GPIO table to allow
 for Ventana
Date: Wed, 7 Dec 2011 16:16:53 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1750B77906@HQMAIL01.nvidia.com>
References: <1323296033-28730-1-git-send-email-swarren@nvidia.com>
 <1323296033-28730-6-git-send-email-swarren@nvidia.com>
 <20111208001125.GD12945@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111208001125.GD12945-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Wednesday, December 07, 2011 5:11 PM:
> On Wed, Dec 07, 2011 at 03:13:44PM -0700, Stephen Warren wrote:
> > Seaboard and Ventana share some GPIOs, but others are different. Split the
> > GPIO table into common, seaboard-specific, and ventana-specific tables, so
> > that only the correct ones are enabled for each board. Add a few missing
> > audio-related GPIOs for Ventana.

...
> > +static struct tegra_gpio_table ventana_gpio_table[] = {
> > +	/* hp_det */
> > +	{ .gpio = TEGRA_GPIO_PW2,		.enable = true },
> > +	/* int_mic_en */
> > +	{ .gpio = TEGRA_GPIO_PX0,		.enable = true },
> > +	/* ext_mic_en */
> > +	{ .gpio = TEGRA_GPIO_PX1,		.enable = true },
> > +};
> 
> These should be given symbolical names instead.

I only gave the Seaboard GPIOs symbolic names because they all ended up
being used in multiple places; in this GPIO table, in platform data,
etc. Given that Ventana is a DT-only board, and this is the only place
that the GPIOs will ever be named by code rather than *.dts files, does
it make sense to require symbolic names? If you do think so, I don't
really have any objection to making names.

-- 
nvpublic
