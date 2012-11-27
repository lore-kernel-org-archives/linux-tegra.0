From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Tue, 27 Nov 2012 10:45:28 +0200
Message-ID: <50B47DA8.60609@nvidia.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-9-git-send-email-tbergstrom@nvidia.com> <CAPM=9tzvt3J6D3zLPV97w629q62CNhAxX8V+_JZ6kmXxxz5fVg@mail.gmail.com> <50B46336.8030605@nvidia.com> <CAPM=9txCuPJcFAfD7Hu5o2BVFK=pVah7B8HhG0ctLCyFPwNEnA@mail.gmail.com> <50B476E1.4070403@nvidia.com> <CAPM=9tysiK6LgnQdAwGSYfxnQfgcfRm0+X2tPSAEDxUPt-QZGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPM=9tysiK6LgnQdAwGSYfxnQfgcfRm0+X2tPSAEDxUPt-QZGA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 27.11.2012 10:32, Dave Airlie wrote:
> On Tue, Nov 27, 2012 at 8:16 AM, Terje Bergstr=F6m <tbergstrom@nvidia=
=2Ecom> wrote:
>> Thanks for the pointer, I looked at exynos code. It indeed checks th=
e
>> registers written to, but it doesn't prevent overrun by checking siz=
es
>> of buffers and compare against requests.
> They probably need to add that, its not as important as the base
> addresses, unless it takes negative strides, generally base addresses
> means you can target current->uid quite easily!

Ok. We'll implement the firewall, unless we come up with even a better
choice.

>> If this is the way to go, I'll put the firewall behind a Kconfig fla=
g so
>> that system integrator can decide if his system needs it.
> We don't generally make security like this optional :-)
>=20
> If you do that you should restrict the drm device to root users only,
> and never let a user with a browser anywhere near it.

My thinking was that the system integrator can decide how much he trust=
s
the binaries (incl. browser plugins) in the system. If he trusts the
binaries, the firewall can be turned off.

> Like I know what you guys get away with in closed source world, but
> here we don't write root holes into our driver deliberately.

Duly noted. :-)

Terje
