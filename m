From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v1] i2c: tegra: Make timeout error more informative
Date: Tue, 10 Mar 2020 19:15:38 +0100
Message-ID: <20200310181537.GA15874@ninjato>
References: <20200302173512.2743-1-digetx@gmail.com>
 <20200310113706.GW1987@ninjato>
 <017aad72-9872-a4aa-dc99-bd7d08c0db14@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <017aad72-9872-a4aa-dc99-bd7d08c0db14-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Oh, well. I'll keep this debugging applied locally then, it's quite
> unfortunate when something fails silently :)

I understand. Still, it depends on the I2C client driver to flag it. For
some devices, this is an error. For some, just one possible state.


--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5n2UAACgkQFA3kzBSg
KbZJsA/9ErRQgh321oAvGAVlwLVHFTP4xePY7f0V2hGdPmmSFzgPjn9+Bl96RnUA
KsLYDCl4GUwQ8rsbv6O1ZNITNsWI0E5pJrye/wzjf9UXZ/UjMCMDpfkS8eBSwfKR
+XJb4OsOYz7pR0gWAUaUdEt8CLwzn/vtDH/RFJiCBXY5y7EsjkwLn/UgPrD1GI/0
+4/Q8/uKNqneFCE+L1/HsE77Q/wGwC8ufNLzkv5ngd9nw+FQi+8a6lKibxq4T03S
aKiLCx87kgh0JUronYfjAAiINs6n+9OSrIiIv9JgXSGIvFwIYqQrUrM5IxsD79AL
7qhC5VZ4kVJyBn0C6w3SabnDrmlIuHWJOsGWAU3KU/C44jSG5+uEkPspRXmecrf1
leZ95mWhZlifARo/4rK+EkT8+ReQ4z/bAzcx2o56DJHNvsGs3s/YTQDyZ+pzvNI8
UFkkle6S18B/Um7cuirg3yax7bPpXPQi7Oao1qgDDceNZW9cy5IiI3QwIV7/QB0u
Lyfs020A5cFDgYLSFYIzZ0I9qyeSAtDBWDDzd1PQWYBFNA3TryJu8RFMVS+hbCUH
UlCZd3QijSbTPzDRckoH6d17/hJdGZN84JFW4aY+UPkaxovt/POT5t7mflA2rcjf
1Gfi0u5lgcE7kQnY5Cb9PdaeI4Blv2pM1WtA6kAzC/qBlDHue9E=
=5lp1
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
