From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/3] gpu: host1x: Remove implicit IOMMU backing on
 client's registration
Date: Thu, 24 Oct 2019 20:15:07 +0300
Message-ID: <7d3b1e99-4c57-d6db-36dd-d0a840ead440@gmail.com>
References: <20190623173743.24088-1-digetx@gmail.com>
 <20191024115016.GA2924027@ulmo>
 <55ab29ad-da9b-c178-4480-dc6edb09b3e4@gmail.com>
 <20191024134756.GC2924027@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191024134756.GC2924027@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

24.10.2019 16:47, Thierry Reding пишет:
> On Thu, Oct 24, 2019 at 04:35:13PM +0300, Dmitry Osipenko wrote:
>> 24.10.2019 14:50, Thierry Reding пишет:
>>> On Sun, Jun 23, 2019 at 08:37:41PM +0300, Dmitry Osipenko wrote:
>>>> On ARM32 we don't want any of the clients device to be backed by the
>>>> implicit domain, simply because we can't afford such a waste on older
>>>> Tegra SoCs that have very few domains available in total. The recent IOMMU
>>>> support addition for the Video Decoder hardware uncovered the problem
>>>> that an unfortunate drivers probe order results in the DRM driver probe
>>>> failure if CONFIG_ARM_DMA_USE_IOMMU=y due to a shortage of IOMMU domains
>>>> caused by the implicit backing. The host1x_client_register() is a common
>>>> function that is invoked by all of the relevant DRM drivers during theirs
>>>> probe and hence it is convenient to remove the implicit backing there,
>>>> resolving the problem.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/gpu/host1x/bus.c | 19 +++++++++++++++++++
>>>>  1 file changed, 19 insertions(+)
>>>
>>> I don't really want to do this in a central place like this. If we
>>> really do need this, why can't we do it in the individual drivers?
>>
>> Why do you want to duplicate the same action for each driver instead of
>> doing it in a single common place?
> 
> I don't mind doing it in a common place in particular, I just don't want
> to do this within the host1x bus infrastructure. This is really a policy
> decision that should be up to drivers. Consider the case where we had a
> different host1x driver (for V4L2 for example) that would actually want
> to use the DMA API. In that case we may want to detach in the DRM driver
> but not the V4L2 driver.

Okay.
