From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] drm/tegra: Changes for v4.16-rc1
Date: Mon, 8 Jan 2018 20:27:56 +0300
Message-ID: <7439ccb8-2e0c-b474-7a00-d4f7be18a0e7@gmail.com>
References: <20180105141726.29713-1-thierry.reding@gmail.com>
 <558f572b-8174-c8ee-3ff8-79e591c0648d@gmail.com>
 <20180108074250.GA10590@ulmo>
 <a3ee43a4-8c7a-9c6f-b5fa-ea66657c4ab8@gmail.com> <20180108154738.GA3324@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180108154738.GA3324@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08.01.2018 18:47, Thierry Reding wrote:
> On Mon, Jan 08, 2018 at 04:47:32PM +0300, Dmitry Osipenko wrote:
>> On 08.01.2018 10:42, Thierry Reding wrote:
>>> On Fri, Jan 05, 2018 at 05:58:17PM +0300, Dmitry Osipenko wrote:
>>>> On 05.01.2018 17:17, Thierry Reding wrote:
>>>>> Hi Dave,
>>>>>
>>>>> The following changes since commit 9428088c90b6f7d5edd2a1b0d742c75339b36f6e:
>>>>>
>>>>>   drm/qxl: reapply cursor after resetting primary (2017-12-08 13:37:02 +1000)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>   git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.16-rc1
>>>>>
>>>>> for you to fetch changes up to ebae8d07435ae91314f4a28d69b530d09c625815:
>>>>>
>>>>>   drm/tegra: dc: Implement legacy blending (2017-12-21 14:55:55 +0100)
>>>>>
>>>>> Thanks,
>>>>> Thierry
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> drm/tegra: Changes for v4.16-rc1
>>>>>
>>>>> The bulk of these changes are preparation work and addition of support
>>>>> for Tegra186. Currently only HDMI output (the primary output on Jetson
>>>>> TX2) is supported, but the hardware is also capable of doing DSI and
>>>>> DisplayPort.
>>>>>
>>>>> Tegra DRM now also uses the atomic commit helpers instead of the open-
>>>>> coded variant that was only doing half its job. As a bit of a byproduct
>>>>> of the Tegra186 support the driver also gained HDMI 2.0 as well as zpos
>>>>> property support.
>>>>>
>>>>> Along the way there are also a few patches to clean up a few things and
>>>>> fix minor issues.
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> Arnd Bergmann (2):
>>>>>       drm/tegra: Mark Tegra186 display hub PM functions __maybe_unused
>>>>>       drm/tegra: Fix non-debugfs builds
>>>>>
>>>>> Dmitry Osipenko (3):
>>>>>       drm/tegra: dc: Link DC1 to DC0 on Tegra20
>>>>>       drm/tegra: gem: Correct iommu_map_sg() error checking
>>>>>       drm/tegra: Correct timeout in tegra_syncpt_wait
>>>>>
>>>>> Thierry Reding (43):
>>>>>       drm/fourcc: Fix fourcc_mod_code() definition
>>>>>       drm/tegra: Sanitize format modifiers
>>>>>       gpu: host1x: Rewrite conditional for better readability
>>>>>       gpu: host1x: Cleanup on initialization failure
>>>>>       dt-bindings: display: tegra: Update SOR for Tegra186
>>>>>       drm/tegra: dc: Move register definitions into a table
>>>>>       drm/tegra: dsi: Move register definitions into a table
>>>>>       drm/tegra: hdmi: Move register definitions into a table
>>>>>       drm/tegra: sor: Move register definitions into a table
>>>>>       drm/tegra: dc: Reshuffle some code
>>>>>       drm/tegra: dc: Register debugfs in ->late_register()
>>>>>       drm/tegra: dsi: Register debugfs in ->late_register()
>>>>>       drm/tegra: hdmi: Register debugfs in ->late_register()
>>>>>       drm/tegra: sor: Root debugfs files at the connector
>>>>>       drm/tegra: sor: Register debugfs in ->late_register()
>>>>>       drm/tegra: Do not wrap lines unnecessarily
>>>>>       drm/tegra: vic: Properly align arguments
>>>>>       drm/tegra: dc: Support background color
>>>>>       drm/tegra: Use atomic commit helpers
>>>>>       drm/tegra: Remove custom page-flip handler
>>>>>       drm/tegra: dc: Remove tegra_primary_plane_destroy()
>>>>>       drm/tegra: dc: Remove duplicate plane funcs
>>>>>       drm/tegra: dc: Remove tegra_overlay_plane_destroy()
>>>>>       drm/tegra: dc: Remove duplicate plane funcs
>>>>>       drm/tegra: dc: Move state definition to header
>>>>>       drm/tegra: Move common plane code to separate file
>>>>>       drm/tegra: Add Tegra186 display hub support
>>>>>       drm/tegra: dc: Add Tegra186 support
>>>>>       drm/tegra: Support ARGB and ABGR formats
>>>>>       drm/tegra: sor: Parameterize register offsets
>>>>>       drm/tegra: sor: Add Tegra186 support
>>>>>       drm/tegra: sor: Support HDMI 2.0 modes
>>>>>       drm/tegra: dpaux: Implement runtime PM
>>>>>       drm/tegra: dpaux: Add Tegra186 support
>>>>>       drm/tegra: fb: Force alpha formats
>>>>>       drm/tegra: dc: Support more formats
>>>>>       drm/tegra: dc: Use direct offset to plane registers
>>>>>       drm/tegra: dc: Remove redundant spinlock
>>>>>       drm/tegra: Implement zpos property
>>>>>       gpu: host1x: Use IOMMU groups
>>>>>       drm/tegra: Use IOMMU groups
>>>>>       drm/tegra: dpaux: Keep reset defaults for hybrid pad parameters
>>>>
>>>>
>>>>>       drm/tegra: dc: Implement legacy blending
>>>>
>>>> Please hold on this patch. First of all it doesn't work correctly, see my last
>>>> reply to the patch. Secondly, it introduces bug that breaks YUV plane.
>>>
>>> I thought we had already concluded that this version doesn't cause any
>>> regressions. And since this is new functionality I'm not too worried if
>>> it doesn't work in all cases, we've got plenty of time to fix those up.
>>
>> My expectation was that you'll update the patch. I'm not sure why you'd want to
>> go with something half-working while there is already a version of the patch
>> that works correctly (or at least better), but of course it's up to you to decide.
> 
> The patch that you had proposed had some rough corners that I wasn't
> happy about, though I don't think I ever properly reviewed it. The
> bottom line is that I wanted to avoid writing window registers in the
> ->atomic_flush() callback and the patch was encoding the plane Z-order
> in a very fixed way. Granted, that's still true for the variant included
> in this pull request, but in my opinion it paves the way to add proper
> zpos property support.

Would be awesome if you could review the patch properly and give a concrete
suggestions. I know that writing blend config on CRTC flush feels a bit icky and
I'm open for suggestions, but meanwhile it does the right thing.

I think Z-order could be implemented quite easily based on the fixed-order patch
that I proposed. Would be easier to implement it once we will have a proper test
cases.

> Also, I seem to remember getting different test results than you, so,
> again, I think we need to nail this down using proper test cases to make
> sure we're testing the same things (and with the added bonus that we can
> use them for regression testing). I'll set aside some time over the next
> few days to write up these tests.

I don't recall anything other than the blend test crashing on T20, I've looked
at the issue since then and it is just a trivial KMS test bug.

I'm not sure how to automate the regression testing, somehow you'd have to get
the result of the displayed stuff. I don't think you can do it on Tegra, at
least on older ones. But maybe we can semi-automate the testing by first
displaying the planes blending done on HW and then show the expected result
drawn in software, so you'd have something to compare with.

We would also need a test case with a moving planes.

Feel free to ping me once you'll have something to try out or will need some help.

>> If you'll decide to change your mind, feel free to cherry-pick and squash the
>> patch-fix [0] which also contains the fix for the YUV and adds missed ARGB4444
>> format.
> 
> We can't easily support the ARGB4444 format in the same way as the
> others because there is no equivalent opaque format. We could possible
> do this if we converted between opaque and alpha formats via the DRM
> formats rather than the Tegra native formats, but that would be a bit
> too much churn at this point. Let's revisit that for v4.17.

Okay, tegra_plane_format_has_alpha() tells that ARGB4444 is format without
'alpha', that confuses me. Would be nice if you could adjust the code to avoid
that confusion, maybe rename function to tegra_plane_format_non_native() or
something like that.

>>> As for the YUV plane bug, can you point me at a test case, or describe
>>> what exactly you're trying to do so that I can reproduce and fix it?
>>
>> Video displaying with libvdpau-tegra is broken. Your fix for the YUV is correct.
>>
>>> I'd like to make forward progress on this rather than hold back on
>>> patches out of fear that they may break existing functionality. In order
>>> to do that we need tests that can be run to validate existing
>>> functionality.
>>
>> Unfortunately there is another problem that this patch uncovered. The
>> kms-planes-blend hangs my T30 which has a bit different display configuration
>> compared to T20 (it lacks HDMI). The fix [1] is quite simple, you may
>> cherry-pick the patch and include it in the pull-request if it's fine to do so
>> and if the patch looks okay, alternatively I can send the patch to the ML a bit
>> later today.
> 
> I've picked up some bits from the fix into two separate patches. I think
> setting the possible_crtcs mask to 0 for primary and cursor planes is
> not correct. It looks as if this might work now because of the leases
> code, but I'd like to be explicit in the driver and specify the correct
> mask from the start. Otherwise we start relying on the leases code to do
> the right thing and errors may creep back in if that part of the code
> ever changes.

Either way is fine to me.

> I also picked up the plane cleanup fix from your patch, though I had to
> modify it a little to make sure we don't create additional planes on
> Tegra186 and later (essentially kept the tegra_dc_add_planes() function
> but rolled in your fixes into that instead). Also I took care of the XXX
> tegra_plane_destroy() TODO while at it.

Ok.

> I've uploaded all of the changes to the drm/tegra/for-next branch,
> though I didn't squash anything in yet to leave the branch intact for
> the pull request.

I've tested the patches, everything works correctly.
