From: Stephen Warren <swarren@nvidia.com>
Subject: [PATCH 1/3] staging:iio:magnetometer:ak8975 Don't use irq_to_gpio()
Date: Wed, 31 Aug 2011 13:40:55 -0600
Message-ID: <1314819657-828-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: devel-bounces@linuxdriverproject.org
To: Greg Kroah-Hartman <gregkh@suse.de>, Russell King <linux@arm.linux.org.uk>
Cc: devel@driverdev.osuosl.org, Andrew Chew <achew@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@cam.ac.uk>, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Tegra doesn't have irq_to_gpio() any more, and ak8975 is included in
tegra_defconfig. This causes a build failure. Solve this with a heavy-handed
method for now.

I suspect the long-term solution is to pass both the IRQ and GPIO IDs
to the driver; the GPIO ID coming from either platform data, or perhaps
enhancing struct i2c_client to add a gpio field alongside irq.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
Russell, now that irq_to_gpio() is going away, can you comment on how
you'd like to fix drivers that do this kind of thing? Thanks.

 drivers/staging/iio/magnetometer/ak8975.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/iio/magnetometer/ak8975.c b/drivers/staging/iio/magnetometer/ak8975.c
index a17fa9f..bd40e32 100644
--- a/drivers/staging/iio/magnetometer/ak8975.c
+++ b/drivers/staging/iio/magnetometer/ak8975.c
@@ -477,7 +477,7 @@ static int ak8975_probe(struct i2c_client *client,
 	int err;
 
 	/* Grab and set up the supplied GPIO. */
-	eoc_gpio = irq_to_gpio(client->irq);
+	eoc_gpio = -1; /* FIXME: irq_to_gpio(client->irq) */
 
 	/* We may not have a GPIO based IRQ to scan, that is fine, we will
 	   poll if so */
-- 
1.7.0.4
