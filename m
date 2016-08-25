From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 5/6] i2c: tegra: Add runtime power-management support
Date: Thu, 25 Aug 2016 21:26:31 +0200
Message-ID: <20160825192631.GA1614@katana>
References: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
 <1470910620-9898-6-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1470910620-9898-6-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> @@ -407,32 +410,39 @@ static inline int tegra_i2c_clock_enable(struct tegra_i2c_dev *i2c_dev)
>  			return ret;
>  		}
>  	}
> +
>  	ret = clk_enable(i2c_dev->div_clk);
>  	if (ret < 0) {
>  		dev_err(i2c_dev->dev,
>  			"Enabling div clk failed, err %d\n", ret);
>  		clk_disable(i2c_dev->fast_clk);
> +		return ret;
>  	}
> -	return ret;
> +
> +	return 0;

You could have left the original 'return' instead of the 2 new ones, but
you decide.

> -	if (tegra_i2c_flush_fifos(i2c_dev))
> -		err = -ETIMEDOUT;
> +	err = tegra_i2c_flush_fifos(i2c_dev);

'err' is assigned but where is it checked?

I'll apply patches 1-4 meanwhile.


--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXv0ZnAAoJEBQN5MwUoCm2xpgQAKKeLxboWQXkRbBfKQ5LGrnB
Xki6vDfQTqe+POe34YmxPfj5wZ+e8kyqrfPvBK6Bq35feyc6jHt6NjF4QUVkIqBm
NPEJTI32/Y8xg/P6Ft6/FWNQtZ/wD2v2EFTUxTE+t8ody8CzHFuQETFfkXLXpb3D
eIzdyhRV8mxXBEUCl+sBqvb9aZcz5N9pmKCTmBWP4IFZqcV0ElJ2BE0vZg8KATIU
cSex8/9sU+nor7Ela+OSHfHrX/OCP8UlhXM6VQFVr+qFBke8HHiR6ylNp9y3b1Ga
bC6Cufz1SA3NRdacWuuaRY0b1aDGH4ILgXPhrMHuE1aTRmHAKHZlqjTaV+YMTLH8
7Dq4FrtTQluN4iLRfl5e0/dgxxv5oVu0sam0jphC5CDxwggLgxrTxCIsBlGcipJw
LMkSUhRGdrBMs/nwJfPnuAa0Y5BjkeGcTAHwaA68XT0JuQ1r4c6ek1rRdnB+r7AX
prXdv/A95XArUsZq/G2tIfMsHu0zsAkNv/7i+m4c2QysrZqT2sXJmxkvLAlc8m/K
L6JvVg/MoQmi4c7v3I7KZxjTFQlArq2FWzFFBhEWN6jc/0BG/94cU+Bn8WgrTyoQ
pROk9VPFchxmOh/aV7BV+006C/YTK2TYPOPSERSiVUP5kCPwC6r6+mdosz9IuR09
c1mGDHEtvqGMajH3J6W3
=fkit
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
