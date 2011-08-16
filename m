From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v2 00/13] arm/tegra: Initialize GPIO & pinmux from DT
Date: Tue, 16 Aug 2011 16:01:31 +0200
Message-ID: <CACRpkdaVx=6AJ5DFjVN1ZYQ++hu9pT6WxD9n+pqmYVaCf1xawg@mail.gmail.com>
References: <1313440100-17131-1-git-send-email-swarren@nvidia.com>
	<201108161509.17157.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201108161509.17157.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 16, 2011 at 3:09 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

> I do think that you should keep Linus Walleij on Cc in these emails, since
> he first started pushing for a common pinmux layer, and we need to make
> sure that the binding works for all SoCs, not just for tegra.

Sorry for slipping off the pinmux stuff, I will make it my goal to recap
discussion and try to post a new patchset this week.

Concepts have grown, I see Stephen have created the new concept
of e.g. bias groups which is a real good idea

One problem is that I wanted to start out small with the pinctrl
subsystem, and now it looks like it has to do a *lot* of stuff from
day 1 to be of any use ...

One specific thing worries me: Grant asked me to make sure
to NOT create a global pin number space for the pinmuxes (and thus
pinctrl). This means that in order to proceed, mappings of pinmux
groups or pincontrol (such as bias) groups, each device using such
an entity need to reference the intended pincontroller/mux instance.

Say mmc instance 0 need pingroup foo on pincontroller bar
means that there must be a specific reference from mmc.0:s
struct device * to pinctrl bar:s struct device *. Maybe this is
peanuts in DT, sorry not enough insight.

I wonder if this has bearing on how the device tree need to be
structured to be future proof? (Hopefully not.)

Yours,
Linus Walleij
