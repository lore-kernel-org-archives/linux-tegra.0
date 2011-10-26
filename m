From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 3/3] arm/dt: tegra: add dts file for paz00
Date: Tue, 25 Oct 2011 23:43:06 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173E1B4536@HQMAIL01.nvidia.com>
References: <cover.1319313019.git.marvin24@gmx.de>
 <90ee88bcde84141e0280ffa4ccbd288462489eba.1319313020.git.marvin24@gmx.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173E1B4189@HQMAIL01.nvidia.com>
 <2821699.TeokzqUUds@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2821699.TeokzqUUds@ax5200p>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: "Grant Likely (grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org)" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Tuesday, October 25, 2011 1:05 PM:
> On Monday 24 October 2011 22:16:15 Stephen Warren wrote:
> > Marc Dietrich wrote at Saturday, October 22, 2011 2:17 PM:
> > > * NOT FOR COMMIT *
> > >
> > > This just adds the dts for paz00. I like to add it to board-dt as
> > > well as soon as I find out which tree to base it on.
> >
> > ...
> >
> > > +++ b/arch/arm/boot/dts/tegra-paz00.dts
> >
> > One thing that cross my mind when writing the TrimSlice support and I
> > forgot to mention: Should these files be named ${soc}-${board}.dts or
> > ${vendor}-${board}.dts (tegra-paz00.dts or toshiba-paz00.dts or
> > compal-paz00.dts). I'm OK either way; just want to follow any outside
> > expectations.
> 
> I also don't know. I prefer compal for paz00 because Toshiba's code name was
> procyon (I think) and I don't want to change all the naming. Also Toshiba
> showed no interest in helping us, so I don't see why they should get the fame.

Well, it's more about correctly defining what the HW is than advertising,
fame, or support!
 
-- 
nvpublic
