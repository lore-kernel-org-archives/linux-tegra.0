From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL v2 2/4] ARM: tegra: Device tree changes for v3.19
Date: Wed, 26 Nov 2014 10:10:53 +0100
Message-ID: <1416993053-3630-2-git-send-email-thierry.reding@gmail.com>
References: <1416570832-6220-2-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416570832-6220-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 37d21f8918f2aa2289036cc778ee188951e53288:

  memory: Add NVIDIA Tegra memory controller support (2014-11-26 09:45:02 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-3.19-dt-rebased

for you to fetch changes up to 1a4a3341aef67db63b6ac46da3e40b5c5079a851:

  ARM: tegra: Enable IOMMU for display controllers on Tegra124 (2014-11-26 09:49:43 +0100)

Note that this pulls in the for-3.19/iommu branch (tegra-for-3.19-iommu-
rebased tag) to resolve the dependency between the IOMMU driver addition
and the DT changes that include dt-bindings/memory/tegra*-mc.h headers.

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v3.19

The bulk of these changes add memory controller nodes for Tegra30,
Tegra114 and Tegra124. The memory controller implements an IOMMU that
the display controllers are attached to. This allows them to scan out
physically non-contiguous framebuffers and removes one of the primary
users of CMA.

The only other change adds a new MIPI pad control bank to the pin
controller on Tegra124. The corresponding driver patch for this went
into v3.18 as:

        3ccc11f6b82c pinctrl: tegra: Add MIPI pad control

----------------------------------------------------------------
Sean Paul (1):
      ARM: tegra: Add APB_MISC_GP as a MIPI pad control bank

Thierry Reding (7):
      Merge branch 'for-3.19/iommu' into for-3.19/dt
      ARM: tegra: Add memory controller support for Tegra30
      ARM: tegra: Add memory controller support for Tegra114
      ARM: tegra: Add memory controller support for Tegra124
      ARM: tegra: Enable IOMMU for display controllers on Tegra30
      ARM: tegra: Enable IOMMU for display controllers on Tegra114
      ARM: tegra: Enable IOMMU for display controllers on Tegra124

 arch/arm/boot/dts/tegra114.dtsi | 23 ++++++++++++++---------
 arch/arm/boot/dts/tegra124.dtsi | 19 ++++++++++++++++++-
 arch/arm/boot/dts/tegra30.dtsi  | 25 +++++++++++--------------
 3 files changed, 43 insertions(+), 24 deletions(-)
