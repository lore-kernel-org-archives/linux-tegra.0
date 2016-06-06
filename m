From: Rithvik Patibandla <rithvikp98@gmail.com>
Subject: [PATCH] Code cleanup - nvec
Date: Tue,  7 Jun 2016 04:35:18 +0530
Message-ID: <1465254318-17124-1-git-send-email-rithvikp98@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: marvin24@gmx.de
Cc: linux-tegra@vger.kernel.org, gregkh@linuxfoundation.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Rithvik Patibandla <rithvikp98@gmail.com>
---
 drivers/staging/nvec/nvec-keytable.h | 3 +--
 drivers/staging/nvec/nvec_power.c    | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/nvec/nvec-keytable.h b/drivers/staging/nvec/nvec-keytable.h
index 1dc22cb..b51f756 100644
--- a/drivers/staging/nvec/nvec-keytable.h
+++ b/drivers/staging/nvec/nvec-keytable.h
@@ -17,8 +17,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along
- * with this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+ * with this program; if not, it is already included in Linux.
  */
 
 static unsigned short code_tab_102us[] = {
diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index fcbb0fa..09befbb 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -442,7 +442,7 @@ static struct platform_driver nvec_power_driver = {
 	.remove = nvec_power_remove,
 	.driver = {
 		   .name = "nvec-power",
-		   }
+		}
 };
 
 module_platform_driver(nvec_power_driver);
-- 
2.7.4
