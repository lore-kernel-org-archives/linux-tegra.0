From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v1 8/9] ARM: tegra: Enable UDC on AC100
Date: Thu, 06 Jul 2017 23:23:47 +0200
Message-ID: <1803887.4ILkMQVocE@fb07-iapwap2>
References: <cover.1499273075.git.digetx@gmail.com> <32f880f8-a49c-8f29-fe26-f50cae31e215@gmail.com> <33990cfa-f2f8-48ba-240b-ad088ba50bb5@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3301948.7HikszgW5Z"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <33990cfa-f2f8-48ba-240b-ad088ba50bb5-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--nextPart3301948.7HikszgW5Z
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 6. Juli 2017, 20:00:02 CEST schrieb Stephen Warren:
> On 07/06/2017 10:57 AM, Dmitry Osipenko wrote:
> > On 06.07.2017 19:38, Stephen Warren wrote:
> >> On 07/05/2017 11:19 AM, Dmitry Osipenko wrote:
> >>> Override the compatible string of the first USB controller to enable
> >>> device mode.
> >>> 
> >>> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts
> >>> b/arch/arm/boot/dts/tegra20-paz00.dts
> >>> 
> >>>        usb@c5000000 {
> >>> 
> >>> +        compatible = "nvidia,tegra20-udc";
> >>> 
> >>>            status = "okay";
> >>> 
> >>> +        dr_mode = "otg";
> >>> 
> >>>        };
> >> 
> >> This port is the only external USB port on the AC100.
> > 
> > Seems that's not true. http://elinux.org/Tegra/Boards/Toshiba_AC100 claims
> > that there are host and micro USB ports.
> 
> You're right; I was getting this board confused with the Springbank
> variety of Seaboard, and when I looked at the mini USB port on the AC100
> I thought it was something else.

Sorry, for the late reply, I'm on vacation.
 
> Given the physical connector on this USB port on the AC100, it's
> probably fine to convert it to device-mode only since I don't expect
> anyone has a USB OTG cable that has a mini size connector on the host end.
> 
> It looks like this port is only enabled because the very first version
> of tegra-paz00.dts didn't explicitly disable the port, and when
> tegra20.dtsi was updated to disable all USB ports by default,
> tegra-paz00.dtsi was updated to enable the port so that the DT change
> didn't affect behaviour, which then left the port enabled explicitly
> albeit without much reason.

I think someone used it in the past in host mode and it was working, but I 
think everyone will be happy to have it operating as client only (as original 
intended), especially because we already have an external (and also an 
internal) usb port.

> So, once the dr_mode is fixed in this change, it's:
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tested-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

--nextPart3301948.7HikszgW5Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEySF+t0C8+8jyqfBvrJ5Hf0cUG2gFAlleqmMACgkQrJ5Hf0cU
G2hYpgf+KmC3LzGKGbP78kcYQPkOXd36sN4er3TAppdTJa3EP6SC7qAqenuKy6Om
OFvuLN4zgAeTTYxQ4Zj84Gi/9SMd+A3xqrp9/coLrxygdmQqijm5ae8/WCVj5agU
iAM86E/EJMrcqsqp2cJ2mW9CRQfyZhKRguHNChSXHtJ02g1Na6b+c3fGIPZe/fxU
0XErfeeSwjU0RVXNjdf51o4nvIe9Ws7YARsBKYMyrP0cOAshGe7ZydgA3RRYSa4q
Gvj2It788szgkbzFANeXha1SFjF490JRgI1rWX/2rlqTAmvPz/86G5kRZS/7+MIj
0szw22r5mD9abCGHGMYUAiQr/YpJEQ==
=98Mu
-----END PGP SIGNATURE-----

--nextPart3301948.7HikszgW5Z--
