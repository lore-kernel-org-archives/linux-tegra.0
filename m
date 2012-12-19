From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=202/6=5D=20drm=3A=20tegra=3A=20don=27t=20leave=20clients=20host1x=20member=20uninitialized?=
Date: Wed, 19 Dec 2012 22:38:53 +0100
Message-ID: <1355953137-31563-3-git-send-email-dev@lynxeye.de>
References: <1355953137-31563-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355953137-31563-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

No real problem for now, as nothing is using this, but leaving it
unitialized is asking for trouble later on.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/gpu/drm/tegra/host1x.c | 2 ++
 1 Datei ge=C3=A4ndert, 2 Zeilen hinzugef=C3=BCgt(+)

diff --git a/drivers/gpu/drm/tegra/host1x.c b/drivers/gpu/drm/tegra/hos=
t1x.c
index bdb97a5..5d17b11 100644
--- a/drivers/gpu/drm/tegra/host1x.c
+++ b/drivers/gpu/drm/tegra/host1x.c
@@ -239,6 +239,8 @@ int host1x_register_client(struct host1x *host1x, s=
truct host1x_client *client)
 		}
 	}
=20
+	client->host1x =3D host1x;
+
 	return 0;
 }
=20
--=20
1.7.11.7
