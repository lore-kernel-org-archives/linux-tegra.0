From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/tegra: vic: Use devm_platform_ioremap_resource() in
 vic_probe()
Date: Sat, 21 Sep 2019 21:03:57 +0200
Message-ID: <50adb1d3-93fc-44c1-9988-02036911ee46@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Arto Merilainen <amerilainen@nvidia.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andrew Chew <achew@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 20:51:52 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/tegra/vic.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index cd0399fd8c63..bc72d326588b 100644
=2D-- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -370,7 +370,6 @@ static int vic_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
 	struct host1x_syncpt **syncpts;
-	struct resource *regs;
 	struct vic *vic;
 	int err;

@@ -384,13 +383,7 @@ static int vic_probe(struct platform_device *pdev)
 	if (!syncpts)
 		return -ENOMEM;

-	regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!regs) {
-		dev_err(&pdev->dev, "failed to get registers\n");
-		return -ENXIO;
-	}
-
-	vic->regs =3D devm_ioremap_resource(dev, regs);
+	vic->regs =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(vic->regs))
 		return PTR_ERR(vic->regs);

=2D-
2.23.0
