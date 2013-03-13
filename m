From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 9/9] ARM: dts: tegra: add the PM configurations of
 PMC
Date: Wed, 13 Mar 2013 12:57:34 +0800
Message-ID: <1363150654.3998.103.camel@jlo-ubuntu-64.nvidia.com>
References: <1363061043-9680-1-git-send-email-josephl@nvidia.com>
	 <97395805.p014F9TUYL@fb07-iapwap2.physik.uni-giessen.de>
	 <1363142623.3998.33.camel@jlo-ubuntu-64.nvidia.com>
	 <513FFD12.8050007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <513FFD12.8050007-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-03-13 at 12:14 +0800, Stephen Warren wrote:
> On 03/12/2013 08:43 PM, Joseph Lo wrote:
> > Hi Marc,
> >=20
> > On Tue, 2013-03-12 at 18:43 +0800, Marc Dietrich wrote:
> >> Am Dienstag, 12. M=C3=A4rz 2013, 12:04:03 schrieb Joseph Lo:
> >>> Adding the PM configuration of PMC when the platform support susp=
end
> >>> function.
>=20
> >>> +		nvidia,core-pwr-good-time =3D <3845 3845>;
> >>
> >> mmh, no idea here. original source [1] shows 0x7e7e ticks which tr=
anslates to=20
> >> 1 sec?
> >>
> > The ticks was based on the 32KHz clock domain. I translate it to uS=
=2E
>=20
> >>> 0x7e7e * (1.0/32000) * 1000000
> 1011937.4999999999
>=20
> Oh, I suppose perhaps the 0x7e7e value is both values packed together=
,
> so this should be:
>=20
> >>> 0x7e * (1.0/32000) * 1000000
> 3937.5
Yes.

0x7e * (1.0/32768) * 1000000 =3D 3845

Thanks,
Joseph
