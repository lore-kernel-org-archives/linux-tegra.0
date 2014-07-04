From: Pawel Lebioda <pawel.lebioda89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] staging: nvec: remove unneccessary 'else' after 'return'
 statement
Date: Fri, 4 Jul 2014 21:57:50 +0200
Message-ID: <20140704195746.GA4346@ThinkPad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

This patch fixes the following warning reported by checkpatch.pl:

WARNING: else is not generally useful after a break or return
#235: FILE: drivers/staging/nvec/nvec.c:235:

Regards
Pawel Lebioda

Signed-off-by: Pawel Lebioda <pawel.lebioda89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 drivers/staging/nvec/nvec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 90f1c4d..8a3dd47 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -232,8 +232,7 @@ static size_t nvec_msg_size(struct nvec_msg *msg)
 		return 2;
 	else if (event_length == NVEC_3BYTES)
 		return 3;
-	else
-		return 0;
+	return 0;
 }
 
 /**
