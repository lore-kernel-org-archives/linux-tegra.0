From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] dt-bindings: reserved-memory: Introduce memory-region{s,-names}
Date: Fri,  3 Apr 2020 20:56:37 +0200
Message-ID: <20200403185640.118569-2-thierry.reding@gmail.com>
References: <20200403185640.118569-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200403185640.118569-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In order to make the reserved-memory bindings more consistent with other
existing bindings, add a memory-region-names property that contains an
array of strings that name the entries of the memory-region property and
allows these regions to be looked up by name.

Also add the memory-regions property as an alias for the existing
memory-region property. This is again for consistency with other similar
bindings and makes it clearer that this property can take multiple
<phandle, specifier> pairs.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/reserved-memory/reserved-memory.txt     | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
index bac4afa3b197..823e619cfca3 100644
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
@@ -76,7 +76,11 @@ Device node references to reserved memory
 Regions in the /reserved-memory node may be referenced by other device
 nodes by adding a memory-region property to the device node.
 
-memory-region (optional) - phandle, specifier pairs to children of /reserved-memory
+memory-regions (optional) - phandle, specifier pairs to children of /reserved-memory
+memory-region-names (optional) - a list of names, one for each corresponding
+  entry in the memory-regions property
+
+memory-region (optional) - alias for memory-regions
 
 Example
 -------
@@ -120,17 +124,17 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
 	/* ... */
 
 	fb0: video@12300000 {
-		memory-region = <&display_reserved>;
+		memory-regions = <&display_reserved>;
 		/* ... */
 	};
 
 	scaler: scaler@12500000 {
-		memory-region = <&multimedia_reserved>;
+		memory-regions = <&multimedia_reserved>;
 		/* ... */
 	};
 
 	codec: codec@12600000 {
-		memory-region = <&multimedia_reserved>;
+		memory-regions = <&multimedia_reserved>;
 		/* ... */
 	};
 };
-- 
2.24.1
