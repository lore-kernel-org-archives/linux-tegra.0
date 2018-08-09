From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2] gpu: host1x: Ignore clients initialization failure
Date: Fri, 10 Aug 2018 02:12:11 +0300
Message-ID: <20180809231211.26182-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From time to time new bugs are popping up, causing some host1x client to
fail its initialization. Currently a single clients initialization failure
causes whole host1x device registration to fail, as a result a single DRM
sub-device initialization failure makes whole DRM initialization to fail.
Let's ignore clients initialization failure, as a result display panel
lights up even if some DRM clients (say GR2D or VIC) fail to initialize.
Actually VIC fails if initramfs misses the firmware file, so with this
change a serial console isn't needed anymore to figure out why display
isn't working.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: Added WARN_ON() that should get more attention than just a error message.
    Made clients_lock to lock around the lists modification, that is in line
    with the rest of the code.

 drivers/gpu/host1x/bus.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 815bdb42e3f0..07bb6b6c1260 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -199,19 +199,23 @@ static void host1x_subdev_unregister(struct host1x_device *device,
  */
 int host1x_device_init(struct host1x_device *device)
 {
-	struct host1x_client *client;
+	struct host1x_client *client, *cl;
 	int err;
 
 	mutex_lock(&device->clients_lock);
 
-	list_for_each_entry(client, &device->clients, list) {
+	list_for_each_entry_safe(client, cl, &device->clients, list) {
 		if (client->ops && client->ops->init) {
 			err = client->ops->init(client);
-			if (err < 0) {
+			if (WARN_ON(err < 0)) {
 				dev_err(&device->dev,
 					"failed to initialize %s: %d\n",
 					dev_name(client->dev), err);
-				goto teardown;
+
+				/* add the client to the list of idle clients */
+				mutex_lock(&clients_lock);
+				list_add_tail(&client->list, &clients);
+				mutex_unlock(&clients_lock);
 			}
 		}
 	}
@@ -219,14 +223,6 @@ int host1x_device_init(struct host1x_device *device)
 	mutex_unlock(&device->clients_lock);
 
 	return 0;
-
-teardown:
-	list_for_each_entry_continue_reverse(client, &device->clients, list)
-		if (client->ops->exit)
-			client->ops->exit(client);
-
-	mutex_unlock(&device->clients_lock);
-	return err;
 }
 EXPORT_SYMBOL(host1x_device_init);
 
-- 
2.18.0
