From: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>
Subject: Re: No HDMI output on AC100
Date: Fri, 14 Jun 2013 20:27:00 +0200
Message-ID: <EF2DBD80-3DDD-416F-935C-E48261BF6CF5@m3y3r.de>
References: <1370680435.24531.12.camel@localhost.localdomain> <68C7110D-C493-4A1F-8011-5F9259C2F4E7@m3y3r.de> <1370707552.1829.4.camel@antimon.fritz.box> <2572002.IOA8y0azF4@ax5200p> <1370767921.2283.8.camel@localhost.localdomain> <20130612105002.GA1940@manwe>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130612105002.GA1940@manwe>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am 12.06.2013 um 12:50 schrieb Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:

> On Sun, Jun 9, 2013 at 10:52 AM, Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org> wrote:
> [...]
>> oops! I think everthing did always work correctly! But somehow Fedora 19
>> fails to spawn a getty on the tty1/fb0 console... so I just did see a
>> black screen :-)
> 
> Just to confirm. This isn't a tegra-drm issue, but rather Fedora 19 not
> spawning getty? Or is something in tegra-drm causing getty to fail? That
> would be surprising, but I'm trying to figure out if I need to
> investigate or not. =)
> 
Hi,

Please forget the getty thing as it was nonsense. The tegra hdmi driver seems to work, once it decides to output a signal. I was somehow able to trigger this the last time, but I don't know how to reproduce this.

So when I boot with the hdmi monitor connected all I get is a blank screen with no backlight ( I'm talking about the external hdmi monitor here, not the LCD panel!)

And some unknow thing (load of a module? Loading udl driver? Restarting getty?) seems to trigger that the tegra hdmi driver starts to output a valid hdmi signal and the external monitor shows the tegra hdmi framebuffer console.

The ac100 is otherwise up and running and I can ssh into it.

Any ideas?

> Thierry
