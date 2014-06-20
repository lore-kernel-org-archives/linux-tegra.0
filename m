From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: TN7: relax some regulators
Date: Fri, 20 Jun 2014 10:41:19 +0100
Message-ID: <20140620094119.GT5099@sirena.org.uk>
References: <1403164154-1362-1-git-send-email-acourbot@nvidia.com>
 <53A308C8.2070004@wwwdotorg.org>
 <20140619175643.GR5099@sirena.org.uk>
 <53A3C613.8030207@nvidia.com>
 <53A3D85E.7030704@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X+WXP0omYNJFGow2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53A3D85E.7030704-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--X+WXP0omYNJFGow2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 20, 2014 at 03:44:46PM +0900, Alexandre Courbot wrote:

> dbabd624d
> regulator: palmas: Reemove open coded functions with helper functions

> Keerthy, Nishanth, could it be that there is still something wrong with the
> REGULATOR_LINEAR_RANGE() definitions?

> This seems to be the cause for our trouble, but the other questions might
> still stand, in case there is interest in discussing them.

There was a bug fix to the Palmas driver which just went to Linus the
other day, are you sure this isn't fixed in mainline (or -next, it's
been in -next for a week or something)?

--X+WXP0omYNJFGow2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTpAG8AAoJELSic+t+oim9qI8P/A6FbVvulfg+tXMAxEoPfqBB
/BY3oOOjxQFRWGW5StUc8ZR31itnbsYmenzaJ5HTYrOpTUahPJ8wGXtjja+BAsyF
FHXQ7k/xcd3iAGq7JBQMTsnjUkiyo7h9CQeE5hJTvx2vpNccXsSFOkc9JhB3+vmR
ncD+aVgOR3l+c83pnhjnSPTH3xGkJjia/U/YOIlORFYmfWkqUjpzmja0JNzkwbD2
H8b9UdZidl8/2upnyxI0pDJjftLhK47u3nR0jY0YVMhhFZtAynUEZbeDR9L3NHf5
NrklCkJ4q+uQkk9wF0dWVVLuC/UbuM59keMzjUTffoKCDRw/ePmS5V0L6KKi24AV
fJauDN0k3OERbhCyk6N0+Lz2+CVPOgL9YRudQr+EFvPPs061zyRuLtIjdb48jfI+
+vObsTtpcAi1EqBSYtTKzsIRwsqEKv83IRIyCR6VuRM2OHmb9W9EioEpRs/fQ+3c
i2YcBWapnjKT12i6bh6sBEY7UfePQQHtnP8MuJc5Nd4741R8vfKZOk/WlGoBhOC7
9m8HTZ3ZKgcpKG8/p41JZndjQx7e5ftHiCEJOrWWwBLK/rIE64tiEJBS6cPavwfZ
RNco9SscDH+0rxdkp9RypKrxmLH6M6WiXUMTPaZ3XJ+TKfonE+bXsH/AT/WYZLip
RXWRJ4nG3hN5kPW8dwnK
=i2F6
-----END PGP SIGNATURE-----

--X+WXP0omYNJFGow2--
