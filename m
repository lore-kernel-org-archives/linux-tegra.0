From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] arm64: tegra: Fix flag for 64-bit resources in
 'ranges' property
Date: Wed, 20 May 2020 13:24:47 +0200
Message-ID: <20200520112447.GC2141681@ulmo>
References: <20200513191627.8533-1-vidyas@nvidia.com>
 <20200514135437.29814-1-vidyas@nvidia.com>
 <20200518135006.GB31554@e121166-lin.cambridge.arm.com>
 <e64ccace-d2b9-0e03-db3f-e65ed6f56230@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wxDdMuZNg1r63Hyj"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e64ccace-d2b9-0e03-db3f-e65ed6f56230-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, amurray-tUaQ5FxYRYX4aQPF92CzsNBc4/FLrbF6@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2020 at 07:52:24PM +0530, Vidya Sagar wrote:
> Thanks Lorenzo.
> I've moved linux-pci to BCC and included
> devicetree and linux-tegra mailing lists to CC.
>=20
> Rob, Could you please review this patch?

I don't think there's any need for Rob to review this. It's a simple
bugfix and I've applied it for v5.8.

Thanks,
Thierry

--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7FE38ACgkQ3SOs138+
s6HPDhAAmLcGCglJvHOKAlrfnKHcEc9ouq1S0D072FzCtpybboX8Pf89sG2s0ME0
2NTcwWNTwTLFUcGghwzc/AW3fsofQUilwio37IwgFzyHxG1tTnJ5jN86o0niGAlu
Qq/oNYtnkRNIJ5N4/+2k5Z6Vhek3XcMwX77WNO/84FcT9hwvE6yaT8/5GbQiCA95
x8Jd2b+hYqfYV6k6qP2tm2oHWlE/VZbwZzMA6Mhgj6APecsKA0tMEwDFcbuQCdsK
48EBqcaQGsiAvDvWWVdT7tetV+U6EPSEZDSXPflTV434mKkXHPfXhIS8G+nGRcWz
0eekGbiuHwEH3sWRLW9Cx3bs4XYEGAvOwtpJuJc3GIKFWveTeh1XG0WXu0k1h2HH
krNJ6NdjZcLQuqbx6Q8M37aD6UT9WsrYfi2LlQB2kUFbyMmaXM7oHdLjXmW75FZR
kXD5cWKfr5CQp8nJX3WadKEwt3nCDUWE8RnV9rYxc4NqnVfVy/fSDtU+RtxSTH5s
ZqAyqQKGWASjNEpYzyOuNfGh0IfTDvK+PH7izjcOp5jczFIe9CQVhDF6A7sRz6Tq
R6+qfzdClObL/MIvGJlE0KRsmGrka7HIv0mBkmkX/UflZ7rIWKpvOO2JS89v1ZpU
YQcDpForQXpkaHS9szRneb0MNgYmXP95ytItGP8eGvYzIys+rAA=
=YugZ
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--
