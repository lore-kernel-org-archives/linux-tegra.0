From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Tue, 27 Nov 2012 08:32:38 +0000
Message-ID: <CAPM=9tysiK6LgnQdAwGSYfxnQfgcfRm0+X2tPSAEDxUPt-QZGA@mail.gmail.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	<1353935954-13763-9-git-send-email-tbergstrom@nvidia.com>
	<CAPM=9tzvt3J6D3zLPV97w629q62CNhAxX8V+_JZ6kmXxxz5fVg@mail.gmail.com>
	<50B46336.8030605@nvidia.com>
	<CAPM=9txCuPJcFAfD7Hu5o2BVFK=pVah7B8HhG0ctLCyFPwNEnA@mail.gmail.com>
	<50B476E1.4070403@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B476E1.4070403-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 27, 2012 at 8:16 AM, Terje Bergstr=F6m <tbergstrom@nvidia.c=
om> wrote:
> On 27.11.2012 09:33, Dave Airlie wrote:
>>> Third would be having a firewall in 2D driver checking the stream a=
nd
>>> ensuring all registers that accept addresses are written by values
>>> derived from dmabufs. I haven't tried implementing this, but it'd
>>> involve a lookup table in kernel and CPU reading through the comman=
d
>>> stream. Offsets and sizes would also need to be validated. There wo=
uld
>>> be a performance hit.
>>
>> This is the standard mechanism, and what exynos does as well.
>>
>> The per process VM method is also used as an extension to this on so=
me hw.
>
> Hi,
>
> Thanks for the pointer, I looked at exynos code. It indeed checks the
> registers written to, but it doesn't prevent overrun by checking size=
s
> of buffers and compare against requests.

They probably need to add that, its not as important as the base
addresses, unless it takes negative strides, generally base addresses
means you can target current->uid quite easily!

> Based on my experience with Tegra graphics stack, going through comma=
nd
> streams in kernel is bad for performance. For 2D operations this is
> probably ok as the command streams are pretty simple. Anything more
> complex is going to cause severe degradation of performance, but it's
> also outside the scope of this patch set.
>
> If this is the way to go, I'll put the firewall behind a Kconfig flag=
 so
> that system integrator can decide if his system needs it.

We don't generally make security like this optional :-)

If you do that you should restrict the drm device to root users only,
and never let a user with a browser anywhere near it.

Like I know what you guys get away with in closed source world, but
here we don't write root holes into our driver deliberately.

Dave.
