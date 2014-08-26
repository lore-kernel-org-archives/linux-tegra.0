From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/9] mailbox: Add NVIDIA Tegra XUSB mailbox driver
Date: Tue, 26 Aug 2014 08:57:31 +0200
Message-ID: <20140826065729.GC15573@ulmo>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org>
 <1408381705-3623-3-git-send-email-abrestic@chromium.org>
 <53FB8820.4010202@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53FB8820.4010202-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2014 at 01:01:52PM -0600, Stephen Warren wrote:
> On 08/18/2014 11:08 AM, Andrew Bresticker wrote:
[...]
> >+static int tegra_xusb_mbox_probe(struct platform_device *pdev)
>=20
> >+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >+	if (!res)
> >+		return -ENODEV;
>=20
> Should devm_request_mem_region() be called here to claim the region?
>=20
> >+	mbox->regs =3D devm_ioremap_nocache(&pdev->dev, res->start,
> >+					  resource_size(res));
> >+	if (!mbox->regs)
> >+		return -ENOMEM;
>=20
> Is _nocache required? I don't see other drivers using it. I assume there's
> nothing special about the mbox registers.

Most drivers should be using devm_ioremap_resource() which will use the
_nocache variant of devm_ioremap() when appropriate. Usually the region
will not be marked cacheable (IORESOURCE_CACHEABLE) and therefore be
remapped uncached.

Thierry

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT/C/ZAAoJEN0jrNd/PrOh+FEP/iBrDm8It9BvNIgaJPQyAur+
ITotMb7ok+lntJDe1U5k+zDjUL6oz+V9/VSXXoJ1aVK0yMSlaQh8J1kVyY/ng692
9v7xlHlvd4wTdvh5yMcR1rXq6t5RYOR9olRTt9Ueu8DLjge3YP+UfDZ88pG611o8
peGAZ9UmlsiepbAOaqyaeqGWynd7SbNMKDSTtppnviZNJlxfKh3I+JMetYYbYut8
uBNBRnaOlWqWNoYFoL2DPVk2SRQnndY4v+KuYyh/isFei4yGMtUsHzTk8sHuzqqh
OyhLjWDk8caodmKEIIABlZiMXQFGkxhwbd+jADOFwO+d9D/oEQFRMw0kZydpy0Ob
YAZFQSn8/LZHDhwFMv8+u/JClFddUS0nmit1M0/fB2tm8rAc6G810wD816SPPtsg
IPUZt9DA6YE3rOIuC4oGvl2IzQjDn+cPlWmEJp89r4BzMjlZU9vje7TJ+gCBjlqV
+/tuC/xnrWBpSfZ6rIwVkW0K9xJM/wtjTbZxEfPLvtdmVFjl9rhUEcYDc3P8rIY0
kAz5M8nGS5L72Vc+C5sq+6u2zmtTpA2KvHoPGCdczMqFxfoovHVYOrdFM8Jbncxy
1PG6+vo8Ihm4LE8d0Wa+xnJ6OkCpsVQ+5VrJ9rUFlKd1yo8VWtAvpl5oAtIfSwV5
162sIf1/+ckqFd+bKVSJ
=4K+c
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
