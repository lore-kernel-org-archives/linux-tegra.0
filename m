From: Guillaume Clement <gclement@baobob.org>
Subject: [PATCH 5/5] staging:nvec: Add missing blank line after declarations.
Date: Tue,  8 Jul 2014 00:31:37 +0200
Message-ID: <1404772297-6549-6-git-send-email-gclement@baobob.org>
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
 drivers/staging/nvec/nvec_ps2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nve=
c_ps2.c
index 45b2f13..f56f1db 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -53,12 +53,14 @@ static struct nvec_ps2 ps2_dev;
 static int ps2_startstreaming(struct serio *ser_dev)
 {
 	unsigned char buf[] =3D { NVEC_PS2, AUTO_RECEIVE_N, PACKET_SIZE };
+
 	return nvec_write_async(ps2_dev.nvec, buf, sizeof(buf));
 }
=20
 static void ps2_stopstreaming(struct serio *ser_dev)
 {
 	unsigned char buf[] =3D { NVEC_PS2, CANCEL_AUTO_RECEIVE };
+
 	nvec_write_async(ps2_dev.nvec, buf, sizeof(buf));
 }
=20
--=20
1.8.5.5
