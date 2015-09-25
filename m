From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] dmaengine: of: Allow #dma-cells to be zero
Date: Fri, 25 Sep 2015 15:56:38 +0100
Message-ID: <1443193000-457-2-git-send-email-jonathanh@nvidia.com>
References: <1443193000-457-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443193000-457-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Currently, the #dma-cells property must be 1 or more. However, for some
DMA controllers, where DMA clients may use any DMA channel and it is not
necessary to specify any other DMA information in the device-tree DMA
binding, setting #dma-cells to 0 is desirable. The Tegra210 ADMA
controller is an example of a DMA controller where neither the DMA
channel or the hardware request signal need to be encoded in the
device-tree binding.

By allowing DMA controllers to set #dma-cells to 0, means that the
"dma-names" property for these controllers is not needed. Therefore,
update the of_dma_request_slave_channel() and of_dma_match_channel()
functions to ignore this property if no name is provided.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/dma/dma.txt | 12 ++++++++----
 drivers/dma/of-dma.c                          | 23 +++++++++++++++--------
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/dma.txt b/Documentation/devicetree/bindings/dma/dma.txt
index 6312fb00ce8d..4d73916fc879 100644
--- a/Documentation/devicetree/bindings/dma/dma.txt
+++ b/Documentation/devicetree/bindings/dma/dma.txt
@@ -8,9 +8,12 @@ controller.
 * DMA controller
 
 Required property:
-- #dma-cells: 		Must be at least 1. Used to provide DMA controller
-			specific information. See DMA client binding below for
-			more details.
+- #dma-cells: 		Used to provide DMA controller specific information.
+			Can be 0 for DMA controllers where clients may use
+			any channel and any DMA specific information, such
+			as a hardware request signal, does not need to be
+			encoded in the binding. See DMA client binding below
+			for more details.
 
 Optional properties:
 - dma-channels: 	Number of DMA channels supported by the controller.
@@ -79,7 +82,8 @@ Required property:
 			are defined in the binding of the DMA client device.
 			Multiple DMA specifiers can be used to represent
 			alternatives and in this case the dma-names for those
-			DMA specifiers must be identical (see examples).
+			DMA specifiers must be identical (see examples). This
+			is optional for DMA controllers where #dma-cells is 0.
 
 Examples:
 
diff --git a/drivers/dma/of-dma.c b/drivers/dma/of-dma.c
index 1e1f2986eba8..ef3d260610ea 100644
--- a/drivers/dma/of-dma.c
+++ b/drivers/dma/of-dma.c
@@ -214,11 +214,13 @@ static int of_dma_match_channel(struct device_node *np, const char *name,
 {
 	const char *s;
 
-	if (of_property_read_string_index(np, "dma-names", index, &s))
-		return -ENODEV;
+	if (name) {
+		if (of_property_read_string_index(np, "dma-names", index, &s))
+			return -ENODEV;
 
-	if (strcmp(name, s))
-		return -ENODEV;
+		if (strcmp(name, s))
+			return -ENODEV;
+	}
 
 	if (of_parse_phandle_with_args(np, "dmas", "#dma-cells", index,
 				       dma_spec))
@@ -230,7 +232,7 @@ static int of_dma_match_channel(struct device_node *np, const char *name,
 /**
  * of_dma_request_slave_channel - Get the DMA slave channel
  * @np:		device node to get DMA request from
- * @name:	name of desired channel
+ * @name:	name of desired channel (optional)
  *
  * Returns pointer to appropriate DMA channel on success or an error pointer.
  */
@@ -243,8 +245,8 @@ struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
 	int			count, i;
 	int			ret_no_channel = -ENODEV;
 
-	if (!np || !name) {
-		pr_err("%s: not enough information provided\n", __func__);
+	if (!np) {
+		pr_err("%s: device node is not valid\n", __func__);
 		return ERR_PTR(-ENODEV);
 	}
 
@@ -252,7 +254,12 @@ struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
 	if (!of_find_property(np, "dmas", NULL))
 		return ERR_PTR(-ENODEV);
 
-	count = of_property_count_strings(np, "dma-names");
+	/*
+	 * If a name is not provided, then assume that there is one
+	 * DMA specifier in the list for the client and so set the
+	 * count to 1 and see if this matches.
+	 */
+	count = name ? of_property_count_strings(np, "dma-names") : 1;
 	if (count < 0) {
 		pr_err("%s: dma-names property of node '%s' missing or empty\n",
 			__func__, np->full_name);
-- 
2.1.4
