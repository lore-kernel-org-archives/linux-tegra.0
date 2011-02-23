From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [GIT PULL] Please pull tegra board updates for .39
Date: Wed, 23 Feb 2011 13:31:30 -0800
Message-ID: <AANLkTi=5MN6mjQKZz-HEb91c+7yEv5QSviSg-cpPUNQA@mail.gmail.com>
References: <AANLkTimA1=CCXM8wmkoatL59mzitC=5-GK3HUs-_daE9@mail.gmail.com>
	<AANLkTim99BSkaX-hm8kb43tm6YJY5VUk6OYL6SwyPmD5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTim99BSkaX-hm8kb43tm6YJY5VUk6OYL6SwyPmD5-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 23, 2011 at 1:17 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> Colin,
>
> Since things got held up due to rebases and a few patch respins,
> here's a fresh pull request and diff stats. Please pull
> boards-for-next.
>
> Given current activity, I expect to stage one more pull before the
> merge window once the i2c driver is in the main tegra for-next branch=
=2E
>
>
>
> The following changes since commit 38376866a1fe5b1e6d9510ec4913c2b461=
f456f3:
> =A0Mark Brown (1):
> =A0 =A0 =A0 =A0ARM: tegra: Hide EMC scaling config behind ARCH_TEGRA
>
> are available in the git repository at:
>
> =A0git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra-2.6.git
> boards-for-next
>
> Olof Johansson (7):
> =A0 =A0 =A0ARM: tegra: add tegra_gpio_table and tegra_gpio_config
> =A0 =A0 =A0ARM: tegra: harmony: move over to tegra_gpio_config
> =A0 =A0 =A0ARM: tegra: common device resources
> =A0 =A0 =A0ARM: tegra: remove stale nvidia atag handler
> =A0 =A0 =A0ARM: tegra: harmony: register sdhci devices
> =A0 =A0 =A0ARM: tegra: harmony: fix pinmux for MMC slot
> =A0 =A0 =A0ARM: tegra: add seaboard, wario and kaen boards
>
> =A0arch/arm/mach-tegra/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
19 +
> =A0arch/arm/mach-tegra/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A04 +
> =A0arch/arm/mach-tegra/board-harmony-pinmux.c =A0| =A0 19 +-
> =A0arch/arm/mach-tegra/board-harmony.c =A0 =A0 =A0 =A0 | =A0 55 ++--
> =A0arch/arm/mach-tegra/board-seaboard-pinmux.c | =A0179 ++++++++++
> =A0arch/arm/mach-tegra/board-seaboard.c =A0 =A0 =A0 =A0| =A0196 +++++=
++++++
> =A0arch/arm/mach-tegra/board-seaboard.h =A0 =A0 =A0 =A0| =A0 38 ++
> =A0arch/arm/mach-tegra/devices.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0505=
 +++++++++++++++++++++++++++
> =A0arch/arm/mach-tegra/devices.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 46=
 +++
> =A0arch/arm/mach-tegra/gpio.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 14 +
> =A0arch/arm/mach-tegra/include/mach/gpio.h =A0 =A0 | =A0 =A07 +
> =A011 files changed, 1054 insertions(+), 28 deletions(-)
> =A0create mode 100644 arch/arm/mach-tegra/board-seaboard-pinmux.c
> =A0create mode 100644 arch/arm/mach-tegra/board-seaboard.c
> =A0create mode 100644 arch/arm/mach-tegra/board-seaboard.h
> =A0create mode 100644 arch/arm/mach-tegra/devices.c
> =A0create mode 100644 arch/arm/mach-tegra/devices.h
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Thanks, merged to tegra/for-next
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
