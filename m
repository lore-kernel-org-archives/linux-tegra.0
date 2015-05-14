From: Valentin Rothberg <valentinrothberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: soc/tegra: fuse: undefined option ARCH_TEGRA_210_SOC
Date: Thu, 14 May 2015 13:50:08 +0200
Message-ID: <CAD3Xx4+6r1w+oKgjUAuLXzszy9-uRWvXyyfv3q_1YGC6shXHFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: Valentin Rothberg <valentinrothberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Andreas Ruprecht <andreas.ruprecht-d40JDW7QUjc@public.gmane.org>, hengelein Stefan <stefan.hengelein-d40JDW7QUjc@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

your commit e3cf5bf687df ("soc/tegra: fuse: Add Tegra210 support") is
in today's linux-next tree (i.e., next-20150514).  The following lines
in the commit reference a Kconfig option that is not defined, so that
the driver and the affected #ifdef blocks cannot be compiled:

drivers/soc/tegra/fuse/Makefile:10:obj-$(CONFIG_ARCH_TEGRA_210_SOC)
 += speedo-tegra210.o
drivers/soc/tegra/fuse/fuse-tegra.c:104:#ifdef CONFIG_ARCH_TEGRA_210_SOC
drivers/soc/tegra/fuse/fuse-tegra30.c:49:    defined(CONFIG_ARCH_TEGRA_210_SOC)
drivers/soc/tegra/fuse/fuse-tegra30.c:148:#if defined(CONFIG_ARCH_TEGRA_210_SOC)
drivers/soc/tegra/fuse/fuse.h:84:#ifdef CONFIG_ARCH_TEGRA_210_SOC
drivers/soc/tegra/fuse/fuse.h:104:#ifdef CONFIG_ARCH_TEGRA_210_SOC

Is there a patch queued somewhere to add this option?

I detected this issue with scripts/checkkconfigsymbols.py by diffing
yesterday's and today's linux-next tree.  You can also use the script
to check specific commits for Kconfig related issues.

Kind regards,
 Valentin
