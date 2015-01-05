From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/11] ARM: tegra: add function to control the
 GPU rail clamp
Date: Mon, 5 Jan 2015 16:09:33 +0100
Message-ID: <20150105150932.GG12010@ulmo.nvidia.com>
References: <1419331204-26679-1-git-send-email-vinceh@nvidia.com>
 <1419331204-26679-2-git-send-email-vinceh@nvidia.com>
 <1419426990.2179.7.camel@lynxeye.de> <549B7638.2010405@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0024219923=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <549B7638.2010405-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============0024219923==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zGQnqpIoxlsbsOfg"
Content-Disposition: inline


--zGQnqpIoxlsbsOfg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 25, 2014 at 10:28:08AM +0800, Vince Hsu wrote:
> On 12/24/2014 09:16 PM, Lucas Stach wrote:
> >Am Dienstag, den 23.12.2014, 18:39 +0800 schrieb Vince Hsu:
> >>The Tegra124 and later Tegra SoCs have a sepatate rail gating register
> >>to enable/disable the clamp. The original function
> >>tegra_powergate_remove_clamping() is not sufficient for the enable
> >>function. So add a new function which is dedicated to the GPU rail
> >>gating. Also don't refer to the powergate ID since the GPU ID makes no
> >>sense here.
> >>
> >>Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >To be honest I don't see the point of this patch.
> >You are bloating the PMC interface by introducing another exported
> >function that does nothing different than what the current function
> >already does.
> >
> >If you need a way to assert the clamp I would have expected you to
> >introduce a common function to do this for all power partitions.
> I thought about adding an tegra_powergate_assert_clamping(), but that
> doesn't make sense to all the power partitions except GPU. Note the
> difference in TRM. Any suggestion for the common function?

I don't think extending the powergate API is useful at this point. We've
long had an open TODO item to replace this with a generic API. I did
some prototyping a while ago to use generic power domains for this, that
way all the details and dependencies between the partitions could be
properly modeled.

Can you take a look at my staging/powergate branch here:

	https://github.com/thierryreding/linux/commits/staging/powergate

and see if you can use that instead? The idea is to completely hide the
details of power partitions from drivers and use runtime PM instead.

Also adding Peter whom I had discussed this with earlier. Can we finally
get this converted? I'd rather not keep complicating this custom API to
avoid making the conversion even more difficult.

Thierry

--zGQnqpIoxlsbsOfg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUqqksAAoJEN0jrNd/PrOh9IQP/06/s1WNBwdKN36x3wBgK7sa
Gw4BMvJWZcZQ9+Hz/dg/6BzrFHwx+cK+Mpx+fiDkx00TCey7blspXk+D/R25G0jr
OsAiw4eERfBPRQKvRtdLMv/LP51D2dkx/P+Fl/KqDWDPMLGXryv1EhPL3m6knNQh
fYUEh7Be68bV2jtyrtcnGGPPDLDe1i0EB6WNWNLMTD03cxAqf6gkpuwV3eS3i3/e
astnISvfUQ87b8bRdkbsDzT0LPccCthyV12xLSep/dVjnDPlFxdFQC9HEYJGUcrT
iyuNLMrooIXWznzSFmjjVyn09V6OGwW3h0mj7uCLRWY2vZewB+x5c16y+h1EpOlM
6LdBEns/Z1/Sii5cdjPCUeQ/JGCKV+eER3t+pkgY13FW8jceE+xdBx1rmwTf6pjy
4BkPViJgLkDYeD+90ZSNQvPFrHzCcefa+iQ/HuCUmLzo6EDl94Inb1B6gjhMKeBh
MOnY5IpzkFtwQmTL3m1+45RLXd/oDcVjSRR7eG4SR+yk1CMaGbAHNJVj8QLvC1Sw
0EFMzte8s7QhlaQVS4mb/6c9KfQUTZXjGqifIVzhBmWN06lkTYOeuKxV3qXBFQpW
vywD18RUddAAUgGNtIzQMwDYr+FLAGkWToyiGe+6fsYNMOLgDmhcwXAAnDBDJQ4d
utQCuy9RSR6B9mM+2Ipk
=fb4R
-----END PGP SIGNATURE-----

--zGQnqpIoxlsbsOfg--

--===============0024219923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0024219923==--
