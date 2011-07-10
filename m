From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/6 V2] ARM: tegra: paz00 patches for 2.6.40
Date: Sun, 10 Jul 2011 15:14:33 -0700
Message-ID: <CAMbhsRSH2iyv0_1seVtwSQ7AbHmPbz+VqSVkhfLgsNA8+dOwJA@mail.gmail.com>
References: <1305806910-3903-1-git-send-email-marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1305806910-3903-1-git-send-email-marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 19, 2011 at 5:08 AM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
> Hi Collin, Olof,
>
> the following patches are intended for 2.6.40 merge. They are mostly =
similar
> to the TrimSlice patches sent by Mike a few days ago.
>
> We are still stuggling with the sound codec (alc5632) and the nvec, s=
o there
> is nothing to connect to the i2c yet. On the other hand, I'm wonderin=
g what's
> up with the atd7461 included in most (all?) boards. It's compatible w=
ith lm90,
> but the driver will never register because of the wrong name.
>
> May I ask if there is some timeline for framebuffer integration? A ne=
tbook
> without display is of not much use (ok, same holds for keyboard/mouse=
).
>
> Thanks!
>
> Marc
>
> Changes in V2:
> =A0 =A0- add some more blurb to the commit messages
> =A0 =A0- change the machine to some neater name (patch 5)
> =A0 =A0- enable the wifi board during boot (patch 6)
>
>
> Marc Dietrich (6):
> =A0ARM: tegra: paz00: whitespace cleanup
> =A0ARM: tegra: paz00: register i2c busses
> =A0ARM: tegra: paz00: enable usb ports
> =A0ARM: tegra: paz00: cleanup sdhci ports
> =A0ARM: tegra: paz00: change the machine name
> =A0ARM: tegra: paz00: enable wifi card
>
> =A0arch/arm/mach-tegra/board-paz00-pinmux.c | =A0 12 ++--
> =A0arch/arm/mach-tegra/board-paz00.c =A0 =A0 =A0 =A0| =A0 96 ++++++++=
++++++++++++++++++----
> =A0arch/arm/mach-tegra/board-paz00.h =A0 =A0 =A0 =A0| =A0 17 ++++--
> =A03 files changed, 102 insertions(+), 23 deletions(-)
>
> --
> 1.7.4.2
>
>

I pushed this series to for-next, except for patch 6 "ARM: tegra:
paz00: enable wifi card".

I have some cleanup patches that go on top to reduce some of the
duplicate platform data added by trimslice and paz00, I'd appreciate a
tested-by once I post those.
