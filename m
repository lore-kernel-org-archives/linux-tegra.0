From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: tegra30 tdm audio support
Date: Fri, 18 Oct 2019 16:48:26 +0100
Message-ID: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@lists.codethink.co.uk
List-Id: linux-tegra@vger.kernel.org

TDM audio support for tegra30 devices.

v2:
- moved edge-control and data-offset to the set_fmt callbacks
- fixed dev_dbg in set_tdm callback
- fixed dev_dbg message contents in set_tdm callback
- changed fsync width to be permanently 1 clock

v3:
- cleanup fsync patch
- fix rebase issue with tdm patch

v4:
- fix comment style issues
- change tdm-a to data-offset 1

v5:
- fix format on tdm-b
