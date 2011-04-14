From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: ARM Tegra fixes for 2.6.39-rc4
Date: Wed, 13 Apr 2011 22:50:58 -0700
Message-ID: <BANLkTimtnD3OMWT11Kf4A8dyx=Vp9DOOGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: linux-main <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Tegra Mailing List <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Erik Gilling <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Linus,
Please pull minor fixes for Tegra from:

 git://android.git.kernel.org/kernel/tegra.git for-linus

Thanks,
Colin


The following changes since commit 0ce790e7d736cedc563e1fb4e998babf5a4dbc3d:

  Linux 2.6.39-rc1 (2011-03-29 12:09:47 -0700)

are available in the git repository at:
  git://android.git.kernel.org/kernel/tegra.git for-linus

Colin Cross (1):
      ARM: tegra: gpio: Fix unused variable warnings

Nicolas Kaiser (1):
      arm: tegra: fix error check in tegra2_clocks.c

 arch/arm/mach-tegra/gpio.c          |    6 ++++--
 arch/arm/mach-tegra/tegra2_clocks.c |    9 +++++----
 2 files changed, 9 insertions(+), 6 deletions(-)
