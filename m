From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 02/13] ARM: tegra: Enable LVDS and HDMI on Cardhu
Date: Wed, 16 Oct 2013 10:58:03 -0600
Message-ID: <525EC59B.9080807@wwwdotorg.org>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com> <1381850883-12722-3-git-send-email-treding@nvidia.com> <525DA807.4010500@wwwdotorg.org> <20131016110911.GH21963@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131016110911.GH21963-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/16/2013 05:09 AM, Thierry Reding wrote:
> On Tue, Oct 15, 2013 at 02:39:35PM -0600, Stephen Warren wrote:
>> On 10/15/2013 09:27 AM, Thierry Reding wrote:
>>> Add backlight and panel nodes for the Cardhu 10.1" WXGA TFT LCD panel
>>> and enable the HDMI output and hotplug detection.
>>>
>>> Note that HDMI doesn't work for some reason and I haven't found out why
>>> yet. I remember someone reporting that it worked at some point in time
>>> using this set of nodes but that no longer seems to be the case. Running
>>> the same kernel on Beaver has working HDMI, though.
>>
>> I'm hesitant to apply this, since we know HDMI doesn't work. Wouldn't it
>> be better to just enable the panel, and hold off on HDMI until we've
>> located the problem?
> 
> Okay, I'll split up the patch so that the LVDS part can be applied and
> we can hold off on the HDMI part until it's fixed.
> 
>> On the panel side, have the DT bindings been acked by both DT
>> maintainers and both bindings and driver by someone involved in CDF. I
>> worry that since the simple panel framework overlaps with CDF's goals,
>> that people will be upset if we create some alternative to it. Still,
>> there's a lot to be said for code that exists and works right now, so I
>> hope there won't be any issue here, but it'd be good to be sure.
> 
> I haven't received any response from any of the DT maintainers so far,
> even though the relevant patches had been posted to the devicetree
> mailing list some time ago. I also don't think that anyone from the CDF
> people has looked at the panel drivers so far. They must have seen the
> patches because at least some of them are subscribed to the dri-devel
> mailing list where the patches were posted.
> 
> I do have an IRC ACK from Dave Airlie to merge the DRM panel patches
> though the Tegra tree, though. Furthermore there was some serious
> pushback on the CDF patches from key DRM people in earlier discussions,
> so I don't think we'll be finding any common ground here anytime soon.
> That said it has been suggested that if CDF ever becomes a reality, a
> DRM panel driver could be written as glue between the CDF and DRM if
> that should ever prove to be valuable.
> 
> As for the bindings, I don't think the underlying kernel implementation
> should have any influence on it. Furthermore the bindings are trivially
> simple, so I really don't see how anybody could object. I mean, it's a
> compatible string, a power supply and an enable GPIO. There's nothing
> ground-breakingly new there.

Still, we do need DT maintainer ack to merge new bindings, and I really
do want explicit OK from people involved in CDF before applying
something that touches the same area.
