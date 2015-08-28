From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH 00/11] arm: tegra: colibri_t30: fix hdmi, power i2c,
 wakeup and activate touch
Date: Fri, 28 Aug 2015 17:59:35 +0200
Message-ID: <1440777586-19545-1-git-send-email-marcel.ziswiler@toradex.com>
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
To: linux-tegra@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

This series finally continues on my previous Easter efforts (BTW:
thanks all for the feedback and all the patches thereof already having
been applied) and additionally to activating the STMPE811 touch
controller also fixes HDMI, power I2C and the wake-up key.


Marcel Ziswiler (11):
  arm: tegra: colibri_t30: update hardware revisions compatible comment
  arm: tegra: colibri_t30: fix hdmi supply
  arm: tegra: colibri_t30: improve comment about thermal alert pin
  arm: tegra: colibri_t30: add pin muxing for on-module power i2c
  arm: tegra: colibri_t30: fix comment about 3v3 fixed supply
  arm: tegra: colibri_t30: add touch pen interrupt pin muxing
  arm: tegra: colibri_t30: activate stmpe811 touch controller
  arm: tegra: colibri_t30: replace emmc label by comment
  arm: tegra: colibri_t30: fix vendor string of m41t0m6 rtc on eval
    board
  arm: tegra: colibri_t30: add comment concerning sd/mmc for eval board
  arm: tegra: colibri_t30: fix power/wakeup key for eval board

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts |   9 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi        | 124 ++++++++++++++++++++++----
 2 files changed, 111 insertions(+), 22 deletions(-)

-- 
2.4.3
