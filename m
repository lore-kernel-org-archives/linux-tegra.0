From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v2] Input: document inhibiting
Date: Wed, 17 Jun 2020 12:18:22 +0200
Message-ID: <20200617101822.8558-1-andrzej.p@collabora.com>
References: <f9007f37-c526-5fa4-3188-a554d2434177@redhat.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f9007f37-c526-5fa4-3188-a554d2434177-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-input-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Barry
List-Id: linux-tegra@vger.kernel.org

Document inhibiting input devices and its relation to being
a wakeup source.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
v1..v2:

- Addressed editorial comments from Randy
- Added a paragraph by Hans

 Documentation/input/input-programming.rst | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/input/input-programming.rst b/Documentation/input/input-programming.rst
index 45a4c6e05e39..7432315cc829 100644
--- a/Documentation/input/input-programming.rst
+++ b/Documentation/input/input-programming.rst
@@ -164,6 +164,46 @@ disconnects. Calls to both callbacks are serialized.
 The open() callback should return a 0 in case of success or any nonzero value
 in case of failure. The close() callback (which is void) must always succeed.
 
+Inhibiting input devices
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+Inhibiting a device means ignoring input events from it. As such it is about maintaining
+relationships with input handlers - either already existing relationships, or relationships
+to be established while the device is in inhibited state.
+
+If a device is inhibited, no input handler will receive events from it.
+
+The fact that nobody wants events from the device is exploited further, by calling device's
+close() (if there are users) and open() (if there are users) on inhibit and uninhibit
+operations, respectively. Indeed, the meaning of close() is to stop providing events
+to the input core and that of open() is to start providing events to the input core.
+
+Calling the device's close() method on inhibit (if there are users) allows the driver
+to save power. Either by directly powering down the device or by releasing the
+runtime-pm reference it got in open() when the driver is using runtime-pm.
+
+Inhibiting and uninhibiting are orthogonal to opening and closing the device by input
+handlers. Userspace might want to inhibit a device in anticipation before any handler is
+positively matched against it.
+
+Inhibiting and uninhibiting are orthogonal to device's being a wakeup source, too. Being a
+wakeup source plays a role when the system is sleeping, not when the system is operating.
+How drivers should program their interaction between inhibiting, sleeping and being a wakeup
+source is driver-specific.
+
+Taking the analogy with the network devices - bringing a network interface down doesn't mean
+that it should be impossible be wake the system up on LAN through this interface. So, there
+may be input drivers which should be considered wakeup sources even when inhibited. Actually,
+in many I2C input devices their interrupt is declared a wakeup interrupt and its handling
+happens in driver's core, which is not aware of input-specific inhibit (nor should it be).
+Composite devices containing several interfaces can be inhibited on a per-interface basis and
+e.g. inhibiting one interface shouldn't affect the device's capability of being a wakeup source.
+
+If a device is to be considered a wakeup source while inhibited, special care must be taken when
+programming its suspend(), as it might need to call device's open(). Depending on what close()
+means for the device in question, not opening() it before going to sleep might make it
+impossible to provide any wakeup events. The device is going to sleep anyway.
+
 Basic event types
 ~~~~~~~~~~~~~~~~~
 
-- 
2.17.1
