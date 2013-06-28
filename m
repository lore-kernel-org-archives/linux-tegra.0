From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] early init and DT platform devices allocation/registration
Date: Fri, 28 Jun 2013 10:49:15 +0200
Message-ID: <20130628.114915.1341075505557760886.hdoyu@nvidia.com>
References: <CACxGe6t9ifg9VRfXKypuhie3pXVPneZqcBy+J1bFpUaUx32P7g@mail.gmail.com><20130626.090030.1519009485651154440.hdoyu@nvidia.com><CACxGe6te2RzFb6nkSZQFrzVX4fkQo4pyzLJ1D7Lf=440mE+jyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6te2RzFb6nkSZQFrzVX4fkQo4pyzLJ1D7Lf=440mE+jyg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org" <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Pawel.Moll-5wv7dgnIgG8@public.gmane.org" <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote @ Wed, 26 Jun 2013 12:03:20 +0200:

> On Wed, Jun 26, 2013 at 7:00 AM, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote @ Tue, 25 Jun 2013 19:52:33 +0200:
> >
> >> > Here's my workaround. I need to call of_detach_node() with OF_DYNAMIC
> >> > to avoid duplicated device registration.
> >>
> >> Gah! my eyes!
> >>
> >> Don't do that. It is incredibly problematic. Look at inhibiting
> >> duplicate device creation instead.
> >
> > I may not follow this thread correctly, but could anyone point out the
> > above "inhibiting duplicate device creation" if there's already such
> > solution?
> 
> No, the solution doesn't exist yet, but it wouldn't be hard to
> implement. What you need to do is to add a struct device pointer to
> struct device_node, and set the pointer to the struct device when
> of_platform_device_create creates a device. (it would also need to be
> set for early_platform_device creation, but that's not something that
> should affect you). You would also add a check to
> of_platform_device_create to check if the device pointer is already
> set. If it is, then skip creation of the device.

Implemented as Grant suggested. At least this works for our case,
where IOMMU needs to be instanciated earlier than other device[1].
early_platform_device case still need to be covered.

[1] https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-June/036685.html

From da563c72f7fc37fedd4b7e3a957f41a484a19788 Mon Sep 17 00:00:00 2001
From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Fri, 28 Jun 2013 11:43:20 +0300
Subject: [PATCH RFC 1/1] of: dev_node has struct device pointer

To prevent of_platform_populate() from trying to populate duplicate
devices if a device has been already populated.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/of/base.c     |   23 +++++++++++++++++++++++
 drivers/of/platform.c |    8 ++++++++
 include/linux/of.h    |   16 ++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 5c54279..99062dd 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -230,6 +230,29 @@ const void *of_get_property(const struct device_node *np, const char *name,
 }
 EXPORT_SYMBOL(of_get_property);
 
+struct device *of_get_device(const struct device_node *node)
+{
+	struct device *dev;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	dev = node->dev;
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+
+	return dev;
+}
+EXPORT_SYMBOL(of_get_device);
+
+void of_set_device(struct device_node *node, struct device *dev)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	node->dev = dev;
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+}
+EXPORT_SYMBOL(of_set_device);
+
 /** Checks if the given "compat" string matches one of the strings in
  * the device's "compatible" property
  */
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index e0a6514..a8f6b09 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -203,10 +203,17 @@ struct platform_device *of_platform_device_create_pdata(
 					struct device *parent)
 {
 	struct platform_device *dev;
+	struct device *tmp;
 
 	if (!of_device_is_available(np))
 		return NULL;
 
+	tmp = of_get_device(np);
+	if (tmp) {
+		dev_info(tmp, "Already populated\n");
+		return to_platform_device(tmp);
+	}
+
 	dev = of_device_alloc(np, bus_id, parent);
 	if (!dev)
 		return NULL;
@@ -228,6 +235,7 @@ struct platform_device *of_platform_device_create_pdata(
 		return NULL;
 	}
 
+	of_set_device(np, &dev->dev);
 	return dev;
 }
 
diff --git a/include/linux/of.h b/include/linux/of.h
index 1fd08ca..b548522 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -60,6 +60,9 @@ struct device_node {
 	struct	kref kref;
 	unsigned long _flags;
 	void	*data;
+
+	struct device *dev;		/* Set only after populated */
+
 #if defined(CONFIG_SPARC)
 	const char *path_component_name;
 	unsigned int unique_id;
@@ -268,6 +271,8 @@ extern const void *of_get_property(const struct device_node *node,
 				int *lenp);
 #define for_each_property_of_node(dn, pp) \
 	for (pp = dn->properties; pp != NULL; pp = pp->next)
+extern struct device *of_get_device(const struct device_node *node);
+extern void of_set_device(struct device_node *node, struct device *dev);
 
 extern int of_n_addr_cells(struct device_node *np);
 extern int of_n_size_cells(struct device_node *np);
@@ -459,6 +464,17 @@ static inline const void *of_get_property(const struct device_node *node,
 	return NULL;
 }
 
+static inline struct device *of_get_device(const struct device_node *node)
+{
+	return NULL;
+}
+
+static inline void of_set_device(const struct device_node *node,
+				 struct device *dev);
+{
+	return -ENOSYS;
+}
+
 static inline int of_property_read_u64(const struct device_node *np,
 				       const char *propname, u64 *out_value)
 {
-- 
1.7.9.5
