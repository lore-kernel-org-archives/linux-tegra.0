From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: No HDMI output on AC100
Date: Sun, 09 Jun 2013 14:02:16 +0200
Message-ID: <1963558.n4FXxA4Dl5@ax5200p>
References: <1370680435.24531.12.camel@localhost.localdomain> <51B3EC3D.3080306@wwwdotorg.org> <5714076.saxNrNAXNW@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5714076.saxNrNAXNW@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sunday 09 June 2013 13:42:46 Marc Dietrich wrote:
> On Saturday 08 June 2013 20:45:17 Stephen Warren wrote:
> > On 06/08/2013 02:07 PM, Marc Dietrich wrote:
> > > On Saturday 08 June 2013 18:05:52 Lucas Stach wrote:
> > >> Am Samstag, den 08.06.2013, 16:21 +0200 schrieb Thomas Meyer:
> > >>>> On Saturday 08 June 2013 10:33:55 Thomas Meyer wrote:
> > >>>>> Kernel version: 3.10.0-0.rc4.git0.1.fc20.armv7hl
> > >>>>> 
> > >>>>> This is the latest Fedora ARM kernel. Config is available here:
> > >>>>> http://pkgs.fedoraproject.org/cgit/kernel.git/tree/config-armv7
> > >>>>> 
> > >>>>> This is what I see in the kernel log:
> > >>>>> 
> > >>>>> $ dmesg |grep hdmi
> > >>>>> [   33.403417] tegra-hdmi 54280000.hdmi: failed to get VDD regulator
> > >>>>> [   33.403441] platform 54280000.hdmi: Driver tegra-hdmi requests
> > >>>>> probe
> > >>>>> 
> > >>>>> any ideas?
> > >>>> 
> > >>>> is the regulator (tps6586x) build-in?
> > >>> 
> > >>> No, it's a module.
> > >>> 
> > >>>> The make everything a module path isn't
> > >>>> well tested I guess.
> > >> 
> > >> It's not the problem here. The driver requests to be probed again and
> > >> comes up once the regulator is there.
> > >> 
> > >> Though the pixel clock looks odd for a HD HDMI monitor. Try looking at
> > >> the Xorg log to see what mode of your monitor get's chosen and why it
> > >> fails.
> > > 
> > > I just checked myself. Found that tps6586x-regulator module can't be
> > > autoloaded, so I connected my TV, booted and modprobed the module by
> > > hand.
> > > All works more or less fine, so probe deferral is no problem.
> > 
> > It could well just be that the tps6586x driver is missing the module
> > correct MODULE_ALIAS that makes the module auto-load when the relevant
> > entry is in the DT. The top-level MFD driver does have a
> > MODULE_DEVICE_TABLE which should set this up automatically, so perhaps
> > it's because there's nothing causing the regulator MFD component to load
> > when the top-level MFD component loads?
> 
> the core driver adds sub devices, but in case of DT, the number of
> subdevices is zero AFAICS (tps6586x_parse_dt). However, these subdevs do
> not include the regulators.

ah, the driver is named tps6586x-pmic (and the module alias is tps6586x-
regulator), so in case of platform_device type init, it is probed.

> Also, the regulator nodes don't have a compatibly property, so direct
> probing won't work.
> 
> I have no idea how the regulators are probed at all...

just found subsys_initcall(tps6586x_regulator_init), so the regulator is 
forced probed if build-in.

I guess replacing this by module_init (or better the short hand macro) should 
work now that deferral probing is working. Correct? Will try out...

Marc
