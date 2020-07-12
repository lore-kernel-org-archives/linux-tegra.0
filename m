From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/5] firmware: tegra: Add support for in-band debug
Date: Sun, 12 Jul 2020 11:01:13 +0100
Message-ID: <20200712100118.13343-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series adds support for in-band debug messaging for the BPMP and
updates the BPMP ABI to align with the latest version.

Jon Hunter (4):
  firmware: tegra: Use consistent return variable name
  firmware: tegra: Prepare for supporting in-band debugfs
  firmware: tegra: Add support for in-band debug
  firmware: tegra: Update BPMP ABI

Timo Alho (1):
  firmware: tegra: add return code checks and increase debugfs size

 drivers/firmware/tegra/bpmp-debugfs.c | 436 ++++++++++--
 drivers/firmware/tegra/bpmp.c         |   6 +-
 include/soc/tegra/bpmp-abi.h          | 913 ++++++++++++++++++--------
 3 files changed, 1038 insertions(+), 317 deletions(-)

-- 
2.17.1
