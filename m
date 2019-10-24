From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/3] drm/tegra: Fix 2d and 3d clients detaching from
 IOMMU domain
Date: Thu, 24 Oct 2019 16:28:41 +0300
Message-ID: <45926d95-3e7a-c56b-402a-2b2c6475c5db@gmail.com>
References: <20190623173743.24088-1-digetx@gmail.com>
 <20190623173743.24088-2-digetx@gmail.com> <20191024115804.GB2924027@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191024115804.GB2924027@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

24.10.2019 14:58, Thierry Reding пишет:
> On Sun, Jun 23, 2019 at 08:37:42PM +0300, Dmitry Osipenko wrote:
>> This should should fire up on the DRM's driver module re-loader because
>> there won't be enough available domains on older Tegra SoCs.
>>
>> Cc: stable <stable@vger.kernel.org>
>> Fixes: 0c407de5ed1a ("drm/tegra: Refactor IOMMU attach/detach")
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/gpu/drm/tegra/dc.c   | 4 ++--
>>  drivers/gpu/drm/tegra/drm.c  | 9 ++++++---
>>  drivers/gpu/drm/tegra/drm.h  | 3 ++-
>>  drivers/gpu/drm/tegra/gr2d.c | 4 ++--
>>  drivers/gpu/drm/tegra/gr3d.c | 4 ++--
>>  5 files changed, 14 insertions(+), 10 deletions(-)
> 
> I think I understand what this is trying to do, but the commit message
> does not help at all. So what's really going on here is that we need to
> detach the device from the group regardless of whether we're sharing the
> group or not, just like we attach groups to the shared domain whether
> they share the same group or not.

Yes, the commit's message could be improved.

> But in that case, I wonder if it's even worth splitting groups the way
> we are right now. Wouldn't it be better to just put all the devices into
> the same group and be done with it?
> 
> The current code gives me headaches every time I read it, so if we can
> just make it so that all the devices under the DRM device share the same
> group, this would become a lot easier to deal with. I'm not really
> convinced that it makes much sense to keep them on separate domains,
> especially given the constraints on the number of domains available on
> earlier Tegra devices.
> 
> Note that sharing a group will also make it much easier for these to use
> the DMA API if it is backed by an IOMMU.

Probably I'm blanking on everything about IOMMU now.. could you please
remind me what "IOMMU group" is?

Isn't it that each IOMMU group relates to the HW ID (SWGROUP)? But then
each display controller has its own SWGROUP.. and thus that sharing just
doesn't make any sense, hm.

> Let me see if I can throw something together to that effect.
