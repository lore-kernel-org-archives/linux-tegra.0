From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] gpu: host1x: Ignore clients initialization failure
Date: Wed,  1 Aug 2018 18:08:07 +0300
Message-ID: <20180801150807.15926-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <cyndis@kapsi.fi>, Kyle Evans <kvans32@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From time to time new bugs are popping up, causing some host1x client to
fail its initialization. Currently a single clients initialization failure
causes whole host1x device registration to fail, as a result a single DRM
sub-device initialization failure makes whole DRM initialization to fail.
Let's ignore clients initialization failure, as a result display panel
lights up even if some DRM clients (say GR2D or VIC) fail to initialize.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/bus.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 815bdb42e3f0..145019e105e4 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -199,34 +199,30 @@ static void host1x_subdev_unregister(struct host1x_device *device,
  */
 int host1x_device_init(struct host1x_device *device)
 {
-	struct host1x_client *client;
+	struct host1x_client *client, *cl;
 	int err;
 
+	mutex_lock(&clients_lock);
 	mutex_lock(&device->clients_lock);
 
-	list_for_each_entry(client, &device->clients, list) {
+	list_for_each_entry_safe(client, cl, &device->clients, list) {
 		if (client->ops && client->ops->init) {
 			err = client->ops->init(client);
 			if (err < 0) {
 				dev_err(&device->dev,
 					"failed to initialize %s: %d\n",
 					dev_name(client->dev), err);
-				goto teardown;
+
+				/* add the client to the list of idle clients */
+				list_add_tail(&client->list, &clients);
 			}
 		}
 	}
 
 	mutex_unlock(&device->clients_lock);
+	mutex_unlock(&clients_lock);
 
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
