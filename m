From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: How to encode being an I2C slave in DT?
Date: Tue, 19 May 2015 08:16:19 +0200
Message-ID: <20150519061619.GA4448@schokonusskuchen.bad>
References: <1427745615-5428-1-git-send-email-danindrey@mail.ru>
 <20150403194635.GC2016@katana>
 <1549160.njMIY2NVTi@fb07-iapwap2>
 <20150505105513.GA1841@katana>
 <554922EF.3050906@wwwdotorg.org>
 <20150506161712.GA4003@katana>
 <CAL_Jsq+iyeK-bV3ggcJv8Cw3EU71fkBo1wqYZnhCoh2-b_tO-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+iyeK-bV3ggcJv8Cw3EU71fkBo1wqYZnhCoh2-b_tO-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I give in to the flag idea. I also noticed that we'd need another flag
> > anyhow to mark 10 bit addresses. I am still thinking between using two
> > address-cells in that case (clean seperation between address and flags)
> > or to encode the flags as MSB in the current address (all busses will
> > have same address-cells and child description, less code paths and no
> > overhead in dtbs).
>=20
> Reading thru the thread, this seems good to me. I would go with adding
> flags in the MSB of the reg cell rather than adding a cell.

Thanks. I was leaning to the MSB idea, too, and am currently checking
how the code would look like. Feels much better to do knowing that it is
basically upstream compatible ;)


--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJVWtUzAAoJEBQN5MwUoCm2jfIP/1z8aPjx6iGrhaZmL40jEc/s
GolR8z8P7oNlfxDyqUz9NDQSRqlCy1SgJ4I7qCSOKWjhXkYU4c/m7fLaEnhJl6Ei
iD7RGa+MYO0G6E31d+Qv/bFBv0ZZM2xr/SZKM5XM/JMHo8MdhwdyRCQkjw8fs5zz
wf7VUskkRV4hWZM78+LrwwF0JTjEmYUg40IrC8IkOR2Hbi30gmPr1jW5oKZaRbrU
/wZzNboHC83ROtOp8kCBYSsI5qaJWlE7kPoxSh+ulMnDQMnkRj2kcFqCCkaS2to0
CCoPIzCuHduBXNkl2X8vyHXg+19bC24jlSdi54Mlg5HkzCyakkMdx08OtgckVL9B
bcV3Zw6TrEQZrdps+DHF4Hr8fLyd3zaH+MX8dpEOgyLz3liHiMq2tp0AfaLD3H/k
/Mmxky59z3iuWMjAZZDBB7fyOPDDELT4FHdEua0jWq/K7PDO49vD+f/34d/iTQX0
fP2apvxOpIKf2PaqSrBYQeRo4pwu2G8MQMVrD6bXjxgGv2lRxGiYUfZaBjfewHkm
B5NqtiDA3Kx9Z61JZF93BDPsdNVx2wsxSEsLGPuSc+F4s2n1ttsEy1yvIY1YKBf7
VwS4syUqtOjfy9a5CncESXD5+IhpriG1H2ZVgr0h4B0nZ6t+xebHq1EKwVzovIhK
UEA+sUPlgWOT+6uD+ZFH
=BsOm
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
