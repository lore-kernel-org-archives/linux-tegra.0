From: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: tegra: Always program PLL_E when enabled
Date: Mon, 22 Jun 2020 19:07:52 -0700
Message-ID: <159287807271.62212.1561231041280024616@swboyd.mtv.corp.google.com>
References: <20200603111923.3545261-1-thierry.reding@gmail.com> <20200603111923.3545261-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200603111923.3545261-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, LABBE Corentin <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2020-06-03 04:19:23)
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Commit bff1cef5f23a ("clk: tegra: Don't enable already enabled PLLs")
> added checks to avoid enabling PLLs that have already been enabled by
> the bootloader. However, the PLL_E configuration inherited from the
> bootloader isn't necessarily the one that is needed for the kernel.
>=20
> This can cause SATA to fail like this:
>=20
>     [    5.310270] phy phy-sata.6: phy poweron failed --> -110
>     [    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI cont=
roller: -110
>     [    5.323022] tegra-ahci: probe of 70027000.sata failed with error -=
110
>=20
> Fix this by always programming the PLL_E. This ensures that any mis-
> configuration by the bootloader will be overwritten by the kernel.
>=20
> Fixes: bff1cef5f23a ("clk: tegra: Don't enable already enabled PLLs")
> Reported-by: LABBE Corentin <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

Acked-by: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
