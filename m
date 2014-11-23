From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 1/2] staging: android: ion: Deletion of unnecessary checks
 before two function calls
Date: Sun, 23 Nov 2014 19:39:23 +0100
Message-ID: <547229DB.8030606@users.sourceforge.net>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <54722893.6020301@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <54722893.6020301@users.sourceforge.net>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, devel@driverdev.osuosl.org, linux-tegra@vger.kernel.org
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Nov 2014 18:48:15 +0100

The functions ion_heap_destroy() and vfree() perform also input
parameter validation. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/android/ion/ion.c              | 6 ++----
 drivers/staging/android/ion/ion_dummy_driver.c | 6 ++----
 drivers/staging/android/ion/tegra/tegra_ion.c  | 6 ++----
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
index 2703609..df12cc3 100644
--- a/drivers/staging/android/ion/ion.c
+++ b/drivers/staging/android/ion/ion.c
@@ -263,8 +263,7 @@ err:
 	heap->ops->unmap_dma(heap, buffer);
 	heap->ops->free(buffer);
 err1:
-	if (buffer->pages)
-		vfree(buffer->pages);
+	vfree(buffer->pages);
 err2:
 	kfree(buffer);
 	return ERR_PTR(ret);
@@ -276,8 +275,7 @@ void ion_buffer_destroy(struct ion_buffer *buffer)
 		buffer->heap->ops->unmap_kernel(buffer->heap, buffer);
 	buffer->heap->ops->unmap_dma(buffer->heap, buffer);
 	buffer->heap->ops->free(buffer);
-	if (buffer->pages)
-		vfree(buffer->pages);
+	vfree(buffer->pages);
 	kfree(buffer);
 }
 
diff --git a/drivers/staging/android/ion/ion_dummy_driver.c b/drivers/staging/android/ion/ion_dummy_driver.c
index 3a45e79..d06bf52 100644
--- a/drivers/staging/android/ion/ion_dummy_driver.c
+++ b/drivers/staging/android/ion/ion_dummy_driver.c
@@ -112,10 +112,8 @@ static int __init ion_dummy_init(void)
 	}
 	return 0;
 err:
-	for (i = 0; i < dummy_ion_pdata.nr; i++) {
-		if (heaps[i])
-			ion_heap_destroy(heaps[i]);
-	}
+	for (i = 0; i < dummy_ion_pdata.nr; ++i)
+		ion_heap_destroy(heaps[i]);
 	kfree(heaps);
 
 	if (carveout_ptr) {
diff --git a/drivers/staging/android/ion/tegra/tegra_ion.c b/drivers/staging/android/ion/tegra/tegra_ion.c
index 11c7cce..5b8ef0e 100644
--- a/drivers/staging/android/ion/tegra/tegra_ion.c
+++ b/drivers/staging/android/ion/tegra/tegra_ion.c
@@ -54,10 +54,8 @@ static int tegra_ion_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, idev);
 	return 0;
 err:
-	for (i = 0; i < num_heaps; i++) {
-		if (heaps[i])
-			ion_heap_destroy(heaps[i]);
-	}
+	for (i = 0; i < num_heaps; ++i)
+		ion_heap_destroy(heaps[i]);
 	return err;
 }
 
-- 
2.1.3
