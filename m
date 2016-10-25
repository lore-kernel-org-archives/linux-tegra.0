From: Paul Fertser <fercerpav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Revert "staging: nvec: ps2: change serio type to passthrough"
Date: Tue, 25 Oct 2016 15:10:55 +0300
Message-ID: <1477397482-31087-1-git-send-email-fercerpav@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: Paul Fertser <fercerpav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This reverts commit 36b30d6138f4677514aca35ab76c20c1604baaad.

This is necessary to detect paz00 (ac100) touchpad properly as one
speaking ETPS/2 protocol. Without it X.org's synaptics driver doesn't
work as the touchpad is detected as an ImPS/2 mouse instead.

Commit ec6184b1c717b8768122e25fe6d312f609cc1bb4 changed the way
auto-detection is performed on ports marked as pass through and made the
issue apparent.

A pass through port is an additional PS/2 port used to connect a slave
device to a master device that is using PS/2 to communicate with the
host (so slave's PS/2 communication is tunneled over master's PS/2
link). "Synaptics PS/2 TouchPad Interfacing Guide" describes such a
setup (PS/2 PASS-THROUGH OPTION section).

Since paz00's embedded controller is not connected to a PS/2 port
itself, the PS/2 interface it exposes is not a pass-through one.

Acked-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Signed-off-by: Paul Fertser <fercerpav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/staging/nvec/nvec_ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index a324322..c83eeb4 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -112,7 +112,7 @@ static int nvec_mouse_probe(struct platform_device *pdev)
 	if (!ser_dev)
 		return -ENOMEM;
 
-	ser_dev->id.type = SERIO_PS_PSTHRU;
+	ser_dev->id.type = SERIO_8042;
 	ser_dev->write = ps2_sendcommand;
 	ser_dev->start = ps2_startstreaming;
 	ser_dev->stop = ps2_stopstreaming;
-- 
2.7.0
