From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v1 0/5] Add Tegra driver for video capture
Date: Fri, 31 Jan 2020 21:31:25 +0100
Message-ID: <20200131203125.GB3444092@ulmo>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <a6512e1b-ad0e-3f59-e775-418db4865994@xs4all.nl>
 <20200130154246.GA2904678@ulmo>
 <8654e6fd-c403-6e68-e5cf-09297b5d8b5d@xs4all.nl>
 <20200131170351.GA3444092@ulmo>
 <173dfa3f-a87f-c5dd-1966-558d6edafc3d@xs4all.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <173dfa3f-a87f-c5dd-1966-558d6edafc3d-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2020 at 06:37:10PM +0100, Hans Verkuil wrote:
> On 1/31/20 6:03 PM, Thierry Reding wrote:
> > On Fri, Jan 31, 2020 at 03:29:52PM +0100, Hans Verkuil wrote:
> >> On 1/30/20 4:42 PM, Thierry Reding wrote:
> >>> On Thu, Jan 30, 2020 at 03:41:50PM +0100, Hans Verkuil wrote:
> >>>> Hi Sowjanya,
> >>>>
> >>>> On 1/28/20 7:23 PM, Sowjanya Komatineni wrote:
> >>>>> This series adds Tegra210 VI and CSI driver for built-in test patte=
rn
> >>>>> generator (TPG) capture.
> >>>>>
> >>>>> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
> >>>>> CSI port is one-to-one mapped to VI channel for video capture.
> >>>>>
> >>>>> This series has TPG support only where it creates hard media links
> >>>>> between CSI subdevice and VI video device without device graphs.
> >>>>>
> >>>>> v4l2-compliance results are available below the patch diff.
> >>>>>
> >>>>> [v0]:	Includes,
> >>>>> 	- Adds CSI TPG clock to Tegra210 clock driver
> >>>>> 	- Host1x video driver with VI and CSI clients.
> >>>>> 	- Support for Tegra210 only.
> >>>>> 	- VI CSI TPG support with hard media links in driver.
> >>>>> 	- Video formats supported by Tegra210 VI
> >>>>> 	- CSI TPG supported video formats
> >>>>
> >>>> I'm trying to compile this patch series using the media_tree master
> >>>> branch (https://git.linuxtv.org//media_tree.git), but it fails:
> >>>>
> >>>> drivers/staging/media/tegra/tegra-channel.c: In function =E2=80=98te=
gra_channel_queue_setup=E2=80=99:
> >>>> drivers/staging/media/tegra/tegra-channel.c:71:15: warning: unused v=
ariable =E2=80=98count=E2=80=99 [-Wunused-variable]
> >>>>    71 |  unsigned int count =3D *nbuffers;
> >>>>       |               ^~~~~
> >>>> drivers/staging/media/tegra/tegra-channel.c: In function =E2=80=98te=
gra_channel_init=E2=80=99:
> >>>> drivers/staging/media/tegra/tegra-channel.c:518:55: error: =E2=80=98=
struct host1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
> >>>>   518 |  struct tegra_camera *cam =3D dev_get_drvdata(vi->client.hos=
t);
> >>>>       |                                                       ^
> >>>> make[4]: *** [scripts/Makefile.build:265: drivers/staging/media/tegr=
a/tegra-channel.o] Error 1
> >>>> make[4]: *** Waiting for unfinished jobs....
> >>>> drivers/staging/media/tegra/tegra-vi.c: In function =E2=80=98tegra_v=
i_tpg_graph_init=E2=80=99:
> >>>> drivers/staging/media/tegra/tegra-vi.c:157:55: error: =E2=80=98struc=
t host1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
> >>>>   157 |  struct tegra_camera *cam =3D dev_get_drvdata(vi->client.hos=
t);
> >>>>       |                                                       ^
> >>>> drivers/staging/media/tegra/tegra-vi.c: In function =E2=80=98tegra_v=
i_init=E2=80=99:
> >>>> drivers/staging/media/tegra/tegra-csi.c: In function =E2=80=98tegra_=
csi_init=E2=80=99:
> >>>> drivers/staging/media/tegra/tegra-vi.c:213:51: error: =E2=80=98struc=
t host1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
> >>>>   213 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
> >>>>       |                                                   ^~
> >>>> drivers/staging/media/tegra/tegra-csi.c:259:51: error: =E2=80=98stru=
ct host1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
> >>>>   259 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
> >>>>       |                                                   ^~
> >>>> drivers/staging/media/tegra/tegra-vi.c: In function =E2=80=98tegra_v=
i_exit=E2=80=99:
> >>>> drivers/staging/media/tegra/tegra-vi.c:246:51: error: =E2=80=98struc=
t host1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
> >>>>   246 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
> >>>>       |                                                   ^~
> >>>> drivers/staging/media/tegra/tegra-csi.c: In function =E2=80=98tegra_=
csi_exit=E2=80=99:
> >>>> drivers/staging/media/tegra/tegra-csi.c:286:51: error: =E2=80=98stru=
ct host1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
> >>>>   286 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
> >>>>       |                                                   ^~
> >>>>
> >>>> And indeed, struct host1x_client as defined in include/linux/host1x.=
h doesn't
> >>>> have a 'host' field.
> >>>>
> >>>> Does this series depend on another patch that's not yet in mainline?
> >>>
> >>> Sowjanya's been working on top of linux-next, so, yes, this patch
> >>> depends on a change that's been merged into the DRM tree for v5.6-rc1.
> >>>
> >>> Thierry
> >>>
> >>
> >> Is there a specific linux-next tag that works? I tried next-20200131 b=
ut that
> >> failed to boot. Same problem with the mainline repo since the host1x p=
atches
> >> were merged yesterday. It compiles fine, but the boot just stops. Or a=
m I
> >> missing some kernel config that is now important to have?
> >=20
> > linux-next and mainline are currently regressing on Tegra210 (and some
> > Tegra124) boards. I just sent out a series that fixes the regression for
> > me:
> >=20
> > 	http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D156215
> >=20
> > Please test if this works for you. If so, I'll send this to Dave as soon
> > as possible.
>=20
> I'll try it on Tuesday as I don't have access to the Jetson TX1 until the=
n. It
> looks promising since I think that the last message I saw was a PM messag=
e.

Great. My local testing on Jetson Nano confirms that this fixes boot on
top of linux-next and I've also run it through our internal test farm
with success. I'll push this to my drm/tegra/for-next branch, so it
should show up in linux-next on Monday.

Thierry

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl40jpoACgkQ3SOs138+
s6GsKw/9GmS3lkoUnVWigejDV9uq911ocqLUjYnzIP3fGxFJ1thUuG+omcIgI0mi
xwC2iw2wtxPMW65pQa2+rFSkHq3ExeaiYH310qkVZGesyvIbU+TIX/+fHflgG36J
Bnyv4MTo1YpciOhwMh/bdfCJJarnPC50SD1yWoEBwYqe+jtZVVMAa6RfNuHebn7+
i4rad8NkoOqBmsPpvw5q3Bod0QJRnWI56CVxC6aamZdfsnBcUDFIheueybK17kAm
7biKjP/MERe1upvsLHXud/r6H4Gx6UqENVSB24x6XMUdk4T7GlC546kUI/7B0YSh
cTpmQmDtkWV7j7QWM/sGkvP2nlYZlKYG4onM8ihIpab1D+r1AWgaJTkYkknG+7Te
tfdHcvsoTCwTtWkyN1xwcgXznmOJuv0aHAB5bCJ1cr/D617z/AjRabNBZsAMQMV9
oLBMkkS0R7g9j3QQI/LmKXk29FGmr/yCprp1LpGSX8akiiLyCUHNbz2EmMgN9wm7
LewBOUmgVicCwRSh0pByvSFbh5brvOoWyniOf8vLsWf3R4jULYRj5bFrynhYHHjJ
hk4wOacB0TysyZ8Ggr+rAT0aVzBvCrAxXvwA6eVShPpkNhHHOC8QoqNuO3hs2jaV
FiHXB0xTUsMcMnOnvCfNkmQE692LOt7PUvb5AzBYHSZzyyOZGIQ=
=i3Ml
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--
