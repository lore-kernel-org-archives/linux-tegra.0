From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 1/6] bus: NVIDIA Tegra ACONNECT support
Date: Fri,  1 Jul 2016 16:50:21 +0200
Message-ID: <20160701145026.25760-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.8-bus

for you to fetch changes up to 46a88534afb596eb4d9de07ddde778d0e9aa0e3a:

  bus: Add support for Tegra ACONNECT (2016-07-01 16:35:43 +0200)

Thanks,
Thierry

----------------------------------------------------------------
bus: NVIDIA Tegra ACONNECT support

Adds support for the Tegra ACONNECT bus that's used to access the APE
(audio processing engine) on Tegra X1.

----------------------------------------------------------------
Jon Hunter (2):
      dt-bindings: bus: Add documentation for Tegra210 ACONNECT
      bus: Add support for Tegra ACONNECT

 .../bindings/bus/nvidia,tegra210-aconnect.txt      |  45 +++++++++
 drivers/bus/Kconfig                                |  13 +++
 drivers/bus/Makefile                               |   1 +
 drivers/bus/tegra-aconnect.c                       | 112 +++++++++++++++++++++
 4 files changed, 171 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
 create mode 100644 drivers/bus/tegra-aconnect.c
