From: Riku Salminen <riku-o6I3w6J1r1wtq7phqP6ubQ@public.gmane.org>
Subject: [PATCH] Staging: nvec: Remove FSF's mailing address
Date: Wed, 29 Mar 2017 08:34:54 +0300
Message-ID: <20170329053454.23324-1-riku@laatikko.io>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: marvin24-Mmb7MZpHnFY@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Riku Salminen <riku-o6I3w6J1r1wtq7phqP6ubQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Removed Free Software Foundation's address from the copyright notice
and replaced it with a link to http://www.gnu.org/licenses

Signed-off-by: Riku Salminen <riku-o6I3w6J1r1wtq7phqP6ubQ@public.gmane.org>
---
 drivers/staging/nvec/nvec-keytable.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec-keytable.h b/drivers/staging/nvec/nvec-keytable.h
index 1dc22cb8812a..7008c96bdbbe 100644
--- a/drivers/staging/nvec/nvec-keytable.h
+++ b/drivers/staging/nvec/nvec-keytable.h
@@ -17,8 +17,7 @@
  * more details.
  *
  * You should have received a copy of the GNU General Public License along
- * with this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+ * with this program; if not, see http://www.gnu.org/licenses
  */
 
 static unsigned short code_tab_102us[] = {
-- 
2.11.0
