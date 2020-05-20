From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: fix runtime pm imbalance on error
Date: Wed, 20 May 2020 11:59:08 +0200
Message-ID: <20200520095908.GD2136208@ulmo>
References: <20200520085231.32552-1-dinghao.liu@zju.edu.cn>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RYJh/3oyKhIjGcML"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200520085231.32552-1-dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Cc: kjlu-OJFnDUYgAso@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Murray <amurray-tUaQ5FxYRYX4aQPF92CzsNBc4/FLrbF6@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--RYJh/3oyKhIjGcML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 04:52:23PM +0800, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> it returns an error code. Thus a pairing decrement is needed on

s/even it/even when it/

Might also be a good idea to use a different subject prefix because I
was almost not going to look at the other patch, taking this to be a
replacement for it.

Although, looking at the log we have used this same prefix for both
drivers in the past...

> the error handling path to keep the counter balanced.
>=20
> Signed-off-by: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
> ---
>  drivers/pci/controller/dwc/pcie-tegra194.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/con=
troller/dwc/pcie-tegra194.c
> index ae30a2fd3716..a69f9e49dcb5 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1651,8 +1651,8 @@ static int tegra_pcie_config_rp(struct tegra_pcie_d=
w *pcie)
>  fail_host_init:
>  	tegra_pcie_deinit_controller(pcie);
>  fail_pinctrl:
> -	pm_runtime_put_sync(dev);
>  fail_pm_get_sync:

Either of those two labels is now no longer needed. Of course it'll now
be odd to jump to fail_pm_get_sync on pinctrl_pm_select_default_state()
failure, but that's one of the reasons why label should have names
describing what they do rather than describe the failure location. I
guess we can live with that for now. I'll make a note to send a cleanup
patch for that later on.

With the fixup in the commit message and either of the labels removed:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--RYJh/3oyKhIjGcML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7E/2gACgkQ3SOs138+
s6H1dRAAjP9fv8WTiqlN64A0U8jgW7w0okcZGXwf1+Lrb+g7s94GdR8KJD4vLHpL
lOVPr0BwTg4u6ED50ZaMrr0AJkkwlJCMniWIF9RK4Qdetuw2clnu/+Rx98ptS053
TcOa0LpwWQ8qPwBO/HQ9tRA+4EmrCG8qOLXHWIa1HkyAp8Gq4ju5x2x4E10MTNWc
YtjLDKnXLICCLLcPmhhG+gnVln6YF5l5qTPVcMOfPm7H31OMm8cTeGFgg8j3TdR9
P9ZyHooksciS4sktzruBzSoyYlun1OyCQoUK5yHTa+FhiXcvcG5C0ABSQkDlj87B
7ormUGu9p9BTXLZbch+iE3rCh4HCeNtppUY3RCrWSbAsXmnFeDEqItCTFthlcQyq
5PUwVLH3AixFgAigFSZ01i0TrBCox5ypo6lcUMpgFhmzPrQ8iHGlAU+ZUx3kVyNZ
mKSk2jh5wrJlgLQnDDs776nv2zwCXS2MV1xLunkUIw+dZe4twPQGbyqLnLov0nax
uHSUtL5wS4H/2tHim7EwhZwaz9JHIliKPz+yFx9Usk08uOL1q61JbWiMhKl+yXlL
X+3cYIM5AsO6wN0LaKj90msAlW0HqkfuVpCfULTzyxGjSNhwqiNNl4bM/FQG7Byq
L1vf1atVlNld4rFXE8yMCnAOHzFn5M9hjq45DnyYERIFSRa+/oQ=
=zMyM
-----END PGP SIGNATURE-----

--RYJh/3oyKhIjGcML--
