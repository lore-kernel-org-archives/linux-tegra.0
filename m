From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL] arm/tegra fixes for 3.2-rc
Date: Wed, 9 Nov 2011 16:53:21 -0800
Message-ID: <CAOesGMjSozfya6fP6o9aqsj7MQfCoi11tgZSHB66p9O87xwv3g@mail.gmail.com>
References: <CAOesGMip77Y7PMiCRginfZDoGe9k3jj33adP1SkJfNO1BBbrig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMip77Y7PMiCRginfZDoGe9k3jj33adP1SkJfNO1BBbrig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Since Arnd is out, I'll collect fixes for 3.2-rc2 in arm-soc, and
pulled this one in there.

(I know, silly to send myself a pull request, but I wanted to post the
contents on the list).


-Olof

On Wed, Nov 9, 2011 at 1:34 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> Hi,
>
> A couple of fixes for 3.2-rc below. Nothing controversial.
>
>
> Thanks!
>
> -Olof
>
> The following changes since commit 1ea6b8f48918282bdca0b32a34095504ee=
65bab5:
>
> =A0Linux 3.2-rc1 (2011-11-07 16:16:02 -0800)
>
> are available in the git repository at:
> =A0git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git for-3=
=2E2/fixes
>
> Stephen Warren (2):
> =A0 =A0 =A0arm/tegra: Don't create duplicate gpio and pinmux devices
> =A0 =A0 =A0arm/dt: Fix ventana SDHCI power-gpios
>
> Yufeng Shen (1):
> =A0 =A0 =A0arm/tegra: enable headphone detection gpio on seaboard
>
> =A0arch/arm/boot/dts/tegra-ventana.dts =A0 =A0 =A0 =A0 =A0| =A0 =A03 =
+--
> =A0arch/arm/mach-tegra/board-dt.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
3 +++++++------
> =A0arch/arm/mach-tegra/board-harmony-pinmux.c =A0 | =A0 =A06 +++++-
> =A0arch/arm/mach-tegra/board-paz00-pinmux.c =A0 =A0 | =A0 =A06 +++++-
> =A0arch/arm/mach-tegra/board-seaboard-pinmux.c =A0| =A0 =A06 +++++-
> =A0arch/arm/mach-tegra/board-trimslice-pinmux.c | =A0 =A05 ++++-
> =A06 files changed, 27 insertions(+), 12 deletions(-)
>
