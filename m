From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] host1x: mipi: Add new parent clock for mipi
 calibration
Date: Thu, 7 Aug 2014 10:11:29 +0200
Message-ID: <20140807081127.GD18359@ulmo>
References: <1407391907-19488-1-git-send-email-seanpaul@chromium.org>
 <1407391907-19488-2-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1407391907-19488-2-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 07, 2014 at 02:11:44AM -0400, Sean Paul wrote:
> This patch adds a new parent clock to enable/disable the 72MHz
> clock required for mipi calibration.

s/mipi/MIPI/ please. Also this doesn't explain why this change is
necessary. Doesn't MIPI D-PHY calibration work without this patch? It
sure does for me.

Furthermore you say 72 MHz clock, but the below uses PLL_P_OUT3 as the
parent in the example, yet PLL_P_OUT3 runs at 102 MHz on all of my
systems. What 72 MHz clock are you referring to?

Also can this parent clock ever be anything other than PLL_P_OUT3? If
not it would probably be better to set that statically in the clock
initialization tables.

> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> index 9882ea1..4dd91fd 100644
> --- a/drivers/gpu/host1x/mipi.c
> +++ b/drivers/gpu/host1x/mipi.c
> @@ -80,7 +80,8 @@ static const struct module {
>  struct tegra_mipi {
>  	void __iomem *regs;
>  	struct mutex lock;
> -	struct clk *clk;
> +	struct clk *clk_parent;
> +	struct clk *clk_mipi_cal;

I don't think the clk -> clk_mipi_cal rename is warranted here.

Thierry

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT4zSvAAoJEN0jrNd/PrOhy/QP/0cRq91rCN1TMoici63U8kda
kYhGt7nUjAnTw/kmupYpu+FqdjW/syoQtZJnNFpk79jZO3PEpcyTqPfECGqHXGW3
NC0Kx5FEQ6hpAauxh0/ft2MGERRTuEvhE1KD+Zh5rlLxTTxPX1Y16tXUThhRJyEx
15SezNTVk+T+sKLkuFcLOFswWShEn2j/AmPcg3n80dcj/JK/re91W+HdEKljLG5X
lc5IwlG/UMAxlp4NgNzJHvdIMsthIE58wKXI1EnHB8thFKrDlB0JNAJZiCeBSaOQ
mGGe//afrfqDHDpYFoAFT+j1CrDqXIcgoAIGuI1v0OxWl34cUX0P8hBhtca1TdI0
GFNajPfm6MEi0+T0/LRUyvDgZw5GchLqjUl6rKwwbp/xfDn4ahRqaki3tH4I7oR6
zPPEiNahyS5aKvogUi0sO2UzELEK6jW0zyAJF0UhlAtxmBZX2HaBlY/ns666+RDJ
IQ2tPN9nTeik7cRwYco6YfExfEfjXt9aR9no03MlbQp1Ecpks93PQlBNPIAP7lSl
GhlraIHkzF8p9bZWB1HH7NLFKyzRACdOBqYsLZ+RbN0guirPLBb/CXk/gvr3bey2
MNpY2n/t5rOvgt9I/+jyN6HQeZ2C/4nvqV+HrgbQvSGgO+X4UyxPKufSNBmolgQK
ST3oTUjwdtEVu72VqsO4
=MBLl
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
