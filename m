From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH nouveau 06/11] platform: complete the power
 up/down sequence
Date: Tue, 6 Jan 2015 14:55:52 +0100
Message-ID: <20150106135551.GI31830@ulmo.nvidia.com>
References: <1419331204-26679-1-git-send-email-vinceh@nvidia.com>
 <1419331204-26679-7-git-send-email-vinceh@nvidia.com>
 <1419427385.2179.13.camel@lynxeye.de> <549B79B2.6010301@nvidia.com>
 <20150105152552.GH12010@ulmo.nvidia.com>
 <54ABAC09.4080306@nvidia.com>
 <20150106113626.GC31830@ulmo.nvidia.com>
 <54ABD14D.30003@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0331961815=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <54ABD14D.30003-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============0331961815==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v2/QI0iRXglpx0hK"
Content-Disposition: inline


--v2/QI0iRXglpx0hK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 08:13:01PM +0800, Vince Hsu wrote:
>=20
> On 01/06/2015 07:36 PM, Thierry Reding wrote:
> >* PGP Signed by an unknown key
> >
> >On Tue, Jan 06, 2015 at 05:34:01PM +0800, Vince Hsu wrote:
> >>On 01/05/2015 11:25 PM, Thierry Reding wrote:
> >>>>Old Signed by an unknown key
> >>>On Thu, Dec 25, 2014 at 10:42:58AM +0800, Vince Hsu wrote:
> >>>>On 12/24/2014 09:23 PM, Lucas Stach wrote:
> >>>>>Am Dienstag, den 23.12.2014, 18:39 +0800 schrieb Vince Hsu:
> >>>>>>This patch adds some missing pieces of the rail gaing/ungating sequ=
ence that
> >>>>>>can improve the stability in theory.
> >>>>>>
> >>>>>>Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>>>>---
> >>>>>>  drm/nouveau_platform.c | 42 +++++++++++++++++++++++++++++++++++++=
+++++
> >>>>>>  drm/nouveau_platform.h |  3 +++
> >>>>>>  2 files changed, 45 insertions(+)
> >>>>>>
> >>>>>>diff --git a/drm/nouveau_platform.c b/drm/nouveau_platform.c
> >>>>>>index 68788b17a45c..527fe2358fc9 100644
> >>>>>>--- a/drm/nouveau_platform.c
> >>>>>>+++ b/drm/nouveau_platform.c
> >>>>>>@@ -25,9 +25,11 @@
> >>>>>>  #include <linux/module.h>
> >>>>>>  #include <linux/platform_device.h>
> >>>>>>  #include <linux/of.h>
> >>>>>>+#include <linux/of_platform.h>
> >>>>>>  #include <linux/reset.h>
> >>>>>>  #include <linux/regulator/consumer.h>
> >>>>>>  #include <soc/tegra/fuse.h>
> >>>>>>+#include <soc/tegra/mc.h>
> >>>>>>  #include <soc/tegra/pmc.h>
> >>>>>>  #include "nouveau_drm.h"
> >>>>>>@@ -61,6 +63,9 @@ static int nouveau_platform_power_up(struct nouve=
au_platform_gpu *gpu)
> >>>>>>  	reset_control_deassert(gpu->rst);
> >>>>>>  	udelay(10);
> >>>>>>+	tegra_mc_flush(gpu->mc, gpu->swgroup, false);
> >>>>>>+	udelay(10);
> >>>>>>+
> >>>>>>  	return 0;
> >>>>>>  err_clamp:
> >>>>>>@@ -77,6 +82,14 @@ static int nouveau_platform_power_down(struct no=
uveau_platform_gpu *gpu)
> >>>>>>  {
> >>>>>>  	int err;
> >>>>>>+	tegra_mc_flush(gpu->mc, gpu->swgroup, true);
> >>>>>>+	udelay(10);
> >>>>>>+
> >>>>>>+	err =3D tegra_powergate_gpu_set_clamping(true);
> >>>>>>+	if (err)
> >>>>>>+		return err;
> >>>>>>+	udelay(10);
> >>>>>>+
> >>>>>>  	reset_control_assert(gpu->rst);
> >>>>>>  	udelay(10);
> >>>>>>@@ -91,6 +104,31 @@ static int nouveau_platform_power_down(struct n=
ouveau_platform_gpu *gpu)
> >>>>>>  	return 0;
> >>>>>>  }
> >>>>>>+static int nouveau_platform_get_mc(struct device *dev,
> >>>>>>+		struct tegra_mc **mc, unsigned int *swgroup)
> >>>>>Uhm, no. If this is needed this has to be a Tegra MC function and not
> >>>>>burried into nouveau code. You are using knowledge about the internal
> >>>>>workings of the MC driver here.
> >>>>>
> >>>>>Also this should probably only take the Dt node pointer as argument =
and
> >>>>>return a something like a tegra_mc_client struct that contains both =
the
> >>>>>MC device pointer and the swgroup so you can pass that to
> >>>>>tegra_mc_flush().
> >>>>Good idea. I will have something as below in V2 if there is no other
> >>>>comments for this.
> >>>>
> >>>>tegra_mc_client *tegra_mc_find_client(struct device_node *node)
> >>>>{
> >>>>     ...
> >>>>     ret =3D of_parse_phandle_with_args(node, "nvidia,memory-client",=
 ...)
> >>>>     ...
> >>>>}
> >>>>
> >>>>There were some discussion about this few weeks ago. I'm not sure whe=
ther we
> >>>>have some conclusion/implementation though. Thierry?
> >>>>
> >>>>http://lists.infradead.org/pipermail/linux-arm-kernel/2014-December/3=
08703.html
> >>>I don't think client is a good fit here. Flushing is done per SWGROUP
> >>>(on all clients of the SWGROUP). So I think we'll want something like:
> >>>
> >>>	gpu@0,57000000 {
> >>>		...
> >>>		nvidia,swgroup =3D <&mc TEGRA_SWGROUP_GPU>;
> >>>		...
> >>>	};
> >>>
> >>>In the DT and return a struct tegra_mc_swgroup along the lines of:
> >>>
> >>>	struct tegra_mc_client {
> >>>		unsigned int id;
> >>>		unsigned int swgroup;
> >>>
> >>>		struct list_head list;
> >>>	};
> >>>
> >>>	struct tegra_mc_swgroup {
> >>>		struct list_head clients;
> >>>		unsigned int id;
> >>>	};
> >>>
> >>>Where tegra_mc_swgroup.clients is a list of struct tegra_mc_client
> >>>structures, each representing a memory client pertaining to the
> >>>SWGROUP.
> >>Based on your suggestion above, I created a struct tegra_mc_swgroup:
> >>
> >>struct tegra_mc_swgroup {
> >>     unsigned int id;
> >>     struct tegra_mc *mc;
> >>     struct list_head head;
> >>     struct list_head clients;
> >>};
> >>
> >>And added the list head in the struct tegra_mc_soc.
> >>
> >>struct tegra_mc_soc {
> >>     struct tegra_mc_client *clients;
> >>     unsigned int num_clients;
> >>
> >>     struct tegra_mc_hr *hr_clients;
> >>     unsigned int num_hr_clients;
> >Why do you still need these?
> This part is added in "[PATCH 2/11] memory: tegra: add mc flush support" =
and
> "[PATCH 3/11] memory: tegra: add flush operation for Tegra124 memory
> clients"
> for the hotreset registers.

Right. Perhaps calling this structure tegra_mc_hotreset and the
variables *_hotresets would be a good idea to clarify that they aren't
actually per-client but per-SWGROUP.

> >>Created one function to build the swgroup list.
> >>
> >>static int tegra_mc_build_swgroup(struct tegra_mc *mc)
> >>{
> >>     int i;
> >>
> >>     for (i =3D 0; i < mc->soc->num_clients; i++) {
> >>         struct tegra_mc_swgroup *sg;
> >>         bool found =3D false;
> >>
> >>         list_for_each_entry(sg, &mc->soc->swgroups, head) {
> >>             if (sg->id =3D=3D mc->soc->clients[i].swgroup) {
> >>                 found =3D true;
> >>                 break;
> >>             }
> >>         }
> >Can't you use your new tegra_mc_find_swgroup() function here? That way
> >you could turn it into something slightly more readable:
> The tegra_mc_build_swgroup() is called during driver probe, and after that
> the swgroup list is established and then the tegra_mc_find_swgroup() can
> work.

But you can reuse tegra_mc_find_swgroup() instead of open-coding it to
search the partial list. The code will be exactly the same, won't it?

> >	unsigned int swgroup =3D mc->soc->clients[i].swgroup;
> >	struct tegra_mc_swgroup *group;
> >
> >	group =3D tegra_mc_find_swgroup(mc, swgroup);
> The tegra_mc_find_swgroup() is expected to be called outside the mc driver
> and
> can only take the device node as argument because other drivers do not ha=
ve
> the mc instance information unless they call tegra_mc_find_swgroup() or
> tegra_mc_find_client().

You can do that by making a low-level function that works on the struct
tegra_mc * and an unsigned int swgroup which is only used internally and
then wrap a public function around it that deals with looking up the
struct tegra_mc * and SWGROUP ID.

Thierry

--v2/QI0iRXglpx0hK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUq+lnAAoJEN0jrNd/PrOhJ1IQAJtZQKHKDqQ7aB++qUI4vEOE
MuJre0r5Y0OBo8UFC0d3qq8igagWbFIS1M64dtoexhZO8BZGv3xFZKOSEdhI/Aot
fPm/zQGEWs1rIdU2lsksz6P5q1P7/FaQOLr5ptKAUMmBHMyEAONPueJoFjfrNwZJ
Ta+54f6+X/7Y/sGCl60c2PL9EE6kPA/PnDQJBCPtvsX0q2YgK4jCEGPGrQOOA6mg
Ii63NqmOeQoe/y1HBK2YKIvNJtJ/DMf4oLaE5E1i3qKqAHMIs73I1We76CZuA/3c
2D3+w+oPVGotrBPc5tP77oocAEgE9eXu4rChv5TfTcLy+eN5ltSS4XzqO+apVz1g
mC4OZe273umd5RsZAoUf4RGRDNP7zp02XUORwN/2DMJSfArUwl9TpP7B5dYH3scG
bQ4CoQnUZWna06ykZzbcLSvILDsyg0t+VtMDbcYBAF3r00DT5OItuadbeKiQfF1O
OT3NH/6Cp4D3KMmELRPwgEekjhcjqkmt5+dLsDjVS6m5k/U+5yZkRrllR1YK5R/i
qX659p09qKB+s/Tj0DAt8l8Vx0awnrI4GcsTy+nyylvGBOFzsN2sEgmKxFuUuFy0
G2nnkPzhi+Qu2wszBV5CTCKNXRk32yUWE5AmBGS/rmZWBlWT6mh4VDTQQe9r8rIL
yOfSCDBrTHIlcDcG1SEO
=4P/d
-----END PGP SIGNATURE-----

--v2/QI0iRXglpx0hK--

--===============0331961815==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0331961815==--
