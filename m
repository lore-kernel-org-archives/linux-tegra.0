From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/3] Tegra I2C: Support atomic transfers and correct suspend/resume
Date: Fri, 13 Dec 2019 02:34:25 +0300
Message-ID: <20191212233428.14648-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This patchset adds support for atomic transfers which are required for
shutting down machine properly. Secondly, a (not)suspending I2C is fixed
by this small series as well.

Changelog:

v1: The "i2c: tegra: Support atomic transfers" previously was sent out as
    a separate patch, but later I spotted that suspend/resume doesn't
    work properly. The "i2c: tegra: Fix suspending in active runtime PM
    state" patch depends on the atomic patch because there is a need to
    active IRQ-safe mode for the runtime PM by both patches.

    I fixed a missed doc-comment of the newly added "is_curr_atomic_xfer"
    structure field and added additional comment that explains why IRQ needs
    to be disabled for the atomic transfer in the "Support atomic transfers"
    patch.

    Lastly, I added a minor "i2c: tegra: Rename .." patch that helps to
    follow driver's code.

Dmitry Osipenko (3):
  i2c: tegra: Support atomic transfers
  i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN
  i2c: tegra: Fix suspending in active runtime PM state

 drivers/i2c/busses/i2c-tegra.c | 113 +++++++++++++++++++++++++++++----
 1 file changed, 101 insertions(+), 12 deletions(-)

-- 
2.24.0
