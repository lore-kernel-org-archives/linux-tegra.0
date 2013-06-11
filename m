From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: add support for runtime pm
Date: Tue, 11 Jun 2013 09:23:45 +0300
Message-ID: <51B6C271.2090001@nvidia.com>
References: <1369662568-22390-1-git-send-email-mkulkarni@nvidia.com> <20130527154539.GD9460@mithrandir> <51A4445F.1000201@nvidia.com> <20130528091022.GB10934@mithrandir> <51ADA837.4020907@nvidia.com> <20130610204316.GC26036@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130610204316.GC26036@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mayuresh Kulkarni <mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10.06.2013 23:43, Thierry Reding wrote:
> Can you post the corresponding wrappers to make it easier to discuss
> them? If they just wrap runtime PM calls then they don't solve the
> locality problems that Terje brought up.

I don't think the wrappers are applicable here. They're there in
downstream to fix a problem with runtime PM core: some host1x clients
require host1x to be active when they're processing, and some (dc) need
it only when CPU is programming DC or when a signal towards host1x is
pending. Runtime PM wants to keep parent enabled when any of the clients
are enabled.

We solved this downstream by enabling ignore_children for host1x. As a
side effect, we need to explicitly enable host1x when we're enabling one
of its clients that need host1x, and that's what the wrapper does.

We can fix this particular problem by moving calls to runtime PM to job.c.

Mayuresh, once you've managed to test your patches, please send the v2.

Terje
