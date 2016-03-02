From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [tegrarcm PATCH v2] Add support for production devices secured
 with PKC
Date: Wed, 2 Mar 2016 11:41:10 +0100
Message-ID: <20160302114110.40a43529@avionic-0020>
References: <1456768181-12983-1-git-send-email-alban.bedel@avionic-design.de>
	<fbd256251e014b23a189337a7d251da0@HQMAIL103.nvidia.com>
	<20160301121240.596c664c@avionic-0020>
	<56D5D245.3000204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/qSMXt.9NL8da6XpJ.Hy3m3Q"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D5D245.3000204-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--Sig_/qSMXt.9NL8da6XpJ.Hy3m3Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Mar 2016 10:32:53 -0700
Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:

> On 03/01/2016 04:12 AM, Alban Bedel wrote:
> > On Mon, 29 Feb 2016 23:03:01 +0000
> > Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> >
> >> Alban,
> >>
> >> First of all, I believe the code your added here should and will work.
> >> However, it is probably purely coincident that I was adding similar
> >> functions as requested by Avionic Design (AD) in the last a few weeks.
> >> I think we could merge both approaches and result in one best
> >> solution.
> >
> > Up to yesterday what I did was only based on guess work, it was enough
> > to use RCM, but loading the bootloader failed. Now we finally got access
> > to (part of) the miniloader source and I was able to pin point the
> > missing piece to start the bootloader. The miniloader need the
> > bootloader signature before the bootloader binary when in PKC mode.
> > I added that and I was finally able to bootstrap my fused board.
> >
> >> The main differences between your and mine are:
> >> 1. When to sign.
> >>      My solution is to separate signing and flashing. Ie, signing can =
be
> >> done at a secure server and flashing at non-secure factory. During
> >> flashing, only signed RCM messages and bootloader are needed. No pkc
> >> private key file is required to be present at factory. This private
> >> key management feature is also requested by AD. Your solution requires
> >> the rsa key file being present when downloading flasher.
> >
> > Yes, this is currently not suited for production.
>=20
> Given that, I think I'll ignore this patch series for now. It's typical=20
> to mark such patches "RFC" in the email subject to indicate that they=20
> shouldn't be applied.

Sorry, this was misleading, with production I meant a factory producing
some K1 based hardware. What this patch implement works properly, but it
is only useful for developers as you need the private key. It does not
provide a solution for programming/recovering locked devices at an
untrusted factory. However I didn't intended to cover this case with
this patch.

> Hopefully you and Jimmy can work together to=20
> combine your work and post a production-ready patch set?

I'll look at Jimmy's patches.

Alban

--Sig_/qSMXt.9NL8da6XpJ.Hy3m3Q
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW1sNGAAoJEHSUmkuduC289n0QAMEaCiByM/lTU/+rkWGiYoxK
DuLAoJ8N4B1RsaiUOmd8D8jJCqCX1hJGJeid/Y5FUDZp9+ebZPhhXQ7PAan6kIRP
F+Crj75tPE4nEFvOm636QAMDUMnJR1iKsjnpci2BwlvEiwPYC2alcCfoPRsBDjzV
xJcH7x2jjpEnUferuEv+AkmHiFrW2sD3w7IF3/Td31KIHteYvm68E8jNbP0ig2UV
cOJa3crqdp7GldEiPp+yPkf999JKydBH7rinOCan6k5T5yqEnCjBXNr8lLiDwnRO
oVO6sXU38sl/vDWSpw/Ss9vEpFvO/S7e0ETcbcCTjocVHwAmVIHxBTxMAiAScvI4
DuQCVpjOSftIW+byOawBNbju5uTwOotK+9ByW2JaSRrNCgT7ejxvAWAp89cLZHFD
0M3lTElVcEoNsdL81ydnoWOpsAGBgJ+xhXHasMWNgE6woXvaad5naWEhourZRgkK
h/OzHZm7JywoLOHcf53p7ugysG0GmdSmvTtlJFZKPIPTi9ywi+TDWxzqvJkkWDY4
kutOy4kdiW35QtKB+/YkQEQgmXoXQy5quo93mHnO309Wo0OG8pPG2VU9/Blgvc4x
+FQQKGE+bc8kt3C6WET8Swej7TQVQN/pYepmwGL77N0x+XfNOcUJIXCzndGoSwnU
BF/6drbPUZl8H1KCwp3c
=gQtR
-----END PGP SIGNATURE-----

--Sig_/qSMXt.9NL8da6XpJ.Hy3m3Q--
