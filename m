From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpu: drm: tegra: Adding new typedef vm_fault_t
Date: Mon, 14 May 2018 14:59:36 +0200
Message-ID: <20180514125936.GL18312@ulmo>
References: <20180417134755.GA30291@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9/GiYV45wF7IL3Iq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180417134755.GA30291@jordon-HP-15-Notebook-PC>
Sender: linux-kernel-owner@vger.kernel.org
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: airlied@linux.ie, jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, willy@infradead.org
List-Id: linux-tegra@vger.kernel.org


--9/GiYV45wF7IL3Iq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 17, 2018 at 07:17:55PM +0530, Souptick Joarder wrote:
> Use new return type vm_fault_t for fault handler. For
> now, this is just documenting that the function returns
> a VM_FAULT value rather than an errno. Once all instances
> are converted, vm_fault_t will become a distinct type.
>=20
> Reference id -> 1c8f422059ae ("mm: change return type to
> vm_fault_t")
>=20
> Previously vm_insert_page() returns err which driver
> mapped into VM_FAULT_* type. The new function=20
> vmf_insert_page() will replace this inefficiency by
> returning VM_FAULT_* type.
>=20
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---
>  drivers/gpu/drm/tegra/gem.c | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)

Applied, thanks.

Thierry

--9/GiYV45wF7IL3Iq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlr5iDgACgkQ3SOs138+
s6EEXg//bokguGEBwwTSDuDaSFIZw0Z+9pB2xoBEjsQXRZBQrKl/oZHAMbPGfkK4
Wwa9hHqjvJ0w1nzBEQrVGZGB9bWGOoxExRz6gL560NcpFfgPUz00KIyszMZl90KJ
eqnoC7N9RrnZ0mLE00S6dIf5QliY16djVK1Eb7S0ftKkmH/H38ntW6WNsq2AEgiH
WcWmw26SC9uQjuDH7SpLVxrP6DGMwq4mgRfbrlqVRzYecjjQ8FD7ifX8rwhL0dLV
zr9yhekFV/nEjtkVYWO2BWk6Qbx50qscWJITkTsQX/sibwuG+gs8y5WSH1Yt7nDh
KmBnrX1mhayHZ9h6G3O4gncMEc4hculEwfw/yGznlfI3ljAyqVFU0RI8HpOXgDBP
vMKm/J4ngaOnjM/27/uZTQTFoUx/DJnN6H9F8yUFEgzbzqe7EDorSpQCoJYD0rCC
ZccMg5FJWZ67ui4q7fZ5hNm8UijO1XnBdqZbLfaAMZFaaeCZcuQAPy5MxMlvxZs8
yXSR9agnvWQZx5/2YgurZCnztUAv9UHmENNsdKtQzLB07jxdOTpGwdVZMUe9eZjB
ckmstNCZSBJ/GaqxzsFRAqWAei3dG3ECmEy4YPfPWdY0Gt+GtcRtJti+e6XRp5J7
x42wcJXo0Gb6uuQTUrqoMpoRHGRh+Xeqgna4fGlG/nYe5dhdY1g=
=9X7O
-----END PGP SIGNATURE-----

--9/GiYV45wF7IL3Iq--
