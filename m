From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 0/2] Add power control for lm90
Date: Mon, 9 Sep 2013 18:29:10 +0800
Message-ID: <1378722552-10357-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The device lm90 can be controlled by the vcc rail.
Add function to power on/off the vcc.

This series is v3, previous version patches are:
[v2]: http://www.spinics.net/lists/arm-kernel/msg265373.html
[v1]: http://www.mail-archive.com/linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg12034.html

Changes from v2:
1. use devm_regulator_get_optional(), as suggested by Mark.
2. remove the lm90_power_control(), enable the regulator in the probe()
directly, so the codes are more clear, as suggested by Alexander and Guenter.
3. change the binding documentation, as per Stephen suggestion.
4. couple of changes, as per previous review.

Changes from v1:
1. if get regulator failed, we should continue to run probe function,
not return fail.
2. call regulator_put() in error handler and remove function.
3. add LM90 DT binding document.

Wei Ni (2):
  hwmon: (lm90) Add power control
  Documentation: dt: hwmon: add OF document for LM90

 Documentation/devicetree/bindings/hwmon/lm90.txt |   44 ++++++++++++++++++++++
 drivers/hwmon/lm90.c                             |   25 ++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lm90.txt

-- 
1.7.9.5
