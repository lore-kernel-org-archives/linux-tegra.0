From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 12/17] ASoC: tegra: utils: add support for Tegra30 devices
Date: Sun, 1 Apr 2012 11:28:15 +0100
Message-ID: <20120401102814.GC3153@opensource.wolfsonmicro.com>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
 <1333148852-17806-13-git-send-email-swarren@wwwdotorg.org>
 <20120331202015.GN5012@opensource.wolfsonmicro.com>
 <4F77B5F8.8080205@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NU0Ex4SbNnrxsi6C"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F77B5F8.8080205-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 31, 2012 at 07:57:12PM -0600, Stephen Warren wrote:
> On 03/31/2012 02:20 PM, Mark Brown wrote:
> > On Fri, Mar 30, 2012 at 05:07:27PM -0600, Stephen Warren wrote:

> >> -	ret =3D tegra_asoc_utils_init(&alc5632->util_data, &pdev->dev);
> >> + ret =3D tegra_asoc_utils_init(&alc5632->util_data, +=20
> >> TEGRA_ASOC_UTILS_SOC_TEGRA20, &pdev->dev);

> > Would it not be more sensible to do cpu_is_() calls in the utils=20
> > code rather than have the board say?  It'd possibly also end up=20
> > looking nicer in the code and may mean the compiler can figure out=20
> > not to include cases that can't be taken in the current build.

> We had floated the idea of adding cpu_is_*() (Well, soc_is_*()) macros
> for Tegra in the past, and received the message that was a bad idea;
> things should instead be driven by compatible flag values or similar.

Or look at the binding, or something.  Having the machine drivers need
to translate the bindings into these defines just feels clunky.

> See http://www.spinics.net/lists/linux-tegra/msg02250.html. That said,
> I see many cpu_is_*() calls in arch/arm, so perhaps we should revisit
> this.

Many of those might get some pushback in this day and age.

--NU0Ex4SbNnrxsi6C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPeC24AAoJEBus8iNuMP3df0cP/Aw2v3VBHyqHkQHDS4n5G0go
DSNnbJ3375NSfGTcibm/6rQJfa59hTCQMvf9XeX8LE0Kds8Jq6yxr91PSt+b9qRd
NoQRfmkFUWt1IZuZ0Scswb//Po6OI5cLVXzgucnYvsPEOG3zIh2TpdKysAUsRp2b
oBCxeqVXgsuFot7M0DJ8jZNOri4OalUBX9hYjksTtwyih9Y94pIaxfxFuxWF7rrx
msJCTiwf3Oml+W78CuPIHz0wkDgS753E/7zOeRrMC7uaEXWCTawu5kvEYrfjgX6j
uyb2cFyptEmTEPqtV7sfdcpoCbxxXnjM9NWNKnW8VYc007uqfU6KlquPoLGFFFBS
p9Xmls4IP7D9Q0nj1cIAcYntPwtPsaFESql/JDJMKh0mn8L+LOsiQBgzGonCFbfl
wvnz1HLBeCtoN2/Qz6gX9NFiTRURD/mXS31tysVZVAsxafJc261biR21DEJ4xziC
CbjL1GKpvqm2YK4Lex7237PZLYz0FXdr6RZyUnsT1JlYcGECwYHfh47qi4Z8pkdW
m+3N4UWavgvKU8RDLQM05cqqy4bREJW35Nhj9gUBILBWqTCVoGGiEXfRetAsqWx5
U6tSPaj948bu6SNWBqfAwtHqSO6Gwhu9d2plXcXNvI4CWAa1kJ7Csdb1R022lTfN
r9G/qKW+kC3aQHTgRLf/
=sCsf
-----END PGP SIGNATURE-----

--NU0Ex4SbNnrxsi6C--
