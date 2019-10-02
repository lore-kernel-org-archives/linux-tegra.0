From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/6] xhci: tegra: Parameterize mailbox register addresses
Date: Wed, 2 Oct 2019 11:39:51 +0200
Message-ID: <20191002093951.GB3716706@ulmo>
References: <20191002080051.11142-1-jckuo@nvidia.com>
 <20191002080051.11142-2-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191002080051.11142-2-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>
Cc: gregkh@linuxfoundation.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 02, 2019 at 04:00:46PM +0800, JC Kuo wrote:
> Tegra194 XUSB host controller has rearranged mailbox registers. This
> commit makes mailbox registers address a part of "soc" data so that
> xhci-tegra driver can be used for Tegra194.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 58 +++++++++++++++++++++++++----------
>  1 file changed, 42 insertions(+), 16 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2UcGcACgkQ3SOs138+
s6HZXxAAj/2ccE7HkLhaxNMza6KLkAIu71w1a/63g7IUbRc7yLn7g4PwViahNPI0
cyT0wfdMIZlquxbf+g7w7kqHXcMdylo34cNFKApdVTmMy6axKnom/jVJ7SUY4RXe
N5YGVUXEGIhtlsuherZNx0MCgVh59KZSegokKL0sUbn5FaN7n+al0hYB0jJBEg2Y
MuUJHhKbF+JKDL1G+TKGjhC7HQZP4GZubc0NWZAII+KwLmQAcPUK5UuPbFXyCK3S
exxBrULnhWidd9g8A+FJNCcJgQAlPDfdo5XHIgEi1ZHJLoOqBVgUiwX6aZw4TIRM
8J10QdlK0EYGM6e5Rj396FJgjREYY78n+oUNqx+L5GTVgDNYLjZ7xTmLTUxq8Gng
vPeSxlruwzzbcnfI5YvWS5Spj7ydMEG5jfBaW9el1MCCuuIVuIXA2nbfZmVaPpvG
6FYxav5UUVzrNiIwK0F5+0+RaB0U5/IlNSjlBFi1n0d5E4vLLrpwMGtu2cFsFzkq
ZiGkchUm2V41JOuXmU+CFNGfOWKhzDBYNEnCJ+We5qNwYx+OG6/iP/nEEPCkIr5p
jFMStpz0JBi6MDG5Vas7WexdPsk9N/1lOszGzkLAMYAJSTF014uylLyyK0+Y6NQe
6FOuL//KfM5QGrdCFU5RnwM/Zz8YlS39wUahPYgkmd6w5j3wR9Y=
=+5KZ
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
