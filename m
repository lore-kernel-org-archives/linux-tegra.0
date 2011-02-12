From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 00/22] Updates for Tegra support in 2.6.39
Date: Sat, 12 Feb 2011 00:52:14 -0800
Message-ID: <AANLkTin1UOAwBuGC0vaDutCrWY2x1+qK9=b50k43a2K0@mail.gmail.com>
References: <1297320204-31882-1-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1297320204-31882-1-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 9, 2011 at 10:43 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote=
:
> This is a repost of the same series with the suspend and
> idle support dropped for now while the necessary changes
> to the gic, l2x0, and init notifiers are discussed. =A0If
> there are no further comments, I will push these to
> tegra/for-next.
>
> =A0arch/arm/configs/tegra_defconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
123 +++++++++++
> =A0arch/arm/mach-tegra/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A01 +
> =A0arch/arm/mach-tegra/board.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 +
> =A0arch/arm/mach-tegra/common.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 17 ++-
> =A0arch/arm/mach-tegra/cpu-tegra.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 75 ++++++--
> =A0arch/arm/mach-tegra/dma.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0198 ++++++++++--------
> =A0arch/arm/mach-tegra/gpio.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 +
> =A0arch/arm/mach-tegra/include/mach/debug-macro.S | =A0 25 +--
> =A0arch/arm/mach-tegra/include/mach/iomap.h =A0 =A0 =A0 | =A0 69 ++++=
+-
> =A0arch/arm/mach-tegra/include/mach/irqs.h =A0 =A0 =A0 =A0| =A0 14 +-
> =A0arch/arm/mach-tegra/include/mach/legacy_irq.h =A0| =A0 =A04 +
> =A0arch/arm/mach-tegra/include/mach/pinmux-t2.h =A0 | =A0 10 +
> =A0arch/arm/mach-tegra/include/mach/powergate.h =A0 | =A0 40 ++++
> =A0arch/arm/mach-tegra/include/mach/suspend.h =A0 =A0 | =A0 38 ++++
> =A0arch/arm/mach-tegra/include/mach/system.h =A0 =A0 =A0| =A0 10 +-
> =A0arch/arm/mach-tegra/include/mach/uncompress.h =A0| =A0 18 +--
> =A0arch/arm/mach-tegra/irq.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0186 ++++++++---------
> =A0arch/arm/mach-tegra/legacy_irq.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
109 ++++++++++-
> =A0arch/arm/mach-tegra/pinmux-t2-tables.c =A0 =A0 =A0 =A0 | =A0 26 ++=
-
> =A0arch/arm/mach-tegra/powergate.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
212 +++++++++++++++++++
> =A0arch/arm/mach-tegra/tegra2_clocks.c =A0 =A0 =A0 =A0 =A0 =A0| =A026=
4 ++++++++++++++++++++++--
> =A0arch/arm/mach-tegra/timer.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 61 ++++++-
> =A022 files changed, 1212 insertions(+), 291 deletions(-)
>

I pushed this patch set to tegra/for-next, with minor fixups from
Stephen Warren.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
