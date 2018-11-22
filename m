From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] soc/tegra: Fix terminating condition
Date: Thu, 22 Nov 2018 00:52:44 -0700
Message-ID: <20181122075244.3909-1-natechancellor@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Clang warns:

drivers/soc/tegra/common.c:27:16: error: address of array
'match->compatible' will always evaluate to 'true'
[-Werror,-Wpointer-bool-conversion]
        while (match->compatible) {
        ~~~~~  ~~~~~~~^~~~~~~~~~
1 error generated.

Whoops, we have an infinite loop and QEMU no longer boots...

https://travis-ci.com/ClangBuiltLinux/continuous-integration/jobs/160242918

Check that the first character of the string isn't null so that the loop
properly terminates.

Fixes: c57eff9503a5 ("soc/tegra: refactor soc_is_tegra()")
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/soc/tegra/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index 8a538b968fe9..54627ca957e8 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -24,7 +24,7 @@ bool soc_is_tegra(void)
 {
 	const struct of_device_id *match = tegra_machine_match;
 
-	while (match->compatible) {
+	while (match->compatible[0]) {
 		if (of_machine_is_compatible(match->compatible))
 			return true;
 
-- 
2.20.0.rc1
