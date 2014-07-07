From: Guillaume Clement <gclement@baobob.org>
Subject: [PATCH 2/5] staging:nvec: Remove unnessary out of memory message.
Date: Tue,  8 Jul 2014 00:31:34 +0200
Message-ID: <1404772297-6549-3-git-send-email-gclement@baobob.org>
References: <1404772297-6549-1-git-send-email-gclement@baobob.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404772297-6549-1-git-send-email-gclement@baobob.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Julian Andres Klode <jak@jak-linux.org>, Marc Dietrich <marvin24@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Guillaume Clement <gclement@baobob.org>
List-Id: linux-tegra@vger.kernel.org

Logging messages that show some type of "out of memory" error
are generally unnecessary as there is a generic message and
a stack dump done by the memory subsystem.

Signed-off-by: Guillaume Cl=C3=A9ment <gclement@baobob.org>
---
 drivers/staging/nvec/nvec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 8a3dd47..d325048 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -806,10 +806,9 @@ static int tegra_nvec_probe(struct platform_device=
 *pdev)
 	}
=20
 	nvec =3D devm_kzalloc(&pdev->dev, sizeof(struct nvec_chip), GFP_KERNE=
L);
-	if (nvec =3D=3D NULL) {
-		dev_err(&pdev->dev, "failed to reserve memory\n");
+	if (nvec =3D=3D NULL)
 		return -ENOMEM;
-	}
+
 	platform_set_drvdata(pdev, nvec);
 	nvec->dev =3D &pdev->dev;
=20
--=20
1.8.5.5
