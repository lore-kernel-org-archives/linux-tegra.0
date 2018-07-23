From: Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 0/2 V1] Add support for cpcap regulators on Tegra devices.
Date: Mon, 23 Jul 2018 13:58:03 -0400
Message-ID: <ddc14012-7afc-b3d9-7293-615a0dce1c7f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Good Afternoon,

I am re-sending the whole patch set due to my error of accidentally 
converting the tabulation to spaces.

The CPCAP regulator driver can support various devices, but currently 
only supports Omap4 devices.
Adds the sw2 and sw4 voltage tables, which power the Tegra core, and a 
DT match for the Tegra device.
Tested on the Motorola Xoom MZ602.

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
