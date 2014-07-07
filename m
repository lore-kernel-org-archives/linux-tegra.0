From: Guillaume Clement <gclement@baobob.org>
Subject: [PATCH 3/5] staging:nvec: Add missing blank line after declarations.
Date: Tue,  8 Jul 2014 00:31:35 +0200
Message-ID: <1404772297-6549-4-git-send-email-gclement@baobob.org>
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

Signed-off-by: Guillaume Cl=C3=A9ment <gclement@baobob.org>
---
 drivers/staging/nvec/nvec_paz00.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/nvec/nvec_paz00.c b/drivers/staging/nvec/n=
vec_paz00.c
index 934b796..e2e675a 100644
--- a/drivers/staging/nvec/nvec_paz00.c
+++ b/drivers/staging/nvec/nvec_paz00.c
@@ -35,6 +35,7 @@ static void nvec_led_brightness_set(struct led_classd=
ev *led_cdev,
 {
 	struct nvec_led *led =3D to_nvec_led(led_cdev);
 	unsigned char buf[] =3D NVEC_LED_REQ;
+
 	buf[4] =3D value;
=20
 	nvec_write_async(led->nvec, buf, sizeof(buf));
--=20
1.8.5.5
