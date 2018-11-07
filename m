From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 3/3] arm64: tegra: Device tree updates for v4.20-rc2
Date: Wed,  7 Nov 2018 15:53:50 +0100
Message-ID: <20181107145350.29127-4-thierry.reding@gmail.com>
References: <20181107145350.29127-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181107145350.29127-1-thierry.reding@gmail.com>
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

The following changes since commit d9fd22447ba59a9b53a202fade977e82bfba8d8d:

  arm64: tegra: I2C on Tegra194 is not compatible with Tegra114 (2018-09-26 15:50:59 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.20-rc2-arm64-dt

for you to fetch changes up to 47787b6b7d6981d979bdb01475cd3dd7626dbda3:

  arm64: dts: tegra210: Add power-domains for xHCI (2018-10-25 14:31:25 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree updates for v4.20-rc2

This contains a single change to populate power domains for the XUSB
device on Tegra210.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: dts: tegra210: Add power-domains for xHCI

 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 ++
 1 file changed, 2 insertions(+)
