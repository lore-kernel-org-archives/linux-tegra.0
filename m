From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [GIT PULL v3 0/3] TrimSlice updates for 3.1
Date: Sun, 10 Jul 2011 15:11:56 -0700
Message-ID: <CAMbhsRQQf3VpxQ+oD_HJJ+2s+ciBQ+AgjHNYw1voPUMAYNaTJQ@mail.gmail.com>
References: <cover.1309955711.git.mike@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1309955711.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 6, 2011 at 11:04 PM, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org> wr=
ote:
> Hi Colin,
> Please consider pulling TrimSlice updates for 3.1 merge window.
> These patches add registration of i2c, audio and USB devices.
>
> v3 changes:
> - rebased on top of current Linus tree
>
> v2 changes:
> - update CDEV1 pinmux as per Stephen suggestion
> - use GPIO table for USB-related GPIOs
>
> The following changes since commit a2fa83faf47b514ab947cea916d3691b66=
525073:
>
> =A0Merge branch 'usb-linus' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/gregkh/usb-2.6 (2011-07-05 20:57:45 -0700)
>
> are available in the git repository at:
>
> =A0git://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux-tegra.git=
 trimslice/upstream
>
> Mike Rapoport (3):
> =A0 =A0 =A0ARM: tegra: trimslice: register i2c busses and devices
> =A0 =A0 =A0ARM: tegra: trimslice: add audio devices and clocks
> =A0 =A0 =A0ARM: tegra: trimslice: enable USB ports
>
> =A0arch/arm/mach-tegra/board-trimslice-pinmux.c | =A0 =A07 ++-
> =A0arch/arm/mach-tegra/board-trimslice.c =A0 =A0 =A0 =A0| =A0 92 ++++=
++++++++++++++++++++++
> =A0arch/arm/mach-tegra/board-trimslice.h =A0 =A0 =A0 =A0| =A0 =A03 +
> =A03 files changed, 100 insertions(+), 2 deletions(-)
>

I pushed this series to for-next.

I have some cleanup patches that go on top to reduce some of the
duplicate platform data added by trimslice and paz00, I'd appreciate a
tested-by once I post those.
