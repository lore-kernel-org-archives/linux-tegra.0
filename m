From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] gpu: host1x: Cleanup on initialization failure
Date: Mon, 27 Nov 2017 11:11:07 +0100
Message-ID: <20171127101107.22709-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

When an error happens during the initialization of one of the sub-
devices, make sure to properly cleanup all sub-devices that have been
initialized up to that point.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/bus.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 2e57c9cea696..88a3558b7916 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -211,8 +211,7 @@ int host1x_device_init(struct host1x_device *device)
 				dev_err(&device->dev,
 					"failed to initialize %s: %d\n",
 					dev_name(client->dev), err);
-				mutex_unlock(&device->clients_lock);
-				return err;
+				goto teardown;
 			}
 		}
 	}
@@ -220,6 +219,14 @@ int host1x_device_init(struct host1x_device *device)
 	mutex_unlock(&device->clients_lock);
 
 	return 0;
+
+teardown:
+	list_for_each_entry_continue_reverse(client, &device->clients, list)
+		if (client->ops->exit)
+			client->ops->exit(client);
+
+	mutex_unlock(&device->clients_lock);
+	return err;
 }
 EXPORT_SYMBOL(host1x_device_init);
 
-- 
2.15.0
