From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 01/11] tegrarcm: Change NVIDIA license to apply to all miniloader files
Date: Mon, 9 Sep 2013 13:15:51 -0700
Message-ID: <1378757761-20939-2-git-send-email-amartin@nvidia.com>
References: <1378757761-20939-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378757761-20939-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Change the LICENSE file to make it clear that the NVIDIA proprietary
license applies to all miniloader files, not just the ones explicitly
listed.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 LICENSE | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/LICENSE b/LICENSE
index e126375..10d0211 100644
--- a/LICENSE
+++ b/LICENSE
@@ -26,8 +26,8 @@
 # OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 
-The files tegra20-miniloader.h and tegra30-miniloader.h are provided
-pursuant to the following license agreement:
+The files in the directory src/miniloader are provided pursuant to the
+following license agreement:
 
 License For Use of NVIDIA Software
 
-- 
1.8.1.5
