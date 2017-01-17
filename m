From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH v2 0/7] Host1x IOMMU support + VIC support
Date: Tue, 17 Jan 2017 18:22:36 +0200
Message-ID: <2456cb5a-846f-7296-e229-cfaac6caa899@kapsi.fi>
References: <20161214111617.24548-1-mperttunen@nvidia.com>
 <20161214123004.urnvlqarcnp5rp4a@phenom.ffwll.local>
 <07daf863-1675-a3d8-e1a7-32131c8035d8@kapsi.fi>
 <20161214130545.gfpkosyixr5lfkkf@phenom.ffwll.local>
 <f3d1d69b-2c1f-a0f7-8301-fee26cec35f1@kapsi.fi>
 <20161214141142.jmrofknylonhprbk@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161214141142.jmrofknylonhprbk-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/14/2016 04:11 PM, Daniel Vetter wrote:
> On Wed, Dec 14, 2016 at 03:32:16PM +0200, Mikko Perttunen wrote:
>> On 14.12.2016 15:05, Daniel Vetter wrote:
>>> On Wed, Dec 14, 2016 at 02:41:28PM +0200, Mikko Perttunen wrote:
>>>> On 14.12.2016 14:30, Daniel Vetter wrote:
>>>>> On Wed, Dec 14, 2016 at 01:16:10PM +0200, Mikko Perttunen wrote:
>>>>>> This series adds IOMMU support to Host1x and TegraDRM
>>>>>> and adds support for the VIC (Video Image Compositor)
>>>>>> host1x client. The series is available as a git repository at
>>>>>> git://github.com/cyndis/linux.git; branch vic-2.
>>>>>>
>>>>>> A userspace test case for VIC can be found at
>>>>>> https://github.com/cyndis/drm/tree/work/tegra.
>>>>>> The testcase is in tests/tegra and is called submit_vic.
>>>>>> The testcase/TRM include full headers and documentation
>>>>>> to program the unit. The unit by itself, however, does not
>>>>>> readily map to existing userspace library interfaces, so
>>>>>> implementations for those are not provided.
>>>>>
>>>>> Afaik libva has an entire pile of post-processing support. Pretty sure
>>>>> other video transcode libraries have similar interfaces, so should all be
>>>>> possible to implement this.
>>>>
>>>> We don't have any actual video transcoding support though, so unless it's
>>>> possible to just implement a part of libva and defer the rest to some CPU
>>>> implementation, I don't see how this is useful. I suppose I could implement
>>>> a GStreamer plugin for colorspace conversion or resizing, since those are
>>>> very modular.
>>>
>>> Hm, I guess the question then is, how did that get enabled?
>>
>> What is "that"? I'm not exactly sure.
>>
>> Our architecture is such that there's the VIC that handles colorspace
>> conversion, rescaling, blitting and can do some 2d postprocessing effects as
>> well.
>>
>> Then there's the separate NVDEC that is a video bitstream decoder. There's
>> no support for that at the moment. I am working on the IP side of that.
>>
>> The video processing pipeline is then such that NVDEC is fed the bitstream;
>> NVDEC outputs a YUV picture in a specific format; VIC takes that YUV picture
>> and converts/rescales it into the desired format. Or if we are encoding
>> video, VIC takes your RGB image, converts it into a format that NVENC
>> understands, and so on.
>>
>> So with just VIC support, I could implement some simple 2D things. I don't
>> know if anyone would want to specifically use the VIC for those since
>> applications already have fast CPU algorithms. For the video pipeline using
>> VIC is nice since these units can synchronize work without CPU involvement
>> and when you're already using NVDEC or NVENC it's barely any extra effort to
>> involve VIC as well. It can also be useful in power usage sensitive
>> situations, but we aren't really fit for those situations with the upstream
>> kernel anyway :)
>
> Ah I thought the nvdec was already enabled, since for i915 that's how we
> went about things (we have a pretty much exactly matching split in the
> various video related engines). But if that's not there yet then no
> worries, all fine.
>
> Since you do seem to plan to enable everything anyway, might be worth it
> to go directly with something like libva or libvdpau or whatever the cool
> thing is. libva is my recommendation since it works on non-X11 too afaik,
> but I have 0 clue. And might be worth it to check out whether you can't do
> a super-basic libva driver that only does the post processing stuff. With
> libva you can import/export images, so it might be possible even ... And
> directly doing the full video engine support instead of a one-off in
> gstreamer sounds more sensible to me.
> -Daniel
>

It took a while, but I now have a libva backend to go with this kernel 
driver: https://github.com/cyndis/vaapi-tegra-driver.

It is far from complete, but the libva putsurface testcase runs and its 
output looks correct when compared to the intel backend. Would this be 
suitable or should something more be implemented before merging the 
kernel driver?

Thanks,
Mikko.
