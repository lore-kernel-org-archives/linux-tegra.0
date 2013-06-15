From: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>
Subject: Re: No HDMI output on AC100
Date: Sat, 15 Jun 2013 11:37:46 +0200
Message-ID: <1371289066.3792.2.camel@localhost.localdomain>
References: <1370680435.24531.12.camel@localhost.localdomain>
	 <68C7110D-C493-4A1F-8011-5F9259C2F4E7@m3y3r.de>
	 <1370707552.1829.4.camel@antimon.fritz.box> <2572002.IOA8y0azF4@ax5200p>
	 <1370767921.2283.8.camel@localhost.localdomain>
	 <20130612105002.GA1940@manwe>
	 <EF2DBD80-3DDD-416F-935C-E48261BF6CF5@m3y3r.de>
	 <20130614203722.GA31138@manwe>
	 <C2E8F821-5848-4FC0-992C-385D48611324@m3y3r.de>
	 <20130614212646.GA31650@manwe>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130614212646.GA31650@manwe>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Freitag, den 14.06.2013, 23:26 +0200 schrieb Thierry Reding:
> On Fri, Jun 14, 2013 at 10:59:00PM +0200, Thomas Meyer wrote:
> > Am 14.06.2013 um 22:37 schrieb Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> [...]
> > > I think I've seen a similar issue
> > > when that's not loaded, in which case DRM will turn off all outputs
> > > because there's nothing to display. Alternatively you could try to run
> > > an X server using the xf86-video-opentegra or xf86-video-modesetting
> > > drivers. That should definitely get you output on HDMI.
> > 
> > I did login blindly on tty2 and started xfce using the open tegra driver,
> > but still no hdmi output. I can send you the Xorg log file if you want
> > to.
> 
> Yes, Xorg output would be good. Additionally, dmesg output might help.
> Don't forget to pass drm.debug=0xf on the kernel command-line.
> 
> > Xfce seems to run correctly, as far as I can see all necessary processes
> > are running. The monitor I connect to the hdmi is an dvi monitor using
> > an dvi to hdmi adapter, so no sound is connected. But that shouldn't be
> > a problem.

btw. switching the mode with
$ xrandr  -d :0 --output HDMI-0 --mode 1680x1050

makes the external monitor output the display correctly...

also switching to the highest possible resolution works after the first
mode switch:
$ xrandr  -d :0 --output HDMI-0 --mode 1920x1080

> 
> Audio over HDMI isn't working yet anyway.
> 
> Thierry
