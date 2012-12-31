From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC,libdrm 1/3] tegra: Add stream library
Date: Mon, 31 Dec 2012 08:22:18 +0200
Message-ID: <50E12F1A.3000803@nvidia.com>
References: <1355407268-32381-1-git-send-email-amerilainen@nvidia.com> <1355407268-32381-2-git-send-email-amerilainen@nvidia.com> <50DD407B.3030306@gmail.com> <50DD4E2C.2070104@nvidia.com> <20121228204847.GA4309@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121228204847.GA4309-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Francis Hart <fhart-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 28.12.2012 22:48, Thierry Reding wrote:
> I disagree. We shouldn't be hiding this kind of detail behind an #ifdef.
> Instead it should be detected at runtime. Otherwise you'll need to build
> different versions of libdrm for every generation of Tegra. That may be
> fine for NVIDIA provided BSPs, but distributions would have a very hard
> time dealing with that. What we want is software that works unmodified
> on as many generations of Tegra as possible.

I agree. The fences will be rejected by kernel and kernel knows about
number of sync points in each host1x revision. So, we could just submit
and look at return code.

Terje
