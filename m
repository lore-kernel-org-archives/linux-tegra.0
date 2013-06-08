From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: No HDMI output on AC100
Date: Sat, 08 Jun 2013 17:12:48 +0200
Message-ID: <4976225.B4ibccLaIu@ax5200p>
References: <1370680435.24531.12.camel@localhost.localdomain> <4532876.1zmFKV0LLN@ax5200p> <68C7110D-C493-4A1F-8011-5F9259C2F4E7@m3y3r.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <68C7110D-C493-4A1F-8011-5F9259C2F4E7-VsYtu1Qij5c@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>
Cc: linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Saturday 08 June 2013 16:21:59 Thomas Meyer wrote:
> > On Saturday 08 June 2013 10:33:55 Thomas Meyer wrote:
> >> Kernel version: 3.10.0-0.rc4.git0.1.fc20.armv7hl
> >> 
> >> This is the latest Fedora ARM kernel. Config is available here:
> >> http://pkgs.fedoraproject.org/cgit/kernel.git/tree/config-armv7
> >> 
> >> This is what I see in the kernel log:
> >> 
> >> $ dmesg |grep hdmi
> >> [   33.403417] tegra-hdmi 54280000.hdmi: failed to get VDD regulator
> >> [   33.403441] platform 54280000.hdmi: Driver tegra-hdmi requests probe
> >> 
> >> any ideas?
> > 
> > is the regulator (tps6586x) build-in?
> 
> No, it's a module.
> 
> > The make everything a module path isn't
> > well tested I guess.
> 
> Oh... So how to fix this?!

mmh, either

a) try to load the module in initrd before everything else (but after i2c)
b) ask the fedora people to make it build-in
c) ask Thierry (added to cc) if this could be a tegra drm problem

Marc
