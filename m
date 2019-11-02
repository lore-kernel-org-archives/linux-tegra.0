From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 7/8] ARM: tegra: Default configuration changes for v5.5-rc1
Date: Sat,  2 Nov 2019 15:45:20 +0100
Message-ID: <20191102144521.3863321-7-thierry.reding@gmail.com>
References: <20191102144521.3863321-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191102144521.3863321-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-arm-defconfig

for you to fetch changes up to 480bb31f4286d838fc0eebcfd813dd83236406e7:

  ARM: tegra: Enable Tegra VDE driver in tegra_defconfig (2019-10-29 14:10:35 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v5.5-rc1

Enables the Tegra VDE driver by default. This is currently in staging
but can be used with existing userspace to do hardware-accelerated video
decoding of H.264 streams.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: tegra: Enable Tegra VDE driver in tegra_defconfig

 arch/arm/configs/tegra_defconfig | 2 ++
 1 file changed, 2 insertions(+)
