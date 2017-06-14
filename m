From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 12/20] gpu: host1x: Forbid relocation address shifting in the firewall
Date: Thu, 15 Jun 2017 02:18:35 +0300
Message-ID: <f365d7d81304d616d129231bd6471965ac8833f5.1497480757.git.digetx@gmail.com>
References: <cover.1497480751.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Incorrectly shifted relocation address will cause a lower memory corruption
and likely a hang on a write or a read of an arbitrary data in case of IOMMU
absence. As of now, there is no known use for the address shifting and adding
a proper shifts / sizes validation is a much more work. Let's forbid shifts
in the firewall till a proper validation is implemented.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/job.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 4208329ca2af..a911de6386b4 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -330,6 +330,10 @@ static bool check_reloc(struct host1x_reloc *reloc, struct host1x_bo *cmdbuf,
 	if (reloc->cmdbuf.bo != cmdbuf || reloc->cmdbuf.offset != offset)
 		return false;
 
+	/* relocation shift value validation isn't implemented yet */
+	if (reloc->shift)
+		return false;
+
 	return true;
 }
 
-- 
2.13.0
