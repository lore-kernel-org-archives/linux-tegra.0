From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [GIT PULL] Firmware for NVIDIA GK20A mobile GPU
Date: Thu, 16 Jul 2015 16:07:39 +0900
Message-ID: <55A7583B.10806@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-firmware-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi linux-firmware maintainers,

The following changes since commit 696403047a940c425c93cb8da1efcec6ffda0b6e:

   linux-firmware: Add firmware file for Intel Bluetooth 8260 
(2015-07-14 17:05:20 -0400)

are available in the git repository at:

   https://github.com/Gnurou/linux-firmware.git master

for you to fetch changes up to 899ebcb6812681b91cf2dfd390574b478c612442:

   firmware: tegra: add GK20A FECS/GPCCS firmware (2015-07-16 15:59:03 
+0900)

The first patch also strips a few lines that seem to remain from a git 
merge or rebase conflict.

----------------------------------------------------------------
Alexandre Courbot (2):
       Remove patch conflict remains
       firmware: tegra: add GK20A FECS/GPCCS firmware

  WHENCE                          |  18 ++++++++++++++++--
  nvidia/gk20a/fecs_data.bin      | Bin 0 -> 1920 bytes
  nvidia/gk20a/fecs_inst.bin      | Bin 0 -> 15356 bytes
  nvidia/gk20a/gpccs_data.bin     | Bin 0 -> 1800 bytes
  nvidia/gk20a/gpccs_inst.bin     | Bin 0 -> 8171 bytes
  nvidia/gk20a/sw_bundle_init.bin | Bin 0 -> 6696 bytes
  nvidia/gk20a/sw_ctx.bin         | Bin 0 -> 4464 bytes
  nvidia/gk20a/sw_method_init.bin | Bin 0 -> 10304 bytes
  nvidia/gk20a/sw_nonctx.bin      | Bin 0 -> 1360 bytes
  9 files changed, 16 insertions(+), 2 deletions(-)
  create mode 100644 nvidia/gk20a/fecs_data.bin
  create mode 100644 nvidia/gk20a/fecs_inst.bin
  create mode 100644 nvidia/gk20a/gpccs_data.bin
  create mode 100644 nvidia/gk20a/gpccs_inst.bin
  create mode 100644 nvidia/gk20a/sw_bundle_init.bin
  create mode 100644 nvidia/gk20a/sw_ctx.bin
  create mode 100644 nvidia/gk20a/sw_method_init.bin
  create mode 100644 nvidia/gk20a/sw_nonctx.bin
