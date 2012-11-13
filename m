From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drm: Add NVIDIA Tegra20 support
Date: Tue, 13 Nov 2012 10:40:30 -0700
Message-ID: <50A2860E.1080108@wwwdotorg.org>
References: <1352757358-14001-1-git-send-email-thierry.reding@avionic-design.de> <1352757358-14001-2-git-send-email-thierry.reding@avionic-design.de> <50A1F3A3.40905@nvidia.com> <20121113074822.GA8409@avionic-0098.mockup.avionic-design.de> <50A20994.9000305@nvidia.com> <20121113093725.GB8122@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121113093725.GB8122-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/13/2012 02:37 AM, Thierry Reding wrote:
> On Tue, Nov 13, 2012 at 04:49:24PM +0800, Mark Zhang wrote:
>> On 11/13/2012 03:48 PM, Thierry Reding wrote:
>>> * PGP Signed by an unknown key
>>> 
>>> On Tue, Nov 13, 2012 at 03:15:47PM +0800, Mark Zhang wrote:
>>>> On 11/13/2012 05:55 AM, Thierry Reding wrote:
>>>>> This commit adds a KMS driver for the Tegra20 SoC. This
>>>>> includes basic support for host1x and the two display
>>>>> controllers found on the Tegra20 SoC. Each display
>>>>> controller can drive a separate RGB/LVDS output.

>>>>> diff --git a/drivers/gpu/drm/tegra/Kconfig
>>>>> b/drivers/gpu/drm/tegra/Kconfig new file mode 100644 index
>>>>> 0000000..be1daf7 --- /dev/null +++
>>>>> b/drivers/gpu/drm/tegra/Kconfig @@ -0,0 +1,23 @@ +config
>>>>> DRM_TEGRA +       tristate "NVIDIA Tegra DRM" +
>>>>> depends on DRM && OF && ARCH_TEGRA +       select
>>>>> DRM_KMS_HELPER +       select DRM_GEM_CMA_HELPER +
>>>>> select DRM_KMS_CMA_HELPER
>>>> 
>>>> Just for curious, according to my testing, why the
>>>> "CONFIG_CMA" is not enabled while DRM_GEM_CMA_HELPER &
>>>> DRM_KMS_CMA_HELPER are enabled here?
>>> 
>>> The reason is that CMA doesn't actually provide any API for
>>> drivers to use and in fact unless you use very large buffers
>>> you could indeed run this code on top of a non-CMA kernel and
>>> it will likely even work.
>>> 
>> 
>> Okay. But I think it's better to turn on CMA defaultly. During
>> my testing, it's hard to allocate more 2MB without CMA...
> 
> CMA is enabled by default in one of the Tegra default
> configuration patches in my tegra/next branch. I will submit that
> patch to Stephen when the 3.8 cycle starts, so that it'll be
> automatically enabled along with the DRM driver.
> 
> But I don't think it makes sense to couple it to the DRM_TEGRA
> symbol as it isn't strictly required.

OK, I guess that approach makes sense; most people will just use the
defconfig and hence get a useful kernel, while flexibility will not be
lost if someone really wants.

Note that I have less than 1 week left to apply patches for 3.8. I
hope that if tegradrm makes it into the drm tree for 3.8, so will the
defconfig and other enablement patches to activate it.
