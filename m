From: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>
Subject: Re: No HDMI output on AC100
Date: Sun, 09 Jun 2013 10:31:10 +0200
Message-ID: <1370766670.2283.3.camel@localhost.localdomain>
References: <1370680435.24531.12.camel@localhost.localdomain>
	 <68C7110D-C493-4A1F-8011-5F9259C2F4E7@m3y3r.de>
	 <1370707552.1829.4.camel@antimon.fritz.box> <2572002.IOA8y0azF4@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2572002.IOA8y0azF4@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Samstag, den 08.06.2013, 22:07 +0200 schrieb Marc Dietrich:
> On Saturday 08 June 2013 18:05:52 Lucas Stach wrote:
> > Am Samstag, den 08.06.2013, 16:21 +0200 schrieb Thomas Meyer:
> > > > On Saturday 08 June 2013 10:33:55 Thomas Meyer wrote:
> > > >> Kernel version: 3.10.0-0.rc4.git0.1.fc20.armv7hl
> > > >> 
> > > >> This is the latest Fedora ARM kernel. Config is available here:
> > > >> http://pkgs.fedoraproject.org/cgit/kernel.git/tree/config-armv7
> > > >> 
> > > >> This is what I see in the kernel log:
> > > >> 
> > > >> $ dmesg |grep hdmi
> > > >> [   33.403417] tegra-hdmi 54280000.hdmi: failed to get VDD regulator
> > > >> [   33.403441] platform 54280000.hdmi: Driver tegra-hdmi requests probe
> > > >> 
> > > >> any ideas?
> > > > 
> > > > is the regulator (tps6586x) build-in?
> > > 
> > > No, it's a module.
> > > 
> > > > The make everything a module path isn't
> > > > well tested I guess.
> > 
> > It's not the problem here. The driver requests to be probed again and
> > comes up once the regulator is there.
> > 
> > Though the pixel clock looks odd for a HD HDMI monitor. Try looking at
> > the Xorg log to see what mode of your monitor get's chosen and why it
> > fails.
> 
> I just checked myself. Found that tps6586x-regulator module can't be 
> autoloaded, so I connected my TV, booted and modprobed the module by hand.
> All works more or less fine, so probe deferral is no problem.

I did also notice, that the module needs to loaded manually, so I put it
in /etc/modules-load.d/regulator.conf to let systemd load it on every
start.

> 
> Thomas, did you add cma=64M to you kernel command line? HDMI needs some 
> memory.

yes, I tried with cma=64M and without the cma option, but no success.

> 
> Marc
> 
