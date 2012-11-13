From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drm: Add NVIDIA Tegra20 support
Date: Tue, 13 Nov 2012 10:54:24 +0100
Message-ID: <20121113095424.GA982@avionic-0098.mockup.avionic-design.de>
References: <1352757358-14001-1-git-send-email-thierry.reding@avionic-design.de>
 <1352757358-14001-2-git-send-email-thierry.reding@avionic-design.de>
 <50A1F3A3.40905@nvidia.com>
 <20121113074822.GA8409@avionic-0098.mockup.avionic-design.de>
 <50A20994.9000305@nvidia.com>
 <20121113093725.GB8122@avionic-0098.mockup.avionic-design.de>
 <50A217A8.2000600@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A217A8.2000600-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 05:49:28PM +0800, Mark Zhang wrote:
> On 11/13/2012 05:37 PM, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Tue, Nov 13, 2012 at 04:49:24PM +0800, Mark Zhang wrote:
> >> On 11/13/2012 03:48 PM, Thierry Reding wrote:
> >>>> Old Signed by an unknown key
> >>>
> >>> On Tue, Nov 13, 2012 at 03:15:47PM +0800, Mark Zhang wrote:
> >>>> On 11/13/2012 05:55 AM, Thierry Reding wrote:
> >>>>> This commit adds a KMS driver for the Tegra20 SoC. This includes ba=
sic
> >>>>> support for host1x and the two display controllers found on the Teg=
ra20
> >>>>> SoC. Each display controller can drive a separate RGB/LVDS output.
> >>>>>
> >>>>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> >>>>> ---
> >>>>> Changes in v2:
> >>>>> - drop Linux-specific drm subdirectory for DT bindings documentation
> >>>>> - remove display helper leftovers that belong in a later patch
> >>>>> - reuse debugfs infrastructure provided by the DRM core
> >>>>> - move vblank syncpoint defines to dc.h
> >>>>> - use drm_compat_ioctl()
> >>>>>
> >>>> [...]
> >>>>> diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/=
Kconfig
> >>>>> new file mode 100644
> >>>>> index 0000000..be1daf7
> >>>>> --- /dev/null
> >>>>> +++ b/drivers/gpu/drm/tegra/Kconfig
> >>>>> @@ -0,0 +1,23 @@
> >>>>> +config DRM_TEGRA
> >>>>> +       tristate "NVIDIA Tegra DRM"
> >>>>> +       depends on DRM && OF && ARCH_TEGRA
> >>>>> +       select DRM_KMS_HELPER
> >>>>> +       select DRM_GEM_CMA_HELPER
> >>>>> +       select DRM_KMS_CMA_HELPER
> >>>>
> >>>> Just for curious, according to my testing, why the "CONFIG_CMA" is n=
ot
> >>>> enabled while DRM_GEM_CMA_HELPER & DRM_KMS_CMA_HELPER are enabled he=
re?
> >>>
> >>> The reason is that CMA doesn't actually provide any API for drivers to
> >>> use and in fact unless you use very large buffers you could indeed run
> >>> this code on top of a non-CMA kernel and it will likely even work.
> >>>
> >>
> >> Okay. But I think it's better to turn on CMA defaultly. During my
> >> testing, it's hard to allocate more 2MB without CMA...
> >=20
> > CMA is enabled by default in one of the Tegra default configuration
> > patches in my tegra/next branch. I will submit that patch to Stephen
> > when the 3.8 cycle starts, so that it'll be automatically enabled along
> > with the DRM driver.
> >=20
> > But I don't think it makes sense to couple it to the DRM_TEGRA symbol as
> > it isn't strictly required.
> >=20
>=20
> Yes. We don't need to touch CMA in our Kconfig. In my opinion, right now
> we're relying on the DRM_GEM_CMA_HELPER which should turn on CMA when
> it's been selected.

Again, I don't think CMA should be selected by those either as the
helpers will work fine if CMA is disabled (their name is a bit
unfortunate). It's just that they won't be able to allocate very large
buffers.

So I think the correct way is to select CMA in the Tegra default
configuration to make it explicit that Tegra wants to use the CMA for
large contiguous buffer allocations.

> >>>>> +static struct of_device_id tegra_dc_of_match[] =3D {
> >>>>> +       { .compatible =3D "nvidia,tegra20-dc", },
> >>>>> +       { .compatible =3D "nvidia,tegra30-dc", },
> >>>>
> >>>> If you don't want add Tegra 3 support in this patch set, remove
> >>>> { .compatible =3D "nvidia,tegra30-dc", } here.
> >>>
> >>> Good catch! I'll move that into the Tegra30 support patch.
> >>>
> >>>>> +static int host1x_activate_drm_client(struct host1x *host1x,
> >>>>> +                                     struct host1x_drm_client *drm,
> >>>>> +                                     struct host1x_client *client)
> >>>>> +{
> >>>>> +       mutex_lock(&host1x->drm_clients_lock);
> >>>>> +       list_del_init(&drm->list);
> >>>>> +       list_add_tail(&drm->list, &host1x->drm_active);
> >>>>
> >>>> Why we need this "drm_active" list? We can combine this function and
> >>>> function "host1x_remove_drm_client" and free the drm client just her=
e.
> >>>> It's useless after host1x clients registered themselves.
> >>>
> >>> The list is used to properly remove all clients and resources when the
> >>> module is unloaded. Granted, this code isn't executed if you don't bu=
ild
> >>> the driver as a loadable module, but it should still be a supported u=
se-
> >>> case.
> >>>
> >>
> >> My opinion is, after registration is completed, host1x_drm_client is
> >> useless, host1x_client is enough for follow-up operations.
> >> I still don't get how this is related with building the driver into the
> >> kernel or as a kernel module, so if something I misunderstood, please
> >> let me know it. Thanks.
> >=20
> > I can take another look at this and see if it can be further simplified.
> > This was actually a rather tricky part to get right, so I'm naturally a
> > bit hesitant to touch it.
> >=20
>=20
> Okay. I recall I did some changes on this part about 3 month ago in a
> patch named "drm: Add T30 support - host1x". So maybe you can know what
> I mean by reading that patch.

Yes, I remember the patch. Unfortunately the result of applying that
patch was that unloading the module no longer worked properly.

Thierry

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQohjQAAoJEN0jrNd/PrOhvLsQAI1uM8D48bVE/r2m930c/Z8p
pIvCkrG5EvB6OnMUmgN/WmPJuGt3pGWOqWPnU3MyuT/53JOUttYi+teLScCpZnhy
9JPV+bR9fwKK4XFS+RBNycDLBIO5YE64EWynx5p3IH1I5VyTqzB5mpztuGE4iNiM
GwEk3LPvhfTStE5H98a13nCwMVqronmQcKCmW8gslQoFZr7Qe8mlJfT1/I6MqvrH
v/8RBxIeUjoyhi7XxtAmSt0BPQg0Mr7jE58rM48/TbQYaOy68uovAXByNsFciRFX
saw/Wi9m8cF/EVKKlJPDSkknEJHixJy4VqxOyi3riFc/yfts/2zlQYCwNGjI2vpH
JEZ+93W9ki99u63B+sXmNSfeZE9IkcDQfDO5dgcGN5HyOp9nemFQTAqbrSTxjCp3
pxy5k6Tk/uLIDv6gLTyON0Z8fCXPGTDgqM/32Z1+knRwSEvEAEdxS0FYKrBPgvo3
q+QLL8I97SYgXopfeXt7WOfr5ZOmHniERF7ZZldsrTKFTey2it+LOUKZVpFYTnct
xKw+PyVr7DRkk2ZuKtqSfmGYoJEgQmXGbQYE4LKlkmSEq1XoAEbIDU+hL2DBzCQE
n+gSDcDpw66ru7sZikVjgHV6qx89K/qrqoIJofDq+Q8VVFz2Fv3zulHPh1Gsetfw
X4mdduSsTm0wvOdxJFzg
=q8+0
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
