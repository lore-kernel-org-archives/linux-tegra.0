From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC 1/3] pinctrl: add a driver for NVIDIA Tegra
Date: Fri, 9 Dec 2011 09:07:22 -0800
Message-ID: <20111209170722.GO31337@atomide.com>
References: <1323382390-14892-1-git-send-email-swarren@nvidia.com>
 <1323382390-14892-2-git-send-email-swarren@nvidia.com>
 <CACRpkdYDn0V7SeQuFiFDMxGkybvg6PGf7jxid8ECGB7Azkj3zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYDn0V7SeQuFiFDMxGkybvg6PGf7jxid8ECGB7Azkj3zw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

* Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [111209 05:29]:
> On Thu, Dec 8, 2011 at 11:13 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> 
> > This adds a driver for the Tegra pinmux, and required parameterization
> > data for Tegra20 and Tegra30.
> >
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This is looking good from a framework point of view (obviously,
> since you've designed the framework with me you sure know what
> you're doing).
> 
> What we could worry about is the amount of hard-coded chip data
> which sort of correlates with the discussion with Tony on how to
> provide DT info for pin control drivers.
> 
> If say this same controller appear in Tegra 4 with no changes but
> different pin names, it makes sense to try to push this into the
> DT as soon as possible, so as to avoid the situation Tony is
> having with the OMAP muxes. If Tegra 4 will be all-new and not even
> related, it doesn't.
> 
> So, just think a bit about it.
> 
> It will fit way better here than any place under
> arch/arm/* in any case, so it's a great achievement!

Sorry I still need some more time with pinmux-simple.c, will have
to get pending omap patches merged first. Just want to recap the
findings so far:

- We can have automatically generated device to pinmux driver
  mapping from DT, so that's nice

- Describing pins for each driver in DT is still open.. And
  using mixed-property arrays in DT won't nicely as the data
  gets unaligned easily with string properties..

- We currently have hard time supporting pin groups with pins
  coming from multiple pinmux driver instances

- Mixing pinmux data from various sources is still open; Some
  pinmux data may need to be static, some come from DT, some
  come from loadable modules or even /lib/firmware if the data
  gets insanely big. Basically we may not always have a phandle
  in DT data for the pinmux function, and should somehow allow
  also using names there

Regards,

Tony
