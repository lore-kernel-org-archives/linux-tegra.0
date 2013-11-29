From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] ASoC: tegra: use reset framework
Date: Fri, 29 Nov 2013 12:14:46 +0100
Message-ID: <20131129111444.GL22771@ulmo.nvidia.com>
References: <1385496767-8307-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9JSHP372f+2dzJ8X"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385496767-8307-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--9JSHP372f+2dzJ8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 26, 2013 at 01:12:47PM -0700, Stephen Warren wrote:
[...]
> +		rst = reset_control_get(&pdev->dev,
> +					configlink_mods[i].rst_name);
> +		if (IS_ERR(rst)) {
> +			dev_err(&pdev->dev, "Can't get reset %s\n",
> +				configlink_mods[i].rst_name);
> +			ret = PTR_ERR(rst);
>  			goto err;

In case where this fails, there's no way to re-assert the resets that
have already been deasserted. That's not an issue introduced by this
patch, though, and perhaps something we may not want to care about at
all, so:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--9JSHP372f+2dzJ8X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmHckAAoJEN0jrNd/PrOhRRoP/3byGf+00hl+hzyrEW11H9gY
aeVd5YvtJoQiEH2IZ5FTYhw6JikkdoGMAniCJBRdez+TMSUjRJd1YQzSnC/VcHtA
NSfJESr+yz9oEfUTD9HkFc5uSn5kyzBK+eQKjobe7Q1Zd48Ni+OBndCxLgKi83+O
J+/S25wOTXvKdPFjh0ED9FcNFY4I0CCjVXmS84r79MJJftRykQYF4j+x0zVEBngj
qDV/cL9KBzhx8kw/nyqu+tz4f8WBl0N17c464lsWPThYFuTf2SQtUSslB4Cwe6Kq
lRUtJhVzTHD2Mn2mlq6y+fgXlF0OlulDCcLTBR0Yg8iPYnAVXuFfRYt3cishtPG/
AUbhMNV39ml3jmoaAUEIZeNksZ0ZjDpXuzsHtB8wzweLLAkTN1zw034hpsDuwjkf
Z5R4CCnn3aeEGpO/k/L+Ybh/IwLPvoqFmQd5cF8yDXcj+1/AAOvRWi3Tjx4Qq3jG
WlxKruxO/lwpGhvCTXhYLPPyF/BQsWOY0ggKqmVQQNIQIBAIhV2QixaZgqUicUpw
v6pI9xWBw4v/bEv44q7YFQxwE3ITQvkTW1cJVnKl68lLLl91Kj7RnYjGMGRaMkDB
od2Et6Csj7TeJDF6upPsCAm1MWKVWbet+Fm60BzDgKnRrrBtUlFmpTfwBKpWeCgV
OiWdYNzfGbai00TlZOth
=tx3z
-----END PGP SIGNATURE-----

--9JSHP372f+2dzJ8X--
