From: Guillaume Clement <gclement-nky7s8twH9kdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/5] staging:nvec: Fix "unnecessary else" coding style warning.
Date: Tue,  8 Jul 2014 00:31:33 +0200
Message-ID: <1404772297-6549-2-git-send-email-gclement@baobob.org>
References: <1404772297-6549-1-git-send-email-gclement@baobob.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404772297-6549-1-git-send-email-gclement-nky7s8twH9kdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guillaume Clement <gclement-nky7s8twH9kdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The last else is unnessary as all the if statements end with a return.

Signed-off-by: Guillaume Cl=C3=A9ment <gclement-nky7s8twH9kdnm+yROfE0A@public.gmane.org>
---
 drivers/staging/nvec/nvec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 90f1c4d..8a3dd47 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -232,8 +232,7 @@ static size_t nvec_msg_size(struct nvec_msg *msg)
 		return 2;
 	else if (event_length =3D=3D NVEC_3BYTES)
 		return 3;
-	else
-		return 0;
+	return 0;
 }
=20
 /**
--=20
1.8.5.5
