From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 2/3] pinctrl: allow concurrent gpio and mux function
 ownership of pins
Date: Tue, 6 Mar 2012 11:03:23 +0100
Message-ID: <CACRpkdYdSaNsrr34o2Cc4vS12ee9oY7FG0pxB92mefHZKwdEpA@mail.gmail.com>
References: <1330993336-9538-1-git-send-email-swarren@nvidia.com>
	<1330993336-9538-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330993336-9538-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 6, 2012 at 1:22 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> Per recent updates to Documentation/gpio.txt, gpiolib drivers should
> inform pinctrl when a GPIO is requested. pinctrl then marks that pin as
> in-use for that GPIO function.
>
> When an SoC muxes pins in a group, it's quite possible for the group to
> contain e.g. 6 pins, but only 4 of them actually be needed by the HW
> module that's mux'd to them. In this case, the other 2 pins could be
> used as GPIOs. However, pinctrl marks all the pins within the group as
> in-use by the selected mux function. To allow the expected gpiolib
> interaction, separate the concepts of pin ownership into two parts: One
> for the mux function and one for GPIO usage. Finally, allow those two
> ownerships to exist in parallel.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Good, and 100% in accordance with earlier discussions.
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Thanks,
Linus Walleij
