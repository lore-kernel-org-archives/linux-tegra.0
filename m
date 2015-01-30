From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/24] Documentation: DT bindings: add more chip compatible
 strings for Tegra PCIe
Date: Fri, 30 Jan 2015 03:07:12 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1501300306140.6569@utopia.booyaka.com>
References: <20150128234935.20644.89300.stgit@dusk.lan> <20150128234937.20644.9400.stgit@dusk.lan> <CAL_JsqKMm=r+57ShskgbtNqnCGF1yKYDSJJFQ7o05keNzh5z+g@mail.gmail.com> <alpine.DEB.2.02.1501291543030.16475@utopia.booyaka.com>
 <CAL_JsqLE+W+T5YqzdB+DkdBE+HsgySX0yJHzn1y43QDfw4GA9A@mail.gmail.com> <alpine.DEB.2.02.1501291707350.16475@utopia.booyaka.com> <CAL_JsqKaDi1cZN8Ndb0FPhvgRVFyxc1NRhV2cx-XJ323wTKiEQ@mail.gmail.com> <alpine.DEB.2.02.1501291846340.16475@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1501291846340.16475-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


Hi Rob

I've also updated the first patch, that tries to document what the DT 
maintainers' expectations are.  Care to give this one a quick glance too?


- Paul

From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Wed, 28 Jan 2015 16:43:16 -0700
Subject: [PATCH] Documentation: DT: document compatible string existence
 requirement

DT maintainers require all compatible strings used in chip or board
DTS file to be previously documented somewhere in
Documentation/devicetree/bindings, per:

http://marc.info/?l=linux-tegra&m=142201349727836&w=2

Document this requirement in the DT patch submission requirements
text file.

This second version updates the documentation to align with
Rob's comments here:

http://marc.info/?l=devicetree&m=142255654213019&w=2

Signed-off-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>
Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 .../devicetree/bindings/submitting-patches.txt     | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/submitting-patches.txt b/Documentation/devicetree/bindings/submitting-patches.txt
index b7ba01ad1426..56742bc70218 100644
--- a/Documentation/devicetree/bindings/submitting-patches.txt
+++ b/Documentation/devicetree/bindings/submitting-patches.txt
@@ -15,6 +15,29 @@ I. For patch submitters
   3) The Documentation/ portion of the patch should come in the series before
      the code implementing the binding.
 
+  4) Any compatible strings used in a chip or board DTS file must be
+     previously documented in the corresponding DT binding text file
+     in Documentation/devicetree/bindings.  This rule applies even if
+     the Linux device driver does not yet match on the compatible
+     string.  [ checkpatch will emit warnings if this step is not
+     followed as of commit bff5da4335256513497cc8c79f9a9d1665e09864
+     ("checkpatch: add DT compatible string documentation checks"). ]
+
+  5) The wildcard "<chip>" may be used in compatible strings, as in
+     the following example:
+
+         - compatible: Must contain '"nvidia,<chip>-pcie",
+           "nvidia,tegra20-pcie"' where <chip> is tegra30, tegra132, ...
+
+     As in the above example, the known values of "<chip>" should be
+     documented if it is used.
+
+  6) If a documented compatible string is not yet matched by the
+     driver, the documentation should also include a compatible
+     string that is matched by the driver (as in the "nvidia,tegra20-pcie"
+     example above).
+
+
 II. For kernel maintainers
 
   1) If you aren't comfortable reviewing a given binding, reply to it and ask
-- 
2.1.4
