From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [GIT,PULL] Signed firmware for NVIDIA Maxwell 2 GPUs
Date: Tue, 23 Feb 2016 18:55:59 +0900
Message-ID: <56CC2CAF.8080102@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-firmware-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi linux-firmware maintainers,

The following changes since commit f66eccaab7d605d433cb82e389441b21ec99b40f:

   Update Intel OPA hfi1 firmware (2016-02-15 08:34:16 -0500)

are available in the git repository at:

   https://github.com/Gnurou/linux-firmware.git secboot

for you to fetch changes up to 8d1fd61a3723ab8cb6b7bfeb8be38e16282cc1ed:

   nvidia: Add GM20B signed firmware (2016-02-23 18:48:41 +0900)

These two patches add the NVIDIA-released firmwares necessary to enable 
rendering on desktop and mobile Maxwell 2 GPUs. Kernel support is ready 
to be merged once this pull request is officially accepted.

Thanks!

----------------------------------------------------------------
Alexandre Courbot (2):
       nvidia: Add GM200, GM204 and GM206 signed firmware
       nvidia: Add GM20B signed firmware

  WHENCE                             |  61 
++++++++++++++++++++++++++++++++++++-
  nvidia/gm200/acr/bl.bin            | Bin 0 -> 832 bytes
  nvidia/gm200/acr/ucode_load.bin    | Bin 0 -> 10144 bytes
  nvidia/gm200/acr/ucode_unload.bin  | Bin 0 -> 1440 bytes
  nvidia/gm200/gr/fecs_bl.bin        | Bin 0 -> 576 bytes
  nvidia/gm200/gr/fecs_data.bin      | Bin 0 -> 1968 bytes
  nvidia/gm200/gr/fecs_inst.bin      | Bin 0 -> 16271 bytes
  nvidia/gm200/gr/fecs_sig.bin       | Bin 0 -> 76 bytes
  nvidia/gm200/gr/gpccs_bl.bin       | Bin 0 -> 576 bytes
  nvidia/gm200/gr/gpccs_data.bin     | Bin 0 -> 2056 bytes
  nvidia/gm200/gr/gpccs_inst.bin     | Bin 0 -> 9768 bytes
  nvidia/gm200/gr/gpccs_sig.bin      | Bin 0 -> 76 bytes
  nvidia/gm200/gr/sw_bundle_init.bin | Bin 0 -> 7616 bytes
  nvidia/gm200/gr/sw_ctx.bin         | Bin 0 -> 5592 bytes
  nvidia/gm200/gr/sw_method_init.bin | Bin 0 -> 10800 bytes
  nvidia/gm200/gr/sw_nonctx.bin      | Bin 0 -> 1440 bytes
  nvidia/gm204/acr/bl.bin            |   1 +
  nvidia/gm204/acr/ucode_load.bin    |   1 +
  nvidia/gm204/acr/ucode_unload.bin  |   1 +
  nvidia/gm204/gr/fecs_bl.bin        |   1 +
  nvidia/gm204/gr/fecs_data.bin      | Bin 0 -> 1968 bytes
  nvidia/gm204/gr/fecs_inst.bin      |   1 +
  nvidia/gm204/gr/fecs_sig.bin       | Bin 0 -> 76 bytes
  nvidia/gm204/gr/gpccs_bl.bin       |   1 +
  nvidia/gm204/gr/gpccs_data.bin     | Bin 0 -> 2056 bytes
  nvidia/gm204/gr/gpccs_inst.bin     |   1 +
  nvidia/gm204/gr/gpccs_sig.bin      | Bin 0 -> 76 bytes
  nvidia/gm204/gr/sw_bundle_init.bin |   1 +
  nvidia/gm204/gr/sw_ctx.bin         |   1 +
  nvidia/gm204/gr/sw_method_init.bin |   1 +
  nvidia/gm204/gr/sw_nonctx.bin      |   1 +
  nvidia/gm206/acr/bl.bin            |   1 +
  nvidia/gm206/acr/ucode_load.bin    | Bin 0 -> 10144 bytes
  nvidia/gm206/acr/ucode_unload.bin  | Bin 0 -> 1440 bytes
  nvidia/gm206/gr/fecs_bl.bin        |   1 +
  nvidia/gm206/gr/fecs_data.bin      | Bin 0 -> 1968 bytes
  nvidia/gm206/gr/fecs_inst.bin      |   1 +
  nvidia/gm206/gr/fecs_sig.bin       | Bin 0 -> 76 bytes
  nvidia/gm206/gr/gpccs_bl.bin       |   1 +
  nvidia/gm206/gr/gpccs_data.bin     | Bin 0 -> 2056 bytes
  nvidia/gm206/gr/gpccs_inst.bin     |   1 +
  nvidia/gm206/gr/gpccs_sig.bin      | Bin 0 -> 76 bytes
  nvidia/gm206/gr/sw_bundle_init.bin |   1 +
  nvidia/gm206/gr/sw_ctx.bin         |   1 +
  nvidia/gm206/gr/sw_method_init.bin |   1 +
  nvidia/gm206/gr/sw_nonctx.bin      |   1 +
  nvidia/gm20b/acr/bl.bin            | Bin 0 -> 832 bytes
  nvidia/gm20b/acr/ucode_load.bin    | Bin 0 -> 18592 bytes
  nvidia/gm20b/gr/fecs_bl.bin        | Bin 0 -> 576 bytes
  nvidia/gm20b/gr/fecs_data.bin      | Bin 0 -> 1964 bytes
  nvidia/gm20b/gr/fecs_inst.bin      | Bin 0 -> 17021 bytes
  nvidia/gm20b/gr/fecs_sig.bin       | Bin 0 -> 76 bytes
  nvidia/gm20b/gr/gpccs_data.bin     | Bin 0 -> 2068 bytes
  nvidia/gm20b/gr/gpccs_inst.bin     | Bin 0 -> 9964 bytes
  nvidia/gm20b/gr/sw_bundle_init.bin | Bin 0 -> 7616 bytes
  nvidia/gm20b/gr/sw_ctx.bin         | Bin 0 -> 5448 bytes
  nvidia/gm20b/gr/sw_method_init.bin |   1 +
  nvidia/gm20b/gr/sw_nonctx.bin      | Bin 0 -> 1432 bytes
  58 files changed, 81 insertions(+), 1 deletion(-)
  create mode 100644 nvidia/gm200/acr/bl.bin
  create mode 100644 nvidia/gm200/acr/ucode_load.bin
  create mode 100644 nvidia/gm200/acr/ucode_unload.bin
  create mode 100644 nvidia/gm200/gr/fecs_bl.bin
  create mode 100644 nvidia/gm200/gr/fecs_data.bin
  create mode 100644 nvidia/gm200/gr/fecs_inst.bin
  create mode 100644 nvidia/gm200/gr/fecs_sig.bin
  create mode 100644 nvidia/gm200/gr/gpccs_bl.bin
  create mode 100644 nvidia/gm200/gr/gpccs_data.bin
  create mode 100644 nvidia/gm200/gr/gpccs_inst.bin
  create mode 100644 nvidia/gm200/gr/gpccs_sig.bin
  create mode 100644 nvidia/gm200/gr/sw_bundle_init.bin
  create mode 100644 nvidia/gm200/gr/sw_ctx.bin
  create mode 100644 nvidia/gm200/gr/sw_method_init.bin
  create mode 100644 nvidia/gm200/gr/sw_nonctx.bin
  create mode 120000 nvidia/gm204/acr/bl.bin
  create mode 120000 nvidia/gm204/acr/ucode_load.bin
  create mode 120000 nvidia/gm204/acr/ucode_unload.bin
  create mode 120000 nvidia/gm204/gr/fecs_bl.bin
  create mode 100644 nvidia/gm204/gr/fecs_data.bin
  create mode 120000 nvidia/gm204/gr/fecs_inst.bin
  create mode 100644 nvidia/gm204/gr/fecs_sig.bin
  create mode 120000 nvidia/gm204/gr/gpccs_bl.bin
  create mode 100644 nvidia/gm204/gr/gpccs_data.bin
  create mode 120000 nvidia/gm204/gr/gpccs_inst.bin
  create mode 100644 nvidia/gm204/gr/gpccs_sig.bin
  create mode 120000 nvidia/gm204/gr/sw_bundle_init.bin
  create mode 120000 nvidia/gm204/gr/sw_ctx.bin
  create mode 120000 nvidia/gm204/gr/sw_method_init.bin
  create mode 120000 nvidia/gm204/gr/sw_nonctx.bin
  create mode 120000 nvidia/gm206/acr/bl.bin
  create mode 100644 nvidia/gm206/acr/ucode_load.bin
  create mode 100644 nvidia/gm206/acr/ucode_unload.bin
  create mode 120000 nvidia/gm206/gr/fecs_bl.bin
  create mode 100644 nvidia/gm206/gr/fecs_data.bin
  create mode 120000 nvidia/gm206/gr/fecs_inst.bin
  create mode 100644 nvidia/gm206/gr/fecs_sig.bin
  create mode 120000 nvidia/gm206/gr/gpccs_bl.bin
  create mode 100644 nvidia/gm206/gr/gpccs_data.bin
  create mode 120000 nvidia/gm206/gr/gpccs_inst.bin
  create mode 100644 nvidia/gm206/gr/gpccs_sig.bin
  create mode 120000 nvidia/gm206/gr/sw_bundle_init.bin
  create mode 120000 nvidia/gm206/gr/sw_ctx.bin
  create mode 120000 nvidia/gm206/gr/sw_method_init.bin
  create mode 120000 nvidia/gm206/gr/sw_nonctx.bin
  create mode 100644 nvidia/gm20b/acr/bl.bin
  create mode 100644 nvidia/gm20b/acr/ucode_load.bin
  create mode 100644 nvidia/gm20b/gr/fecs_bl.bin
  create mode 100644 nvidia/gm20b/gr/fecs_data.bin
  create mode 100644 nvidia/gm20b/gr/fecs_inst.bin
  create mode 100644 nvidia/gm20b/gr/fecs_sig.bin
  create mode 100644 nvidia/gm20b/gr/gpccs_data.bin
  create mode 100644 nvidia/gm20b/gr/gpccs_inst.bin
  create mode 100644 nvidia/gm20b/gr/sw_bundle_init.bin
  create mode 100644 nvidia/gm20b/gr/sw_ctx.bin
  create mode 120000 nvidia/gm20b/gr/sw_method_init.bin
  create mode 100644 nvidia/gm20b/gr/sw_nonctx.bin
