From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Wed, 12 Dec 2012 18:56:05 +0200
Message-ID: <50C8B725.3050602@nvidia.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-7-git-send-email-tbergstrom@nvidia.com> <20121205083335.GA20984@avionic-0098.adnet.avionic-design.de> <50BF1DAA.8030805@nvidia.com> <20121205111332.GA25676@avionic-0098.adnet.avionic-design.de> <50BF345A.8050201@nvidia.com> <20121205120429.GA29943@avionic-0098.adnet.avionic-design.de> <50C5CAB5.3040000@nvidia.com> <20121212160829.GA30278@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121212160829.GA30278-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12.12.2012 18:08, Thierry Reding wrote:
> I've briefly discussed this with Stephen on IRC because I thought I had
> remembered him objecting to the idea of adding a dummy device just for
> this purpose. It turns out, however, that what he didn't like was to add
> a dummy node to the DT just to make this happen, but he has no (strong)
> objections to a dummy platform device.
> 
> While I'm not very happy about that solution, I've been going over it
> for a week now and haven't come up with any better alternative that
> doesn't have its own disadvantages. So perhaps we should go ahead and
> implement that. For the host1x driver this really just means creating a
> platform device and adding it to the system, with some of the fields
> tweaked to make things work.

This sounds ok. Considering that the DRM driver is a virtual driver,
attaching it to a virtual device sounds ok -- ish.

> Is this something that you can take care of in your patch series? I
> could also implement this on top of the current driver and then all your
> patch series would have to do is remove host1x.c from tegra-drm and
> instantiate the platform device itself.

We're about to post patches for both host1x driver and libdrm. This is
the last big rock unturned, so let me take a stab at this first. I'd
like to get the updated patches out tomorrow or on Friday, so I'll try
to either get it done for that or leave it to the TODO list.

Terje
