From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V6 05/12] mailbox: Add NVIDIA Tegra XUSB mailbox driver
Date: Tue, 2 Dec 2014 10:47:42 +0100
Message-ID: <20141202094741.GC6135@ulmo>
References: <1416874644-12070-1-git-send-email-abrestic@chromium.org>
 <1416874644-12070-6-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416874644-12070-6-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--8NvZYKFJsRX2Djef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2014 at 04:17:17PM -0800, Andrew Bresticker wrote:
> The Tegra xHCI controller's firmware communicates requests to the host
> processor through a mailbox interface.  While there is only a single
> physical channel, messages sent by the controller can be divided
> into two groups: those intended for the PHY driver and those intended
> for the host-controller driver.  The requesting driver is assigned
> one of two virtual channels when the single physical channel is
> requested.  All incoming messages are sent to both virtual channels.
>=20
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Thierry,
>=20
> I've left this as a separate driver because I don't think it should be
> combined with the xHCI host.  Stephen and I discussed this earlier in
> review of v1 of this series and he agreed that the mailbox belongs in
> its own DT node and driver.

My objection wasn't strictly against merging the drivers. What I don't
want to see is two devices sharing the same memory-mapped regions in DT.

That's based on earlier discussion with Stephen as well, because we have
had the same problem with USB and USB-PHY before. Unless I completely
misinterpreted we came to the conclusion that we should avoid this in
the future.

Like I said, this doesn't mean that both need to be in the same driver.
We could use MFD for example, or provide an entry point in the mailbox
driver that can be called from the XUSB driver to instantiate the
mailbox (which is really the same as MFD).

Thierry

--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUfYq9AAoJEN0jrNd/PrOhAjsP/jQ382JNqadfDFsBPsWxQiqa
pkYO8rripE9yDaU1NtK0601yfpQzganxugkl9OICZ6cU90MTI2hw3RWteaHvvD37
DPhJ1R/13yvDO8OmdjcnAYhiUdNLxuSocEOTtgNuUetmMx83LCEGeOXmXSI+Zt92
jDHHOWEfN+LJ8lY9U8qQ2r/ZzEY1QHnq1C0ACO4SbFku/ABWjtPVcOt67X0GhIit
h1+bLLUC5mPQrdutyKWUy0+32ohIvfMCBkJ5yitxQJ42CSDd2n3DKDMY9xwtBjlx
dxM5UQdajtoBuSd+FlWk0GyoH8EVJePaOBzGwLqTB6gv7DDT41bA+518wy5HMo4W
hXG8zuFeV+Z83iD6tGXQL8Kx46oeRn9RvzVDfGcKQagkspyAHwEcvGfTIh/be9aG
10ssMn8DgeK6nF4DufhMUj0UowNB60MGs1y8qyKgOSEA97p1VfHR9Cktv408sEml
XSrSegN5Tt3ogHKLzfHIgyXTG6PJ3hOy5seMvmkztzzl2eOuMTWornjuQe33eq4U
Rcrgjz03HW/yXF5BEEI0Nb/O/hV1t8RlsdFNmo+KdOaFeaJpjafQm280a9T2Zsr6
uze/bGhT1Y4peOHdl30Nu8dKHpdCths53J3IrvHpQpMPtBI+1bf5Ihqi4wcJNyzT
ByGCnw1O7FR8Pe2ZeIFV
=vDMG
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
