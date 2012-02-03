From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/3] arm: tegra: dts: USB Updates for Tegra legacy mode / OTG
Date: Fri,  3 Feb 2012 08:56:09 -0800
Message-ID: <1328288172-8059-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This little series brings in some bindings that seem useful for U-Boot.

I am working mostly in U-Boot, but since there is no shared .dts repo
I was asked to commit these changes to the kernel. I do not propose to
update the Linux USB drivers to match.


Simon Glass (3):
  arm: tegra: dts: Support host/device selection and legacy mode
  arm: tegra: dts: Add legacy mode support to Tegra2x USB1 port
  arm: tegra: dts: Mark USB1 as an OTG port on Seaboard

 .../devicetree/bindings/usb/tegra-usb.txt          |   13 +++++++++++++
 arch/arm/boot/dts/tegra-seaboard.dts               |    1 +
 arch/arm/boot/dts/tegra20.dtsi                     |    1 +
 3 files changed, 15 insertions(+), 0 deletions(-)

-- 
1.7.7.3
