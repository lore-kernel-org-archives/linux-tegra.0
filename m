From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: [PATCH] "drivers/staging: mark android/ion fcns with EXPORT_SYMBOL for tristate
Date: Tue, 13 Oct 2015 16:46:53 -0400
Message-ID: <1444769213-7845-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Riley Andrews <riandrews-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

In a recent change, we made a bool into a tristate in:
"drivers/staging: make android tegra_ion.c properly tristate", since it
was self evident that was the original intention.  However on the final
link phase we'll see an allmodconfig fail with:

ERROR: "ion_device_add_heap" [drivers/staging/android/ion/tegra/tegra_i=
on.ko] undefined!
ERROR: "ion_heap_create" [drivers/staging/android/ion/tegra/tegra_ion.k=
o] undefined!
ERROR: "ion_device_create" [drivers/staging/android/ion/tegra/tegra_ion=
=2Eko] undefined!
ERROR: "ion_heap_destroy" [drivers/staging/android/ion/tegra/tegra_ion.=
ko] undefined!
ERROR: "ion_device_destroy" [drivers/staging/android/ion/tegra/tegra_io=
n.ko] undefined!

Export the above using the non GPL specific export, since that is what
the rest of the ion code base does.

Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "Arve Hj=C3=B8nnev=C3=A5g" <arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Riley Andrews <riandrews-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Reported-by: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
---
 drivers/staging/android/ion/ion.c      | 3 +++
 drivers/staging/android/ion/ion_heap.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/androi=
d/ion/ion.c
index 91b9b75e41da..e237e9f3312d 100644
--- a/drivers/staging/android/ion/ion.c
+++ b/drivers/staging/android/ion/ion.c
@@ -1557,6 +1557,7 @@ void ion_device_add_heap(struct ion_device *dev, =
struct ion_heap *heap)
=20
 	up_write(&dev->lock);
 }
+EXPORT_SYMBOL(ion_device_add_heap);
=20
 struct ion_device *ion_device_create(long (*custom_ioctl)
 				     (struct ion_client *client,
@@ -1606,6 +1607,7 @@ debugfs_done:
 	idev->clients =3D RB_ROOT;
 	return idev;
 }
+EXPORT_SYMBOL(ion_device_create);
=20
 void ion_device_destroy(struct ion_device *dev)
 {
@@ -1614,6 +1616,7 @@ void ion_device_destroy(struct ion_device *dev)
 	/* XXX need to free the heaps and clients ? */
 	kfree(dev);
 }
+EXPORT_SYMBOL(ion_device_destroy);
=20
 void __init ion_reserve(struct ion_platform_data *data)
 {
diff --git a/drivers/staging/android/ion/ion_heap.c b/drivers/staging/a=
ndroid/ion/ion_heap.c
index fd13d05b538a..e97a2c32ed78 100644
--- a/drivers/staging/android/ion/ion_heap.c
+++ b/drivers/staging/android/ion/ion_heap.c
@@ -352,6 +352,7 @@ struct ion_heap *ion_heap_create(struct ion_platfor=
m_heap *heap_data)
 	heap->id =3D heap_data->id;
 	return heap;
 }
+EXPORT_SYMBOL(ion_heap_create);
=20
 void ion_heap_destroy(struct ion_heap *heap)
 {
@@ -379,3 +380,4 @@ void ion_heap_destroy(struct ion_heap *heap)
 		       heap->type);
 	}
 }
+EXPORT_SYMBOL(ion_heap_destroy);
--=20
2.6.1
