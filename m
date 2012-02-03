From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V2 1/4] pinctrl: add a driver for NVIDIA Tegra
Date: Fri, 3 Feb 2012 09:58:54 -0800
Message-ID: <20120203175854.GC1426@atomide.com>
References: <1328130290-17607-1-git-send-email-swarren@nvidia.com>
 <CACRpkda+KCutSFgPwH2Xvd14h0OCrArFGXAidp3n_ZgG28KB5g@mail.gmail.com>
 <201202021533.14650.arnd@arndb.de>
 <CACRpkdbMPrvN80cLyVLUNvTjx4ZV4iLeHcJaJyM_qvTHHAfWww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbMPrvN80cLyVLUNvTjx4ZV4iLeHcJaJyM_qvTHHAfWww-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rajendra Nayak <rajendra.nayak-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

* Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [120203 06:26]:
> On Thu, Feb 2, 2012 at 4:33 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > I guess if we could move the per-board pinmux data into dts files,
> > that would mean we could actually get rid of the per-board source
> > files in tegra, right?
> 
> If you mean these:
> 
>  arch/arm/mach-tegra/board-harmony-pinmux.c        |  362 ++-
>  arch/arm/mach-tegra/board-paz00-pinmux.c          |  362 ++-
>  arch/arm/mach-tegra/board-pinmux.c                |   62 +-
>  arch/arm/mach-tegra/board-pinmux.h                |   39 +-
>  arch/arm/mach-tegra/board-seaboard-pinmux.c       |  442 ++-
>  arch/arm/mach-tegra/board-trimslice-pinmux.c      |  366 ++-
> 
> Then the answer is yes.
> 
> But not if you mean these:
> 
>  drivers/pinctrl/pinctrl-tegra20.c                 | 2860 ++++++++++++++++
>  drivers/pinctrl/pinctrl-tegra30.c                 | 3726 +++++++++++++++++++++
> 
> Because the large number of lines come from SoC
> properties rather than board properties.
> 
> The big issue here is whether SoC hardware block
> properties (such as the pins and their names, and their
> groups) should be:
> 
> (A) open-coded in the driver or
> (B) provided as data in the device tree
> 
> nVidia Tegra have opted for the former, Texas OMAP for the latter.
> The in-kernel drivers also do like Tegra. However they
> are smaller due to less combinatorics.
> 
> This means that the Tegra driver gets (quite a bit) bigger and
> the OMAP driver (quite a bit) smaller.

Well I think both A and B should be supported, and also
support a combination of A and B in the same driver if
needed.

For doing DT only pinmux driver, my observations so far are:

1. Most of the pinmux data in the drivers is only needed for
   debugging and actually not needed in the driver at all.

   The pinmux driver can get away without knowing what the
   settings are, it just needs to know where the registers
   are and how they should set based on the board specific
   .dts configuration.

2. Knowing how the pinmux registers are set is crucial for
   debugging. But this all can be done with userspace tools
   using pinctrl debugfs entries. So again the pinmux driver
   just needs to know just "how many, what type of registers,
   and where they are".

3. The board specific pinmux configuration for groups and values
   can be passed from .dts files without passing any strings
   in most cases. Once we have preprocessor working, the .dts
   mux configuration should be quite readable.

> > Will it be possible to eventually put the pinmux driver into a loadable
> > module?
> 
> Tony had made it possible to have pinctrl drivers as modules,
> but some systems may need their pin control up before
> they even bring up the filesystem :-(

For development work loadable modules are much nicer to work with ;)

Loadable modules also automatically cut away the SoC specific
spaghetti calls as things need to work in a standard way limited
to EXPORT_SYMBOL.

So in general, from sanity checking point of view, we should
probably require that anything under drivers at least builds
as a loadable module.

> Booting from initramfs and switchroot can solve the above
> but will slow down boot I believe, and ARM systems
> usually don't like that.

Yeah I guess for now most people would want to build it in.
Then when ARM distros will be able to use the common zImage,
most people will probably switch to initramfs based boot.

Regards,

Tony
