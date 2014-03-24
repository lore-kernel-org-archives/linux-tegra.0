From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/12] drm/nouveau: fix missing newline
Date: Mon, 24 Mar 2014 22:49:43 +0100
Message-ID: <20140324214942.GA17218@mithrandir>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0703813239=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1395650554-31925-2-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============0703813239==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2014 at 05:42:23PM +0900, Alexandre Courbot wrote:
> Add a missing newline at the end of a DRM_INFO message.
>=20
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTMKh2AAoJEN0jrNd/PrOhDXcP/3qHhqDUfIVhIf3wQoFbNBW3
lbjv1aC54vthGFF9KP2ztk0xeVJ8n414TPxLYKXByErrT9rOmCbYzNrfdmXL8+h8
TsT9XIt+wblbwo2cFX6R7GgqBI5UXLsu/fGyKpusTAYf0qvSogxnpegizJmiTZvP
kQDzkrew84CT2BydTPcjoDk7m0LCKODlS2ghykg8PGbKk4hakim1RkFrU96oNJNd
dVhdvatLBk3vUZPKARIdR5knjU7mqOw5TFr88e9hlZ7f8aWFDqVy75a2mULsFfPv
2Tx3rdtcKWkku/AOXDZyeuQeX9KYJasyxyjWEnbtKZsihATf9vJ6i/RyrOHHaZwr
wKtYu4ApKqqH+/SStLq87VI5jo+A4epUMzoWpehO2brc4e+6dyD/NGMzc33suF8k
qoZb/zS0KqNucQD3ZoBz8vSWyvITl+PYAPcebgWIHBv9GK7+NnBrOXFn1Od48GRv
7+o4G8B+rrvrpn0xEeRK+gwvYh8LhzQuVusjoVoiQwXVOcCHpRG3lxnPiywPCR+k
QW2KUT757sAz5v6hcIvBMfJv4ZJWWD6fBj2QPA6iVxJJY1mr0VLjSNOq5ffHn+rW
aeaNkaAkOpYxQHf42uTJzIkcUOSHqqPSb4SE8IKWLaGktUbV48l4EwZTnaAA9Ewj
Su9ZIscyYnzXW4mIzawj
=fBzn
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--

--===============0703813239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0703813239==--
