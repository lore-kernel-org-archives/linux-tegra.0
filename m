From: Steev Klimaszewski <steev-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Fix nyan-big panel binding
Date: Sun, 19 Jul 2015 22:26:52 -0500
Message-ID: <1437362812.8225.13.camel@gentoo.org>
References: <1437336913-12886-1-git-send-email-steev@gentoo.org>
	 <CAEUnVG6g-0iYexKPXjO167-O6Oay71QXnoVz1Hvs=U8tSOp5uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEUnVG6g-0iYexKPXjO167-O6Oay71QXnoVz1Hvs=U8tSOp5uw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Steev Klimaszewski <threeway-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, 2015-07-19 at 16:43 -0600, Dylan Reid wrote:
> On Sun, Jul 19, 2015 at 2:15 PM, Steev Klimaszewski <
> threeway-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > The nyan-big Chromebook uses a 1920x1080 panel, not a 1366x768 
> > panel so correct
> > the binding.
> 
> This isn't incorrect, although it is not complete.  Nyan-big (Acer
> CB5-311) has _both_ a 1920x1080 and 1366x768 variant available.  They
> are referred to as the "Full HD" and "HD" models respectively.


Actually, as it turns out, that was a wrong turn. 

The real issue is that 1d002fa720738bcd0bddb9178e9ea0773288e1dd
(drm/dp: Use large transactions for I2C over AUX) breaks reading of
EDID data on the nyan_big "Full HD" - I'm not sure if it does on
others, but by setting DP_AUX_MAX_PAYLOAD_BYTES to 1, it fixed reading
the EDID data here and I have 1920x1080 at boot, with valid EDID data.

Not really sure the best way to go about doing that though.  I've poked
at some people in #dri-devel on irc, to see what they think.
