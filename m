From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 1/3] dt-bindings: Updates for v4.20-rc2
Date: Wed,  7 Nov 2018 15:53:48 +0100
Message-ID: <20181107145350.29127-2-thierry.reding@gmail.com>
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

The following changes since commit d9be10edf7d6040468f89824df0dfcfcbf3a693b:

  dt-bindings: Add Tegra PMC pad configuration bindings (2018-08-27 12:21:43 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.20-rc2-dt-bindings

for you to fetch changes up to 20c33013eaab16576ed9f13082481a0d9d45d365:

  dt-bindings: usb: xhci-tegra: Add power-domain details (2018-10-25 14:30:07 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Update for v4.20-rc2

This contains device tree binding updates for the XUSB controller to
allow multiple power domains to be specified.

----------------------------------------------------------------
Jon Hunter (1):
      dt-bindings: usb: xhci-tegra: Add power-domain details

 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt | 8 ++++++++
 1 file changed, 8 insertions(+)
