From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [GIT PULL 1/8] ARM: tegra: DT-related fixes needed by the MMC tree
Date: Fri,  5 Apr 2013 11:03:39 -0600
Message-ID: <1365181426-11547-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

In order to convert the Tegra MMC driver to using mmc_of_parse(), some
bugs in the Tegra device-tree content need to be fixed first; it's
currently wrong but unused, and mmc_of_parse() causes that data to be
used for the first time.

(This branch has also been merged into the MMC tree. I'm sending it as a
separate pull request as an FYI, but you can feel free to skip it and just
pull in 2/8 which is the main Tegra fixes branch and includes this)

----------------------------------------------------------------

The following changes since commit 6dbe51c251a327e012439c4772097a13df43c5b8:

  Linux 3.9-rc1

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.10-fixes-for-mmc

for you to fetch changes up to 908ab9368866e6edf0edebdd546adefd5f3128f9:

  ARM: dts: tegra: fix the activate polarity of cd-gpio in mmc host

----------------------------------------------------------------

Joseph Lo (1):
      ARM: dts: tegra: fix the activate polarity of cd-gpio in mmc host

 arch/arm/boot/dts/tegra20-colibri-512.dtsi |    2 +-
 arch/arm/boot/dts/tegra20-harmony.dts      |    4 ++--
 arch/arm/boot/dts/tegra20-paz00.dts        |    2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts     |    2 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi    |    2 +-
 arch/arm/boot/dts/tegra20-trimslice.dts    |    2 +-
 arch/arm/boot/dts/tegra20-ventana.dts      |    2 +-
 arch/arm/boot/dts/tegra20-whistler.dts     |    1 +
 arch/arm/boot/dts/tegra30-beaver.dts       |    2 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi      |    2 +-
 10 files changed, 11 insertions(+), 10 deletions(-)
