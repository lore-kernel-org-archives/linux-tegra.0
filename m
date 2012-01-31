From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 3/5] ASoC: Tegra+ALC5632 machine: Add device tree binding
 documentation
Date: Tue, 31 Jan 2012 11:27:06 +0000
Message-ID: <20120131112706.GE18444@opensource.wolfsonmicro.com>
References: <1327995040-27152-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SNIs70sCzqvszXB4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1327995040-27152-1-git-send-email-leon-2ukJVAZIZ/Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Cc: lrg-l0cyMroinI0@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--SNIs70sCzqvszXB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 31, 2012 at 09:30:40AM +0200, Leon Romanovsky wrote:
> Document device tree binding for the tegra board with ALC5632 codec
> according to datasheet functional block description.

If resending please send the documentation in the same patch as you add
the binding (unless that patch is complex enough to need splitting).

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt
> @@ -0,0 +1,57 @@
> +NVIDIA Tegra audio complex

This should really be more detailed, mentioning the CODEC.

--SNIs70sCzqvszXB4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPJ8/5AAoJEBus8iNuMP3dtuoP/ii46USw52pBs4MIpPohPAci
GWkeWlln2k4FLtSLMPtf7DuzImLdKw29HX1mSe7HYQQXTP9AdC1s7qOCGNd1zHTS
8C6B/gikVGkg72Zck5b5EbHXrHLTDvcT2T6lnN3tNWIPneMx5VHiTkOtwMBTS6lr
sMeni5/JAg1BhEHzysL44LBsonGjC5ffFPBN+Amo+Kuyf+HYAWcxoNF/r/HEbvNd
ZZbCf+KylKHPyj0ntYJgmt/qDdQmv9v2KefqqQ8JGiFG3/ltcxYMcXc+EGu8eM0v
o1fvkE6ay5FnfyFlP1edHVSJF003sE1kZUaKHwPaMveSiuRj6TAJFmGb9W8F9rvf
WqNDs53nqyZyUwHHq+EC2Ru1XvFr/2zleejGyOJatvlZzyYQPcnWDFsGgAn2eqHa
HxqEJ6vAjpuFEQJQ92ZIcEMOiuE83LpS+N7D+zLeXtPozY264ODLDkItozqEMUYe
RX0M6FZCNbskpvniz4NRUovC8T1XY7oRoNayKF9jZ0D12llyIItp51PL9RyAbwaX
pjtgV0/cx3ZgB+Uxsn27BHokrBLUO94XQkW/sGy6hLjH+KbOofgV6tMWB+yX6RSu
7n95ETJ5EN4fw1OvYgG+mLFlGO5akpCCX+yGpJRJnxohsPxYfI23yinerHqyeqmf
1GcrXvKp7/R+/Ixu/fUc
=n1JL
-----END PGP SIGNATURE-----

--SNIs70sCzqvszXB4--
