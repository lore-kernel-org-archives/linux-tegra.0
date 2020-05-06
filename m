From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] i2c: tegra: Add support for the VI I2C on Tegra210
Date: Wed,  6 May 2020 21:15:07 +0200
Message-ID: <20200506191511.2791107-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi Wolfram,

This small set of patches cleans up a few things in the I2C driver and
then adds support for the VI instance of the I2C controller which is a
regular I2C controller wrapped by some multimedia-specific logic. As a
result, the regular I2C controller register interface is offset by a
couple of bytes.

I can pick up patch 4/4 into the Tegra tree. These patches also don't
have any conflicts with Dmitry's patches that we've been discussing.

That said, I could also put this set of patches (except the DTS change)
into the same branch I already have for Dmitry's patches (plus the fixes
that we had discussed) and take it into linux-next and let it brew for a
couple of days to get more testing and then send everything to you with
a PR, say, sometime next week? How does that sound?

Thierry

Thierry Reding (4):
  dt-bindings: i2c: tegra: Document Tegra210 VI I2C
  i2c: tegra: Use FIELD_PREP/FIELD_GET macros
  i2c: tegra: Add support for the VI I2C on Tegra210
  arm64: tegra: Enable VI I2C on Jetson Nano

 .../bindings/i2c/nvidia,tegra20-i2c.txt       |   6 +
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   |   4 +
 drivers/i2c/busses/i2c-tegra.c                | 178 +++++++++++++-----
 3 files changed, 145 insertions(+), 43 deletions(-)

-- 
2.24.1
