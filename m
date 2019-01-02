From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V2] i2c: tegra: Fix Maximum transfer size
Date: Wed, 2 Jan 2019 23:45:13 +0100
Message-ID: <20190102224512.GA2750@kunai>
References: <1546468519-2128-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546468519-2128-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 02, 2019 at 02:35:19PM -0800, Sowjanya Komatineni wrote:
> Tegra194 supports maximum 64K Bytes transfer per packet.

Linux I2C doesn't support more than 64K of transfers as well...

> +	.max_read_len = 65535,
> +	.max_write_len = 65535,

... so you can simply drop these lines.


--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwtPvQACgkQFA3kzBSg
KbYyhg//Tk0HSGMGXUeNh1I6iOG6YdKa6Nc2860yRcRCTv3zWSyjLh5M5XdHZYfn
wcyC0g0sa8NqNicyYi0/U/mGc6hnPdclAdXQOtDWpSp5bLzSjFCy1h1W4GvP5nz8
1opiKPIn2j6NWftnVGfM1+DJD0HWhk1zLPm7FwOizQ7Des4Y6s8fzPG7MnnhCKYx
moMevM6TgryERm5qAtdePLVX0N12JPBdHrIgRbFPmlVIZB7Y8K5R6sBlTPIHx30e
GOwmBwvh7x25qoejOZNVeuzafLiRiR4e1kOqdXSVA1L+91FAakdWb5YEINgCPEAt
Q1e38EmSVNHp7KiIiTUsTU3pxEBdY4bc7qp9+UryHAaoWnapC9HvVJ7dJD+5G3F+
3gXJcv7odrsEO92C1FyN0JDevFvxNdTQR4gPzbCdlKA6inYjY5VhyLXGdgACkaXr
9kO4u4A7ikPmheO7Dr5Qe5bDLmng5Qfd5dkUfA0hZRcfVEZpvKdr5ujd30Mp9CKI
3Rd0jgO5sdgSUzxmHey0VGQUpqZoB0h3d6lDdBPPK9+okaRXiZ1W2icFr/w/TZ5D
RVbgwl4XP47uC+kkAGI3Jhi7ZtmtkrNWlpHKI5bAX4EA9cMlEZkvUkBf9eqSN1FQ
zpY9Bgxz6cXTabWUyUWVrvggkIEfMB7wYBSBie9yV3QbGBhnWYQ=
=axrp
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
