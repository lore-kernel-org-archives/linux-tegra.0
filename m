From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH V6 02/12] mailbox: Make struct mbox_controller's ops field
 const
Date: Mon, 24 Nov 2014 16:17:14 -0800
Message-ID: <1416874644-12070-3-git-send-email-abrestic@chromium.org>
References: <1416874644-12070-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1416874644-12070-1-git-send-email-abrestic@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrew Bresticker <abrestic@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, linux-arm-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

The mailbox controller's channel ops ought to be read-only.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
No changes from v5.
New for v5.
---
 include/linux/mailbox_controller.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index d4cf96f..68c4245 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -72,7 +72,7 @@ struct mbox_chan_ops {
  */
 struct mbox_controller {
 	struct device *dev;
-	struct mbox_chan_ops *ops;
+	const struct mbox_chan_ops *ops;
 	struct mbox_chan *chans;
 	int num_chans;
 	bool txdone_irq;
-- 
2.1.0.rc2.206.gedb03e5
