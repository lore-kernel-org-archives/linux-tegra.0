From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v1 0/3] ASoC: last minute fixes
Date: Thu, 18 Oct 2018 13:18:26 +0200
Message-ID: <20181018111829.27056-1-marcel@ziswiler.com>
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
To: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jiri Kosina <trivial@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Marcel Ziswiler <marcel@ziswiler.com>
List-Id: linux-tegra@vger.kernel.org


This series comes with some last minutes fixes and clean-up.

Changes in v1:
- Split from the Tegra series as suggested by Mark.
- Fix issue in soc-core rather than working around it in tegra_sgtl5000.

Marcel Ziswiler (3):
  ASoC: tegra_sgtl5000: fix device_node refcounting
  ASoC: soc-core: fix trivial checkpatch issues
  ASoC: soc-core: fix platform name vs. of_node assignement

 sound/soc/soc-core.c             | 162 ++++++++++++++++++++++++---------------
 sound/soc/tegra/tegra_sgtl5000.c |  17 +++-
 2 files changed, 116 insertions(+), 63 deletions(-)

-- 
2.14.4
