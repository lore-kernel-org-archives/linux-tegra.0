From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drm: Add NVIDIA Tegra20 support
Date: Tue, 13 Nov 2012 10:37:26 +0100
Message-ID: <20121113093725.GB8122@avionic-0098.mockup.avionic-design.de>
References: <1352757358-14001-1-git-send-email-thierry.reding@avionic-design.de>
 <1352757358-14001-2-git-send-email-thierry.reding@avionic-design.de>
 <50A1F3A3.40905@nvidia.com>
 <20121113074822.GA8409@avionic-0098.mockup.avionic-design.de>
 <50A20994.9000305@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7534349329835629703=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50A20994.9000305-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============7534349329835629703==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 04:49:24PM +0800, Mark Zhang wrote:
> On 11/13/2012 03:48 PM, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Tue, Nov 13, 2012 at 03:15:47PM +0800, Mark Zhang wrote:
> >> On 11/13/2012 05:55 AM, Thierry Reding wrote:
> >>> This commit adds a KMS driver for the Tegra20 SoC. This includes basic
> >>> support for host1x and the two display controllers found on the Tegra=
20
> >>> SoC. Each display controller can drive a separate RGB/LVDS output.
> >>>
> >>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> >>> ---
> >>> Changes in v2:
> >>> - drop Linux-specific drm subdirectory for DT bindings documentation
> >>> - remove display helper leftovers that belong in a later patch
> >>> - reuse debugfs infrastructure provided by the DRM core
> >>> - move vblank syncpoint defines to dc.h
> >>> - use drm_compat_ioctl()
> >>>
> >> [...]
> >>> diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kc=
onfig
> >>> new file mode 100644
> >>> index 0000000..be1daf7
> >>> --- /dev/null
> >>> +++ b/drivers/gpu/drm/tegra/Kconfig
> >>> @@ -0,0 +1,23 @@
> >>> +config DRM_TEGRA
> >>> +       tristate "NVIDIA Tegra DRM"
> >>> +       depends on DRM && OF && ARCH_TEGRA
> >>> +       select DRM_KMS_HELPER
> >>> +       select DRM_GEM_CMA_HELPER
> >>> +       select DRM_KMS_CMA_HELPER
> >>
> >> Just for curious, according to my testing, why the "CONFIG_CMA" is not
> >> enabled while DRM_GEM_CMA_HELPER & DRM_KMS_CMA_HELPER are enabled here?
> >=20
> > The reason is that CMA doesn't actually provide any API for drivers to
> > use and in fact unless you use very large buffers you could indeed run
> > this code on top of a non-CMA kernel and it will likely even work.
> >=20
>=20
> Okay. But I think it's better to turn on CMA defaultly. During my
> testing, it's hard to allocate more 2MB without CMA...

CMA is enabled by default in one of the Tegra default configuration
patches in my tegra/next branch. I will submit that patch to Stephen
when the 3.8 cycle starts, so that it'll be automatically enabled along
with the DRM driver.

But I don't think it makes sense to couple it to the DRM_TEGRA symbol as
it isn't strictly required.

> >>> +static struct of_device_id tegra_dc_of_match[] =3D {
> >>> +       { .compatible =3D "nvidia,tegra20-dc", },
> >>> +       { .compatible =3D "nvidia,tegra30-dc", },
> >>
> >> If you don't want add Tegra 3 support in this patch set, remove
> >> { .compatible =3D "nvidia,tegra30-dc", } here.
> >=20
> > Good catch! I'll move that into the Tegra30 support patch.
> >=20
> >>> +static int host1x_activate_drm_client(struct host1x *host1x,
> >>> +                                     struct host1x_drm_client *drm,
> >>> +                                     struct host1x_client *client)
> >>> +{
> >>> +       mutex_lock(&host1x->drm_clients_lock);
> >>> +       list_del_init(&drm->list);
> >>> +       list_add_tail(&drm->list, &host1x->drm_active);
> >>
> >> Why we need this "drm_active" list? We can combine this function and
> >> function "host1x_remove_drm_client" and free the drm client just here.
> >> It's useless after host1x clients registered themselves.
> >=20
> > The list is used to properly remove all clients and resources when the
> > module is unloaded. Granted, this code isn't executed if you don't build
> > the driver as a loadable module, but it should still be a supported use-
> > case.
> >=20
>=20
> My opinion is, after registration is completed, host1x_drm_client is
> useless, host1x_client is enough for follow-up operations.
> I still don't get how this is related with building the driver into the
> kernel or as a kernel module, so if something I misunderstood, please
> let me know it. Thanks.

I can take another look at this and see if it can be further simplified.
This was actually a rather tricky part to get right, so I'm naturally a
bit hesitant to touch it.

Thierry

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQohTVAAoJEN0jrNd/PrOhf4AP/0NG1wOREYNHOJj9tyARKY1A
D6ZPlIF8QC6dokEM6E0DTHr2VGE3TvFs4B4DW8yFCuhvShP6GuM1XNJcqUC8gWyg
s127cuFeY4lsaN3/h1XnAPbN1uA4UmZshLhdv9cugvwaHe+xw5KjuMA3cqYki1UD
NBN9ZpRAt9nn+0NOfRa1nzB5obtN4wlSwS3W7Zy2p+Ockpb/sVc5PHk569l+P6ID
ZINcE37bFyPjPsZfdlxpH6LMcXreh0kAoG+e5cj2TQ1TI2oG9bKNL8zlnnR+0ZUi
h7o7+DSHhF0jTmWEVrcqkdJeHhUfsOd6Er2nICDCjucOLwFbjm8D/MZlODE41akJ
XNvKhSIuD7zRJDgsrs1C+sYazZr7pTdwhZwE0ysrFOe0GPEI4YgAv+y/1UOJhckq
OLC66xPUMXm5u9hL3iQcbOrtq6Gudr2+VEMQJYJDOfvFD7RqV23G0vYIg/lZmpYE
J4vraDYhCbVG0dYzqJDWiZrUfMX874i3WGMrX3yH4DmFuRH7Ne1gJ2jsoLt5cNfB
+DwIOZju571NdnDot9bWRJN+FVdC1CO2yh9+G9+pc7AO9j2CWvgVGUfDMcMvjNzS
XjhZMndQYbO2ITZwcycCs4kzkd3a7rREUGG8G8zvd6rEw/tCT5da3k66ppSrV0YH
0INa7fZPDWIIGzLMCp5J
=T+WG
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--

--===============7534349329835629703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7534349329835629703==--
