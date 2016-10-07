From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/5] PCI: tegra: Swap order of pads_writel() reg/val
 arguments
Date: Fri, 7 Oct 2016 19:22:11 +0200
Message-ID: <20161007172211.GB10399@ulmo.ba.sec>
References: <20161007162615.23718.84354.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <20161007162632.23718.27618.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161007162632.23718.27618.stgit-1RhO1Y9PlrlHTL0Zs8A6p/gx64E7kk8eUsxypvmhUTTZJqsBc5GL+g@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2016 at 11:26:32AM -0500, Bjorn Helgaas wrote:
> Swap order of pads_writel() arguments to match the "dev, pos, val"
> order used by pci_write_config_word() and other drivers.  No functional
> change intended.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/pci/host/pci-tegra.c |   30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJX99nDAAoJEN0jrNd/PrOhiY0QAIFm/i9I39C5zj2oADxmjZ6A
+SEdEh+9y+T53pnw0mQTIqlx8WjAx49oWKRnPojM6Z9Enbv30Rs05z1pzlr3lbMy
YhBmE61CIXFPPA1+8mqaSKBx9237UEsN+fThKMqWNSg4BUHKBbYIFEv3YixJwiNW
ZBhuJxn1JiH2Ng2lCHDK2YUx3DyBNCq4OAxv8L+Go4m5fzI7/Q4SnfUrEdvVJp+e
xeOYwYbGJ/Zh81q8tJ9MBGc1r6R7cRDmmLduYuY/LnQLGGmQlJ5M0h7lOpB1Hege
zTePwZyWDSR1gd8k3QXfeFjVYkqwJQnmCn9QNwSoGCqe7QocC/bgnGUIqvyNdO6E
J8dqBLMDT7AMqgYltL9iVQr6OXCxFNCMNGzrnmwewGpegk1BZYkZNXXCpz6YF4oR
TZWxQR5PjCVCOXXaO/mYVB8ET+skw+mFCj2/RNn6xnnKVzZfbcUE80GuJacVQSbp
rwduaMdgmGzIUz+HtIOzn2PV4SJUZGUgkyQ4SKG5Rn96pX//zwLxggVGF4fyVFbi
ZMV5IyiTF5nIdgckLLIypV+ZIfJ68UcW4Cv7q1Q+3XmJX9s0/fVm6qqHjcXKJ+az
VhRXPVP05yG9zifRh21e7iyVEjPKabFXViUenLhYSa2RKzr3xWkwlZLSNqVncXMZ
0htqs1hfwbtI5bYlxsjs
=C7hp
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--
