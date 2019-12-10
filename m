From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 079/177] drm/tegra: sor: Use correct SOR index on
 Tegra210
Date: Tue, 10 Dec 2019 16:30:43 -0500
Message-ID: <20191210213221.11921-79-sashal@kernel.org>
References: <20191210213221.11921-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191210213221.11921-1-sashal@kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

[ Upstream commit 24e64f86da40e68c5f58af08796110f147b12193 ]

The device tree bindings for the Tegra210 SOR don't require the
controller instance to be defined, since the instance can be derived
from the compatible string. The index is never used on Tegra210, so we
got away with it not getting set. However, subsequent patches will
change that, so make sure the proper index is used.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tegra/sor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index d7fe9f15def1d..89cb70da2bfe6 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2922,6 +2922,11 @@ static int tegra_sor_parse_dt(struct tegra_sor *sor)
 		 * earlier
 		 */
 		sor->pad = TEGRA_IO_PAD_HDMI_DP0 + sor->index;
+	} else {
+		if (sor->soc->supports_edp)
+			sor->index = 0;
+		else
+			sor->index = 1;
 	}
 
 	return 0;
-- 
2.20.1
