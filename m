From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC,libdrm 1/3] tegra: Add stream library
Date: Wed, 02 Jan 2013 10:44:58 +0800
Message-ID: <50E39F2A.1000405@gmail.com>
References: <1355407268-32381-1-git-send-email-amerilainen@nvidia.com> <1355407268-32381-2-git-send-email-amerilainen@nvidia.com> <50DD407B.3030306@gmail.com> <50DD4E2C.2070104@nvidia.com> <20121228204847.GA4309@avionic-0098.adnet.avionic-design.de> <50E12F1A.3000803@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50E12F1A.3000803-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Francis Hart <fhart-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/31/2012 02:22 PM, Terje Bergstr=F6m wrote:
> On 28.12.2012 22:48, Thierry Reding wrote:
>> I disagree. We shouldn't be hiding this kind of detail behind an #if=
def.
>> Instead it should be detected at runtime. Otherwise you'll need to b=
uild
>> different versions of libdrm for every generation of Tegra. That may=
 be
>> fine for NVIDIA provided BSPs, but distributions would have a very h=
ard
>> time dealing with that. What we want is software that works unmodifi=
ed
>> on as many generations of Tegra as possible.
>=20
> I agree. The fences will be rejected by kernel and kernel knows about
> number of sync points in each host1x revision. So, we could just subm=
it
> and look at return code.
>

Agree. If we are able to do something dynamically, normally that'll be
better.

Terje, we can get the Tegra version in FUSE. I think we don't need this
kind of try-catch logics.

Mark
> Terje
>=20
