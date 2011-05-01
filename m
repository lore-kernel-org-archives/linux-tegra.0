From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/4] Tegra irq cleanups
Date: Sun, 1 May 2011 14:34:33 -0700
Message-ID: <BANLkTimjVFuww9Gx=J34+KTb7ortdm616g@mail.gmail.com>
References: <1304284213-11950-1-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1304284213-11950-1-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lakml <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, May 1, 2011 at 2:10 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote:
> This patch series cleans up the Tegra irq subsystem, and allows
> the GIC to be switched to the fasteoi handler. =A0The first three
> patches have no dependencies on any other trees. =A0Patch 4 should
> only go in at the same time as Will Deacon's fasteoi patches,
> and could be squashed into his patch.
>
> As part of this series, power management support is removed from
> the Tegra irq subsystem. =A0PM support will be added back in a
> future patch set along with PM support for the rest of the
> platform.
>
> Colin Cross (4):
> =A0 =A0 =A0ARM: tegra: irq: convert to gic arch extensions
> =A0 =A0 =A0ARM: tegra: irq: Remove PM support
> =A0 =A0 =A0ARM: tegra: irq: Move legacy_irq.c into irq.c
> =A0 =A0 =A0ARM: tegra: irq: Replace tegra_ack with tegra_eoi
>
> =A0arch/arm/mach-tegra/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
> =A0arch/arm/mach-tegra/include/mach/legacy_irq.h | =A0 35 ----
> =A0arch/arm/mach-tegra/irq.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0181 +++++++++------------
> =A0arch/arm/mach-tegra/legacy_irq.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A02=
15 -------------------------
> =A04 files changed, 77 insertions(+), 356 deletions(-)
> =A0delete mode 100644 arch/arm/mach-tegra/include/mach/legacy_irq.h
> =A0delete mode 100644 arch/arm/mach-tegra/legacy_irq.c
>

Sorry Marc, forgot to CC you on this patch set.

I just noticed that you kept both tegra_ack as well as tegra_eoi in
your patch set.  That seems like a reasonable way to avoid merge order
problems between Will's fasteoi patches and these patches, at least in
one direction, so I'll add that in v2 (only affects the last patch in
the series).
