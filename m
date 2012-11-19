From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] drm: Add NVIDIA Tegra30 support
Date: Mon, 19 Nov 2012 07:45:43 +0100
Message-ID: <20121119064543.GB21890@avionic-0098.mockup.avionic-design.de>
References: <1353041889-3114-1-git-send-email-markz@nvidia.com>
 <50A66A02.6030608@wwwdotorg.org>
 <50A9CF4B.2040308@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A9CF4B.2040308-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 19, 2012 at 02:18:51PM +0800, Mark Zhang wrote:
> On 11/17/2012 12:29 AM, Stephen Warren wrote:
> > On 11/15/2012 09:58 PM, Mark Zhang wrote:
> >> This patch is based on Thierry's drm patch for Tegra20:
> >> - [PATCH v2 0/6] Device tree updates for host1x support
> >> - [PATCH v3 0/2] NVIDIA Tegra DRM driver
> >>
> >> It adds the support for NVIDIA Tegra30.
> >=20
> > Mark, I tried to apply this for testing locally, but it doesn't apply.
> >=20
> > For some reason, all the whitespace in the context has been replaced
> > with spaces. Are your local copies of dc.c and host1x.c indented with
> > spaces for some reason, or did the MS Exchange server corrupt your patch
> > as you sent it (I've previously only observed inbound corruption...)
> >=20
>=20
> I think that is because the whitespace in patch which Thierry sent:
> "[PATCH v3 1/2] drm: Add NVIDIA Tegra20 support" are all spaces, not tabs.

I'm pretty sure the issue must be inbound corruption caused by you email
setup. The patches I've sent use tabs properly and I've never seen my
setup corrupt emails.

It seems like this is not the first time that this happens for you guys
and I think I remember it to be the reason why Stephen switched to using
his private email address for open-source work. Your IT guys should fix
this, really. It can't be that hard.

Thierry

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQqdWXAAoJEN0jrNd/PrOhbr8P/2SI8sBTYovAXDKzTWsnp+F8
CixrrEfg7JnGRmyB3+Nl3yXaBcM+DcAndXAuk0A5XmVldaecE7b/2ElZpsdS3XQT
QPFSIpgcmb6oXDm47FvbbHf72oVDoOBadG0cNqubBDgvn3mhekhhUmGW5MBC7KSE
535edsljCYaEnUV1caHKJ2aKfbzuv1HOczQFYP4bwnV6DYM/bSxk0LI5wmz8FzDj
68mGqbwXvyU76agH/22eAa6Pq2uimymydYgmAIgWT74LYlpVsfiTofFMLO9Ud2iW
l9DFeVjlCF6Akt4wRQwCTRSUkho62/phWH92ZJmqK8z/m9LAzk2WivaauGx4TucO
wHRM2cOpfCoAY+tWD+NIin2WPD91bxJMqxjAiHvUTRXD+rahYaQ2G69NS9Y3cacR
SmSn1At1qo6MsYMAGA07JvUXWw5QRP88RSUOb8eihoKSDGh6HG7rE4jNAnxaWvd4
ojydaC8vERMnniRMtPuDH4QVzxcuQFav9wx2H/6m+ZGHsZKhRlPiNeCldkWstIL/
tsWmV+5bi8+mqY1IbYMRVmchotVM9yi/GhT4AgIqKUmF19L/OEQMIHC7TiMZqC/4
dbRcY2bAwbCCNslCDz5VrbRd+ooknzisvzKhoCCFmkeFwdylg+kGM/MIE14BfW63
cGFYQC40pktcVplqTS1w
=mIEV
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
