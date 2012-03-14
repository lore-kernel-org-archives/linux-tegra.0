From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH V2 2/3] pinctrl: allow concurrent gpio and mux function
 ownership of pins
Date: Wed, 14 Mar 2012 10:27:38 -0700
Message-ID: <20120314172738.GA14853@quad.lixom.net>
References: <1330993336-9538-1-git-send-email-swarren@nvidia.com>
 <1330993336-9538-2-git-send-email-swarren@nvidia.com>
 <CACRpkdYdSaNsrr34o2Cc4vS12ee9oY7FG0pxB92mefHZKwdEpA@mail.gmail.com>
 <4F5E3F63.5080506@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F5E3F63.5080506-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 12, 2012 at 12:24:35PM -0600, Stephen Warren wrote:
> On 03/06/2012 03:03 AM, Linus Walleij wrote:
> > On Tue, Mar 6, 2012 at 1:22 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > 
> >> Per recent updates to Documentation/gpio.txt, gpiolib drivers should
> >> inform pinctrl when a GPIO is requested. pinctrl then marks that pin as
> >> in-use for that GPIO function.
> >>
> >> When an SoC muxes pins in a group, it's quite possible for the group to
> >> contain e.g. 6 pins, but only 4 of them actually be needed by the HW
> >> module that's mux'd to them. In this case, the other 2 pins could be
> >> used as GPIOs. However, pinctrl marks all the pins within the group as
> >> in-use by the selected mux function. To allow the expected gpiolib
> >> interaction, separate the concepts of pin ownership into two parts: One
> >> for the mux function and one for GPIO usage. Finally, allow those two
> >> ownerships to exist in parallel.
> >>
> >> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > Good, and 100% in accordance with earlier discussions.
> > Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Linus, now that Grant has ack'd and applied the documentation change
> behind this, could you take this one patch into the pinctrl tree. I
> assume it's 3.5 material. After the 3.4 merge window closes, I'll
> probably come back and ask for a stable pinctrl branch that I can use as
> the basis for a Tegra branch that'll contain patch 3 in this series.
> 
> (Olof, I assume that's the right way to approach this; having Linus
> apply both patches 2/3 in this series to pinctrl is going to make life
> difficult in the Tegra tree, since my outstanding patches to convert
> Tegra to use pinctrl will touch many of the same files as patch 3 in
> this series, in conflicting or dependent ways.)

Yes, that seems like a good way to handle it.


-Olof
