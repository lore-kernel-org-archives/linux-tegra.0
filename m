From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [GIT PULL 0/6] Tegra branches for 3.4
Date: Sun,  4 Mar 2012 12:13:56 -0800
Message-ID: <1330892042-32065-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Arnd,

Below are the 6 pull requests for Tegra platforms for 3.4. This is also
likely my last merge request for tegra material (besides possibly some
stray patches between now and the merge window), since I am handing off
main maintainership to Stephen Warren for the next merge window.

Each branch is documented in the tag (they are all tag pull requests), as
well as in the emails below. Nothing too controversial.

There are a handful of trivial merge conflicts between the branches,
mostly to the Makefile due to context chances. I also had a local
issue where git auto-resolved the merge of the T30 SMP branch into
my for-next branch, and did NOT remove the mach/system.h include at
arch/arm/mach-tegra/common.c. This results in a build break since it
has been removed in rmk/for-armsoc. So just a heads up in case you see
the same thing.


-Olof
