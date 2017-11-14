From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 1/2] mfd: cros ec: spi: Don't send first message too soon
Date: Tue, 14 Nov 2017 14:43:27 +0000
Message-ID: <1510670608-19594-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Shawn Nematbakhsh <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On the Tegra124 Nyan-Big chromebook the very first SPI message sent to
the EC is failing.

The Tegra SPI driver configures the SPI chip-selects to be active-high
by default (and always has for many years). The EC SPI requires an
active-low chip-select and so the Tegra chip-select is reconfigured to
be active-low when the EC SPI driver calls spi_setup(). The problem is
that if the first SPI message to the EC is sent too soon after
reconfiguring the SPI chip-select, it fails.

The EC SPI driver prevents back-to-back SPI messages being sent too
soon by keeping track of the time the last transfer was sent via the
variable 'last_transfer_ns'. To prevent the very first transfer being
sent too soon, initialise the 'last_transfer_ns' variable after calling
spi_setup() and before sending the first SPI message.

Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes since V1:
- Added stable-tag and Brian's reviewed-by.

Looks like this issue has been around for several Linux releases now
and it just depends on timing if this issue is seen or not and so there
is no specific commit this fixes. However, would be good to include for
v4.15.

 drivers/mfd/cros_ec_spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index c9714072e224..a14196e95e9b 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -667,6 +667,7 @@ static int cros_ec_spi_probe(struct spi_device *spi)
 			   sizeof(struct ec_response_get_protocol_info);
 	ec_dev->dout_size = sizeof(struct ec_host_request);
 
+	ec_spi->last_transfer_ns = ktime_get_ns();
 
 	err = cros_ec_register(ec_dev);
 	if (err) {
-- 
2.7.4
