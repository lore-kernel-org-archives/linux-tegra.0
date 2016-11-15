From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v4 0/2] mailbox: Add Tegra HSP driver
Date: Tue, 15 Nov 2016 16:48:43 +0100
Message-ID: <20161115154845.24803-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi Jassi,

These patches have gone through a number of revisions now and I've
tested them to the point where I'm confident that they work well.

Given the chain of drivers that depends on this, I think it'd be good if
I took this through the Tegra tree with your Acked-by, so that I can
deal with the dependencies within one tree. I can provide a stable tag
for you to pull into the mailbox tree.

Thanks,
Thierry

Joseph Lo (1):
  dt-bindings: mailbox: Add Tegra HSP binding

Thierry Reding (1):
  mailbox: Add Tegra HSP driver

 .../bindings/mailbox/nvidia,tegra186-hsp.txt       |  52 ++
 drivers/mailbox/Kconfig                            |   9 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/tegra-hsp.c                        | 542 +++++++++++++++++++++
 include/dt-bindings/mailbox/tegra186-hsp.h         |  24 +
 5 files changed, 629 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt
 create mode 100644 drivers/mailbox/tegra-hsp.c
 create mode 100644 include/dt-bindings/mailbox/tegra186-hsp.h

-- 
2.10.2
