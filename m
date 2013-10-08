From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 06/27] gpu: host1x: Cleanup includes
Date: Tue, 8 Oct 2013 11:45:54 +0200
Message-ID: <20131008094553.GA19633@ulmo.nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-7-git-send-email-treding@nvidia.com>
 <52539F5E.1060005@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52539F5E.1060005-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2013 at 08:59:58AM +0300, Terje Bergstr=C3=B6m wrote:
> On 07.10.2013 11:34, Thierry Reding wrote:
> > Most of the included files are either not required or already included
> > by some other header file.
>=20
> What's the general policy? I personally feel that each source file
> should #include all the header files it needs, and should not rely on
> header files #including other header files.
>=20
> This way if header file A stops needing header file B, we don't need to
> go and fix all users of header file A that assume B is included.
>=20
> I've been hit by this multiple times in Linux kernel - sometimes some
> header files just assume another header file is #included and refuses to
> compile it it isn't.

Explicit includes are probably the safest route when dealing with
headers from include/linux, which can be volatile. However, in this case
any of the general header files are already included by driver private
header files, which are not subject to the same volatility. Or when they
change we'll see breakage immediately because pretty much everything
about the driver will be rebuilt.

It even has the advantage that if a file in include/linux or include/drm
changes in a way that breaks compilation, we only have to change one of
the driver private headers instead of all source files.

Thierry

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSU9RRAAoJEN0jrNd/PrOhXSQQAMExcBmDDKYpwZXm6AIanWgb
MX1afk5PQhnD6/hJBfpWJ8HDlI71B6ntTlQLhQo6t5BSoPXyoanRw6PITnd/6gW5
2hLwtv3iRO1YZE9KfZ5iuXsTA39IIv8SHGY8c5Y0ZYkWQbhMDso8hNTtsM0ngcid
kRU0nOpD2djtAVPCN1kQgyLtcxo8Y2q0WY7u/D+o2ghVZxOEc36C+UXWo+on/M9y
0EHPPQ4zs4JBfex6EqPpBeHKxG33fveDydZKnBN3eMZdktDTJ6RPr+7IC0cWOtti
RQAcFo0uJeKwISUQ07DYcsIWOjre+BQjBR5jIs65tLMUNFaNOtmacNx+i39gAU2P
NLqiwk+rknu3kzVUuPwQsnR/8tI6T4bY/zgmiyS0QgpcanOn05PjR1cIhzBdDCk7
+qnWxDFKnu3ptiQ4BSBspU3z1xnn3NyOeSQG5gcfkFxaoP5iyjEo438x5MhFLsvh
YSUXWMq4iQi7mFWChBrckMXR3GqvdQ1+rwYYHjmNhU2/X/BATEwAd6HIKuf4orD+
3all3Do3hXXDgsUVIVl6GJc598ensy6lXfVQiTYN4nyUOBOkXxZi++/182+tXLrW
r20ew4Cpq79OnimysfVBvnHg+7/Oo4mdpTH6rpHDVQpqjzKA7a+EHl6I5Cie+0qx
gB1NI1KloKDycLSydrWt
=mQC1
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
