From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] PM / devfreq: tegra30: Delete an error message in
 tegra_devfreq_probe()
Date: Sat, 4 Apr 2020 20:45:36 +0200
Message-ID: <ba67e238-43a7-6c53-363e-7a2c12f09949@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>
List-Id: linux-tegra@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Apr 2020 20:34:02 +0200

The function =E2=80=9Cplatform_get_irq=E2=80=9D can log an error already.
Thus omit a redundant message for the exception handling in the
calling function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/devfreq/tegra30-devfreq.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-d=
evfreq.c
index 28b2c7ca416e..93e6f4b25b04 100644
=2D-- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -807,10 +807,9 @@ static int tegra_devfreq_probe(struct platform_device=
 *pdev)
 	}

 	err =3D platform_get_irq(pdev, 0);
-	if (err < 0) {
-		dev_err(&pdev->dev, "Failed to get IRQ: %d\n", err);
+	if (err < 0)
 		return err;
-	}
+
 	tegra->irq =3D err;

 	irq_set_status_flags(tegra->irq, IRQ_NOAUTOEN);
=2D-
2.26.0
