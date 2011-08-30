From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH REPOST 0/3] i2c: tegra: Outstanding patches
Date: Tue, 30 Aug 2011 11:46:07 -0600
Message-ID: <1314726370-8193-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

For convenience, here's a repost of the outstanding patches for the Tegra
I2C driver.

Doug Anderson (1):
  i2c: tegra: fix possible race condition after tx

John Bonesio (1):
  i2c: Tegra: Add of_match_table

Mike Rapoport (1):
  i2c: i2c-tegra: add I2C_FUNC_SMBUS_EMUL

 drivers/i2c/busses/i2c-tegra.c |   60 ++++++++++++++++++++++++++++++----------
 1 files changed, 45 insertions(+), 15 deletions(-)
