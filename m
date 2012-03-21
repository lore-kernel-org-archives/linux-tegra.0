From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/3] ASoC: tegra: register 'platform' from DAIs, get rid
 of pdev
Date: Wed, 21 Mar 2012 00:36:46 +0000
Message-ID: <20120321003644.GB8567@opensource.wolfsonmicro.com>
References: <1332276950-9398-1-git-send-email-swarren@wwwdotorg.org>
 <1332276950-9398-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1332276950-9398-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 20, 2012 at 02:55:49PM -0600, Stephen Warren wrote:

> This change removes the platform_device completely. Each Tegra DAI now
> registers the ASoC 'platform' itself. Machine drivers are adjusted for
> the new 'platform' name.

Thanks for doing this, it's an excellent cleanup!  I've applied all
three patches for 3.5, I'll probably split them out into a separate
branch when 3.4-rc1 comes out and I stop rebasing just in case there's
any merging issues (though as you said when we discussed the series
earlier it really should be fine).

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPaSKWAAoJEBus8iNuMP3dsXMP/3wnHoODJBhDtUheRueX2Kxl
LHGtw3fPP0AJmn1tkGOk31m7mFu/qw9LNK1WM5MPDKGNLR8pfGRHQc21QxDvDIia
UhPTHVwmTVqSOND4M7ycqJVROq2ScLdwCUwwnL6mLEUbR91zCoFKpZ5wp3oauoGG
ObWDxWi7BoITfHbyrvvJ1UaKrQo0Q2Jz4U4Lle74MWxbfHXd5VSfFCPcpeFpaeAf
JMacY9L7iJHccfZF7SFhlDZh6HRNYc+tG0W1kHbRieywIGjyMu16Ne/vBKYRE3XR
gtbzRieenHxJyjVrliyE6JzaXdRlv0D59aIAVkTchI5NLM9g0dEzRaQ3Yj27p++8
ZPQ56eJxFbG+6xD4Utl6BicqnaJxb98h6qe1RAHex2NwOHpFwI4cPd15nrcKlWqj
QnQ/ztZF58wZ/xuU+i7248J9Ndghrg7EOAif0dK6fkZvrE9lODQq3D9Fj5syA1K+
U8jbzFWqRYBEggvXlL0TN9iANjZWQV3sI8TNooOMOg3PDIpBh7JbjzXPmeh3kCvR
rOedIVIdaHHjZQQmi7d2LvvJFjq5mcFz+9oqM123oqf8orvXWqhTapyIK8hjEybu
SmNNsRvvivvdd3WSzLJxu46QhgbrxraBpKS7Z76poW9JSNNp8sk0TUbBH4Vq5ess
POURneu0mDh3H0fnJw1D
=sj2u
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
