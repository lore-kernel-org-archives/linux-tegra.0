From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] staging: nvec: Remove unnecessary cast on void pointer
Date: Wed, 8 Mar 2017 13:49:14 +0100
Message-ID: <20170308124914.GD29118@ulmo.ba.sec>
References: <20170302201511.GA5080@singhal-Inspiron-5558>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1573495760608350127=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170302201511.GA5080@singhal-Inspiron-5558>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: simran singhal <singhalsimran0@gmail.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org


--===============1573495760608350127==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7DO5AaGCk89r4vaK"
Content-Disposition: inline


--7DO5AaGCk89r4vaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2017 at 01:45:11AM +0530, simran singhal wrote:
> The following Coccinelle script was used to detect this:
>=20
> @r@
> expression x;
> void* e;
> type T;
> identifier f;
> @@
> (
>   *((T *)e)
> |
>   ((T *)x)[...]
> |
>   ((T*)x)->f
> |
> - (T*)
>   e
> )
>=20
> Signed-off-by: simran singhal <singhalsimran0@gmail.com>
> ---
>  drivers/staging/nvec/nvec_kbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--7DO5AaGCk89r4vaK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAli//coACgkQ3SOs138+
s6GjXhAAgcMErR4O9WD13OleTToCP0kW6ah/KemKlpyBLsFI1Jtk/cK6vm9ZbraO
CuoiBw6DNF1WRaiSbnKMGok6h7azV+r9HtItJ6kj7B0D2esG9E0eEo/Z77wKqJG3
pQYeEgXZtIu2eBF6mj1k+c66lmFkNTtT9cr3Wrur1VDRlXSL7XTGHB5BqVKN/hzg
pFNOpdW8ZFdNedIWENEp41YJB6Pj20I1sxbeUUPzCxsQfAHISIxO4P0mYNXCJoPw
GO0+6zNMap4OlLevMuQFqHd81kPplPT9azObHhWqnjvur0TSW+ZdUIwfFDCC2iOA
StwgMxA+ozrEW8qJDYsoMcZ7QDC779Kb6hSkRtZdSyaVulBb0b7x8znYvQBzQNTI
ReXy78Z4uQEvHKxrsLvQliya9dRXNG24iyKAjYzDO4V5WDTME3kTz9BVYAs1owrq
Em82+wbmSx2uiQfaf4d7nAeNBnDjXNFSHIkDpCDPOfNqXp+uZoX8SfFT5zeHLy78
QumqB73VF3PXT0ScZwv2uwTtqS+o2MNGvQw04sV6PU8SbsxiQmGMrKswhKg7Uo4t
512v68fC7eY+x7j3J32WetutlpGfTx+s9WHqFJ8TVvwGPhNHvO1DheO8PxGe4weD
Zf61Az1VUvBSt6Sw+H1yROdU61ZqQ1N7ZKNYhsuHZUXyKKR3Ot8=
=HsMc
-----END PGP SIGNATURE-----

--7DO5AaGCk89r4vaK--

--===============1573495760608350127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============1573495760608350127==--
