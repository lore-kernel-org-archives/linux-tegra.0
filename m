From: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>
Subject: [PATCH 0/4] ASoC: Tegra30 TDM support
Date: Fri, 27 Jul 2018 13:59:27 +0100
Message-ID: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patchset adds support for TDM audio on Tegra30 hardware.
It adds the DAI's `set_tdm_slot` callback and enables a tegra
pcm to have up to 8 channels.

It also includes support for other audio formats supported by
the Tegra30 HW and fixes a broken macro needed for setting the
TDM on the registers.

Based on Linux 4.18-rc3 tag.

Edward Cragg (4):
  ASoC: tegra: i2s: Fix typo/broken macro
  ASoC: tegra: Add a TDM configuration callback
  ASoC: tegra: Allow 32-bit and 24-bit samples
  ASoC: tegra: i2s: Add support for more than 2 channels

 sound/soc/tegra/tegra30_i2s.c | 72 ++++++++++++++++++++++++++++++++++++-------
 sound/soc/tegra/tegra30_i2s.h |  2 +-
 2 files changed, 62 insertions(+), 12 deletions(-)

-- 
2.11.0
