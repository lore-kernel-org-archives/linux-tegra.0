From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] phy: add missing header dependencies
Date: Wed, 31 Aug 2016 12:00:01 +0200
Message-ID: <5510665.v78tdpezgV@wuerfel>
References: <1472633809-19904-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472633809-19904-1-git-send-email-baoyou.xie@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: kishon@ti.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, xie.baoyou@zte.com.cn
List-Id: linux-tegra@vger.kernel.org

On Wednesday, August 31, 2016 4:56:49 PM CEST Baoyou Xie wrote:
> We get 5 warnings when building kernel with W=1:
> drivers/phy/tegra/xusb.c:948:27: warning: no previous prototype for 'tegra_xusb_padctl_get' [-Wmissing-prototypes]
> drivers/phy/tegra/xusb.c:981:6: warning: no previous prototype for 'tegra_xusb_padctl_put' [-Wmissing-prototypes]
> drivers/phy/tegra/xusb.c:988:5: warning: no previous prototype for 'tegra_xusb_padctl_usb3_save_context' [-Wmissing-prototypes]
> drivers/phy/tegra/xusb.c:998:5: warning: no previous prototype for 'tegra_xusb_padctl_hsic_set_idle' [-Wmissing-prototypes]
> drivers/phy/tegra/xusb.c:1008:5: warning: no previous prototype for 'tegra_xusb_padctl_usb3_set_lfps_detect' [-Wmissing-prototypes]
> 
> In fact, these functions are declared in linux/phy/tegra/xusb.h,
> so this patch adds missing header dependencies.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>

Patch looks good

Acked-by: Arnd Bergmann <arnd@arndb.de>

In the subject line, this time being more specific is better (there
are many distinct phy drivers), so use "phy: tegra: ..." here.

	Arnd
