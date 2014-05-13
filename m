From: stefan@agner.ch
Subject: [PATCH 0/2] ARM: tegra: initial support for Colibri T30
Date: Tue, 13 May 2014 19:27:37 +0200
Message-ID: <cover.1400001937.git.stefan@agner.ch>
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
To: swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: devicetree@vger.kernel.org, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, stefan@agner.ch, marcel@ziswiler.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Stefan Agner <stefan@agner.ch>

This patches cooked a while in our repository and is now quite
complete. All is tested on several Colibri T30 modules and
evaluation boards by Marcel and me. The device tree is splitted
into a module part and the carrier board. The former is then
included by the latter (in this case the evaluation board). The
comments "Colibri: " represent the SO-DIMM Pin name as defined
in the Colibri standard, and should be helpful for users
adopting the device tree for other carrier boards.

Stefan Agner (2):
  ARM: tegra: enable MCP251x CAN controller and DS1307 RTC
  ARM: tegra: initial add of Colibri T30

 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 202 ++++++++++++++
 arch/arm/boot/dts/tegra30-colibri.dtsi        | 375 ++++++++++++++++++++++++++
 arch/arm/configs/tegra_defconfig              |   6 +
 4 files changed, 584 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
 create mode 100644 arch/arm/boot/dts/tegra30-colibri.dtsi

-- 
1.9.2
