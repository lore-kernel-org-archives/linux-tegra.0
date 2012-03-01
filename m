From: Alan Ott <alan@signal11.us>
Subject: [PATCH 1/8] ARM: tegra: export tegra_gpio_{en,dis}able
Date: Thu,  1 Mar 2012 14:26:43 -0500
Message-ID: <1330630010-11241-2-git-send-email-alan@signal11.us>
References: <1330630010-11241-1-git-send-email-alan@signal11.us>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1330630010-11241-1-git-send-email-alan@signal11.us>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <linux@arm.linux.org.uk>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@stericsson.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

These two functions are used in drivers that can be
modules, so they need to be exported.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/gpio-tegra.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index bdc2937..96662cc 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -107,11 +107,13 @@ void tegra_gpio_enable(int gpio)
 {
 	tegra_gpio_mask_write(GPIO_MSK_CNF(gpio), gpio, 1);
 }
+EXPORT_SYMBOL_GPL(tegra_gpio_enable);
 
 void tegra_gpio_disable(int gpio)
 {
 	tegra_gpio_mask_write(GPIO_MSK_CNF(gpio), gpio, 0);
 }
+EXPORT_SYMBOL_GPL(tegra_gpio_disable);
 
 static void tegra_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-- 
1.7.0.4
