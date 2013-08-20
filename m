From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/7] PCI: tegra: replace devm_request_and_ioremap by
 devm_ioremap_resource
Date: Tue, 20 Aug 2013 21:31:31 +0200
Message-ID: <20130820193130.GA14170@mithrandir>
References: <1376911241-27720-1-git-send-email-Julia.Lawall@lip6.fr>
 <1376911241-27720-2-git-send-email-Julia.Lawall@lip6.fr>
 <20130819120249.GA5740@ulmo>
 <alpine.DEB.2.02.1308191405450.2313@hadrien>
 <20130819121238.GB5740@ulmo>
 <alpine.DEB.2.02.1308191414360.2313@hadrien>
 <20130819193339.GB4961@mithrandir>
 <alpine.DEB.2.02.1308201112400.2269@hadrien>
 <CAErSpo4WLt7zbyfkKfvMbXMQGmp0MAS=7AFiomUjtUCfdprDUA@mail.gmail.com>
 <5213BB2C.60908@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5213BB2C.60908-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2013 at 12:53:32PM -0600, Stephen Warren wrote:
> On 08/20/2013 10:26 AM, Bjorn Helgaas wrote:
> > On Tue, Aug 20, 2013 at 3:13 AM, Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org> wr=
ote:
> >> From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> >>
> >> Use devm_ioremap_resource instead of devm_request_and_ioremap.
> >>
> >> This was done using the semantic patch
> >> scripts/coccinelle/api/devm_ioremap_resource.cocci
> >>
> >> Error-handling code was manually removed from the associated calls to
> >> platform_get_resource.
> >>
> >> Adjust the comment at the third platform_get_resource_byname to make c=
lear
> >> why ioremap is not done at this point.
> >>
> >> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> >> Acked-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> Tested-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >=20
> > I'm hoping this goes via arm-soc.  Let me know if you need me to do
> > something.  If you need it:
> >=20
> > Acked-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>=20
> In that case, Thierry, can you please bounce it to arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org to be
> applied on top of wherever Tegra's for-3.12/soc branch was merged.
>=20
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Yes, I can do that. Thanks everyone.

Thierry

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSE8QSAAoJEN0jrNd/PrOha7cP/jHHviDSOEEdhLvAlWNYXNIA
YZeqSc3FoIx0oYpfA0gJqrBI7TUKExYMgRB6pX64UObkql/p14MPI39Fwy0BSmIM
YThoFDC8sPvbCdaHCc5EDaxxQVysgg39/lrmJcccQRKxJdPTiEvkzPfyQoxex/hY
uMu1K49oGWZc7uSf/JYvPLo/C4YC1jPnxuvWi3BEtgUJcWfjH9YjDxT6OdUTcGY3
AA5GQ/1fC81s+QjWtkqz9rQYylTTqW7kCXsdf8UCJoVYNcP6P3hCtD3K6eIVSBoa
JKC0Rbgp4s6kDH21XcRfrSzODMKMBS903QZ403HltDiZJ7GV/lzvtIduFE0zT2Y+
4bZuz8z17dkkLVWQ64VnSHv6mkT7hY5nR6fIbBsdaX02za2BqRSshPa/fkki1V82
Z5kAGFF4wnMRJfylvu6Min5mNx/YA7eUll66h/02ZYG/piKSEJvvL5ERosbxDkNw
aZoYye2jUcpdFCd7RmfNbfgLEo/KKOMxLlUSYeizYeeIQqFNOJLtWbPRt6zliXVg
la6RMrEcIBxSQm9Fba067gQJKlsMmmGTxjZvn56PEfzJBpJ89NY4gn3LiVUG8p/w
ilgualt13rvm7EsgGBtOhHpM+Z9JGiPv1lgn4vTJ50Bl5Rc+v2CxDbnw3CT73nfi
5ruM8fJ8Db/OHwOY56I2
=S6/L
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
