From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] drm: Add NVIDIA Tegra20 support
Date: Sat, 10 Nov 2012 20:04:26 +0200
Message-ID: <509E972A.8020200@nvidia.com>
References: <1352469579-3337-1-git-send-email-thierry.reding@avionic-design.de> <1352469579-3337-2-git-send-email-thierry.reding@avionic-design.de> <CAF6AEGs4bk3umkbQmJmB+Gf4UctKWa2Rj9GEi=DZSqU8MUd+9w@mail.gmail.com> <20121109160002.GA6474@avionic-0098.mockup.avionic-design.de> <CAF6AEGu0j1E96tzsTcJ91-FdTekAoWL7w1GBadRQ7p2h0smVDA@mail.gmail.com> <20121109210334.GA9023@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121109210334.GA9023-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09.11.2012 23:03, Thierry Reding wrote:
> On Fri, Nov 09, 2012 at 10:26:27AM -0600, Rob Clark wrote:
>> hmm, are these values defined by the hw? They look like register 
>> offsets into the DC block? 
> I don't think they are defined by the hardware. From what I gather these
> can arbitrarily be assigned by software. If things actually work the way
> I think they do, then eventually these values could be allocated by the
> host1x_register_client() function and stored within the host1x_client
> structure, so that each HW block can program them into the corresponding
> register.
These are host1x sync points. Sync points are used to synchronize work 
between host1x, host1x client units (like DC, 2D, EPP, etc), and CPU. 
Tegra2 TRM now contains chapters for HOST1X, 2D and EPP, so it has some 
more details.

The assignment of sync points is a software policy. Depending on 
programming model of client unit, one or more sync points are used for 
each. For example, for each DC we have one sync point assigned to 
vblank, and one for each DC window. For 2D, we'd have one sync point, 
and a choice of using the same of different sync point for EPP.

We could either assign sync point registers by hard coding, or assign 
them dynamically one per client unit, and possibly an additional one 
depending on the programming model. Sync points are a scarce resource, 
so we've so far preferred to do static assignment to catch 
overallocation as early as possible.

Terje
