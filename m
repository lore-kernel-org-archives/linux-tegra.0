From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: [PATCH 3/7] drivers/staging: make android tegra_ion.c properly tristate
Date: Sun, 11 Oct 2015 15:47:30 -0400
Message-ID: <1444592854-30683-4-git-send-email-paul.gortmaker@windriver.com>
References: <1444592854-30683-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444592854-30683-1-git-send-email-paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Riley Andrews <riandrews-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/staging/android/ion/Kconfig:config ION_TEGRA
drivers/staging/android/ion/Kconfig:    tristate "Ion for Tegra"

=2E..which led me to incorrectly conclude this file was built modular
earlier.  However the above CONFIG is just used to enter the dir and
once we do enter that dir, we see the build is unconditional:

drivers/staging/android/ion/Makefile:obj-$(CONFIG_ION_TEGRA) +=3D tegra=
/
drivers/staging/android/ion/tegra/Makefile:obj-y +=3D tegra_ion.o

=2E..meaning that it currently is not being built as a module by anyone=
=2E

However, given that the Kconfig did explicitly choose tristate, and tha=
t
the dummy ion driver is (functionally) tristate, I chose to make the
Makefile do the right thing for it to build as a module.

After this change, on an ARM allmodconfig, we see:

  CC [M]  drivers/staging/android/ion/tegra/tegra_ion.o

so it does build OK as a module.  I can't vouch for the modular
functionality however, so consider this compile tested only.

Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "Arve Hj=C3=B8nnev=C3=A5g" <arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Riley Andrews <riandrews-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
---
 drivers/staging/android/ion/tegra/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/android/ion/tegra/Makefile b/drivers/stagi=
ng/android/ion/tegra/Makefile
index 11cd003fb08f..808f1f53f11a 100644
--- a/drivers/staging/android/ion/tegra/Makefile
+++ b/drivers/staging/android/ion/tegra/Makefile
@@ -1 +1 @@
-obj-y +=3D tegra_ion.o
+obj-$(CONFIG_ION_TEGRA) +=3D tegra_ion.o
--=20
2.6.1
