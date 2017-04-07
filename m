From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: [PATCH 1/1] memory: tegra: fix fdc test bug
Date: Fri,  7 Apr 2017 18:28:20 +0100
Message-ID: <20170407172820.21292-1-ben.dooks@codethink.co.uk>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The fdc variable is a bool, taking the address of this will generally
produce true, thus skewing any users of the tegra_mc_set_latency_allowance
code.

Note, this does not seem to be producing a compiler warning. This was only
spotted as it meant a caller was seeing 3 times higher than expected
register results.

Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
---
 drivers/memory/tegra/mc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index fb44d1741862..e20470736319 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -121,7 +121,7 @@ int tegra_mc_set_latency_allowance(int client_id, unsigned int bandwidth)
 
 	WARN_ON(client->id != client_id);
 
-	if (&client->fdc)
+	if (client->fdc)
 		atom_bytes = plat_mc->soc->atom_size_fdc;
 	else
 		atom_bytes = plat_mc->soc->atom_size;
-- 
2.11.0
