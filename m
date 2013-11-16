From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 16/31] ASoC: tegra: use reset framework
Date: Sat, 16 Nov 2013 09:55:29 +0000
Message-ID: <20131116095529.GF15393@sirena.org.uk>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-17-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8620690327442544356=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1384548866-13141-17-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, pdeschrijver@nvidia.com, Liam Girdwood <lgirdwood@gmail.com>, linux-tegra@vger.kernel.org, treding@nvidia.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============8620690327442544356==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NQTVMVnDVuULnIzU"
Content-Disposition: inline


--NQTVMVnDVuULnIzU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 15, 2013 at 01:54:11PM -0700, Stephen Warren wrote:

> @@ -1,6 +1,8 @@
>  config SND_SOC_TEGRA
>  	tristate "SoC Audio for the Tegra System-on-Chip"
>  	depends on (ARCH_TEGRA && TEGRA20_APB_DMA) || COMPILE_TEST
> +	depends on COMMON_CLK
> +	depends on RESET_CONTROLLER

Do you depend on COMMON_CLK here?  I only noticed reset controller API
dependencies here but perhaps I missed this (or it's fixing a dependency
that should be there already).

--NQTVMVnDVuULnIzU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSh0ENAAoJELSic+t+oim9vZAP/iLttbQfwz9/38ncTDvWtDgN
NJ+ceB92Hs/v9bIh36pbrK7Vja78Gzl6jmqSkxRimu3lwcF1UPgIu3DwX4yIH/wE
A7sUNl9BH1fzLLh2IffBXu1e7KbtHC++o7N5L3mqbwO406x/kbMNsUnkuKHjkltA
IwGP9dsS4InzyfAmVcGYrKCqZH2k9QMKvsbLNOnXSiuGGVusMglX5jdEe/UyZEVl
4vbtNnOVqDIDuzd/UcGUfn4JOKS3lh+45/yrGVqfexGGu7qeScY2/1L0QBE2YCp5
HkuvaZIdf7Z6DnDrgBuPqWk1L4D0jBfNsgerTolHfWrUeuadpfKuGrn7+ARxR5Kx
F69t+odFPRvAIGGCFD9e4thNFB83SbVVZLnCQEdvfGv47tf4VQ3bN6UyAhVJV02I
3AjUikT9x9al0ltBSaprLvfwyqDKKTOEOc3joovHjv1XLzjBVZLSuG6wc/3o0Zce
8/aD9uPpwaGaD693xHIVtIOj1y+7E6A9UiX6rvSawqXxshgQI/Bd4T0Wi9l+H2Jq
veHyGAUj0Eti5MUy5YRdOxTJgPyzLVPUklvJgf6HFAx4wfL6xod8zsgwGfeVBa8A
2NyiiA6dB9GAcMHBPpQlhUTmifRJ0VtA9h4l1a67sRteIHdK+Yfh+kZzfidoZxV9
Byq4ZXXMonmpTdUcxX5O
=4NM6
-----END PGP SIGNATURE-----

--NQTVMVnDVuULnIzU--


--===============8620690327442544356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8620690327442544356==--
