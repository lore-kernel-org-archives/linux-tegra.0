From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 2/3] arm: tegra: add colibri t30 device tree binding documentation
Date: Thu, 30 Jun 2016 00:23:18 +0200
Message-ID: <1467238999-10252-2-git-send-email-marcel.ziswiler@toradex.com>
References: <1467238999-10252-1-git-send-email-marcel.ziswiler@toradex.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467238999-10252-1-git-send-email-marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add the device tree binding documentation for Colibri T30 which was
missing so far.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/arm/tegra.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.txt b/Documentation/devicetree/bindings/arm/tegra.txt
index 73278c6..428e098 100644
--- a/Documentation/devicetree/bindings/arm/tegra.txt
+++ b/Documentation/devicetree/bindings/arm/tegra.txt
@@ -33,6 +33,8 @@ board-specific compatible values:
   toradex,apalis_t30
   toradex,apalis_t30-eval
   toradex,colibri_t20-512
+  toradex,colibri_t30
+  toradex,colibri_t30-eval-v3
   toradex,iris
 
 Trusted Foundations
-- 
2.5.5
