From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra_defconfig: enable CONFIG_ARM_APPENDED_DTB
Date: Fri, 20 Sep 2013 09:30:37 +0200
Message-ID: <20130920073036.GA8575@ulmo>
References: <1379638594-28888-1-git-send-email-olof@lixom.net>
 <CAKCjkJbavWtWBxvKqpesmJfcKTUCpbsM_xL0JfS49vOpkZ8AUw@mail.gmail.com>
 <CAOesGMjP+QMyuLCykg0nW4yWwmnNtoyzf7nK2dPAWuqcpfp5OA@mail.gmail.com>
 <523BA64F.1050607@wwwdotorg.org>
 <CAOesGMh8NE7h=BH2sPrG4eE3Vbv0Q5+hCj52gi0072phtjcghw@mail.gmail.com>
 <523BABB2.4090200@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <523BABB2.4090200-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Steev Klimaszewski <steev-4jv++OSWV9OTkO8mciVlQg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2013 at 07:58:10PM -0600, Stephen Warren wrote:
> On 09/19/2013 07:39 PM, Olof Johansson wrote:
> > On Thu, Sep 19, 2013 at 6:35 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>=
 wrote:
> >> On 09/19/2013 07:09 PM, Olof Johansson wrote:
> >>> They do? The hardware I have came with a very old u-boot. Got a link
> >>> to the newer one?
> >>
> >> Mainline U-Boot runs nicely on the TrimSlice. Missing functionality
> >> includes PCIe Ethernet and HDMI, but everything else works fine IIRC.
> >> You can flash it using:
> >>
> >> https://github.com/NVIDIA/tegra-uboot-flasher-scripts
> >>
> >> (read README-developer.txt first, then README-user.txt)
> >=20
> > Oh great. Unfortunately lack of PCI-e makes it hard to network boot
> > (unless I add a redundant usb-ethernet adapter on it). Hmm.
>=20
> I think Thierry was looking into PCIe, although I don't think it's
> working yet. I always just use USB even on TrimSlice since it's easier
> to move the USB connector than the network connector when switching
> machines:-) PCIe works in Linux now though, as of v3.12-rc1.

I have a local branch that makes it work at least on Beaver, but it
causes the kernel PCIe to fail for reasons that I haven't tracked down
yet.

Thierry

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSO/mcAAoJEN0jrNd/PrOhiJ4P/iz3MyyHrIZnwNi8Kc9YOisa
ERWSC35U7NUAOZCXZdI4uTfdHezu/tOEn0nJCphLrVEF2QLFoJrNZ4xIXCEi3FoC
jPM3ni+pocbVtsyMU078e+IwxGfId1mpNIHGrLthB4soaqQsi9Mu4YpxkK06s/b9
FRfk+co+6ioTZGxurrRGlmKUA4Ey7EaHmrBcXAJ3L3hBhqFEEmcxvtrRVqidSBlj
d3g2YguJY8pAILpvH+sHGxF4YUy6lq6i6ZoDIW/MTDfIppVtVf6U4kM1o6c7Y0ni
5bvczL7Ut0YY4uFPDEf24vK4DW3vcjTbn1eq7fAY0zfknl39ZSWa0XISaKZPNKXj
CoG1GF60LM6YKL85MK+tIgkOyudX6nBHvudvVWd1JYnpuOYjv79MbpU4qOThZduX
lvE6z88KgTackH/FeOGVBuAZ6sV8CUx6Z1JKJrbxLCaC5Y8RakImcWbTj9Mo9zt0
rVHVEFb/Ea4+JLEv6svx+20sJBdZukkvXPz39XNOsl6EWZ4JNjjjfOIJnNnVNFgX
I1IedygEDg/CWPzYQ7d3CksMAgaf0FlbXgGvHj9cV9LEeEE9YaTymTIXbLfmI6cg
xZDbS220FKoDuviVaZAQrmedCsFTO/rZGu/KV+2oFJABJMk0YzIXLOQC29a/ZKJ+
SDtW7AVzBagcbWHZ1r6P
=qGN+
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
