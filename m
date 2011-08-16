From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH v2 00/13] arm/tegra: Initialize GPIO & pinmux from DT
Date: Tue, 16 Aug 2011 15:09:16 +0200
Message-ID: <201108161509.17157.arnd@arndb.de>
References: <1313440100-17131-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1313440100-17131-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Monday 15 August 2011, Stephen Warren wrote:
> v2:
> * Enhanced pinmux code to handle "drive pingroups" as well as "mux
>   pingroups". This altered the pinmux binding a little; shifting each
>   type of pingroup into a sub-node in the pinmux node.
> * Enumerate pingroups by enumerating DT child nodes, and mapping them to
>   pingroups, rather than the other way around. Hence also removed
>   modifications to <linux/of.h> and drivers/of/base.c.
> * Included documentation of the bindings.
> * Represent pingroup names and function names, as lower case in DT.
> * Used a better name for GPIO binding GPIO list.
> * Switched to boolean properties for pinmux pull-up/down.
> * s/dev_err/dev_dbg/ in DT parsing debug code.
> * Various minor cleanups (e.g. typos, white-space).
> 
> This patch modifies Tegra's device tree support to remove the dependency
> on harmony_pinmux_init(), thus making it completely board-independent.

I don't understand enough of the technical background to comment on
the contents, on the surface it all makes sense.

I do think that you should keep Linus Walleij on Cc in these emails, since
he first started pushing for a common pinmux layer, and we need to make
sure that the binding works for all SoCs, not just for tegra.

	Arnd
