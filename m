From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/7] PCI: tegra: replace devm_request_and_ioremap by
 devm_ioremap_resource
Date: Wed, 28 Aug 2013 15:27:32 +0200
Message-ID: <20130828132731.GD604@ulmo>
References: <1376911241-27720-1-git-send-email-Julia.Lawall@lip6.fr>
 <1376911241-27720-2-git-send-email-Julia.Lawall@lip6.fr>
 <20130819120249.GA5740@ulmo>
 <CAErSpo5oOnfhi+aRi-Z3kCwS1VpYSO6FX5O_MOZmWNLcfhhA9w@mail.gmail.com>
 <20130819201224.GC5191@mithrandir>
 <CAErSpo6U9i16gdaYGpWqgLaFteXpy1erCUw55SqkHLcbypP=vA@mail.gmail.com>
 <20130827081443.GI8686@ulmo>
 <521CCF9B.9000004@wwwdotorg.org>
 <CAErSpo461H=3qD5Xb7rKkMcQ1_ipyAQ5Tv2VhZD4j578A+Bd9w@mail.gmail.com>
 <CAErSpo5LOig3KPGfyWJ1BWA61Ox3cyrguSo_XdVqw6SqxttXeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RhUH2Ysw6aD5utA4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAErSpo5LOig3KPGfyWJ1BWA61Ox3cyrguSo_XdVqw6SqxttXeA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--RhUH2Ysw6aD5utA4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2013 at 07:02:16AM -0600, Bjorn Helgaas wrote:
> On Tue, Aug 27, 2013 at 12:03 PM, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wro=
te:
> >> On 08/27/2013 02:14 AM, Thierry Reding wrote:
>=20
> >>> If Stephen's fine with it I suppose we could take pci-tegra.c
> >>> driver changes through the Tegra tree. But I think it'd be good if
> >>> we could still Cc you on patches so you're aware of what we're
> >>> doing (that is the same for all drivers drivers/pci/host/*). And
> >>> we're going to need your Acked-by on the patches as well.
> >
> > I think you have my Acked-by for this case already (from Aug 20).  And
> > feel free to copy me on anything you like; my delete key works well :)
>=20
> I didn't mean for this to sound like "I'll just delete any email you
> send me"; I intended more like "feel free to copy me and if it's
> something I'm interested or knowledgeable about, I'll try to help and
> if not, it's easy for me to ignore it."

That's exactly the way I understood it. =3D)

Thierry

--RhUH2Ysw6aD5utA4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHfrDAAoJEN0jrNd/PrOh9LoP/jzTsBN750UFOQAVpcrNvC09
At58ZhEP8KBnnJtuO4oQIt07HiK32D4myerdIX70Avvjw8fgtCm+mlwdOsrpvTOw
vzF91V1bCufiok8B9T/MPj6loD0e+XcRhqKYRkpYu0YLkPP2VNll4JOZJ0oAjydf
6mcbApw1dkX7loYpmsuE6ZF8pEp6mWia36YGwWZ81YMSaHGMK6ZgMa75hPpuN+3D
Y1b5A0sjIkQakV/JXUWLudoqqeb3gmQ+KnfifJAsV+tgtgqOON8vV2XA7pwLGvAG
HswrETQz4rIpVRYyxR39gsGm6kVTcin2rdS70MRKa0u6WaMZNMFDRx2KG69FHZ2s
jC0Ti8L79CtNFo5S9Y8lcvcdBvL4gq0UpMpEbkQeOQQCJbEbn73TEvyCgGMJwuVB
kG++aAYNJZdrolJa+YY0aGqK6/IBxECY0VpeH5XO/oux4tZkhwGHlBHYpXhyEYJu
oIP34C8n2qiTD8EN+tLjOq5Mjl2I1z869b8pP/t/KER0yQLakQ2z4emvE6uP+bZX
QDcrvOTr/jI/TOdFjzswcFsffn8JA1GHfxY8qAbM5X8QDoeYt/ILCSGWAsoRybml
D+CEQr3tp6UGL6CzkluEqkKCBHXoq3pd0pV6nr1gOl0ypcUpwcIPYdQbz9XMQwiM
hnMV3SP4Bg+sS9TVoCVX
=DkuK
-----END PGP SIGNATURE-----

--RhUH2Ysw6aD5utA4--
