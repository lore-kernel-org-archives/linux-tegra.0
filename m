From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] i2c: tegra: Further fixes from ChromeOS
Date: Mon, 25 Apr 2011 15:32:24 -0600
Message-ID: <1303767147-17493-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The ChromeOS kernel has been carrying the following fixes for a while now.
I have tested these (plus the other fix I recently sent out) on Harmony,
non-clamshell Seaboard, and clamshell Seaboard, all without any observed
issue over 5 short reboot and "speaker-test -c 2" test cycles.

Erik Gilling (1):
  i2c: tegra: fix repeated start handling

Jay Cheng (1):
  i2c: tegra: Add de-bounce cycles.

Todd Poynor (1):
  i2c: tegra: recover from spurious interrupt storm

 drivers/i2c/busses/i2c-tegra.c |   34 +++++++++++++++++++++++++++++-----
 1 files changed, 29 insertions(+), 5 deletions(-)
