From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 2/3] ARM: tegra: move fuse code out of arch/arm
Date: Fri, 11 Jul 2014 14:56:40 +0200
Message-ID: <20140711125639.GA10744@ulmo>
References: <1403558626-13422-1-git-send-email-swarren@wwwdotorg.org>
 <1403558626-13422-2-git-send-email-swarren@wwwdotorg.org>
 <20140707004417.GE8469@quad.lixom.net>
 <20140708134359.GA23218@tbergstrom-lnx.Nvidia.com>
 <CAOesGMhoqvqf-dktp-OfUNTPLahPwkyAPiTeDngr4QjH=VfOGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMhoqvqf-dktp-OfUNTPLahPwkyAPiTeDngr4QjH=VfOGA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org" <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2014 at 10:47:16AM -0700, Olof Johansson wrote:
> On Tue, Jul 8, 2014 at 6:43 AM, Peter De Schrijver
> <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > On Mon, Jul 07, 2014 at 02:44:17AM +0200, Olof Johansson wrote:
> >> On Mon, Jun 23, 2014 at 03:23:45PM -0600, Stephen Warren wrote:
> >> > This branch moves code related to the Tegra fuses out of arch/arm and
> >> > into a centralized location which could be shared with ARM64. It also
> >> > adds support for reading the fuse data through sysfs.
> >>
> >> The new/moved misc driver isn't acked by any misc maintainer, so I can=
't
> >> take this branch.
> >>
> >> I saw no indication from searching the mailing list of that either,
> >> so it wasn't just a missed acked-by.
> >>
> >> I wonder if this code should go under drivers/soc/ instead?
> >
> > It's modelled after sunxi_sid.c which lives in drivers/misc/eeprom/.
> > Originally this driver was also in drivers/misc/eeprom/, but Stephen ob=
jected
> > and therefore it was moved to drivers/misc/fuse. I think that's the rig=
ht
> > place still.
>=20
> I disagree, I think this belongs under drivers/soc. Especially since
> you're adding dependencies on this misc driver from other parts of the
> kernel / other drivers.
>=20
> I also don't like seeing init calls form platform code down into
> drivers/misc like you're adding here. Can you please look at doing
> that as a regular init call setup?
>=20
> The fact that you provide data to the rest of the kernel again really
> says drivers/soc to me, not drivers/misc.

Hi Olof,

I just sent a patch series that addresses your comments:

	[PATCH 00/12] Add NVIDIA Tegra FUSE driver

That contains a lot of the cleanup that I've been doing to get things
ready for 64-bit. It's essentially what this pull request contained,
with a couple of other patches on top to untangle the init sequence
so that these can all go into regular init calls. I've tested on all
four Tegra generations supported upstream.

While there's possibly more that we can do I think it is a reasonable
first step and I'd like to get this into 3.17 so that we can start
moving out other things after the merge window.

It would be great if you could have a look, and if there aren't any
objections I'll send out another pull request.

Thierry

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTv98HAAoJEN0jrNd/PrOhoAcQAKpBtA9ygdyCoOUejdn3YZVF
bAzDTsaaL4PEWMurXvLMNcPzLiZ097BvcJN3b7AN48p/un1a3cZb9NEAFiNNOmcg
/4UH88UHeUcxCxtHNmDWXjgAKX8/aLGnlr2CoFjBspQ0wTnK9ZcZs9FHpekoN1UP
6ZVkAy/E4uH+Ltg79en/djhDOSxyu7d4Msy1utaR06R4JRwupnOaamh2hFHFBYho
+ECHxM3DK0dNcl8PTVMyGKKg2Xps3oIATE5C0q9zIsKimF6i2LVU2qyv09Oq/qc6
s/XxEjcUEKxWFYRhrRHfpBZ0KnHWguXDtS/9oPlTfRdkgC8N646zC5VTuLgrbYv1
29sid0aYA+BvTN5z9M+PS9Aub4biS2V/AjnKVvlEUYCfmro1O9HRpa4j6FMNFnWU
mtoJTE6Aq9c3He6kjRKVNFeYohzW+EdHzs4RhYAQfmwkeYe4dXIGT6Oci+ScZBed
5fNiWIhSpgp7xLXeQwOhHieW3QlLfrmU3BExsj86BTv3uE6r6aQDh8wWa3psTg8R
uayTm/2NsvpTTIl69FLLIVBPi1jxjS13DZ1hQtsT8Vsn2GXx4oOlOLywZ6i5rvJd
zgpdyvp96dCH2zN3BSDVE+nXpgV+dQxn32Oq2XoaWyAW7AzFb1qnGSN2oEpG9s+g
sdyYQ7aWnjCHTjFkgApG
=pj7U
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
