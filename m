From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] i2c: tegra: proper handling of error cases
Date: Mon, 18 Apr 2016 09:31:18 +0200
Message-ID: <20160418073118.GC13078@ulmo.ba.sec>
References: <1460726507-9170-1-git-send-email-smohammed@nvdiia.com>
 <20160415141558.GC3472@ulmo.ba.sec>
 <73535dcc422441d3a981208dae1a2bad@bgmail102.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Izn7cH1Com+I3R9J"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <73535dcc422441d3a981208dae1a2bad@bgmail102.nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Shardar Mohammed <smohammed@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "wsa@the-dreams.de" <wsa@the-dreams.de>, "gnurou@gmail.com" <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org


--Izn7cH1Com+I3R9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 16, 2016 at 08:08:50AM +0000, Shardar Mohammed wrote:
> Thanks for the review, updated with comments inline with Shardar.
>=20
> > On Fri, Apr 15, 2016 at 06:51:47PM +0530, Shardar Shariff Md wrote:
> > > From: Shardar Shariff Md <smohammed@nvidia.com>
> > >
> > > To summarize the issue observed in error cases:
> > >
> > > In SW: For i2c message transfer, packet header and data payload is
> > > posted and then required error/packet completion interrupts are
> > > enabled later.
> > >
> > > In HW flow: HW process the packet just after packet header is posted,
> > > if ARB lost/NACK error occurs (SW will not handle immediately when
> > > error happens as error interrupts are not enabled at this point). HW
> > > assumes error is acknowledged and clears current data in FIFO, But SW
> > > here posts the remaining data payload which still stays in FIFO as
> > > stale data (data without packet header).
> > >
> > > Now once the interrupts are enabled, SW handles ARB lost/NACK error by
> > > clearing the ARB lost/NACK interrupt. Now HW assumes that SW attended
> > > the error and will parse/process stale data (data without packet
> > > header) present in FIFO which causes invalid NACK errors.
> > >
> > > Fix: Enable the error interrupts before posting the packet into FIFO
> > > which make sure HW to not clear the fifo. Also disable the packet mode
> > > before acknowledging errors (ARB lost/NACK error) to not process any
> > > stale data.
> > >
> > > As error interrupts are enabled before posting the packet header use
> > > spinlock to avoid preempting.
> >=20
> > Please try to use up the full 78 characters per line in the commit mess=
age
> > (with the exception being the subject line that should be shorter).
>=20
> [Shardar] Will take care of this.

I just realized my comment was wrong. The rule is to use 72 characters
per line for the commit message. Sorry about that.

Thierry

--Izn7cH1Com+I3R9J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFI1GAAoJEN0jrNd/PrOhKWQQAI6DOogUlf7yOYs6VvhWB/zA
IlqowakTZ61CbTHTZqf3Vdd2TbnMqrdBsM+FZ0Tk938ZSQc7OEv5ZWwhAxrgXBJH
7iV9T5sMVMJ5dbEzzYtHRqnIZ4nQU3BVsg+0doac9B4ThYGmPOZMaxw6q4bYH68r
XDDd66UhLhLZnymEm/RPcRtCMj85VaKtmVRlJtXSlxV7RkpUtdeZueyGzqmDcKew
WvW26xbZ1klm5UYOEkaiRdU3hsbdDoV/0RoykI8wLkhD5qoozcGwa1SIujMjsILO
kJ/MfjLlc+iwuIdhJog4MTUZKS1JeY8guFYVXcbecUu/TeojOUs3b7SBCgR4xIU1
6A1M/z8NMImSQshSGu/rpgvTuWINrO8WRxVQ2nlYHNqg+Wn/ThPKWcKBLT37tZdY
FVLKgwKMChpAVmmsZ2Zfc5Ocdd2v/GVUeuIr7IAOR2k16Z1DREQfqyte+tpvSQeW
T2pEPVi2JdeBkqtf2MP/grZMaCHgIOwcSaAXrN8jms2DcQpMrIo2/15HQcKwxH8C
uRqoh0zFPeVZifei4BYILo5vM+mdLuhr+YlLK/6xTUUZ15WTOJyx8GMfPiJsw0O5
TEFq6o1aj6tldFvw/zGR41mFCzx6ydZQxh6mB/FZLf9ugArXW1FDc1Yn5V2Aw2bn
MjFMmposrbHjIvF2eEzS
=D9+1
-----END PGP SIGNATURE-----

--Izn7cH1Com+I3R9J--
