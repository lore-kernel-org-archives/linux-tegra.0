From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] pinctrl: tegra-xusb: Clean-up and fixes
Date: Tue, 19 May 2015 15:14:20 +0100
Message-ID: <1432044863-2035-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Some clean-up and fixes for tegra-xusb driver.

This had been boot tested on tegra20-trimslice, tegra30-beaver,
tegra114-dalmore-a04 and tegra124-jetson-tk1 and no issues seen.
Complete test information can be found below.

http://nvt.pwsan.com/pub/jonathanh-tester/testlogs/test_20150519061107_8d5ae2aeafa78eca9fd0d92d4069960782deb761/20150519061107/

Jon Hunter (3):
  pinctrl: tegra-xusb: Remove unused structure
  pinctrl: tegra-xusb: Fix allocation of pins
  pinctrl: tegra-xusb: Check that of_match_node returns a valid pointer

 drivers/pinctrl/pinctrl-tegra-xusb.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

-- 
1.9.1
