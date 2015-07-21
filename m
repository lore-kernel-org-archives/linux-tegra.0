From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [RFC 9/9] dts: tegra: WIP: hack dts to test new dt flags for i2c
Date: Tue, 21 Jul 2015 08:55:58 +0200
Message-ID: <20150721065558.GA1537@katana>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
 <1437142109-31975-10-git-send-email-wsa@the-dreams.de>
 <3764937.mMMXIHUnrR@avalon>
 <20150720084557.GA2551@katana>
 <CAL_JsqKAoydzJ5KOKJTByB9kOQ8KrSX99hVYNkm6FnOZ33xN1w@mail.gmail.com>
 <55AD71A6.4030105@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55AD71A6.4030105-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, SH-Linux <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >>@Rob: If we introduce flag bits in the MSBs of an I2C address, the reg
> >>property is different from the node name. Is this a problem?
> >
> >No, I don't it is a problem.
>=20
> The rule so far has been that the unit address (the value in the node nam=
e)
> must match the first value in the reg property. I don't see why this rule
> should change. To solve this, just name the node eeprom@c0000042 (or
> eeprom@40000042 with the correction pointed out earlier in the thread).

We can do that; that would mean that people need to find out the values
of the #define which will be used in the reg property. It works, but
will be cumbersome IMO.


--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVrez+AAoJEBQN5MwUoCm2cwgP/ArZJ/EeV+ORgN4Okp5WfNxS
rfAfu0Z/m3eODgQ0Y3Xmhr/X9hte0AB9dSwbLMoTqPDMtk4qreDOnd3BA2RAlGrg
mHINw0YpE3hfE9WxP3YpqzqlKOCyo8M16YS9Ams+hXFWpl1jP5pzqx3xH/Zw14kb
57aLp2qxTXcN/FomCdkyBnO6xezXcxEF6GNco+dEcyE7Eln5Ewca7hlwgx0aquxw
nh9okoZBuMrZzrVmRcFKabQQ1eqF2Lol0MF2zFA3ITG+kimuwCFRGqnOufjoASiI
qWdaH3c+uaZynovJseCKiQByNOtDxWGbBOcnAFi7NPg4iUI8XRg3XHw6GCYo4Tf9
+nC6yd5ZDXDo7UYDmBUBzh8+7f4fDBnoPL5ckrUWfayDcX/n8Jjcm/MewBdm7AAE
1AFKi63bS/OJQCjKech/D0J8UYiA5n7cdbMGn+Vq9zNKjhzXFxJalNCQ6JNSWtjl
eu3SlzzmzMBx6OSDOKBfDUtpx+J7BtepqUrqg8ciDTruy3+mqTXEH+hqrUXVMr8U
31gNqp3gQIx6o6ocdfDg+rK/JkizhN9idWNZtxQ1vG1LmY/CW9BL4t80DuoNJYl5
Ul5TXml+KHPAKbIVYI5zSppQj0IgQLUOzWFU5EnknM4y9jSw/vbUmm+xPdFqeyNy
rEou4dh6d0GQVpfrQ+Dq
=yy3U
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
