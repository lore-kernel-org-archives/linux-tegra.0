From: Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/7] i2c: tegra: remove dead code
Date: Thu, 23 Jul 2020 17:48:47 +0530
Message-ID: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

When I2C_HEADER_CONT_ON_NAK bit in IO header is set then =E2=80=9CNo ACK
from slave=E2=80=9D error is not reported (NACK is considered as ACK
and transfer is continued). So if I2C_ERR_NO_ACK is set, it would
imply I2C_M_IGNORE_NAK is not set and hence this code will never
execute. When I2C_HEADER_CONT_ON_NAK bit in IO header is set then
=E2=80=9CNo ACK from slave=E2=80=9D error is not reported.
Condition (msg->flags & I2C_M_IGNORE_NAK) will never be hit

Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.=
c
index 1577296..c6c870c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1336,11 +1336,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *=
i2c_dev,
 		return -EAGAIN;
 	}
=20
-	if (i2c_dev->msg_err =3D=3D I2C_ERR_NO_ACK) {
-		if (msg->flags & I2C_M_IGNORE_NAK)
-			return 0;
+	if (i2c_dev->msg_err =3D=3D I2C_ERR_NO_ACK)
 		return -EREMOTEIO;
-	}
=20
 	return -EIO;
 }
--=20
2.7.4
