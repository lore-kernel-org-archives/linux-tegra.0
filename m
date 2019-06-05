From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2] arm64: tegra: add CPU cache topology for Tegra186
Date: Wed, 5 Jun 2019 10:16:59 +0200
Message-ID: <20190605081659.GA10944@ulmo>
References: <20190605022640.17837-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5389831247136737110=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190605022640.17837-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============5389831247136737110==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 10:26:40AM +0800, Joseph Lo wrote:
> Tegra186 has two CPU clusters with its own cache hierarchy. This patch
> adds them with the cache information of each of the CPUs.
>=20
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> v2:
>  - add detail cache information
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 60 ++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)

Applied, thanks.

Thierry

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz3enYACgkQ3SOs138+
s6Ft9g//YhdzpDxT8SmLLJxJ+RqnMTzqOtGr5Gn6zGrVsJqu9rOnscmSY3aYVqoj
Tsp+6ZEQp2IqmzxfCKF3Dmbnd7d3tgnUI2iAb3DyF24e4TGJH76ivK9hnVaxNteX
3vGtfKjalTkw1cbGFGi7KeRc3Rkmz7GIJtw7T8b75NQ20bT8XKBO2znIs48GRFoE
vnlCsEt4JAzH9EgQpllYZzO9re69JnVCUNS6TXJ6DLGkyR7h1lAWgKXW4bKo0PMN
vV/Dr51VPRLc5j6177mWh8sUryxiYmDnNsdqhNpXpLXSVUjZuSoW724bdsSPK7oq
p0YzmjxiMUG+inBgeneypDt9Uic3ozJnUoWnm/JiiDYxgfb6yq3SZ+A9mq945lvg
2iLK/Axg8y3hhCuiGNqYeJFPyHh6OQoMTMqyP3PY08ngW86NcYlrx22zTRKDqPR9
5MlRPsv0ewj94M0PR8yvShupwl8irJ9RfLr1zWCbWvV8EHFO7zFKHBOOYHAXew6x
x+Rkp5Qj1eQEwE5oNTTasePntVFfMVB+bSTfTDTYEyV6xXA96DvwNrGL5tW10mYl
Xf+5g6MAtN+CKCDKvJaK9GM6s0ybmgH7v8QY3ZxNiNHKpo5fjLib6CbxPCxvLjjL
LA0QHleueeSZHC1PHURdXU3L//y9GrykEDP1BCkhXt3nzf2yJQk=
=yybJ
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--


--===============5389831247136737110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5389831247136737110==--
