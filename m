From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: Tegra: Enable audio (boards-for-next)
Date: Mon, 7 Mar 2011 00:31:08 -0800
Message-ID: <AANLkTimPGLamT-UL5u5WtLTk9R_1sj5yMf3D6LK3yqwV@mail.gmail.com>
References: <1299303869-7827-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1299303869-7827-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Thanks, Stephen, I have applied these (pull request for Colin going
out shortly).

See my 3-patch series for my plan on how to handle the two additional
patches in the other series, i.e. stage them now for a merge during
the later part of the merge window.


-Olof

On Fri, Mar 4, 2011 at 9:44 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> This is the subset of patches to enable audio on Tegra Harmony that c=
an be
> immediately applied to Olof's boards-for-next branch.
>
> Stephen Warren (3):
> =A0ARM: Tegra: Add devices.c entries for audio
> =A0ARM: Tegra: Create defines for SD-related GPIO names
> =A0ARM: tegra: Harmony: Beginnings of audio support
>
> =A0arch/arm/mach-tegra/board-harmony-pinmux.c =A0| =A0 28 ++++++-----
> =A0arch/arm/mach-tegra/board-harmony.c =A0 =A0 =A0 =A0 | =A0 38 +++++=
+++++++--
> =A0arch/arm/mach-tegra/board-harmony.h =A0 =A0 =A0 =A0 | =A0 14 +++++
> =A0arch/arm/mach-tegra/board-seaboard-pinmux.c | =A0 10 ++--
> =A0arch/arm/mach-tegra/board-seaboard.c =A0 =A0 =A0 =A0| =A0 =A06 +-
> =A0arch/arm/mach-tegra/board-seaboard.h =A0 =A0 =A0 =A0| =A0 =A03 +
> =A0arch/arm/mach-tegra/devices.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 70=
 +++++++++++++++++++++++++++
> =A0arch/arm/mach-tegra/devices.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
4 ++
> =A0arch/arm/mach-tegra/include/mach/iomap.h =A0 =A0| =A0 =A03 +
> =A09 files changed, 150 insertions(+), 26 deletions(-)
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
