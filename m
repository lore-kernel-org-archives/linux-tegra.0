From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [RFC 1/2] ARM:Tegra: Device Tree Support: Initialize the audio
	card from the device tree.
Date: Thu, 2 Jun 2011 22:43:22 +0100
Message-ID: <20110602214322.GC10532@n2100.arm.linux.org.uk>
References: <20110527205444.21000.90209.stgit@riker> <20110527205706.21000.34832.stgit@riker> <BANLkTi=NMjBjWVv_o3PocejhgGr8TdG+1Q@mail.gmail.com> <BANLkTi=PtEhxxmZo2DqvmySCmnEd3LbezQ@mail.gmail.com> <BANLkTikWpiY_o27OF-Jxvq7iPeWzrAYOsQ@mail.gmail.com> <20110602160445.GA8373@ponder.secretlab.ca> <BANLkTikGp_O-Wd3nMhbV+-RLeXZoWeB6eQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BANLkTikGp_O-Wd3nMhbV+-RLeXZoWeB6eQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 03, 2011 at 12:21:50AM +0800, Barry Song wrote:
> Arnd has required me to use device tree in our new SoC for the coming
> upstream. so i am trying to define a property like clock = "uart" in
> dts. then in drivers,
> i get this  string by:
> clk = of_get_property(np, "clock", NULL);
> then request this clock by clk_get().

This is entirely wrong.  clk_get() takes two things.  It takes a struct
device.  We should know what the struct device is (provided they're named
in a stable manner.)

The other parameter, the string, is up to the driver.  It's not a device
property.  It's not a SoC-wide clock name.  It's a connection name for
the clock on the device.  This won't change from one instance of the
device to another instance of the device - it's effectively a constant.

So there's no point in having the DT describe that name - that's out of
its realm.

One of the problems is that clk_get() hides the mapping of device+connection
internally, which it has had to as we haven't had a device tree to look
things up.

In essence, clk_get() is looking up a property (the clock connection name)
for the struct device.  When clks get converted to the device tree, the
DT stuff should hook inside clk_get() to do a property lookup to discover
which clock the driver wants.

Drivers should definitely not be looking up a property in the device tree
and using that as a connection name into clk_get().
