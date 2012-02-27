From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: uncompress.h: Don't depend on kernel headers
Date: Mon, 27 Feb 2012 13:48:12 -0800
Message-ID: <CAOesGMj7Cz-44Z2C6ZA4RwdFFKLXLornuN368Y9XjCLFCs07eg@mail.gmail.com>
References: <1330378039-21030-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330378039-21030-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 27, 2012 at 1:27 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> This fixes the following compile error:
>
> =A0CC =A0 =A0 =A0arch/arm/boot/compressed/misc.o
> In file included from arch/arm/boot/compressed/misc.c:28:0:
> arch/arm/mach-tegra/include/mach/uncompress.h: In function 'arch_deco=
mp_setup':
> arch/arm/mach-tegra/include/mach/uncompress.h:125:2: error: implicit =
declaration of function 'BUILD_BUG_ON_ZERO' [-Werror=3Dimplicit-functio=
n-declaration]
> cc1: some warnings being treated as errors
>
> This is due to use of the ARRAY_SIZE() macro. Typically, this would b=
e
> solved by including <linux/bug.h>, but the compressor code isn't part=
 of
> the kernel, and so should not include kernel headers. Instead, define
> the few macros the code uses directly, and in a way that doesn't depe=
nd
> on <linux/bug.h>.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks, applied on for-3.4/soc-drivers, since that's the branch the
linux/kernel.h include was introduced on.

We're losing bisectability over about 9 commits unless I rebase the
branch to squash it in, but there might be downstream users of it so I
don't want to do that.


-Olof
