From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH nouveau 09/11] drm: export some variable and
 functions to resue the PM functions
Date: Tue, 6 Jan 2015 12:49:55 +0100
Message-ID: <20150106114953.GD31830@ulmo.nvidia.com>
References: <1419331204-26679-1-git-send-email-vinceh@nvidia.com>
 <1419331204-26679-10-git-send-email-vinceh@nvidia.com>
 <54A20F4D.4040100@gmail.com> <54A2198A.4000707@nvidia.com>
 <20150105153252.GI12010@ulmo.nvidia.com>
 <CAAVeFuK-SgUbtHADX4-pXN5_ayzvEd+1KxJOBcRe2tmDfHaLEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0259024206=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAVeFuK-SgUbtHADX4-pXN5_ayzvEd+1KxJOBcRe2tmDfHaLEA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Spliet <seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============0259024206==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q0rSlbzrZN6k9QnT"
Content-Disposition: inline


--Q0rSlbzrZN6k9QnT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 05, 2015 at 08:50:18PM +0100, Alexandre Courbot wrote:
> On Mon, Jan 5, 2015 at 4:32 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> > On Tue, Dec 30, 2014 at 11:18:34AM +0800, Vince Hsu wrote:
> >> Hi Emil,
> >>
> >> On 12/30/2014 10:34 AM, Emil Velikov wrote:
> >> >On 23/12/14 10:40, Vince Hsu wrote:
> >> >>This patch adds some checks in the suspend/resume functions to disti=
nguish
> >> >>the dGPU and mobile GPU and exports some variables/functions so that=
 the
> >> >>nouveau platform device can reuse them.
> >> >>
> >> >Hi Vince,
> >> >
> >> >Afaiu one needs to export a symbol as it's used by another module or
> >> >subsystem. With the follow up two patches you are not doing either on=
e,
> >> >so I'd assume that you can just omit the EXPORT_* changes.
> >> The nouveau platform device driver is built as another module -
> >> nouveau_platform.ko. :)
> >
> > I'd like to hear the opinion of the nouveau people and Alex, but I'd
> > very much prefer if nouveau_platform.o was simply linked into the
> > nouveau.ko module. I don't see any good reason to keep it separate.
>=20
> Yep, I agree. The decision to host platform support in a separate
> module looks misleaded if it results in additional exports that we
> would otherwise avoid. IIUC I did this to be able to use the module
> convenience macros to register the platform driver.
>=20
> >
> > Something like the attached patch (untested) ought to do it.
>=20
> This patch alone won't be enough for the reason I mentioned above.
> However, if Vince doesn't mind handling the platform driver
> registration manually in nouveau_drm_init/nouveau_drm_exit, I agree
> this would be the way to go.

If we do the conversion to generic power domains, the only Tegra-
specific API remaining will be the access to the fuse registers for the
speedo value. At that point we wouldn't need the ARCH_TEGRA dependency
any longer and could always build the platform driver along with the PCI
driver.

I guess we could do that even now if we simply #ifdef the various Tegra-
specific parts. That in turn would have the advantage that we don't need
to #ifdef the driver registration code. And it would help separate
things in case anybody wanted to use one of the SoC GPUs in a non-Tegra
SoC.

Thierry

--Q0rSlbzrZN6k9QnT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUq8vhAAoJEN0jrNd/PrOhdcIQAMIP6Dl6ynu73VuHkweahyFs
/L3Whl5aaNt8t6IrsqTMBfQII6U7QrwvhrED2I4zys48dpGIJfMtv1szqOeyeo5W
2hlEq014w5FLJtSjZcQ300tWuFyalpcGmbOxs6j4kK1gZ4NjECyovFb+ctaXDIWV
UxZXTs/8KiOTbRyIZqK8R8XErFs9XRF4KaYZ6+QBAXPrnFo3vuhJ/17fnA/AwGHO
wKUKzBS1UEXN7xrywI9OEUXr9I5pxGVNlNQBLHo/1Rm9tAr/Ue1/CWQz2V9XAZx+
fX+b/u5NT341gi4IaN+pfV+fiJPmDbr9Is9kBZD6BADEsbhuCq0TFqAZ64pC9QWY
KyP3m02Xzn9iBhg4ab4NnNF7+dZf6A7XBOscB2zuNU811ypNZU5zqKIenYfv804j
hkxLlBmP+Tzci7RbBHKjLnbdfYedqio1yfo3PXALH5ONlYvfVMkUBJNRmBySpan9
uZBDB8rldFy/7KTgoUeU+wOw6cT1icTUkMXEErkWOhX1cTxW/BsUuV0WevdR0E/Y
f1XLbiHi08NoZQPWeWi6tTAJGBjEw1aD72bM1WaSgUVhYlBUmMsvWqUBq8bLp5JR
EV0p7oxvOh601LXWrqVh3DLpnlZKCfpR+lPJK9VNdQqCSVFSMFOqlQjjNSsy/w+l
jMqUkt/vSEOOucizkKVd
=j3GQ
-----END PGP SIGNATURE-----

--Q0rSlbzrZN6k9QnT--

--===============0259024206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0259024206==--
