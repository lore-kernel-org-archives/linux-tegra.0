From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 02/29] dt-bindings: memory: tegra20: emc: Document new
 interconnect property
Date: Tue, 19 Nov 2019 07:21:56 +0100
Message-ID: <20191119062156.GB2462695@ulmo>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1043574452=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191118200247.3567-3-digetx@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>
List-Id: linux-tegra@vger.kernel.org


--===============1043574452==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:02:20PM +0300, Dmitry Osipenko wrote:
> External memory controller is interconnected with memory controller and
> with external memory. Document new interconnect property which designates
> external memory controller as interconnect provider.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-emc.txt        | 4 ++++
>  1 file changed, 4 insertions(+)

Do we really want to describe this particular connection? It's pretty
static and the only real connection here is the EMC frequency, so the
whole interconnect infrastructure seems a bit overkill.

Sounds to me like we could piggyback on top of the existing
nvidia,memory-controller property of the EMC to make the connection.

Thierry

>=20
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,=
tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvid=
ia,tegra20-emc.txt
> index add95367640b..7566d883f921 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20=
-emc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20=
-emc.txt
> @@ -12,6 +12,9 @@ Properties:
>    irrespective of ram-code configuration.
>  - interrupts : Should contain EMC General interrupt.
>  - clocks : Should contain EMC clock.
> +- #interconnect-cells : Should be 1. This cell represents external memory
> +  interconnect. The assignments may be found in header file
> +  <dt-bindings/interconnect/tegra-icc.h>.
> =20
>  Child device nodes describe the memory settings for different configurat=
ions and clock rates.
> =20
> @@ -20,6 +23,7 @@ Example:
>  	memory-controller@7000f400 {
>  		#address-cells =3D < 1 >;
>  		#size-cells =3D < 0 >;
> +		#interconnect-cells =3D < 1 >;
>  		compatible =3D "nvidia,tegra20-emc";
>  		reg =3D <0x7000f4000 0x200>;
>  		interrupts =3D <0 78 0x04>;
> --=20
> 2.23.0
>=20

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3TigQACgkQ3SOs138+
s6G61A//YQ1bHyFyTWdlNKJqA9a7DjovHIcjcT3WDnbK6wRVgBR3Tp5l7VeVBU8+
uZrFCL1O8xk48XDUgEYlhLsdy/270Yv5dET6tw4ZnPxTsV8Npe/30cgwOpaI/jpA
ARHft7E8Wo6wl7ND1mXH1eJAgoOOHvXfF1fqeaCC1koZSDNR+S0K4RlzjUA8Mnwq
pL8IWCUR0j4qVKpR0W1b23EVIzdR2AGwx9eh34yFcsvofuc/JXAD/8c4L6X6gVOR
4W5OmiM/2XKPAhMgCYskLgJd7EAXop74GWHeXk5s7eePQdiA+NRAFCCFsQeY45qK
6ixWzORLpQeAuSVFLLBikA7wF6Qg/kHkEI/2OXuK/dKVoRqkDaOPq76lfhQEOpHn
JMlwk09OHNTJK1jqeW5+L4S7MhWJiOM159LG6Qf4/ynfXnv+ntbak4AlpzPUmuAU
4j2oHWHnzcCcBHSCkREHc1LvNDBrS3jXgwynxzhekpWDEEnpQl4vyiMPww8zT47j
jbHWifgp4cGH9dqbUKjo1JwgxktQNksLGUyceuGBlQVmlnEhoP678RCyQloiluYN
WmkMtgUU6U4IXHjLh++bsAWQ3L83B5h9aQr3mqAzlqC4nyg0hs+T4PGzVFQHKZBo
ecnLi7yruBFGflWvgMpsO/JLBecsGZO2mS1tiH9sigxYS3FXKT8=
=wXrm
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--

--===============1043574452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1043574452==--
