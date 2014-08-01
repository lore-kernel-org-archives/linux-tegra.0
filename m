From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] drm/tegra: add MODULE_DEVICE_TABLEs
Date: Fri, 1 Aug 2014 12:12:04 +0200
Message-ID: <20140801101202.GF21724@ulmo>
References: <1403130115-23583-1-git-send-email-swarren@wwwdotorg.org>
 <53D00D1C.9030305@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vKFfOv5t3oGVpiF+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53D00D1C.9030305-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vKFfOv5t3oGVpiF+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2014 at 01:29:32PM -0600, Stephen Warren wrote:
> On 06/18/2014 04:21 PM, Stephen Warren wrote:
> > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > When tegra-drm.ko is built as a module, these MODULE_DEVICE_TABLEs allow
> > the module to be auto-loaded since the module will match the devices
> > instantiated from device tree.
> >=20
> > (Notes for stable: in 3.14+, just git rm any conflicting file, since th=
ey
> > are added in later kernels. For 3.13 and below, manual merging will be
> > needed)
> >=20
> > Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > v2: Remove change to drm.c, since the match table there isn't used for
> > probing.
>=20
> Thierry, I think this patch got lost? It doesn't appear in next-20140721
> anyway.

Applied, sorry for the delay.

Thierry

--vKFfOv5t3oGVpiF+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT22fyAAoJEN0jrNd/PrOhaPcP/jRw9r4pVmyvO38jr5ePcWwk
yVMSdb8hCuToqxKNswiYaUxJCxnD9e+jZtCveOiDDfcIWrlnlyj5jcV1+Wlx+kq1
L4xq5dzVX9unfW9r7o3/Ug3LgwrKjENYVgMLaUJ6WGQDYpE3O0VsqtdJ1Uc8q/s5
WrmNWYTy6LY/cgHZyq/61g40oWJFtwJO/G9T2bJnEIfxfpO5BBPQUKIZmS9F0Kb0
yf3kCAmVAQ9XBeTl7/m9bzGUIMK89LNQZd8191ShleUVzhxakAEBKQ20vqxs/rQY
qsNtcahOfGhjxELDP4O9Z+ZQmWYOTveWJfX9WfqQxxJOwa964JZ4op7F4ZEyjTjA
quomYrgWafP8xjHOtjppQg3ETJQqNupS7ox4f9dwHBbqOvEGEffljYR71Jf8dWNv
54tRUdEAebtYSGRWCoHMJzBn7exL0j601mpTsZbAp1OAK/8rSHmXsm/PAZI8JV1k
8nh0Nh2fMXKBj/efHkUy3rVdBADCGVz5OIPM6c+1wLPE6xvEB/4G2kjsmBknPg92
1+RyxjsolhQ1vycwUvHk9O1K6Im4CYTo7l1A6ypDVu0vdw6d4GXqJEeqvIBmSh7o
+CuqI13UKLK41tC1U2+7xBneCYdIj8SuJOhfViOlff0Lf3PrgxsuEeb5KtRdr4tI
y2TkuuL3taFTfvRs1Ui+
=68O8
-----END PGP SIGNATURE-----

--vKFfOv5t3oGVpiF+--
