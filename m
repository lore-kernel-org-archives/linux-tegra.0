From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 9/9] arm64: tegra: Default configuration changes for
 v5.1-rc1
Date: Fri,  8 Feb 2019 16:09:35 +0100
Message-ID: <20190208150935.32108-10-thierry.reding@gmail.com>
References: <20190208150935.32108-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208150935.32108-1-thierry.reding@gmail.com>
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

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.1-arm64-defconfig

for you to fetch changes up to bc72bed682a9502f5c8f5adf15107aef6237895e:

  arm64: defconfig: Enable Tegra TCU (2019-02-06 14:38:35 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v5.1-rc1

Enables the TCU driver to be built into the kernel, so that the TCU can
be used as debug serial on Jetson Xavier. This also enables the MAX8973
regulator driver that is required for CPU frequency scaling on Tegra210.

----------------------------------------------------------------
Joseph Lo (1):
      arm64: defconfig: Enable MAX8973 regulator

Thierry Reding (1):
      arm64: defconfig: Enable Tegra TCU

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
