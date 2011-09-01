From: Stephen Warren <swarren@nvidia.com>
Subject: [PATCH V2 2/4] staging:iio:magnetometer:ak8975 Don't use irq_to_gpio()
Date: Thu,  1 Sep 2011 10:52:42 -0600
Message-ID: <1314895964-15964-6-git-send-email-swarren@nvidia.com>
References: <1314895964-15964-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <1314895964-15964-1-git-send-email-swarren@nvidia.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: devel-bounces@linuxdriverproject.org
To: Greg Kroah-Hartman <gregkh@suse.de>, Jean Delvare <khali@linux-fr.org>, Ben Dooks <ben-linux@fluff.org>, Arnd Bergmann <arnd@arndb.de>
Cc: devel@driverdev.osuosl.org, Andrew Chew <achew@nvidia.com>, Stephen Warren <swarren@nvidia.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@cam.ac.uk>, linux-tegra@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra doesn't have irq_to_gpio() any more, and ak8975 is included in
tegra_defconfig. This causes a build failure.

Instead, obtain the GPIO ID corresponding to the chip's IRQ from the new
i2c_client field irq_gpio.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
v2: Obtain eoc_gpio from i2c_client, instead of hard-coding it as an
invalid value.

 drivers/staging/iio/magnetometer/ak8975.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/iio/magnetometer/ak8975.c b/drivers/staging/iio/magnetometer/ak8975.c
index a17fa9f..14076da 100644
--- a/drivers/staging/iio/magnetometer/ak8975.c
+++ b/drivers/staging/iio/magnetometer/ak8975.c
@@ -477,7 +477,7 @@ static int ak8975_probe(struct i2c_client *client,
 	int err;
 
 	/* Grab and set up the supplied GPIO. */
-	eoc_gpio = irq_to_gpio(client->irq);
+	eoc_gpio = client->irq_gpio;
 
 	/* We may not have a GPIO based IRQ to scan, that is fine, we will
 	   poll if so */
-- 
1.7.0.4
