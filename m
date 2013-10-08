From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpu: host1x: check relocs after all gathers are consumed
Date: Tue, 8 Oct 2013 13:32:12 +0200
Message-ID: <20131008113212.GI19633@ulmo.nvidia.com>
References: <1380917913-20482-1-git-send-email-kusmabite@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1983509946=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1380917913-20482-1-git-send-email-kusmabite@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Erik Faye-Lund <kusmabite@gmail.com>
Cc: linux-tegra@vger.kernel.org, Terje Bergstrom <tbergstrom@nvidia.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1983509946==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="boAH8PqvUi1v1f55"
Content-Disposition: inline


--boAH8PqvUi1v1f55
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2013 at 08:18:33PM +0000, Erik Faye-Lund wrote:
> The num_relocs count are passed to the kernel per job, not per gather.
>=20
> For multi-gather jobs, we would previously fail if there were relocs in
> other gathers aside from the first one.
>=20
> Fix this by simply moving the check until all gathers have been
> consumed.
>=20
> Signed-off-by: Erik Faye-Lund <kusmabite@gmail.com>
> ---
>  drivers/gpu/host1x/job.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

Thierry

--boAH8PqvUi1v1f55
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSU+08AAoJEN0jrNd/PrOhU0gQAJ48g2ZR+7ZFvyZMwz35jHOU
xYpjk+H5VE9D0CpXpsaQO5OWc9dIgRFgW3vmwFWUCwFTyFQVuFUMO9bSzDDL4hR9
nYVMv3/Q/J3Z1Bq7dwk7UEMJ80U/Ag+ZO+tCwzdlAJSK9v6a3F36cKEfE6ZBOQpO
9TfNcrgwb2G2ILlnp2qDlp8Ch/h3434joCBgD7ZnM0Q0XiyxzMGpXHt0fU8foxgi
vsNiVPwjORFB67wEwelZ1I3w8GjNbDndZw5soBZqfEhq4kThYSQaRrKM7y7pz6Zs
YWbdqy7w52Bx3dlN5WfJG5m4eefHJDRDeJwR12wM1hLB5tqLqqeLuneb2QwdiYLW
MtolFjOHVO8rxUd4ZtMAQRvPaPmMTvkrd6tUdoaoHc9asQm2BUSr6CbLNYW5okyR
jh4oc1eaA1o3LOVTQdtiQgjfqUnxi41x98mWDpy8PrwkNKvNs7fyP2djvAxzp8YB
JfoUrXJ/PhNf9MgZ98hdHs3uMTiOFJtWDF2xXxddwZ4LWjdMlRc4CQGEMU1msFRz
yR429R/OgrTsFwLPvuhHSbAy3583klnT/ZDeVHenEuZZXSipQJNSyVl8t4lnOXcC
3fbuaZVi5TJ51cniN9GN5XQst9kImrHmV06kBUY4PSDgczkE1w04hPL1hGYUTKQN
F5dChSNN/I+PyDEgvV3Y
=QrTF
-----END PGP SIGNATURE-----

--boAH8PqvUi1v1f55--

--===============1983509946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1983509946==--
