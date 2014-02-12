From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpu: host1x: do not check previously handled gathers
Date: Wed, 12 Feb 2014 11:18:54 +0100
Message-ID: <20140212101853.GD3409@ulmo.nvidia.com>
References: <1389124986-32501-1-git-send-email-kusmabite@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1295701627=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1389124986-32501-1-git-send-email-kusmabite@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Erik Faye-Lund <kusmabite@gmail.com>
Cc: linux-tegra@vger.kernel.org, tbergstrom@nvidia.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1295701627==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RYJh/3oyKhIjGcML"
Content-Disposition: inline


--RYJh/3oyKhIjGcML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2014 at 09:03:06PM +0100, Erik Faye-Lund wrote:
> When patching gathers, we don't need to check against
> gathers with lower indices than the current one, as
> they are guaranteed to already have been handled.
>=20
> Signed-off-by: Erik Faye-Lund <kusmabite@gmail.com>
> ---
>=20
> Here's a trivial optimization I have been running with for a while.
>=20
>  drivers/gpu/host1x/job.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

Thierry

--RYJh/3oyKhIjGcML
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS+0qNAAoJEN0jrNd/PrOhSQoQAL/XB2MGtD9XiiG00c+XrGFl
c2HZFPEDh7ISAmw17Y/UM/eSyeQCkMiR7pyNkYtVhe3shpvT/I56KohOxyW1V3C0
BQX53KNhvrOcsWoR8J7LXBxeYtKRNcumx18JELvyg/cxGtYTKJDT9zV/Am5tXRdP
g7pDwrz9C3X8F+tVUuuxA0Arp+v4Cfg3Jgo+V+jnTD31ulX2BIxuQWqvKvJ1kLN9
EiUC8ii3fcLz8Z6s/av1Ni3zEEL5qLyXpLgbP4hSr/Z505TnLncLqZtaPmYSzwfX
spsOUcXipVZGsJ5svFuAENjgKf3VAPy6BiCo34PWeiFjLsgloHH+E0WQ6e7q+a+u
mBWsYpqjneIkatL2+WwlozJFNXBEYzwOc4TK7Ctb+M1RIAOworbZE4Ok7bnnvHMJ
yrvUJBbWlcTgopU6kqoB18PNODTcKQZpf0zSOSitkaXh9PljVyK0ppb4xaWXEvzj
4aFYMjeKn9Tf61PYHsUOXR4X2GpStF/7JXjsU2IIYdLtfJFnKZDj3OigmuhDRPRT
0Dd9a7TS+1XbCUh/AxB69x7wQesu89loPn1sLmV2ZkA3EiVbz2k5fgy5AiYpvulZ
zIZ6EWOhZDZGz8EvZ8/akHzH+UPFr4zabyo8K6nEdD0ZcrwLhtWUzz1BIaP/h5j9
Ct5PcoH9wxQzU4GMjFsp
=DvLk
-----END PGP SIGNATURE-----

--RYJh/3oyKhIjGcML--

--===============1295701627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1295701627==--
