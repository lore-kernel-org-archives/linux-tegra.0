From: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Subject: [PATCH 0/2] Bugfixes for Tegra memory controllers.
Date: Mon, 10 Jun 2013 12:13:42 +0300
Message-ID: <1370855624-30564-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Tuomas Tynkkynen <ttynkkynen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi,

Here's two simple bugfixes for the Tegra memory controllers.

Tuomas Tynkkynen (2):
  memory: tegra20-mc: Fix hang in IRQ handler.
  memory: tegra30-mc: Fix IRQ handler.

 drivers/memory/tegra20-mc.c | 5 ++++-
 drivers/memory/tegra30-mc.c | 9 ++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

-- 
1.8.1.5
