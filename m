From: Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 0/2 v2] Add support for cpcap regulators on Tegra devices.
Date: Mon, 23 Jul 2018 15:38:46 -0400
Message-ID: <20180723193848.32491-1-pgwipeout@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Good Afternoon,

I am re-sending the whole patch set again.
I have sent this to myself, and confirmed it still patches cleanly.

I apologize once again.

The CPCAP regulator driver can support various devices, but currently only supports Omap4 devices.
Adds the sw2 and sw4 voltage tables, which power the Tegra core, and a DT match for the Tegra device.
Tested on the Motorola Xoom MZ602.

v2:
Stopped reinventing the wheel, using git email now.
Rebased against regulator for-next branch.

v1:
Fix conversion of tabulation to spaces.

Peter Geis (2):
  Add sw2_sw4 voltage table to cpcap regulator.
  Add support for CPCAP regulators on Tegra devices.

 .../bindings/regulator/cpcap-regulator.txt    |   1 +
 drivers/regulator/cpcap-regulator.c           | 103 ++++++++++++++++++
 2 files changed, 104 insertions(+)

-- 
2.17.1
