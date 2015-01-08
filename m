From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: Kconfig: add basic support for the Tegra SoC
 family and the Tegra132 SoC
Date: Thu, 8 Jan 2015 11:55:31 +0100
Message-ID: <20150108105529.GH1987@ulmo.nvidia.com>
References: <20150107081638.14381.42444.stgit@dusk.lan>
 <20150107081729.14381.47835.stgit@dusk.lan>
 <20150107142005.GA1621@ulmo>
 <54AE5DD0.6020409@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1xGqyAVbSpAWs5A"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54AE5DD0.6020409-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--X1xGqyAVbSpAWs5A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 08, 2015 at 03:37:04AM -0700, Paul Walmsley wrote:
> Hi Thierry,
>=20
> On 01/07/2015 07:20 AM, Thierry Reding wrote:
> >* PGP Signed by an unknown key
> >
> >On Wed, Jan 07, 2015 at 01:17:33AM -0700, Paul Walmsley wrote:
> >>Add basic Kbuild support for the Tegra SoC family, and specifically,
> >>the Tegra132 SoC.  Tegra132 pairs the NVIDIA Denver CPU complex with
> >>the SoC integration of Tegra124 - hence the use of ARCH_TEGRA and the
> >>Tegra124 pinctrl option.
> >>
> >>For the time being, Tegra ARM64 support is added with a dependency on
> >>CONFIG_BROKEN.  This is temporary and can be removed when the
> >>following two patches for compilation failures have been merged:
> >>
> >>"soc: tegra: pmc: restrict compilation of suspend-related support to AR=
M"
> >>https://git.kernel.org/cgit/linux/kernel/git/pjw/tegra-dev.git/commit/?=
id=3D053decbf3900d4e8fee799f9a29cf8d905b2fcb1
> >I think you said you were going to respin this on top of v3.19-rc1, but
> >the above doesn't seem to be rebased yet. Given that the only comments
> >were bikeshed from my part, do you have any objections to me taking the
> >patch and apply the bikeshed myself?
>=20
> Sorry about that.  I am indeed on the hook for that.   I got distracted w=
ith
> some other patches and haven't yet reposted that one :-(
> I will do that later today.  If you would prefer to do it yourself, that's
> fine too.

I ended up applying your patch as is. Retrospectively my comments had
been a little too much on the pedantic side.

> >>"clocksource: tegra: wrap arch/arm-specific sections in CONFIG_ARM"
> >>https://git.kernel.org/cgit/linux/kernel/git/pjw/tegra-dev.git/commit/?=
id=3D220aa7fcc74a1a089916be6cb34b0e326f31841f
> >I don't think I've seen any comments other than mine on this patch.
> >Given that this patch depends on the above to get rid of the BROKEN
> >dependency, it might still be preferable to take both via the Tegra
> >tree. Otherwise we probably have to wait until v3.21 before we can
> >apply this.
>=20
> I'm fine with them going in through you if you have a strong preference f=
or
> that approach.   Generally my preference is for patches to go in through =
the
> direct maintainer's tree to minimize the risk and hassle of merge conflic=
ts.
> But if you'll take care of that side of it, it doesn't matter too much to=
 me
> :-)   We just need to pick up acks from the direct maintainers, I guess?

Yes, we really just need an ack from either Daniel or Thomas on the
clocksource patch. I don't think that driver has a lot of potential for
merge conflicts.

Thierry

--X1xGqyAVbSpAWs5A
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUrmIhAAoJEN0jrNd/PrOhQPcQAJHcaqr/bpUsDxN3rYdr+iha
9Rd0DzPxDBJk2pYi0gS8jtC85oLvSm8yfBGTn4mLquaFdy55+EH9whKj9JIKegqc
AwCFiUth5TLP46Mr91ZD3s4uGOvjP1KoDlecTUOv4kdXTccJ+gsbsDQYPpzl4vzp
1pIxgmVCde1I8FQ1hIZrNiHrZqdw2ncuPP8iGChXmtZm/5WuK9uJuu3ZqbnWXPzT
WhVXv1YY16mHyWLVSThYS0akKOkVqtucctpEJe/3EHkdvJNsiyBfPWisZOVKke3w
zYCeggfJLesvBpV+5cdImS9jU7k8rGvsQ2yI+psFSKqynuCnW2fC0rXut169VMCZ
o+BOyFuqjR0emSzfHyPGzAAMOW+C/A9zYevbviCo1Cmfbvi3qkQb2ODq3z/P1IWF
X2/7KG0aN4CR9dwQHzl32W4vaUVjGPsA9bi0zQBjWaKGzNxYJtLA4ruZ2YefGwwl
wTi01z2K/x9rQ19GQv0oT7wg3oMYVpQXOrmzKmhvblip2eb6T8yjHVjh0FJA+u9f
PeMxU+SSKdW8P3/P44MsnlnNB4sriNZoVQVRgcYGTukmDvgQGTVhQ/ZYE9BLxrTM
kkjVANYsrsiaBbATi2YVKfEok3t17Va3WhsvXruTwDAHOhg/KeJNQkHeM+3oRroX
OxcykxsFyjkPqaRoFtgU
=W3Gc
-----END PGP SIGNATURE-----

--X1xGqyAVbSpAWs5A--
