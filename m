From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Wed, 28 Nov 2012 09:00:54 +1000
Message-ID: <CAPM=9tz=_0Drx3=Me3EQdPgBvYVGzs6Gnqaw6RBaTLsCG24RAg@mail.gmail.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	<1353935954-13763-9-git-send-email-tbergstrom@nvidia.com>
	<CAPM=9tzvt3J6D3zLPV97w629q62CNhAxX8V+_JZ6kmXxxz5fVg@mail.gmail.com>
	<50B46336.8030605@nvidia.com>
	<CAPM=9txCuPJcFAfD7Hu5o2BVFK=pVah7B8HhG0ctLCyFPwNEnA@mail.gmail.com>
	<50B476E1.4070403@nvidia.com>
	<CAPM=9tysiK6LgnQdAwGSYfxnQfgcfRm0+X2tPSAEDxUPt-QZGA@mail.gmail.com>
	<50B47DA8.60609@nvidia.com>
	<1354011776.1479.31.camel@tellur>
	<20121127103739.GA3329@avionic-0098.adnet.avionic-design.de>
	<50B4A483.8030305@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B4A483.8030305-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 27, 2012 at 9:31 PM, Terje Bergstr=F6m <tbergstrom@nvidia.c=
om> wrote:
> On 27.11.2012 12:37, Thierry Reding wrote:
>> But in that case it should be made mandatory at first until proper I=
OMMU
>> support is enabled on Tegra30. Then it can be checked at driver prob=
e
>> time whether or not to enable the extra checks. That way we don't ne=
ed a
>> special Kconfig option and we still get all the security that we nee=
d,
>> right?
>
> I guess it depends on the level of security.
>
> If we want to only protect kernel and user space memory, this would b=
e
> sufficient and no firewall is needed if IOMMU is turned on.
>
> If we want to protect 2D buffers from each other, this is not suffici=
ent.

We  generally aim for the first, to stop the gpu from reading/writing
any memory it hasn't been granted access to,
the second is nice to have though, but really requires a GPU with VM
to implement properly.

Dave.
