From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usb: host: xhci-tegra: Tegra186/Tegra194 LPM
Date: Mon, 24 Feb 2020 13:51:00 +0100
Message-ID: <20200224125100.GA2108060@ulmo>
References: <20200224062145.25785-1-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200224062145.25785-1-jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 02:21:45PM +0800, JC Kuo wrote:
> Tegra186 and Tegra194 xHC supports USB 3.0 LPM. This commit enables
> XHCI_LPM_SUPPORT quirk for Tegra186 and Tegra194.
>=20
> Signed-off-by: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/usb/host/xhci-tegra.c | 7 +++++++
>  1 file changed, 7 insertions(+)

I see that Mathias has already queued this up, but for the record:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

JC, is there some way that we can test this? I see that there are some
sysfs files that can control LPM enablement on a per-device basis, but
is there some way to check that this works as expected? Or do we just
assume everything is fine as long as all the devices continue to operate
properly? Perhaps there are some state transition counters or something
that would indicate that devices are properly transitioning?

Thierry

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5TxrAACgkQ3SOs138+
s6HBvg/+JM4X5jwAIB8LBR3PfROxqVLlxVwGE+pixWhI7HgPOhdWH4O+DXM43vpk
JOYvOuVQGtT4I2IMlO4fUJTUoJxLORidr/6yLitVYlizwPrv5CR/BufR3mclEm3z
Jcr1W9ljDrupb+xsisrCmN5MlMUXTvJVhGNuRYrE01LebPkHTCabko1TCVP8Zup7
JZ+FGI3XSgqWn0/+TyrDSiV+RYvT7moE30fIP8jFi3ML50htn9mHt1yNwE2scDM2
JxSkSYGt0SRmq4WFSDcK4vlO2R9PBJpbXz5Gn6ym3mdqxRqPgCpWMYuqV4z3BKvR
mEcXlFGAFecwhk97gSfD5ykbaetceWDjsOTUkYlFZPC+Fx7AwIdLh1/NMq6hg8I2
FZ+zCnnFpO7q/uziqeUBBqteAoEFi094TJ9SlWTfm4esudxPNvU7r3TJZipqiqom
aq9yof+0f9uz4y8uKYk8z7OVWq3w6onXa0/VjqsDCucRPqQnfdxBctRcFFKzUHBH
PqRXRPWAjWVJriqWhWW4+Hl+NsnGbA7SnHN0XNZDQRjPQmgEyz3jFX5hQ04HFhLA
PL8J2WLxcTjkesYO5sadp/3h715v7zpXmlgG9AewN+BZGv964qIfWD93dNBdYy7s
2xiwhqhLI0TN+vhtsFGJARVr8FAGuAKSBAl/lR/u8EA9mw+aPck=
=obLV
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
