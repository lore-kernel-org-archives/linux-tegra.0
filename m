From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH nouveau 09/11] drm: export some variable and
 functions to resue the PM functions
Date: Tue, 6 Jan 2015 15:37:30 +0100
Message-ID: <20150106143729.GN31830@ulmo.nvidia.com>
References: <1419331204-26679-1-git-send-email-vinceh@nvidia.com>
 <1419331204-26679-10-git-send-email-vinceh@nvidia.com>
 <54A20F4D.4040100@gmail.com> <54A2198A.4000707@nvidia.com>
 <20150105153252.GI12010@ulmo.nvidia.com>
 <CAAVeFuK-SgUbtHADX4-pXN5_ayzvEd+1KxJOBcRe2tmDfHaLEA@mail.gmail.com>
 <20150106114953.GD31830@ulmo.nvidia.com>
 <54ABD49A.6080501@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0673919376=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <54ABD49A.6080501-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Spliet <seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============0673919376==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sy9WyBOsCRoUO165"
Content-Disposition: inline


--sy9WyBOsCRoUO165
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 08:27:06PM +0800, Vince Hsu wrote:
>=20
> On 01/06/2015 07:49 PM, Thierry Reding wrote:
> >* PGP Signed by an unknown key
> >
> >On Mon, Jan 05, 2015 at 08:50:18PM +0100, Alexandre Courbot wrote:
> >>On Mon, Jan 5, 2015 at 4:32 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8@public.gmane.org=
m> wrote:
> >>>On Tue, Dec 30, 2014 at 11:18:34AM +0800, Vince Hsu wrote:
> >>>>Hi Emil,
> >>>>
> >>>>On 12/30/2014 10:34 AM, Emil Velikov wrote:
> >>>>>On 23/12/14 10:40, Vince Hsu wrote:
> >>>>>>This patch adds some checks in the suspend/resume functions to dist=
inguish
> >>>>>>the dGPU and mobile GPU and exports some variables/functions so tha=
t the
> >>>>>>nouveau platform device can reuse them.
> >>>>>>
> >>>>>Hi Vince,
> >>>>>
> >>>>>Afaiu one needs to export a symbol as it's used by another module or
> >>>>>subsystem. With the follow up two patches you are not doing either o=
ne,
> >>>>>so I'd assume that you can just omit the EXPORT_* changes.
> >>>>The nouveau platform device driver is built as another module -
> >>>>nouveau_platform.ko. :)
> >>>I'd like to hear the opinion of the nouveau people and Alex, but I'd
> >>>very much prefer if nouveau_platform.o was simply linked into the
> >>>nouveau.ko module. I don't see any good reason to keep it separate.
> >>Yep, I agree. The decision to host platform support in a separate
> >>module looks misleaded if it results in additional exports that we
> >>would otherwise avoid. IIUC I did this to be able to use the module
> >>convenience macros to register the platform driver.
> >>
> >>>Something like the attached patch (untested) ought to do it.
> >>This patch alone won't be enough for the reason I mentioned above.
> >>However, if Vince doesn't mind handling the platform driver
> >>registration manually in nouveau_drm_init/nouveau_drm_exit, I agree
> >>this would be the way to go.
> >If we do the conversion to generic power domains, the only Tegra-
> >specific API remaining will be the access to the fuse registers for the
> >speedo value. At that point we wouldn't need the ARCH_TEGRA dependency
> >any longer and could always build the platform driver along with the PCI
> >driver.
> Do we really want the platform driver always built with the PCI driver ev=
en
> there is no dependency between them. Actually I have some patches to
> build the platform driver with !CONFIG_PCI and would like to post them ma=
ybe
> later.

I do see some advantage in making Nouveau build with !CONFIG_PCI because
it allows building the driver for an SoC without PCI. But I think always
compiling whatever is available won't hurt. Nouveau itself is rather big
(~1 MiB of text and ~120 KiB of data) whereas the platform code weighs
in at around 1.5 KiB of text and 108 B of data. I suspect that the PCI
glue is equally negligible.

Thierry

--sy9WyBOsCRoUO165
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUq/MpAAoJEN0jrNd/PrOhZOgP/0iAGJQ7KC351FKn5fS3SEFf
s+cyD2MjtIIXMc6CPT177R8+lxy/cA40yuRB3ehQurTPQw5CDgVL7U02kVvV+EDb
u21L3bQiTSa3XkPf9BDGWTXKIQqb5EfV84WGWo94BELfIxiXzeoCcc/slWvU6rT5
rN5TposSU6Q10VzgUVkKQJqGWAWzxKezvGloLW8A/3uTAy8rxJ7yxZuZAqlH3Kj0
OIjM1gwMVCgolYSVIzuhvy8oI930H7mZrbJFM1F6pG12BGbLXg58JPDRmG113Tpa
X1if/SftoJnoZZbecFw5tsJKMzm1Ia0W9zm4LbuL+cOskbC/uU+Pp/oUyIuGTmDD
kGR9I+cw1wTtRy4XA7lC08TZwck5+yYPFdZwEvEmU7aBdfmWRrvUE/6xahVnf5Ai
vow+pqDcMuH1GOKh6u+fBA504SmWTOzAIAkYOieUryiMSlKk/qABuT6sJTz/1/jL
P/F1omvqUoHcsN8uxHAoqM/fD+JxWw/JvhyeWGv1n9tgIpSrbEIc8g0VpeP8595w
/NC8jjyFSutQsMN/EHDa/eByyBta4UXl+plHJuanb1kTriuJ/LruEDdqjFTJ13th
T2hi0Kt3HofN/lSyWnMlOKoXGt6FroHxSDzwKuekCgXebdCwJoOtKsAbN310m2M4
ROCTETfte0JKmK8XKcHL
=uEHR
-----END PGP SIGNATURE-----

--sy9WyBOsCRoUO165--

--===============0673919376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0673919376==--
