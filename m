From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 0/2] NVIDIA Tegra DRM driver
Date: Tue, 13 Nov 2012 10:43:21 -0700
Message-ID: <50A286B9.7050709@wwwdotorg.org>
References: <1352757358-14001-1-git-send-email-thierry.reding@avionic-design.de>
 <50A1918E.1000809@wwwdotorg.org>
 <20121113064748.GB31443@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121113064748.GB31443-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/12/2012 11:47 PM, Thierry Reding wrote:
> On Mon, Nov 12, 2012 at 05:17:18PM -0700, Stephen Warren wrote:
>> On 11/12/2012 02:55 PM, Thierry Reding wrote:
>>> This second version of this patch series addresses all the
>>> comments received so far. Most notably it takes advantage of
>>> the debugfs helpers provided by the DRM core. Oddly enough this
>>> actually increases the line count, but that's because the
>>> helpers don't fit with the subdevices approach as implemented
>>> by this driver. However some quick discussions with Rob Clark
>>> showed that Tegra DRM is not special in this respect but other
>>> drivers may need the same functionality. Eventually the
>>> debugfs code could be reworked on top of helpers that are
>>> better suited at the design of embedded, multi-device DRM
>>> drivers.
>>> 
>>> Other than that there is some removal of code that was actually
>>> supposed to go into a later patch because it has dependencies
>>> that haven't been merged yet and some moving around of #defines
>>> and the device tree bindings documentation. Finally the driver
>>> now uses the DRM core's drm_compat_ioctl() instead of a custom
>>> and unimplemented (!) version.
>> 
>> The series,
>> 
>> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> 
>> (on the Harmony board's HDMI output; I'll test other
>> boards/outputs later).
> 
> You also gave an Acked-by for the DT binding documentation in the
> first version of this patchset, does it apply to the rest of the
> patch as well? That is, can I add it to patch 1?

I didn't actually read the rest of the patch since there are many
people much more familiar with the host1x/... code that will provide
useful feedback.

However, yes, I think it's fine to include my ack in the patch - it's
common to ack only parts of patches I believe.
