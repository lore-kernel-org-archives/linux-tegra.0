From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH 0/4] Complete ddc symlink addition
Date: Thu,  2 Jan 2020 14:22:56 +0100
Message-ID: <20200102132300.24309-1-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>
List-Id: linux-tegra@vger.kernel.org

The series completes the process of adding ddc symlink in connector's
sysfs directory: of the initial submission only the below patches are
still pending, hence this resend. Rebased onto drm-misc-next as of
2020-01-02.

Andrzej Pietrasiewicz (4):
  drm/tegra: Provide ddc symlink in output connector sysfs directory
  drm/vc4: Provide ddc symlink in connector sysfs directory
  drm: zte: Provide ddc symlink in hdmi connector sysfs directory
  drm: zte: Provide ddc symlink in vga connector sysfs directory

 drivers/gpu/drm/tegra/hdmi.c   |  7 ++++---
 drivers/gpu/drm/tegra/sor.c    |  7 ++++---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++----
 drivers/gpu/drm/zte/zx_hdmi.c  |  6 ++++--
 drivers/gpu/drm/zte/zx_vga.c   |  6 ++++--
 5 files changed, 24 insertions(+), 14 deletions(-)

-- 
2.17.1
