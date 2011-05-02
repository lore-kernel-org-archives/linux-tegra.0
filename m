From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/2] ARM: Tegra: dt: Split out separate Tegra SoC DT
Date: Mon, 2 May 2011 11:00:32 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0497F1B198@HQMAIL01.nvidia.com>
References: <1304136751-11629-1-git-send-email-swarren@nvidia.com>
 <20110501145546.GC19918@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110501145546.GC19918-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Sunday, May 01, 2011 8:56 AM:
> On Fri, Apr 29, 2011 at 10:12:30PM -0600, Stephen Warren wrote:
> > tegra250.dts describes everything within the Tegra SoC, but leaves all
> > optional devices disabled.
> >
> > tegra-harmony.dts is now the configuration of the SoC for the board,
> > i.e. it enables the optional devices that are required for the board,
> > and provides any required platform data for those devics.
> >
> > The prevents every Tegra board having to repeat all the basic internal
> > SoC wiring.
> >
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> 
> A mostly unrelated question below.
> 
> [...]
> 
> > +	serial@70006000 {
> > +		compatible = "nvidia,tegra250-uart";
> 
> I know this is how Grant specified it, but shouldn't these also have
> a compat for ns16550?

At present, I'm not sure it is technically compatible. If you look at
drivers/tty/serial/of_serial.c, you'll see:

static struct of_device_id __devinitdata of_platform_serial_table[] = {
...
        { .compatible = "ns16550",  .data = (void *)PORT_16550, },
...
        { .compatible = "nvidia,tegra250-uart",  .data = (void *)PORT_XSCALE, },

That PORT_XSCALE is different to the ns16550 entry. Arguably, that
field should be something that comes from the device tree, just
like e.g. reg-shift, but it certainly doesn't right now.

Grant, what are your thoughts on this?

Thanks.

-- 
nvpublic
