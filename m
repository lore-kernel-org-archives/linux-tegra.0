From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL] ARM: tegra: Include assembler.h in sleep.S to fix build
 break
Date: Mon, 26 Mar 2012 10:19:47 -0600
Message-ID: <4F709723.4080206@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Arnd, Olof,

This pull request depends on the merge of:

git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git
devel/io-cleanup
(specifically 6f6f6a7 ARM: create a common IOMEM definition)

and:

git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git for-3.4/soc
(specifically c76fcc8 ARM: tegra: assembler code for LP3)

and is based on a local branch that merges the two branches above.

The following changes since commit 1ad105fc77e61f9dd7a272659a248e2979fdb893:
  Stephen Warren (1):
        Merge remote branch 'remotes/korg_olof_tegra/for-3.4/soc' into
for-3.4/fixes-for-io-cleanup

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
for-3.4/fixes-for-io-cleanup

Stephen Warren (1):
      ARM: tegra: Include assembler.h in sleep.S to fix build break

 arch/arm/mach-tegra/sleep.S |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)
