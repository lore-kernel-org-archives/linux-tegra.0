From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 2/2] usb: chipidea: tegra: Select Tegra's PHY in Kconfig
Date: Mon, 11 Dec 2017 02:10:00 +0300
Message-ID: <d6b64530412955aba1284886b3f5f74e42d776da.1512947332.git.digetx@gmail.com>
References: <b820f290730e57c999c211e5f82cf833755c299f.1512947332.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b820f290730e57c999c211e5f82cf833755c299f.1512947332.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <b820f290730e57c999c211e5f82cf833755c299f.1512947332.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <b820f290730e57c999c211e5f82cf833755c299f.1512947332.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

UDC driver won't probe without Tegra's PHY, hence select it in the
Kconfig.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/chipidea/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
index 785f0ed037f7..2ef3b27ea72b 100644
--- a/drivers/usb/chipidea/Kconfig
+++ b/drivers/usb/chipidea/Kconfig
@@ -27,6 +27,7 @@ config USB_CHIPIDEA_PCI
 config USB_CHIPIDEA_UDC
 	bool "ChipIdea device controller"
 	depends on USB_GADGET
+	select USB_TEGRA_PHY if ARCH_TEGRA
 	help
 	  Say Y here to enable device controller functionality of the
 	  ChipIdea driver.
-- 
2.15.1
