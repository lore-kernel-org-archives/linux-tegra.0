From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: tegra: move serial aliases to per-board
Date: Thu, 13 Nov 2014 13:04:51 +0100
Message-ID: <20141113120449.GD23422@ulmo>
References: <1415738970-7963-1-git-send-email-olof@lixom.net>
 <20141112122017.GC30821@ulmo.nvidia.com>
 <5463A390.2040609@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oj4kGyHlBMXGt3Le"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5463A390.2040609-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gregkh-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--oj4kGyHlBMXGt3Le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2014 at 11:14:40AM -0700, Stephen Warren wrote:
> On 11/12/2014 05:20 AM, Thierry Reding wrote:
> >On Tue, Nov 11, 2014 at 12:49:30PM -0800, Olof Johansson wrote:
> >>There are general changes pending to make the /aliases/serial* entries
> >>number the serial ports on the system. On tegra, so far the ports have =
been
> >>just numbered dynamically as they are configured so that makes them cha=
nge.
> >>
> >>To avoid this, add specific aliases per board to keep the old numbers. =
This
> >>allows us to change the numbering by default on future SoCs while keepi=
ng the
> >>numbering on existing boards.
> ...
> >I have applied this to the for-3.19/dt branch. So for anything that is
> >post Tegra124 the new rule shall be to add aliases to the SoC .dtsi and
> >then use consistent numbering of UART ports across boards?
> >
> >The alternative is to remain consistent with what this patch does, which
> >would be to make the serial port numbering a property of the board. That
> >doesn't sound too bad to me either since it'll hide all the unused ports
> >on a given board.
>=20
> For new SoCs, I think board-specific aliases would make most sense. That
> would be consistent with this patch. The only question I had was for
> existing SoCs, should we make the switch this patch does, or leave the
> aliases inactive there? New SoCs should use more sensible aliases.

I can't think of a way to keep backwards compatibility. I mean once a
patch is merged to apply aliases as specified in the DTB it'll change
behaviour on older DTBs. The best we could achieve is to update DTBs
with a flag to say that the aliases are to be ignored. But given that
no such flag exists in old DTBs, ABI would still be broken.

So I think it's fair to say that aliases have been buggy up to now and
therefore relying on deterministic serial port naming is broken, too.
Also there's precedent for this kind of thing. Ethernet device names
have undergone similar changes and I think people have dealt with it
just fine.

Also since the aliases haven't been used up to now it isn't really the
DT breaking ABI, but rather the kernel, and this patch actually fixes
things up. I think the lesson to be learned from this is that it is a
mistake to add DT content that isn't used.

That said, I guess there is one way to preserve the existing naming
after all. The driver could be patched to special-case Tegra20 through
Tegra124 and ignore aliases there. But I suspect that there are other
SoCs that have the same issue, so this is likely going to be a rather
big table.

Thierry

--oj4kGyHlBMXGt3Le
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUZJ5hAAoJEN0jrNd/PrOhXR0QAK5IZ39mBNuCLszWKtpH1ixH
4hdfzKnKYm2TMjuAlWz9gDgr4CT5zrgeRRz2deh8q+3Hh2nYfP7an+8qpJbZZig7
2MYFTuUSM3fG/rfDmlCD74pmFi//pPc07kbHZN/ELr5hm/JCHONhA2j1Pz3PCpgt
acBJ+gnApJkN+nf0KrJTGfU0i+JAWediSaDtZtt3cmKz/pWwIAxigPDDJFUAvifR
FVWwSAA36iaDI/kcZMK4svck7jMkDDqXnwl0rjURrqQ3vW85majshq9TklY9bgpS
WfW6YRhvmlSPW0pvgpN/jjPBNMAYKIFy4DeIf2mmzCaDQKYK4AQ65vrOHejWmdkz
/dhSK+jtIDwEpHYsHIh9J4eqBk1uOqAV/HT4aCmGcN10NUXwFlQu9jwb/esBYfCi
ZlHc4mDHEb8G9fx3+wBNRtmtX1+DVscgHxqrlPHzJ0u7RFsDfTbwTgZKAOZQw490
fyenm9FeaISmd7/yhFMV+x9JT+GUDpZqq8twoAVlITRAPCi6wwaWyMuAe1DnKzDn
/05VXhVe3HxMdY1xsK7JXsvMS5klZLUrfzCSMzeVA0xB1sPVTeb6Acp6KyLDOpzY
/fpPqNHNljyy+03SuXqj7M35GMXh6n/XYE+UE9MH3wk/RRsglLmNna1tCvifTO5v
RQmNVqYXdbkvxSEAxtvr
=R+VU
-----END PGP SIGNATURE-----

--oj4kGyHlBMXGt3Le--
