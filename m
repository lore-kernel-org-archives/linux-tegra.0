From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] Add initial support for the Toshiba AC100/Dynabook AZ netbook
Date: Sun, 6 Mar 2011 08:34:07 -0800
Message-ID: <AANLkTik9v=gdtoTe_hza9onpXRfRG4_=hZuxVsgY+UVE@mail.gmail.com>
References: <1299421906-7366-1-git-send-email-marvin24@gmx.de>
	<1299421906-7366-2-git-send-email-marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1299421906-7366-2-git-send-email-marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Mar 6, 2011 at 6:31 AM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A05 =
+
> =A0arch/arm/mach-tegra/Makefile =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A03 +
> =A0arch/arm/mach-tegra/board-paz00-pinmux.c | =A0157 ++++++++++++++++=
++++++++++++++
> =A0arch/arm/mach-tegra/board-paz00.c =A0 =A0 =A0 =A0| =A0128 ++++++++=
++++++++++++++++
> =A0arch/arm/mach-tegra/board-paz00.h =A0 =A0 =A0 =A0| =A0 22 ++++
> =A05 files changed, 315 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-tegra/board-paz00-pinmux.c
> =A0create mode 100644 arch/arm/mach-tegra/board-paz00.c
> =A0create mode 100644 arch/arm/mach-tegra/board-paz00.h

The patch looks fine, but can you add a short patch description?
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
