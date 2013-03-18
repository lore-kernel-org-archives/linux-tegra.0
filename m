From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/7] USB: PHY: Tegra: registering TEGRA USB PHY as platform
 driver
Date: Mon, 18 Mar 2013 17:59:34 +0530
Message-ID: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

As part of this series, apart from patch containing changes to register TEGRA
USB PHY driver as platform driver, prepared below patches:
1. Re-arranging & adding new DT properties.
2. Getting various params from DT properties added.
3. code clean up.

Venu Byravarasu (7):
  ARM: tegra: finalize USB EHCI and PHY bindings
  ARM: tegra: update device trees for USB binding rework
  usb: phy: tegra: Get PHY mode using DT
  usb: phy: tegra: Return correct error value provided by clk_get_sys
  usb: phy: tegra: get ULPI reset GPIO info using DT.
  usb: phy: tegra: Add error handling & clean up.
  usb: phy: registering tegra USB PHY as platform driver

 .../bindings/usb/nvidia,tegra20-ehci.txt           |   27 +--
 .../bindings/usb/nvidia,tegra20-usb-phy.txt        |   27 ++-
 arch/arm/boot/dts/tegra20-colibri-512.dtsi         |    4 +
 arch/arm/boot/dts/tegra20-harmony.dts              |    8 +-
 arch/arm/boot/dts/tegra20-iris-512.dts             |    4 +
 arch/arm/boot/dts/tegra20-paz00.dts                |    8 +-
 arch/arm/boot/dts/tegra20-seaboard.dts             |   13 +-
 arch/arm/boot/dts/tegra20-trimslice.dts            |   12 +-
 arch/arm/boot/dts/tegra20-ventana.dts              |    7 +-
 arch/arm/boot/dts/tegra20.dtsi                     |   32 ++-
 drivers/usb/host/ehci-tegra.c                      |  100 +++----
 drivers/usb/phy/tegra_usb_phy.c                    |  301 ++++++++++++--------
 include/linux/usb/tegra_usb_phy.h                  |    5 +-
 13 files changed, 322 insertions(+), 226 deletions(-)
