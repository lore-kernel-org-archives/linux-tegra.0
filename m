From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH nouveau 06/11] platform: complete the power
 up/down sequence
Date: Mon, 5 Jan 2015 16:25:54 +0100
Message-ID: <20150105152552.GH12010@ulmo.nvidia.com>
References: <1419331204-26679-1-git-send-email-vinceh@nvidia.com>
 <1419331204-26679-7-git-send-email-vinceh@nvidia.com>
 <1419427385.2179.13.camel@lynxeye.de> <549B79B2.6010301@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1076291332=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <549B79B2.6010301-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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


--===============1076291332==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VkqCAaSJIySsbD6j"
Content-Disposition: inline


--VkqCAaSJIySsbD6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 25, 2014 at 10:42:58AM +0800, Vince Hsu wrote:
>=20
> On 12/24/2014 09:23 PM, Lucas Stach wrote:
> >Am Dienstag, den 23.12.2014, 18:39 +0800 schrieb Vince Hsu:
> >>This patch adds some missing pieces of the rail gaing/ungating sequence=
 that
> >>can improve the stability in theory.
> >>
> >>Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>---
> >>  drm/nouveau_platform.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> >>  drm/nouveau_platform.h |  3 +++
> >>  2 files changed, 45 insertions(+)
> >>
> >>diff --git a/drm/nouveau_platform.c b/drm/nouveau_platform.c
> >>index 68788b17a45c..527fe2358fc9 100644
> >>--- a/drm/nouveau_platform.c
> >>+++ b/drm/nouveau_platform.c
> >>@@ -25,9 +25,11 @@
> >>  #include <linux/module.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/of.h>
> >>+#include <linux/of_platform.h>
> >>  #include <linux/reset.h>
> >>  #include <linux/regulator/consumer.h>
> >>  #include <soc/tegra/fuse.h>
> >>+#include <soc/tegra/mc.h>
> >>  #include <soc/tegra/pmc.h>
> >>  #include "nouveau_drm.h"
> >>@@ -61,6 +63,9 @@ static int nouveau_platform_power_up(struct nouveau_p=
latform_gpu *gpu)
> >>  	reset_control_deassert(gpu->rst);
> >>  	udelay(10);
> >>+	tegra_mc_flush(gpu->mc, gpu->swgroup, false);
> >>+	udelay(10);
> >>+
> >>  	return 0;
> >>  err_clamp:
> >>@@ -77,6 +82,14 @@ static int nouveau_platform_power_down(struct nouvea=
u_platform_gpu *gpu)
> >>  {
> >>  	int err;
> >>+	tegra_mc_flush(gpu->mc, gpu->swgroup, true);
> >>+	udelay(10);
> >>+
> >>+	err =3D tegra_powergate_gpu_set_clamping(true);
> >>+	if (err)
> >>+		return err;
> >>+	udelay(10);
> >>+
> >>  	reset_control_assert(gpu->rst);
> >>  	udelay(10);
> >>@@ -91,6 +104,31 @@ static int nouveau_platform_power_down(struct nouve=
au_platform_gpu *gpu)
> >>  	return 0;
> >>  }
> >>+static int nouveau_platform_get_mc(struct device *dev,
> >>+		struct tegra_mc **mc, unsigned int *swgroup)
> >Uhm, no. If this is needed this has to be a Tegra MC function and not
> >burried into nouveau code. You are using knowledge about the internal
> >workings of the MC driver here.
> >
> >Also this should probably only take the Dt node pointer as argument and
> >return a something like a tegra_mc_client struct that contains both the
> >MC device pointer and the swgroup so you can pass that to
> >tegra_mc_flush().
> Good idea. I will have something as below in V2 if there is no other
> comments for this.
>=20
> tegra_mc_client *tegra_mc_find_client(struct device_node *node)
> {
>     ...
>     ret =3D of_parse_phandle_with_args(node, "nvidia,memory-client", ...)
>     ...
> }
>=20
> There were some discussion about this few weeks ago. I'm not sure whether=
 we
> have some conclusion/implementation though. Thierry?
>=20
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-December/30870=
3.html

I don't think client is a good fit here. Flushing is done per SWGROUP
(on all clients of the SWGROUP). So I think we'll want something like:

	gpu@0,57000000 {
		...
		nvidia,swgroup =3D <&mc TEGRA_SWGROUP_GPU>;
		...
	};

In the DT and return a struct tegra_mc_swgroup along the lines of:

	struct tegra_mc_client {
		unsigned int id;
		unsigned int swgroup;

		struct list_head list;
	};

	struct tegra_mc_swgroup {
		struct list_head clients;
		unsigned int id;
	};

Where tegra_mc_swgroup.clients is a list of struct tegra_mc_client
structures, each representing a memory client pertaining to the
SWGROUP.

We probably don't want to expose these structures publicly, an opaque
type should be enough. Then you can use functions like:

	struct tegra_mc_swgroup *tegra_mc_find_swgroup(struct device_node *node);

At some point we may even need something like:

	struct tegra_mc_client *tegra_mc_find_client(struct device_node *node,
						     const char *name);

And DT content like this:

	gpu@0,57000000 {
		...
		nvidia,memory-clients =3D <&mc 0x58>, <&mc 0x59>;
		nvidia,memory-client-names =3D "read", "write";
		...
	};

This could be useful for latency allowance programming, but we can cross
that bridge when we come to it.

Thierry

--VkqCAaSJIySsbD6j
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUqq0AAAoJEN0jrNd/PrOh2NkP/2DazvMj/zI/mebzotU6lgOj
eKubeasMKkHLjIsYilhwcInY+Ce+GPdu75i7W9umKipHUykJYnO80L8aVohnZtFy
LFTCmvrJfc0XeldSUK/heHJ8061GYXnArg6UERut7yRKdr+kEac1cdyt/g47CbbG
Qxu3e4hzJJuUkbtuHUqvv/W3m4t5cKfieXQGK7+gPuTmupVWLs4cH5RUvqelHa8I
yfyFlHsjZMeQnuPV0vPM81z1/h6EFHNung9kpbLddznAtb0TOV69gs7AWTDZNjzL
PqQYKN6g3ShPbyqhOwL7BkBuHHFdYvb2O4ghgZ4CABIMvaQSa4LrEEGIEhkE3oxY
QGi2pXJHyEztYwwyrFSfiQLQKmlt0kUpCcra9f1BVhvT6oQGLTms7UvvrEa7AM+n
Cje8WqFjvHfVqmLHd1FLueiMm9rkCuUvNYoABDyWxWwyarzDGJzagYBookBR0X0e
5Yyu29HovVblTkVjy+kp0CK0qw/jpU8hO37x2BGMrjzokwHggq8XlQiv/iCuCKDI
vzl3vjDiT+YY/O6blBOXLAxTjacp6Fob2Q77NLJvDGA2EHXqJ1dsA55J9aS7p0rn
kV9KGM6Kbwst0/PDIuZyvyQZh7MCCifEG+tcGV4c8fi9uMiFAKBoLCHGQF00nWJA
RpTBG17eHXInA1+sWpCm
=+A0u
-----END PGP SIGNATURE-----

--VkqCAaSJIySsbD6j--

--===============1076291332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1076291332==--
