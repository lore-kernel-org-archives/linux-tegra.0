From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: TX1 mainline GPU/wifi support
Date: Wed, 3 Aug 2016 18:05:26 +0200
Message-ID: <20160803160526.GA22119@ulmo.ba.sec>
References: <5654a683-b801-86d5-6699-d41b444c3688@embed.me.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5654a683-b801-86d5-6699-d41b444c3688-psbXN780rFT10XsdtD+oqA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jack Mitchell <ml-psbXN780rFT10XsdtD+oqA@public.gmane.org>
Cc: Alex Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Closing the loop with what was discussed on IRC...

On Tue, Aug 02, 2016 at 01:32:31PM +0100, Jack Mitchell wrote:
> Hi,
>=20
> I am currently investigating the opportunity to move our TX1 boards over =
to
> mainline linux as we require some recent kernel features. I have
> successfully booted linux-next and have USB/ethernet working along with
> Docker and a recent systemd. I see that GPU support is somewhat implement=
ed
> but I'm not sure how to integrate the current nvidia userspace with the
> driver. We use CUDA on our boards, and as such I assume we need the nvidia
> kernel blob to be driving the GPU, right?

That's correct. The Nouveau userspace (and kernel driver for that
matter) don't support CUDA at this point in time. I think some work had
been done on that as part of the A44 project, but I don't know exactly
what the status is.

Alex, do you happen to know?

In order to run the proprietary userspace you'd need a copy of the nvgpu
driver (and possibly other dependencies) from downstream. Porting that
to an upstream kernel is, as far as I understand, non-trivial. So the
bottom line is that you're between a rock and a hard place.

Perhaps one alternative is to connect a discrete GPU via PCIe and use
the proprietary driver for 32-bit ARM. I think people have had some
success using that. That's of course not a very nice solution since it
doesn't make use of the Tegra GPU and requires a lot of extra power.

> As a second question, is there any roadmap for the wifi support on the TX1
> devkit?

I have not looked at wifi at all. I think it's connected via SDIO, so it
might be possible to get it to work with very little effort.

Thierry

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXohZDAAoJEN0jrNd/PrOhf/QP/2W6Jnx6mNpGiqXlLKtOUP2V
IP3swCXs0RMPuEeQH95bFioanIphMfxlOgRF3DT6lKPMOqXKdCV4846FaVdsTfm+
sOS1hJcJk5cxB+PnyKFDdT+6zoRFL3MgzCOiHOR2ZBybvv07cLvlSHDKALwno/2E
dZxz33Zng625rbl9jmpnG8L6YxoXbOMgAyqEZHTHlRQK/U6pOXLipRMpWDgWcXcu
jOZjA3uDXZ+TR41pPWezFjNp1kS3RrZ+Wm5JSE8h8H11NxFZ9cbKFzI2nlK5wgfg
YHj2RXTu5P7Q6ABdxPvmmqd/kqVLMMjac4MUK9aN6qLlqkkHJknYi5Sf29lGPgYu
mEsk97STsmJISikrIH4SUfuCih5D6VE+hgIbXsLsLmNd3WFDGJAWunfTCo1N+OwG
Ugs5h1RMW0t6NflrHTcVz5JEIUYBVh4z/nt1UmhX7sRxf9DaPryS+NogwD3CtvKB
Q/yBTFCJqdMa47cY6sWsmH/5cqYfM9sjlwO9T32gJDzdI1zgMlizFk5iXcOm0pUA
Y+O08sVmlra+m71VMaOnY1XK697h35IPLZ7se3nGcirYU5Pb8j++KzaVGSPB1njH
xZ2WUh4250DClR5Vwe4FtqqG0A8nBIzhTEYMUtGwJ50p7KYAckL7N0bCgLn8sLbq
T5MrDhhaUbIcPFQBIzjW
=uYFk
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
