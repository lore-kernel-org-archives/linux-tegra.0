From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 03/10] gpu: host1x: Add lock around channel allocation
Date: Sun,  5 Nov 2017 13:01:11 +0200
Message-ID: <20171105110118.15142-4-mperttunen@nvidia.com>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171105110118.15142-1-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: digetx@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

With the new channel allocation model, multiple threads can be
allocating channels simultaneously. Therefore we need to add a lock
around the code.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/channel.c | 7 +++++++
 drivers/gpu/host1x/channel.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/host1x/channel.c b/drivers/gpu/host1x/channel.c
index 2fb93c27c1d9..9d8cad12f9d8 100644
--- a/drivers/gpu/host1x/channel.c
+++ b/drivers/gpu/host1x/channel.c
@@ -42,6 +42,8 @@ int host1x_channel_list_init(struct host1x_channel_list *chlist,
 
 	bitmap_zero(chlist->allocated_channels, num_channels);
 
+	mutex_init(&chlist->lock);
+
 	return 0;
 }
 
@@ -111,8 +113,11 @@ static struct host1x_channel *acquire_unused_channel(struct host1x *host)
 	unsigned int max_channels = host->info->nb_channels;
 	unsigned int index;
 
+	mutex_lock(&chlist->lock);
+
 	index = find_first_zero_bit(chlist->allocated_channels, max_channels);
 	if (index >= max_channels) {
+		mutex_unlock(&chlist->lock);
 		dev_err(host->dev, "failed to find free channel\n");
 		return NULL;
 	}
@@ -121,6 +126,8 @@ static struct host1x_channel *acquire_unused_channel(struct host1x *host)
 
 	set_bit(index, chlist->allocated_channels);
 
+	mutex_unlock(&chlist->lock);
+
 	return &chlist->channels[index];
 }
 
diff --git a/drivers/gpu/host1x/channel.h b/drivers/gpu/host1x/channel.h
index 7068e42d42df..e68a8ae9a670 100644
--- a/drivers/gpu/host1x/channel.h
+++ b/drivers/gpu/host1x/channel.h
@@ -29,6 +29,8 @@ struct host1x_channel;
 
 struct host1x_channel_list {
 	struct host1x_channel *channels;
+
+	struct mutex lock;
 	unsigned long *allocated_channels;
 };
 
-- 
2.14.2
