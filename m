From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [RFC 0/7] Add PWM device-tree support.
Date: Tue, 20 Dec 2011 11:32:11 +0100
Message-ID: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series adds very rudimentary device-tree support for PWM devices.
I fully realize that this is early work and it should not be merged as is.
However I wanted to post these patches for review to make sure I'm not on a
wild-goose chase.

With all of these patches applied (plus one board-specific patch that is not
included), I'm able to control the backlight on the device I'm working on
using the sysfs interface provided by the pwm-backlight driver and the
backlight class.

This series is based on Sascha Hauer's series of patches[0] to add a generic
PWM framework. The first patch in this series is takes from Sascha's branch,
while the second patch enables each PWM chip to provide multiple PWM devices
(none of the drivers in Sascha's branch are converted yet).

Patch 3 adds some code to lookup a PWM chip given its device-tree handle. This
code will be used later on by the pwm-backlight driver to find the PWM device
that it should be using. I did not include any binding documentation yet since
I wasn't sure the DT binding was at all sensible.

Patch 4 was taken from the Chromium tree and is required to provide proper
clocking of the Tegra2 PWFM controller. All Chromium-specific tags have been
removed from the commit message.

Patch 5 cleans up the clock registration for Tegra2 because patch 6 will only
instantiate one device for the PWFM controller instead of four.

Patch 6 adds a generic PWM framework driver for the Tegra2 PWFM controller.
The code is taken from the Chromium tree with some adjustments to integrate it
with the PWM framework.

Patch 7 implements DT-based probing in the pwm-backlight driver. Note that
this code only handles the "pwm" property (by looking up the PWM device via
the new PWM DT binding) and the "default-" and "max-brightness" properties.
Switching power to the backlight via GPIOs is not supported yet.

[0]: http://git.pengutronix.de/?p=imx/linux-2.6.git;a=shortlog;h=refs/heads/pwmlib

Sascha Hauer (1):
  PWM: add pwm framework support

Simon Que (1):
  arm: tegra: Fix PWM clock programming

Thierry Reding (5):
  pwm: Allow chips to support multiple PWMs.
  of: Add PWM support.
  arm: tegra: Provide clock for only one PWM controller.
  pwm: Add Tegra2 SoC support
  pwm-backlight: Add rudimentary device-tree support

 .../bindings/video/backlight/pwm-backlight         |   16 +
 Documentation/pwm.txt                              |   56 ++++
 MAINTAINERS                                        |    6 +
 arch/arm/boot/dts/tegra20.dtsi                     |    6 +
 arch/arm/mach-tegra/board-dt.c                     |    1 +
 arch/arm/mach-tegra/clock.h                        |    1 +
 arch/arm/mach-tegra/devices.c                      |   15 +
 arch/arm/mach-tegra/devices.h                      |    1 +
 arch/arm/mach-tegra/tegra2_clocks.c                |   33 ++-
 drivers/Kconfig                                    |    2 +
 drivers/Makefile                                   |    1 +
 drivers/of/Kconfig                                 |    6 +
 drivers/of/Makefile                                |    1 +
 drivers/of/pwm.c                                   |   88 ++++++
 drivers/pwm/Kconfig                                |   17 ++
 drivers/pwm/Makefile                               |    2 +
 drivers/pwm/core.c                                 |  301 ++++++++++++++++++++
 drivers/pwm/pwm-tegra.c                            |  274 ++++++++++++++++++
 drivers/video/backlight/Kconfig                    |    2 +-
 drivers/video/backlight/pwm_bl.c                   |   70 +++++-
 include/linux/of_pwm.h                             |   41 +++
 include/linux/pwm.h                                |   49 ++++
 22 files changed, 976 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/video/backlight/pwm-backlight
 create mode 100644 Documentation/pwm.txt
 create mode 100644 drivers/of/pwm.c
 create mode 100644 drivers/pwm/Kconfig
 create mode 100644 drivers/pwm/Makefile
 create mode 100644 drivers/pwm/core.c
 create mode 100644 drivers/pwm/pwm-tegra.c
 create mode 100644 include/linux/of_pwm.h

-- 
1.7.8
