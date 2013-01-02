From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC,libdrm 1/3] tegra: Add stream library
Date: Wed, 02 Jan 2013 14:53:21 +0800
Message-ID: <50E3D961.8060204@gmail.com>
References: <1355407268-32381-1-git-send-email-amerilainen@nvidia.com> <1355407268-32381-2-git-send-email-amerilainen@nvidia.com> <50DD407B.3030306@gmail.com> <50DD4E2C.2070104@nvidia.com> <20121228204847.GA4309@avionic-0098.adnet.avionic-design.de> <50E12F1A.3000803@nvidia.com> <50E39F2A.1000405@gmail.com> <50E3D45D.5050206@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50E3D45D.5050206-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Francis Hart <fhart-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/02/2013 02:31 PM, Terje Bergstr=F6m wrote:
> On 02.01.2013 04:44, Mark Zhang wrote:
>> Agree. If we are able to do something dynamically, normally that'll =
be
>> better.
>>
>> Terje, we can get the Tegra version in FUSE. I think we don't need t=
his
>> kind of try-catch logics.
>=20
> We'd need to have in user space a map of SoC version -> number of syn=
c
> points. As kernel already has this and checks for invalid fences, I
> don't think user space needs the same check.
>=20
> We're anyway talking about a possibility of coding error, nothing tha=
t
> can happen on properly working software, so I wouldn't want to add an=
y
> code that isn't absolutely necessary to catch that.
>

Ah, yes, my bad. It's libdrm, not host1x driver.

Mark
> Terje
>=20
