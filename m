From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: harmony: Add ADT7641 temperature sensor
Date: Fri, 9 Nov 2012 19:44:36 +0100
Message-ID: <20121109184436.GC7663@avionic-0098.mockup.avionic-design.de>
References: <1352465815-26984-1-git-send-email-thierry.reding@avionic-design.de>
 <20121109132257.GA29183@avionic-0098.mockup.avionic-design.de>
 <509D3F0D.5040204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <509D3F0D.5040204-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 09, 2012 at 10:36:13AM -0700, Stephen Warren wrote:
> On 11/09/2012 06:22 AM, Thierry Reding wrote:
> > On Fri, Nov 09, 2012 at 01:56:55PM +0100, Thierry Reding wrote:
> >> The Harmony board has an Analog Devices ADT7461 temperature
> >> sensor connected to the DVC bus. It can be used to monitor the
> >> ambient (local) and on-die (remote) temperatures.
> >=20
> > Note that I haven't actually tested this, as I no longer have
> > access to Harmony hardware. Testing can easily be done either by
> > reading the files from sysfs directly or by running the sensors
> > utility from the lm-sensors package.
>=20
> OK, I can test this. The same comment about the DT node name that I
> made for the other patch applies here too.

Alright, I'll rename the node.

Thierry

--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQnU8UAAoJEN0jrNd/PrOhrooP/0ogmVmjGspVeerOHJZxaoIe
/MK8RmbB5Yw/K4fB+s5Pp8qV4zYIrUBn7iWu6Rq+jTU/aVTyD6C/VugBVWUcXeFs
n1byfG9EBwN6MTX368mXkEJaZGWLWlsL8lbP8ZjEgSi+So02CiW5SDjJX1eolRsI
e6EMUVWoe5m7am+h7xoTSnIZtwKRJwwGTj/PJk3WSoTn5vutsTjzacNF1skw85Or
qB4u7qH6p+cboRzOGz94qO8ao7GjwL26R4AyzzADJ/hP1LrOcNVWnG/FWBSCpLVO
KW65WfJZpHdDWLPj4oGUcfanUAM4xx6bqn1Yxceg3+K9T0dx0mqWo86AkiooRyLl
7pIwu3nEVVrNeTxxg35vLw7YtfgJm+Wdpab6ZlB6CvRzVdODrYw9FE8exHcBHPbk
NI8zIoTB2KOZrvM005WPd7DNMLWBg8k8IRy0YOp5yqw3rDS2X9/B/1PfNbR7pzmh
INZyAxNmPvcHfRLcc+g1DJ3t/cD12XgtrS2t7ZesNSzXYpCTEVWCBwhQf2/UN0VO
tBWmAZw4qPbFZW+E1KOn9sfVhj3e2+2M+/jE/LapoF9ZX7/TEcKAD8X0j1Zv6BDA
Rf2lJgwYSiOnpUpEQ8a7aOHHCZJ9apwBSi8ZJyqGs0I5+eBEB932VxGTt6qmP9vF
qYksBdOMgFE7tziipQ5U
=H/Eg
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--
