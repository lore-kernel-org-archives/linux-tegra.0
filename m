From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [RFC PATCH 06/12] arm/dt: Tegra: Add pinmux node
Date: Sun, 14 Aug 2011 00:24:37 -0700
Message-ID: <CAOesGMheuUfSe1uUA6LxZ71V0-DR3XX7bEJqhVxJ-ZqrWWa1bA@mail.gmail.com>
References: <1313189697-21287-1-git-send-email-swarren@nvidia.com>
	<1313189697-21287-7-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1313189697-21287-7-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Fri, Aug 12, 2011 at 3:54 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Add a pinmux node to tegra20.dtsi in order to instantiate the future
> pinmux device. Add pinmux nodes to Harmony and Seaboard, which detail
> the entire default pinmux configuration. This configuration is identi=
cal
> to that in board-harmony/seaboard-pinmux.c.

Again, documentation for the binding is needed.

Seeing the table coded up now though, I wonder if it could make sense
to flip it around? The number of functions multiplexed out are fewer
than the pin groups (and this would be even more true on platforms
that have per-pin configurations and/or smaller groups).

I.e. something like:

    sdio4 {
            nvidia,pingroups =3D < DTA DTD >; // Not sure how to
reference this though -- integers would be hard to read. DTA/DTD
aren't valid values in the syntax.
            nvidia,pull-up
    },

And any pingroups not covered by a function would be left alone (one
could easily define a few no-op functions to set pull up/down and
tristate values on the unused groups).

[...]

> + =A0 =A0 =A0 pinmux: pinmux@70000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ATA {

I would prefer seeing these in lower case (since device tree tends to
be no-caps). Should be easy to switch to strcasecmp in the code.

[...]
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 CDEV2 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,function =3D "PL=
LP_OUT4";

The string here is a bit unfortunate. It's really just used to map
from the string to an integer anyway, with the reverse mapping being
produced by the debugfs output. But especially if the function is
flipped above, the different pingroups referenced might not use the
same value for each function, so some sort of lookup will still be
needed. Not much to do about, it seems. :(


> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,pull =3D "down";

This should be done by discrete properties instead: nvidia,pull-up,
nvidia-pull-down (and omitted means normal), without values.


-Olof
