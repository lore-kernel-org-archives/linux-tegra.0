From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 2/2] pinctrl: tegra-xusb: Fix allocation of pins
Date: Mon, 1 Jun 2015 13:57:35 +0200
Message-ID: <CACRpkdYYBgwKDtiSJdSuNSFz44SZdWWp2=zSteDgjLPCKfSaCA@mail.gmail.com>
References: <1432732314-372-1-git-send-email-jonathanh@nvidia.com>
	<1432732314-372-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432732314-372-3-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, May 27, 2015 at 3:11 PM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> Commit e5b3b2d9ed20 ("pinctrl: allows not to define the get_group_pins
> operation") allows pin controllers not to register the get_group_pins()
> function. However, a side-effect of not registering this function is
> that pins are not allocated and potentially multiple devices could
> attempt to configure the same pins [1]. Although this problem exists in
> the pinctrl core, because only a few devices are impacted by this, fix
> this for tegra-xusb by adding the get_group_pins() function.
>
> Please note that in addition to adding the get_group_pins() functions
> the pins/lanes for the tegra-xusb also need to be registered when
> calling pinctrl_register(). This also allows the current pinmux state
> to be viewed by the debugfs node "pinmux-pins" for the tegra-xusb pad
> controller.
>
> [1] http://www.spinics.net/lists/linux-gpio/msg05810.html
>
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Patch applied.

Yours,
Linus Walleij
