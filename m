From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V7  3/4] PCI: tegra: Broadcast PME_Turn_Off message
 before link goes to L2
Date: Tue, 13 Feb 2018 12:30:47 +0100
Message-ID: <20180213113047.GC6764@ulmo>
References: <1517289851-14111-1-git-send-email-mmaddireddy@nvidia.com>
 <1517289851-14111-4-git-send-email-mmaddireddy@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1517289851-14111-4-git-send-email-mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, cyndis-/1wQRMveznE@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2018 at 10:54:10AM +0530, Manikanta Maddireddy wrote:
> Per PCIe r3.0, sec 5.3.3.2.1, PCIe root port shoould broadcast PME_Turn_O=
ff
> message before PCIe link goes to L2. PME_Turn_Off broadcast mechanism is
> implemented in AFI module. Each Tegra PCIe root port has its own
> PME_Turn_Off and PME_TO_Ack bitmap in AFI_PME register, program this
> register to broadcast PME_Turn_Off message.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2:
> * no change in this patch
> V3:
> * add PME bitmap in soc data instead of using compatible string
> * replace while loop with readl_poll_timeout() for polling
> * commit log correction
> V4:
> * no change in this patch
> V5:
> * Rebased on linux-next
> V6:
> * no change in this patch
> V7:
> * Per port soc data is added for pme bits
> * list_for_each_entry_safe is changed to list_for_each_entry for pme turn=
off
>=20
>  drivers/pci/host/pci-tegra.c | 64 ++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 64 insertions(+)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqCzGcACgkQ3SOs138+
s6GR0BAAqrbsjhUZXa1Q8FbKBcdlWoWcAu4rcLeZb4d9Q8LlpSduUUCx5t72mco7
UneZ86UueBF9Cb5+gJo2JTbU2rYsayl08zu4HdsJJsz2pledfIiu9fhiRU3GAf5N
SpQn70BQXreCRD+/kmNn9PkwAp5R7ynIz2F4B68crgGz794Pc1G79f24OT74fPKm
iBHIncEZR14M0YnH8Qxpr6k42mK/sQtuuMsHONnlNpA46j+f2CbLT+xJLz6JrhBI
wFSNeHiBOU/2RMzJA4XgfAFlECHoLUY6LR6k5M9cs13Qx0khLr7kUlXAUeSoePJy
52r6Wx/GDRJQKLNh9WOY8bKSw3QjeI4uVnooP5l2rpx/5P+fvuismslW6YWsmOM+
vS6UBwDwt+39LFWh7oCP4QdduITOnNn7+cujdcCCh4CrWTdnoSN7HhK6KblTE/TZ
22n/wzVhloZ45Sxp67IoDNKa/0yU3cQ7FxzU4A27rRMmmv1xjVUc40rCzr10hqKd
YY3M4OoI6OksHM/qqn2arr5GzFj+iC6wkq3vWsBRizgF2+xeBWpFNocP4FuBIFMs
ySdc/mKObA8U7NRQcWoUqTYdRJPh9Pw00BKD73XLnN26yctL4Gz3edhVRy6tmkFw
2ZrIkTTOpPZukUeI5K9Yccy4m7mISRG4+tVXVtQEbeVEO1lqJMc=
=BdBU
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--
