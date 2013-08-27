From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: tegra: Add basic support for carma devkit
Date: Tue, 27 Aug 2013 12:56:29 +0200
Message-ID: <20130827105628.GA17877@ulmo>
References: <1371994685-4997-1-git-send-email-chris.desjardins@amscins.com>
 <20130827075654.GG8686@ulmo>
 <CAGjquTQe0_+oEtyuF0Q0T8rZnQmz1h45T18zePe+BHVTjVQW_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGjquTQe0_+oEtyuF0Q0T8rZnQmz1h45T18zePe+BHVTjVQW_Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2013 at 11:15:12AM +0200, Chris Desjardins wrote:
> Thierry, I have looked at the comments, and I have also talked to SECO, a=
nd
> they aren't willing to give me the docs necessary to really do the job
> correctly (even if they did give me the docs, I am not 100% sure I would =
be
> able to do it correctly without a direct line to their hardware engineers=
),
> they also are unwilling to do it themselves. They did say that they will
> give me feedback on a dts file, but the feedback I got from them on the
> original one was little more than: this doesn't appear to be correct. To =
be
> honest, we have decided to go with another platform with better support in
> the mainline kernel (4th gen x86, because it is powerful, low power, and
> well supported), and as a result my seco board is collecting dust.

I'm sorry to hear that.

> For reference here is the full "technical" feedback I got from seco:
>=20
> we noticed some inconsistencies on dts file you provided: with respect to
> pcie-controller, ldo2 usage is not correct and PCIe lanes declaration
> doesn't look coeherent with actual hardware.
>=20
> Not really enough for me to make changes with confidence... I think I have
> already mentioned this, but just to be sure, comparing and contrasting the
> regulator/pci settings from kernel they provide (pre-device tree) and the
> mainline is like comparing apples and oranges. Most of the names have
> changed, and even in the few cases where names seem to correlate it would
> still take me a huge amount of time to really figure out what I am looking
> at in their source/sysfs/etc and translate it to .dts from with
> confidence... and I really have no idea how I would verify it (other than
> looking at sysfs or something, but to me, looking at what sysfs says about
> regulator configuration and verifying that a regulator is configured
> correctly are two different things).

Indeed. It takes quite a bit of effort to successfully correlate the two
datasets.

> Thanks for following up on this, sorry I won't be able to help, feel free
> to take my .dts file and run with it if you want, or pressure seco into
> updating it correctly if you can.

I doubt that I'll be able to exert any more pressure than you did. Given
my lack of hardware I won't be able to drive that effort myself, but
perhaps someone else will pick it up.

Thanks for investigating!

Thierry

> On 27 August 2013 09:56, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> > On Sun, Jun 23, 2013 at 03:38:05PM +0200, Chris Desjardins wrote:
> > >
> > > Signed-off-by: Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
> > > ---
> > >  arch/arm/boot/dts/tegra30-carma.dts |  461
> > +++++++++++++++++++++++++++++++++++
> > >  1 file changed, 461 insertions(+)
> > >  create mode 100644 arch/arm/boot/dts/tegra30-carma.dts
> >
> > Hi Chris,
> >
> > The new PCIe driver is going to be merged in 3.12, so it would be nice
> > to see this patch merged as well as given that it is one of the few
> > users of PCIe.
> >
> > Have you had a chance to look at the comments you received?
> >
> > Thierry
> >

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHIXcAAoJEN0jrNd/PrOhCP0P/1Uj6iGBmSVnFpRl3FssHdV2
2biR9Hwc/9SrwiXEetFT/hFDlvEsqnmNB3/SGw2jw5Fh7QHrObdt7+Wb/iN4WLVB
ViSYzH/ByBctE5QYMhpqKsovNwwFbAmNfPP+yN5KogFCCSc4XdGbzeWfrGokbIPo
kXvXaCrCRwSZ7sS5j3kGJuMUu58afdLwUmb4GKtd3tTXG3vfp6qqfAxugggMnb5h
U562MsSQ2kv8GV5ZSDv8eJRjZGKG57oaqInc9fiYrT0yPlHYhu/pt35ZkA0t/AzI
QMDryhsuClCczwfTZREEI0dRH6vkhlWzpv73GJAXh9vUlcd3cg/nMd/f0sclohT8
E6yMR2XvgTvKIt/H4tc9/IJzHTSzYyt+GRu8P7ERcaccPiw5Ha0BVXXGaLFEmqjo
Va6YlkZaxfQmFuL5QD0rAmMhCfJuqtpUx8LGXa7dqA+IUzyHqBUrr+hl/Mfxx+yr
x1GBgy/+/PqYfHjYFPcG/MyDD873Qhjmnz0K5WEnCGdJc01Dqo33/ezJr4Jjabh7
2ikEfrn6TazFLUPiZgvOqBJ7O1FH3glZZWIV7mdZKBdpeM82RFesZ5EXDaSlrlTI
Yq8wMeDEipRFaRIeq+8zixq7VvFbRgCLnsBKg9qY+Z/2uJ2ffXlyVKJgjCT4ihcz
gZKFbk6fVm6n1SN92PGc
=3Nhf
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
