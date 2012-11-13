From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 0/2] NVIDIA Tegra DRM driver
Date: Tue, 13 Nov 2012 07:47:48 +0100
Message-ID: <20121113064748.GB31443@avionic-0098.mockup.avionic-design.de>
References: <1352757358-14001-1-git-send-email-thierry.reding@avionic-design.de>
 <50A1918E.1000809@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A1918E.1000809-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 12, 2012 at 05:17:18PM -0700, Stephen Warren wrote:
> On 11/12/2012 02:55 PM, Thierry Reding wrote:
> > This second version of this patch series addresses all the comments
> > received so far. Most notably it takes advantage of the debugfs helpers
> > provided by the DRM core. Oddly enough this actually increases the line
> > count, but that's because the helpers don't fit with the subdevices
> > approach as implemented by this driver. However some quick discussions
> > with Rob Clark showed that Tegra DRM is not special in this respect but
> > other drivers may need the same functionality. Eventually the debugfs
> > code could be reworked on top of helpers that are better suited at the
> > design of embedded, multi-device DRM drivers.
> >=20
> > Other than that there is some removal of code that was actually supposed
> > to go into a later patch because it has dependencies that haven't been
> > merged yet and some moving around of #defines and the device tree
> > bindings documentation. Finally the driver now uses the DRM core's
> > drm_compat_ioctl() instead of a custom and unimplemented (!) version.
>=20
> The series,
>=20
> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> (on the Harmony board's HDMI output; I'll test other boards/outputs later=
).

You also gave an Acked-by for the DT binding documentation in the first
version of this patchset, does it apply to the rest of the patch as
well? That is, can I add it to patch 1?

Thierry

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQoe0UAAoJEN0jrNd/PrOhkO4P/j1fH+7cGSILND7bxqP+bpAe
G8P1m9GsvVYHMiDGE2vzvBzRrQpy4AlPEBU9NxEpEenJSM5wxMIXJdyo6DM3wAJE
pTqsX7QMlgDu5etvGkLGDtPo6JELd+9MeH1gKVFHD5ju/Pmsx7nhNxIku1XA3NTU
UKPtNRCwfaHl50ATaxiv9WJhPv7wTeHj39EE5/OqhDCEtG4t2hCUKsyYPdpoRGsJ
9JLKG+KHbgIqqpRrq7bYEa3OBHOxy/cZ4MFCmL9bVd30a6rIcAStnGRJGNB5J7BH
kakTBv1cauNJCJfMw4BK/8MhlyPyaEZdpeb6Kb1S92NRCbXGODlpfJOUpDudD0b7
k9KVsIK6fPvm72xrofa+trR1yJ7vJzorJvAdUWZ3lvDjCevQIALG87FWb5uPxif4
3l3LXO9+6N/nNAki8QZNJ+eDDKTVKDJ3sYlZHiJnrL/9Se3U5km56b7CNwZcy207
kXuvtAxYI3vJPO4cP3sgDltBrm8/6157azjp4VuJNoWKL5NXXpB6Kjoxnb1GaUka
AvTJr+WrGsMqoyxey3SrOx8XpsCCRYR6GjNeWDUv9oMgCyrQs3YQrH7fQ2nbMnWL
Rlotxsi7p/yVr5qXFTezHEWxfkQ1hfpswvxfv2bRn4Od3jRE40z0Twcgc6juxOlr
OljfR8dx17fuGwUiPRV1
=FOwG
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
