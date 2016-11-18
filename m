From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 3/10] reset: Add Tegra BPMP reset driver
Date: Fri, 18 Nov 2016 17:17:12 +0100
Message-ID: <20161118161719.24153-3-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.10-reset

for you to fetch changes up to dc606c5205536a828c17bd96f06559dafaf75fb7:

  reset: Add Tegra BPMP reset driver (2016-11-18 14:34:56 +0100)

Thanks,
Thierry

----------------------------------------------------------------
reset: Add Tegra BPMP reset driver

This contains a patch which implements a reset driver using the services
provided by the BPMP firmware (via the MRQ_RESET request).

----------------------------------------------------------------
Dan Carpenter (1):
      mailbox: tegra-hsp: Use after free in tegra_hsp_remove_doorbells()

Joseph Lo (3):
      soc/tegra: Add Tegra186 support
      dt-bindings: mailbox: Add Tegra HSP binding
      dt-bindings: firmware: Add bindings for Tegra BPMP

Stephen Warren (2):
      dt-bindings: Add power domains to Tegra BPMP firmware
      dt-bindings: firmware: Allow child nodes inside the Tegra BPMP

Thierry Reding (7):
      Merge branch 'for-4.10/soc' into for-4.10/mailbox
      mailbox: Add Tegra HSP driver
      Merge branch 'for-4.10/mailbox' into for-4.10/firmware
      firmware: tegra: Add IVC library
      firmware: tegra: Add BPMP support
      Merge branch 'for-4.10/firmware' into for-4.10/reset
      reset: Add Tegra BPMP reset driver

 .../bindings/firmware/nvidia,tegra186-bpmp.txt     |  108 ++
 .../bindings/mailbox/nvidia,tegra186-hsp.txt       |   52 +
 drivers/firmware/Kconfig                           |    1 +
 drivers/firmware/Makefile                          |    1 +
 drivers/firmware/tegra/Kconfig                     |   25 +
 drivers/firmware/tegra/Makefile                    |    2 +
 drivers/firmware/tegra/bpmp.c                      |  868 +++++++++++
 drivers/firmware/tegra/ivc.c                       |  695 +++++++++
 drivers/mailbox/Kconfig                            |    9 +
 drivers/mailbox/Makefile                           |    2 +
 drivers/mailbox/tegra-hsp.c                        |  479 ++++++
 drivers/reset/Kconfig                              |    1 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/tegra/Kconfig                        |    2 +
 drivers/reset/tegra/Makefile                       |    1 +
 drivers/reset/tegra/reset-bpmp.c                   |   71 +
 drivers/soc/tegra/Kconfig                          |   14 +
 include/dt-bindings/clock/tegra186-clock.h         |  940 ++++++++++++
 include/dt-bindings/mailbox/tegra186-hsp.h         |   24 +
 include/dt-bindings/power/tegra186-powergate.h     |   39 +
 include/dt-bindings/reset/tegra186-reset.h         |  217 +++
 include/soc/tegra/bpmp-abi.h                       | 1601 ++++++++++++++++++++
 include/soc/tegra/bpmp.h                           |  141 ++
 include/soc/tegra/ivc.h                            |  109 ++
 24 files changed, 5403 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt
 create mode 100644 drivers/firmware/tegra/Kconfig
 create mode 100644 drivers/firmware/tegra/Makefile
 create mode 100644 drivers/firmware/tegra/bpmp.c
 create mode 100644 drivers/firmware/tegra/ivc.c
 create mode 100644 drivers/mailbox/tegra-hsp.c
 create mode 100644 drivers/reset/tegra/Kconfig
 create mode 100644 drivers/reset/tegra/Makefile
 create mode 100644 drivers/reset/tegra/reset-bpmp.c
 create mode 100644 include/dt-bindings/clock/tegra186-clock.h
 create mode 100644 include/dt-bindings/mailbox/tegra186-hsp.h
 create mode 100644 include/dt-bindings/power/tegra186-powergate.h
 create mode 100644 include/dt-bindings/reset/tegra186-reset.h
 create mode 100644 include/soc/tegra/bpmp-abi.h
 create mode 100644 include/soc/tegra/bpmp.h
 create mode 100644 include/soc/tegra/ivc.h
