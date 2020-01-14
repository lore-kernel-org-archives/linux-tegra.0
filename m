From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 0/8] NVIDIA Tegra I2C driver fixes and improvements
Date: Tue, 14 Jan 2020 04:34:34 +0300
Message-ID: <20200114013442.28448-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This patchset adds support for atomic transfers which are required for
shutting down machine properly. Secondly, a (not)suspending I2C and some
other things are fixed/improved by this small series as well. Please review
and apply, thanks in advance!

Changelog:

v5: Improved commit message of the "Support atomic transfers" patch,
    thanks to Wolfram Sang.

    Added explicit stable tags to these patches:

      i2c: tegra: Fix suspending in active runtime PM state
      i2c: tegra: Properly disable runtime PM on driver's probe error

v4: Removed the "clk: tegra: Fix double-free in tegra_clk_init()" patch
    from this series, which was added by accident in v3.

    Added Thierry's tested-by to the patches.

v3: The "Prevent interrupt triggering after transfer timeout" and "Support
    atomic transfers" patches got extra very minor improvements. The
    completion now is passed directly to tegra_i2c_poll_completion_timeout(),
    for consistency.

    Added two new patches that firm up DMA transfer handling:

      i2c: tegra: Always terminate DMA transfer
      i2c: tegra: Check DMA completion status in addition to left time

v2: The series is renamed from "Tegra I2C: Support atomic transfers and
    correct suspend/resume" to "NVIDIA Tegra I2C driver fixes and
    improvements" because it now contains some more various changes.

    New patches in v2:

      i2c: tegra: Correct unwinding order on driver's probe error
      i2c: tegra: Prevent interrupt triggering after transfer timeout
      i2c: tegra: Use relaxed versions of readl/writel

    The "Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN" got an
    improved wording for the code's comment to I2C_PIO_MODE_PREFERRED_LEN.

    The "Support atomic transfers" also got some very minor tuning, like
    s/in_interrupt()/i2c_dev->is_curr_atomic_xfer/ in dvc_writel() that was
    missed in v1.

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

Dmitry Osipenko (8):
  i2c: tegra: Fix suspending in active runtime PM state
  i2c: tegra: Properly disable runtime PM on driver's probe error
  i2c: tegra: Prevent interrupt triggering after transfer timeout
  i2c: tegra: Support atomic transfers
  i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN
  i2c: tegra: Use relaxed versions of readl/writel
  i2c: tegra: Always terminate DMA transfer
  i2c: tegra: Check DMA completion status in addition to left time

 drivers/i2c/busses/i2c-tegra.c | 216 ++++++++++++++++++++++-----------
 1 file changed, 144 insertions(+), 72 deletions(-)

-- 
2.24.0
