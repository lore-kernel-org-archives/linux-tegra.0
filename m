From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: moving Tegra30 to the common clock framework
Date: Thu, 3 May 2012 19:13:11 +0300
Message-ID: <20120503161311.GG20304@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-l0cyMroinI0@public.gmane.org, paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

I started looking into what would be needed to move our tegra30 clock code
to the common clock framework. The tegra30 clocktree is rather flat. Basically
there are a bunch of sources (13 PLLs, external audio clocks, osc and 32Khz)
and peripheral clocks which have a mux (with 4 or more inputs), a divider and
a gate. So almost every peripheral clock can have multiple parents.

Some questions:

1) should these peripheral clocks be modelled as 3 different clocks
   (mux -> divider -> gate) or would it be better to make a new clock type for
   this?

2) how to define the default parent? in many cases the hw reset value isn't
   a very sensible choice, so the kernel probably needs to set a parent of
   many of them if we don't want to rely on bootloader configuration.

Cheers,

Peter.
