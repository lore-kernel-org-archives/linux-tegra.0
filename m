From: Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v2 2/2] Revert "staging: nvec: ps2: change serio type to
 passthrough"
Date: Thu, 27 Oct 2016 17:22:09 +0300
Message-ID: <1477578154-21199-3-git-send-email-fercerpav@gmail.com>
References: <1477578154-21199-1-git-send-email-fercerpav@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1477578154-21199-1-git-send-email-fercerpav@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: devel@driverdev.osuosl.org
Cc: Paul Fertser <fercerpav@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
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

Signed-off-by: Paul Fertser <fercerpav@gmail.com>
---
 drivers/staging/nvec/nvec_ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index d63c4ef..910e87b 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -111,7 +111,7 @@ static int nvec_mouse_probe(struct platform_device *pdev)
 	if (!ser_dev)
 		return -ENOMEM;
 
-	ser_dev->id.type = SERIO_PS_PSTHRU;
+	ser_dev->id.type = SERIO_8042;
 	ser_dev->write = ps2_sendcommand;
 	ser_dev->start = ps2_startstreaming;
 	ser_dev->stop = ps2_stopstreaming;
-- 
2.7.0
