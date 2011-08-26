From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v3 00/13] arm/tegra: Initialize GPIO & pinmux from DT
Date: Thu, 25 Aug 2011 22:04:31 -0700
Message-ID: <CAOesGMiygfaNkPa7uURCiJpC=WDinWhKi07LFgJ+5JoGW_fLKw@mail.gmail.com>
References: <1314315824-9687-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1314315824-9687-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 25, 2011 at 4:43 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> v3:
> * Build on Jamie Iles' patches to split some of the DT parsing into
> =A0common code.
> * Renamed some properties to remove "nvidia," from name; they can be
> =A0generic.
> * Support pins property, to apply DT nodes to multiple pins/groups
> * Some minor error-message changes driven by some of the above.
> * Removed requirement to #ifdef CONFIG_OF
> * Removed AUXDATA table entries in mach-tegra/board-dt.c
>
> TODO:
> * Convert from using strings to using integers for the function and p=
in
> =A0names. This relies on the dtc patches I posted yesterday, but shou=
ld
> =A0be pretty simple once they're in.
>
> Jamie Iles (1):
> =A0of: add a generic pinmux helper
>
> Stephen Warren (12):
> =A0arm/tegra: Prep boards for gpio/pinmux conversion to pdevs
> =A0docs/dt: Document nvidia,tegra20-gpio's nvidia,enabled-gpios prope=
rty
> =A0arm/dt: Tegra: Add nvidia,enabled-gpios property to GPIO controlle=
r
> =A0docs/dt: Document nvidia,tegra20-pinmux binding
> =A0arm/dt: Tegra: Add pinmux node
> =A0dt: add empty for_each_child_of_node, of_find_property
> =A0gpio/tegra: Convert to a platform device
> =A0gpio/tegra: Add device tree support
> =A0arm/tegra: Convert pinmux driver to a platform device
> =A0of: add property iteration helpers
> =A0arm/tegra: Add device tree support to pinmux driver
> =A0arm/tegra: board-dt: Remove dependency on non-dt pinmux functions


This is looking pretty sane to me.

Grant, how do you prefer to handle this, since it spans of/dt, gpio
and tegra code? I can start a topic branch for Arnd to pull in for the
tegra parts, would you prefer picking up the of helper functions on
your own or is an ack from you and merge through the arm-soc tree
easier?


-Olof
