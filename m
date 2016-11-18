From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 6/10] dt-bindings: Cleanups and additions for v4.10-rc1
Date: Fri, 18 Nov 2016 17:17:15 +0100
Message-ID: <20161118161719.24153-6-thierry.reding@gmail.com>
References: <20161118161719.24153-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161118161719.24153-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.10-dt-bindings

for you to fetch changes up to 2e002bdedcdcbd6a708f5698a09eb32df568efb8:

  dt-bindings: Add documentation for Tegra186 Denver (2016-11-17 18:09:05 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Cleanups and additions for v4.10-rc1

Contains two small patches, one fixing a typo and the other adding the
compatible string for the Denver CPUs found on the new Tegra186 SoCs.

----------------------------------------------------------------
Mirza Krak (1):
      serial: tegra20-hsuart: Fix typo in dmas DT binding description

Thierry Reding (1):
      dt-bindings: Add documentation for Tegra186 Denver

 Documentation/devicetree/bindings/arm/cpus.txt                     | 1 +
 Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.txt | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
