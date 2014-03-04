From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/3] dt: palmas: support IRQ inversion at the board
 level
Date: Tue, 4 Mar 2014 11:50:19 +0800
Message-ID: <20140304035019.GZ2411@sirena.org.uk>
References: <1393534281-30759-1-git-send-email-swarren@wwwdotorg.org>
 <20140227210227.GE2931@xora-haswell>
 <530FAFAE.5050800@wwwdotorg.org>
 <20140228055818.GA29849@sirena.org.uk>
 <5310BA99.4050203@wwwdotorg.org>
 <20140303005246.GA22047@xora-yoga13>
 <5314B0C0.4040008@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="anW2uJ7hcMI/vMa8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5314B0C0.4040008-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Graeme Gregory <graeme-/SyDAi3Rz4f10XsdtD+oqA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, J Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Ian Lartey <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--anW2uJ7hcMI/vMa8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 03, 2014 at 09:41:36AM -0700, Stephen Warren wrote:

> 2) We can go through every single interrupt controller's DT binding and
> driver, and implement (document and parse) the new IRQ specifier flag
> there, and pass it throgh the Linux IRQ stack, yet we still need code in
> every IC driver to actually read the flag, so we haven't removed any
> code. It seems /much/ simpler, and no more of a maintenance or
> consistency burden, to just have the IC driver read the flag directly
> from their own DT.

Why does this have to be handled by the chip drivers?  Can't the
interrupt controller configured in a way that the chip drivers never
need to see it at all, for example by adding a "override the mode for
this input" flag inside the device?

--anW2uJ7hcMI/vMa8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTFU14AAoJELSic+t+oim9PrYP/0GNcCPpJN0eW/tM1aKoh54G
Fx2s5Ppc0GCWq4L92G5qNYCgWYJV5ZV30IM9rRorhJKjJaEZNuxdz+K4idYXvSo9
4T/qEpkrsrCwgybvkFaMRFarUPL54gv1pMQ3wJUY1ywUSKjOvSNVq01dzFakbUb1
EE09XR92InZ9ty04/uYaiB9ZQag9j7knLwS7Ys5WaNQbc/z6x/CWaiqhX/lXrYWP
X3g1gl6cBT3EL3jhg6Oj+LDQTo85t5fPG8Xq7i3mBg2PG1MCJSiYGBH0Q00Bc1p8
uaQPZ5/fGFn3nzkgdJvpU7haC7x89BsuBjTBVB4orEng34iINZ48jx35U2V6Qf9x
fQkgtVo2lRHEDWE63ZQMpV39xSm/Hs9k/AsLUCvBVQ0PvrierMfdADAfsVKSDksb
/QlBQalTmYy/+kHavEFJPGm+ywRzmjXxA8teABtg+lZEsrPtJV5VOmgHWOjD4nNR
5DPU5hGKz6VZ2NTXruos+MScPGIth+OQQ1Y/5ggsZb/+kjNzbzSZb0So8tlHi+KS
2ysCAfbJNbrptnacKlSBnpJhKBa/mW0i5dbnOveRhj/cQMbzkgERcyua3VIShdrB
71wxIA+7TPQxbFpg/RnRzgbDPiJ68PEfKB1NaS+gB8fUlABHgHduXnnuejNkBqML
gvdimylX8TlmfXaCkHlG
=nc+8
-----END PGP SIGNATURE-----

--anW2uJ7hcMI/vMa8--
