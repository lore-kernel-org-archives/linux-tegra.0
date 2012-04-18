From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/4] regulator: tps65910: Add device tree bindings
Date: Wed, 18 Apr 2012 09:35:30 +0100
Message-ID: <20120418083529.GB3021@opensource.wolfsonmicro.com>
References: <1334710829-22777-1-git-send-email-rklein@nvidia.com>
 <1334710829-22777-3-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1538604908564028205=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1334710829-22777-3-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============1538604908564028205==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 17, 2012 at 06:00:27PM -0700, Rhyland Klein wrote:
> Add device tree bindings for TI's tps65910 pmic.
>=20
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/tps65910.txt |  132 ++++++++++++++=
++++++
>  1 files changed, 132 insertions(+), 0 deletions(-)

There's no actual code changes here, this should be part of the patch
adding the code, especially since there's only one patch for the code
change.  If there had been a series of changes it'd possibly have made
sense to split the binding document but when it's just one patch it's
easier to review together.

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPjnpxAAoJEBus8iNuMP3dCBYP/2hVPRPB4ekRf+/m6MYtDvCq
Xq4QAxv9ZXyL4fE79FVxuFMwk5Svm/aqfg5j9GnUBJta9Ppb+XTbhFatDKO6shbj
KCHxpflc7m6m9PfBl4sI7bAehrAr0UbgXB4l/r9YhdZ1fpHNq0S26EJeqS0T3QiT
FH5apnI7TfkqeX/h4QhipTM/SiogLthVf7xpK8yinP6PMwiRHHzv4SlWQXfjyopq
pIXu4eWFlgUAQFXefcAQM4zFIXeIVbsTCLLlw7sFYIrF1D+c5FVK1XySdY7OWBT4
ZYpRoxLU2JpEZxYMKpZ3mwSDFXspmSp+I7UiCoiFdpswL+VdXagK5TSxEFY5Wdqp
sFMOAbLpDxojLZ80f+BCOROmtVXAZZgnBgD6zT/qM9QYuzLQ9SU80XTCOH0DpzVm
4G8HOXBuG7qx2ehF7z4a5n59ToYOLS6RDV2CIBJJQe18X0zT2nNenwuNzaHsWbj/
vTKFBS1uV6Masj+IRKZoS/YjMexgtu9BpS62K+AOEBTFaNXJFdYwNpCjAbZnPfIQ
un18gBGiCOPP2WPVRVV/EsGzsOjQJyCO4FNDRhjNA1dEudRDT30eAxIbjaecr3Ba
5PQ2DmLIGZ+X1TwfhnGpfHU6d8rAh6ftrfDNnFi/zF0KtbE3HW5vRxD1khgBFIiK
XEHqw8A/UtWJZYamvPXu
=YUms
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--

--===============1538604908564028205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1538604908564028205==--
