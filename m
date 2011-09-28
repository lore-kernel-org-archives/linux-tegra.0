From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v4 3/3] arm/tegra: device tree support for ventana board
Date: Wed, 28 Sep 2011 10:33:32 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1739555801@HQMAIL01.nvidia.com>
References: <1317171902-14736-1-git-send-email-pdeschrijver@nvidia.com>
 <1317171902-14736-4-git-send-email-pdeschrijver@nvidia.com>
 <201109281516.42513.arnd@arndb.de>
 <20110928171151.GN21166@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110928171151.GN21166-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Wednesday, September 28, 2011 11:12 AM:
> On Wed, Sep 28, 2011 at 03:16:42PM +0200, Arnd Bergmann wrote:
> > On Wednesday 28 September 2011, Peter De Schrijver wrote:
> > > --- a/arch/arm/mach-tegra/board-dt.c
...
> > > @@ -95,6 +95,8 @@ static void __init tegra_dt_init(void)
> > >                 harmony_pinmux_init();
> > >         else if (of_machine_is_compatible("nvidia,seaboard"))
> > >                 seaboard_pinmux_init();
> > > +       else if (of_machine_is_compatible("nvidia,ventana"))
> > > +               ventana_pinmux_init();
> >
> > Are you (Peter, Colin, Olof) confident that this is not getting out
> > of hand before it's getting better?
> >
> 
> We don't planning to add more derived boards besides ventana until we have the
> devicetree bindings for the new pinmux API in at which point this code
> will become obsolete.

Well, I think there will be one more; we're hoping to start uptreaming Tegra30
support soon, and the reference board for that will be Cardhu. That'll likely
happen before we have the initialize-pinmux-from-device-tree patches complete,
since I'm holding those off until we all think about whether the new pinmux API
core should be driving the initialization rather than individual pinmux drivers.

But, I hope Ventana and Cardhu will be the last before that's in place.

If not, we can certainly switch these if's to a table.

-- 
nvpublic
