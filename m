From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 26/27] drm/tegra: Add DSI support
Date: Tue, 15 Oct 2013 10:33:42 +0200
Message-ID: <20131015083342.GH7856@ulmo.nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-27-git-send-email-treding@nvidia.com>
 <52587F17.7060104@wwwdotorg.org>
 <20131014135548.GB16302@ulmo.nvidia.com>
 <525C3510.60802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nOM8ykUjac0mNN89"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525C3510.60802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nOM8ykUjac0mNN89
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2013 at 12:16:48PM -0600, Stephen Warren wrote:
> On 10/14/2013 07:55 AM, Thierry Reding wrote:
> > On Fri, Oct 11, 2013 at 04:43:35PM -0600, Stephen Warren wrote:
> >> On 10/07/2013 02:34 AM, Thierry Reding wrote:
> >>> This commit adds support for both DSI outputs found on Tegra. Only ve=
ry
> >>> minimal functionality is implemented, so advanced features like ganged
> >>> mode won't work.
> >>>
> >>> Due to the lack of other test hardware, some sections of the driver a=
re
> >>> hardcoded to work with Dalmore.
> >>
> >>> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> >>
> >>> +static int tegra_dsi_show_regs(struct seq_file *s, void *data)
> >>> +{
> >>> +	struct drm_info_node *node =3D s->private;
> >>> +	struct tegra_dsi *dsi =3D node->info_ent->data;
> >>> +
> >>> +#define DUMP_REG(name)						\
> >>> +	seq_printf(s, "%-32s %#05x %08lx\n", #name, name,	\
> >>> +		   tegra_dsi_readl(dsi, name))
> >>> +
> >>> +	DUMP_REG(DSI_INCR_SYNCPT);
> >>
> >> Does it make sense to use an MMIO regmap instead? That way, you get all
> >> the debugfs files for free...
> >=20
> > As far as I know, regmap doesn't give you the symbolic names for the
> > registers. I find that a rather useful feature because it allows to
> > easily compare the registers to the ones in our downstream kernels.
>=20
> True. However, we should really be writing user-space scripts to encode
> that information. Such a script could be useful e.g. if reading the
> information directly from /dev/mem or JTAG too, and bloating the kernel
> with debug strings doesn't seem like a great idea.

I don't agree. While I see some value in having such userspace scripts,
having the symbolic names in debugfs allows anyone to look at a readable
form of the data without having to have access to those scripts. Besides
it's called *debug*fs for a purpose, isn't it? There's plenty of edited
data that's not just a plain dump of data.

Thierry

--nOM8ykUjac0mNN89
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXP3lAAoJEN0jrNd/PrOhmnEP/RpwmfVHc45EYanEDEMhBrYC
8eNIqKel+gIs8WIm8n36uJW9trQQvQUrUvP73909sPpIQTIGSYFkex0RkoJhlR8I
RkU0bUa1QwzoB/1HZYmEIvJo0awObcMu94fUV/WYkGwvwCihSwaeyig8Yz1qJRRi
9YK/o7h9OM2d0Y+4vtHnHrVNacbV4V06keZGhhQIDJK4mNHUzceZnlFugUmp4EJh
h6RqfUjnJiAVfjgkfx6kf7hspL0/NglgpjtvaAFulq6eYJB1gkAMqIdVM5UuhqUf
viJocxG6K8dHG7RKvTYAl316/C0y9lCBh6VBIEWmKsRzby+2e1nCKal6GSpz2qVz
kRrmOKgCi6T6YUO5CbHRJsVQIuy9BXqcIIWFcwP0/kIdryIbHuCHn3US2Syw4pHi
zDQ51J97z6sdGsBViaV5H7zVXXR7qSAAoJRYBkDQKpqMmUcMVvmT2mJJQxpwI6a6
AmcpNxgU9qvayzIbimUast+BuzIfmZRbRNtHIae55woALgfzKBraHHhZMcwANHhe
GLx6rlIHpn33x9G3cF7sCW6GY7utGDkOSDWbWbIHfSCqukpW3yKgnTc9RfcsCUIW
5bkh8nQi1swq+GeETh7Yla2tGeYBDD3n0i9qXZsJHjtOR2tzdKCtN30y0mg+Fi4v
cvkTuBgxm8bD5B6TVFCx
=hJ1s
-----END PGP SIGNATURE-----

--nOM8ykUjac0mNN89--
